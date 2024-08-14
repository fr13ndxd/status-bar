use log::log;
use log::Level;
use serde::{Deserialize, Serialize};
use std::path::Path;
use std::path::PathBuf;
use utils::*;

#[derive(Debug, Serialize, Deserialize)]
struct Bar {
    position: String,
}

#[derive(Debug, Serialize, Deserialize)]
struct Config {
    bar: Bar,
}

pub fn load_config() {
    let cfg_dir = format!("{:?}", config()).replace("\"", "");
    let cfg_file = format!("{:?}", config().join("config.json")).replace("\"", "");
    log!(Level::Info, "using config file: {}", cfg_file.clone());

    ensure_directory(&cfg_dir);

    println!("{}", std::fs::read_to_string(&cfg_file).unwrap());

    let cfg: Config =
        serde_json::from_str(std::fs::read_to_string(&cfg_file).unwrap().as_str()).unwrap();
    let position = cfg.bar.position.to_string();
    unsafe {
        utils::vars::BAR_POSITION = Some(position.clone());
    }

    println!("position = {}", position.clone());

    utils::file_changed(cfg_dir, move || unsafe {
        let cfg: Config =
            serde_json::from_str(std::fs::read_to_string(&cfg_file).unwrap().as_str()).unwrap();
        let position = cfg.bar.position.to_string();
        utils::vars::BAR_POSITION = Some(position.clone());
        println!("position changed = {}", position.clone());
    });
}

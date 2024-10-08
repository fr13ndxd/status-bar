use std::io::Write;

use log::log;
use log::Level;
use serde::{Deserialize, Serialize};
use utils::{variable::Var, *};

#[derive(Debug, Serialize, Deserialize)]
struct Bar {
    position: String,
}

#[derive(Debug, Serialize, Deserialize)]
struct Config {
    bar: Bar,
    time_format: String,
}

pub fn load_config() {
    let cfg_dir = format!("{:?}", config()).replace("\"", "");
    let cfg_file = format!("{:?}", config().join("config.json")).replace("\"", "");
    log!(Level::Info, "using config file: {}", cfg_file.clone());

    ensure_directory(&cfg_dir);
    if !std::fs::File::open(cfg_file.clone()).is_ok() {
        let mut file = std::fs::File::create(cfg_file.clone()).unwrap();
        let _ = file
            .write(r#"{ "bar": {"position": "top"}, "time_format": "%H:%M - %A %e." }"#.as_bytes());
    }

    let cfg: Config =
        serde_json::from_str(std::fs::read_to_string(&cfg_file).unwrap().as_str()).unwrap();

    let (mut bar_position, mut time_format) = (
        utils::vars::BAR_POSITION.lock().unwrap(),
        utils::vars::TIME_FORMAT.lock().unwrap(),
    );
    bar_position.set(cfg.bar.position);
    time_format.set(cfg.time_format);
    drop((bar_position, time_format));

    utils::file_changed(cfg_dir, move || {
        let cfg: Config =
            serde_json::from_str(std::fs::read_to_string(&cfg_file).unwrap().as_str()).unwrap();

        let (mut bar_position, mut time_format) = (
            utils::vars::BAR_POSITION.lock().unwrap(),
            utils::vars::TIME_FORMAT.lock().unwrap(),
        );
        bar_position.set(cfg.bar.position.clone());
        time_format.set(cfg.time_format.clone());
        drop((bar_position, time_format));

        log!(Level::Trace, "Config changed: {:#?}", &cfg);
    });
}

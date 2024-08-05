use crate::options;
use core::str;
use log::{log, Level};
use notify::{RecursiveMode, Result, Watcher};
use std::{path::Path, process::Command};

pub fn exec(cmd: &str, args: Vec<&str>) -> String {
    let c = Command::new(cmd).args(args).output().unwrap().stdout;
    let res = String::from_utf8_lossy(&c);

    res.to_string()
}

pub fn current_date() -> String {
    let format = options::TIME_FORMAT;
    let now = gtk4::glib::DateTime::now_local();
    let time = now.unwrap().format(format).unwrap();

    time.to_string()
}

pub fn watch_css() -> Result<()> {
    // Automatically select the best implementation for your platform.
    let mut watcher = notify::recommended_watcher(|res| match res {
        Ok(event) => println!("event: {:?}", event),
        Err(e) => println!("watch error: {:?}", e),
    })?;

    watcher.watch(Path::new(options::CSS_DIRECTORY), RecursiveMode::Recursive)?;

    Ok(())
}

pub fn ensure_directory(path: &str) {
    if !std::path::Path::new(path).exists() {
        std::fs::create_dir_all(path).unwrap();
    }
}

pub fn load_css() {
    let provider = gtk4::CssProvider::new();
    let output_css = "/tmp/status-bar/";
    let output_file_css = "/tmp/status-bar/style.css";

    ensure_directory(output_css);

    let scss = exec("dart-sass", vec![&options::CSS_DIRECTORY, output_file_css]);
    if scss.contains("Warning") {
        println!("{}", scss);
    }

    let css = std::fs::read_to_string(output_file_css).expect("Failed to read CSS file");
    provider.load_from_data(&css);

    gtk4::style_context_add_provider_for_display(
        &gtk4::gdk::Display::default().expect("Could not connect to a display."),
        &provider,
        gtk4::STYLE_PROVIDER_PRIORITY_USER,
    );

    _ = watch_css();

    log!(Level::Info, "using scss file: {}", options::CSS_DIRECTORY);
}

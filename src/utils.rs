use crate::options;
use notify::{RecursiveMode, Result, Watcher};
use std::path::Path;

pub fn current_date() -> String {
    let format = "%H:%M - %A %e.";
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

pub fn load_css() {
    let provider = gtk4::CssProvider::new();
    let output_css = "/tmp/status-bar/";
    let output_file_css = "/tmp/status-bar/style.css";

    println!("INFO: using scss file: {}", options::CSS_DIRECTORY);

    if !std::path::Path::new(output_css).exists() {
        std::fs::create_dir(output_css).unwrap();
    }

    std::process::Command::new("sassc")
        .arg(&options::CSS_DIRECTORY)
        .arg(&output_file_css)
        .status()
        .expect("Failed to run sassc");

    let css = std::fs::read_to_string(output_file_css).expect("Failed to read CSS file");
    provider.load_from_data(&css);

    gtk4::style_context_add_provider_for_display(
        &gtk4::gdk::Display::default().expect("Could not connect to a display."),
        &provider,
        gtk4::STYLE_PROVIDER_PRIORITY_USER,
    );

    _ = watch_css();
}

use crate::options;
use notify::{RecursiveMode, Result, Watcher};
use std::path::Path;

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
    let output_css = "style.css";

    println!("INFO: using scss file: {}", options::CSS_DIRECTORY);

    std::process::Command::new("sassc")
        .arg(&options::CSS_DIRECTORY)
        .arg(&output_css)
        .status()
        .expect("Failed to run sassc");

    let css = std::fs::read_to_string(output_css).expect("Failed to read CSS file");
    provider.load_from_data(&css);

    gtk4::style_context_add_provider_for_display(
        &gtk4::gdk::Display::default().expect("Could not connect to a display."),
        &provider,
        gtk4::STYLE_PROVIDER_PRIORITY_USER,
    );

    _ = watch_css();
}

use gtk4::gdk::Display;
use gtk4::style_context_add_provider_for_display;
use gtk4::STYLE_PROVIDER_PRIORITY_USER;
use std::fs::read_to_string;
use utils::{ensure_directory, exec};

pub fn load_css() {
    let provider = gtk4::CssProvider::new();
    let output_css = "/tmp/status-bar/";
    let output_file_css = "/tmp/status-bar/style.css";

    ensure_directory(output_css);

    let scss = exec(
        "dart-sass",
        vec![
            &"/home/fr13nd/Desktop/status-bar/style/main.scss",
            output_file_css,
        ],
    );
    if scss.contains("Warning") {
        println!("{}", scss);
    }

    let css = read_to_string(output_file_css).expect("Failed to read CSS file");
    provider.load_from_data(&css);

    style_context_add_provider_for_display(
        &Display::default().expect("Could not connect to a display."),
        &provider,
        STYLE_PROVIDER_PRIORITY_USER,
    );
}

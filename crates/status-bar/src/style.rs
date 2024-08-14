use gtk4::gdk::Display;
use gtk4::style_context_add_provider_for_display;
use gtk4::CssProvider;
use gtk4::STYLE_PROVIDER_PRIORITY_USER;
use std::fs::read_to_string;
use utils::file_changed;
use utils::{ensure_directory, exec};

static mut PROVIDER: Option<CssProvider> = None;

pub fn load_css() {
    let output_css = "/tmp/status-bar/";
    let output_file_css = "/tmp/status-bar/style.css";

    ensure_directory(output_css);
    let display = Display::default().expect("can't get display");

    file_changed(
        "/home/fr13nd/Desktop/status-bar/style".to_string(),
        move || {
            unsafe {
                if let Some(ref provider) = PROVIDER {
                    gtk4::style_context_remove_provider_for_display(&display, provider);
                }
            }
            let provider = CssProvider::new();

            let scss = exec(
                "dart-sass",
                vec![
                    &"/home/fr13nd/Desktop/status-bar/style/main.scss",
                    output_file_css,
                ],
            );
            if scss.to_ascii_lowercase().contains("warning") {
                println!("{}", scss);
            }

            let css = read_to_string(output_file_css).expect("Failed to read CSS file");
            provider.load_from_data(css.as_str());

            style_context_add_provider_for_display(
                &display,
                &provider,
                STYLE_PROVIDER_PRIORITY_USER,
            );

            unsafe {
                PROVIDER = Some(provider);
            }
        },
    );
}

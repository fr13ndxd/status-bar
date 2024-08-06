use crate::options;
use notify::{RecursiveMode, Watcher};
use notify_debouncer_full::new_debouncer;
use notify_debouncer_full::DebounceEventResult;
use std::{path::Path, process::Command};
use tokio::time::Duration;

#[macro_export]
macro_rules! id_to_i32 {
    ($workspace:expr) => {
        match $workspace {
            WorkspaceType::Regular(s) => s.parse::<i32>().ok(),
            _ => None,
        }
    };
}

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

pub fn watch_css() {
    let (tx, mut rx) = tokio::sync::watch::channel(());
    tokio::spawn(async move {
        tx.send(()).unwrap();
        let mut debouncer = new_debouncer(
            Duration::from_millis(20),
            None,
            move |result: DebounceEventResult| match result {
                Ok(_) => tx.send(()).unwrap(),
                Err(_) => (),
            },
        )
        .unwrap();

        let _ = debouncer
            .watcher()
            .watch(Path::new(options::CSS_DIR), RecursiveMode::Recursive);

        loop {}
    });

    gtk4::gio::glib::MainContext::default().spawn_local(async move {
        loop {
            let _ = rx.changed().await;
            println!("css changed");
            load_css();
        }
    });
}

pub fn ensure_directory(path: &str) {
    if !std::path::Path::new(path).exists() {
        std::fs::create_dir_all(path).unwrap();
    }
}

pub fn load_css() {
    gtk4::gio::glib::MainContext::default().spawn_local(async move {
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
    });
}

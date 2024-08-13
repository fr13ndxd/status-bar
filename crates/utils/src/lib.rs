use gtk4::prelude::WidgetExt;
use hyprland::shared::WorkspaceType;
use notify::Watcher;
use std::path::Path;
use std::{path::PathBuf, process::Command, time::Duration};

pub fn current_date() -> String {
    let format = "%H:%M - %A %e.";
    let now = gtk4::glib::DateTime::now_local();
    let time = now.unwrap().format(format).unwrap();

    time.to_string()
}

pub fn temp_dir() -> PathBuf {
    gtk4::glib::tmp_dir().join(gtk4::glib::application_name().unwrap())
}

pub fn id_to_i32(id: WorkspaceType) -> i32 {
    match id {
        hyprland::shared::WorkspaceType::Regular(s) => {
            s.parse().expect("failed to convert workspace id to i32")
        }
        _ => 0,
    }
}

pub trait WidgetOptions {
    fn toggle_classname(&self, class_name: &str, enable: bool);
}

impl<T: WidgetExt> WidgetOptions for T {
    fn toggle_classname(&self, class_name: &str, enable: bool) {
        if enable {
            self.add_css_class(class_name);
        } else {
            self.remove_css_class(class_name);
        }
    }
}

pub fn ensure_directory(path: &str) {
    if !std::path::Path::new(path).exists() {
        std::fs::create_dir_all(path).unwrap();
    }
}

pub fn exec(cmd: &str, args: Vec<&str>) -> String {
    let c = Command::new(cmd).args(args).output().unwrap().stdout;
    let res = String::from_utf8_lossy(&c);

    res.to_string()
}

pub fn file_changed<F>(file: String, callback: F)
where
    F: Fn() + 'static,
{
    let (tx, rx) = std::sync::mpsc::channel();

    std::thread::spawn(move || {
        use notify_debouncer_full::{new_debouncer, DebounceEventResult};
        tx.send(()).unwrap();

        let mut debouncer = new_debouncer(
            Duration::from_millis(200),
            None,
            move |result: DebounceEventResult| {
                if result.is_ok() {
                    tx.send(()).unwrap();
                }
            },
        )
        .unwrap();

        debouncer
            .watcher()
            .watch(Path::new(&file), notify::RecursiveMode::Recursive)
            .unwrap();

        loop {
            std::thread::sleep(Duration::from_millis(1));
        }
    });

    gtk4::glib::source::idle_add_local(move || {
        std::thread::sleep(std::time::Duration::from_millis(1));
        if rx.try_recv().is_ok() {
            callback();
        }
        gtk4::glib::ControlFlow::Continue
    });
}

pub fn dirs_changed<F>(dirs: Vec<String>, callback: F)
where
    F: Fn() + 'static,
{
    let (tx, rx) = std::sync::mpsc::channel();

    std::thread::spawn(move || {
        use notify_debouncer_full::{new_debouncer, DebounceEventResult};
        tx.send(()).unwrap();

        let mut debouncer = new_debouncer(
            Duration::from_millis(200),
            None,
            move |result: DebounceEventResult| {
                if result.is_ok() {
                    tx.send(()).unwrap()
                }
            },
        )
        .unwrap();

        for dir in dirs {
            debouncer
                .watcher()
                .watch(Path::new(&dir), notify::RecursiveMode::NonRecursive)
                .unwrap();
        }

        loop {
            std::thread::sleep(Duration::from_millis(1));
        }
    });

    gtk4::glib::source::idle_add_local(move || {
        std::thread::sleep(std::time::Duration::from_millis(1));
        if rx.try_recv().is_ok() {
            callback();
        }
        gtk4::glib::ControlFlow::Continue
    });
}

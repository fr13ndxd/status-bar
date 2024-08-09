use gtk4::prelude::WidgetExt;
use hyprland::shared::WorkspaceType;
use std::process::Command;

pub fn id_to_i32(id: WorkspaceType) -> i32 {
    match id {
        hyprland::shared::WorkspaceType::Regular(s) => s
            .parse()
            .ok()
            .expect("failed to convert workspace id to i32"),
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

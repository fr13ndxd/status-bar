use gtk4::glib;
use gtk4::glib::clone;
use gtk4::prelude::*;
use gtk4::Orientation;
use gtk4::{Box, Button, Label};

pub fn workspaces() -> gtk4::Box {
    let hbox = Box::new(Orientation::Horizontal, 0);
    hbox.set_hexpand(false);
    hbox.set_vexpand(false);
    hbox.add_css_class("workspaces");

    for i in 1..=7 {
        let str_i = i.to_string();
        let workspace_button = Button::with_label(&str_i);
        workspace_button.add_css_class("workspace-buttons");

        workspace_button.connect_clicked(move |_| {
            std::process::Command::new("hyprctl")
                .args(["dispatch", "workspace", str_i.as_str()])
                .spawn()
                .expect("Failed to switch workspaces");
        });

        hbox.append(&workspace_button);
    }

    hbox
}

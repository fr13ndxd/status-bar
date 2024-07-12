use gtk4::gio;
use gtk4::prelude::*;
use gtk4::Orientation;
use gtk4::{Box, Label};
use hyprland::shared::HyprData;
use hyprland::shared::HyprDataActive;
use tokio::sync::watch;

pub fn workspaces() -> gtk4::Box {
    let (tx, mut rx) = watch::channel(hyprland::data::Workspace::get_active());
    tokio::spawn(async move {
        let mut last_active_workspace = hyprland::data::Workspace::get_active().unwrap();
        loop {
            let active_workspace = hyprland::data::Workspace::get_active().unwrap();
            if active_workspace != last_active_workspace {
                let _ = tx.send(Ok(active_workspace.clone()));
                last_active_workspace = active_workspace;
            }
            tokio::time::sleep(tokio::time::Duration::from_millis(100)).await;
        }
    });

    let hbox = Box::new(Orientation::Horizontal, 5);
    hbox.set_hexpand(false);
    hbox.set_vexpand(false);
    hbox.add_css_class("workspaces");
    let mut w_labels: Vec<gtk4::Label> = Vec::new();

    for i in 1..=7 {
        let str_i = i.to_string();
        let w_label = Label::new(Some(&str_i.as_str()));

        hbox.append(&w_label);
        w_labels.push(w_label);
    }

    let update_workspaces = move || {
        //let workspaces = hyprland::data::Workspaces::get().unwrap();
        let workspaces = hyprland::data::Workspaces::get().unwrap();

        for (i, label) in w_labels.iter().enumerate() {
            let mut class_name = "";
            match hyprland::data::Workspace::get_active() {
                Ok(active_workspace) => {
                    // Subtract 1 from the workspace ID to get the correct index
                    if active_workspace.id == (i as i32 + 1) {
                        class_name = "active";
                    } else if workspaces
                        .iter()
                        .any(|ws| ws.id == (i as i32 + 1) && ws.windows > 0)
                    {
                        class_name = "occupied";
                    }
                }
                Err(e) => {
                    eprintln!("Error getting active workspace: {:?}", e);
                }
            }
            label.set_css_classes(&[class_name, "w_label"]);
        }
    };

    update_workspaces();
    gio::glib::MainContext::default().spawn_local(async move {
        loop {
            let _ = rx.changed().await;
            update_workspaces();
        }
    });

    hbox
}

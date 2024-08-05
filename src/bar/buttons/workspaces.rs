use fgl::widgets::WidgetOptions;
use gtk4::gio;
use gtk4::prelude::*;
use gtk4::Box;
use gtk4::Orientation;
use hyprland::shared::HyprData;
use hyprland::shared::HyprDataActive;
use tokio::sync::watch;

pub fn workspaces() -> gtk4::Box {
    let (tx, mut rx) = watch::channel(hyprland::data::Workspace::get_active().unwrap().id);
    tokio::spawn(async move {
        let mut last_active_workspace = hyprland::data::Workspace::get_active().unwrap().id;
        let _ = tx.send(last_active_workspace.clone());
        loop {
            let active_workspace = hyprland::data::Workspace::get_active().unwrap().id;
            if active_workspace != last_active_workspace {
                let _ = tx.send(active_workspace.clone());
                last_active_workspace = active_workspace;
            }
            tokio::time::sleep(tokio::time::Duration::from_millis(100)).await;
        }
    });

    let hbox = Box::new(Orientation::Horizontal, 5);
    hbox.add_css_class("workspaces");
    let w_labels: Vec<gtk4::Label> = (1..=7)
        .map(|_| {
            let label = gtk4::Label::new(None);
            label.set_vexpand(true);
            label.set_valign(gtk4::Align::Center);

            hbox.append(&label);
            label.add_css_class("w_label");
            label
        })
        .collect();

    let update_workspaces = move || {
        let workspaces = hyprland::data::Workspaces::get().unwrap();
        let active_workspace = hyprland::data::Workspace::get_active().unwrap().id;

        for (i, label) in w_labels.iter().enumerate() {
            let is_active = active_workspace == (i as i32 + 1);
            let is_occupied = workspaces
                .iter()
                .any(|ws| ws.id == (i as i32 + 1) && ws.windows > 0);

            label.toggle_classname("active", is_active);
            label.toggle_classname("occupied", !is_active && is_occupied);
        }
    };

    gio::glib::MainContext::default().spawn_local(async move {
        loop {
            let _ = rx.changed().await;
            update_workspaces();
        }
    });

    hbox
}

use gtk4::prelude::*;
use gtk4::Orientation;
use gtk4::{Box, Label};
use hyprland::data::Workspace;
use hyprland::data::Workspaces;
use hyprland::event_listener::EventListener;
use hyprland::shared::HyprDataActive;
use std::sync::mpsc;

use hyprland::shared::{HyprData, WorkspaceType};

use utils::*;

fn update_workspaces(id: i32, labels: &Vec<Label>) {
    let workspaces = Workspaces::get().unwrap();

    for (i, label) in labels.iter().enumerate() {
        let i = i as i32 + 1;
        let occupied = id != i && workspaces.iter().any(|ws| ws.id == i && ws.windows > 0);
        let active = id == i && !occupied;

        label.toggle_classname("active", active);
        label.toggle_classname("occupied", occupied);
    }
}

pub fn workspaces() -> gtk4::Box {
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

    let (tx, rx) = mpsc::channel();

    std::thread::spawn(move || {
        let mut listener = EventListener::new();
        fn handle_id(id: WorkspaceType) -> i32 {
            match id {
                WorkspaceType::Regular(s) => s.parse().ok().unwrap(),
                _ => 0,
            }
        }
        listener.add_workspace_change_handler(move |id| {
            tx.send(handle_id(id)).unwrap();
        });
        listener.start_listener().unwrap();
    });

    update_workspaces(Workspace::get_active().unwrap().id, &w_labels);
    gtk4::glib::source::idle_add_local(move || {
        std::thread::sleep(std::time::Duration::from_millis(1));
        if let Ok(test) = rx.try_recv() {
            update_workspaces(test, &w_labels);
        }
        gtk4::glib::ControlFlow::Continue
    });

    hbox
}

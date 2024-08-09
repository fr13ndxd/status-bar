use gtk4::prelude::*;
use gtk4::{glib::MainContext, Orientation};
use gtk4::{Box, Label};
use hyprland::data::{Workspace, Workspaces};
use hyprland::event_listener::EventListener;
use hyprland::shared::{HyprData, HyprDataActive};
use utils::*;

fn update_workspaces(id: i32, labels: &Vec<Label>) {
    let workspaces = Workspaces::get().unwrap();

    for (i, label) in labels.iter().enumerate() {
        let is_active = id == (i as i32 + 1);
        let is_occupied = workspaces
            .iter()
            .any(|ws| ws.id == (i as i32 + 1) && ws.windows > 0);

        label.toggle_classname("active", is_active);
        label.toggle_classname("occupied", !is_active && is_occupied);
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

    MainContext::default().spawn_local(async {
        let id = Workspace::get_active().unwrap().id;
        update_workspaces(id, &w_labels);

        let mut event_listener = EventListener::new();
        event_listener.add_workspace_change_handler(move |id| {
            update_workspaces(id_to_i32(id), &w_labels);
        });
        event_listener.start_listener_async().await.unwrap();
    });

    hbox
}

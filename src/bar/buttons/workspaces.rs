use crate::id_to_i32;
use crate::utils;
use fgl::widgets::WidgetOptions;
use gtk4::gio;
use gtk4::prelude::*;
use gtk4::Box;
use gtk4::Label;
use gtk4::Orientation;
use hyprland::event_listener::EventListener;
use hyprland::shared::HyprData;
use hyprland::shared::HyprDataActive;
use hyprland::shared::*;
use tokio::sync::watch;

fn update_workspaces(id: i32, wlabels: &Vec<Label>) {
    let workspaces = hyprland::data::Workspaces::get().unwrap();

    for (i, label) in wlabels.iter().enumerate() {
        let is_active = id as i32 == (i as i32 + 1);
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

    gio::glib::MainContext::default().spawn_local(async move {
        let mut event_listener = EventListener::new();

        let id = hyprland::data::Workspace::get_active().unwrap().id;
        update_workspaces(id, &w_labels);
        event_listener.add_workspace_change_handler(move |id| {
            let id = id_to_i32!(id).unwrap();
            update_workspaces(id, &w_labels);
        });
        event_listener.start_listener_async().await.unwrap();
    });

    hbox
}

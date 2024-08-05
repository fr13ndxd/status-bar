use fgl::widgets::label::LabelOptions;
use gtk4::prelude::*;
use gtk4::Label;
use gtk4::Orientation;
use hyprland::data::Client;
use hyprland::shared::HyprDataActiveOptional;

fn get_active_app() -> String {
    match Client::get_active().ok().flatten() {
        Some(client) => client
            .class
            .split('\0')
            .next()
            .unwrap_or(&client.class)
            .to_string(),
        None => "Hyprland Desktop".to_string(),
    }
}

pub fn active_app() -> gtk4::Box {
    let hbox = gtk4::Box::new(Orientation::Horizontal, 0);
    hbox.add_css_class("active-apps");

    let active_app_label = Label::new(None);
    active_app_label.add_css_class("active-app-label");
    active_app_label.watch(100, || get_active_app());

    hbox.append(&active_app_label);
    hbox
}

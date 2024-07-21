use fgl::label::LabelOptions;
use gtk4::prelude::*;
use gtk4::Label;
use gtk4::Orientation;
use hyprland::data::Client;
use hyprland::shared::HyprDataActiveOptional;

fn get_active_app() -> String {
    let active = Client::get_active().ok().flatten();

    if let Some(client) = active {
        if let Some(index) = client.class.find('\0') {
            client.class[0..index].to_string()
        } else {
            client.class.to_string()
        }
    } else {
        String::from("Hyprland Desktop")
    }
}

pub fn active_app() -> gtk4::Box {
    let hbox = gtk4::Box::new(Orientation::Horizontal, 0);
    hbox.add_css_class("active-apps");

    let active_app_label = Label::new(None);

    active_app_label.watch(|| get_active_app());

    active_app_label.add_css_class("active-app-label");
    hbox.append(&active_app_label);

    hbox
}

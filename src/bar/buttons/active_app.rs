use fgl::widgets::label::LabelOptions;
use gtk4::prelude::*;
use gtk4::Label;
use gtk4::Orientation;
use hyprland::data::Client;
use hyprland::event_listener::EventListener;
use hyprland::shared::HyprDataActiveOptional;

fn get_active_app() -> String {
    match Client::get_active().ok().flatten() {
        Some(client) => client
            .class
            .split('\0')
            .next()
            .unwrap_or(&client.class)
            .to_string(),
        None => "Desktop".to_string(),
    }
}

pub fn active_app() -> gtk4::Box {
    let hbox = gtk4::Box::new(Orientation::Horizontal, 0);
    hbox.add_css_class("active-apps");

    let active_app_label = Label::new(Some(&get_active_app().as_str()));
    active_app_label.add_css_class("active-app-label");
    hbox.append(&active_app_label.clone());

    gtk4::gio::glib::MainContext::default().spawn_local(async move {
        let mut event_listener = EventListener::new();

        event_listener.add_active_window_change_handler(move |data| {
            let app = data.unwrap().window_class;
            active_app_label.set_label(app.as_str());
        });

        event_listener.start_listener_async().await.unwrap();
    });

    hbox
}

use gtk4::glib;
use gtk4::prelude::*;
use gtk4::Box;
use gtk4::Label;
use gtk4::Orientation::*;
use hyprland::data::Client;
use hyprland::event_listener::EventListener;
use hyprland::shared::HyprDataActiveOptional;
use std::sync::mpsc;

#[allow(dead_code)]
pub fn active_app() -> gtk4::Box {
    let hbox = Box::new(Horizontal, 0);
    hbox.add_css_class("active-app-box");

    let activeapp_label = Label::new(Some(&Client::get_active().unwrap().unwrap().title));
    activeapp_label.add_css_class("activeapp-label");
    hbox.append(&activeapp_label.clone());

    let (tx, rx) = mpsc::channel();

    std::thread::spawn(move || {
        let mut listener = EventListener::new();
        listener.add_active_window_change_handler(move |data| {
            tx.send(data.unwrap().window_class).unwrap();
        });
        listener.start_listener().unwrap();
    });

    gtk4::glib::source::idle_add_local(move || {
        std::thread::sleep(std::time::Duration::from_millis(1));
        if let Ok(test) = rx.try_recv() {
            activeapp_label.set_label(test.as_str());
        }
        glib::ControlFlow::Continue
    });

    hbox
}

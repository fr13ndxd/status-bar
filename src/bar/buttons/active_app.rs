use gtk4::gio;
use gtk4::prelude::*;
use gtk4::Label;
use gtk4::Orientation;
use hyprland::data::Client;
use hyprland::shared::HyprDataActiveOptional;
use hyprland::shared::HyprError;
use serde_json::Value;
use tokio::sync::watch;

fn get_active_app() -> String {
    match Client::get_active() {
        Ok(Some(active_client)) => active_client.class.clone(),
        Ok(None) => String::new(),
        Err(_) => String::new(),
    }
}

pub fn active_app() -> gtk4::Box {
    let hbox = gtk4::Box::new(Orientation::Horizontal, 0);
    hbox.add_css_class("active-apps");
    let (tx, mut rx) = watch::channel(hyprland::data::Client::get_active());

    let active_app_label = Label::new(Some(get_active_app().as_str()));
    active_app_label.add_css_class("active-app-label");
    hbox.append(&active_app_label);

    tokio::spawn(async move {
        let mut last_active_app = get_active_app();
        loop {
            let active_app = get_active_app();
            if active_app != last_active_app {
                let x = hyprland::data::Client::get_active().unwrap();
                let _ = tx.send(Ok(x.clone()));
                last_active_app = active_app;
            }
            tokio::time::sleep(tokio::time::Duration::from_millis(100)).await;
        }
    });

    gio::glib::MainContext::default().spawn_local(async move {
        loop {
            let _ = rx.changed().await;
            let active_app = get_active_app();
            active_app_label.set_label(active_app.as_str());
        }
    });

    hbox
}

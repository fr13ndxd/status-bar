use gtk4::glib;
use gtk4::prelude::*;
use gtk4::Orientation::*;
use gtk4::{Box, Button};
use std::sync::mpsc;
use std::thread;
use std::time::Duration;
use utils::*;

pub fn datemenu() -> Box {
    let hbox = Box::new(Horizontal, 0);
    let btn = Button::new();
    btn.add_css_class("datemenu-button");
    hbox.append(&btn);
    let (tx, rx) = mpsc::channel();

    thread::spawn(move || loop {
        tx.send(current_date());
        thread::sleep(Duration::from_secs(59));
    });

    glib::source::idle_add_local(move || {
        if let Ok(res) = rx.try_recv() {
            btn.set_label(&res);
        }
        gtk4::glib::ControlFlow::Continue
    });

    hbox
}

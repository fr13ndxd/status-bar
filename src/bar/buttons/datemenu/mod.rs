use gtk4::prelude::*;
use gtk4::{prelude::*, Label, Orientation, Revealer};
use gtk4_layer_shell::{Edge, LayerShell};

use crate::popup_window::popup_revealer;

pub fn datemenu() -> gtk4::Window {
    let window_content = gtk4::Box::new(gtk4::Orientation::Vertical, 5);
    window_content.append(&gtk4::Label::new(Some("Hello, World!")));

    let popup_window = popup_revealer(
        "Datemenu",
        "slide_left",
        &window_content.upcast::<gtk4::Widget>(),
    );

    popup_window
}

pub fn datemenu_button() -> gtk4::Box {
    let btn = gtk4::Button::new();
    btn.set_label("label");
    let datemenu_window = datemenu();

    btn.connect_clicked(move |_| {
        if !datemenu_window.is_visible() {
            datemenu_window.show();
        } else {
            datemenu_window.hide();
        }
    });

    let hbox = gtk4::Box::new(gtk4::Orientation::Horizontal, 0);
    hbox.append(&btn);
    hbox
}

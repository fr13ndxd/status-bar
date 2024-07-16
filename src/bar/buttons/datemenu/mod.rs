use gtk4::{prelude::*, Label, Orientation, Revealer};
use gtk4::{prelude::*, RevealerTransitionType};
use gtk4_layer_shell::{Edge, KeyboardMode, LayerShell};

use crate::popup_window::{self, popup_revealer};

pub fn datemenu() -> (gtk4::Window, gtk4::Revealer) {
    let hbox = gtk4::Box::new(Orientation::Horizontal, 5);
    hbox.add_css_class("datemenu_box");

    let (window, revealer) = popup_revealer("datemenu", hbox);

    (window, revealer)
}

pub fn datemenu_button() -> gtk4::Box {
    let btn = gtk4::Button::new();
    btn.set_label("label");
    let (datemenu_window, datemenu_revealer) = datemenu();

    btn.connect_clicked(move |_| {
        let is_visible = datemenu_window.is_visible();
        if is_visible {
            datemenu_window.hide();
            datemenu_revealer.set_reveal_child(false);
        } else {
            datemenu_window.show();
            datemenu_revealer.set_reveal_child(true);
        }
    });

    let hbox = gtk4::Box::new(gtk4::Orientation::Horizontal, 0);
    hbox.append(&btn);
    hbox
}

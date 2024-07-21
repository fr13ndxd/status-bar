use crate::utils::current_date;
use fgl::button::ButtonOptions;
use gtk4::{prelude::*, Orientation};

use crate::popup_window::popup_window;

pub fn datemenu(btn: gtk4::Button) -> gtk4::Popover {
    let calendar = gtk4::Calendar::new();

    let hbox = gtk4::Box::new(Orientation::Horizontal, 5);
    hbox.add_css_class("datemenu_content");
    hbox.append(&calendar);

    popup_window(hbox, "datemenu", btn)
}

pub fn datemenu_button() -> gtk4::Box {
    let btn = gtk4::Button::new();
    btn.add_css_class("datemenu_button");
    btn.watch(|| current_date());
    let popover = datemenu(btn.clone());

    btn.connect_clicked(move |_| {
        popover.popup();
    });

    let hbox = gtk4::Box::new(gtk4::Orientation::Horizontal, 0);
    hbox.append(&btn);
    hbox
}

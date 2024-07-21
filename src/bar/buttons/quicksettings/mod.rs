use gtk4::{prelude::*, Orientation};

mod quicksettings;
use quicksettings::quicksettings;
mod systemindicators;
use systemindicators::systemindicators;

pub fn quicksettings_button() -> gtk4::Box {
    let btn = gtk4::Button::new();
    btn.add_css_class("quicksettings_button");

    let _hbox = gtk4::Box::new(Orientation::Horizontal, 0);
    let popover = quicksettings(btn.clone());

    btn.set_child(Some(&systemindicators()));

    btn.connect_clicked(move |_| {
        popover.popup();
    });

    let hbox = gtk4::Box::new(gtk4::Orientation::Horizontal, 0);
    hbox.append(&btn);
    hbox
}

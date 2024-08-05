use gtk4::{prelude::*, Orientation};
use gtk4::{Box, Button};

mod quicksettings;
use quicksettings::quicksettings;
mod systemindicators;
use systemindicators::systemindicators;

pub fn quicksettings_button() -> gtk4::Box {
    let btn = Button::new();
    btn.add_css_class("quicksettings_button");
    btn.set_child(Some(&systemindicators()));

    let popover = quicksettings(btn.clone());

    btn.connect_clicked(move |_| {
        popover.popup();
    });

    let hbox = Box::new(Orientation::Horizontal, 0);
    hbox.append(&btn);

    hbox
}

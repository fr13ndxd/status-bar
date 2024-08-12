use gtk4::prelude::*;
use gtk4::Orientation::*;
use gtk4::{Box, Button, Popover};
use header::header;

mod header;

pub fn popup_window(content: Box, classname: &str, parent: Button) -> gtk4::Popover {
    let popover = gtk4::Popover::new();
    popover.add_css_class(classname);
    popover.set_parent(&parent);

    popover.set_can_focus(true);

    let popover_ptr: *const Popover = popover.as_ref() as *const _;
    println!("{:?}", popover_ptr);

    popover.set_has_arrow(false);
    popover.set_child(Some(&content));

    popover
}

pub fn quicksettings(btn: Button) -> Popover {
    let hbox = Box::new(Vertical, 0);
    hbox.set_hexpand(true);
    hbox.set_vexpand(true);
    hbox.add_css_class("quicksettings");

    hbox.append(&header());

    popup_window(hbox, "quicksettings-popover", btn)
}

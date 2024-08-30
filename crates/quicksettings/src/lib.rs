use gtk4::prelude::*;
use gtk4::Orientation::*;
use gtk4::{Box, Button, Popover};
use header::header;
use log::{log, Level};
use sliders::sliders;
mod header;
mod sliders;

pub fn popup_window(content: Box, classname: &str, parent: Button) -> gtk4::Popover {
    let popover = gtk4::Popover::new();
    popover.add_css_class(classname);
    popover.set_parent(&parent);

    let popover_ptr: *const Popover = popover.as_ref() as *const _;
    log!(Level::Trace, "quicksettings popover: {:?}", popover_ptr);

    popover.set_has_arrow(false);
    popover.set_child(Some(&content));

    popover
}

pub fn quicksettings(btn: Button) -> Popover {
    let vbox = Box::new(Vertical, 0);
    vbox.set_hexpand(true);
    vbox.set_vexpand(true);
    vbox.add_css_class("quicksettings");

    vbox.append(&header());
    vbox.append(&sliders());

    popup_window(vbox, "quicksettings-popover", btn)
}

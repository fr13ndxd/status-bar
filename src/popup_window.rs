use gtk4::prelude::*;
use gtk4::{Box, Button};

pub fn popup_window(content: Box, classname: &str, parent: Button) -> gtk4::Popover {
    let popover = gtk4::Popover::new();
    popover.add_css_class(classname);
    popover.set_parent(&parent);
    popover.set_has_arrow(false);
    popover.set_child(Some(&content));

    popover
}

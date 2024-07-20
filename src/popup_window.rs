use gtk4::glib::translate::ToGlibPtr;
use gtk4::{gdk, glib, Button};
use gtk4::{prelude::*, Align};
use gtk4::{Box, Orientation, Revealer, RevealerTransitionType, Widget, Window};
use gtk4_layer_shell::{Edge, KeyboardMode, LayerShell};

pub fn popup_window(content: Box, classname: &str, parent: Button) -> gtk4::Popover {
    let popover = gtk4::Popover::new();
    popover.add_css_class(classname);
    popover.set_parent(&parent);
    popover.set_has_arrow(false);
    popover.set_child(Some(&content));

    popover
}

use gtk4::prelude::*;
use gtk4::Orientation;

use crate::popup_window::popup_window;
pub mod cpu;

pub fn indcators_win(btn: gtk4::Button) -> gtk4::Popover {
    let hbox = gtk4::Box::new(Orientation::Vertical, 5);
    hbox.add_css_class("indicators_content");

    hbox.append(&cpu::cpu_temp_box());

    popup_window(hbox, "indicators", btn)
}

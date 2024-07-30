use crate::popup_window::popup_window;
use gtk4::prelude::{BoxExt, WidgetExt};
use gtk4::Orientation;
use header::header;
use sliders::sliders;

mod header;
mod sliders;

pub fn quicksettings(btn: gtk4::Button) -> gtk4::Popover {
    let hbox = gtk4::Box::new(Orientation::Vertical, 5);
    hbox.add_css_class("quicksettings");
    hbox.append(&header());
    hbox.append(&sliders());

    popup_window(hbox, "quicksettings_window", btn)
}

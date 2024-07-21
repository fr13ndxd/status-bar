use crate::popup_window::popup_window;
use gtk4::prelude::{BoxExt, WidgetExt};
use gtk4::Orientation;
use header::header;

mod header;

pub fn quicksettings(btn: gtk4::Button) -> gtk4::Popover {
    let hbox = gtk4::Box::new(Orientation::Horizontal, 5);
    hbox.add_css_class("quicksettings_content");
    hbox.append(&header());

    popup_window(hbox, "quicksettings", btn)
}

use gtk4::prelude::*;
use gtk4::Box;
use gtk4::Orientation;

fn settings_button() -> gtk4::Button {
    let btn = gtk4::Button::new();
    btn.set_hexpand(true);
    btn.set_halign(gtk4::Align::End);
    btn.set_css_classes(&["header_button", "settings_button"]);
    btn.set_icon_name("org.gnome.Settings-symbolic");
    btn.connect_clicked(|_| {
        // TODO: make settings btn run settings
    });

    btn
}

pub fn header() -> gtk4::Box {
    let header = Box::new(Orientation::Vertical, 0);

    header.append(&settings_button());

    header
}

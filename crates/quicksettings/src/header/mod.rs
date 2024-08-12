use gtk4::prelude::*;
use gtk4::Align::*;
use gtk4::Box;
use gtk4::Button;
use gtk4::Orientation::*;

fn settings_button() -> Button {
    let btn = Button::new();
    btn.set_css_classes(&["header-button", "settings-button"]);
    btn.set_hexpand(true);
    btn.set_halign(End);
    btn.connect_clicked(|_| {
        println!("TODO: make it open settings app");
    });

    btn.set_icon_name("org.gnome.Settings-system-symbolic");
    btn
}

pub fn header() -> Box {
    let hbox = Box::new(Horizontal, 0);

    hbox.append(&settings_button());

    hbox
}

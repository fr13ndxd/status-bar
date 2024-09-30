use gtk4::prelude::*;
use gtk4::Align::*;
use gtk4::Box;
use gtk4::Button;
use gtk4::Orientation::*;

fn powermenu_button() -> Button {
    let btn = Button::new();
    btn.set_css_classes(&["header-button", "powermenu-button"]);
    btn.set_hexpand(true);
    btn.set_halign(End);
    btn.connect_clicked(|_| {
        // TODO: make powermenu window
        println!("TODO: make powermenu btn show powermenu");
    });

    btn
}

fn settings_button() -> Button {
    let btn = Button::new();
    btn.set_css_classes(&["header-button", "settings-button"]);
    btn.set_hexpand(true);
    btn.set_halign(End);
    btn.connect_clicked(|_| {
        // TODO: make settings app
        println!("TODO: make settings btn show settings");
    });

    btn.set_icon_name("org.gnome.Settings-system-symbolic");
    btn
}

pub fn header() -> Box {
    let hbox = Box::new(Horizontal, 0);

    hbox.append(&settings_button());
    hbox.append(&powermenu_button());

    hbox
}

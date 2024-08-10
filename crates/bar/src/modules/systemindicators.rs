use gtk4::prelude::*;
use gtk4::Box;
use gtk4::Button;
use gtk4::Image;
use gtk4::Orientation::*;
use services::network_changed;

fn network_indicator() -> gtk4::Box {
    let icon = Image::new();

    let hbox = Box::new(Horizontal, 0);
    hbox.append(&icon);
    network_changed(move |props| {
        icon.set_icon_name(Some(props.icon.as_str()));
    });

    hbox
}

pub fn indicators() -> Button {
    let btn = Button::new();
    btn.add_css_class("indicators");

    let hbox = Box::new(Horizontal, 0);
    hbox.append(&network_indicator());

    btn.set_child(Some(&hbox));

    btn
}

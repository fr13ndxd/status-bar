use fgl::services::audio;
use fgl::services::battery;
use fgl::services::network;
use fgl::widgets::icon::IconOptions;
use fgl::widgets::label::LabelOptions;
use gtk4::prelude::*;
use gtk4::Box;
use gtk4::Orientation;

fn sound_indicator() -> gtk4::Image {
    let icon = gtk4::Image::new();

    icon.watch(300, || audio::get_audio_icon());

    icon
}

fn network_indicator() -> gtk4::Image {
    let icon = gtk4::Image::new();

    icon.watch(300, || network::get_icon_name());

    icon
}

fn battery_indicator() -> gtk4::Box {
    let hbox = Box::new(Orientation::Horizontal, 2);

    let icon = gtk4::Image::new();
    icon.watch(300, || battery::get_battery_icon());
    hbox.append(&icon);

    let percent_l = gtk4::Label::new(None);
    percent_l.watch(1000, || battery::get_battery_capacity().to_string());

    hbox
}

pub fn systemindicators() -> gtk4::Box {
    let hbox = Box::new(Orientation::Horizontal, 5);

    hbox.append(&network_indicator());
    hbox.append(&sound_indicator());
    hbox.append(&battery_indicator());

    hbox
}

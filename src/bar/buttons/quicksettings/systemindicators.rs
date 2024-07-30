use fgl::services::audio;
use fgl::widgets::icon::IconOptions;
use gtk4::prelude::*;
use gtk4::Box;
use gtk4::{IconSize, Orientation};

use fgl::services::network;

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

pub fn systemindicators() -> gtk4::Box {
    let hbox = Box::new(Orientation::Horizontal, 5);

    hbox.append(&network_indicator());
    hbox.append(&sound_indicator());

    hbox
}

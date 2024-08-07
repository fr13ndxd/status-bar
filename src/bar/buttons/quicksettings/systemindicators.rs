use fgl::services::{audio, network};
use fgl::services::{battery::battery_icon_changed, battery::battery_percent_changed};
use fgl::widgets::icon::IconOptions;
use gtk4::prelude::*;
use gtk4::Box;
use gtk4::Image;
use gtk4::Orientation;

fn create_icon_indicator<F>(update_fn: F) -> gtk4::Image
where
    F: Fn() -> String + Send + Sync + 'static,
{
    let icon = Image::new();
    icon.watch(300, move || update_fn());
    icon
}

fn battery_indicator() -> gtk4::Box {
    let hbox = Box::new(Orientation::Horizontal, 2);

    let icon = gtk4::Image::new();
    let percent_l = gtk4::Label::new(None);

    hbox.append(&icon);
    hbox.append(&percent_l);

    battery_icon_changed(move |icon_name| {
        icon.set_icon_name(Some(&icon_name));
    });

    battery_percent_changed(move |percent| {
        let percent = format!("{}%", percent);
        percent_l.set_label(percent.as_str());
    });

    hbox
}

pub fn systemindicators() -> gtk4::Box {
    let hbox = Box::new(Orientation::Horizontal, 5);

    hbox.append(&create_icon_indicator(|| network::get_icon_name()));
    hbox.append(&create_icon_indicator(|| audio::get_audio_icon()));
    hbox.append(&battery_indicator());

    hbox
}

use fgl::services::audio;
use fgl::services::battery;
use fgl::services::network;
use fgl::widgets::icon::IconOptions;
use fgl::widgets::label::LabelOptions;
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

    let icon = create_icon_indicator(|| battery::get_battery_icon());

    let percent_l = gtk4::Label::new(None);
    percent_l.watch(1000, || {
        format!("{}%", battery::get_battery_capacity().to_string())
    });

    hbox.append(&icon);
    hbox.append(&percent_l);
    hbox
}

pub fn systemindicators() -> gtk4::Box {
    let hbox = Box::new(Orientation::Horizontal, 5);

    hbox.append(&create_icon_indicator(|| network::get_icon_name()));
    hbox.append(&create_icon_indicator(|| audio::get_audio_icon()));
    hbox.append(&battery_indicator());

    hbox
}

use gtk4::prelude::*;
use gtk4::Adjustment;
use gtk4::Box;
use gtk4::Orientation::*;
use gtk4::Scale;
use services::audio::{audio_changed, get_volume};

fn volume_slider() -> gtk4::Scale {
    let slider = Scale::new(
        Horizontal,
        Some(&Adjustment::new(
            (get_volume() as f64).floor(),
            0.0,
            100.0,
            1.0,
            5.0,
            0.0,
        )),
    );
    slider.set_hexpand(true);
    slider.connect_value_changed(|slider| {
        let value = format!("{}%", slider.value());
        slider.set_tooltip_text(Some(value.as_str()));
        let _ = std::process::Command::new("pactl")
            .args(&["set-sink-volume", "@DEFAULT_SINK@", value.as_str()])
            .spawn();
    });

    let sliderr = fragile::Fragile::new(slider.clone());
    audio_changed(move |new| {
        let new_volume = (new.volume as f64).floor();
        sliderr.get().set_value(new_volume);
    });

    slider
}

pub fn sliders() -> Box {
    let hbox = Box::new(Vertical, 0);
    hbox.add_css_class("sliders");

    hbox.append(&volume_slider());

    hbox
}

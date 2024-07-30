use fgl::services::audio::get_audio_icon;
use fgl::widgets::icon::IconOptions;
use fgl::widgets::scale::ScaleOptions;
use gtk4::{prelude::*, Adjustment, Orientation};
use gtk4::{Revealer, Scale};

fn sound_slider() -> gtk4::Box {
    let hbox = gtk4::Box::new(Orientation::Horizontal, 5);
    let vbox = gtk4::Box::new(Orientation::Vertical, 5);

    let icon = gtk4::Image::new();
    icon.set_icon_name(Some(get_audio_icon().as_str()));
    icon.watch(200, || get_audio_icon());

    let slider = Scale::new(
        Orientation::Horizontal,
        Some(&Adjustment::new(
            fgl::services::audio::get_volume().into(),
            0.0,
            100.0,
            1.0,
            10.0,
            0.0,
        )),
    );
    slider.add_css_class("sound_slider");
    slider.set_hexpand(true);

    slider.watch(100, || fgl::services::audio::get_volume().into());
    slider.connect_value_changed(|slider| {
        let value = format!("{}%", slider.value());
        let _ = std::process::Command::new("pactl")
            .args(vec!["set-sink-volume", "@DEFAULT_SINK@", value.as_str()])
            .spawn();
    });

    let revealer = Revealer::new();
    revealer.set_child(Some(&gtk4::Label::new(Some("hi"))));
    revealer.set_reveal_child(false);

    let btn = gtk4::Button::new();
    btn.set_icon_name("go-next-symbolic");
    let revealerr = revealer.clone();
    btn.connect_clicked(move |_| {
        revealerr.set_reveal_child(!revealerr.is_child_revealed());
    });

    hbox.append(&icon);
    hbox.append(&slider);
    hbox.append(&btn);

    vbox.append(&hbox);
    vbox.append(&revealer);

    vbox
}

pub fn sliders() -> gtk4::Box {
    let vbox = gtk4::Box::new(Orientation::Vertical, 5);
    vbox.add_css_class("sliders");
    vbox.set_hexpand(true);

    vbox.append(&sound_slider());

    vbox
}

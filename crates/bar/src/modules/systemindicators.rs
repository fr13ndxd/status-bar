use gtk4::prelude::*;
use gtk4::Box;
use gtk4::Button;
use gtk4::Image;
use gtk4::Label;
use gtk4::Orientation::*;
use services::audio::audio_icon_changed;
use services::battery::battery_changed;
use services::network::network_changed;

fn network_indicator() -> gtk4::Box {
    let icon = Image::new();

    let hbox = Box::new(Horizontal, 0);
    hbox.append(&icon);
    network_changed(move |props| {
        icon.set_icon_name(Some(props.icon.as_str()));
    });

    hbox
}

fn audio_indicator() -> gtk4::Box {
    let icon = Image::new();

    let hbox = Box::new(Horizontal, 0);
    hbox.append(&icon);
    let icon = fragile::Fragile::new(icon);
    audio_icon_changed(move |new| {
        icon.get().set_icon_name(Some(&new.as_str()));
    });

    hbox
}

fn battery_indicator() -> gtk4::Box {
    let icon = Image::new();
    let label = Label::new(None);

    let hbox = Box::new(Horizontal, 1);
    hbox.append(&icon);
    hbox.append(&label);
    battery_changed(move |props| {
        let percent = format!("{}%", props.percent);
        icon.set_icon_name(Some(&props.icon));
        label.set_label(percent.as_str());
    });

    hbox
}

pub fn indicators() -> Button {
    let btn = Button::new();
    btn.add_css_class("systemindicators");

    let btnn = btn.clone();
    btn.connect_clicked(move |_| {
        quicksettings::quicksettings(btnn.clone()).show();
    });

    let hbox = Box::new(Horizontal, 5);
    hbox.append(&network_indicator());
    hbox.append(&audio_indicator());
    hbox.append(&battery_indicator());

    btn.set_child(Some(&hbox));

    btn
}

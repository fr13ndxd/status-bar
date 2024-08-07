use gtk4::prelude::*;
use gtk4::Box;
use gtk4::Button;
use gtk4::Image;
use gtk4::Label;
use gtk4::Orientation;

pub mod indicators;
use indicators::indcators_win;

fn cpu_temp() -> gtk4::Box {
    let hbox = Box::new(Orientation::Horizontal, 0);

    let cpu_icon = Image::from_icon_name("temperature-symbolic");
    hbox.append(&cpu_icon);

    let cpu_label = Label::new(Some("0°C"));
    hbox.append(&cpu_label);

    fgl::services::cpu::cpu_temp_changed(move |temp| {
        cpu_label.set_label(temp.as_str());
    });

    hbox
}

pub fn indicators_button() -> gtk4::Box {
    let indicator_btn = Button::new();
    indicator_btn.add_css_class("indicators_button");

    let indicators_box = gtk4::Box::new(Orientation::Horizontal, 0);
    indicators_box.add_css_class("indicators_bar");
    indicators_box.append(&cpu_temp());

    indicator_btn.set_child(Some(&indicators_box));

    let container_box = gtk4::Box::new(Orientation::Horizontal, 0);
    container_box.append(&indicator_btn);

    let indicator_window = indcators_win(indicator_btn.clone());
    indicator_btn.connect_clicked(move |_| indicator_window.show());

    container_box
}

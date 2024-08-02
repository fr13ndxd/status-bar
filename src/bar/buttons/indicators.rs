use fgl::widgets::label::LabelOptions;
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

    let cpu_icon = Image::new();
    cpu_icon.set_icon_name(Some("temperature-symbolic"));
    let cpu_label = Label::new(Some("0°C"));
    cpu_label.watch(4000, || indicators::cpu::get_cpu_temp());

    hbox.append(&cpu_icon);
    hbox.append(&cpu_label);

    hbox
}

pub fn indicators_button() -> gtk4::Box {
    let indicator_btn = Button::new();
    indicator_btn.add_css_class("indicators_button");

    let win = indcators_win(indicator_btn.clone());
    indicator_btn.connect_clicked(move |_| {
        win.show();
    });

    let hbox = gtk4::Box::new(Orientation::Horizontal, 0);
    hbox.add_css_class("indicators_bar");

    hbox.append(&cpu_temp());

    indicator_btn.set_child(Some(&hbox));
    let b = gtk4::Box::new(Orientation::Horizontal, 0);
    b.append(&indicator_btn);
    b
}

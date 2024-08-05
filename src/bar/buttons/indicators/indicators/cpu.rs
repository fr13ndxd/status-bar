use fgl::widgets::{label::LabelOptions, WidgetOptions};
use gtk4::{prelude::*, Box, Button, CenterBox, Image, Label, Revealer};
use std::fmt::Write;
use std::fs;

pub fn get_nth_cpu_temp(sensor_id: i32) -> String {
    let path = format!("/sys/class/thermal/thermal_zone{}/temp", sensor_id);

    match fs::read_to_string(&path) {
        Ok(temp) => {
            let temp = temp.trim().parse::<f64>().unwrap_or(0.0) / 1000.0;

            let mut result = String::new();
            write!(result, "Sensor {} {:.1}°C", sensor_id, temp).unwrap();
            result
        }
        Err(_) => String::new(),
    }
}

pub fn get_cpu_temp() -> String {
    let temps: Vec<f64> = (1..=10)
        .filter_map(|i| {
            let path = format!("/sys/class/thermal/thermal_zone{}/temp", i);
            fs::read_to_string(&path)
                .ok()
                .and_then(|temp| temp.trim().parse::<f64>().ok())
                .map(|temp| temp / 1000.0)
        })
        .collect();

    if temps.is_empty() {
        String::new()
    } else {
        let average_temp = temps.iter().sum::<f64>() / temps.len() as f64;
        format!("{:.1}°C", average_temp)
    }
}

fn revealer() -> gtk4::Revealer {
    let revealer = Revealer::new();
    revealer.set_hexpand(true);
    revealer.set_halign(gtk4::Align::End);

    let vbox = Box::new(gtk4::Orientation::Vertical, 0);
    vbox.add_css_class("indicator_revealer");

    for i in 1..=10 {
        let label = Label::new(Some(&get_nth_cpu_temp(i)));
        label.set_xalign(0.0);
        label.add_css_class("indicator_label");

        label.watch(6000, move || get_nth_cpu_temp(i));
        vbox.append(&label);
    }

    revealer.set_child(Some(&vbox));
    revealer
}

pub fn cpu_temp_box() -> gtk4::Box {
    let vbox = Box::new(gtk4::Orientation::Vertical, 0);
    let cbox = CenterBox::new();
    vbox.append(&cbox);

    let revealer = revealer();
    vbox.append(&revealer);

    let icon = Image::new();
    icon.set_icon_name(Some("temperature-symbolic"));

    let label = Label::new(Some("0°C"));
    label.watch(4000, || get_cpu_temp());

    let btn = Button::new();
    btn.set_icon_name("go-next-symbolic");
    btn.connect_clicked(move |btn| {
        let is_revealed = !revealer.is_child_revealed();
        revealer.set_reveal_child(is_revealed);
        btn.toggle_classname("temp_button_revealed", is_revealed);
    });

    cbox.set_start_widget(Some(&icon));
    cbox.set_center_widget(Some(&label));
    cbox.set_end_widget(Some(&btn));

    vbox
}

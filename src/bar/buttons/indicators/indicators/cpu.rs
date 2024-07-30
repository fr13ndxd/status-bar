use fgl::widgets::{button::ButtonOptions, label::LabelOptions, WidgetOptions};
use gtk4::{ffi::gtk_text_new, prelude::*, Box, Button, CenterBox, Image, Label, Revealer};

pub fn get_nth_cpu_temp(x: i32) -> String {
    for i in 1..=10 {
        if i == x {
            let dir = format!("/sys/class/thermal/thermal_zone{}/temp", i);
            match std::fs::read_to_string(dir) {
                Ok(temp) => {
                    let temp = (temp.trim().parse().unwrap_or(0)) as f64 / 1000.0;
                    if x >= 10 {
                        return format!("Sensor {} {:.1}°C", x, temp);
                    }
                    return format!("Sensor {}\t{:.1}°C", x, temp);
                }
                Err(_) => (),
            }
        }
    }

    String::from("")
}

pub fn get_cpu_temp() -> String {
    let mut temps = Vec::new();
    for i in 1..=10 {
        let dir = format!("/sys/class/thermal/thermal_zone{}/temp", i);
        match std::fs::read_to_string(dir) {
            Ok(temp) => {
                let temp = (temp.trim().parse().unwrap_or(0)) as f64 / 1000.0;
                temps.push(temp);
            }
            Err(_) => (),
        }
    }

    let res = temps.iter().sum::<f64>() / temps.len() as f64;
    format!("{:.1}°C", res)
}

fn revealer() -> gtk4::Revealer {
    let revealer = Revealer::new();
    let vbox = Box::new(gtk4::Orientation::Vertical, 0);
    vbox.add_css_class("indicator_revealer");
    revealer.set_hexpand(true);
    revealer.set_halign(gtk4::Align::End);

    for i in 1..=10 {
        let label = Label::new(None);
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
    let btn2 = btn.clone();
    btn.connect_clicked(move |_| {
        revealer.set_reveal_child(!revealer.is_child_revealed());
        btn2.toggle_classname("temp_button_revealed", !revealer.is_child_revealed());
    });

    cbox.set_start_widget(Some(&icon));
    cbox.set_center_widget(Some(&label));
    cbox.set_end_widget(Some(&btn));

    vbox
}

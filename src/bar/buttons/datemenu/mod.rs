use fgl::button::LabelPoll;
use gtk4::{prelude::*, Label, Orientation, Revealer};
use gtk4::{prelude::*, RevealerTransitionType};
use gtk4_layer_shell::{Edge, KeyboardMode, LayerShell};

//use crate::popup_window::PopupWindow;

fn current_date() -> String {
    let format = "%H:%M - %A %e.";
    let now = chrono::Local::now();
    let time = now.format(format).to_string();

    time
}

pub fn datemenu_button() -> gtk4::Box {
    let btn = gtk4::Button::new();
    btn.add_css_class("datemenu_button");
    btn.watch(|| current_date());

    btn.connect_clicked(move |_| {
        //  let datemenu = PopupWindow::new("datemenu".to_string(), 200, 200);
        //  PopupWindow::show(&datemenu);
    });

    let hbox = gtk4::Box::new(gtk4::Orientation::Horizontal, 0);
    hbox.append(&btn);
    hbox
}

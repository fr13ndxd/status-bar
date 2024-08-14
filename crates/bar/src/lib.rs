use gtk4::{prelude::*, Application, Orientation::*};
use gtk4::{ApplicationWindow, Box, CenterBox};
use gtk4_layer_shell::{Edge, LayerShell};
#[allow(unused_imports)]
use modules::{
    activeapp::active_app, date::datemenu, systemindicators::indicators, workspaces::workspaces,
};
use utils::vars::BAR_POSITION;

mod modules;

fn start() -> Box {
    let hbox = Box::new(Horizontal, 0);
    hbox.append(&workspaces());
    // hbox.append(&active_app());

    hbox
}

fn center() -> Box {
    let hbox = Box::new(Horizontal, 0);
    hbox.append(&datemenu());

    hbox
}

fn end() -> Box {
    let hbox = Box::new(Horizontal, 0);
    hbox.append(&indicators());

    hbox
}

pub fn bar(app: Application) -> ApplicationWindow {
    let window = ApplicationWindow::builder().application(&app).build();
    window.set_height_request(30);
    window.init_layer_shell();
    window.set_namespace("status-bar");
    window.add_css_class("status-bar");
    window.auto_exclusive_zone_enable();

    let widgets = CenterBox::new();
    widgets.set_start_widget(Some(&start()));
    widgets.set_center_widget(Some(&center()));
    widgets.set_end_widget(Some(&end()));

    window.set_child(Some(&widgets));

    let windoww = window.clone();

    let (tx, rx) = std::sync::mpsc::channel();
    std::thread::spawn(move || unsafe {
        tx.send(());
        let mut last = utils::vars::BAR_POSITION.clone().unwrap();
        loop {
            if last != utils::vars::BAR_POSITION.clone().unwrap() {
                tx.send(());
            }
            last = utils::vars::BAR_POSITION.clone().unwrap();

            std::thread::sleep(std::time::Duration::from_millis(1));
        }
    });

    let windoww = window.clone();
    gtk4::glib::source::idle_add_local(move || {
        std::thread::sleep(std::time::Duration::from_millis(1));

        if let Ok(_) = rx.try_recv() {
            unsafe {
                match BAR_POSITION.clone().unwrap().as_str() {
                    "top" => {
                        windoww.set_anchor(Edge::Top, true);
                        windoww.set_anchor(Edge::Bottom, false);
                    }
                    "bottom" => {
                        windoww.set_anchor(Edge::Top, false);
                        windoww.set_anchor(Edge::Bottom, true);
                    }
                    _ => println!("unknown position {}", BAR_POSITION.clone().unwrap()),
                }
            }
        }

        gtk4::glib::ControlFlow::Continue
    });

    window.set_anchor(Edge::Top, true);
    window.set_anchor(Edge::Left, true);
    window.set_anchor(Edge::Right, true);

    window.show();
    window
}

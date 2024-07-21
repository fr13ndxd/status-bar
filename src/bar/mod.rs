use crate::options;
use gtk4::{prelude::*, Application, Orientation};
use gtk4_layer_shell::{Edge, LayerShell};

pub mod buttons;

fn start() -> gtk4::Box {
    let hbox = gtk4::Box::new(gtk4::Orientation::Horizontal, 0);
    for w in options::bar_order("start") {
        hbox.append(&w);
    }
    hbox
}

fn center() -> gtk4::Box {
    let hbox = gtk4::Box::new(gtk4::Orientation::Horizontal, 0);
    for w in options::bar_order("center") {
        hbox.append(&w);
    }
    hbox
}

fn end() -> gtk4::Box {
    let hbox = gtk4::Box::new(Orientation::Horizontal, 0);
    for w in options::bar_order("end") {
        hbox.append(&w);
    }
    hbox
}

pub fn bar(app: Application) -> gtk4::ApplicationWindow {
    let window = gtk4::ApplicationWindow::builder().application(&app).build();
    window.init_layer_shell();
    window.set_namespace("status-bar");

    let widgets = gtk4::CenterBox::new();
    widgets.set_start_widget(Some(&start()));
    widgets.set_center_widget(Some(&center()));
    widgets.set_end_widget(Some(&end()));

    window.set_child(Some(&widgets));

    window.set_css_classes(&vec!["status-bar"]);

    window.auto_exclusive_zone_enable();

    if options::BAR_POSITION == "top" {
        window.set_anchor(Edge::Top, true);
    } else {
        window.set_anchor(Edge::Bottom, true);
    }
    window.set_anchor(Edge::Left, true);
    window.set_anchor(Edge::Right, true);

    window
}

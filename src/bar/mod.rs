use gtk4::{prelude::*, Application};
use gtk4_layer_shell::{Edge, LayerShell};

pub mod buttons;

fn start() -> gtk4::Box {
    let hbox = gtk4::Box::new(gtk4::Orientation::Horizontal, 0);
    hbox.append(&buttons::workspaces());
    hbox.append(&buttons::active_app_label());

    hbox
}

fn center() -> gtk4::Label {
    gtk4::Label::new(Some("center"))
}

fn end() -> gtk4::Label {
    gtk4::Label::new(Some("end"))
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

    window.set_css_classes(&vec!["status-bar0"]);

    window.auto_exclusive_zone_enable();

    window.set_anchor(Edge::Top, true);
    window.set_anchor(Edge::Left, true);
    window.set_anchor(Edge::Right, true);

    window
}

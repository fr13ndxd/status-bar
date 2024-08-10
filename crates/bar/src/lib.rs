use gtk4::Application;
use gtk4::Orientation::Horizontal;
use gtk4::{prelude::*, Label};
use gtk4::{ApplicationWindow, Box, CenterBox};
use gtk4_layer_shell::{Edge, LayerShell};
use modules::activeapp::active_app;
use modules::date::datemenu;
use modules::systemindicators::indicators;
use modules::workspaces::workspaces;

mod modules;

fn start() -> Box {
    let hbox = Box::new(Horizontal, 0);
    hbox.append(&workspaces());
    hbox.append(&active_app());

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
    window.init_layer_shell();
    window.set_namespace("status-bar");
    window.add_css_class("status-bar");
    window.auto_exclusive_zone_enable();

    let widgets = CenterBox::new();
    widgets.set_start_widget(Some(&start()));
    widgets.set_center_widget(Some(&center()));
    widgets.set_end_widget(Some(&end()));

    window.set_child(Some(&widgets));

    window.set_anchor(Edge::Top, true);
    window.set_anchor(Edge::Left, true);
    window.set_anchor(Edge::Right, true);

    window.show();
    window
}

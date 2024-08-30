use gtk4::{prelude::*, Application, Orientation::*};
use gtk4::{ApplicationWindow, Box, CenterBox};
use gtk4_layer_shell::{Edge, LayerShell};
#[allow(unused_imports)]
use modules::{
    activeapp::active_app, date::datemenu, systemindicators::indicators, workspaces::workspaces,
};
use utils::variable::Var;

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
    window.set_height_request(20);
    window.init_layer_shell();
    window.set_namespace("status-bar");
    window.add_css_class("status-bar");
    window.auto_exclusive_zone_enable();

    let widgets = CenterBox::new();
    widgets.set_start_widget(Some(&start()));
    widgets.set_center_widget(Some(&center()));
    widgets.set_end_widget(Some(&end()));

    window.set_child(Some(&widgets));

    let windoww = fragile::Fragile::new(window.clone());
    let mut var = utils::vars::BAR_POSITION.lock().unwrap();
    var.connect_changed({
        move |new| {
            let windoww = windoww.get();
            if !&["top", "bottom"].contains(&new.as_str()) {
                println!("unknown bar position: {}", new);
                return;
            }
            windoww.set_anchor(Edge::Top, new == "top");
            windoww.set_anchor(Edge::Bottom, new == "bottom");
        }
    });
    drop(var);

    window.set_anchor(Edge::Left, true);
    window.set_anchor(Edge::Right, true);

    window.show();
    window
}

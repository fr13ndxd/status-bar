use crate::bar::buttons::{
    active_app::active_app, datemenu::datemenu_button, indicators::indicators_button,
    quicksettings::quicksettings_button, workspaces::workspaces,
};

pub static CSS_DIRECTORY: &str = "/home/fr13nd/Desktop/status-bar/style/main.scss";

// bar settings
pub static BAR_POSITION: &str = "top"; // top, bottom

pub static TIME_FORMAT: &str = "%H:%M - %A %e.";

pub fn bar_order(part: &str) -> Vec<gtk4::Box> {
    // change order of items in bar
    match part {
        "start" => vec![workspaces(), active_app()],
        "center" => vec![datemenu_button()],
        "end" => vec![indicators_button(), quicksettings_button()],
        _ => Vec::from([]),
    }
}

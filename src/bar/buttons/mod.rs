use active_app::active_app;

pub mod active_app;
pub mod datemenu;
pub mod workspaces;

use datemenu::datemenu;

pub fn workspaces() -> gtk4::Box {
    workspaces::workspaces()
}

pub fn active_app_label() -> gtk4::Box {
    active_app::active_app()
}

pub fn datemenu_button() -> gtk4::Box {
    datemenu::datemenu_button()
}

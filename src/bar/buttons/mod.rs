use active_app::active_app;

mod active_app;
mod workspaces;

pub fn workspaces() -> gtk4::Box {
    workspaces::workspaces()
}

pub fn active_app_label() -> gtk4::Box {
    active_app::active_app()
}

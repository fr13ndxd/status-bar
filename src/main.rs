use gtk4::prelude::*;

mod bar;
pub mod options;
pub mod popup_window;
mod utils;

#[tokio::main]
async fn main() {
    let _ = gtk4::init();
    let app = gtk4::Application::new(Some("com.fr13nd.status-bar"), Default::default());

    app.connect_activate(|app| {
        bar::bar(app.clone()).present();

        utils::load_css();
    });

    app.run();
}

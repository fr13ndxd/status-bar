use gtk4::prelude::*;

mod bar;
mod utils;

#[tokio::main]
async fn main() {
    let _ = gtk4::init();
    let app = gtk4::Application::new(Some("com.aaaaaaa.aaaaaaaaaaaaaaaa"), Default::default());

    app.connect_activate(|app| {
        bar::bar(app.clone()).present();

        utils::load_css();
    });

    app.run();
}

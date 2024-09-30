use config::load_config;
use gtk4::prelude::{ApplicationExt, ApplicationExtManual};
use log::{log, Level};
use style::load_css;

mod config;
mod options;
mod style;

#[tokio::main]
async fn main() {
    let start = std::time::Instant::now();
    let _ = gtk4::init();
    let app = gtk4::Application::new(Some("com.fr13nd.status-bar"), Default::default());
    options::handle_options(&app);

    app.connect_activate(move |app| {
        load_config();
        load_css();
        bar::bar(app.clone());
        let loaded = start.elapsed().as_millis();

        log!(Level::Info, "temp dir: {:?}", utils::temp_dir());
        log!(Level::Info, "Loaded in {}ms", loaded);
    });

    app.run();
}

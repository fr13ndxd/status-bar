use gtk4::prelude::{ApplicationExt, ApplicationExtManual};
use log::{log, Level};
use simple_logger::SimpleLogger;
use style::load_css;

mod style;

#[tokio::main]
async fn main() {
    SimpleLogger::new()
        .with_level(log::LevelFilter::max())
        .init()
        .unwrap();
    let start = std::time::Instant::now();
    let _ = gtk4::init();
    let app = gtk4::Application::new(Some("com.fr13nd.status-bar"), Default::default());

    app.connect_activate(move |app| {
        load_css();
        bar::bar(app.clone());
        let loaded = start.elapsed().as_millis();

        log!(Level::Info, "Loaded in {}ms", loaded)
    });

    app.run();
}

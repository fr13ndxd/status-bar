use gtk4::{
    glib::{Char, OptionFlags},
    prelude::{ApplicationExt, ApplicationExtManual},
};
use log::{log, Level, LevelFilter};
use simple_logger::SimpleLogger;
use style::load_css;

mod style;

#[tokio::main]
async fn main() {
    let start = std::time::Instant::now();
    let _ = gtk4::init();
    let app = gtk4::Application::new(Some("com.fr13nd.status-bar"), Default::default());
    app.add_main_option(
        "show-trace",
        Char(('t' as u8).try_into().unwrap()),
        OptionFlags::NONE,
        gtk4::glib::OptionArg::None,
        "shows trace logs (default: info)",
        None,
    );

    app.connect_handle_local_options(move |_, x| {
        if x.contains("show-trace") {
            let loglevel = LevelFilter::max();
            SimpleLogger::new().with_level(loglevel).init().unwrap();
        } else {
            SimpleLogger::new()
                .with_level(LevelFilter::Info)
                .init()
                .unwrap();
        }

        -1
    });

    app.connect_activate(move |app| {
        load_css();
        bar::bar(app.clone());
        let loaded = start.elapsed().as_millis();

        log!(Level::Info, "temp dir: {:?}", utils::temp_dir());
        log!(Level::Info, "Loaded in {}ms", loaded)
    });

    app.run();
}

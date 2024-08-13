use gtk4::glib::{Char, OptionFlags};
use gtk4::prelude::*;
use gtk4::Application;
use log::LevelFilter;
use simple_logger::SimpleLogger;

pub fn handle_options(app: &Application) {
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
}

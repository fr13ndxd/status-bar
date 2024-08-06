use gtk4::prelude::*;
use log::{log, Level};
use simple_logger::SimpleLogger;
use std::env::{args, Args};

mod bar;
pub mod options;
pub mod popup_window;
mod utils;

const HELP: &str = "HELP:
    -h, --help\t\tPrints this message
    TODO: add stuff to this";

fn handle_args(args: Args) {
    for arg in args.skip(1) {
        let arg = arg.as_str();

        match arg {
            "-h" | "--help" => println!("{}", HELP),
            _ => println!("unknown argument: {}\n{}", arg, HELP),
        }
    }
}

#[tokio::main]
async fn main() {
    SimpleLogger::new()
        .with_level(log::LevelFilter::Info)
        .init()
        .unwrap();
    let start = std::time::Instant::now(); // start time of this program

    let args_count = args().count();
    if args_count != 1 {
        handle_args(args());
        std::process::exit(0);
    }

    let _ = gtk4::init();
    let app = gtk4::Application::new(Some("com.fr13nd.status-bar"), Default::default());

    app.connect_activate(move |app| {
        bar::bar(app.clone()).present();
        let bar_loaded = start.elapsed().as_millis(); // bar() function load entire bar

        utils::watch_css();
        let scss_loaded = start.elapsed().as_millis() - bar_loaded; // load_css() loads scss/css
        log!(Level::Info, "using scss file: {}", options::CSS_DIRECTORY);

        log!(
            Level::Info,
            "Bar loaded in {}ms (Scss took {}ms, {}ms total)",
            bar_loaded,
            scss_loaded,
            scss_loaded + bar_loaded
        );
    });

    app.run();
}

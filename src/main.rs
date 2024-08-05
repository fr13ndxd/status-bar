use gtk4::prelude::*;
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
    let args_count = args().count();
    if args_count != 1 {
        handle_args(args());
        std::process::exit(0);
    }

    let _ = gtk4::init();
    let app = gtk4::Application::new(Some("com.fr13nd.status-bar"), Default::default());

    app.connect_activate(|app| {
        bar::bar(app.clone()).present();

        utils::load_css();
    });

    app.run();
}

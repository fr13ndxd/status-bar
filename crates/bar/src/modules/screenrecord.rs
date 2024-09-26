use gtk4::prelude::*;
use gtk4::Box;
use gtk4::Button;
use gtk4::Image;
use gtk4::Label;
use gtk4::Orientation::*;
use std::fs;
use utils::WidgetOptions;

fn is_process_running() -> bool {
    let s = sysinfo::System::new_all();
    for process in s.processes_by_exact_name("wf-recorder".as_ref()) {
        return true;
    }

    false
}

pub fn indicator() -> Box {
    let hbox = Box::new(Horizontal, 5);
    hbox.add_css_class("recording_indicator");
    hbox.hide();

    let close_button = Button::from_icon_name("media-record-symbolic");
    close_button.add_css_class("close_button");

    hbox.append(&close_button);

    let (tx, rx) = std::sync::mpsc::channel();

    tokio::spawn(async move {
        let mut last = is_process_running();
        tx.send(last);
        loop {
            let current = is_process_running();
            if last != current {
                tx.send(current);
                last = current;
            }
            std::thread::sleep(std::time::Duration::from_millis(1));
        }
    });

    let hbx = hbox.clone();
    gtk4::glib::source::idle_add_local(move || {
        if let Ok(is_recording) = rx.try_recv() {
            std::thread::sleep(std::time::Duration::from_millis(1));
            if is_recording {
                hbx.show();
            } else {
                hbx.hide();
            }
        }

        gtk4::glib::ControlFlow::Continue
    });

    hbox
}

// let btn = Button::new();
// btn.add_css_class("");
// let btnn = btn.clone();
// btn.connect_clicked(move |_| {
//     quicksettings::quicksettings(btnn.clone()).show();
// });
// let hbox = Box::new(Horizontal, 5);
// hbox.append(&network_indicator());
// hbox.append(&audio_indicator());
// hbox.append(&battery_indicator());
// btn.set_child(Some(&hbox));
// btn

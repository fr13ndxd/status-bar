use std::process::Command;
use std::time::Duration;

pub struct NetworkProps {
    pub state: String,
    pub icon: String,
    pub strength: i32,
}

pub fn network_changed<F>(callback: F)
where
    F: Fn(NetworkProps) + 'static,
{
    let (tx, rx) = std::sync::mpsc::channel();

    std::thread::spawn(move || {
        let mut last_state = state();
        let mut last_strength = strength();
        loop {
            let current_state = state();
            let current_strength = strength();
            if last_state != current_state || last_strength != current_strength {
                let props = NetworkProps {
                    state: current_state.clone(),
                    icon: get_icon_name(),
                    strength: current_strength.clone(),
                };
                tx.send(props).unwrap();
                last_state = current_state;
                last_strength = current_strength;
            }
            std::thread::sleep(Duration::from_millis(200));
        }
    });

    gtk4::glib::source::idle_add_local(move || {
        std::thread::sleep(std::time::Duration::from_millis(1));

        if let Ok(res) = rx.try_recv() {
            callback(res);
        }
        gtk4::glib::ControlFlow::Continue
    });
}

pub fn state() -> String {
    let nm = network_manager::NetworkManager::new();
    match nm.get_state() {
        Ok(state) => format!("{:?}", state),
        Err(_) => format!("error"),
    }
}

pub fn strength() -> i32 {
    let singal = Command::new("nmcli")
        .args(["-f", "IN-USE,SIGNAL", "dev", "wifi"])
        .output()
        .unwrap();

    let signal = String::from_utf8(singal.stdout).unwrap();

    for line in signal.lines() {
        if line.starts_with("*") {
            let line = line
                .strip_prefix("*")
                .unwrap()
                .replace(" ", "")
                .parse::<i32>()
                .unwrap();

            return line;
        }
    }

    -1
}

pub fn get_icon_name() -> String {
    let state = state();
    if state == "ConnectedGlobal" {
        return match strength() {
            0..=20 => String::from("network-wireless-signal-none-symbolic"),
            21..=40 => String::from("network-wireless-signal-weak-symbolic"),
            41..=60 => String::from("network-wireless-signal-ok-symbolic"),
            61..=80 => String::from("network-wireless-signal-good-symbolic"),
            81..=100 => String::from("network-wireless-signal-excellent-symbolic"),
            _ => String::from("network-wireless-off-symbolic"),
        };
    } else if state == "Connecting" {
        return String::from("network-wireless-acquiring-symbolic");
    } else if state == "Disconnected" {
        return String::from("network-wireless-offline-symbolic");
    }

    String::from("network-wireless-disabled-symbolic")
}

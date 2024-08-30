use notify::Config;
use notify::PollWatcher;
use notify::RecursiveMode;
use notify::Watcher;
use std::fs;
use std::path::Path;
use std::time::Duration;

#[derive(Debug)]
pub struct BatteryProps {
    pub percent: i32,
    pub state: String,
    pub icon: String,
}

pub fn battery_changed<F>(callback: F)
where
    F: Fn(BatteryProps) + 'static,
{
    let (tx, rx) = std::sync::mpsc::channel();

    tokio::spawn(async move {
        tx.send(BatteryProps {
            percent: get_battery_capacity(),
            state: get_battery_status(),
            icon: get_battery_icon(),
        })
        .unwrap();
        let dirs = vec![
            "/sys/class/power_supply/BAT0/status".to_string(),
            "/sys/class/power_supply/BAT0/capacity".to_string(),
        ];

        let config = Config::default()
            .with_compare_contents(true)
            .with_poll_interval(Duration::from_secs(2));

        let mut watcher = PollWatcher::new(
            move |_| {
                tx.send(BatteryProps {
                    percent: get_battery_capacity(),
                    state: get_battery_status(),
                    icon: get_battery_icon(),
                })
                .unwrap();
            },
            config,
        )
        .unwrap();

        dirs.iter().for_each(|dir| {
            watcher
                .watch(Path::new(&dir), RecursiveMode::NonRecursive)
                .unwrap()
        });

        loop {
            std::thread::sleep(std::time::Duration::from_millis(200));
        }
    });

    gtk4::glib::source::idle_add_local(move || {
        std::thread::sleep(std::time::Duration::from_millis(1));

        if let Ok(props) = rx.try_recv() {
            callback(props);
        }
        gtk4::glib::ControlFlow::Continue
    });
}

pub fn get_battery_status() -> String {
    let path = std::path::Path::new("/sys/class/power_supply/BAT0/status");

    let sp = fs::read_to_string(path).unwrap();

    sp.trim().to_string()
}

pub fn get_battery_capacity() -> i32 {
    let path = std::path::Path::new("/sys/class/power_supply/BAT0/capacity");
    let capacity = fs::read_to_string(path)
        .unwrap()
        .trim()
        .parse::<i32>()
        .unwrap();

    capacity
}

pub fn get_battery_icon() -> String {
    let path = std::path::Path::new("/sys/class/power_supply/BAT0");
    if !path.exists() {
        return String::from("battery-level-unknown-symbolic");
    }

    let status = match get_battery_status().as_str() {
        "Charging" => "-charging",
        _ => "",
    };
    let capacity = get_battery_capacity();

    if (0..=100).contains(&capacity) {
        let capacity = capacity - (capacity % 10);
        format!("battery-level-{}{}-symbolic", capacity, status)
    } else {
        String::from("battery-level-unknown-symbolic")
    }
}

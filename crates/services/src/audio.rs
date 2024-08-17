use gtk4::glib::source;
use lazy_static::lazy_static;
use std::process::Command;
use std::sync::Mutex;
use std::time::Duration;

use utils::variable::{Var, Variable};

pub struct AudioProps {
    pub is_muted: bool,
    pub volume: i32,
    pub icon: String,
}

lazy_static! {
    pub static ref AUDIO_ICON: Mutex<Variable<String>> =
        Mutex::new(Variable::new(get_audio_icon()));
}

pub fn audio_icon_changed<F>(callback: F)
where
    F: Fn(String) + Send + Sync + 'static,
{
    let mut audio_icon = AUDIO_ICON.lock().unwrap();
    audio_icon.connect_changed(move |new| callback(new.to_string()));
    audio_icon.set(get_audio_icon());
    drop(audio_icon);

    lazy_static! {
        static ref LAST_ICON: Mutex<String> = Mutex::new(get_audio_icon());
    }
    source::idle_add_local(move || {
        std::thread::sleep(Duration::from_millis(1));
        let current_icon = get_audio_icon();
        if current_icon != *LAST_ICON.lock().unwrap() {
            let mut audio_icon = AUDIO_ICON.lock().unwrap();
            audio_icon.set(current_icon.clone());
            *LAST_ICON.lock().unwrap() = current_icon.clone();
            drop(audio_icon);
        }
        gtk4::glib::ControlFlow::Continue
    });
}

pub fn audio_changed<F>(callback: F)
where
    F: Fn(AudioProps) + 'static,
{
    let (tx, rx) = std::sync::mpsc::channel();

    std::thread::spawn(move || {
        let mut last_muted = is_muted();
        let mut last_volume = get_volume();
        tx.send(AudioProps {
            is_muted: last_muted,
            volume: last_volume,
            icon: get_audio_icon(),
        })
        .unwrap();
        loop {
            let current_muted = is_muted();
            let current_volume = get_volume();
            if last_muted != current_muted || last_volume != current_volume {
                tx.send(AudioProps {
                    is_muted: current_muted,
                    volume: current_volume,
                    icon: get_audio_icon(),
                })
                .unwrap();
                last_muted = current_muted;
                last_volume = current_volume;
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

pub fn is_muted() -> bool {
    let output = Command::new("pactl")
        .args(["get-sink-mute", "@DEFAULT_SINK@"])
        .output()
        .unwrap();
    let output = std::str::from_utf8(&output.stdout).unwrap();

    output.contains("yes")
}

pub fn get_volume() -> i32 {
    let output = Command::new("pactl")
        .args(["get-sink-volume", "@DEFAULT_SINK@"])
        .output()
        .unwrap();

    let output = std::str::from_utf8(&output.stdout).unwrap();

    for line in output.lines() {
        if let Some(vol_str) = line.split_whitespace().nth(4) {
            let vol = vol_str
                .trim_end_matches('%')
                .parse::<i32>()
                .expect("Failed to parse volume");
            return vol;
        }
    }

    0
}

pub fn get_audio_icon() -> String {
    if is_muted() {
        return String::from("audio-volume-muted-symbolic");
    }

    let volume = get_volume();

    String::from(match volume {
        0 => "audio-volume-muted-symbolic",
        1..=34 => "audio-volume-low-symbolic",
        35..=67 => "audio-volume-medium-symbolic",
        68..=100 => "audio-volume-high-symbolic",
        _ => "audio-volume-overamplified-symbolic",
    })
}

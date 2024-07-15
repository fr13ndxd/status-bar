use gtk4::prelude::*;
use gtk4::{Box as GtkBox, Revealer, Widget, Window};
use gtk4_layer_shell::LayerShell;

pub fn popup_revealer(window_name: &str, transition: &str, child: &gtk4::Widget) -> gtk4::Window {
    let revealer = Revealer::new();
    revealer.set_transition_type(match transition {
        "slide_left" => gtk4::RevealerTransitionType::SlideLeft,
        "slide_right" => gtk4::RevealerTransitionType::SlideRight,
        "slide_up" => gtk4::RevealerTransitionType::SlideUp,
        "slide_down" => gtk4::RevealerTransitionType::SlideDown,
        _ => gtk4::RevealerTransitionType::Crossfade, // Default transition type
    });

    revealer.set_child(Some(child));
    revealer.set_transition_duration(350);

    let hbox = GtkBox::new(gtk4::Orientation::Horizontal, 5);
    hbox.append(&revealer);

    let window = Window::new();
    window.init_layer_shell();
    window.set_title(Some(window_name));
    window.set_default_size(400, 200);
    window.set_child(Some(&hbox));

    window
}

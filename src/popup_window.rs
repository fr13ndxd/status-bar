use gtk4::prelude::*;
use gtk4::{Box as GtkBox, Orientation, Revealer, RevealerTransitionType, Widget, Window};
use gtk4_layer_shell::{Edge, KeyboardMode, LayerShell};

pub fn popup_revealer<C>(window_name: &str, child: C) -> (gtk4::Window, gtk4::Revealer)
where
    C: IsA<Widget>,
{
    child.add_css_class("content");

    let window = gtk4::Window::new();
    window.add_css_class("popup_window");
    window.init_layer_shell();
    window.add_css_class(window_name);
    window.set_namespace(window_name);
    window.set_visible(false);
    window.set_anchor(Edge::Right, true);
    window.set_anchor(Edge::Bottom, true);
    window.set_keyboard_mode(KeyboardMode::Exclusive);

    let revealer = gtk4::Revealer::new();
    revealer.set_reveal_child(false);
    revealer.set_child(Some(&child));
    revealer.set_transition_duration(2000);
    revealer.set_transition_type(RevealerTransitionType::SlideUp);

    let hbox = gtk4::Box::new(Orientation::Horizontal, 5);
    hbox.append(&revealer);

    let overlay = gtk4::Overlay::new();
    overlay.set_child(Some(&hbox));

    window.set_child(Some(&overlay));

    (window, revealer)
}

use gtk4::Box;
use gtk4::Orientation;

pub fn header() -> gtk4::Box {
    let header = Box::new(Orientation::Horizontal, 0);

    header
}

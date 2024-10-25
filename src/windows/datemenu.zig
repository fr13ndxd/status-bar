const gtk = @import("gtk");

const Popover = gtk.Popover;
const Button = gtk.Button;

pub fn datemenu(parent: *Button) !*Popover {
    const popover = Popover.new();
    popover.parent.setParent(parent.into(gtk.Widget));

    return popover;
}

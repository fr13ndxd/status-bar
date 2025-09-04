const gi = @import("gi");
const gtk = gi.Gtk;

const Widget = gtk.Widget;
const Box = gtk.Box;
const Popover = gtk.Popover;
const Button = gtk.Button;
const Calendar = gtk.Calendar;

fn calendarWidget() *Calendar {
    const calendar = Calendar.new();

    return calendar;
}

pub fn datemenu(parent: *Button) !*Popover {
    const hbox = Box.new(.horizontal, 0);
    hbox.append(calendarWidget().into(Widget));

    const w_hbox = hbox.into(Widget);
    w_hbox.addCssClass("datemenu");

    const popover = Popover.new();
    popover.setOffset(0, 5);
    popover.setHasArrow(false);
    popover.setChild(w_hbox);
    popover.parent.setParent(parent.into(gtk.Widget));

    const w_popover = popover.into(Widget);
    w_popover.addCssClass("datemenu_window");

    return popover;
}

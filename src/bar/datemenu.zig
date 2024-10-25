const gtk = @import("gtk");
const std = @import("std");

const utils = @import("../utils.zig");
const datemenu_wn = @import("../windows/datemenu.zig");

const Box = gtk.Box;
const Button = gtk.Button;
const Widget = gtk.Widget;

pub fn updateTimeButton(button: *Button) bool {
    const time = gtk.glib.DateTime.newNowLocal();
    const formatedTime = time.?.format("%H:%M - %A %e.").?;

    button.setLabel(formatedTime);

    return true;
}

pub fn datemenu() !*Box {
    const hbox = Box.new(.horizontal, 5);
    const whbox = hbox.into(Widget);
    whbox.addCssClass("datemenu");

    const timeButton = Button.new();
    _ = updateTimeButton(timeButton);
    _ = gtk.glib.timeoutAddSeconds(gtk.glib.PRIORITY_DEFAULT, 5, updateTimeButton, .{timeButton});
    hbox.append(timeButton.into(Widget));

    const datemenu_window = try datemenu_wn.datemenu(timeButton);
    std.debug.print("here\n", .{});
    _ = datemenu_window; // autofix

    return hbox;
}

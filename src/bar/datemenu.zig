const gi = @import("gi");
const gtk = gi.Gtk;
const glib = gi.GLib;
const std = @import("std");

const utils = @import("../utils.zig");
const datemenu_wn = @import("../windows/datemenu.zig");

const Box = gtk.Box;
const Button = gtk.Button;
const Widget = gtk.Widget;

fn updateTimeButton(button: *Button) bool {
    const time = glib.DateTime.newNowLocal() orelse return false;
    const formatedTime = time.format("%H:%M - %A %e.") orelse return false;

    button.setLabel(formatedTime);

    return true;
}

fn timeButtonClicked(_: *Button, datemenu_win: *gtk.Popover) void {
    datemenu_win.popup();
}

pub fn dateMenu() !*Box {
    const hbox = Box.new(.horizontal, 5);
    const whbox = hbox.into(Widget);
    whbox.addCssClass("datemenu_button");

    const timeButton = Button.new();
    _ = updateTimeButton(timeButton);
    // _ = glib.timeoutAddSeconds(glib.PRIORITY_DEFAULT, 5, .init(updateTimeButton, timeButton));
    hbox.append(timeButton.into(Widget));

    const datemenu_window = try datemenu_wn.datemenu(timeButton);
    _ = datemenu_window;

    // _ = timeButton.connectClicked(timeButtonClicked, .{datemenu_window}, .{});
    // _ = timeButton._signals.clicked.connect(.init(timeButtonClicked, .{datemenu_window}), .{});

    return hbox;
}

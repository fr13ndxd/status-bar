const gi = @import("gi");
const gtk = gi.Gtk;
const std = @import("std");

const Box = gtk.Box;
const Image = gtk.Image;
const Widget = gtk.Widget;

const networkIcon = @import("quicksettings/network_icon.zig");
const audioIcon = @import("quicksettings/audio.zig");

pub fn quicksettings(allocator: std.mem.Allocator) !*Box {
    const hbox = Box.new(.horizontal, 5);
    const whbox = hbox.into(Widget);
    whbox.addCssClass("quicksettings_button");

    const network_icon = try networkIcon.networkIcon(allocator);
    const audio_icon = try audioIcon.audioIcon(allocator);

    hbox.append(network_icon.into(Widget));
    hbox.append(audio_icon.into(Widget));
    return hbox;
}

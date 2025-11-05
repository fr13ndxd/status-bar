const std = @import("std");
const gi = @import("gi");
const gtk = gi.Gtk;
const glib = gi.GLib;

const Audio = @import("../../services/audio/audio.zig").Audio;
const Image = gtk.Image;

var should_update_audio = false;
var audio_icon: [128:0]u8 = undefined;

fn updateAudioThread(allocator: std.mem.Allocator) !void {
    const audio = Audio.init(allocator);

    var lastIcon = try audio.getAudioIcon();
    std.mem.copyForwards(u8, &audio_icon, lastIcon);
    should_update_audio = true;
    while (true) {
        const currentIcon = try audio.getAudioIcon();
        if (!std.mem.eql(u8, lastIcon, currentIcon)) {
            lastIcon = currentIcon;

            @memset(audio_icon[0..], 0);
            std.mem.copyForwards(u8, &audio_icon, lastIcon);

            should_update_audio = true;
        }
        std.Thread.sleep(500 * std.time.ns_per_ms);
    }
}

fn updateAudioIcon(icon: *Image) bool {
    if (should_update_audio) {
        should_update_audio = false;
        const newicon = std.heap.page_allocator.dupeZ(u8, &audio_icon) catch "error";
        // defer std.heap.page_allocator.free(newicon);
        icon.setFromIconName(newicon);
    }

    return true;
}

pub fn audioIcon(allocator: std.mem.Allocator) !*Image {
    @memset(audio_icon[0..], 0);
    const img = Image.new();
    const wimg = img.into(gtk.Widget);
    wimg.setHalign(.center);
    wimg.setValign(.center);
    _ = glib.idleAdd(glib.PRIORITY_LOW, .init(updateAudioIcon, .{img}));

    (try std.Thread.spawn(.{}, updateAudioThread, .{allocator})).detach();
    return img;
}

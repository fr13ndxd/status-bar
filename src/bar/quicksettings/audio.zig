const std = @import("std");
const gtk = @import("gtk");

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
        std.time.sleep(500 * std.time.ns_per_ms);
    }
}

fn updateAudioIcon(icon: *Image) bool {
    if (should_update_audio) {
        should_update_audio = false;
        icon.setFromIconName(&audio_icon);
    }

    return true;
}

pub fn audioIcon(allocator: std.mem.Allocator) !*Image {
    const img = Image.new();
    const wimg = img.into(gtk.Widget);
    wimg.setHalign(.center);
    wimg.setValign(.center);
    _ = gtk.glib.idleAdd(gtk.glib.PRIORITY_LOW, updateAudioIcon, .{img});

    (try std.Thread.spawn(.{}, updateAudioThread, .{allocator})).detach();
    return img;
}

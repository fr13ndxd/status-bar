const std = @import("std");
const gi = @import("gi");
const glib = gi.GLib;
const gtk = gi.Gtk;

const Network = @import("../../services/network/network.zig").Network;
const Image = gtk.Image;

var should_update_network = false;
var network_icon: [128:0]u8 = undefined;

fn updateNetworkThread(allocator: std.mem.Allocator) !void {
    const network = Network.init(allocator);

    var lastIcon = try network.getNetworkIcon();
    std.mem.copyForwards(u8, &network_icon, lastIcon);
    should_update_network = true;
    while (true) {
        const newIcon = try network.getNetworkIcon();
        if (!std.mem.eql(u8, newIcon, lastIcon)) {
            should_update_network = true;

            // network_icon = newIcon;
            @memset(network_icon[0..], 0);
            std.mem.copyForwards(u8, &network_icon, newIcon);
            lastIcon = newIcon;
            std.Thread.sleep(100 * std.time.ns_per_ms);
        }
        std.Thread.sleep(500 * std.time.ns_per_ms);
    }
}

fn updateNetworkIcon(icon: *Image) bool {
    if (should_update_network) {
        should_update_network = false;
        icon.setFromIconName(&network_icon);
    }

    return true;
}

pub fn networkIcon(allocator: std.mem.Allocator) !*Image {
    const img = Image.new();
    _ = glib.idleAdd(glib.PRIORITY_LOW, .init(updateNetworkIcon, .{img}));

    (try std.Thread.spawn(.{}, updateNetworkThread, .{allocator})).detach();
    return img;
}

const gi = @import("gi");
const gtk = gi.Gtk;
const glib = gi.GLib;
const std = @import("std");

const utils = @import("../utils.zig");
const hyprland = @import("../services/hyprland/hyprland.zig");

const Box = gtk.Box;
const Label = gtk.Label;
const Widget = gtk.Widget;

var currentWorkspaceId: i32 = undefined;
var currentWorkspaces: []hyprland.Workspace = undefined;
var shouldUpdateWorkspaces = true;
var mutex = std.Thread.Mutex{};

var labels: [7]*Widget = undefined;

/// this function should be run on new thread
/// when workspace is updated, it sets the [lastactiveWorkspace, currentWorkspaces] vars
/// and sets shouldUpdateWorkspaces to true
fn shouldUpdateWorkspacesThread() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const hyprland_ws = try hyprland.Workspaces.init(allocator);
    defer hyprland_ws.deinit();

    const socketpath = try hyprland.Workspaces.getHyprlandSocketPath(allocator, .socket2);
    defer allocator.free(socketpath);
    const stream = try std.net.connectUnixSocket(socketpath);
    defer stream.close();

    var buf: [256]u8 = undefined;

    while (true) {
        _ = stream.reader(buf[0..]);
        // workspace changed event
        // workspace>>{id}
        if (std.mem.startsWith(u8, &buf, "workspace>>")) {
            const index = std.mem.indexOf(u8, &buf, ">>").? + 2;
            // TODO: use channels
            mutex.lock();
            defer mutex.unlock();
            currentWorkspaceId = try std.fmt.parseInt(i32, buf[index..], 10);
            currentWorkspaces = try hyprland_ws.get();
            shouldUpdateWorkspaces = true;
        }
        std.Thread.sleep(1 * std.time.ns_per_ms);
    }
}

fn checkForWorkspaceChanges() bool {
    mutex.lock();
    defer mutex.unlock();
    std.Thread.sleep(10 * std.time.ns_per_ms);
    if (!shouldUpdateWorkspaces) return true;

    shouldUpdateWorkspaces = false;
    for (labels, 1..) |label, i| {
        const active = currentWorkspaceId == i;
        const occupied = blk: {
            for (currentWorkspaces) |ws| {
                if (ws.id == i) break :blk true;
            }
            break :blk false;
        };

        utils.toggleClassnameForWidget(label, "active", active);
        utils.toggleClassnameForWidget(label, "occupied", occupied);
    }
    return true;
}

pub fn workspaces(allocator: std.mem.Allocator) !*Box {
    const hbox = Box.new(.horizontal, 5);
    const whbox = hbox.into(Widget);
    whbox.addCssClass("workspaces");

    const hyprland_workspaces = try hyprland.Workspaces.init(allocator);
    defer hyprland_workspaces.deinit();
    currentWorkspaceId = (try hyprland_workspaces.getCurrent()).id;
    currentWorkspaces = try hyprland_workspaces.get();

    const ws_thread = try std.Thread.spawn(.{}, shouldUpdateWorkspacesThread, .{});
    ws_thread.detach();

    for (0..7) |i| {
        const label = Label.new(" ");
        const wlabel = label.into(Widget);
        wlabel.addCssClass("wlabel");
        labels[i] = wlabel;
        hbox.append(wlabel);
    }

    _ = checkForWorkspaceChanges();
    _ = glib.idleAdd(glib.PRIORITY_LOW, .init(checkForWorkspaceChanges, .{}));

    return hbox;
}

const gtk = @import("gtk");
const std = @import("std");

const utils = @import("../utils.zig");
const hyprland = @import("../services/hyprland/hyprland.zig");

const Box = gtk.Box;
const Label = gtk.Label;
const Widget = gtk.Widget;

var lastActiveWorkspace: hyprland.Workspace = undefined;
var currentWorkspaces: []hyprland.Workspace = undefined;
var shouldUpdateWorkspaces = true;
var mutex = std.Thread.Mutex{};

/// this function should be run on new thread
/// when workspace is updated, it sets the [lastactiveWorkspace, currentWorkspaces] vars
/// and sets shouldUpdateWorkspaces to true
fn shouldUpdateWorkspacesThread(hyprland_ws: hyprland.Workspaces) !void {
    var current_ws = hyprland_ws.getCurrent() catch @panic("failed to get current ws");
    while (true) {
        const new_current_ws = try hyprland_ws.getCurrent();
        if (new_current_ws.id != current_ws.id) {
            current_ws = new_current_ws;
            mutex.lock();
            defer mutex.unlock();
            lastActiveWorkspace = current_ws;
            currentWorkspaces = try hyprland_ws.get();
            shouldUpdateWorkspaces = true;
        }
        std.time.sleep(50 * std.time.ns_per_ms);
    }
}

fn checkForWorkspaceChanges(labels: []*Widget) bool {
    mutex.lock();
    defer mutex.unlock();
    std.time.sleep(1 * std.time.ns_per_ms);
    if (shouldUpdateWorkspaces) {
        shouldUpdateWorkspaces = false;
        for (labels, 1..) |label, i| {
            const active = lastActiveWorkspace.id == i;
            const occupied = blk: {
                for (currentWorkspaces) |ws| {
                    if (ws.id == i) break :blk true;
                }
                break :blk false;
            };

            utils.toggleClassnameForWidget(label, "active", active);
            utils.toggleClassnameForWidget(label, "occupied", occupied);
        }
    }

    return true;
}

pub fn workspaces(allocator: std.mem.Allocator) !*Box {
    const hbox = Box.new(.horizontal, 5);
    const whbox = hbox.into(Widget);
    whbox.addCssClass("workspaces");

    const hyprland_workspaces = hyprland.Workspaces.init(allocator);
    lastActiveWorkspace = try hyprland_workspaces.getCurrent();
    currentWorkspaces = try hyprland_workspaces.get();

    const ws_thread = try std.Thread.spawn(.{}, shouldUpdateWorkspacesThread, .{hyprland_workspaces});
    ws_thread.detach();

    var labels: [7]*Widget = undefined;
    for (0..7) |i| {
        const label = Label.new(" ");
        const wlabel = label.into(Widget);
        wlabel.addCssClass("wlabel");
        labels[i] = wlabel;
        hbox.append(wlabel);
    }

    _ = checkForWorkspaceChanges(&labels);
    _ = gtk.glib.idleAdd(gtk.glib.PRIORITY_LOW, checkForWorkspaceChanges, .{allocator.dupe(*Widget, &labels) catch @panic("")});

    return hbox;
}

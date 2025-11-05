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
        var reader = stream.reader(&buf);
        const interface = reader.interface();
        _ = try interface.readSliceShort(&buf);
        const wsevent_index = std.mem.indexOf(u8, &buf, "workspace>>") orelse 0;
        std.debug.print("workspace changed!!! \"{any}\"\n", .{buf[wsevent_index + 11 .. wsevent_index + 12]});
        // const index = std.mem.indexOf(u8, &buf, ">>").? + 2;
        // TODO: use channels
        {
            mutex.lock();
            defer mutex.unlock();
            currentWorkspaceId = try std.fmt.parseInt(i32, buf[wsevent_index + 11 .. wsevent_index + 12], 10);
            std.debug.print("workspace id: {d}", .{currentWorkspaceId});
            currentWorkspaces = try hyprland_ws.get();
            // what idiot put this here
            // defer hyprland_ws.allocator.free(currentWorkspaces);
            shouldUpdateWorkspaces = true;
            std.debug.print("updated workspaces", .{});
            // if (buf[0] != 170) {
            //     std.debug.print("{any}\n", .{buf});
            // }
        }
        std.Thread.sleep(100 * std.time.ns_per_ms);
    }
}

fn checkForWorkspaceChanges() bool {
    std.Thread.sleep(10 * std.time.ns_per_ms);
    mutex.lock();
    defer mutex.unlock();
    if (!shouldUpdateWorkspaces) return true;

    std.debug.print("labels.len={d}, currentWorkspaces.len={d}\n", .{ labels.len, currentWorkspaces.len });

    shouldUpdateWorkspaces = false;
    for (labels, 1..) |label, i| {
        const wlabel = label.into(Widget);
        const active = currentWorkspaceId == i;
        // _ = label;
        // _ = active;
        var occupied = false;
        std.debug.print("currentWorkspaces ptr={*}, len={d}\n", .{ currentWorkspaces.ptr, currentWorkspaces.len });
        for (currentWorkspaces) |ws| {
            // std.debug.print("{d}, ", .{ws.id});
            if (ws.id == i) {
                occupied = true;
                // std.debug.print("{d}\n", .{ws.id});
                break;
            }
        }
        std.debug.print("cws len: {d}\n", .{currentWorkspaces.len});
        // std.debug.print("updated workspaces", .{});

        utils.toggleClassnameForWidget(wlabel, "active", active);
        utils.toggleClassnameForWidget(wlabel, "occupied", occupied);
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
    // defer {
    //     hyprland_workspaces.allocator.free(currentWorkspaceId);
    //     hyprland_workspaces.allocator.free(currentWorkspaces);
    // }

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

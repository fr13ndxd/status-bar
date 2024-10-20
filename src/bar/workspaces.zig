const gtk = @import("gtk");
const std = @import("std");

const hyprland = @import("../services/hyprland/hyprland.zig");

const Box = gtk.Box;
const Label = gtk.Label;
const Widget = gtk.Widget;

var lastactiveWorkspace: hyprland.Workspace = undefined;

fn checkForWorkspaceChanges(allocator: std.mem.Allocator, labels: []*Label) bool {
    std.time.sleep(50 * std.time.ns_per_ms);
    const newWorkspace = hyprland.Workspaces.getCurrent(allocator) catch @panic("boo");
    if (newWorkspace.id != lastactiveWorkspace.id) {
        lastactiveWorkspace = newWorkspace;
        for (labels, 0..) |label, i| {
            const wlabel = label.into(Widget);
            if (newWorkspace.id == i + 1) {
                wlabel.addCssClass("active");
            } else {
                const ws = hyprland.Workspaces.get(allocator) catch @panic("boobs");
                for (ws) |w| {
                    if (w.id == i + 1) {
                        wlabel.addCssClass("occupied");
                        break;
                    }
                }
                wlabel.removeCssClass("active");
            }
        }
    }
    return true;
}

pub fn workspaces(allocator: std.mem.Allocator) *Box {
    const hbox = Box.new(.horizontal, 5);
    const whbox = hbox.into(Widget);
    whbox.addCssClass("workspaces");
    lastactiveWorkspace = hyprland.Workspaces.getCurrent(allocator) catch @panic("failed to get current ws");
    const currentactiveWorkspace = hyprland.Workspaces.getCurrent(allocator) catch @panic("failed to get current ws");

    var labels: [7]*Label = undefined;
    for (0..7) |i| {
        const label = Label.new(" ");
        const wlabel = label.into(Widget);
        wlabel.addCssClass("wlabel");
        if (i == currentactiveWorkspace.id) {
            wlabel.addCssClass("active");
        }
        labels[i] = label;
        hbox.append(label.into(Widget));
    }

    _ = gtk.glib.idleAdd(gtk.glib.PRIORITY_LOW, checkForWorkspaceChanges, .{ allocator, allocator.dupe(*Label, &labels) catch @panic("") });

    return hbox;
}

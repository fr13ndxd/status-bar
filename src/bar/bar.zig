const gtk = @import("gtk");
const std = @import("std");
const gls = @cImport({
    @cInclude("gtk4-layer-shell/gtk4-layer-shell.h");
});

const workspaces = @import("workspaces.zig");

const Window = gtk.Window;
const Application = gtk.Application;
const ApplicationWindow = gtk.ApplicationWindow;
const gio = gtk.gio;
const GApplication = gio.Application;

pub fn bar(allocator: std.mem.Allocator, app: *GApplication) *Window {
    var window = ApplicationWindow.new(app.tryInto(Application).?).into(Window);
    window.setDefaultSize(1, 30);
    gls.gtk_layer_init_for_window(@ptrCast(window));
    gls.gtk_layer_set_namespace(@ptrCast(window), "status-bar");
    const wwindow = window.into(gtk.Widget);
    wwindow.addCssClass("bar");
    gls.gtk_layer_set_anchor(@ptrCast(window), gls.GTK_LAYER_SHELL_EDGE_TOP, 1);
    gls.gtk_layer_set_anchor(@ptrCast(window), gls.GTK_LAYER_SHELL_EDGE_LEFT, 1);
    gls.gtk_layer_set_anchor(@ptrCast(window), gls.GTK_LAYER_SHELL_EDGE_RIGHT, 1);
    gls.gtk_layer_set_exclusive_zone(@ptrCast(window), 30);

    const workspacesWidget = workspaces.workspaces(allocator) catch @panic("failed to create ws widget");

    window.setChild(workspacesWidget.into(gtk.Widget));

    return window;
}

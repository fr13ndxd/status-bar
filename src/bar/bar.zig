const gtk = @import("gtk");
const std = @import("std");
const gls = @cImport({
    @cInclude("gtk4-layer-shell/gtk4-layer-shell.h");
});

const workspaces = @import("workspaces.zig");
const date_menu = @import("datemenu.zig");
const quicksettings = @import("quicksettings.zig");

const Window = gtk.Window;
const Box = gtk.Box;
const CenterBox = gtk.CenterBox;
const Application = gtk.Application;
const ApplicationWindow = gtk.ApplicationWindow;
const gio = gtk.gio;
const GApplication = gio.Application;

pub fn start(allocator: std.mem.Allocator) *Box {
    const hbox = Box.new(.horizontal, 5);

    const workspaces_widget = workspaces.workspaces(allocator) catch |err| {
        std.debug.print("{}\n", .{err});
        @panic("failed to create ws widget");
    };
    hbox.append(workspaces_widget.into(gtk.Widget));

    return hbox;
}

pub fn center() *Box {
    const hbox = Box.new(.horizontal, 5);

    const dmenu = date_menu.dateMenu() catch @panic("failed to create datemenu button");
    hbox.append(dmenu.into(gtk.Widget));

    return hbox;
}

pub fn end(allocator: std.mem.Allocator) *Box {
    const hbox = Box.new(.horizontal, 5);

    const quicksettings_button = quicksettings.quicksettings(allocator) catch @panic("failed to create quicksettings button");

    hbox.append(quicksettings_button.into(gtk.Widget));
    return hbox;
}

pub fn bar(allocator: std.mem.Allocator, app: *GApplication) ?*Window {
    var window = ApplicationWindow.new(app.tryInto(Application) orelse return null).into(Window);
    window.setDefaultSize(1, 30);

    const gtk_window: [*]gls.GtkWindow = @ptrCast(window);
    gls.gtk_layer_init_for_window(gtk_window);
    gls.gtk_layer_set_namespace(gtk_window, "status-bar");
    const widget = window.into(gtk.Widget);
    widget.addCssClass("bar");

    gls.gtk_layer_set_anchor(gtk_window, gls.GTK_LAYER_SHELL_EDGE_TOP, 1);
    gls.gtk_layer_set_anchor(gtk_window, gls.GTK_LAYER_SHELL_EDGE_LEFT, 1);
    gls.gtk_layer_set_anchor(gtk_window, gls.GTK_LAYER_SHELL_EDGE_RIGHT, 1);
    gls.gtk_layer_set_exclusive_zone(gtk_window, 30);

    const cbox = CenterBox.new();
    cbox.setStartWidget(start(allocator).into(gtk.Widget));
    cbox.setCenterWidget(center().into(gtk.Widget));
    cbox.setEndWidget(end(allocator).into(gtk.Widget));

    window.setChild(cbox.into(gtk.Widget));

    return window;
}

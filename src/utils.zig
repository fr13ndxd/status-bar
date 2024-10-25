const gtk = @import("gtk");

pub fn toggleClassnameForWidget(w: *gtk.Widget, class: [:0]const u8, toggle: bool) void {
    if (toggle) {
        w.addCssClass(class);
    } else {
        w.removeCssClass(class);
    }
}

const std = @import("std");

pub fn loadCss(allocator: std.mem.Allocator) !void {
    const display = gtk.gdk.Display.getDefault().?;
    const provider = gtk.CssProvider.new();
    const argv = [_][]const u8{
        "dart-sass",
        "/home/fr13nd/Desktop/statusbar-zig/style/main.scss",
        "/tmp/statusbar/style.css",
    };
    var child = std.process.Child.init(&argv, allocator);
    child.stdout_behavior = .Ignore;
    child.stderr_behavior = .Ignore;

    try child.spawn();
    _ = try child.wait();

    const path = gtk.gio.File.newForPath("/tmp/statusbar/style.css");
    provider.loadFromFile(path);

    gtk.StyleContext.addProviderForDisplay(display, provider.into(gtk.StyleProvider), gtk.STYLE_PROVIDER_PRIORITY_USER);
}

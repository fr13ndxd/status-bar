const std = @import("std");
const gtk = @import("gtk");

pub fn toggleClassnameForWidget(w: *gtk.Widget, class: [:0]const u8, toggle: bool) void {
    if (toggle) {
        w.addCssClass(class);
    } else {
        w.removeCssClass(class);
    }
}

pub fn loadCss(allocator: std.mem.Allocator) !void {
    const scss_res_path = "/tmp/statusbar/style.css";
    const display = gtk.gdk.Display.getDefault().?;
    const provider = gtk.CssProvider.new();
    const argv = [_][]const u8{
        "dart-sass",
        // TODO: Refactor to use: https://github.com/ziglibs/known-folders
        "/home/fr13nd/Desktop/statusbar-zig/style/main.scss",
        scss_res_path,
    };

    var child = std.process.Child.init(&argv, allocator);
    try child.spawn();
    _ = try child.wait();

    const path = gtk.gio.File.newForPath(scss_res_path);
    provider.loadFromFile(path);

    gtk.StyleContext.addProviderForDisplay(display, provider.into(gtk.StyleProvider), gtk.STYLE_PROVIDER_PRIORITY_USER);
}

const std = @import("std");
const gtk = @import("gtk");

const css = @embedFile("temp/style.css");

pub fn toggleClassnameForWidget(w: *gtk.Widget, class: [:0]const u8, toggle: bool) void {
    if (toggle) {
        w.addCssClass(class);
    } else {
        w.removeCssClass(class);
    }
}

pub fn loadCss(allocator: std.mem.Allocator) !void {
    _ = allocator;
    const display = gtk.gdk.Display.getDefault().?;
    const provider = gtk.CssProvider.new();

    // provider.loadFromFile(path);
    provider.loadFromString(css);

    gtk.StyleContext.addProviderForDisplay(display, provider.into(gtk.StyleProvider), gtk.STYLE_PROVIDER_PRIORITY_USER);
}

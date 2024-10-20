const std = @import("std");
const gtk = @import("gtk");

const gio = gtk.gio;
const GApplication = gio.Application;
const ApplicationWindow = gtk.ApplicationWindow;
const Application = gtk.Application;
const Window = gtk.Window;

pub const gi_configs: gtk.core.Configs = .{
    .disable_deprecated = false,
};
const bar = @import("bar/bar.zig");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer _ = gpa.deinit();

    var app = Application.new("org.status-bar", .{}).into(GApplication);
    defer app.__call("unref", .{});
    _ = app.connectActivate(activate, .{allocator}, .{});
    _ = app.run(std.os.argv);
}

fn activate(app: *GApplication, allocator: std.mem.Allocator) void {
    const start = std.time.Instant.now() catch @panic("wtf happened");

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

    child.spawn() catch @panic("failed to init css");
    _ = child.wait() catch @panic("failed to init css");

    const path = gtk.gio.File.newForPath("/tmp/statusbar/style.css");
    provider.loadFromFile(path);

    gtk.StyleContext.addProviderForDisplay(display, provider.into(gtk.StyleProvider), gtk.STYLE_PROVIDER_PRIORITY_USER);

    const statusbar = bar.bar(allocator, app);
    statusbar.present();

    const end = std.time.Instant.now() catch @panic("wtf happened");
    std.log.info("Bar loaded in {d}ms\n", .{end.since(start) / std.time.ns_per_ms});
}

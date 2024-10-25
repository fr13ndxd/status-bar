const std = @import("std");
const gtk = @import("gtk");
const utils = @import("utils.zig");

const stdout = std.io.getStdOut().writer();

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

    utils.loadCss(allocator) catch @panic("failed to load css");
    const statusbar = bar.bar(allocator, app);
    statusbar.present();

    const end = std.time.Instant.now() catch @panic("wtf happened");
    stdout.print("info: Bar loaded in {d}ms\n", .{end.since(start) / std.time.ns_per_ms}) catch @panic("");
}

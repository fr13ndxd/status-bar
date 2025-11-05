const std = @import("std");
const gi = @import("gi");
const gtk = gi.Gtk;
const utils = @import("utils.zig");

var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

const gio = gi.Gio;
const GApplication = gio.Application;
const ApplicationWindow = gtk.ApplicationWindow;
const Application = gtk.Application;
const Window = gtk.Window;
const Object = gi.GObject.Object;

pub const gi_configs: gtk.core.Configs = .{
    .disable_deprecated = false,
};
const bar = @import("bar/bar.zig");

pub fn main() !void {
    var app = Application.new("org.status-bar", .{}).into(GApplication);
    defer app.into(Object).unref();
    _ = app._signals.activate.connect(.init(activate, .{}), .{});
    // _ = app.connectActivate(activate, .{allocator}, .{});
    const args = std.os.argv;
    _ = app.run(@ptrCast(args));
}

fn activate(app: *GApplication) void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer _ = gpa.deinit();

    const start = std.time.Instant.now() catch @panic("wtf happened");

    utils.loadCss(allocator) catch @panic("failed to load css");
    const status_bar = bar.bar(allocator, app) orelse return;
    status_bar.present();

    const end = std.time.Instant.now() catch @panic("wtf happened");
    stdout.print("info: Bar loaded in {d}ms\n", .{end.since(start) / std.time.ns_per_ms}) catch @panic("");
}

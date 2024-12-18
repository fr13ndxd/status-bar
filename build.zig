const std = @import("std");

pub fn build(b: *std.Build) !void {
    // compile scss
    const argv = [_][]const u8{
        "dart-sass",
        "style/main.scss",
        "temp/style.css",
    };
    var child = std.process.Child.init(&argv, std.heap.page_allocator);
    try child.spawn();
    _ = try child.wait();

    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "status-bar",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    const gtk = b.dependency("gtk", .{});
    exe.root_module.addImport("gtk", gtk.module("gtk"));
    exe.linkSystemLibrary("gtk4-layer-shell");
    exe.linkSystemLibrary("gtk4");

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}

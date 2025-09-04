const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "status-bar",
        // .root_source_file = b.path("src/main.zig"),
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
        // .target = target,
        // .optimize = optimize,
        // .link_libc = true,
    });

    const gtk = b.dependency("gi", .{});
    exe.root_module.addImport("gi", gtk.module("gi"));
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

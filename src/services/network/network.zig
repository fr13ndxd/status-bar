const std = @import("std");

const state = enum { connecting, connected, disconnected };

// TODO: finish this
pub const Network = struct {
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator) Network {
        _ = allocator; // autofix
    }

    pub fn getNetworkStrength() i32 {
        const argv = [_][]const u8{
            "dart-sass",
            // TODO: Refactor to use: https://github.com/ziglibs/known-folders
            "/home/fr13nd/Desktop/statusbar-zig/style/main.scss",
            scss_res_path,
        };

        var child = std.process.Child.init(&argv, allocator);
        try child.spawn();
        _ = try child.wait();

        return 0;
    }
};

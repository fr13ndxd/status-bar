const std = @import("std");
const socketType = enum { socket, socket2 };
pub const Workspace = struct {
    id: i32,
    name: []u8,
    monitor: []u8,
    monitorID: i32,
    windows: i32,
    hasfullscreen: bool,
    lastwindow: []u8,
    lastwindowtitle: []u8,
};

// TODO: make this shit better
pub const Workspaces = struct {
    pub fn getCurrent(allocator: std.mem.Allocator) !Workspace {
        var pathbuf: [100:0]u8 = undefined;
        try getHyprlandSocketPath(pathbuf[0..], .socket);

        const stream = try std.net.connectUnixSocket(&pathbuf);
        defer stream.close();
        _ = try stream.write("j/activeworkspace");

        var buf: [1024]u8 = undefined;
        _ = try stream.readAll(buf[0..]);
        const response = try std.mem.replaceOwned(u8, allocator, &buf, &.{170}, "");
        defer allocator.free(response);

        const parsed = try std.json.parseFromSlice(Workspace, allocator, response, .{ .ignore_unknown_fields = true });
        defer parsed.deinit();

        const workspaces = try allocator.dupe(Workspace, &.{parsed.value});
        defer allocator.free(workspaces);

        return workspaces[0];
    }

    pub fn get(allocator: std.mem.Allocator) ![]Workspace {
        var pathbuf: [100:0]u8 = undefined;
        try getHyprlandSocketPath(pathbuf[0..], .socket);

        const stream = try std.net.connectUnixSocket(&pathbuf);
        defer stream.close();
        _ = try stream.write("j/workspaces");

        var buf: [1024]u8 = undefined;
        _ = try stream.readAll(buf[0..]);
        const response = try std.mem.replaceOwned(u8, allocator, &buf, &.{170}, "");
        defer allocator.free(response);

        const parsed = try std.json.parseFromSlice([]Workspace, allocator, response, .{ .ignore_unknown_fields = true });
        defer parsed.deinit();

        const workspaces = allocator.dupe(Workspace, parsed.value);

        return workspaces;
    }

    fn getHyprlandSocketPath(buf: []u8, sockettype: socketType) !void {
        const allocator = std.heap.page_allocator;

        var env_map = try std.process.getEnvMap(allocator);
        defer env_map.deinit();

        const his = env_map.get("HYPRLAND_INSTANCE_SIGNATURE") orelse @panic("failed to get hyprland instance signature (is hyprland running?)");
        const xdg_runtime_dir = env_map.get("XDG_RUNTIME_DIR") orelse @panic("failed to get xdg runtime dir");

        // $XDG_RUNTIME_DIR/hypr/[HIS]/.socket.sock
        switch (sockettype) {
            .socket => _ = try std.fmt.bufPrintZ(buf[0..], "{s}/hypr/{s}/.socket.sock", .{ xdg_runtime_dir, his }),
            .socket2 => _ = try std.fmt.bufPrintZ(buf[0..], "{s}/hypr/{s}/.socket2.sock", .{ xdg_runtime_dir, his }),
        }
    }
};

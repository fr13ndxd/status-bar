const std = @import("std");
const socketType = enum { socket, socket2 };
pub const Workspace = struct {
    id: i32,
    name: []u8,
    monitor: []u8,
    monitorID: i32,
    windows: i32,
    lastwindow: []u8,
    hasfullscreen: bool,
    lastwindowtitle: []u8,
};

pub const Workspaces = struct {
    allocator: std.mem.Allocator,
    socketpath: [:0]const u8,

    pub fn init(allocator: std.mem.Allocator) !Workspaces {
        const socketpath = try getHyprlandSocketPath(allocator, .socket);
        return .{ .allocator = allocator, .socketpath = socketpath };
    }

    pub fn deinit(self: Workspaces) void {
        self.allocator.free(self.socketpath);
    }

    pub fn getCurrent(self: Workspaces) !Workspace {
        const stream = try std.net.connectUnixSocket(self.socketpath);
        _ = try stream.write("j/activeworkspace");

        var buf: [1024]u8 = undefined;
        // j/workspaces has some '170' bytes at the end (they are not needed)
        const active_workspace = try stream.reader().readUntilDelimiterOrEof(buf[0..], 170) orelse return error.NothingRead;

        const parsed = try std.json.parseFromSlice(Workspace, self.allocator, active_workspace, .{ .ignore_unknown_fields = true });
        defer parsed.deinit();

        return parsed.value;
    }

    pub fn get(self: Workspaces) ![]Workspace {
        const stream = try std.net.connectUnixSocket(self.socketpath);
        _ = try stream.write("j/workspaces");

        var buf: [1024]u8 = undefined;
        // j/activeworkspace has some '170' bytes at the end (they are not needed)
        const active_workspace = try stream.reader().readUntilDelimiterOrEof(buf[0..], 170) orelse return error.NoActiveWorkspace;

        const parsed = try std.json.parseFromSlice([]Workspace, self.allocator, active_workspace, .{ .ignore_unknown_fields = true });
        defer parsed.deinit();

        // if not, general protection err
        const workspaces = self.allocator.dupe(Workspace, parsed.value);

        return workspaces;
    }

    pub fn getHyprlandSocketPath(allocator: std.mem.Allocator, sockettype: socketType) ![:0]u8 {
        var env_map = try std.process.getEnvMap(allocator);
        defer env_map.deinit();

        const his = env_map.get("HYPRLAND_INSTANCE_SIGNATURE") orelse return error.HyprlandInstanceSignatureFail;
        const xdg_runtime_dir = env_map.get("XDG_RUNTIME_DIR") orelse return error.XdgRuntimeFail;

        // $XDG_RUNTIME_DIR/hypr/[HIS]/.socket.sock
        const path = switch (sockettype) {
            .socket => try std.fmt.allocPrintZ(allocator, "{s}/hypr/{s}/.socket.sock", .{ xdg_runtime_dir, his }),
            .socket2 => try std.fmt.allocPrintZ(allocator, "{s}/hypr/{s}/.socket2.sock", .{ xdg_runtime_dir, his }),
        };

        return path;
    }
};

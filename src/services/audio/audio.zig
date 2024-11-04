const std = @import("std");

pub const Audio = struct {
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator) Audio {
        return .{ .allocator = allocator };
    }

    pub fn getAudioIcon(self: Audio) ![:0]const u8 {
        const is_muted = try self.isMuted();
        if (is_muted) return "audio-volume-muted-symbolic";

        const volume = try self.getVolume();
        return switch (volume) {
            1...34 => "audio-volume-low-symbolic",
            35...67 => "audio-volume-medium-symbolic",
            68...100 => "audio-volume-overamplified-symbolic",
            else => "audio-volume-muted-symbolic",
        };
    }

    pub fn isMuted(self: Audio) !bool {
        const argv = [_][]const u8{ "pactl", "get-sink-mute", "@DEFAULT_SINK@" };
        const result = try std.process.Child.run(.{
            .allocator = self.allocator,
            .argv = &argv,
        });
        const stdout = result.stdout;

        return std.mem.indexOf(u8, stdout, "yes") != null;
    }

    pub fn getVolume(self: Audio) !i32 {
        const argv = [_][]const u8{ "pactl", "get-sink-volume", "@DEFAULT_SINK@" };
        const result = try std.process.Child.run(.{
            .allocator = self.allocator,
            .argv = &argv,
        });
        var stdout = result.stdout;

        const index = std.mem.indexOfScalar(u8, stdout, '%') orelse return 0;

        // stdout[index-3..index+1] == "xx%" volume
        const res = std.mem.trim(u8, stdout[index - 3 .. index + 1], " _%");

        return try std.fmt.parseInt(i32, res, 10);
    }
};

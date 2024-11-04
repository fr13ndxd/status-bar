const std = @import("std");

const state = enum { connecting, connected, disconnected, unknown };

// TODO: finish this
pub const Network = struct {
    allocator: std.mem.Allocator,

    pub fn init(allocator: std.mem.Allocator) Network {
        return .{ .allocator = allocator };
    }

    // internal const string ICON_EXCELLENT = "network-wireless-signal-excellent-symbolic";
    // internal const string ICON_OK = "network-wireless-signal-ok-symbolic";
    // internal const string ICON_GOOD = "network-wireless-signal-good-symbolic";
    // internal const string ICON_WEAK = "network-wireless-signal-weak-symbolic";
    // internal const string ICON_NONE = "network-wireless-signal-none-symbolic";
    // internal const string ICON_CONNECTED = "network-wireless-connected-symbolic";
    // internal const string ICON_DISABLED = "network-wireless-disabled-symbolic";
    // internal const string ICON_OFFLINE = "network-wireless-offline-symbolic";
    // internal const string ICON_NO_ROUTE = "network-wireless-no-route-symbolic";
    // internal const string ICON_HOTSPOT = "network-wireless-hotspot-symbolic";

    pub fn getNetworkIcon(self: Network) ![:0]const u8 {
        const network_state = try self.getNetworkState();
        const result = switch (network_state) {
            .connecting => {
                return "network-wireless-acquiring-symbolic";
            },
            .connected => {
                const network_strength = try self.getNetworkStrength();
                return switch (network_strength) {
                    0...20 => "network-wireless-signal-none-symbolic",
                    21...40 => "network-wireless-signal-weak-symbolic",
                    41...60 => "network-wireless-signal-ok-symbolic",
                    61...80 => "network-wireless-signal-good-symbolic",
                    81...100 => "network-wireless-signal-excellent-symbolic",
                    else => "network-wireless-off-symbolic",
                };
            },
            .disconnected => {
                return "network-wireless-offline-symbolic";
            },
            else => return "network-wireless-unknown-symbolic",
        };

        return result;
    }

    pub fn getNetworkState(self: Network) !state {
        const argv = [_][]const u8{ "nmcli", "-e", "no", "-c", "no", "-t", "-f", "STATE", "general" };
        const result = try std.process.Child.run(.{
            .allocator = self.allocator,
            .argv = &argv,
        });
        const stdout = result.stdout;

        if (std.mem.eql(u8, stdout, "connected\n")) return state.connected;
        if (std.mem.eql(u8, stdout, "connecting\n")) return state.connecting;
        if (std.mem.eql(u8, stdout, "disconnected\n")) return state.disconnected;
        return state.unknown;
    }

    pub fn getNetworkStrength(self: Network) !i32 {
        const argv = [_][]const u8{ "nmcli", "-e", "no", "-c", "no", "-t", "-f", "IN-USE,SSID,SIGNAL", "dev", "wifi" };
        const result = try std.process.Child.run(.{
            .allocator = self.allocator,
            .argv = &argv,
        });

        var stdout = result.stdout;

        if (std.mem.indexOfScalar(u8, result.stdout, '*')) |star_index| {
            stdout = stdout[star_index + 2 ..];
            const newline_index = std.mem.indexOfScalar(u8, stdout[0..], 10).?;
            stdout = stdout[0..newline_index];

            var split = std.mem.splitScalar(u8, stdout, ':');
            _ = split.next();
            const network_strength = split.next().?;

            const network_strength_int = try std.fmt.parseInt(i32, network_strength, 10);

            return network_strength_int;
        }

        return 0;
    }
};

const core = @import("core.zig");
const GLib = @import("GLib.zig");
const GModule = @This();
pub const MODULE_IMPL_AR = 7;
pub const MODULE_IMPL_DL = 1;
pub const MODULE_IMPL_NONE = 0;
pub const MODULE_IMPL_WIN32 = 3;
pub const Module = opaque {
    pub fn close(self: *Module) bool {
        const cFn = @extern(*const fn (*Module) callconv(.c) bool, .{ .name = "g_module_close" });
        const ret = cFn(self);
        return ret;
    }
    pub fn makeResident(self: *Module) void {
        const cFn = @extern(*const fn (*Module) callconv(.c) void, .{ .name = "g_module_make_resident" });
        const ret = cFn(self);
        return ret;
    }
    pub fn name(self: *Module) [*:0]u8 {
        const cFn = @extern(*const fn (*Module) callconv(.c) [*:0]u8, .{ .name = "g_module_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn symbol(self: *Module, arg_symbol_name: [*:0]const u8) struct {
        ret: bool,
        symbol: ?*anyopaque,
    } {
        var argO_symbol: *anyopaque = undefined;
        const arg_symbol: *anyopaque = &argO_symbol;
        const cFn = @extern(*const fn (*Module, [*:0]const u8, *anyopaque) callconv(.c) bool, .{ .name = "g_module_symbol" });
        const ret = cFn(self, arg_symbol_name, @ptrCast(arg_symbol));
        return .{ .ret = ret, .symbol = argO_symbol };
    }
    pub fn buildPath(arg_directory: ?[*:0]const u8, arg_module_name: [*:0]const u8) [*:0]u8 {
        const cFn = @extern(*const fn (?[*:0]const u8, [*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_module_build_path" });
        const ret = cFn(arg_directory, arg_module_name);
        return ret;
    }
    pub fn @"error"() [*:0]u8 {
        const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_module_error" });
        const ret = cFn();
        return ret;
    }
    pub fn errorQuark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_module_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn supported() bool {
        const cFn = @extern(*const fn () callconv(.c) bool, .{ .name = "g_module_supported" });
        const ret = cFn();
        return ret;
    }
};
pub const ModuleCheckInit = *const fn (arg_module: *Module) callconv(.c) [*:0]u8;
pub const ModuleError = enum(u32) {
    failed = 0,
    check_failed = 1,
};
pub const ModuleFlags = packed struct(u32) {
    lazy: bool = false,
    local: bool = false,
    _: u30 = 0,
    pub const mask: @This() = @bitCast(@as(u32, 3));
};
pub const ModuleUnload = *const fn (arg_module: *Module) callconv(.c) void;
pub fn moduleBuildPath(arg_directory: ?[*:0]const u8, arg_module_name: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn (?[*:0]const u8, [*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_module_build_path" });
    const ret = cFn(arg_directory, arg_module_name);
    return ret;
}
pub fn moduleError() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_module_error" });
    const ret = cFn();
    return ret;
}
pub fn moduleErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_module_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn moduleSupported() bool {
    const cFn = @extern(*const fn () callconv(.c) bool, .{ .name = "g_module_supported" });
    const ret = cFn();
    return ret;
}

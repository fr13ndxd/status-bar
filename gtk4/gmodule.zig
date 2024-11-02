// This file is auto-generated by zig-gir-ffi
const gmodule = @This();
pub const glib = @import("glib");
pub const core = @import("core");
const std = @import("std");
const config = core.config;
/// const [MODULE_IMPL_AR](https://docs.gtk.org/gmodule/const.MODULE_IMPL_AR.html)
pub const MODULE_IMPL_AR = 7;
/// const [MODULE_IMPL_DL](https://docs.gtk.org/gmodule/const.MODULE_IMPL_DL.html)
pub const MODULE_IMPL_DL = 1;
/// const [MODULE_IMPL_NONE](https://docs.gtk.org/gmodule/const.MODULE_IMPL_NONE.html)
pub const MODULE_IMPL_NONE = 0;
/// const [MODULE_IMPL_WIN32](https://docs.gtk.org/gmodule/const.MODULE_IMPL_WIN32.html)
pub const MODULE_IMPL_WIN32 = 3;
/// Struct [Module](https://docs.gtk.org/gmodule/struct.Module.html)
pub const Module = opaque {
    /// method [close](https://docs.gtk.org/gmodule/method.Module.close.html)
    pub fn close(self: *Module) bool {
        const cFn = @extern(*const fn (*Module) callconv(.c) bool, .{ .name = "g_module_close" });
        const ret = cFn(self);
        return ret;
    }
    /// method [make_resident](https://docs.gtk.org/gmodule/method.Module.make_resident.html)
    pub fn makeResident(self: *Module) void {
        const cFn = @extern(*const fn (*Module) callconv(.c) void, .{ .name = "g_module_make_resident" });
        const ret = cFn(self);
        return ret;
    }
    /// method [name](https://docs.gtk.org/gmodule/method.Module.name.html)
    pub fn name(self: *Module) [*:0]u8 {
        const cFn = @extern(*const fn (*Module) callconv(.c) [*:0]u8, .{ .name = "g_module_name" });
        const ret = cFn(self);
        return ret;
    }
    /// method [symbol](https://docs.gtk.org/gmodule/method.Module.symbol.html)
    pub fn symbol(self: *Module, _symbol_name: [*:0]const u8) struct {
        ret: bool,
        symbol: ?*anyopaque,
    } {
        var symbol_out: ?*anyopaque = undefined;
        const _symbol = &symbol_out;
        const cFn = @extern(*const fn (*Module, [*:0]const u8, *anyopaque) callconv(.c) bool, .{ .name = "g_module_symbol" });
        const ret = cFn(self, _symbol_name, @ptrCast(_symbol));
        return .{ .ret = ret, .symbol = symbol_out };
    }
    /// Deprecated:
    /// type func [build_path](https://docs.gtk.org/gmodule/type_func.Module.build_path.html)
    pub const buildPath = if (config.disable_deprecated) core.Deprecated else struct {
        pub fn buildPath(_directory: ?[*:0]const u8, _module_name: [*:0]const u8) [*:0]u8 {
            const cFn = @extern(*const fn (?[*:0]const u8, [*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_module_build_path" });
            const ret = cFn(_directory, _module_name);
            return ret;
        }
    }.buildPath;
    /// type func [error](https://docs.gtk.org/gmodule/type_func.Module.error.html)
    pub fn @"error"() [*:0]u8 {
        const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_module_error" });
        const ret = cFn();
        return ret;
    }
    /// type func [error_quark](https://docs.gtk.org/gmodule/type_func.Module.error_quark.html)
    pub fn errorQuark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_module_error_quark" });
        const ret = cFn();
        return ret;
    }
    /// type func [supported](https://docs.gtk.org/gmodule/type_func.Module.supported.html)
    pub fn supported() bool {
        const cFn = @extern(*const fn () callconv(.c) bool, .{ .name = "g_module_supported" });
        const ret = cFn();
        return ret;
    }
};
/// callback [ModuleCheckInit](https://docs.gtk.org/gmodule/callback.ModuleCheckInit.html)
pub const ModuleCheckInit = *const fn (_module: *gmodule.Module) callconv(.c) [*:0]u8;
/// Error [ModuleError](https://docs.gtk.org/gmodule/error.ModuleError.html)
pub const ModuleError = enum(u32) {
    failed = 0,
    check_failed = 1,
};
/// Flags [ModuleFlags](https://docs.gtk.org/gmodule/flags.ModuleFlags.html)
pub const ModuleFlags = packed struct(u32) {
    lazy: bool = false,
    local: bool = false,
    _: u30 = 0,
    pub const mask: @This() = @bitCast(@as(u32, 3));
};
/// callback [ModuleUnload](https://docs.gtk.org/gmodule/callback.ModuleUnload.html)
pub const ModuleUnload = *const fn (_module: *gmodule.Module) callconv(.c) void;
/// Deprecated:
/// func [module_build_path](https://docs.gtk.org/gmodule/func.module_build_path.html)
pub const moduleBuildPath = if (config.disable_deprecated) core.Deprecated else struct {
    pub fn moduleBuildPath(_directory: ?[*:0]const u8, _module_name: [*:0]const u8) [*:0]u8 {
        const cFn = @extern(*const fn (?[*:0]const u8, [*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_module_build_path" });
        const ret = cFn(_directory, _module_name);
        return ret;
    }
}.moduleBuildPath;
/// func [module_error](https://docs.gtk.org/gmodule/func.module_error.html)
pub fn moduleError() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_module_error" });
    const ret = cFn();
    return ret;
}
/// func [module_error_quark](https://docs.gtk.org/gmodule/func.module_error_quark.html)
pub fn moduleErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_module_error_quark" });
    const ret = cFn();
    return ret;
}
/// func [module_supported](https://docs.gtk.org/gmodule/func.module_supported.html)
pub fn moduleSupported() bool {
    const cFn = @extern(*const fn () callconv(.c) bool, .{ .name = "g_module_supported" });
    const ret = cFn();
    return ret;
}
test {
    @setEvalBranchQuota(1_000_000);
    std.testing.refAllDecls(@This());
}
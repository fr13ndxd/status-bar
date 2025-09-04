const core = @import("core.zig");
const PangoCairo = @import("PangoCairo.zig");
const freetype2 = @import("freetype2.zig");
const GLib = @import("GLib.zig");
const GdkPixbuf = @import("GdkPixbuf.zig");
const HarfBuzz = @import("HarfBuzz.zig");
const GModule = @import("GModule.zig");
const cairo = @import("cairo.zig");
const GObject = @import("GObject.zig");
const Pango = @import("Pango.zig");
const Gio = @import("Gio.zig");
const Gdk = @This();
pub const ACTION_ALL = 7;
pub const AnchorHints = packed struct(u32) {
    flip_x: bool = false,
    flip_y: bool = false,
    slide_x: bool = false,
    slide_y: bool = false,
    resize_x: bool = false,
    resize_y: bool = false,
    _: u26 = 0,
    pub const flip: @This() = @bitCast(@as(u32, 3));
    pub const slide: @This() = @bitCast(@as(u32, 12));
    pub const resize: @This() = @bitCast(@as(u32, 48));
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_anchor_hints_get_type" });
        return cFn();
    }
};
pub const AppLaunchContext = struct {
    pub const Parent = Gio.AppLaunchContext;
    _props: struct {
        display: core.Property(Display, "display") = .{},
    },
    pub fn getDisplay(self: *AppLaunchContext) *Display {
        const cFn = @extern(*const fn (*AppLaunchContext) callconv(.c) *Display, .{ .name = "gdk_app_launch_context_get_display" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setDesktop(self: *AppLaunchContext, arg_desktop: i32) void {
        const cFn = @extern(*const fn (*AppLaunchContext, i32) callconv(.c) void, .{ .name = "gdk_app_launch_context_set_desktop" });
        const ret = cFn(self, arg_desktop);
        return ret;
    }
    pub fn setIcon(self: *AppLaunchContext, arg_icon: ?*Gio.Icon) void {
        const cFn = @extern(*const fn (*AppLaunchContext, ?*Gio.Icon) callconv(.c) void, .{ .name = "gdk_app_launch_context_set_icon" });
        const ret = cFn(self, arg_icon);
        return ret;
    }
    pub fn setIconName(self: *AppLaunchContext, arg_icon_name: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*AppLaunchContext, ?[*:0]const u8) callconv(.c) void, .{ .name = "gdk_app_launch_context_set_icon_name" });
        const ret = cFn(self, arg_icon_name);
        return ret;
    }
    pub fn setTimestamp(self: *AppLaunchContext, arg_timestamp: u32) void {
        const cFn = @extern(*const fn (*AppLaunchContext, u32) callconv(.c) void, .{ .name = "gdk_app_launch_context_set_timestamp" });
        const ret = cFn(self, arg_timestamp);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_app_launch_context_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const AxisFlags = packed struct(u32) {
    _0: u1 = 0,
    x: bool = false,
    y: bool = false,
    delta_x: bool = false,
    delta_y: bool = false,
    pressure: bool = false,
    xtilt: bool = false,
    ytilt: bool = false,
    wheel: bool = false,
    distance: bool = false,
    rotation: bool = false,
    slider: bool = false,
    _: u20 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_axis_flags_get_type" });
        return cFn();
    }
};
pub const AxisUse = enum(u32) {
    ignore = 0,
    x = 1,
    y = 2,
    delta_x = 3,
    delta_y = 4,
    pressure = 5,
    xtilt = 6,
    ytilt = 7,
    wheel = 8,
    distance = 9,
    rotation = 10,
    slider = 11,
    last = 12,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_axis_use_get_type" });
        return cFn();
    }
};
pub const BUTTON_MIDDLE = 2;
pub const BUTTON_PRIMARY = 1;
pub const BUTTON_SECONDARY = 3;
pub const ButtonEvent = struct {
    pub const Parent = Event;
    pub fn getButton(self: *ButtonEvent) u32 {
        const cFn = @extern(*const fn (*ButtonEvent) callconv(.c) u32, .{ .name = "gdk_button_event_get_button" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_button_event_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const CURRENT_TIME = 0;
pub const CairoContext = struct {
    pub const Parent = DrawContext;
    pub fn cairoCreate(self: *CairoContext) ?*cairo.Context {
        const cFn = @extern(*const fn (*CairoContext) callconv(.c) ?*cairo.Context, .{ .name = "gdk_cairo_context_cairo_create" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_cairo_context_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const CicpParams = struct {
    pub const Parent = GObject.Object;
    pub const Class = CicpParamsClass;
    _props: struct {
        @"color-primaries": core.Property(u32, "color-primaries") = .{},
        @"matrix-coefficients": core.Property(u32, "matrix-coefficients") = .{},
        range: core.Property(CicpRange, "range") = .{},
        @"transfer-function": core.Property(u32, "transfer-function") = .{},
    },
    pub fn new() *CicpParams {
        const cFn = @extern(*const fn () callconv(.c) *CicpParams, .{ .name = "gdk_cicp_params_new" });
        const ret = cFn();
        return ret;
    }
    pub fn buildColorState(self: *CicpParams, arg_error: *?*GLib.Error) error{GError}!*ColorState {
        const cFn = @extern(*const fn (*CicpParams, *?*GLib.Error) callconv(.c) *ColorState, .{ .name = "gdk_cicp_params_build_color_state" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getColorPrimaries(self: *CicpParams) u32 {
        const cFn = @extern(*const fn (*CicpParams) callconv(.c) u32, .{ .name = "gdk_cicp_params_get_color_primaries" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMatrixCoefficients(self: *CicpParams) u32 {
        const cFn = @extern(*const fn (*CicpParams) callconv(.c) u32, .{ .name = "gdk_cicp_params_get_matrix_coefficients" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRange(self: *CicpParams) CicpRange {
        const cFn = @extern(*const fn (*CicpParams) callconv(.c) CicpRange, .{ .name = "gdk_cicp_params_get_range" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTransferFunction(self: *CicpParams) u32 {
        const cFn = @extern(*const fn (*CicpParams) callconv(.c) u32, .{ .name = "gdk_cicp_params_get_transfer_function" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setColorPrimaries(self: *CicpParams, arg_color_primaries: u32) void {
        const cFn = @extern(*const fn (*CicpParams, u32) callconv(.c) void, .{ .name = "gdk_cicp_params_set_color_primaries" });
        const ret = cFn(self, arg_color_primaries);
        return ret;
    }
    pub fn setMatrixCoefficients(self: *CicpParams, arg_matrix_coefficients: u32) void {
        const cFn = @extern(*const fn (*CicpParams, u32) callconv(.c) void, .{ .name = "gdk_cicp_params_set_matrix_coefficients" });
        const ret = cFn(self, arg_matrix_coefficients);
        return ret;
    }
    pub fn setRange(self: *CicpParams, arg_range: CicpRange) void {
        const cFn = @extern(*const fn (*CicpParams, CicpRange) callconv(.c) void, .{ .name = "gdk_cicp_params_set_range" });
        const ret = cFn(self, arg_range);
        return ret;
    }
    pub fn setTransferFunction(self: *CicpParams, arg_transfer_function: u32) void {
        const cFn = @extern(*const fn (*CicpParams, u32) callconv(.c) void, .{ .name = "gdk_cicp_params_set_transfer_function" });
        const ret = cFn(self, arg_transfer_function);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_cicp_params_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const CicpParamsClass = opaque {};
pub const CicpRange = enum(u32) {
    narrow = 0,
    full = 1,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_cicp_range_get_type" });
        return cFn();
    }
};
pub const Clipboard = struct {
    pub const Parent = GObject.Object;
    _props: struct {
        content: core.Property(ContentProvider, "content") = .{},
        display: core.Property(Display, "display") = .{},
        formats: core.Property(ContentFormats, "formats") = .{},
        local: core.Property(bool, "local") = .{},
    },
    _signals: struct {
        changed: core.Signal(fn (*Clipboard) void, "changed") = .{},
    },
    pub fn getContent(self: *Clipboard) ?*ContentProvider {
        const cFn = @extern(*const fn (*Clipboard) callconv(.c) ?*ContentProvider, .{ .name = "gdk_clipboard_get_content" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDisplay(self: *Clipboard) *Display {
        const cFn = @extern(*const fn (*Clipboard) callconv(.c) *Display, .{ .name = "gdk_clipboard_get_display" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFormats(self: *Clipboard) *ContentFormats {
        const cFn = @extern(*const fn (*Clipboard) callconv(.c) *ContentFormats, .{ .name = "gdk_clipboard_get_formats" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isLocal(self: *Clipboard) bool {
        const cFn = @extern(*const fn (*Clipboard) callconv(.c) bool, .{ .name = "gdk_clipboard_is_local" });
        const ret = cFn(self);
        return ret;
    }
    pub fn readAsync(self: *Clipboard, arg_mime_types: [*]?[*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Gio.Cancellable, argC_callback: core.Closure(?Gio.AsyncReadyCallback)) void {
        const arg_callback: ?Gio.AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Clipboard, [*]?[*:0]const u8, i32, ?*Gio.Cancellable, ?Gio.AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_clipboard_read_async" });
        const ret = cFn(self, arg_mime_types, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn readFinish(self: *Clipboard, arg_result: *Gio.AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: ?*Gio.InputStream,
        out_mime_type: [*:0]u8,
    } {
        var argO_out_mime_type: ?[*:0]u8 = undefined;
        const arg_out_mime_type: ?*[*:0]u8 = &argO_out_mime_type;
        const cFn = @extern(*const fn (*Clipboard, *Gio.AsyncResult, ?*[*:0]u8, *?*GLib.Error) callconv(.c) ?*Gio.InputStream, .{ .name = "gdk_clipboard_read_finish" });
        const ret = cFn(self, arg_result, arg_out_mime_type, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .out_mime_type = argO_out_mime_type };
    }
    pub fn readTextAsync(self: *Clipboard, arg_cancellable: ?*Gio.Cancellable, argC_callback: core.Closure(?Gio.AsyncReadyCallback)) void {
        const arg_callback: ?Gio.AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Clipboard, ?*Gio.Cancellable, ?Gio.AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_clipboard_read_text_async" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn readTextFinish(self: *Clipboard, arg_result: *Gio.AsyncResult, arg_error: *?*GLib.Error) error{GError}!?[*:0]u8 {
        const cFn = @extern(*const fn (*Clipboard, *Gio.AsyncResult, *?*GLib.Error) callconv(.c) ?[*:0]u8, .{ .name = "gdk_clipboard_read_text_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn readTextureAsync(self: *Clipboard, arg_cancellable: ?*Gio.Cancellable, argC_callback: core.Closure(?Gio.AsyncReadyCallback)) void {
        const arg_callback: ?Gio.AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Clipboard, ?*Gio.Cancellable, ?Gio.AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_clipboard_read_texture_async" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn readTextureFinish(self: *Clipboard, arg_result: *Gio.AsyncResult, arg_error: *?*GLib.Error) error{GError}!?*Texture {
        const cFn = @extern(*const fn (*Clipboard, *Gio.AsyncResult, *?*GLib.Error) callconv(.c) ?*Texture, .{ .name = "gdk_clipboard_read_texture_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn readValueAsync(self: *Clipboard, arg_type: core.Type, arg_io_priority: i32, arg_cancellable: ?*Gio.Cancellable, argC_callback: core.Closure(?Gio.AsyncReadyCallback)) void {
        const arg_callback: ?Gio.AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Clipboard, core.Type, i32, ?*Gio.Cancellable, ?Gio.AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_clipboard_read_value_async" });
        const ret = cFn(self, arg_type, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn readValueFinish(self: *Clipboard, arg_result: *Gio.AsyncResult, arg_error: *?*GLib.Error) error{GError}!*GObject.Value {
        const cFn = @extern(*const fn (*Clipboard, *Gio.AsyncResult, *?*GLib.Error) callconv(.c) *GObject.Value, .{ .name = "gdk_clipboard_read_value_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setContent(self: *Clipboard, arg_provider: ?*ContentProvider) bool {
        const cFn = @extern(*const fn (*Clipboard, ?*ContentProvider) callconv(.c) bool, .{ .name = "gdk_clipboard_set_content" });
        const ret = cFn(self, arg_provider);
        return ret;
    }
    pub fn set(self: *Clipboard, arg_value: *GObject.Value) void {
        const cFn = @extern(*const fn (*Clipboard, *GObject.Value) callconv(.c) void, .{ .name = "gdk_clipboard_set_value" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn storeAsync(self: *Clipboard, arg_io_priority: i32, arg_cancellable: ?*Gio.Cancellable, argC_callback: core.Closure(?Gio.AsyncReadyCallback)) void {
        const arg_callback: ?Gio.AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Clipboard, i32, ?*Gio.Cancellable, ?Gio.AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_clipboard_store_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn storeFinish(self: *Clipboard, arg_result: *Gio.AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Clipboard, *Gio.AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_clipboard_store_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_clipboard_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ColorState = opaque {
    pub fn createCicpParams(self: *ColorState) ?*CicpParams {
        const cFn = @extern(*const fn (*ColorState) callconv(.c) ?*CicpParams, .{ .name = "gdk_color_state_create_cicp_params" });
        const ret = cFn(self);
        return ret;
    }
    pub fn equal(self: *ColorState, arg_other: *ColorState) bool {
        const cFn = @extern(*const fn (*ColorState, *ColorState) callconv(.c) bool, .{ .name = "gdk_color_state_equal" });
        const ret = cFn(self, arg_other);
        return ret;
    }
    pub fn ref(self: *ColorState) *ColorState {
        const cFn = @extern(*const fn (*ColorState) callconv(.c) *ColorState, .{ .name = "gdk_color_state_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *ColorState) void {
        const cFn = @extern(*const fn (*ColorState) callconv(.c) void, .{ .name = "gdk_color_state_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOklab() *ColorState {
        const cFn = @extern(*const fn () callconv(.c) *ColorState, .{ .name = "gdk_color_state_get_oklab" });
        const ret = cFn();
        return ret;
    }
    pub fn getOklch() *ColorState {
        const cFn = @extern(*const fn () callconv(.c) *ColorState, .{ .name = "gdk_color_state_get_oklch" });
        const ret = cFn();
        return ret;
    }
    pub fn getRec2100Linear() *ColorState {
        const cFn = @extern(*const fn () callconv(.c) *ColorState, .{ .name = "gdk_color_state_get_rec2100_linear" });
        const ret = cFn();
        return ret;
    }
    pub fn getRec2100Pq() *ColorState {
        const cFn = @extern(*const fn () callconv(.c) *ColorState, .{ .name = "gdk_color_state_get_rec2100_pq" });
        const ret = cFn();
        return ret;
    }
    pub fn getSrgb() *ColorState {
        const cFn = @extern(*const fn () callconv(.c) *ColorState, .{ .name = "gdk_color_state_get_srgb" });
        const ret = cFn();
        return ret;
    }
    pub fn getSrgbLinear() *ColorState {
        const cFn = @extern(*const fn () callconv(.c) *ColorState, .{ .name = "gdk_color_state_get_srgb_linear" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_color_state_get_type" });
        return cFn();
    }
};
pub const ContentDeserializeFunc = *const fn (arg_deserializer: *ContentDeserializer) callconv(.c) void;
pub const ContentDeserializer = struct {
    pub const Interfaces = [_]type{Gio.AsyncResult};
    pub const Parent = GObject.Object;
    pub fn getCancellable(self: *ContentDeserializer) ?*Gio.Cancellable {
        const cFn = @extern(*const fn (*ContentDeserializer) callconv(.c) ?*Gio.Cancellable, .{ .name = "gdk_content_deserializer_get_cancellable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getGtype(self: *ContentDeserializer) core.Type {
        const cFn = @extern(*const fn (*ContentDeserializer) callconv(.c) core.Type, .{ .name = "gdk_content_deserializer_get_gtype" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInputStream(self: *ContentDeserializer) *Gio.InputStream {
        const cFn = @extern(*const fn (*ContentDeserializer) callconv(.c) *Gio.InputStream, .{ .name = "gdk_content_deserializer_get_input_stream" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMimeType(self: *ContentDeserializer) [*:0]u8 {
        const cFn = @extern(*const fn (*ContentDeserializer) callconv(.c) [*:0]u8, .{ .name = "gdk_content_deserializer_get_mime_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPriority(self: *ContentDeserializer) i32 {
        const cFn = @extern(*const fn (*ContentDeserializer) callconv(.c) i32, .{ .name = "gdk_content_deserializer_get_priority" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTaskData(self: *ContentDeserializer) ?*anyopaque {
        const cFn = @extern(*const fn (*ContentDeserializer) callconv(.c) ?*anyopaque, .{ .name = "gdk_content_deserializer_get_task_data" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUserData(self: *ContentDeserializer) ?*anyopaque {
        const cFn = @extern(*const fn (*ContentDeserializer) callconv(.c) ?*anyopaque, .{ .name = "gdk_content_deserializer_get_user_data" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getValue(self: *ContentDeserializer) *GObject.Value {
        const cFn = @extern(*const fn (*ContentDeserializer) callconv(.c) *GObject.Value, .{ .name = "gdk_content_deserializer_get_value" });
        const ret = cFn(self);
        return ret;
    }
    pub fn returnError(self: *ContentDeserializer, arg_error: *GLib.Error) void {
        const cFn = @extern(*const fn (*ContentDeserializer, *GLib.Error) callconv(.c) void, .{ .name = "gdk_content_deserializer_return_error" });
        const ret = cFn(self, arg_error);
        return ret;
    }
    pub fn returnSuccess(self: *ContentDeserializer) void {
        const cFn = @extern(*const fn (*ContentDeserializer) callconv(.c) void, .{ .name = "gdk_content_deserializer_return_success" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setTaskData(self: *ContentDeserializer, arg_data: ?*anyopaque, arg_notify: GLib.DestroyNotify) void {
        const cFn = @extern(*const fn (*ContentDeserializer, ?*anyopaque, GLib.DestroyNotify) callconv(.c) void, .{ .name = "gdk_content_deserializer_set_task_data" });
        const ret = cFn(self, @ptrCast(arg_data), arg_notify);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_content_deserializer_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ContentFormats = opaque {
    pub fn new(argS_mime_types: [][*:0]const u8) *ContentFormats {
        const arg_mime_types: ?[*][*:0]const u8 = @ptrCast(argS_mime_types);
        const arg_n_mime_types: u32 = @intCast((argS_mime_types).len);
        const cFn = @extern(*const fn (?[*][*:0]const u8, u32) callconv(.c) *ContentFormats, .{ .name = "gdk_content_formats_new" });
        const ret = cFn(arg_mime_types, arg_n_mime_types);
        return ret;
    }
    pub fn newForGtype(arg_type: core.Type) *ContentFormats {
        const cFn = @extern(*const fn (core.Type) callconv(.c) *ContentFormats, .{ .name = "gdk_content_formats_new_for_gtype" });
        const ret = cFn(arg_type);
        return ret;
    }
    pub fn containGtype(self: *ContentFormats, arg_type: core.Type) bool {
        const cFn = @extern(*const fn (*ContentFormats, core.Type) callconv(.c) bool, .{ .name = "gdk_content_formats_contain_gtype" });
        const ret = cFn(self, arg_type);
        return ret;
    }
    pub fn containMimeType(self: *ContentFormats, arg_mime_type: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*ContentFormats, [*:0]const u8) callconv(.c) bool, .{ .name = "gdk_content_formats_contain_mime_type" });
        const ret = cFn(self, arg_mime_type);
        return ret;
    }
    pub fn getGtypes(self: *ContentFormats) []core.Type {
        var argO_n_gtypes: u64 = undefined;
        const arg_n_gtypes: ?*u64 = &argO_n_gtypes;
        const cFn = @extern(*const fn (*ContentFormats, ?*u64) callconv(.c) ?[*]core.Type, .{ .name = "gdk_content_formats_get_gtypes" });
        const ret = cFn(self, arg_n_gtypes);
        return ret[0..@intCast(argO_n_gtypes)];
    }
    pub fn getMimeTypes(self: *ContentFormats) [][*:0]const u8 {
        var argO_n_mime_types: u64 = undefined;
        const arg_n_mime_types: ?*u64 = &argO_n_mime_types;
        const cFn = @extern(*const fn (*ContentFormats, ?*u64) callconv(.c) ?[*]?[*:0]const u8, .{ .name = "gdk_content_formats_get_mime_types" });
        const ret = cFn(self, arg_n_mime_types);
        return ret[0..@intCast(argO_n_mime_types)];
    }
    pub fn isEmpty(self: *ContentFormats) bool {
        const cFn = @extern(*const fn (*ContentFormats) callconv(.c) bool, .{ .name = "gdk_content_formats_is_empty" });
        const ret = cFn(self);
        return ret;
    }
    pub fn match(self: *ContentFormats, arg_second: *ContentFormats) bool {
        const cFn = @extern(*const fn (*ContentFormats, *ContentFormats) callconv(.c) bool, .{ .name = "gdk_content_formats_match" });
        const ret = cFn(self, arg_second);
        return ret;
    }
    pub fn matchGtype(self: *ContentFormats, arg_second: *ContentFormats) core.Type {
        const cFn = @extern(*const fn (*ContentFormats, *ContentFormats) callconv(.c) core.Type, .{ .name = "gdk_content_formats_match_gtype" });
        const ret = cFn(self, arg_second);
        return ret;
    }
    pub fn matchMimeType(self: *ContentFormats, arg_second: *ContentFormats) ?[*:0]u8 {
        const cFn = @extern(*const fn (*ContentFormats, *ContentFormats) callconv(.c) ?[*:0]u8, .{ .name = "gdk_content_formats_match_mime_type" });
        const ret = cFn(self, arg_second);
        return ret;
    }
    pub fn print(self: *ContentFormats, arg_string: *GLib.String) void {
        const cFn = @extern(*const fn (*ContentFormats, *GLib.String) callconv(.c) void, .{ .name = "gdk_content_formats_print" });
        const ret = cFn(self, arg_string);
        return ret;
    }
    pub fn ref(self: *ContentFormats) *ContentFormats {
        const cFn = @extern(*const fn (*ContentFormats) callconv(.c) *ContentFormats, .{ .name = "gdk_content_formats_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn toString(self: *ContentFormats) [*:0]u8 {
        const cFn = @extern(*const fn (*ContentFormats) callconv(.c) [*:0]u8, .{ .name = "gdk_content_formats_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn @"union"(self: *ContentFormats, arg_second: *ContentFormats) *ContentFormats {
        const cFn = @extern(*const fn (*ContentFormats, *ContentFormats) callconv(.c) *ContentFormats, .{ .name = "gdk_content_formats_union" });
        const ret = cFn(self, arg_second);
        return ret;
    }
    pub fn unionDeserializeGtypes(self: *ContentFormats) *ContentFormats {
        const cFn = @extern(*const fn (*ContentFormats) callconv(.c) *ContentFormats, .{ .name = "gdk_content_formats_union_deserialize_gtypes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unionDeserializeMimeTypes(self: *ContentFormats) *ContentFormats {
        const cFn = @extern(*const fn (*ContentFormats) callconv(.c) *ContentFormats, .{ .name = "gdk_content_formats_union_deserialize_mime_types" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unionSerializeGtypes(self: *ContentFormats) *ContentFormats {
        const cFn = @extern(*const fn (*ContentFormats) callconv(.c) *ContentFormats, .{ .name = "gdk_content_formats_union_serialize_gtypes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unionSerializeMimeTypes(self: *ContentFormats) *ContentFormats {
        const cFn = @extern(*const fn (*ContentFormats) callconv(.c) *ContentFormats, .{ .name = "gdk_content_formats_union_serialize_mime_types" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *ContentFormats) void {
        const cFn = @extern(*const fn (*ContentFormats) callconv(.c) void, .{ .name = "gdk_content_formats_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn parse(arg_string: [*:0]const u8) ?*ContentFormats {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*ContentFormats, .{ .name = "gdk_content_formats_parse" });
        const ret = cFn(arg_string);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_content_formats_get_type" });
        return cFn();
    }
};
pub const ContentFormatsBuilder = opaque {
    pub fn new() *ContentFormatsBuilder {
        const cFn = @extern(*const fn () callconv(.c) *ContentFormatsBuilder, .{ .name = "gdk_content_formats_builder_new" });
        const ret = cFn();
        return ret;
    }
    pub fn addFormats(self: *ContentFormatsBuilder, arg_formats: *ContentFormats) void {
        const cFn = @extern(*const fn (*ContentFormatsBuilder, *ContentFormats) callconv(.c) void, .{ .name = "gdk_content_formats_builder_add_formats" });
        const ret = cFn(self, arg_formats);
        return ret;
    }
    pub fn addGtype(self: *ContentFormatsBuilder, arg_type: core.Type) void {
        const cFn = @extern(*const fn (*ContentFormatsBuilder, core.Type) callconv(.c) void, .{ .name = "gdk_content_formats_builder_add_gtype" });
        const ret = cFn(self, arg_type);
        return ret;
    }
    pub fn addMimeType(self: *ContentFormatsBuilder, arg_mime_type: [*:0]const u8) void {
        const cFn = @extern(*const fn (*ContentFormatsBuilder, [*:0]const u8) callconv(.c) void, .{ .name = "gdk_content_formats_builder_add_mime_type" });
        const ret = cFn(self, arg_mime_type);
        return ret;
    }
    pub fn ref(self: *ContentFormatsBuilder) *ContentFormatsBuilder {
        const cFn = @extern(*const fn (*ContentFormatsBuilder) callconv(.c) *ContentFormatsBuilder, .{ .name = "gdk_content_formats_builder_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn toFormats(self: *ContentFormatsBuilder) *ContentFormats {
        const cFn = @extern(*const fn (*ContentFormatsBuilder) callconv(.c) *ContentFormats, .{ .name = "gdk_content_formats_builder_to_formats" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *ContentFormatsBuilder) void {
        const cFn = @extern(*const fn (*ContentFormatsBuilder) callconv(.c) void, .{ .name = "gdk_content_formats_builder_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_content_formats_builder_get_type" });
        return cFn();
    }
};
pub const ContentProvider = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = ContentProviderClass;
    _props: struct {
        formats: core.Property(ContentFormats, "formats") = .{},
        @"storable-formats": core.Property(ContentFormats, "storable-formats") = .{},
    },
    _signals: struct {
        @"content-changed": core.Signal(fn (*ContentProvider) void, "content-changed") = .{},
    },
    parent: GObject.Object,
    pub fn newForBytes(arg_mime_type: [*:0]const u8, arg_bytes: *GLib.Bytes) *ContentProvider {
        const cFn = @extern(*const fn ([*:0]const u8, *GLib.Bytes) callconv(.c) *ContentProvider, .{ .name = "gdk_content_provider_new_for_bytes" });
        const ret = cFn(arg_mime_type, arg_bytes);
        return ret;
    }
    pub fn newForValue(arg_value: *GObject.Value) *ContentProvider {
        const cFn = @extern(*const fn (*GObject.Value) callconv(.c) *ContentProvider, .{ .name = "gdk_content_provider_new_for_value" });
        const ret = cFn(arg_value);
        return ret;
    }
    pub fn newUnion(argS_providers: []*ContentProvider) *ContentProvider {
        const arg_providers: ?[*]*ContentProvider = @ptrCast(argS_providers);
        const arg_n_providers: u64 = @intCast((argS_providers).len);
        const cFn = @extern(*const fn (?[*]*ContentProvider, u64) callconv(.c) *ContentProvider, .{ .name = "gdk_content_provider_new_union" });
        const ret = cFn(arg_providers, arg_n_providers);
        return ret;
    }
    pub fn contentChanged(self: *ContentProvider) void {
        const cFn = @extern(*const fn (*ContentProvider) callconv(.c) void, .{ .name = "gdk_content_provider_content_changed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getValue(self: *ContentProvider, arg_value: *GObject.Value, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*ContentProvider, *GObject.Value, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_content_provider_get_value" });
        const ret = cFn(self, arg_value, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn refFormats(self: *ContentProvider) *ContentFormats {
        const cFn = @extern(*const fn (*ContentProvider) callconv(.c) *ContentFormats, .{ .name = "gdk_content_provider_ref_formats" });
        const ret = cFn(self);
        return ret;
    }
    pub fn refStorableFormats(self: *ContentProvider) *ContentFormats {
        const cFn = @extern(*const fn (*ContentProvider) callconv(.c) *ContentFormats, .{ .name = "gdk_content_provider_ref_storable_formats" });
        const ret = cFn(self);
        return ret;
    }
    pub fn writeMimeTypeAsync(self: *ContentProvider, arg_mime_type: [*:0]const u8, arg_stream: *Gio.OutputStream, arg_io_priority: i32, arg_cancellable: ?*Gio.Cancellable, argC_callback: core.Closure(?Gio.AsyncReadyCallback)) void {
        const arg_callback: ?Gio.AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*ContentProvider, [*:0]const u8, *Gio.OutputStream, i32, ?*Gio.Cancellable, ?Gio.AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_content_provider_write_mime_type_async" });
        const ret = cFn(self, arg_mime_type, arg_stream, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn writeMimeTypeFinish(self: *ContentProvider, arg_result: *Gio.AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*ContentProvider, *Gio.AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_content_provider_write_mime_type_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_content_provider_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ContentProviderClass = extern struct {
    parent_class: GObject.ObjectClass,
    content_changed: ?*const fn (arg_provider: *ContentProvider) callconv(.c) void,
    attach_clipboard: ?*const fn (arg_provider: *ContentProvider, arg_clipboard: *Clipboard) callconv(.c) void,
    detach_clipboard: ?*const fn (arg_provider: *ContentProvider, arg_clipboard: *Clipboard) callconv(.c) void,
    ref_formats: ?*const fn (arg_provider: *ContentProvider) callconv(.c) *ContentFormats,
    ref_storable_formats: ?*const fn (arg_provider: *ContentProvider) callconv(.c) *ContentFormats,
    write_mime_type_async: ?*const fn (arg_provider: *ContentProvider, arg_mime_type: [*:0]const u8, arg_stream: *Gio.OutputStream, arg_io_priority: i32, arg_cancellable: ?*Gio.Cancellable, arg_callback: ?Gio.AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    write_mime_type_finish: ?*const fn (arg_provider: *ContentProvider, arg_result: *Gio.AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    get_value: ?*const fn (arg_provider: *ContentProvider, arg_value: *GObject.Value, arg_error: *?*GLib.Error) callconv(.c) bool,
    padding: [8]?*anyopaque,
};
pub const ContentSerializeFunc = *const fn (arg_serializer: *ContentSerializer) callconv(.c) void;
pub const ContentSerializer = struct {
    pub const Interfaces = [_]type{Gio.AsyncResult};
    pub const Parent = GObject.Object;
    pub fn getCancellable(self: *ContentSerializer) ?*Gio.Cancellable {
        const cFn = @extern(*const fn (*ContentSerializer) callconv(.c) ?*Gio.Cancellable, .{ .name = "gdk_content_serializer_get_cancellable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getGtype(self: *ContentSerializer) core.Type {
        const cFn = @extern(*const fn (*ContentSerializer) callconv(.c) core.Type, .{ .name = "gdk_content_serializer_get_gtype" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMimeType(self: *ContentSerializer) [*:0]u8 {
        const cFn = @extern(*const fn (*ContentSerializer) callconv(.c) [*:0]u8, .{ .name = "gdk_content_serializer_get_mime_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOutputStream(self: *ContentSerializer) *Gio.OutputStream {
        const cFn = @extern(*const fn (*ContentSerializer) callconv(.c) *Gio.OutputStream, .{ .name = "gdk_content_serializer_get_output_stream" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPriority(self: *ContentSerializer) i32 {
        const cFn = @extern(*const fn (*ContentSerializer) callconv(.c) i32, .{ .name = "gdk_content_serializer_get_priority" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTaskData(self: *ContentSerializer) ?*anyopaque {
        const cFn = @extern(*const fn (*ContentSerializer) callconv(.c) ?*anyopaque, .{ .name = "gdk_content_serializer_get_task_data" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUserData(self: *ContentSerializer) ?*anyopaque {
        const cFn = @extern(*const fn (*ContentSerializer) callconv(.c) ?*anyopaque, .{ .name = "gdk_content_serializer_get_user_data" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getValue(self: *ContentSerializer) *GObject.Value {
        const cFn = @extern(*const fn (*ContentSerializer) callconv(.c) *GObject.Value, .{ .name = "gdk_content_serializer_get_value" });
        const ret = cFn(self);
        return ret;
    }
    pub fn returnError(self: *ContentSerializer, arg_error: *GLib.Error) void {
        const cFn = @extern(*const fn (*ContentSerializer, *GLib.Error) callconv(.c) void, .{ .name = "gdk_content_serializer_return_error" });
        const ret = cFn(self, arg_error);
        return ret;
    }
    pub fn returnSuccess(self: *ContentSerializer) void {
        const cFn = @extern(*const fn (*ContentSerializer) callconv(.c) void, .{ .name = "gdk_content_serializer_return_success" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setTaskData(self: *ContentSerializer, arg_data: ?*anyopaque, arg_notify: GLib.DestroyNotify) void {
        const cFn = @extern(*const fn (*ContentSerializer, ?*anyopaque, GLib.DestroyNotify) callconv(.c) void, .{ .name = "gdk_content_serializer_set_task_data" });
        const ret = cFn(self, @ptrCast(arg_data), arg_notify);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_content_serializer_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const CrossingEvent = struct {
    pub const Parent = Event;
    pub fn getDetail(self: *CrossingEvent) NotifyType {
        const cFn = @extern(*const fn (*CrossingEvent) callconv(.c) NotifyType, .{ .name = "gdk_crossing_event_get_detail" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFocus(self: *CrossingEvent) bool {
        const cFn = @extern(*const fn (*CrossingEvent) callconv(.c) bool, .{ .name = "gdk_crossing_event_get_focus" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMode(self: *CrossingEvent) CrossingMode {
        const cFn = @extern(*const fn (*CrossingEvent) callconv(.c) CrossingMode, .{ .name = "gdk_crossing_event_get_mode" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_crossing_event_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const CrossingMode = enum(u32) {
    normal = 0,
    grab = 1,
    ungrab = 2,
    gtk_grab = 3,
    gtk_ungrab = 4,
    state_changed = 5,
    touch_begin = 6,
    touch_end = 7,
    device_switch = 8,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_crossing_mode_get_type" });
        return cFn();
    }
};
pub const Cursor = struct {
    pub const Parent = GObject.Object;
    _props: struct {
        fallback: core.Property(Cursor, "fallback") = .{},
        @"hotspot-x": core.Property(i32, "hotspot-x") = .{},
        @"hotspot-y": core.Property(i32, "hotspot-y") = .{},
        name: core.Property([*:0]const u8, "name") = .{},
        texture: core.Property(Texture, "texture") = .{},
    },
    pub fn newFromCallback(argC_callback: core.Closure(CursorGetTextureCallback), arg_fallback: ?*Cursor) ?*Cursor {
        const arg_callback: CursorGetTextureCallback = @ptrCast(argC_callback.callback());
        const arg_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const arg_destroy: GLib.DestroyNotify = @ptrCast(argC_callback.destroy());
        const cFn = @extern(*const fn (CursorGetTextureCallback, ?*anyopaque, GLib.DestroyNotify, ?*Cursor) callconv(.c) ?*Cursor, .{ .name = "gdk_cursor_new_from_callback" });
        const ret = cFn(arg_callback, @ptrCast(arg_data), arg_destroy, arg_fallback);
        return ret;
    }
    pub fn newFromName(arg_name: [*:0]const u8, arg_fallback: ?*Cursor) ?*Cursor {
        const cFn = @extern(*const fn ([*:0]const u8, ?*Cursor) callconv(.c) ?*Cursor, .{ .name = "gdk_cursor_new_from_name" });
        const ret = cFn(arg_name, arg_fallback);
        return ret;
    }
    pub fn newFromTexture(arg_texture: *Texture, arg_hotspot_x: i32, arg_hotspot_y: i32, arg_fallback: ?*Cursor) *Cursor {
        const cFn = @extern(*const fn (*Texture, i32, i32, ?*Cursor) callconv(.c) *Cursor, .{ .name = "gdk_cursor_new_from_texture" });
        const ret = cFn(arg_texture, arg_hotspot_x, arg_hotspot_y, arg_fallback);
        return ret;
    }
    pub fn getFallback(self: *Cursor) ?*Cursor {
        const cFn = @extern(*const fn (*Cursor) callconv(.c) ?*Cursor, .{ .name = "gdk_cursor_get_fallback" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHotspotX(self: *Cursor) i32 {
        const cFn = @extern(*const fn (*Cursor) callconv(.c) i32, .{ .name = "gdk_cursor_get_hotspot_x" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHotspotY(self: *Cursor) i32 {
        const cFn = @extern(*const fn (*Cursor) callconv(.c) i32, .{ .name = "gdk_cursor_get_hotspot_y" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getName(self: *Cursor) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Cursor) callconv(.c) ?[*:0]u8, .{ .name = "gdk_cursor_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTexture(self: *Cursor) ?*Texture {
        const cFn = @extern(*const fn (*Cursor) callconv(.c) ?*Texture, .{ .name = "gdk_cursor_get_texture" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_cursor_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const CursorGetTextureCallback = *const fn (arg_cursor: *Cursor, arg_cursor_size: i32, arg_scale: f64, arg_width: *i32, arg_height: *i32, arg_hotspot_x: *i32, arg_hotspot_y: *i32, arg_data: ?*anyopaque) callconv(.c) ?*Texture;
pub const DNDEvent = struct {
    pub const Parent = Event;
    pub fn getDrop(self: *DNDEvent) ?*Drop {
        const cFn = @extern(*const fn (*DNDEvent) callconv(.c) ?*Drop, .{ .name = "gdk_dnd_event_get_drop" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_dnd_event_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DeleteEvent = struct {
    pub const Parent = Event;
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_delete_event_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const Device = struct {
    pub const Parent = GObject.Object;
    _props: struct {
        @"active-layout-index": core.Property(i32, "active-layout-index") = .{},
        @"caps-lock-state": core.Property(bool, "caps-lock-state") = .{},
        direction: core.Property(Pango.Direction, "direction") = .{},
        display: core.Property(Display, "display") = .{},
        @"has-bidi-layouts": core.Property(bool, "has-bidi-layouts") = .{},
        @"has-cursor": core.Property(bool, "has-cursor") = .{},
        @"layout-names": core.Property([*]?[*:0]const u8, "layout-names") = .{},
        @"modifier-state": core.Property(ModifierType, "modifier-state") = .{},
        @"n-axes": core.Property(u32, "n-axes") = .{},
        name: core.Property([*:0]const u8, "name") = .{},
        @"num-lock-state": core.Property(bool, "num-lock-state") = .{},
        @"num-touches": core.Property(u32, "num-touches") = .{},
        @"product-id": core.Property([*:0]const u8, "product-id") = .{},
        @"scroll-lock-state": core.Property(bool, "scroll-lock-state") = .{},
        seat: core.Property(Seat, "seat") = .{},
        source: core.Property(InputSource, "source") = .{},
        tool: core.Property(DeviceTool, "tool") = .{},
        @"vendor-id": core.Property([*:0]const u8, "vendor-id") = .{},
    },
    _signals: struct {
        changed: core.Signal(fn (*Device) void, "changed") = .{},
        @"tool-changed": core.Signal(fn (*Device, *DeviceTool) void, "tool-changed") = .{},
    },
    pub fn getActiveLayoutIndex(self: *Device) i32 {
        const cFn = @extern(*const fn (*Device) callconv(.c) i32, .{ .name = "gdk_device_get_active_layout_index" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCapsLockState(self: *Device) bool {
        const cFn = @extern(*const fn (*Device) callconv(.c) bool, .{ .name = "gdk_device_get_caps_lock_state" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDeviceTool(self: *Device) ?*DeviceTool {
        const cFn = @extern(*const fn (*Device) callconv(.c) ?*DeviceTool, .{ .name = "gdk_device_get_device_tool" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDirection(self: *Device) Pango.Direction {
        const cFn = @extern(*const fn (*Device) callconv(.c) Pango.Direction, .{ .name = "gdk_device_get_direction" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDisplay(self: *Device) *Display {
        const cFn = @extern(*const fn (*Device) callconv(.c) *Display, .{ .name = "gdk_device_get_display" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHasCursor(self: *Device) bool {
        const cFn = @extern(*const fn (*Device) callconv(.c) bool, .{ .name = "gdk_device_get_has_cursor" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLayoutNames(self: *Device) ?[*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*Device) callconv(.c) ?[*]?[*:0]const u8, .{ .name = "gdk_device_get_layout_names" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getModifierState(self: *Device) ModifierType {
        const cFn = @extern(*const fn (*Device) callconv(.c) ModifierType, .{ .name = "gdk_device_get_modifier_state" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getName(self: *Device) [*:0]u8 {
        const cFn = @extern(*const fn (*Device) callconv(.c) [*:0]u8, .{ .name = "gdk_device_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNumLockState(self: *Device) bool {
        const cFn = @extern(*const fn (*Device) callconv(.c) bool, .{ .name = "gdk_device_get_num_lock_state" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNumTouches(self: *Device) u32 {
        const cFn = @extern(*const fn (*Device) callconv(.c) u32, .{ .name = "gdk_device_get_num_touches" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getProductId(self: *Device) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Device) callconv(.c) ?[*:0]u8, .{ .name = "gdk_device_get_product_id" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getScrollLockState(self: *Device) bool {
        const cFn = @extern(*const fn (*Device) callconv(.c) bool, .{ .name = "gdk_device_get_scroll_lock_state" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSeat(self: *Device) *Seat {
        const cFn = @extern(*const fn (*Device) callconv(.c) *Seat, .{ .name = "gdk_device_get_seat" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSource(self: *Device) InputSource {
        const cFn = @extern(*const fn (*Device) callconv(.c) InputSource, .{ .name = "gdk_device_get_source" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSurfaceAtPosition(self: *Device) struct {
        ret: ?*Surface,
        win_x: f64,
        win_y: f64,
    } {
        var argO_win_x: f64 = undefined;
        const arg_win_x: ?*f64 = &argO_win_x;
        var argO_win_y: f64 = undefined;
        const arg_win_y: ?*f64 = &argO_win_y;
        const cFn = @extern(*const fn (*Device, ?*f64, ?*f64) callconv(.c) ?*Surface, .{ .name = "gdk_device_get_surface_at_position" });
        const ret = cFn(self, arg_win_x, arg_win_y);
        return .{ .ret = ret, .win_x = argO_win_x, .win_y = argO_win_y };
    }
    pub fn getTimestamp(self: *Device) u32 {
        const cFn = @extern(*const fn (*Device) callconv(.c) u32, .{ .name = "gdk_device_get_timestamp" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getVendorId(self: *Device) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Device) callconv(.c) ?[*:0]u8, .{ .name = "gdk_device_get_vendor_id" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hasBidiLayouts(self: *Device) bool {
        const cFn = @extern(*const fn (*Device) callconv(.c) bool, .{ .name = "gdk_device_has_bidi_layouts" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_device_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DevicePad = struct {
    pub const Prerequistes = [_]type{Device};
    pub const Class = DevicePadInterface;
    pub fn getFeatureGroup(self: *DevicePad, arg_feature: DevicePadFeature, arg_feature_idx: i32) i32 {
        const cFn = @extern(*const fn (*DevicePad, DevicePadFeature, i32) callconv(.c) i32, .{ .name = "gdk_device_pad_get_feature_group" });
        const ret = cFn(self, arg_feature, arg_feature_idx);
        return ret;
    }
    pub fn getGroupNModes(self: *DevicePad, arg_group_idx: i32) i32 {
        const cFn = @extern(*const fn (*DevicePad, i32) callconv(.c) i32, .{ .name = "gdk_device_pad_get_group_n_modes" });
        const ret = cFn(self, arg_group_idx);
        return ret;
    }
    pub fn getNFeatures(self: *DevicePad, arg_feature: DevicePadFeature) i32 {
        const cFn = @extern(*const fn (*DevicePad, DevicePadFeature) callconv(.c) i32, .{ .name = "gdk_device_pad_get_n_features" });
        const ret = cFn(self, arg_feature);
        return ret;
    }
    pub fn getNGroups(self: *DevicePad) i32 {
        const cFn = @extern(*const fn (*DevicePad) callconv(.c) i32, .{ .name = "gdk_device_pad_get_n_groups" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_device_pad_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DevicePadFeature = enum(u32) {
    button = 0,
    ring = 1,
    strip = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_device_pad_feature_get_type" });
        return cFn();
    }
};
pub const DevicePadInterface = opaque {};
pub const DeviceTool = struct {
    pub const Parent = GObject.Object;
    _props: struct {
        axes: core.Property(AxisFlags, "axes") = .{},
        @"hardware-id": core.Property(u64, "hardware-id") = .{},
        serial: core.Property(u64, "serial") = .{},
        @"tool-type": core.Property(DeviceToolType, "tool-type") = .{},
    },
    pub fn getAxes(self: *DeviceTool) AxisFlags {
        const cFn = @extern(*const fn (*DeviceTool) callconv(.c) AxisFlags, .{ .name = "gdk_device_tool_get_axes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHardwareId(self: *DeviceTool) u64 {
        const cFn = @extern(*const fn (*DeviceTool) callconv(.c) u64, .{ .name = "gdk_device_tool_get_hardware_id" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSerial(self: *DeviceTool) u64 {
        const cFn = @extern(*const fn (*DeviceTool) callconv(.c) u64, .{ .name = "gdk_device_tool_get_serial" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getToolType(self: *DeviceTool) DeviceToolType {
        const cFn = @extern(*const fn (*DeviceTool) callconv(.c) DeviceToolType, .{ .name = "gdk_device_tool_get_tool_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_device_tool_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DeviceToolType = enum(u32) {
    unknown = 0,
    pen = 1,
    eraser = 2,
    brush = 3,
    pencil = 4,
    airbrush = 5,
    mouse = 6,
    lens = 7,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_device_tool_type_get_type" });
        return cFn();
    }
};
pub const Display = struct {
    pub const Parent = GObject.Object;
    _props: struct {
        composited: core.Property(bool, "composited") = .{},
        @"dmabuf-formats": core.Property(DmabufFormats, "dmabuf-formats") = .{},
        @"input-shapes": core.Property(bool, "input-shapes") = .{},
        rgba: core.Property(bool, "rgba") = .{},
        @"shadow-width": core.Property(bool, "shadow-width") = .{},
    },
    _signals: struct {
        closed: core.Signal(fn (*Display, bool) void, "closed") = .{},
        opened: core.Signal(fn (*Display) void, "opened") = .{},
        @"seat-added": core.Signal(fn (*Display, *Seat) void, "seat-added") = .{},
        @"seat-removed": core.Signal(fn (*Display, *Seat) void, "seat-removed") = .{},
        @"setting-changed": core.Signal(fn (*Display, [*:0]const u8) void, "setting-changed") = .{},
    },
    pub fn getDefault() ?*Display {
        const cFn = @extern(*const fn () callconv(.c) ?*Display, .{ .name = "gdk_display_get_default" });
        const ret = cFn();
        return ret;
    }
    pub fn open(arg_display_name: ?[*:0]const u8) ?*Display {
        const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) ?*Display, .{ .name = "gdk_display_open" });
        const ret = cFn(arg_display_name);
        return ret;
    }
    pub fn beep(self: *Display) void {
        const cFn = @extern(*const fn (*Display) callconv(.c) void, .{ .name = "gdk_display_beep" });
        const ret = cFn(self);
        return ret;
    }
    pub fn close(self: *Display) void {
        const cFn = @extern(*const fn (*Display) callconv(.c) void, .{ .name = "gdk_display_close" });
        const ret = cFn(self);
        return ret;
    }
    pub fn createGlContext(self: *Display, arg_error: *?*GLib.Error) error{GError}!*GLContext {
        const cFn = @extern(*const fn (*Display, *?*GLib.Error) callconv(.c) *GLContext, .{ .name = "gdk_display_create_gl_context" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn deviceIsGrabbed(self: *Display, arg_device: *Device) bool {
        const cFn = @extern(*const fn (*Display, *Device) callconv(.c) bool, .{ .name = "gdk_display_device_is_grabbed" });
        const ret = cFn(self, arg_device);
        return ret;
    }
    pub fn flush(self: *Display) void {
        const cFn = @extern(*const fn (*Display) callconv(.c) void, .{ .name = "gdk_display_flush" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getAppLaunchContext(self: *Display) *AppLaunchContext {
        const cFn = @extern(*const fn (*Display) callconv(.c) *AppLaunchContext, .{ .name = "gdk_display_get_app_launch_context" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getClipboard(self: *Display) *Clipboard {
        const cFn = @extern(*const fn (*Display) callconv(.c) *Clipboard, .{ .name = "gdk_display_get_clipboard" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDefaultSeat(self: *Display) ?*Seat {
        const cFn = @extern(*const fn (*Display) callconv(.c) ?*Seat, .{ .name = "gdk_display_get_default_seat" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDmabufFormats(self: *Display) *DmabufFormats {
        const cFn = @extern(*const fn (*Display) callconv(.c) *DmabufFormats, .{ .name = "gdk_display_get_dmabuf_formats" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMonitorAtSurface(self: *Display, arg_surface: *Surface) ?*Monitor {
        const cFn = @extern(*const fn (*Display, *Surface) callconv(.c) ?*Monitor, .{ .name = "gdk_display_get_monitor_at_surface" });
        const ret = cFn(self, arg_surface);
        return ret;
    }
    pub fn getMonitors(self: *Display) *Gio.ListModel {
        const cFn = @extern(*const fn (*Display) callconv(.c) *Gio.ListModel, .{ .name = "gdk_display_get_monitors" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getName(self: *Display) [*:0]u8 {
        const cFn = @extern(*const fn (*Display) callconv(.c) [*:0]u8, .{ .name = "gdk_display_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPrimaryClipboard(self: *Display) *Clipboard {
        const cFn = @extern(*const fn (*Display) callconv(.c) *Clipboard, .{ .name = "gdk_display_get_primary_clipboard" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSetting(self: *Display, arg_name: [*:0]const u8, arg_value: *GObject.Value) bool {
        const cFn = @extern(*const fn (*Display, [*:0]const u8, *GObject.Value) callconv(.c) bool, .{ .name = "gdk_display_get_setting" });
        const ret = cFn(self, arg_name, arg_value);
        return ret;
    }
    pub fn getStartupNotificationId(self: *Display) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Display) callconv(.c) ?[*:0]u8, .{ .name = "gdk_display_get_startup_notification_id" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isClosed(self: *Display) bool {
        const cFn = @extern(*const fn (*Display) callconv(.c) bool, .{ .name = "gdk_display_is_closed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isComposited(self: *Display) bool {
        const cFn = @extern(*const fn (*Display) callconv(.c) bool, .{ .name = "gdk_display_is_composited" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isRgba(self: *Display) bool {
        const cFn = @extern(*const fn (*Display) callconv(.c) bool, .{ .name = "gdk_display_is_rgba" });
        const ret = cFn(self);
        return ret;
    }
    pub fn listSeats(self: *Display) ?*GLib.List {
        const cFn = @extern(*const fn (*Display) callconv(.c) ?*GLib.List, .{ .name = "gdk_display_list_seats" });
        const ret = cFn(self);
        return ret;
    }
    pub fn mapKeycode(self: *Display, arg_keycode: u32) struct {
        ret: bool,
        keys: ?[]KeymapKey,
        keyvals: ?[]u32,
    } {
        var argO_keys: ?[*]KeymapKey = undefined;
        const arg_keys: ?*[*]KeymapKey = &argO_keys;
        var argO_keyvals: ?[*]u32 = undefined;
        const arg_keyvals: ?*[*]u32 = &argO_keyvals;
        var argO_n_entries: i32 = undefined;
        const arg_n_entries: *i32 = &argO_n_entries;
        const cFn = @extern(*const fn (*Display, u32, ?*[*]KeymapKey, ?*[*]u32, *i32) callconv(.c) bool, .{ .name = "gdk_display_map_keycode" });
        const ret = cFn(self, arg_keycode, arg_keys, arg_keyvals, arg_n_entries);
        return .{ .ret = ret, .keys = argO_keys[0..@intCast(argO_n_entries)], .keyvals = argO_keyvals[0..@intCast(argO_n_entries)] };
    }
    pub fn mapKeyval(self: *Display, arg_keyval: u32) struct {
        ret: bool,
        keys: []KeymapKey,
    } {
        var argO_keys: [*]KeymapKey = undefined;
        const arg_keys: *[*]KeymapKey = &argO_keys;
        var argO_n_keys: i32 = undefined;
        const arg_n_keys: *i32 = &argO_n_keys;
        const cFn = @extern(*const fn (*Display, u32, *[*]KeymapKey, *i32) callconv(.c) bool, .{ .name = "gdk_display_map_keyval" });
        const ret = cFn(self, arg_keyval, arg_keys, arg_n_keys);
        return .{ .ret = ret, .keys = argO_keys[0..@intCast(argO_n_keys)] };
    }
    pub fn notifyStartupComplete(self: *Display, arg_startup_id: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Display, [*:0]const u8) callconv(.c) void, .{ .name = "gdk_display_notify_startup_complete" });
        const ret = cFn(self, arg_startup_id);
        return ret;
    }
    pub fn prepareGl(self: *Display, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Display, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_display_prepare_gl" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn putEvent(self: *Display, arg_event: *Event) void {
        const cFn = @extern(*const fn (*Display, *Event) callconv(.c) void, .{ .name = "gdk_display_put_event" });
        const ret = cFn(self, arg_event);
        return ret;
    }
    pub fn supportsInputShapes(self: *Display) bool {
        const cFn = @extern(*const fn (*Display) callconv(.c) bool, .{ .name = "gdk_display_supports_input_shapes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn supportsShadowWidth(self: *Display) bool {
        const cFn = @extern(*const fn (*Display) callconv(.c) bool, .{ .name = "gdk_display_supports_shadow_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn sync(self: *Display) void {
        const cFn = @extern(*const fn (*Display) callconv(.c) void, .{ .name = "gdk_display_sync" });
        const ret = cFn(self);
        return ret;
    }
    pub fn translateKey(self: *Display, arg_keycode: u32, arg_state: ModifierType, arg_group: i32) struct {
        ret: bool,
        keyval: u32,
        effective_group: i32,
        level: i32,
        consumed: ModifierType,
    } {
        var argO_keyval: u32 = undefined;
        const arg_keyval: ?*u32 = &argO_keyval;
        var argO_effective_group: i32 = undefined;
        const arg_effective_group: ?*i32 = &argO_effective_group;
        var argO_level: i32 = undefined;
        const arg_level: ?*i32 = &argO_level;
        var argO_consumed: ModifierType = undefined;
        const arg_consumed: ?*ModifierType = &argO_consumed;
        const cFn = @extern(*const fn (*Display, u32, ModifierType, i32, ?*u32, ?*i32, ?*i32, ?*ModifierType) callconv(.c) bool, .{ .name = "gdk_display_translate_key" });
        const ret = cFn(self, arg_keycode, arg_state, arg_group, arg_keyval, arg_effective_group, arg_level, arg_consumed);
        return .{ .ret = ret, .keyval = argO_keyval, .effective_group = argO_effective_group, .level = argO_level, .consumed = argO_consumed };
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_display_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DisplayManager = struct {
    pub const Parent = GObject.Object;
    _props: struct {
        @"default-display": core.Property(Display, "default-display") = .{},
    },
    _signals: struct {
        @"display-opened": core.Signal(fn (*DisplayManager, *Display) void, "display-opened") = .{},
    },
    pub fn get() *DisplayManager {
        const cFn = @extern(*const fn () callconv(.c) *DisplayManager, .{ .name = "gdk_display_manager_get" });
        const ret = cFn();
        return ret;
    }
    pub fn getDefaultDisplay(self: *DisplayManager) ?*Display {
        const cFn = @extern(*const fn (*DisplayManager) callconv(.c) ?*Display, .{ .name = "gdk_display_manager_get_default_display" });
        const ret = cFn(self);
        return ret;
    }
    pub fn listDisplays(self: *DisplayManager) ?*GLib.SList {
        const cFn = @extern(*const fn (*DisplayManager) callconv(.c) ?*GLib.SList, .{ .name = "gdk_display_manager_list_displays" });
        const ret = cFn(self);
        return ret;
    }
    pub fn openDisplay(self: *DisplayManager, arg_name: ?[*:0]const u8) ?*Display {
        const cFn = @extern(*const fn (*DisplayManager, ?[*:0]const u8) callconv(.c) ?*Display, .{ .name = "gdk_display_manager_open_display" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn setDefaultDisplay(self: *DisplayManager, arg_display: *Display) void {
        const cFn = @extern(*const fn (*DisplayManager, *Display) callconv(.c) void, .{ .name = "gdk_display_manager_set_default_display" });
        const ret = cFn(self, arg_display);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_display_manager_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DmabufError = enum(u32) {
    not_available = 0,
    unsupported_format = 1,
    creation_failed = 2,
    pub fn quark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "gdk_dmabuf_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_dmabuf_error_get_type" });
        return cFn();
    }
};
pub const DmabufFormats = opaque {
    pub fn contains(self: *DmabufFormats, arg_fourcc: u32, arg_modifier: u64) bool {
        const cFn = @extern(*const fn (*DmabufFormats, u32, u64) callconv(.c) bool, .{ .name = "gdk_dmabuf_formats_contains" });
        const ret = cFn(self, arg_fourcc, arg_modifier);
        return ret;
    }
    pub fn equal(self: *DmabufFormats, arg_formats2: ?*DmabufFormats) bool {
        const cFn = @extern(*const fn (*DmabufFormats, ?*DmabufFormats) callconv(.c) bool, .{ .name = "gdk_dmabuf_formats_equal" });
        const ret = cFn(self, arg_formats2);
        return ret;
    }
    pub fn getFormat(self: *DmabufFormats, arg_idx: u64) struct {
        fourcc: u32,
        modifier: u64,
    } {
        var argO_fourcc: u32 = undefined;
        const arg_fourcc: *u32 = &argO_fourcc;
        var argO_modifier: u64 = undefined;
        const arg_modifier: *u64 = &argO_modifier;
        const cFn = @extern(*const fn (*DmabufFormats, u64, *u32, *u64) callconv(.c) void, .{ .name = "gdk_dmabuf_formats_get_format" });
        const ret = cFn(self, arg_idx, arg_fourcc, arg_modifier);
        _ = ret;
        return .{ .fourcc = argO_fourcc, .modifier = argO_modifier };
    }
    pub fn getNFormats(self: *DmabufFormats) u64 {
        const cFn = @extern(*const fn (*DmabufFormats) callconv(.c) u64, .{ .name = "gdk_dmabuf_formats_get_n_formats" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *DmabufFormats) *DmabufFormats {
        const cFn = @extern(*const fn (*DmabufFormats) callconv(.c) *DmabufFormats, .{ .name = "gdk_dmabuf_formats_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *DmabufFormats) void {
        const cFn = @extern(*const fn (*DmabufFormats) callconv(.c) void, .{ .name = "gdk_dmabuf_formats_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_dmabuf_formats_get_type" });
        return cFn();
    }
};
pub const DmabufTexture = struct {
    pub const Interfaces = [_]type{ Paintable, Gio.Icon, Gio.LoadableIcon };
    pub const Parent = Texture;
    pub const Class = DmabufTextureClass;
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_dmabuf_texture_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DmabufTextureBuilder = struct {
    pub const Parent = GObject.Object;
    pub const Class = DmabufTextureBuilderClass;
    _props: struct {
        @"color-state": core.Property(ColorState, "color-state") = .{},
        display: core.Property(Display, "display") = .{},
        fourcc: core.Property(u32, "fourcc") = .{},
        height: core.Property(u32, "height") = .{},
        modifier: core.Property(u64, "modifier") = .{},
        @"n-planes": core.Property(u32, "n-planes") = .{},
        premultiplied: core.Property(bool, "premultiplied") = .{},
        @"update-region": core.Property(cairo.Region, "update-region") = .{},
        @"update-texture": core.Property(Texture, "update-texture") = .{},
        width: core.Property(u32, "width") = .{},
    },
    pub fn new() *DmabufTextureBuilder {
        const cFn = @extern(*const fn () callconv(.c) *DmabufTextureBuilder, .{ .name = "gdk_dmabuf_texture_builder_new" });
        const ret = cFn();
        return ret;
    }
    pub fn build(self: *DmabufTextureBuilder, arg_destroy: ?GLib.DestroyNotify, arg_data: ?*anyopaque, arg_error: *?*GLib.Error) error{GError}!?*Texture {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, ?GLib.DestroyNotify, ?*anyopaque, *?*GLib.Error) callconv(.c) ?*Texture, .{ .name = "gdk_dmabuf_texture_builder_build" });
        const ret = cFn(self, arg_destroy, @ptrCast(arg_data), arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getColorState(self: *DmabufTextureBuilder) ?*ColorState {
        const cFn = @extern(*const fn (*DmabufTextureBuilder) callconv(.c) ?*ColorState, .{ .name = "gdk_dmabuf_texture_builder_get_color_state" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDisplay(self: *DmabufTextureBuilder) *Display {
        const cFn = @extern(*const fn (*DmabufTextureBuilder) callconv(.c) *Display, .{ .name = "gdk_dmabuf_texture_builder_get_display" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFd(self: *DmabufTextureBuilder, arg_plane: u32) i32 {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, u32) callconv(.c) i32, .{ .name = "gdk_dmabuf_texture_builder_get_fd" });
        const ret = cFn(self, arg_plane);
        return ret;
    }
    pub fn getFourcc(self: *DmabufTextureBuilder) u32 {
        const cFn = @extern(*const fn (*DmabufTextureBuilder) callconv(.c) u32, .{ .name = "gdk_dmabuf_texture_builder_get_fourcc" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHeight(self: *DmabufTextureBuilder) u32 {
        const cFn = @extern(*const fn (*DmabufTextureBuilder) callconv(.c) u32, .{ .name = "gdk_dmabuf_texture_builder_get_height" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getModifier(self: *DmabufTextureBuilder) u64 {
        const cFn = @extern(*const fn (*DmabufTextureBuilder) callconv(.c) u64, .{ .name = "gdk_dmabuf_texture_builder_get_modifier" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNPlanes(self: *DmabufTextureBuilder) u32 {
        const cFn = @extern(*const fn (*DmabufTextureBuilder) callconv(.c) u32, .{ .name = "gdk_dmabuf_texture_builder_get_n_planes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOffset(self: *DmabufTextureBuilder, arg_plane: u32) u32 {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, u32) callconv(.c) u32, .{ .name = "gdk_dmabuf_texture_builder_get_offset" });
        const ret = cFn(self, arg_plane);
        return ret;
    }
    pub fn getPremultiplied(self: *DmabufTextureBuilder) bool {
        const cFn = @extern(*const fn (*DmabufTextureBuilder) callconv(.c) bool, .{ .name = "gdk_dmabuf_texture_builder_get_premultiplied" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStride(self: *DmabufTextureBuilder, arg_plane: u32) u32 {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, u32) callconv(.c) u32, .{ .name = "gdk_dmabuf_texture_builder_get_stride" });
        const ret = cFn(self, arg_plane);
        return ret;
    }
    pub fn getUpdateRegion(self: *DmabufTextureBuilder) ?*cairo.Region {
        const cFn = @extern(*const fn (*DmabufTextureBuilder) callconv(.c) ?*cairo.Region, .{ .name = "gdk_dmabuf_texture_builder_get_update_region" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUpdateTexture(self: *DmabufTextureBuilder) ?*Texture {
        const cFn = @extern(*const fn (*DmabufTextureBuilder) callconv(.c) ?*Texture, .{ .name = "gdk_dmabuf_texture_builder_get_update_texture" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWidth(self: *DmabufTextureBuilder) u32 {
        const cFn = @extern(*const fn (*DmabufTextureBuilder) callconv(.c) u32, .{ .name = "gdk_dmabuf_texture_builder_get_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setColorState(self: *DmabufTextureBuilder, arg_color_state: ?*ColorState) void {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, ?*ColorState) callconv(.c) void, .{ .name = "gdk_dmabuf_texture_builder_set_color_state" });
        const ret = cFn(self, arg_color_state);
        return ret;
    }
    pub fn setDisplay(self: *DmabufTextureBuilder, arg_display: *Display) void {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, *Display) callconv(.c) void, .{ .name = "gdk_dmabuf_texture_builder_set_display" });
        const ret = cFn(self, arg_display);
        return ret;
    }
    pub fn setFd(self: *DmabufTextureBuilder, arg_plane: u32, arg_fd: i32) void {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, u32, i32) callconv(.c) void, .{ .name = "gdk_dmabuf_texture_builder_set_fd" });
        const ret = cFn(self, arg_plane, arg_fd);
        return ret;
    }
    pub fn setFourcc(self: *DmabufTextureBuilder, arg_fourcc: u32) void {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, u32) callconv(.c) void, .{ .name = "gdk_dmabuf_texture_builder_set_fourcc" });
        const ret = cFn(self, arg_fourcc);
        return ret;
    }
    pub fn setHeight(self: *DmabufTextureBuilder, arg_height: u32) void {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, u32) callconv(.c) void, .{ .name = "gdk_dmabuf_texture_builder_set_height" });
        const ret = cFn(self, arg_height);
        return ret;
    }
    pub fn setModifier(self: *DmabufTextureBuilder, arg_modifier: u64) void {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, u64) callconv(.c) void, .{ .name = "gdk_dmabuf_texture_builder_set_modifier" });
        const ret = cFn(self, arg_modifier);
        return ret;
    }
    pub fn setNPlanes(self: *DmabufTextureBuilder, arg_n_planes: u32) void {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, u32) callconv(.c) void, .{ .name = "gdk_dmabuf_texture_builder_set_n_planes" });
        const ret = cFn(self, arg_n_planes);
        return ret;
    }
    pub fn setOffset(self: *DmabufTextureBuilder, arg_plane: u32, arg_offset: u32) void {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, u32, u32) callconv(.c) void, .{ .name = "gdk_dmabuf_texture_builder_set_offset" });
        const ret = cFn(self, arg_plane, arg_offset);
        return ret;
    }
    pub fn setPremultiplied(self: *DmabufTextureBuilder, arg_premultiplied: bool) void {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, bool) callconv(.c) void, .{ .name = "gdk_dmabuf_texture_builder_set_premultiplied" });
        const ret = cFn(self, arg_premultiplied);
        return ret;
    }
    pub fn setStride(self: *DmabufTextureBuilder, arg_plane: u32, arg_stride: u32) void {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, u32, u32) callconv(.c) void, .{ .name = "gdk_dmabuf_texture_builder_set_stride" });
        const ret = cFn(self, arg_plane, arg_stride);
        return ret;
    }
    pub fn setUpdateRegion(self: *DmabufTextureBuilder, arg_region: ?*cairo.Region) void {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, ?*cairo.Region) callconv(.c) void, .{ .name = "gdk_dmabuf_texture_builder_set_update_region" });
        const ret = cFn(self, arg_region);
        return ret;
    }
    pub fn setUpdateTexture(self: *DmabufTextureBuilder, arg_texture: ?*Texture) void {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, ?*Texture) callconv(.c) void, .{ .name = "gdk_dmabuf_texture_builder_set_update_texture" });
        const ret = cFn(self, arg_texture);
        return ret;
    }
    pub fn setWidth(self: *DmabufTextureBuilder, arg_width: u32) void {
        const cFn = @extern(*const fn (*DmabufTextureBuilder, u32) callconv(.c) void, .{ .name = "gdk_dmabuf_texture_builder_set_width" });
        const ret = cFn(self, arg_width);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_dmabuf_texture_builder_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DmabufTextureBuilderClass = opaque {};
pub const DmabufTextureClass = opaque {};
pub const Drag = struct {
    pub const Parent = GObject.Object;
    _props: struct {
        actions: core.Property(DragAction, "actions") = .{},
        content: core.Property(ContentProvider, "content") = .{},
        device: core.Property(Device, "device") = .{},
        display: core.Property(Display, "display") = .{},
        formats: core.Property(ContentFormats, "formats") = .{},
        @"selected-action": core.Property(DragAction, "selected-action") = .{},
        surface: core.Property(Surface, "surface") = .{},
    },
    _signals: struct {
        cancel: core.Signal(fn (*Drag, DragCancelReason) void, "cancel") = .{},
        @"dnd-finished": core.Signal(fn (*Drag) void, "dnd-finished") = .{},
        @"drop-performed": core.Signal(fn (*Drag) void, "drop-performed") = .{},
    },
    pub fn begin(arg_surface: *Surface, arg_device: *Device, arg_content: *ContentProvider, arg_actions: DragAction, arg_dx: f64, arg_dy: f64) ?*Drag {
        const cFn = @extern(*const fn (*Surface, *Device, *ContentProvider, DragAction, f64, f64) callconv(.c) ?*Drag, .{ .name = "gdk_drag_begin" });
        const ret = cFn(arg_surface, arg_device, arg_content, arg_actions, arg_dx, arg_dy);
        return ret;
    }
    pub fn dropDone(self: *Drag, arg_success: bool) void {
        const cFn = @extern(*const fn (*Drag, bool) callconv(.c) void, .{ .name = "gdk_drag_drop_done" });
        const ret = cFn(self, arg_success);
        return ret;
    }
    pub fn getActions(self: *Drag) DragAction {
        const cFn = @extern(*const fn (*Drag) callconv(.c) DragAction, .{ .name = "gdk_drag_get_actions" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getContent(self: *Drag) *ContentProvider {
        const cFn = @extern(*const fn (*Drag) callconv(.c) *ContentProvider, .{ .name = "gdk_drag_get_content" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDevice(self: *Drag) *Device {
        const cFn = @extern(*const fn (*Drag) callconv(.c) *Device, .{ .name = "gdk_drag_get_device" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDisplay(self: *Drag) *Display {
        const cFn = @extern(*const fn (*Drag) callconv(.c) *Display, .{ .name = "gdk_drag_get_display" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDragSurface(self: *Drag) ?*Surface {
        const cFn = @extern(*const fn (*Drag) callconv(.c) ?*Surface, .{ .name = "gdk_drag_get_drag_surface" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFormats(self: *Drag) *ContentFormats {
        const cFn = @extern(*const fn (*Drag) callconv(.c) *ContentFormats, .{ .name = "gdk_drag_get_formats" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSelectedAction(self: *Drag) DragAction {
        const cFn = @extern(*const fn (*Drag) callconv(.c) DragAction, .{ .name = "gdk_drag_get_selected_action" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSurface(self: *Drag) *Surface {
        const cFn = @extern(*const fn (*Drag) callconv(.c) *Surface, .{ .name = "gdk_drag_get_surface" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setHotspot(self: *Drag, arg_hot_x: i32, arg_hot_y: i32) void {
        const cFn = @extern(*const fn (*Drag, i32, i32) callconv(.c) void, .{ .name = "gdk_drag_set_hotspot" });
        const ret = cFn(self, arg_hot_x, arg_hot_y);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_drag_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DragAction = packed struct(u32) {
    copy: bool = false,
    move: bool = false,
    link: bool = false,
    ask: bool = false,
    _: u28 = 0,
    pub fn isUnique(arg_action: DragAction) bool {
        const cFn = @extern(*const fn (DragAction) callconv(.c) bool, .{ .name = "gdk_drag_action_is_unique" });
        const ret = cFn(arg_action);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_drag_action_get_type" });
        return cFn();
    }
};
pub const DragCancelReason = enum(u32) {
    no_target = 0,
    user_cancelled = 1,
    @"error" = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_drag_cancel_reason_get_type" });
        return cFn();
    }
};
pub const DragSurface = struct {
    pub const Prerequistes = [_]type{Surface};
    pub const Class = DragSurfaceInterface;
    _signals: struct {
        @"compute-size": core.Signal(fn (*DragSurface, *DragSurfaceSize) void, "compute-size") = .{},
    },
    pub fn present(self: *DragSurface, arg_width: i32, arg_height: i32) bool {
        const cFn = @extern(*const fn (*DragSurface, i32, i32) callconv(.c) bool, .{ .name = "gdk_drag_surface_present" });
        const ret = cFn(self, arg_width, arg_height);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_drag_surface_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DragSurfaceInterface = opaque {};
pub const DragSurfaceSize = opaque {
    pub fn setSize(self: *DragSurfaceSize, arg_width: i32, arg_height: i32) void {
        const cFn = @extern(*const fn (*DragSurfaceSize, i32, i32) callconv(.c) void, .{ .name = "gdk_drag_surface_size_set_size" });
        const ret = cFn(self, arg_width, arg_height);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_drag_surface_size_get_type" });
        return cFn();
    }
};
pub const DrawContext = struct {
    pub const Parent = GObject.Object;
    _props: struct {
        display: core.Property(Display, "display") = .{},
        surface: core.Property(Surface, "surface") = .{},
    },
    pub fn beginFrame(self: *DrawContext, arg_region: *cairo.Region) void {
        const cFn = @extern(*const fn (*DrawContext, *cairo.Region) callconv(.c) void, .{ .name = "gdk_draw_context_begin_frame" });
        const ret = cFn(self, arg_region);
        return ret;
    }
    pub fn endFrame(self: *DrawContext) void {
        const cFn = @extern(*const fn (*DrawContext) callconv(.c) void, .{ .name = "gdk_draw_context_end_frame" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDisplay(self: *DrawContext) ?*Display {
        const cFn = @extern(*const fn (*DrawContext) callconv(.c) ?*Display, .{ .name = "gdk_draw_context_get_display" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFrameRegion(self: *DrawContext) ?*cairo.Region {
        const cFn = @extern(*const fn (*DrawContext) callconv(.c) ?*cairo.Region, .{ .name = "gdk_draw_context_get_frame_region" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSurface(self: *DrawContext) ?*Surface {
        const cFn = @extern(*const fn (*DrawContext) callconv(.c) ?*Surface, .{ .name = "gdk_draw_context_get_surface" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isInFrame(self: *DrawContext) bool {
        const cFn = @extern(*const fn (*DrawContext) callconv(.c) bool, .{ .name = "gdk_draw_context_is_in_frame" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_draw_context_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const Drop = struct {
    pub const Parent = GObject.Object;
    _props: struct {
        actions: core.Property(DragAction, "actions") = .{},
        device: core.Property(Device, "device") = .{},
        display: core.Property(Display, "display") = .{},
        drag: core.Property(Drag, "drag") = .{},
        formats: core.Property(ContentFormats, "formats") = .{},
        surface: core.Property(Surface, "surface") = .{},
    },
    pub fn finish(self: *Drop, arg_action: DragAction) void {
        const cFn = @extern(*const fn (*Drop, DragAction) callconv(.c) void, .{ .name = "gdk_drop_finish" });
        const ret = cFn(self, arg_action);
        return ret;
    }
    pub fn getActions(self: *Drop) DragAction {
        const cFn = @extern(*const fn (*Drop) callconv(.c) DragAction, .{ .name = "gdk_drop_get_actions" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDevice(self: *Drop) *Device {
        const cFn = @extern(*const fn (*Drop) callconv(.c) *Device, .{ .name = "gdk_drop_get_device" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDisplay(self: *Drop) *Display {
        const cFn = @extern(*const fn (*Drop) callconv(.c) *Display, .{ .name = "gdk_drop_get_display" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDrag(self: *Drop) ?*Drag {
        const cFn = @extern(*const fn (*Drop) callconv(.c) ?*Drag, .{ .name = "gdk_drop_get_drag" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFormats(self: *Drop) *ContentFormats {
        const cFn = @extern(*const fn (*Drop) callconv(.c) *ContentFormats, .{ .name = "gdk_drop_get_formats" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSurface(self: *Drop) *Surface {
        const cFn = @extern(*const fn (*Drop) callconv(.c) *Surface, .{ .name = "gdk_drop_get_surface" });
        const ret = cFn(self);
        return ret;
    }
    pub fn readAsync(self: *Drop, arg_mime_types: [*]?[*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Gio.Cancellable, argC_callback: core.Closure(?Gio.AsyncReadyCallback)) void {
        const arg_callback: ?Gio.AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Drop, [*]?[*:0]const u8, i32, ?*Gio.Cancellable, ?Gio.AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_drop_read_async" });
        const ret = cFn(self, arg_mime_types, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn readFinish(self: *Drop, arg_result: *Gio.AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: ?*Gio.InputStream,
        out_mime_type: [*:0]u8,
    } {
        var argO_out_mime_type: [*:0]u8 = undefined;
        const arg_out_mime_type: *[*:0]u8 = &argO_out_mime_type;
        const cFn = @extern(*const fn (*Drop, *Gio.AsyncResult, *[*:0]u8, *?*GLib.Error) callconv(.c) ?*Gio.InputStream, .{ .name = "gdk_drop_read_finish" });
        const ret = cFn(self, arg_result, arg_out_mime_type, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .out_mime_type = argO_out_mime_type };
    }
    pub fn readValueAsync(self: *Drop, arg_type: core.Type, arg_io_priority: i32, arg_cancellable: ?*Gio.Cancellable, argC_callback: core.Closure(?Gio.AsyncReadyCallback)) void {
        const arg_callback: ?Gio.AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Drop, core.Type, i32, ?*Gio.Cancellable, ?Gio.AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_drop_read_value_async" });
        const ret = cFn(self, arg_type, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn readValueFinish(self: *Drop, arg_result: *Gio.AsyncResult, arg_error: *?*GLib.Error) error{GError}!*GObject.Value {
        const cFn = @extern(*const fn (*Drop, *Gio.AsyncResult, *?*GLib.Error) callconv(.c) *GObject.Value, .{ .name = "gdk_drop_read_value_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn status(self: *Drop, arg_actions: DragAction, arg_preferred: DragAction) void {
        const cFn = @extern(*const fn (*Drop, DragAction, DragAction) callconv(.c) void, .{ .name = "gdk_drop_status" });
        const ret = cFn(self, arg_actions, arg_preferred);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_drop_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const EVENT_PROPAGATE = false;
pub const EVENT_STOP = true;
pub const Event = struct {
    pub fn _getAngle(self: *Event, arg_event2: *Event) struct {
        ret: bool,
        angle: f64,
    } {
        var argO_angle: f64 = undefined;
        const arg_angle: *f64 = &argO_angle;
        const cFn = @extern(*const fn (*Event, *Event, *f64) callconv(.c) bool, .{ .name = "gdk_events_get_angle" });
        const ret = cFn(self, arg_event2, arg_angle);
        return .{ .ret = ret, .angle = argO_angle };
    }
    pub fn _getCenter(self: *Event, arg_event2: *Event) struct {
        ret: bool,
        x: f64,
        y: f64,
    } {
        var argO_x: f64 = undefined;
        const arg_x: *f64 = &argO_x;
        var argO_y: f64 = undefined;
        const arg_y: *f64 = &argO_y;
        const cFn = @extern(*const fn (*Event, *Event, *f64, *f64) callconv(.c) bool, .{ .name = "gdk_events_get_center" });
        const ret = cFn(self, arg_event2, arg_x, arg_y);
        return .{ .ret = ret, .x = argO_x, .y = argO_y };
    }
    pub fn _getDistance(self: *Event, arg_event2: *Event) struct {
        ret: bool,
        distance: f64,
    } {
        var argO_distance: f64 = undefined;
        const arg_distance: *f64 = &argO_distance;
        const cFn = @extern(*const fn (*Event, *Event, *f64) callconv(.c) bool, .{ .name = "gdk_events_get_distance" });
        const ret = cFn(self, arg_event2, arg_distance);
        return .{ .ret = ret, .distance = argO_distance };
    }
    pub fn getAxes(self: *Event) ?[]f64 {
        var argO_axes: [*]f64 = undefined;
        const arg_axes: *[*]f64 = &argO_axes;
        var argO_n_axes: u32 = undefined;
        const arg_n_axes: *u32 = &argO_n_axes;
        const cFn = @extern(*const fn (*Event, *[*]f64, *u32) callconv(.c) bool, .{ .name = "gdk_event_get_axes" });
        const ret = cFn(self, arg_axes, arg_n_axes);
        if (!ret) return null;
        return argO_axes[0..@intCast(argO_n_axes)];
    }
    pub fn getAxis(self: *Event, arg_axis_use: AxisUse) ?f64 {
        var argO_value: f64 = undefined;
        const arg_value: *f64 = &argO_value;
        const cFn = @extern(*const fn (*Event, AxisUse, *f64) callconv(.c) bool, .{ .name = "gdk_event_get_axis" });
        const ret = cFn(self, arg_axis_use, arg_value);
        if (!ret) return null;
        return argO_value;
    }
    pub fn getDevice(self: *Event) ?*Device {
        const cFn = @extern(*const fn (*Event) callconv(.c) ?*Device, .{ .name = "gdk_event_get_device" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDeviceTool(self: *Event) ?*DeviceTool {
        const cFn = @extern(*const fn (*Event) callconv(.c) ?*DeviceTool, .{ .name = "gdk_event_get_device_tool" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDisplay(self: *Event) ?*Display {
        const cFn = @extern(*const fn (*Event) callconv(.c) ?*Display, .{ .name = "gdk_event_get_display" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getEventSequence(self: *Event) *EventSequence {
        const cFn = @extern(*const fn (*Event) callconv(.c) *EventSequence, .{ .name = "gdk_event_get_event_sequence" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getEventType(self: *Event) EventType {
        const cFn = @extern(*const fn (*Event) callconv(.c) EventType, .{ .name = "gdk_event_get_event_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHistory(self: *Event) []TimeCoord {
        var argO_out_n_coords: u32 = undefined;
        const arg_out_n_coords: *u32 = &argO_out_n_coords;
        const cFn = @extern(*const fn (*Event, *u32) callconv(.c) ?[*]TimeCoord, .{ .name = "gdk_event_get_history" });
        const ret = cFn(self, arg_out_n_coords);
        return ret[0..@intCast(argO_out_n_coords)];
    }
    pub fn getModifierState(self: *Event) ModifierType {
        const cFn = @extern(*const fn (*Event) callconv(.c) ModifierType, .{ .name = "gdk_event_get_modifier_state" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPointerEmulated(self: *Event) bool {
        const cFn = @extern(*const fn (*Event) callconv(.c) bool, .{ .name = "gdk_event_get_pointer_emulated" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPosition(self: *Event) ?struct {
        x: f64,
        y: f64,
    } {
        var argO_x: f64 = undefined;
        const arg_x: *f64 = &argO_x;
        var argO_y: f64 = undefined;
        const arg_y: *f64 = &argO_y;
        const cFn = @extern(*const fn (*Event, *f64, *f64) callconv(.c) bool, .{ .name = "gdk_event_get_position" });
        const ret = cFn(self, arg_x, arg_y);
        if (!ret) return null;
        return .{ .x = argO_x, .y = argO_y };
    }
    pub fn getSeat(self: *Event) ?*Seat {
        const cFn = @extern(*const fn (*Event) callconv(.c) ?*Seat, .{ .name = "gdk_event_get_seat" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSurface(self: *Event) ?*Surface {
        const cFn = @extern(*const fn (*Event) callconv(.c) ?*Surface, .{ .name = "gdk_event_get_surface" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTime(self: *Event) u32 {
        const cFn = @extern(*const fn (*Event) callconv(.c) u32, .{ .name = "gdk_event_get_time" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *Event) *Event {
        const cFn = @extern(*const fn (*Event) callconv(.c) *Event, .{ .name = "gdk_event_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn triggersContextMenu(self: *Event) bool {
        const cFn = @extern(*const fn (*Event) callconv(.c) bool, .{ .name = "gdk_event_triggers_context_menu" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *Event) void {
        const cFn = @extern(*const fn (*Event) callconv(.c) void, .{ .name = "gdk_event_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_event_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const EventSequence = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_event_sequence_get_type" });
        return cFn();
    }
};
pub const EventType = enum(u32) {
    delete = 0,
    motion_notify = 1,
    button_press = 2,
    button_release = 3,
    key_press = 4,
    key_release = 5,
    enter_notify = 6,
    leave_notify = 7,
    focus_change = 8,
    proximity_in = 9,
    proximity_out = 10,
    drag_enter = 11,
    drag_leave = 12,
    drag_motion = 13,
    drop_start = 14,
    scroll = 15,
    grab_broken = 16,
    touch_begin = 17,
    touch_update = 18,
    touch_end = 19,
    touch_cancel = 20,
    touchpad_swipe = 21,
    touchpad_pinch = 22,
    pad_button_press = 23,
    pad_button_release = 24,
    pad_ring = 25,
    pad_strip = 26,
    pad_group_mode = 27,
    touchpad_hold = 28,
    event_last = 29,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_event_type_get_type" });
        return cFn();
    }
};
pub const FileList = opaque {
    pub fn newFromArray(argS_files: []*Gio.File) *FileList {
        const arg_files: [*]*Gio.File = @ptrCast(argS_files);
        const arg_n_files: u64 = @intCast((argS_files).len);
        const cFn = @extern(*const fn ([*]*Gio.File, u64) callconv(.c) *FileList, .{ .name = "gdk_file_list_new_from_array" });
        const ret = cFn(arg_files, arg_n_files);
        return ret;
    }
    pub fn newFromList(arg_files: *GLib.SList) *FileList {
        const cFn = @extern(*const fn (*GLib.SList) callconv(.c) *FileList, .{ .name = "gdk_file_list_new_from_list" });
        const ret = cFn(arg_files);
        return ret;
    }
    pub fn getFiles(self: *FileList) ?*GLib.SList {
        const cFn = @extern(*const fn (*FileList) callconv(.c) ?*GLib.SList, .{ .name = "gdk_file_list_get_files" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_file_list_get_type" });
        return cFn();
    }
};
pub const FocusEvent = struct {
    pub const Parent = Event;
    pub fn getIn(self: *FocusEvent) bool {
        const cFn = @extern(*const fn (*FocusEvent) callconv(.c) bool, .{ .name = "gdk_focus_event_get_in" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_focus_event_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FrameClock = struct {
    pub const Parent = GObject.Object;
    pub const Class = FrameClockClass;
    _signals: struct {
        @"after-paint": core.Signal(fn (*FrameClock) void, "after-paint") = .{},
        @"before-paint": core.Signal(fn (*FrameClock) void, "before-paint") = .{},
        @"flush-events": core.Signal(fn (*FrameClock) void, "flush-events") = .{},
        layout: core.Signal(fn (*FrameClock) void, "layout") = .{},
        paint: core.Signal(fn (*FrameClock) void, "paint") = .{},
        @"resume-events": core.Signal(fn (*FrameClock) void, "resume-events") = .{},
        update: core.Signal(fn (*FrameClock) void, "update") = .{},
    },
    pub fn beginUpdating(self: *FrameClock) void {
        const cFn = @extern(*const fn (*FrameClock) callconv(.c) void, .{ .name = "gdk_frame_clock_begin_updating" });
        const ret = cFn(self);
        return ret;
    }
    pub fn endUpdating(self: *FrameClock) void {
        const cFn = @extern(*const fn (*FrameClock) callconv(.c) void, .{ .name = "gdk_frame_clock_end_updating" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCurrentTimings(self: *FrameClock) ?*FrameTimings {
        const cFn = @extern(*const fn (*FrameClock) callconv(.c) ?*FrameTimings, .{ .name = "gdk_frame_clock_get_current_timings" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFps(self: *FrameClock) f64 {
        const cFn = @extern(*const fn (*FrameClock) callconv(.c) f64, .{ .name = "gdk_frame_clock_get_fps" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFrameCounter(self: *FrameClock) i64 {
        const cFn = @extern(*const fn (*FrameClock) callconv(.c) i64, .{ .name = "gdk_frame_clock_get_frame_counter" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFrameTime(self: *FrameClock) i64 {
        const cFn = @extern(*const fn (*FrameClock) callconv(.c) i64, .{ .name = "gdk_frame_clock_get_frame_time" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHistoryStart(self: *FrameClock) i64 {
        const cFn = @extern(*const fn (*FrameClock) callconv(.c) i64, .{ .name = "gdk_frame_clock_get_history_start" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRefreshInfo(self: *FrameClock, arg_base_time: i64) struct {
        refresh_interval_return: i64,
        presentation_time_return: i64,
    } {
        var argO_refresh_interval_return: i64 = undefined;
        const arg_refresh_interval_return: ?*i64 = &argO_refresh_interval_return;
        var argO_presentation_time_return: i64 = undefined;
        const arg_presentation_time_return: *i64 = &argO_presentation_time_return;
        const cFn = @extern(*const fn (*FrameClock, i64, ?*i64, *i64) callconv(.c) void, .{ .name = "gdk_frame_clock_get_refresh_info" });
        const ret = cFn(self, arg_base_time, arg_refresh_interval_return, arg_presentation_time_return);
        _ = ret;
        return .{ .refresh_interval_return = argO_refresh_interval_return, .presentation_time_return = argO_presentation_time_return };
    }
    pub fn getTimings(self: *FrameClock, arg_frame_counter: i64) ?*FrameTimings {
        const cFn = @extern(*const fn (*FrameClock, i64) callconv(.c) ?*FrameTimings, .{ .name = "gdk_frame_clock_get_timings" });
        const ret = cFn(self, arg_frame_counter);
        return ret;
    }
    pub fn requestPhase(self: *FrameClock, arg_phase: FrameClockPhase) void {
        const cFn = @extern(*const fn (*FrameClock, FrameClockPhase) callconv(.c) void, .{ .name = "gdk_frame_clock_request_phase" });
        const ret = cFn(self, arg_phase);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_frame_clock_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FrameClockClass = opaque {};
pub const FrameClockPhase = packed struct(u32) {
    flush_events: bool = false,
    before_paint: bool = false,
    update: bool = false,
    layout: bool = false,
    paint: bool = false,
    resume_events: bool = false,
    after_paint: bool = false,
    _: u25 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_frame_clock_phase_get_type" });
        return cFn();
    }
};
pub const FrameClockPrivate = opaque {};
pub const FrameTimings = opaque {
    pub fn getComplete(self: *FrameTimings) bool {
        const cFn = @extern(*const fn (*FrameTimings) callconv(.c) bool, .{ .name = "gdk_frame_timings_get_complete" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFrameCounter(self: *FrameTimings) i64 {
        const cFn = @extern(*const fn (*FrameTimings) callconv(.c) i64, .{ .name = "gdk_frame_timings_get_frame_counter" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFrameTime(self: *FrameTimings) i64 {
        const cFn = @extern(*const fn (*FrameTimings) callconv(.c) i64, .{ .name = "gdk_frame_timings_get_frame_time" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPredictedPresentationTime(self: *FrameTimings) i64 {
        const cFn = @extern(*const fn (*FrameTimings) callconv(.c) i64, .{ .name = "gdk_frame_timings_get_predicted_presentation_time" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPresentationTime(self: *FrameTimings) i64 {
        const cFn = @extern(*const fn (*FrameTimings) callconv(.c) i64, .{ .name = "gdk_frame_timings_get_presentation_time" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRefreshInterval(self: *FrameTimings) i64 {
        const cFn = @extern(*const fn (*FrameTimings) callconv(.c) i64, .{ .name = "gdk_frame_timings_get_refresh_interval" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *FrameTimings) *FrameTimings {
        const cFn = @extern(*const fn (*FrameTimings) callconv(.c) *FrameTimings, .{ .name = "gdk_frame_timings_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *FrameTimings) void {
        const cFn = @extern(*const fn (*FrameTimings) callconv(.c) void, .{ .name = "gdk_frame_timings_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_frame_timings_get_type" });
        return cFn();
    }
};
pub const FullscreenMode = enum(u32) {
    current_monitor = 0,
    all_monitors = 1,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_fullscreen_mode_get_type" });
        return cFn();
    }
};
pub const GLAPI = packed struct(u32) {
    gl: bool = false,
    gles: bool = false,
    _: u30 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_gl_api_get_type" });
        return cFn();
    }
};
pub const GLContext = struct {
    pub const Parent = DrawContext;
    _props: struct {
        @"allowed-apis": core.Property(GLAPI, "allowed-apis") = .{},
        api: core.Property(GLAPI, "api") = .{},
        @"shared-context": core.Property(GLContext, "shared-context") = .{},
    },
    pub fn clearCurrent() void {
        const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "gdk_gl_context_clear_current" });
        const ret = cFn();
        return ret;
    }
    pub fn getCurrent() ?*GLContext {
        const cFn = @extern(*const fn () callconv(.c) ?*GLContext, .{ .name = "gdk_gl_context_get_current" });
        const ret = cFn();
        return ret;
    }
    pub fn getAllowedApis(self: *GLContext) GLAPI {
        const cFn = @extern(*const fn (*GLContext) callconv(.c) GLAPI, .{ .name = "gdk_gl_context_get_allowed_apis" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getApi(self: *GLContext) GLAPI {
        const cFn = @extern(*const fn (*GLContext) callconv(.c) GLAPI, .{ .name = "gdk_gl_context_get_api" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDebugEnabled(self: *GLContext) bool {
        const cFn = @extern(*const fn (*GLContext) callconv(.c) bool, .{ .name = "gdk_gl_context_get_debug_enabled" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDisplay(self: *GLContext) ?*Display {
        const cFn = @extern(*const fn (*GLContext) callconv(.c) ?*Display, .{ .name = "gdk_gl_context_get_display" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getForwardCompatible(self: *GLContext) bool {
        const cFn = @extern(*const fn (*GLContext) callconv(.c) bool, .{ .name = "gdk_gl_context_get_forward_compatible" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRequiredVersion(self: *GLContext) struct {
        major: i32,
        minor: i32,
    } {
        var argO_major: i32 = undefined;
        const arg_major: *i32 = &argO_major;
        var argO_minor: i32 = undefined;
        const arg_minor: *i32 = &argO_minor;
        const cFn = @extern(*const fn (*GLContext, *i32, *i32) callconv(.c) void, .{ .name = "gdk_gl_context_get_required_version" });
        const ret = cFn(self, arg_major, arg_minor);
        _ = ret;
        return .{ .major = argO_major, .minor = argO_minor };
    }
    pub fn getSharedContext(self: *GLContext) ?*GLContext {
        const cFn = @extern(*const fn (*GLContext) callconv(.c) ?*GLContext, .{ .name = "gdk_gl_context_get_shared_context" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSurface(self: *GLContext) ?*Surface {
        const cFn = @extern(*const fn (*GLContext) callconv(.c) ?*Surface, .{ .name = "gdk_gl_context_get_surface" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUseEs(self: *GLContext) bool {
        const cFn = @extern(*const fn (*GLContext) callconv(.c) bool, .{ .name = "gdk_gl_context_get_use_es" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getVersion(self: *GLContext) struct {
        major: i32,
        minor: i32,
    } {
        var argO_major: i32 = undefined;
        const arg_major: *i32 = &argO_major;
        var argO_minor: i32 = undefined;
        const arg_minor: *i32 = &argO_minor;
        const cFn = @extern(*const fn (*GLContext, *i32, *i32) callconv(.c) void, .{ .name = "gdk_gl_context_get_version" });
        const ret = cFn(self, arg_major, arg_minor);
        _ = ret;
        return .{ .major = argO_major, .minor = argO_minor };
    }
    pub fn isLegacy(self: *GLContext) bool {
        const cFn = @extern(*const fn (*GLContext) callconv(.c) bool, .{ .name = "gdk_gl_context_is_legacy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isShared(self: *GLContext, arg_other: *GLContext) bool {
        const cFn = @extern(*const fn (*GLContext, *GLContext) callconv(.c) bool, .{ .name = "gdk_gl_context_is_shared" });
        const ret = cFn(self, arg_other);
        return ret;
    }
    pub fn makeCurrent(self: *GLContext) void {
        const cFn = @extern(*const fn (*GLContext) callconv(.c) void, .{ .name = "gdk_gl_context_make_current" });
        const ret = cFn(self);
        return ret;
    }
    pub fn realize(self: *GLContext, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*GLContext, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_gl_context_realize" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setAllowedApis(self: *GLContext, arg_apis: GLAPI) void {
        const cFn = @extern(*const fn (*GLContext, GLAPI) callconv(.c) void, .{ .name = "gdk_gl_context_set_allowed_apis" });
        const ret = cFn(self, arg_apis);
        return ret;
    }
    pub fn setDebugEnabled(self: *GLContext, arg_enabled: bool) void {
        const cFn = @extern(*const fn (*GLContext, bool) callconv(.c) void, .{ .name = "gdk_gl_context_set_debug_enabled" });
        const ret = cFn(self, arg_enabled);
        return ret;
    }
    pub fn setForwardCompatible(self: *GLContext, arg_compatible: bool) void {
        const cFn = @extern(*const fn (*GLContext, bool) callconv(.c) void, .{ .name = "gdk_gl_context_set_forward_compatible" });
        const ret = cFn(self, arg_compatible);
        return ret;
    }
    pub fn setRequiredVersion(self: *GLContext, arg_major: i32, arg_minor: i32) void {
        const cFn = @extern(*const fn (*GLContext, i32, i32) callconv(.c) void, .{ .name = "gdk_gl_context_set_required_version" });
        const ret = cFn(self, arg_major, arg_minor);
        return ret;
    }
    pub fn setUseEs(self: *GLContext, arg_use_es: i32) void {
        const cFn = @extern(*const fn (*GLContext, i32) callconv(.c) void, .{ .name = "gdk_gl_context_set_use_es" });
        const ret = cFn(self, arg_use_es);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_gl_context_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const GLError = enum(u32) {
    not_available = 0,
    unsupported_format = 1,
    unsupported_profile = 2,
    compilation_failed = 3,
    link_failed = 4,
    pub fn quark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "gdk_gl_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_gl_error_get_type" });
        return cFn();
    }
};
pub const GLTexture = struct {
    pub const Interfaces = [_]type{ Paintable, Gio.Icon, Gio.LoadableIcon };
    pub const Parent = Texture;
    pub const Class = GLTextureClass;
    pub fn new(arg_context: *GLContext, arg_id: u32, arg_width: i32, arg_height: i32, arg_destroy: GLib.DestroyNotify, arg_data: ?*anyopaque) *GLTexture {
        const cFn = @extern(*const fn (*GLContext, u32, i32, i32, GLib.DestroyNotify, ?*anyopaque) callconv(.c) *GLTexture, .{ .name = "gdk_gl_texture_new" });
        const ret = cFn(arg_context, arg_id, arg_width, arg_height, arg_destroy, @ptrCast(arg_data));
        return ret;
    }
    pub fn release(self: *GLTexture) void {
        const cFn = @extern(*const fn (*GLTexture) callconv(.c) void, .{ .name = "gdk_gl_texture_release" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_gl_texture_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const GLTextureBuilder = struct {
    pub const Parent = GObject.Object;
    pub const Class = GLTextureBuilderClass;
    _props: struct {
        @"color-state": core.Property(ColorState, "color-state") = .{},
        context: core.Property(GLContext, "context") = .{},
        format: core.Property(MemoryFormat, "format") = .{},
        @"has-mipmap": core.Property(bool, "has-mipmap") = .{},
        height: core.Property(i32, "height") = .{},
        id: core.Property(u32, "id") = .{},
        sync: core.Property(*anyopaque, "sync") = .{},
        @"update-region": core.Property(cairo.Region, "update-region") = .{},
        @"update-texture": core.Property(Texture, "update-texture") = .{},
        width: core.Property(i32, "width") = .{},
    },
    pub fn new() *GLTextureBuilder {
        const cFn = @extern(*const fn () callconv(.c) *GLTextureBuilder, .{ .name = "gdk_gl_texture_builder_new" });
        const ret = cFn();
        return ret;
    }
    pub fn build(self: *GLTextureBuilder, arg_destroy: ?GLib.DestroyNotify, arg_data: ?*anyopaque) *Texture {
        const cFn = @extern(*const fn (*GLTextureBuilder, ?GLib.DestroyNotify, ?*anyopaque) callconv(.c) *Texture, .{ .name = "gdk_gl_texture_builder_build" });
        const ret = cFn(self, arg_destroy, @ptrCast(arg_data));
        return ret;
    }
    pub fn getColorState(self: *GLTextureBuilder) *ColorState {
        const cFn = @extern(*const fn (*GLTextureBuilder) callconv(.c) *ColorState, .{ .name = "gdk_gl_texture_builder_get_color_state" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getContext(self: *GLTextureBuilder) ?*GLContext {
        const cFn = @extern(*const fn (*GLTextureBuilder) callconv(.c) ?*GLContext, .{ .name = "gdk_gl_texture_builder_get_context" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFormat(self: *GLTextureBuilder) MemoryFormat {
        const cFn = @extern(*const fn (*GLTextureBuilder) callconv(.c) MemoryFormat, .{ .name = "gdk_gl_texture_builder_get_format" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHasMipmap(self: *GLTextureBuilder) bool {
        const cFn = @extern(*const fn (*GLTextureBuilder) callconv(.c) bool, .{ .name = "gdk_gl_texture_builder_get_has_mipmap" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHeight(self: *GLTextureBuilder) i32 {
        const cFn = @extern(*const fn (*GLTextureBuilder) callconv(.c) i32, .{ .name = "gdk_gl_texture_builder_get_height" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getId(self: *GLTextureBuilder) u32 {
        const cFn = @extern(*const fn (*GLTextureBuilder) callconv(.c) u32, .{ .name = "gdk_gl_texture_builder_get_id" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSync(self: *GLTextureBuilder) ?*anyopaque {
        const cFn = @extern(*const fn (*GLTextureBuilder) callconv(.c) ?*anyopaque, .{ .name = "gdk_gl_texture_builder_get_sync" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUpdateRegion(self: *GLTextureBuilder) ?*cairo.Region {
        const cFn = @extern(*const fn (*GLTextureBuilder) callconv(.c) ?*cairo.Region, .{ .name = "gdk_gl_texture_builder_get_update_region" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUpdateTexture(self: *GLTextureBuilder) ?*Texture {
        const cFn = @extern(*const fn (*GLTextureBuilder) callconv(.c) ?*Texture, .{ .name = "gdk_gl_texture_builder_get_update_texture" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWidth(self: *GLTextureBuilder) i32 {
        const cFn = @extern(*const fn (*GLTextureBuilder) callconv(.c) i32, .{ .name = "gdk_gl_texture_builder_get_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setColorState(self: *GLTextureBuilder, arg_color_state: *ColorState) void {
        const cFn = @extern(*const fn (*GLTextureBuilder, *ColorState) callconv(.c) void, .{ .name = "gdk_gl_texture_builder_set_color_state" });
        const ret = cFn(self, arg_color_state);
        return ret;
    }
    pub fn setContext(self: *GLTextureBuilder, arg_context: ?*GLContext) void {
        const cFn = @extern(*const fn (*GLTextureBuilder, ?*GLContext) callconv(.c) void, .{ .name = "gdk_gl_texture_builder_set_context" });
        const ret = cFn(self, arg_context);
        return ret;
    }
    pub fn setFormat(self: *GLTextureBuilder, arg_format: MemoryFormat) void {
        const cFn = @extern(*const fn (*GLTextureBuilder, MemoryFormat) callconv(.c) void, .{ .name = "gdk_gl_texture_builder_set_format" });
        const ret = cFn(self, arg_format);
        return ret;
    }
    pub fn setHasMipmap(self: *GLTextureBuilder, arg_has_mipmap: bool) void {
        const cFn = @extern(*const fn (*GLTextureBuilder, bool) callconv(.c) void, .{ .name = "gdk_gl_texture_builder_set_has_mipmap" });
        const ret = cFn(self, arg_has_mipmap);
        return ret;
    }
    pub fn setHeight(self: *GLTextureBuilder, arg_height: i32) void {
        const cFn = @extern(*const fn (*GLTextureBuilder, i32) callconv(.c) void, .{ .name = "gdk_gl_texture_builder_set_height" });
        const ret = cFn(self, arg_height);
        return ret;
    }
    pub fn setId(self: *GLTextureBuilder, arg_id: u32) void {
        const cFn = @extern(*const fn (*GLTextureBuilder, u32) callconv(.c) void, .{ .name = "gdk_gl_texture_builder_set_id" });
        const ret = cFn(self, arg_id);
        return ret;
    }
    pub fn setSync(self: *GLTextureBuilder, arg_sync: ?*anyopaque) void {
        const cFn = @extern(*const fn (*GLTextureBuilder, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_gl_texture_builder_set_sync" });
        const ret = cFn(self, @ptrCast(arg_sync));
        return ret;
    }
    pub fn setUpdateRegion(self: *GLTextureBuilder, arg_region: ?*cairo.Region) void {
        const cFn = @extern(*const fn (*GLTextureBuilder, ?*cairo.Region) callconv(.c) void, .{ .name = "gdk_gl_texture_builder_set_update_region" });
        const ret = cFn(self, arg_region);
        return ret;
    }
    pub fn setUpdateTexture(self: *GLTextureBuilder, arg_texture: ?*Texture) void {
        const cFn = @extern(*const fn (*GLTextureBuilder, ?*Texture) callconv(.c) void, .{ .name = "gdk_gl_texture_builder_set_update_texture" });
        const ret = cFn(self, arg_texture);
        return ret;
    }
    pub fn setWidth(self: *GLTextureBuilder, arg_width: i32) void {
        const cFn = @extern(*const fn (*GLTextureBuilder, i32) callconv(.c) void, .{ .name = "gdk_gl_texture_builder_set_width" });
        const ret = cFn(self, arg_width);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_gl_texture_builder_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const GLTextureBuilderClass = opaque {};
pub const GLTextureClass = opaque {};
pub const GrabBrokenEvent = struct {
    pub const Parent = Event;
    pub fn getGrabSurface(self: *GrabBrokenEvent) *Surface {
        const cFn = @extern(*const fn (*GrabBrokenEvent) callconv(.c) *Surface, .{ .name = "gdk_grab_broken_event_get_grab_surface" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getImplicit(self: *GrabBrokenEvent) bool {
        const cFn = @extern(*const fn (*GrabBrokenEvent) callconv(.c) bool, .{ .name = "gdk_grab_broken_event_get_implicit" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_grab_broken_event_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const Gravity = enum(u32) {
    north_west = 1,
    north = 2,
    north_east = 3,
    west = 4,
    center = 5,
    east = 6,
    south_west = 7,
    south = 8,
    south_east = 9,
    static = 10,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_gravity_get_type" });
        return cFn();
    }
};
pub const InputSource = enum(u32) {
    mouse = 0,
    pen = 1,
    keyboard = 2,
    touchscreen = 3,
    touchpad = 4,
    trackpoint = 5,
    tablet_pad = 6,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_input_source_get_type" });
        return cFn();
    }
};
pub const KEY_0 = 48;
pub const KEY_1 = 49;
pub const KEY_10ChannelsDown = 268964281;
pub const KEY_10ChannelsUp = 268964280;
pub const KEY_2 = 50;
pub const KEY_3 = 51;
pub const KEY_3270_AltCursor = 64784;
pub const KEY_3270_Attn = 64782;
pub const KEY_3270_BackTab = 64773;
pub const KEY_3270_ChangeScreen = 64793;
pub const KEY_3270_Copy = 64789;
pub const KEY_3270_CursorBlink = 64783;
pub const KEY_3270_CursorSelect = 64796;
pub const KEY_3270_DeleteWord = 64794;
pub const KEY_3270_Duplicate = 64769;
pub const KEY_3270_Enter = 64798;
pub const KEY_3270_EraseEOF = 64774;
pub const KEY_3270_EraseInput = 64775;
pub const KEY_3270_ExSelect = 64795;
pub const KEY_3270_FieldMark = 64770;
pub const KEY_3270_Ident = 64787;
pub const KEY_3270_Jump = 64786;
pub const KEY_3270_KeyClick = 64785;
pub const KEY_3270_Left2 = 64772;
pub const KEY_3270_PA1 = 64778;
pub const KEY_3270_PA2 = 64779;
pub const KEY_3270_PA3 = 64780;
pub const KEY_3270_Play = 64790;
pub const KEY_3270_PrintScreen = 64797;
pub const KEY_3270_Quit = 64777;
pub const KEY_3270_Record = 64792;
pub const KEY_3270_Reset = 64776;
pub const KEY_3270_Right2 = 64771;
pub const KEY_3270_Rule = 64788;
pub const KEY_3270_Setup = 64791;
pub const KEY_3270_Test = 64781;
pub const KEY_3DMode = 268964463;
pub const KEY_4 = 52;
pub const KEY_5 = 53;
pub const KEY_6 = 54;
pub const KEY_7 = 55;
pub const KEY_8 = 56;
pub const KEY_9 = 57;
pub const KEY_A = 65;
pub const KEY_AE = 198;
pub const KEY_ALSToggle = 268964400;
pub const KEY_Aacute = 193;
pub const KEY_Abelowdot = 16785056;
pub const KEY_Abreve = 451;
pub const KEY_Abreveacute = 16785070;
pub const KEY_Abrevebelowdot = 16785078;
pub const KEY_Abrevegrave = 16785072;
pub const KEY_Abrevehook = 16785074;
pub const KEY_Abrevetilde = 16785076;
pub const KEY_AccessX_Enable = 65136;
pub const KEY_AccessX_Feedback_Enable = 65137;
pub const KEY_Accessibility = 268964430;
pub const KEY_Acircumflex = 194;
pub const KEY_Acircumflexacute = 16785060;
pub const KEY_Acircumflexbelowdot = 16785068;
pub const KEY_Acircumflexgrave = 16785062;
pub const KEY_Acircumflexhook = 16785064;
pub const KEY_Acircumflextilde = 16785066;
pub const KEY_AddFavorite = 269025081;
pub const KEY_Addressbook = 268964269;
pub const KEY_Adiaeresis = 196;
pub const KEY_Agrave = 192;
pub const KEY_Ahook = 16785058;
pub const KEY_Alt_L = 65513;
pub const KEY_Alt_R = 65514;
pub const KEY_Amacron = 960;
pub const KEY_Aogonek = 417;
pub const KEY_AppSelect = 268964420;
pub const KEY_ApplicationLeft = 269025104;
pub const KEY_ApplicationRight = 269025105;
pub const KEY_Arabic_0 = 16778848;
pub const KEY_Arabic_1 = 16778849;
pub const KEY_Arabic_2 = 16778850;
pub const KEY_Arabic_3 = 16778851;
pub const KEY_Arabic_4 = 16778852;
pub const KEY_Arabic_5 = 16778853;
pub const KEY_Arabic_6 = 16778854;
pub const KEY_Arabic_7 = 16778855;
pub const KEY_Arabic_8 = 16778856;
pub const KEY_Arabic_9 = 16778857;
pub const KEY_Arabic_ain = 1497;
pub const KEY_Arabic_alef = 1479;
pub const KEY_Arabic_alefmaksura = 1513;
pub const KEY_Arabic_beh = 1480;
pub const KEY_Arabic_comma = 1452;
pub const KEY_Arabic_dad = 1494;
pub const KEY_Arabic_dal = 1487;
pub const KEY_Arabic_damma = 1519;
pub const KEY_Arabic_dammatan = 1516;
pub const KEY_Arabic_ddal = 16778888;
pub const KEY_Arabic_farsi_yeh = 16778956;
pub const KEY_Arabic_fatha = 1518;
pub const KEY_Arabic_fathatan = 1515;
pub const KEY_Arabic_feh = 1505;
pub const KEY_Arabic_fullstop = 16778964;
pub const KEY_Arabic_gaf = 16778927;
pub const KEY_Arabic_ghain = 1498;
pub const KEY_Arabic_ha = 1511;
pub const KEY_Arabic_hah = 1485;
pub const KEY_Arabic_hamza = 1473;
pub const KEY_Arabic_hamza_above = 16778836;
pub const KEY_Arabic_hamza_below = 16778837;
pub const KEY_Arabic_hamzaonalef = 1475;
pub const KEY_Arabic_hamzaonwaw = 1476;
pub const KEY_Arabic_hamzaonyeh = 1478;
pub const KEY_Arabic_hamzaunderalef = 1477;
pub const KEY_Arabic_heh = 1511;
pub const KEY_Arabic_heh_doachashmee = 16778942;
pub const KEY_Arabic_heh_goal = 16778945;
pub const KEY_Arabic_jeem = 1484;
pub const KEY_Arabic_jeh = 16778904;
pub const KEY_Arabic_kaf = 1507;
pub const KEY_Arabic_kasra = 1520;
pub const KEY_Arabic_kasratan = 1517;
pub const KEY_Arabic_keheh = 16778921;
pub const KEY_Arabic_khah = 1486;
pub const KEY_Arabic_lam = 1508;
pub const KEY_Arabic_madda_above = 16778835;
pub const KEY_Arabic_maddaonalef = 1474;
pub const KEY_Arabic_meem = 1509;
pub const KEY_Arabic_noon = 1510;
pub const KEY_Arabic_noon_ghunna = 16778938;
pub const KEY_Arabic_peh = 16778878;
pub const KEY_Arabic_percent = 16778858;
pub const KEY_Arabic_qaf = 1506;
pub const KEY_Arabic_question_mark = 1471;
pub const KEY_Arabic_ra = 1489;
pub const KEY_Arabic_rreh = 16778897;
pub const KEY_Arabic_sad = 1493;
pub const KEY_Arabic_seen = 1491;
pub const KEY_Arabic_semicolon = 1467;
pub const KEY_Arabic_shadda = 1521;
pub const KEY_Arabic_sheen = 1492;
pub const KEY_Arabic_sukun = 1522;
pub const KEY_Arabic_superscript_alef = 16778864;
pub const KEY_Arabic_switch = 65406;
pub const KEY_Arabic_tah = 1495;
pub const KEY_Arabic_tatweel = 1504;
pub const KEY_Arabic_tcheh = 16778886;
pub const KEY_Arabic_teh = 1482;
pub const KEY_Arabic_tehmarbuta = 1481;
pub const KEY_Arabic_thal = 1488;
pub const KEY_Arabic_theh = 1483;
pub const KEY_Arabic_tteh = 16778873;
pub const KEY_Arabic_veh = 16778916;
pub const KEY_Arabic_waw = 1512;
pub const KEY_Arabic_yeh = 1514;
pub const KEY_Arabic_yeh_baree = 16778962;
pub const KEY_Arabic_zah = 1496;
pub const KEY_Arabic_zain = 1490;
pub const KEY_Aring = 197;
pub const KEY_Armenian_AT = 16778552;
pub const KEY_Armenian_AYB = 16778545;
pub const KEY_Armenian_BEN = 16778546;
pub const KEY_Armenian_CHA = 16778569;
pub const KEY_Armenian_DA = 16778548;
pub const KEY_Armenian_DZA = 16778561;
pub const KEY_Armenian_E = 16778551;
pub const KEY_Armenian_FE = 16778582;
pub const KEY_Armenian_GHAT = 16778562;
pub const KEY_Armenian_GIM = 16778547;
pub const KEY_Armenian_HI = 16778565;
pub const KEY_Armenian_HO = 16778560;
pub const KEY_Armenian_INI = 16778555;
pub const KEY_Armenian_JE = 16778571;
pub const KEY_Armenian_KE = 16778580;
pub const KEY_Armenian_KEN = 16778559;
pub const KEY_Armenian_KHE = 16778557;
pub const KEY_Armenian_LYUN = 16778556;
pub const KEY_Armenian_MEN = 16778564;
pub const KEY_Armenian_NU = 16778566;
pub const KEY_Armenian_O = 16778581;
pub const KEY_Armenian_PE = 16778570;
pub const KEY_Armenian_PYUR = 16778579;
pub const KEY_Armenian_RA = 16778572;
pub const KEY_Armenian_RE = 16778576;
pub const KEY_Armenian_SE = 16778573;
pub const KEY_Armenian_SHA = 16778567;
pub const KEY_Armenian_TCHE = 16778563;
pub const KEY_Armenian_TO = 16778553;
pub const KEY_Armenian_TSA = 16778558;
pub const KEY_Armenian_TSO = 16778577;
pub const KEY_Armenian_TYUN = 16778575;
pub const KEY_Armenian_VEV = 16778574;
pub const KEY_Armenian_VO = 16778568;
pub const KEY_Armenian_VYUN = 16778578;
pub const KEY_Armenian_YECH = 16778549;
pub const KEY_Armenian_ZA = 16778550;
pub const KEY_Armenian_ZHE = 16778554;
pub const KEY_Armenian_accent = 16778587;
pub const KEY_Armenian_amanak = 16778588;
pub const KEY_Armenian_apostrophe = 16778586;
pub const KEY_Armenian_at = 16778600;
pub const KEY_Armenian_ayb = 16778593;
pub const KEY_Armenian_ben = 16778594;
pub const KEY_Armenian_but = 16778589;
pub const KEY_Armenian_cha = 16778617;
pub const KEY_Armenian_da = 16778596;
pub const KEY_Armenian_dza = 16778609;
pub const KEY_Armenian_e = 16778599;
pub const KEY_Armenian_exclam = 16778588;
pub const KEY_Armenian_fe = 16778630;
pub const KEY_Armenian_full_stop = 16778633;
pub const KEY_Armenian_ghat = 16778610;
pub const KEY_Armenian_gim = 16778595;
pub const KEY_Armenian_hi = 16778613;
pub const KEY_Armenian_ho = 16778608;
pub const KEY_Armenian_hyphen = 16778634;
pub const KEY_Armenian_ini = 16778603;
pub const KEY_Armenian_je = 16778619;
pub const KEY_Armenian_ke = 16778628;
pub const KEY_Armenian_ken = 16778607;
pub const KEY_Armenian_khe = 16778605;
pub const KEY_Armenian_ligature_ew = 16778631;
pub const KEY_Armenian_lyun = 16778604;
pub const KEY_Armenian_men = 16778612;
pub const KEY_Armenian_nu = 16778614;
pub const KEY_Armenian_o = 16778629;
pub const KEY_Armenian_paruyk = 16778590;
pub const KEY_Armenian_pe = 16778618;
pub const KEY_Armenian_pyur = 16778627;
pub const KEY_Armenian_question = 16778590;
pub const KEY_Armenian_ra = 16778620;
pub const KEY_Armenian_re = 16778624;
pub const KEY_Armenian_se = 16778621;
pub const KEY_Armenian_separation_mark = 16778589;
pub const KEY_Armenian_sha = 16778615;
pub const KEY_Armenian_shesht = 16778587;
pub const KEY_Armenian_tche = 16778611;
pub const KEY_Armenian_to = 16778601;
pub const KEY_Armenian_tsa = 16778606;
pub const KEY_Armenian_tso = 16778625;
pub const KEY_Armenian_tyun = 16778623;
pub const KEY_Armenian_verjaket = 16778633;
pub const KEY_Armenian_vev = 16778622;
pub const KEY_Armenian_vo = 16778616;
pub const KEY_Armenian_vyun = 16778626;
pub const KEY_Armenian_yech = 16778597;
pub const KEY_Armenian_yentamna = 16778634;
pub const KEY_Armenian_za = 16778598;
pub const KEY_Armenian_zhe = 16778602;
pub const KEY_AspectRatio = 268964215;
pub const KEY_Assistant = 268964423;
pub const KEY_Atilde = 195;
pub const KEY_AttendantOff = 268964380;
pub const KEY_AttendantOn = 268964379;
pub const KEY_AttendantToggle = 268964381;
pub const KEY_AudibleBell_Enable = 65146;
pub const KEY_Audio = 268964232;
pub const KEY_AudioCycleTrack = 269025179;
pub const KEY_AudioDesc = 268964462;
pub const KEY_AudioForward = 269025175;
pub const KEY_AudioLowerVolume = 269025041;
pub const KEY_AudioMedia = 269025074;
pub const KEY_AudioMicMute = 269025202;
pub const KEY_AudioMute = 269025042;
pub const KEY_AudioNext = 269025047;
pub const KEY_AudioPause = 269025073;
pub const KEY_AudioPlay = 269025044;
pub const KEY_AudioPreset = 269025206;
pub const KEY_AudioPrev = 269025046;
pub const KEY_AudioRaiseVolume = 269025043;
pub const KEY_AudioRandomPlay = 269025177;
pub const KEY_AudioRecord = 269025052;
pub const KEY_AudioRepeat = 269025176;
pub const KEY_AudioRewind = 269025086;
pub const KEY_AudioStop = 269025045;
pub const KEY_AutopilotEngageToggle = 268964477;
pub const KEY_Away = 269025165;
pub const KEY_B = 66;
pub const KEY_Babovedot = 16784898;
pub const KEY_Back = 269025062;
pub const KEY_BackForward = 269025087;
pub const KEY_BackSpace = 65288;
pub const KEY_Battery = 269025171;
pub const KEY_Begin = 65368;
pub const KEY_Blue = 269025190;
pub const KEY_Bluetooth = 269025172;
pub const KEY_Book = 269025106;
pub const KEY_BounceKeys_Enable = 65140;
pub const KEY_Break = 65387;
pub const KEY_BrightnessAdjust = 269025083;
pub const KEY_BrightnessAuto = 268964084;
pub const KEY_BrightnessMax = 268964433;
pub const KEY_BrightnessMin = 268964432;
pub const KEY_Buttonconfig = 268964416;
pub const KEY_Byelorussian_SHORTU = 1726;
pub const KEY_Byelorussian_shortu = 1710;
pub const KEY_C = 67;
pub const KEY_CD = 269025107;
pub const KEY_CH = 65186;
pub const KEY_C_H = 65189;
pub const KEY_C_h = 65188;
pub const KEY_Cabovedot = 709;
pub const KEY_Cacute = 454;
pub const KEY_Calculator = 269025053;
pub const KEY_Calendar = 269025056;
pub const KEY_CameraAccessDisable = 268964428;
pub const KEY_CameraAccessEnable = 268964427;
pub const KEY_CameraAccessToggle = 268964429;
pub const KEY_CameraDown = 268964376;
pub const KEY_CameraFocus = 268964368;
pub const KEY_CameraLeft = 268964377;
pub const KEY_CameraRight = 268964378;
pub const KEY_CameraUp = 268964375;
pub const KEY_CameraZoomIn = 268964373;
pub const KEY_CameraZoomOut = 268964374;
pub const KEY_Cancel = 65385;
pub const KEY_Caps_Lock = 65509;
pub const KEY_Ccaron = 456;
pub const KEY_Ccedilla = 199;
pub const KEY_Ccircumflex = 710;
pub const KEY_Ch = 65185;
pub const KEY_ChannelDown = 268964243;
pub const KEY_ChannelUp = 268964242;
pub const KEY_Clear = 65291;
pub const KEY_ClearGrab = 269024801;
pub const KEY_ClearvuSonar = 268964486;
pub const KEY_Close = 269025110;
pub const KEY_Codeinput = 65335;
pub const KEY_ColonSign = 16785569;
pub const KEY_Community = 269025085;
pub const KEY_ContextMenu = 268964278;
pub const KEY_ContrastAdjust = 269025058;
pub const KEY_ControlPanel = 268964419;
pub const KEY_Control_L = 65507;
pub const KEY_Control_R = 65508;
pub const KEY_Copy = 269025111;
pub const KEY_CruzeiroSign = 16785570;
pub const KEY_Cut = 269025112;
pub const KEY_CycleAngle = 269025180;
pub const KEY_Cyrillic_A = 1761;
pub const KEY_Cyrillic_BE = 1762;
pub const KEY_Cyrillic_CHE = 1790;
pub const KEY_Cyrillic_CHE_descender = 16778422;
pub const KEY_Cyrillic_CHE_vertstroke = 16778424;
pub const KEY_Cyrillic_DE = 1764;
pub const KEY_Cyrillic_DZHE = 1727;
pub const KEY_Cyrillic_E = 1788;
pub const KEY_Cyrillic_EF = 1766;
pub const KEY_Cyrillic_EL = 1772;
pub const KEY_Cyrillic_EM = 1773;
pub const KEY_Cyrillic_EN = 1774;
pub const KEY_Cyrillic_EN_descender = 16778402;
pub const KEY_Cyrillic_ER = 1778;
pub const KEY_Cyrillic_ES = 1779;
pub const KEY_Cyrillic_GHE = 1767;
pub const KEY_Cyrillic_GHE_bar = 16778386;
pub const KEY_Cyrillic_HA = 1768;
pub const KEY_Cyrillic_HARDSIGN = 1791;
pub const KEY_Cyrillic_HA_descender = 16778418;
pub const KEY_Cyrillic_I = 1769;
pub const KEY_Cyrillic_IE = 1765;
pub const KEY_Cyrillic_IO = 1715;
pub const KEY_Cyrillic_I_macron = 16778466;
pub const KEY_Cyrillic_JE = 1720;
pub const KEY_Cyrillic_KA = 1771;
pub const KEY_Cyrillic_KA_descender = 16778394;
pub const KEY_Cyrillic_KA_vertstroke = 16778396;
pub const KEY_Cyrillic_LJE = 1721;
pub const KEY_Cyrillic_NJE = 1722;
pub const KEY_Cyrillic_O = 1775;
pub const KEY_Cyrillic_O_bar = 16778472;
pub const KEY_Cyrillic_PE = 1776;
pub const KEY_Cyrillic_SCHWA = 16778456;
pub const KEY_Cyrillic_SHA = 1787;
pub const KEY_Cyrillic_SHCHA = 1789;
pub const KEY_Cyrillic_SHHA = 16778426;
pub const KEY_Cyrillic_SHORTI = 1770;
pub const KEY_Cyrillic_SOFTSIGN = 1784;
pub const KEY_Cyrillic_TE = 1780;
pub const KEY_Cyrillic_TSE = 1763;
pub const KEY_Cyrillic_U = 1781;
pub const KEY_Cyrillic_U_macron = 16778478;
pub const KEY_Cyrillic_U_straight = 16778414;
pub const KEY_Cyrillic_U_straight_bar = 16778416;
pub const KEY_Cyrillic_VE = 1783;
pub const KEY_Cyrillic_YA = 1777;
pub const KEY_Cyrillic_YERU = 1785;
pub const KEY_Cyrillic_YU = 1760;
pub const KEY_Cyrillic_ZE = 1786;
pub const KEY_Cyrillic_ZHE = 1782;
pub const KEY_Cyrillic_ZHE_descender = 16778390;
pub const KEY_Cyrillic_a = 1729;
pub const KEY_Cyrillic_be = 1730;
pub const KEY_Cyrillic_che = 1758;
pub const KEY_Cyrillic_che_descender = 16778423;
pub const KEY_Cyrillic_che_vertstroke = 16778425;
pub const KEY_Cyrillic_de = 1732;
pub const KEY_Cyrillic_dzhe = 1711;
pub const KEY_Cyrillic_e = 1756;
pub const KEY_Cyrillic_ef = 1734;
pub const KEY_Cyrillic_el = 1740;
pub const KEY_Cyrillic_em = 1741;
pub const KEY_Cyrillic_en = 1742;
pub const KEY_Cyrillic_en_descender = 16778403;
pub const KEY_Cyrillic_er = 1746;
pub const KEY_Cyrillic_es = 1747;
pub const KEY_Cyrillic_ghe = 1735;
pub const KEY_Cyrillic_ghe_bar = 16778387;
pub const KEY_Cyrillic_ha = 1736;
pub const KEY_Cyrillic_ha_descender = 16778419;
pub const KEY_Cyrillic_hardsign = 1759;
pub const KEY_Cyrillic_i = 1737;
pub const KEY_Cyrillic_i_macron = 16778467;
pub const KEY_Cyrillic_ie = 1733;
pub const KEY_Cyrillic_io = 1699;
pub const KEY_Cyrillic_je = 1704;
pub const KEY_Cyrillic_ka = 1739;
pub const KEY_Cyrillic_ka_descender = 16778395;
pub const KEY_Cyrillic_ka_vertstroke = 16778397;
pub const KEY_Cyrillic_lje = 1705;
pub const KEY_Cyrillic_nje = 1706;
pub const KEY_Cyrillic_o = 1743;
pub const KEY_Cyrillic_o_bar = 16778473;
pub const KEY_Cyrillic_pe = 1744;
pub const KEY_Cyrillic_schwa = 16778457;
pub const KEY_Cyrillic_sha = 1755;
pub const KEY_Cyrillic_shcha = 1757;
pub const KEY_Cyrillic_shha = 16778427;
pub const KEY_Cyrillic_shorti = 1738;
pub const KEY_Cyrillic_softsign = 1752;
pub const KEY_Cyrillic_te = 1748;
pub const KEY_Cyrillic_tse = 1731;
pub const KEY_Cyrillic_u = 1749;
pub const KEY_Cyrillic_u_macron = 16778479;
pub const KEY_Cyrillic_u_straight = 16778415;
pub const KEY_Cyrillic_u_straight_bar = 16778417;
pub const KEY_Cyrillic_ve = 1751;
pub const KEY_Cyrillic_ya = 1745;
pub const KEY_Cyrillic_yeru = 1753;
pub const KEY_Cyrillic_yu = 1728;
pub const KEY_Cyrillic_ze = 1754;
pub const KEY_Cyrillic_zhe = 1750;
pub const KEY_Cyrillic_zhe_descender = 16778391;
pub const KEY_D = 68;
pub const KEY_DOS = 269025114;
pub const KEY_DVD = 268964229;
pub const KEY_Dabovedot = 16784906;
pub const KEY_Data = 268964471;
pub const KEY_Database = 268964266;
pub const KEY_Dcaron = 463;
pub const KEY_Delete = 65535;
pub const KEY_Dictate = 268964426;
pub const KEY_Display = 269025113;
pub const KEY_DisplayOff = 268964085;
pub const KEY_DisplayToggle = 268964271;
pub const KEY_DoNotDisturb = 268964431;
pub const KEY_Documents = 269025115;
pub const KEY_DongSign = 16785579;
pub const KEY_Down = 65364;
pub const KEY_Dstroke = 464;
pub const KEY_DualRangeRadar = 268964483;
pub const KEY_E = 69;
pub const KEY_ENG = 957;
pub const KEY_ETH = 208;
pub const KEY_EZH = 16777655;
pub const KEY_Eabovedot = 972;
pub const KEY_Eacute = 201;
pub const KEY_Ebelowdot = 16785080;
pub const KEY_Ecaron = 460;
pub const KEY_Ecircumflex = 202;
pub const KEY_Ecircumflexacute = 16785086;
pub const KEY_Ecircumflexbelowdot = 16785094;
pub const KEY_Ecircumflexgrave = 16785088;
pub const KEY_Ecircumflexhook = 16785090;
pub const KEY_Ecircumflextilde = 16785092;
pub const KEY_EcuSign = 16785568;
pub const KEY_Ediaeresis = 203;
pub const KEY_Editor = 268964262;
pub const KEY_Egrave = 200;
pub const KEY_Ehook = 16785082;
pub const KEY_Eisu_Shift = 65327;
pub const KEY_Eisu_toggle = 65328;
pub const KEY_Eject = 269025068;
pub const KEY_Emacron = 938;
pub const KEY_EmojiPicker = 268964425;
pub const KEY_End = 65367;
pub const KEY_Eogonek = 458;
pub const KEY_Escape = 65307;
pub const KEY_Eth = 208;
pub const KEY_Etilde = 16785084;
pub const KEY_EuroSign = 8364;
pub const KEY_Excel = 269025116;
pub const KEY_Execute = 65378;
pub const KEY_Explorer = 269025117;
pub const KEY_F = 70;
pub const KEY_F1 = 65470;
pub const KEY_F10 = 65479;
pub const KEY_F11 = 65480;
pub const KEY_F12 = 65481;
pub const KEY_F13 = 65482;
pub const KEY_F14 = 65483;
pub const KEY_F15 = 65484;
pub const KEY_F16 = 65485;
pub const KEY_F17 = 65486;
pub const KEY_F18 = 65487;
pub const KEY_F19 = 65488;
pub const KEY_F2 = 65471;
pub const KEY_F20 = 65489;
pub const KEY_F21 = 65490;
pub const KEY_F22 = 65491;
pub const KEY_F23 = 65492;
pub const KEY_F24 = 65493;
pub const KEY_F25 = 65494;
pub const KEY_F26 = 65495;
pub const KEY_F27 = 65496;
pub const KEY_F28 = 65497;
pub const KEY_F29 = 65498;
pub const KEY_F3 = 65472;
pub const KEY_F30 = 65499;
pub const KEY_F31 = 65500;
pub const KEY_F32 = 65501;
pub const KEY_F33 = 65502;
pub const KEY_F34 = 65503;
pub const KEY_F35 = 65504;
pub const KEY_F4 = 65473;
pub const KEY_F5 = 65474;
pub const KEY_F6 = 65475;
pub const KEY_F7 = 65476;
pub const KEY_F8 = 65477;
pub const KEY_F9 = 65478;
pub const KEY_FFrancSign = 16785571;
pub const KEY_Fabovedot = 16784926;
pub const KEY_Farsi_0 = 16778992;
pub const KEY_Farsi_1 = 16778993;
pub const KEY_Farsi_2 = 16778994;
pub const KEY_Farsi_3 = 16778995;
pub const KEY_Farsi_4 = 16778996;
pub const KEY_Farsi_5 = 16778997;
pub const KEY_Farsi_6 = 16778998;
pub const KEY_Farsi_7 = 16778999;
pub const KEY_Farsi_8 = 16779000;
pub const KEY_Farsi_9 = 16779001;
pub const KEY_Farsi_yeh = 16778956;
pub const KEY_FastReverse = 268964469;
pub const KEY_Favorites = 269025072;
pub const KEY_Finance = 269025084;
pub const KEY_Find = 65384;
pub const KEY_First_Virtual_Screen = 65232;
pub const KEY_FishingChart = 268964481;
pub const KEY_Fn = 268964304;
pub const KEY_FnRightShift = 268964325;
pub const KEY_Fn_Esc = 268964305;
pub const KEY_Forward = 269025063;
pub const KEY_FrameBack = 269025181;
pub const KEY_FrameForward = 269025182;
pub const KEY_FullScreen = 269025208;
pub const KEY_G = 71;
pub const KEY_Gabovedot = 725;
pub const KEY_Game = 269025118;
pub const KEY_Gbreve = 683;
pub const KEY_Gcaron = 16777702;
pub const KEY_Gcedilla = 939;
pub const KEY_Gcircumflex = 728;
pub const KEY_Georgian_an = 16781520;
pub const KEY_Georgian_ban = 16781521;
pub const KEY_Georgian_can = 16781546;
pub const KEY_Georgian_char = 16781549;
pub const KEY_Georgian_chin = 16781545;
pub const KEY_Georgian_cil = 16781548;
pub const KEY_Georgian_don = 16781523;
pub const KEY_Georgian_en = 16781524;
pub const KEY_Georgian_fi = 16781558;
pub const KEY_Georgian_gan = 16781522;
pub const KEY_Georgian_ghan = 16781542;
pub const KEY_Georgian_hae = 16781552;
pub const KEY_Georgian_har = 16781556;
pub const KEY_Georgian_he = 16781553;
pub const KEY_Georgian_hie = 16781554;
pub const KEY_Georgian_hoe = 16781557;
pub const KEY_Georgian_in = 16781528;
pub const KEY_Georgian_jhan = 16781551;
pub const KEY_Georgian_jil = 16781547;
pub const KEY_Georgian_kan = 16781529;
pub const KEY_Georgian_khar = 16781541;
pub const KEY_Georgian_las = 16781530;
pub const KEY_Georgian_man = 16781531;
pub const KEY_Georgian_nar = 16781532;
pub const KEY_Georgian_on = 16781533;
pub const KEY_Georgian_par = 16781534;
pub const KEY_Georgian_phar = 16781540;
pub const KEY_Georgian_qar = 16781543;
pub const KEY_Georgian_rae = 16781536;
pub const KEY_Georgian_san = 16781537;
pub const KEY_Georgian_shin = 16781544;
pub const KEY_Georgian_tan = 16781527;
pub const KEY_Georgian_tar = 16781538;
pub const KEY_Georgian_un = 16781539;
pub const KEY_Georgian_vin = 16781525;
pub const KEY_Georgian_we = 16781555;
pub const KEY_Georgian_xan = 16781550;
pub const KEY_Georgian_zen = 16781526;
pub const KEY_Georgian_zhar = 16781535;
pub const KEY_Go = 269025119;
pub const KEY_GraphicsEditor = 268964264;
pub const KEY_Greek_ALPHA = 1985;
pub const KEY_Greek_ALPHAaccent = 1953;
pub const KEY_Greek_BETA = 1986;
pub const KEY_Greek_CHI = 2007;
pub const KEY_Greek_DELTA = 1988;
pub const KEY_Greek_EPSILON = 1989;
pub const KEY_Greek_EPSILONaccent = 1954;
pub const KEY_Greek_ETA = 1991;
pub const KEY_Greek_ETAaccent = 1955;
pub const KEY_Greek_GAMMA = 1987;
pub const KEY_Greek_IOTA = 1993;
pub const KEY_Greek_IOTAaccent = 1956;
pub const KEY_Greek_IOTAdiaeresis = 1957;
pub const KEY_Greek_IOTAdieresis = 1957;
pub const KEY_Greek_KAPPA = 1994;
pub const KEY_Greek_LAMBDA = 1995;
pub const KEY_Greek_LAMDA = 1995;
pub const KEY_Greek_MU = 1996;
pub const KEY_Greek_NU = 1997;
pub const KEY_Greek_OMEGA = 2009;
pub const KEY_Greek_OMEGAaccent = 1963;
pub const KEY_Greek_OMICRON = 1999;
pub const KEY_Greek_OMICRONaccent = 1959;
pub const KEY_Greek_PHI = 2006;
pub const KEY_Greek_PI = 2000;
pub const KEY_Greek_PSI = 2008;
pub const KEY_Greek_RHO = 2001;
pub const KEY_Greek_SIGMA = 2002;
pub const KEY_Greek_TAU = 2004;
pub const KEY_Greek_THETA = 1992;
pub const KEY_Greek_UPSILON = 2005;
pub const KEY_Greek_UPSILONaccent = 1960;
pub const KEY_Greek_UPSILONdieresis = 1961;
pub const KEY_Greek_XI = 1998;
pub const KEY_Greek_ZETA = 1990;
pub const KEY_Greek_accentdieresis = 1966;
pub const KEY_Greek_alpha = 2017;
pub const KEY_Greek_alphaaccent = 1969;
pub const KEY_Greek_beta = 2018;
pub const KEY_Greek_chi = 2039;
pub const KEY_Greek_delta = 2020;
pub const KEY_Greek_epsilon = 2021;
pub const KEY_Greek_epsilonaccent = 1970;
pub const KEY_Greek_eta = 2023;
pub const KEY_Greek_etaaccent = 1971;
pub const KEY_Greek_finalsmallsigma = 2035;
pub const KEY_Greek_gamma = 2019;
pub const KEY_Greek_horizbar = 1967;
pub const KEY_Greek_iota = 2025;
pub const KEY_Greek_iotaaccent = 1972;
pub const KEY_Greek_iotaaccentdieresis = 1974;
pub const KEY_Greek_iotadieresis = 1973;
pub const KEY_Greek_kappa = 2026;
pub const KEY_Greek_lambda = 2027;
pub const KEY_Greek_lamda = 2027;
pub const KEY_Greek_mu = 2028;
pub const KEY_Greek_nu = 2029;
pub const KEY_Greek_omega = 2041;
pub const KEY_Greek_omegaaccent = 1979;
pub const KEY_Greek_omicron = 2031;
pub const KEY_Greek_omicronaccent = 1975;
pub const KEY_Greek_phi = 2038;
pub const KEY_Greek_pi = 2032;
pub const KEY_Greek_psi = 2040;
pub const KEY_Greek_rho = 2033;
pub const KEY_Greek_sigma = 2034;
pub const KEY_Greek_switch = 65406;
pub const KEY_Greek_tau = 2036;
pub const KEY_Greek_theta = 2024;
pub const KEY_Greek_upsilon = 2037;
pub const KEY_Greek_upsilonaccent = 1976;
pub const KEY_Greek_upsilonaccentdieresis = 1978;
pub const KEY_Greek_upsilondieresis = 1977;
pub const KEY_Greek_xi = 2030;
pub const KEY_Greek_zeta = 2022;
pub const KEY_Green = 269025188;
pub const KEY_H = 72;
pub const KEY_Hangul = 65329;
pub const KEY_Hangul_A = 3775;
pub const KEY_Hangul_AE = 3776;
pub const KEY_Hangul_AraeA = 3830;
pub const KEY_Hangul_AraeAE = 3831;
pub const KEY_Hangul_Banja = 65337;
pub const KEY_Hangul_Cieuc = 3770;
pub const KEY_Hangul_Codeinput = 65335;
pub const KEY_Hangul_Dikeud = 3751;
pub const KEY_Hangul_E = 3780;
pub const KEY_Hangul_EO = 3779;
pub const KEY_Hangul_EU = 3793;
pub const KEY_Hangul_End = 65331;
pub const KEY_Hangul_Hanja = 65332;
pub const KEY_Hangul_Hieuh = 3774;
pub const KEY_Hangul_I = 3795;
pub const KEY_Hangul_Ieung = 3767;
pub const KEY_Hangul_J_Cieuc = 3818;
pub const KEY_Hangul_J_Dikeud = 3802;
pub const KEY_Hangul_J_Hieuh = 3822;
pub const KEY_Hangul_J_Ieung = 3816;
pub const KEY_Hangul_J_Jieuj = 3817;
pub const KEY_Hangul_J_Khieuq = 3819;
pub const KEY_Hangul_J_Kiyeog = 3796;
pub const KEY_Hangul_J_KiyeogSios = 3798;
pub const KEY_Hangul_J_KkogjiDalrinIeung = 3833;
pub const KEY_Hangul_J_Mieum = 3811;
pub const KEY_Hangul_J_Nieun = 3799;
pub const KEY_Hangul_J_NieunHieuh = 3801;
pub const KEY_Hangul_J_NieunJieuj = 3800;
pub const KEY_Hangul_J_PanSios = 3832;
pub const KEY_Hangul_J_Phieuf = 3821;
pub const KEY_Hangul_J_Pieub = 3812;
pub const KEY_Hangul_J_PieubSios = 3813;
pub const KEY_Hangul_J_Rieul = 3803;
pub const KEY_Hangul_J_RieulHieuh = 3810;
pub const KEY_Hangul_J_RieulKiyeog = 3804;
pub const KEY_Hangul_J_RieulMieum = 3805;
pub const KEY_Hangul_J_RieulPhieuf = 3809;
pub const KEY_Hangul_J_RieulPieub = 3806;
pub const KEY_Hangul_J_RieulSios = 3807;
pub const KEY_Hangul_J_RieulTieut = 3808;
pub const KEY_Hangul_J_Sios = 3814;
pub const KEY_Hangul_J_SsangKiyeog = 3797;
pub const KEY_Hangul_J_SsangSios = 3815;
pub const KEY_Hangul_J_Tieut = 3820;
pub const KEY_Hangul_J_YeorinHieuh = 3834;
pub const KEY_Hangul_Jamo = 65333;
pub const KEY_Hangul_Jeonja = 65336;
pub const KEY_Hangul_Jieuj = 3768;
pub const KEY_Hangul_Khieuq = 3771;
pub const KEY_Hangul_Kiyeog = 3745;
pub const KEY_Hangul_KiyeogSios = 3747;
pub const KEY_Hangul_KkogjiDalrinIeung = 3827;
pub const KEY_Hangul_Mieum = 3761;
pub const KEY_Hangul_MultipleCandidate = 65341;
pub const KEY_Hangul_Nieun = 3748;
pub const KEY_Hangul_NieunHieuh = 3750;
pub const KEY_Hangul_NieunJieuj = 3749;
pub const KEY_Hangul_O = 3783;
pub const KEY_Hangul_OE = 3786;
pub const KEY_Hangul_PanSios = 3826;
pub const KEY_Hangul_Phieuf = 3773;
pub const KEY_Hangul_Pieub = 3762;
pub const KEY_Hangul_PieubSios = 3764;
pub const KEY_Hangul_PostHanja = 65339;
pub const KEY_Hangul_PreHanja = 65338;
pub const KEY_Hangul_PreviousCandidate = 65342;
pub const KEY_Hangul_Rieul = 3753;
pub const KEY_Hangul_RieulHieuh = 3760;
pub const KEY_Hangul_RieulKiyeog = 3754;
pub const KEY_Hangul_RieulMieum = 3755;
pub const KEY_Hangul_RieulPhieuf = 3759;
pub const KEY_Hangul_RieulPieub = 3756;
pub const KEY_Hangul_RieulSios = 3757;
pub const KEY_Hangul_RieulTieut = 3758;
pub const KEY_Hangul_RieulYeorinHieuh = 3823;
pub const KEY_Hangul_Romaja = 65334;
pub const KEY_Hangul_SingleCandidate = 65340;
pub const KEY_Hangul_Sios = 3765;
pub const KEY_Hangul_Special = 65343;
pub const KEY_Hangul_SsangDikeud = 3752;
pub const KEY_Hangul_SsangJieuj = 3769;
pub const KEY_Hangul_SsangKiyeog = 3746;
pub const KEY_Hangul_SsangPieub = 3763;
pub const KEY_Hangul_SsangSios = 3766;
pub const KEY_Hangul_Start = 65330;
pub const KEY_Hangul_SunkyeongeumMieum = 3824;
pub const KEY_Hangul_SunkyeongeumPhieuf = 3828;
pub const KEY_Hangul_SunkyeongeumPieub = 3825;
pub const KEY_Hangul_Tieut = 3772;
pub const KEY_Hangul_U = 3788;
pub const KEY_Hangul_WA = 3784;
pub const KEY_Hangul_WAE = 3785;
pub const KEY_Hangul_WE = 3790;
pub const KEY_Hangul_WEO = 3789;
pub const KEY_Hangul_WI = 3791;
pub const KEY_Hangul_YA = 3777;
pub const KEY_Hangul_YAE = 3778;
pub const KEY_Hangul_YE = 3782;
pub const KEY_Hangul_YEO = 3781;
pub const KEY_Hangul_YI = 3794;
pub const KEY_Hangul_YO = 3787;
pub const KEY_Hangul_YU = 3792;
pub const KEY_Hangul_YeorinHieuh = 3829;
pub const KEY_Hangul_switch = 65406;
pub const KEY_HangupPhone = 268964286;
pub const KEY_Hankaku = 65321;
pub const KEY_Hcircumflex = 678;
pub const KEY_Hebrew_switch = 65406;
pub const KEY_Help = 65386;
pub const KEY_Henkan = 65315;
pub const KEY_Henkan_Mode = 65315;
pub const KEY_Hibernate = 269025192;
pub const KEY_Hiragana = 65317;
pub const KEY_Hiragana_Katakana = 65319;
pub const KEY_History = 269025079;
pub const KEY_Home = 65360;
pub const KEY_HomePage = 269025048;
pub const KEY_HotLinks = 269025082;
pub const KEY_Hstroke = 673;
pub const KEY_Hyper_L = 65517;
pub const KEY_Hyper_R = 65518;
pub const KEY_I = 73;
pub const KEY_ISO_Center_Object = 65075;
pub const KEY_ISO_Continuous_Underline = 65072;
pub const KEY_ISO_Discontinuous_Underline = 65073;
pub const KEY_ISO_Emphasize = 65074;
pub const KEY_ISO_Enter = 65076;
pub const KEY_ISO_Fast_Cursor_Down = 65071;
pub const KEY_ISO_Fast_Cursor_Left = 65068;
pub const KEY_ISO_Fast_Cursor_Right = 65069;
pub const KEY_ISO_Fast_Cursor_Up = 65070;
pub const KEY_ISO_First_Group = 65036;
pub const KEY_ISO_First_Group_Lock = 65037;
pub const KEY_ISO_Group_Latch = 65030;
pub const KEY_ISO_Group_Lock = 65031;
pub const KEY_ISO_Group_Shift = 65406;
pub const KEY_ISO_Last_Group = 65038;
pub const KEY_ISO_Last_Group_Lock = 65039;
pub const KEY_ISO_Left_Tab = 65056;
pub const KEY_ISO_Level2_Latch = 65026;
pub const KEY_ISO_Level3_Latch = 65028;
pub const KEY_ISO_Level3_Lock = 65029;
pub const KEY_ISO_Level3_Shift = 65027;
pub const KEY_ISO_Level5_Latch = 65042;
pub const KEY_ISO_Level5_Lock = 65043;
pub const KEY_ISO_Level5_Shift = 65041;
pub const KEY_ISO_Lock = 65025;
pub const KEY_ISO_Move_Line_Down = 65058;
pub const KEY_ISO_Move_Line_Up = 65057;
pub const KEY_ISO_Next_Group = 65032;
pub const KEY_ISO_Next_Group_Lock = 65033;
pub const KEY_ISO_Partial_Line_Down = 65060;
pub const KEY_ISO_Partial_Line_Up = 65059;
pub const KEY_ISO_Partial_Space_Left = 65061;
pub const KEY_ISO_Partial_Space_Right = 65062;
pub const KEY_ISO_Prev_Group = 65034;
pub const KEY_ISO_Prev_Group_Lock = 65035;
pub const KEY_ISO_Release_Both_Margins = 65067;
pub const KEY_ISO_Release_Margin_Left = 65065;
pub const KEY_ISO_Release_Margin_Right = 65066;
pub const KEY_ISO_Set_Margin_Left = 65063;
pub const KEY_ISO_Set_Margin_Right = 65064;
pub const KEY_Iabovedot = 681;
pub const KEY_Iacute = 205;
pub const KEY_Ibelowdot = 16785098;
pub const KEY_Ibreve = 16777516;
pub const KEY_Icircumflex = 206;
pub const KEY_Idiaeresis = 207;
pub const KEY_Igrave = 204;
pub const KEY_Ihook = 16785096;
pub const KEY_Imacron = 975;
pub const KEY_Images = 268964282;
pub const KEY_Info = 268964198;
pub const KEY_Insert = 65379;
pub const KEY_Iogonek = 967;
pub const KEY_Itilde = 933;
pub const KEY_J = 74;
pub const KEY_Jcircumflex = 684;
pub const KEY_Journal = 268964418;
pub const KEY_K = 75;
pub const KEY_KP_0 = 65456;
pub const KEY_KP_1 = 65457;
pub const KEY_KP_2 = 65458;
pub const KEY_KP_3 = 65459;
pub const KEY_KP_4 = 65460;
pub const KEY_KP_5 = 65461;
pub const KEY_KP_6 = 65462;
pub const KEY_KP_7 = 65463;
pub const KEY_KP_8 = 65464;
pub const KEY_KP_9 = 65465;
pub const KEY_KP_Add = 65451;
pub const KEY_KP_Begin = 65437;
pub const KEY_KP_Decimal = 65454;
pub const KEY_KP_Delete = 65439;
pub const KEY_KP_Divide = 65455;
pub const KEY_KP_Down = 65433;
pub const KEY_KP_End = 65436;
pub const KEY_KP_Enter = 65421;
pub const KEY_KP_Equal = 65469;
pub const KEY_KP_F1 = 65425;
pub const KEY_KP_F2 = 65426;
pub const KEY_KP_F3 = 65427;
pub const KEY_KP_F4 = 65428;
pub const KEY_KP_Home = 65429;
pub const KEY_KP_Insert = 65438;
pub const KEY_KP_Left = 65430;
pub const KEY_KP_Multiply = 65450;
pub const KEY_KP_Next = 65435;
pub const KEY_KP_Page_Down = 65435;
pub const KEY_KP_Page_Up = 65434;
pub const KEY_KP_Prior = 65434;
pub const KEY_KP_Right = 65432;
pub const KEY_KP_Separator = 65452;
pub const KEY_KP_Space = 65408;
pub const KEY_KP_Subtract = 65453;
pub const KEY_KP_Tab = 65417;
pub const KEY_KP_Up = 65431;
pub const KEY_Kana_Lock = 65325;
pub const KEY_Kana_Shift = 65326;
pub const KEY_Kanji = 65313;
pub const KEY_Kanji_Bangou = 65335;
pub const KEY_Katakana = 65318;
pub const KEY_KbdBrightnessDown = 269025030;
pub const KEY_KbdBrightnessUp = 269025029;
pub const KEY_KbdInputAssistAccept = 268964452;
pub const KEY_KbdInputAssistCancel = 268964453;
pub const KEY_KbdInputAssistNext = 268964449;
pub const KEY_KbdInputAssistNextgroup = 268964451;
pub const KEY_KbdInputAssistPrev = 268964448;
pub const KEY_KbdInputAssistPrevgroup = 268964450;
pub const KEY_KbdLcdMenu1 = 268964536;
pub const KEY_KbdLcdMenu2 = 268964537;
pub const KEY_KbdLcdMenu3 = 268964538;
pub const KEY_KbdLcdMenu4 = 268964539;
pub const KEY_KbdLcdMenu5 = 268964540;
pub const KEY_KbdLightOnOff = 269025028;
pub const KEY_Kcedilla = 979;
pub const KEY_Keyboard = 269025203;
pub const KEY_Korean_Won = 3839;
pub const KEY_L = 76;
pub const KEY_L1 = 65480;
pub const KEY_L10 = 65489;
pub const KEY_L2 = 65481;
pub const KEY_L3 = 65482;
pub const KEY_L4 = 65483;
pub const KEY_L5 = 65484;
pub const KEY_L6 = 65485;
pub const KEY_L7 = 65486;
pub const KEY_L8 = 65487;
pub const KEY_L9 = 65488;
pub const KEY_Lacute = 453;
pub const KEY_Last_Virtual_Screen = 65236;
pub const KEY_Launch0 = 269025088;
pub const KEY_Launch1 = 269025089;
pub const KEY_Launch2 = 269025090;
pub const KEY_Launch3 = 269025091;
pub const KEY_Launch4 = 269025092;
pub const KEY_Launch5 = 269025093;
pub const KEY_Launch6 = 269025094;
pub const KEY_Launch7 = 269025095;
pub const KEY_Launch8 = 269025096;
pub const KEY_Launch9 = 269025097;
pub const KEY_LaunchA = 269025098;
pub const KEY_LaunchB = 269025099;
pub const KEY_LaunchC = 269025100;
pub const KEY_LaunchD = 269025101;
pub const KEY_LaunchE = 269025102;
pub const KEY_LaunchF = 269025103;
pub const KEY_Lbelowdot = 16784950;
pub const KEY_Lcaron = 421;
pub const KEY_Lcedilla = 934;
pub const KEY_Left = 65361;
pub const KEY_LeftDown = 268964457;
pub const KEY_LeftUp = 268964456;
pub const KEY_LightBulb = 269025077;
pub const KEY_LightsToggle = 268964382;
pub const KEY_Linefeed = 65290;
pub const KEY_LiraSign = 16785572;
pub const KEY_LogGrabInfo = 269024805;
pub const KEY_LogOff = 269025121;
pub const KEY_LogWindowTree = 269024804;
pub const KEY_Lstroke = 419;
pub const KEY_M = 77;
pub const KEY_Mabovedot = 16784960;
pub const KEY_Macedonia_DSE = 1717;
pub const KEY_Macedonia_GJE = 1714;
pub const KEY_Macedonia_KJE = 1724;
pub const KEY_Macedonia_dse = 1701;
pub const KEY_Macedonia_gje = 1698;
pub const KEY_Macedonia_kje = 1708;
pub const KEY_Macro1 = 268964496;
pub const KEY_Macro10 = 268964505;
pub const KEY_Macro11 = 268964506;
pub const KEY_Macro12 = 268964507;
pub const KEY_Macro13 = 268964508;
pub const KEY_Macro14 = 268964509;
pub const KEY_Macro15 = 268964510;
pub const KEY_Macro16 = 268964511;
pub const KEY_Macro17 = 268964512;
pub const KEY_Macro18 = 268964513;
pub const KEY_Macro19 = 268964514;
pub const KEY_Macro2 = 268964497;
pub const KEY_Macro20 = 268964515;
pub const KEY_Macro21 = 268964516;
pub const KEY_Macro22 = 268964517;
pub const KEY_Macro23 = 268964518;
pub const KEY_Macro24 = 268964519;
pub const KEY_Macro25 = 268964520;
pub const KEY_Macro26 = 268964521;
pub const KEY_Macro27 = 268964522;
pub const KEY_Macro28 = 268964523;
pub const KEY_Macro29 = 268964524;
pub const KEY_Macro3 = 268964498;
pub const KEY_Macro30 = 268964525;
pub const KEY_Macro4 = 268964499;
pub const KEY_Macro5 = 268964500;
pub const KEY_Macro6 = 268964501;
pub const KEY_Macro7 = 268964502;
pub const KEY_Macro8 = 268964503;
pub const KEY_Macro9 = 268964504;
pub const KEY_MacroPreset1 = 268964531;
pub const KEY_MacroPreset2 = 268964532;
pub const KEY_MacroPreset3 = 268964533;
pub const KEY_MacroPresetCycle = 268964530;
pub const KEY_MacroRecordStart = 268964528;
pub const KEY_MacroRecordStop = 268964529;
pub const KEY_Mae_Koho = 65342;
pub const KEY_Mail = 269025049;
pub const KEY_MailForward = 269025168;
pub const KEY_MarkWaypoint = 268964478;
pub const KEY_Market = 269025122;
pub const KEY_Massyo = 65324;
pub const KEY_MediaRepeat = 268964279;
pub const KEY_MediaTopMenu = 268964459;
pub const KEY_Meeting = 269025123;
pub const KEY_Memo = 269025054;
pub const KEY_Menu = 65383;
pub const KEY_MenuKB = 269025125;
pub const KEY_MenuPB = 269025126;
pub const KEY_Messenger = 269025166;
pub const KEY_Meta_L = 65511;
pub const KEY_Meta_R = 65512;
pub const KEY_MillSign = 16785573;
pub const KEY_ModeLock = 269025025;
pub const KEY_Mode_switch = 65406;
pub const KEY_MonBrightnessCycle = 269025031;
pub const KEY_MonBrightnessDown = 269025027;
pub const KEY_MonBrightnessUp = 269025026;
pub const KEY_MouseKeys_Accel_Enable = 65143;
pub const KEY_MouseKeys_Enable = 65142;
pub const KEY_Muhenkan = 65314;
pub const KEY_Multi_key = 65312;
pub const KEY_MultipleCandidate = 65341;
pub const KEY_Music = 269025170;
pub const KEY_MyComputer = 269025075;
pub const KEY_MySites = 269025127;
pub const KEY_N = 78;
pub const KEY_Nacute = 465;
pub const KEY_NairaSign = 16785574;
pub const KEY_NavChart = 268964480;
pub const KEY_NavInfo = 268964488;
pub const KEY_Ncaron = 466;
pub const KEY_Ncedilla = 977;
pub const KEY_New = 269025128;
pub const KEY_NewSheqelSign = 16785578;
pub const KEY_News = 269025129;
pub const KEY_Next = 65366;
pub const KEY_NextElement = 268964475;
pub const KEY_NextFavorite = 268964464;
pub const KEY_Next_VMode = 269024802;
pub const KEY_Next_Virtual_Screen = 65234;
pub const KEY_NotificationCenter = 268964284;
pub const KEY_Ntilde = 209;
pub const KEY_Num_Lock = 65407;
pub const KEY_Numeric0 = 268964352;
pub const KEY_Numeric1 = 268964353;
pub const KEY_Numeric11 = 268964460;
pub const KEY_Numeric12 = 268964461;
pub const KEY_Numeric2 = 268964354;
pub const KEY_Numeric3 = 268964355;
pub const KEY_Numeric4 = 268964356;
pub const KEY_Numeric5 = 268964357;
pub const KEY_Numeric6 = 268964358;
pub const KEY_Numeric7 = 268964359;
pub const KEY_Numeric8 = 268964360;
pub const KEY_Numeric9 = 268964361;
pub const KEY_NumericA = 268964364;
pub const KEY_NumericB = 268964365;
pub const KEY_NumericC = 268964366;
pub const KEY_NumericD = 268964367;
pub const KEY_NumericPound = 268964363;
pub const KEY_NumericStar = 268964362;
pub const KEY_O = 79;
pub const KEY_OE = 5052;
pub const KEY_Oacute = 211;
pub const KEY_Obarred = 16777631;
pub const KEY_Obelowdot = 16785100;
pub const KEY_Ocaron = 16777681;
pub const KEY_Ocircumflex = 212;
pub const KEY_Ocircumflexacute = 16785104;
pub const KEY_Ocircumflexbelowdot = 16785112;
pub const KEY_Ocircumflexgrave = 16785106;
pub const KEY_Ocircumflexhook = 16785108;
pub const KEY_Ocircumflextilde = 16785110;
pub const KEY_Odiaeresis = 214;
pub const KEY_Odoubleacute = 469;
pub const KEY_OfficeHome = 269025130;
pub const KEY_Ograve = 210;
pub const KEY_Ohook = 16785102;
pub const KEY_Ohorn = 16777632;
pub const KEY_Ohornacute = 16785114;
pub const KEY_Ohornbelowdot = 16785122;
pub const KEY_Ohorngrave = 16785116;
pub const KEY_Ohornhook = 16785118;
pub const KEY_Ohorntilde = 16785120;
pub const KEY_Omacron = 978;
pub const KEY_OnScreenKeyboard = 268964472;
pub const KEY_Ooblique = 216;
pub const KEY_Open = 269025131;
pub const KEY_OpenURL = 269025080;
pub const KEY_Option = 269025132;
pub const KEY_Oslash = 216;
pub const KEY_Otilde = 213;
pub const KEY_Overlay1_Enable = 65144;
pub const KEY_Overlay2_Enable = 65145;
pub const KEY_P = 80;
pub const KEY_Pabovedot = 16784982;
pub const KEY_Page_Down = 65366;
pub const KEY_Page_Up = 65365;
pub const KEY_Paste = 269025133;
pub const KEY_Pause = 65299;
pub const KEY_PauseRecord = 268964466;
pub const KEY_PesetaSign = 16785575;
pub const KEY_Phone = 269025134;
pub const KEY_PickupPhone = 268964285;
pub const KEY_Pictures = 269025169;
pub const KEY_Pointer_Accelerate = 65274;
pub const KEY_Pointer_Button1 = 65257;
pub const KEY_Pointer_Button2 = 65258;
pub const KEY_Pointer_Button3 = 65259;
pub const KEY_Pointer_Button4 = 65260;
pub const KEY_Pointer_Button5 = 65261;
pub const KEY_Pointer_Button_Dflt = 65256;
pub const KEY_Pointer_DblClick1 = 65263;
pub const KEY_Pointer_DblClick2 = 65264;
pub const KEY_Pointer_DblClick3 = 65265;
pub const KEY_Pointer_DblClick4 = 65266;
pub const KEY_Pointer_DblClick5 = 65267;
pub const KEY_Pointer_DblClick_Dflt = 65262;
pub const KEY_Pointer_DfltBtnNext = 65275;
pub const KEY_Pointer_DfltBtnPrev = 65276;
pub const KEY_Pointer_Down = 65251;
pub const KEY_Pointer_DownLeft = 65254;
pub const KEY_Pointer_DownRight = 65255;
pub const KEY_Pointer_Drag1 = 65269;
pub const KEY_Pointer_Drag2 = 65270;
pub const KEY_Pointer_Drag3 = 65271;
pub const KEY_Pointer_Drag4 = 65272;
pub const KEY_Pointer_Drag5 = 65277;
pub const KEY_Pointer_Drag_Dflt = 65268;
pub const KEY_Pointer_EnableKeys = 65273;
pub const KEY_Pointer_Left = 65248;
pub const KEY_Pointer_Right = 65249;
pub const KEY_Pointer_Up = 65250;
pub const KEY_Pointer_UpLeft = 65252;
pub const KEY_Pointer_UpRight = 65253;
pub const KEY_PowerDown = 269025057;
pub const KEY_PowerOff = 269025066;
pub const KEY_Presentation = 268964265;
pub const KEY_Prev_VMode = 269024803;
pub const KEY_Prev_Virtual_Screen = 65233;
pub const KEY_PreviousCandidate = 65342;
pub const KEY_PreviousElement = 268964476;
pub const KEY_Print = 65377;
pub const KEY_Prior = 65365;
pub const KEY_PrivacyScreenToggle = 268964473;
pub const KEY_Q = 81;
pub const KEY_R = 82;
pub const KEY_R1 = 65490;
pub const KEY_R10 = 65499;
pub const KEY_R11 = 65500;
pub const KEY_R12 = 65501;
pub const KEY_R13 = 65502;
pub const KEY_R14 = 65503;
pub const KEY_R15 = 65504;
pub const KEY_R2 = 65491;
pub const KEY_R3 = 65492;
pub const KEY_R4 = 65493;
pub const KEY_R5 = 65494;
pub const KEY_R6 = 65495;
pub const KEY_R7 = 65496;
pub const KEY_R8 = 65497;
pub const KEY_R9 = 65498;
pub const KEY_RFKill = 269025205;
pub const KEY_Racute = 448;
pub const KEY_RadarOverlay = 268964484;
pub const KEY_Rcaron = 472;
pub const KEY_Rcedilla = 931;
pub const KEY_Red = 269025187;
pub const KEY_Redo = 65382;
pub const KEY_Refresh = 269025065;
pub const KEY_RefreshRateToggle = 268964402;
pub const KEY_Reload = 269025139;
pub const KEY_RepeatKeys_Enable = 65138;
pub const KEY_Reply = 269025138;
pub const KEY_Return = 65293;
pub const KEY_Right = 65363;
pub const KEY_RightDown = 268964455;
pub const KEY_RightUp = 268964454;
pub const KEY_RockerDown = 269025060;
pub const KEY_RockerEnter = 269025061;
pub const KEY_RockerUp = 269025059;
pub const KEY_Romaji = 65316;
pub const KEY_RootMenu = 268964458;
pub const KEY_RotateWindows = 269025140;
pub const KEY_RotationKB = 269025142;
pub const KEY_RotationLockToggle = 269025207;
pub const KEY_RotationPB = 269025141;
pub const KEY_RupeeSign = 16785576;
pub const KEY_S = 83;
pub const KEY_SCHWA = 16777615;
pub const KEY_Sabovedot = 16784992;
pub const KEY_Sacute = 422;
pub const KEY_Save = 269025143;
pub const KEY_Scaron = 425;
pub const KEY_Scedilla = 426;
pub const KEY_Scircumflex = 734;
pub const KEY_ScreenSaver = 269025069;
pub const KEY_Screensaver = 268964421;
pub const KEY_ScrollClick = 269025146;
pub const KEY_ScrollDown = 269025145;
pub const KEY_ScrollUp = 269025144;
pub const KEY_Scroll_Lock = 65300;
pub const KEY_Search = 269025051;
pub const KEY_Select = 65376;
pub const KEY_SelectButton = 269025184;
pub const KEY_SelectiveScreenshot = 268964474;
pub const KEY_Send = 269025147;
pub const KEY_Serbian_DJE = 1713;
pub const KEY_Serbian_DZE = 1727;
pub const KEY_Serbian_JE = 1720;
pub const KEY_Serbian_LJE = 1721;
pub const KEY_Serbian_NJE = 1722;
pub const KEY_Serbian_TSHE = 1723;
pub const KEY_Serbian_dje = 1697;
pub const KEY_Serbian_dze = 1711;
pub const KEY_Serbian_je = 1704;
pub const KEY_Serbian_lje = 1705;
pub const KEY_Serbian_nje = 1706;
pub const KEY_Serbian_tshe = 1707;
pub const KEY_Shift_L = 65505;
pub const KEY_Shift_Lock = 65510;
pub const KEY_Shift_R = 65506;
pub const KEY_Shop = 269025078;
pub const KEY_SidevuSonar = 268964487;
pub const KEY_SingleCandidate = 65340;
pub const KEY_SingleRangeRadar = 268964482;
pub const KEY_Sinh_a = 16780677;
pub const KEY_Sinh_aa = 16780678;
pub const KEY_Sinh_aa2 = 16780751;
pub const KEY_Sinh_ae = 16780679;
pub const KEY_Sinh_ae2 = 16780752;
pub const KEY_Sinh_aee = 16780680;
pub const KEY_Sinh_aee2 = 16780753;
pub const KEY_Sinh_ai = 16780691;
pub const KEY_Sinh_ai2 = 16780763;
pub const KEY_Sinh_al = 16780746;
pub const KEY_Sinh_au = 16780694;
pub const KEY_Sinh_au2 = 16780766;
pub const KEY_Sinh_ba = 16780726;
pub const KEY_Sinh_bha = 16780727;
pub const KEY_Sinh_ca = 16780704;
pub const KEY_Sinh_cha = 16780705;
pub const KEY_Sinh_dda = 16780713;
pub const KEY_Sinh_ddha = 16780714;
pub const KEY_Sinh_dha = 16780719;
pub const KEY_Sinh_dhha = 16780720;
pub const KEY_Sinh_e = 16780689;
pub const KEY_Sinh_e2 = 16780761;
pub const KEY_Sinh_ee = 16780690;
pub const KEY_Sinh_ee2 = 16780762;
pub const KEY_Sinh_fa = 16780742;
pub const KEY_Sinh_ga = 16780700;
pub const KEY_Sinh_gha = 16780701;
pub const KEY_Sinh_h2 = 16780675;
pub const KEY_Sinh_ha = 16780740;
pub const KEY_Sinh_i = 16780681;
pub const KEY_Sinh_i2 = 16780754;
pub const KEY_Sinh_ii = 16780682;
pub const KEY_Sinh_ii2 = 16780755;
pub const KEY_Sinh_ja = 16780706;
pub const KEY_Sinh_jha = 16780707;
pub const KEY_Sinh_jnya = 16780709;
pub const KEY_Sinh_ka = 16780698;
pub const KEY_Sinh_kha = 16780699;
pub const KEY_Sinh_kunddaliya = 16780788;
pub const KEY_Sinh_la = 16780733;
pub const KEY_Sinh_lla = 16780741;
pub const KEY_Sinh_lu = 16780687;
pub const KEY_Sinh_lu2 = 16780767;
pub const KEY_Sinh_luu = 16780688;
pub const KEY_Sinh_luu2 = 16780787;
pub const KEY_Sinh_ma = 16780728;
pub const KEY_Sinh_mba = 16780729;
pub const KEY_Sinh_na = 16780721;
pub const KEY_Sinh_ndda = 16780716;
pub const KEY_Sinh_ndha = 16780723;
pub const KEY_Sinh_ng = 16780674;
pub const KEY_Sinh_ng2 = 16780702;
pub const KEY_Sinh_nga = 16780703;
pub const KEY_Sinh_nja = 16780710;
pub const KEY_Sinh_nna = 16780715;
pub const KEY_Sinh_nya = 16780708;
pub const KEY_Sinh_o = 16780692;
pub const KEY_Sinh_o2 = 16780764;
pub const KEY_Sinh_oo = 16780693;
pub const KEY_Sinh_oo2 = 16780765;
pub const KEY_Sinh_pa = 16780724;
pub const KEY_Sinh_pha = 16780725;
pub const KEY_Sinh_ra = 16780731;
pub const KEY_Sinh_ri = 16780685;
pub const KEY_Sinh_rii = 16780686;
pub const KEY_Sinh_ru2 = 16780760;
pub const KEY_Sinh_ruu2 = 16780786;
pub const KEY_Sinh_sa = 16780739;
pub const KEY_Sinh_sha = 16780737;
pub const KEY_Sinh_ssha = 16780738;
pub const KEY_Sinh_tha = 16780717;
pub const KEY_Sinh_thha = 16780718;
pub const KEY_Sinh_tta = 16780711;
pub const KEY_Sinh_ttha = 16780712;
pub const KEY_Sinh_u = 16780683;
pub const KEY_Sinh_u2 = 16780756;
pub const KEY_Sinh_uu = 16780684;
pub const KEY_Sinh_uu2 = 16780758;
pub const KEY_Sinh_va = 16780736;
pub const KEY_Sinh_ya = 16780730;
pub const KEY_Sleep = 269025071;
pub const KEY_SlowKeys_Enable = 65139;
pub const KEY_SlowReverse = 268964470;
pub const KEY_Sos = 268964479;
pub const KEY_Spell = 269025148;
pub const KEY_SpellCheck = 268964272;
pub const KEY_SplitScreen = 269025149;
pub const KEY_Standby = 269025040;
pub const KEY_Start = 269025050;
pub const KEY_StickyKeys_Enable = 65141;
pub const KEY_Stop = 269025064;
pub const KEY_StopRecord = 268964465;
pub const KEY_Subtitle = 269025178;
pub const KEY_Super_L = 65515;
pub const KEY_Super_R = 65516;
pub const KEY_Support = 269025150;
pub const KEY_Suspend = 269025191;
pub const KEY_Switch_VT_1 = 269024769;
pub const KEY_Switch_VT_10 = 269024778;
pub const KEY_Switch_VT_11 = 269024779;
pub const KEY_Switch_VT_12 = 269024780;
pub const KEY_Switch_VT_2 = 269024770;
pub const KEY_Switch_VT_3 = 269024771;
pub const KEY_Switch_VT_4 = 269024772;
pub const KEY_Switch_VT_5 = 269024773;
pub const KEY_Switch_VT_6 = 269024774;
pub const KEY_Switch_VT_7 = 269024775;
pub const KEY_Switch_VT_8 = 269024776;
pub const KEY_Switch_VT_9 = 269024777;
pub const KEY_Sys_Req = 65301;
pub const KEY_T = 84;
pub const KEY_THORN = 222;
pub const KEY_Tab = 65289;
pub const KEY_Tabovedot = 16785002;
pub const KEY_TaskPane = 269025151;
pub const KEY_Taskmanager = 268964417;
pub const KEY_Tcaron = 427;
pub const KEY_Tcedilla = 478;
pub const KEY_Terminal = 269025152;
pub const KEY_Terminate_Server = 65237;
pub const KEY_Thai_baht = 3551;
pub const KEY_Thai_bobaimai = 3514;
pub const KEY_Thai_chochan = 3496;
pub const KEY_Thai_chochang = 3498;
pub const KEY_Thai_choching = 3497;
pub const KEY_Thai_chochoe = 3500;
pub const KEY_Thai_dochada = 3502;
pub const KEY_Thai_dodek = 3508;
pub const KEY_Thai_fofa = 3517;
pub const KEY_Thai_fofan = 3519;
pub const KEY_Thai_hohip = 3531;
pub const KEY_Thai_honokhuk = 3534;
pub const KEY_Thai_khokhai = 3490;
pub const KEY_Thai_khokhon = 3493;
pub const KEY_Thai_khokhuat = 3491;
pub const KEY_Thai_khokhwai = 3492;
pub const KEY_Thai_khorakhang = 3494;
pub const KEY_Thai_kokai = 3489;
pub const KEY_Thai_lakkhangyao = 3557;
pub const KEY_Thai_lekchet = 3575;
pub const KEY_Thai_lekha = 3573;
pub const KEY_Thai_lekhok = 3574;
pub const KEY_Thai_lekkao = 3577;
pub const KEY_Thai_leknung = 3569;
pub const KEY_Thai_lekpaet = 3576;
pub const KEY_Thai_leksam = 3571;
pub const KEY_Thai_leksi = 3572;
pub const KEY_Thai_leksong = 3570;
pub const KEY_Thai_leksun = 3568;
pub const KEY_Thai_lochula = 3532;
pub const KEY_Thai_loling = 3525;
pub const KEY_Thai_lu = 3526;
pub const KEY_Thai_maichattawa = 3563;
pub const KEY_Thai_maiek = 3560;
pub const KEY_Thai_maihanakat = 3537;
pub const KEY_Thai_maihanakat_maitho = 3550;
pub const KEY_Thai_maitaikhu = 3559;
pub const KEY_Thai_maitho = 3561;
pub const KEY_Thai_maitri = 3562;
pub const KEY_Thai_maiyamok = 3558;
pub const KEY_Thai_moma = 3521;
pub const KEY_Thai_ngongu = 3495;
pub const KEY_Thai_nikhahit = 3565;
pub const KEY_Thai_nonen = 3507;
pub const KEY_Thai_nonu = 3513;
pub const KEY_Thai_oang = 3533;
pub const KEY_Thai_paiyannoi = 3535;
pub const KEY_Thai_phinthu = 3546;
pub const KEY_Thai_phophan = 3518;
pub const KEY_Thai_phophung = 3516;
pub const KEY_Thai_phosamphao = 3520;
pub const KEY_Thai_popla = 3515;
pub const KEY_Thai_rorua = 3523;
pub const KEY_Thai_ru = 3524;
pub const KEY_Thai_saraa = 3536;
pub const KEY_Thai_saraaa = 3538;
pub const KEY_Thai_saraae = 3553;
pub const KEY_Thai_saraaimaimalai = 3556;
pub const KEY_Thai_saraaimaimuan = 3555;
pub const KEY_Thai_saraam = 3539;
pub const KEY_Thai_sarae = 3552;
pub const KEY_Thai_sarai = 3540;
pub const KEY_Thai_saraii = 3541;
pub const KEY_Thai_sarao = 3554;
pub const KEY_Thai_sarau = 3544;
pub const KEY_Thai_saraue = 3542;
pub const KEY_Thai_sarauee = 3543;
pub const KEY_Thai_sarauu = 3545;
pub const KEY_Thai_sorusi = 3529;
pub const KEY_Thai_sosala = 3528;
pub const KEY_Thai_soso = 3499;
pub const KEY_Thai_sosua = 3530;
pub const KEY_Thai_thanthakhat = 3564;
pub const KEY_Thai_thonangmontho = 3505;
pub const KEY_Thai_thophuthao = 3506;
pub const KEY_Thai_thothahan = 3511;
pub const KEY_Thai_thothan = 3504;
pub const KEY_Thai_thothong = 3512;
pub const KEY_Thai_thothung = 3510;
pub const KEY_Thai_topatak = 3503;
pub const KEY_Thai_totao = 3509;
pub const KEY_Thai_wowaen = 3527;
pub const KEY_Thai_yoyak = 3522;
pub const KEY_Thai_yoying = 3501;
pub const KEY_Thorn = 222;
pub const KEY_Time = 269025183;
pub const KEY_ToDoList = 269025055;
pub const KEY_Tools = 269025153;
pub const KEY_TopMenu = 269025186;
pub const KEY_TouchpadOff = 269025201;
pub const KEY_TouchpadOn = 269025200;
pub const KEY_TouchpadToggle = 269025193;
pub const KEY_Touroku = 65323;
pub const KEY_TraditionalSonar = 268964485;
pub const KEY_Travel = 269025154;
pub const KEY_Tslash = 940;
pub const KEY_U = 85;
pub const KEY_UWB = 269025174;
pub const KEY_Uacute = 218;
pub const KEY_Ubelowdot = 16785124;
pub const KEY_Ubreve = 733;
pub const KEY_Ucircumflex = 219;
pub const KEY_Udiaeresis = 220;
pub const KEY_Udoubleacute = 475;
pub const KEY_Ugrave = 217;
pub const KEY_Uhook = 16785126;
pub const KEY_Uhorn = 16777647;
pub const KEY_Uhornacute = 16785128;
pub const KEY_Uhornbelowdot = 16785136;
pub const KEY_Uhorngrave = 16785130;
pub const KEY_Uhornhook = 16785132;
pub const KEY_Uhorntilde = 16785134;
pub const KEY_Ukrainian_GHE_WITH_UPTURN = 1725;
pub const KEY_Ukrainian_I = 1718;
pub const KEY_Ukrainian_IE = 1716;
pub const KEY_Ukrainian_YI = 1719;
pub const KEY_Ukrainian_ghe_with_upturn = 1709;
pub const KEY_Ukrainian_i = 1702;
pub const KEY_Ukrainian_ie = 1700;
pub const KEY_Ukrainian_yi = 1703;
pub const KEY_Ukranian_I = 1718;
pub const KEY_Ukranian_JE = 1716;
pub const KEY_Ukranian_YI = 1719;
pub const KEY_Ukranian_i = 1702;
pub const KEY_Ukranian_je = 1700;
pub const KEY_Ukranian_yi = 1703;
pub const KEY_Umacron = 990;
pub const KEY_Undo = 65381;
pub const KEY_Ungrab = 269024800;
pub const KEY_Unmute = 268964468;
pub const KEY_Uogonek = 985;
pub const KEY_Up = 65362;
pub const KEY_Uring = 473;
pub const KEY_User1KB = 269025157;
pub const KEY_User2KB = 269025158;
pub const KEY_UserPB = 269025156;
pub const KEY_Utilde = 989;
pub const KEY_V = 86;
pub const KEY_VOD = 268964467;
pub const KEY_VendorHome = 269025076;
pub const KEY_Video = 269025159;
pub const KEY_VideoPhone = 268964256;
pub const KEY_View = 269025185;
pub const KEY_VoiceCommand = 268964422;
pub const KEY_Voicemail = 268964268;
pub const KEY_VoidSymbol = 16777215;
pub const KEY_W = 87;
pub const KEY_WLAN = 269025173;
pub const KEY_WPSButton = 268964369;
pub const KEY_WWAN = 269025204;
pub const KEY_WWW = 269025070;
pub const KEY_Wacute = 16785026;
pub const KEY_WakeUp = 269025067;
pub const KEY_Wcircumflex = 16777588;
pub const KEY_Wdiaeresis = 16785028;
pub const KEY_WebCam = 269025167;
pub const KEY_Wgrave = 16785024;
pub const KEY_WheelButton = 269025160;
pub const KEY_WindowClear = 269025109;
pub const KEY_WonSign = 16785577;
pub const KEY_Word = 269025161;
pub const KEY_X = 88;
pub const KEY_Xabovedot = 16785034;
pub const KEY_Xfer = 269025162;
pub const KEY_Y = 89;
pub const KEY_Yacute = 221;
pub const KEY_Ybelowdot = 16785140;
pub const KEY_Ycircumflex = 16777590;
pub const KEY_Ydiaeresis = 5054;
pub const KEY_Yellow = 269025189;
pub const KEY_Ygrave = 16785138;
pub const KEY_Yhook = 16785142;
pub const KEY_Ytilde = 16785144;
pub const KEY_Z = 90;
pub const KEY_Zabovedot = 431;
pub const KEY_Zacute = 428;
pub const KEY_Zcaron = 430;
pub const KEY_Zen_Koho = 65341;
pub const KEY_Zenkaku = 65320;
pub const KEY_Zenkaku_Hankaku = 65322;
pub const KEY_ZoomIn = 269025163;
pub const KEY_ZoomOut = 269025164;
pub const KEY_ZoomReset = 268964260;
pub const KEY_Zstroke = 16777653;
pub const KEY_a = 97;
pub const KEY_aacute = 225;
pub const KEY_abelowdot = 16785057;
pub const KEY_abovedot = 511;
pub const KEY_abreve = 483;
pub const KEY_abreveacute = 16785071;
pub const KEY_abrevebelowdot = 16785079;
pub const KEY_abrevegrave = 16785073;
pub const KEY_abrevehook = 16785075;
pub const KEY_abrevetilde = 16785077;
pub const KEY_acircumflex = 226;
pub const KEY_acircumflexacute = 16785061;
pub const KEY_acircumflexbelowdot = 16785069;
pub const KEY_acircumflexgrave = 16785063;
pub const KEY_acircumflexhook = 16785065;
pub const KEY_acircumflextilde = 16785067;
pub const KEY_acute = 180;
pub const KEY_adiaeresis = 228;
pub const KEY_ae = 230;
pub const KEY_agrave = 224;
pub const KEY_ahook = 16785059;
pub const KEY_amacron = 992;
pub const KEY_ampersand = 38;
pub const KEY_aogonek = 433;
pub const KEY_apostrophe = 39;
pub const KEY_approxeq = 16785992;
pub const KEY_approximate = 2248;
pub const KEY_aring = 229;
pub const KEY_asciicircum = 94;
pub const KEY_asciitilde = 126;
pub const KEY_asterisk = 42;
pub const KEY_at = 64;
pub const KEY_atilde = 227;
pub const KEY_b = 98;
pub const KEY_babovedot = 16784899;
pub const KEY_backslash = 92;
pub const KEY_ballotcross = 2804;
pub const KEY_bar = 124;
pub const KEY_because = 16785973;
pub const KEY_blank = 2527;
pub const KEY_botintegral = 2213;
pub const KEY_botleftparens = 2220;
pub const KEY_botleftsqbracket = 2216;
pub const KEY_botleftsummation = 2226;
pub const KEY_botrightparens = 2222;
pub const KEY_botrightsqbracket = 2218;
pub const KEY_botrightsummation = 2230;
pub const KEY_bott = 2550;
pub const KEY_botvertsummationconnector = 2228;
pub const KEY_braceleft = 123;
pub const KEY_braceright = 125;
pub const KEY_bracketleft = 91;
pub const KEY_bracketright = 93;
pub const KEY_braille_blank = 16787456;
pub const KEY_braille_dot_1 = 65521;
pub const KEY_braille_dot_10 = 65530;
pub const KEY_braille_dot_2 = 65522;
pub const KEY_braille_dot_3 = 65523;
pub const KEY_braille_dot_4 = 65524;
pub const KEY_braille_dot_5 = 65525;
pub const KEY_braille_dot_6 = 65526;
pub const KEY_braille_dot_7 = 65527;
pub const KEY_braille_dot_8 = 65528;
pub const KEY_braille_dot_9 = 65529;
pub const KEY_braille_dots_1 = 16787457;
pub const KEY_braille_dots_12 = 16787459;
pub const KEY_braille_dots_123 = 16787463;
pub const KEY_braille_dots_1234 = 16787471;
pub const KEY_braille_dots_12345 = 16787487;
pub const KEY_braille_dots_123456 = 16787519;
pub const KEY_braille_dots_1234567 = 16787583;
pub const KEY_braille_dots_12345678 = 16787711;
pub const KEY_braille_dots_1234568 = 16787647;
pub const KEY_braille_dots_123457 = 16787551;
pub const KEY_braille_dots_1234578 = 16787679;
pub const KEY_braille_dots_123458 = 16787615;
pub const KEY_braille_dots_12346 = 16787503;
pub const KEY_braille_dots_123467 = 16787567;
pub const KEY_braille_dots_1234678 = 16787695;
pub const KEY_braille_dots_123468 = 16787631;
pub const KEY_braille_dots_12347 = 16787535;
pub const KEY_braille_dots_123478 = 16787663;
pub const KEY_braille_dots_12348 = 16787599;
pub const KEY_braille_dots_1235 = 16787479;
pub const KEY_braille_dots_12356 = 16787511;
pub const KEY_braille_dots_123567 = 16787575;
pub const KEY_braille_dots_1235678 = 16787703;
pub const KEY_braille_dots_123568 = 16787639;
pub const KEY_braille_dots_12357 = 16787543;
pub const KEY_braille_dots_123578 = 16787671;
pub const KEY_braille_dots_12358 = 16787607;
pub const KEY_braille_dots_1236 = 16787495;
pub const KEY_braille_dots_12367 = 16787559;
pub const KEY_braille_dots_123678 = 16787687;
pub const KEY_braille_dots_12368 = 16787623;
pub const KEY_braille_dots_1237 = 16787527;
pub const KEY_braille_dots_12378 = 16787655;
pub const KEY_braille_dots_1238 = 16787591;
pub const KEY_braille_dots_124 = 16787467;
pub const KEY_braille_dots_1245 = 16787483;
pub const KEY_braille_dots_12456 = 16787515;
pub const KEY_braille_dots_124567 = 16787579;
pub const KEY_braille_dots_1245678 = 16787707;
pub const KEY_braille_dots_124568 = 16787643;
pub const KEY_braille_dots_12457 = 16787547;
pub const KEY_braille_dots_124578 = 16787675;
pub const KEY_braille_dots_12458 = 16787611;
pub const KEY_braille_dots_1246 = 16787499;
pub const KEY_braille_dots_12467 = 16787563;
pub const KEY_braille_dots_124678 = 16787691;
pub const KEY_braille_dots_12468 = 16787627;
pub const KEY_braille_dots_1247 = 16787531;
pub const KEY_braille_dots_12478 = 16787659;
pub const KEY_braille_dots_1248 = 16787595;
pub const KEY_braille_dots_125 = 16787475;
pub const KEY_braille_dots_1256 = 16787507;
pub const KEY_braille_dots_12567 = 16787571;
pub const KEY_braille_dots_125678 = 16787699;
pub const KEY_braille_dots_12568 = 16787635;
pub const KEY_braille_dots_1257 = 16787539;
pub const KEY_braille_dots_12578 = 16787667;
pub const KEY_braille_dots_1258 = 16787603;
pub const KEY_braille_dots_126 = 16787491;
pub const KEY_braille_dots_1267 = 16787555;
pub const KEY_braille_dots_12678 = 16787683;
pub const KEY_braille_dots_1268 = 16787619;
pub const KEY_braille_dots_127 = 16787523;
pub const KEY_braille_dots_1278 = 16787651;
pub const KEY_braille_dots_128 = 16787587;
pub const KEY_braille_dots_13 = 16787461;
pub const KEY_braille_dots_134 = 16787469;
pub const KEY_braille_dots_1345 = 16787485;
pub const KEY_braille_dots_13456 = 16787517;
pub const KEY_braille_dots_134567 = 16787581;
pub const KEY_braille_dots_1345678 = 16787709;
pub const KEY_braille_dots_134568 = 16787645;
pub const KEY_braille_dots_13457 = 16787549;
pub const KEY_braille_dots_134578 = 16787677;
pub const KEY_braille_dots_13458 = 16787613;
pub const KEY_braille_dots_1346 = 16787501;
pub const KEY_braille_dots_13467 = 16787565;
pub const KEY_braille_dots_134678 = 16787693;
pub const KEY_braille_dots_13468 = 16787629;
pub const KEY_braille_dots_1347 = 16787533;
pub const KEY_braille_dots_13478 = 16787661;
pub const KEY_braille_dots_1348 = 16787597;
pub const KEY_braille_dots_135 = 16787477;
pub const KEY_braille_dots_1356 = 16787509;
pub const KEY_braille_dots_13567 = 16787573;
pub const KEY_braille_dots_135678 = 16787701;
pub const KEY_braille_dots_13568 = 16787637;
pub const KEY_braille_dots_1357 = 16787541;
pub const KEY_braille_dots_13578 = 16787669;
pub const KEY_braille_dots_1358 = 16787605;
pub const KEY_braille_dots_136 = 16787493;
pub const KEY_braille_dots_1367 = 16787557;
pub const KEY_braille_dots_13678 = 16787685;
pub const KEY_braille_dots_1368 = 16787621;
pub const KEY_braille_dots_137 = 16787525;
pub const KEY_braille_dots_1378 = 16787653;
pub const KEY_braille_dots_138 = 16787589;
pub const KEY_braille_dots_14 = 16787465;
pub const KEY_braille_dots_145 = 16787481;
pub const KEY_braille_dots_1456 = 16787513;
pub const KEY_braille_dots_14567 = 16787577;
pub const KEY_braille_dots_145678 = 16787705;
pub const KEY_braille_dots_14568 = 16787641;
pub const KEY_braille_dots_1457 = 16787545;
pub const KEY_braille_dots_14578 = 16787673;
pub const KEY_braille_dots_1458 = 16787609;
pub const KEY_braille_dots_146 = 16787497;
pub const KEY_braille_dots_1467 = 16787561;
pub const KEY_braille_dots_14678 = 16787689;
pub const KEY_braille_dots_1468 = 16787625;
pub const KEY_braille_dots_147 = 16787529;
pub const KEY_braille_dots_1478 = 16787657;
pub const KEY_braille_dots_148 = 16787593;
pub const KEY_braille_dots_15 = 16787473;
pub const KEY_braille_dots_156 = 16787505;
pub const KEY_braille_dots_1567 = 16787569;
pub const KEY_braille_dots_15678 = 16787697;
pub const KEY_braille_dots_1568 = 16787633;
pub const KEY_braille_dots_157 = 16787537;
pub const KEY_braille_dots_1578 = 16787665;
pub const KEY_braille_dots_158 = 16787601;
pub const KEY_braille_dots_16 = 16787489;
pub const KEY_braille_dots_167 = 16787553;
pub const KEY_braille_dots_1678 = 16787681;
pub const KEY_braille_dots_168 = 16787617;
pub const KEY_braille_dots_17 = 16787521;
pub const KEY_braille_dots_178 = 16787649;
pub const KEY_braille_dots_18 = 16787585;
pub const KEY_braille_dots_2 = 16787458;
pub const KEY_braille_dots_23 = 16787462;
pub const KEY_braille_dots_234 = 16787470;
pub const KEY_braille_dots_2345 = 16787486;
pub const KEY_braille_dots_23456 = 16787518;
pub const KEY_braille_dots_234567 = 16787582;
pub const KEY_braille_dots_2345678 = 16787710;
pub const KEY_braille_dots_234568 = 16787646;
pub const KEY_braille_dots_23457 = 16787550;
pub const KEY_braille_dots_234578 = 16787678;
pub const KEY_braille_dots_23458 = 16787614;
pub const KEY_braille_dots_2346 = 16787502;
pub const KEY_braille_dots_23467 = 16787566;
pub const KEY_braille_dots_234678 = 16787694;
pub const KEY_braille_dots_23468 = 16787630;
pub const KEY_braille_dots_2347 = 16787534;
pub const KEY_braille_dots_23478 = 16787662;
pub const KEY_braille_dots_2348 = 16787598;
pub const KEY_braille_dots_235 = 16787478;
pub const KEY_braille_dots_2356 = 16787510;
pub const KEY_braille_dots_23567 = 16787574;
pub const KEY_braille_dots_235678 = 16787702;
pub const KEY_braille_dots_23568 = 16787638;
pub const KEY_braille_dots_2357 = 16787542;
pub const KEY_braille_dots_23578 = 16787670;
pub const KEY_braille_dots_2358 = 16787606;
pub const KEY_braille_dots_236 = 16787494;
pub const KEY_braille_dots_2367 = 16787558;
pub const KEY_braille_dots_23678 = 16787686;
pub const KEY_braille_dots_2368 = 16787622;
pub const KEY_braille_dots_237 = 16787526;
pub const KEY_braille_dots_2378 = 16787654;
pub const KEY_braille_dots_238 = 16787590;
pub const KEY_braille_dots_24 = 16787466;
pub const KEY_braille_dots_245 = 16787482;
pub const KEY_braille_dots_2456 = 16787514;
pub const KEY_braille_dots_24567 = 16787578;
pub const KEY_braille_dots_245678 = 16787706;
pub const KEY_braille_dots_24568 = 16787642;
pub const KEY_braille_dots_2457 = 16787546;
pub const KEY_braille_dots_24578 = 16787674;
pub const KEY_braille_dots_2458 = 16787610;
pub const KEY_braille_dots_246 = 16787498;
pub const KEY_braille_dots_2467 = 16787562;
pub const KEY_braille_dots_24678 = 16787690;
pub const KEY_braille_dots_2468 = 16787626;
pub const KEY_braille_dots_247 = 16787530;
pub const KEY_braille_dots_2478 = 16787658;
pub const KEY_braille_dots_248 = 16787594;
pub const KEY_braille_dots_25 = 16787474;
pub const KEY_braille_dots_256 = 16787506;
pub const KEY_braille_dots_2567 = 16787570;
pub const KEY_braille_dots_25678 = 16787698;
pub const KEY_braille_dots_2568 = 16787634;
pub const KEY_braille_dots_257 = 16787538;
pub const KEY_braille_dots_2578 = 16787666;
pub const KEY_braille_dots_258 = 16787602;
pub const KEY_braille_dots_26 = 16787490;
pub const KEY_braille_dots_267 = 16787554;
pub const KEY_braille_dots_2678 = 16787682;
pub const KEY_braille_dots_268 = 16787618;
pub const KEY_braille_dots_27 = 16787522;
pub const KEY_braille_dots_278 = 16787650;
pub const KEY_braille_dots_28 = 16787586;
pub const KEY_braille_dots_3 = 16787460;
pub const KEY_braille_dots_34 = 16787468;
pub const KEY_braille_dots_345 = 16787484;
pub const KEY_braille_dots_3456 = 16787516;
pub const KEY_braille_dots_34567 = 16787580;
pub const KEY_braille_dots_345678 = 16787708;
pub const KEY_braille_dots_34568 = 16787644;
pub const KEY_braille_dots_3457 = 16787548;
pub const KEY_braille_dots_34578 = 16787676;
pub const KEY_braille_dots_3458 = 16787612;
pub const KEY_braille_dots_346 = 16787500;
pub const KEY_braille_dots_3467 = 16787564;
pub const KEY_braille_dots_34678 = 16787692;
pub const KEY_braille_dots_3468 = 16787628;
pub const KEY_braille_dots_347 = 16787532;
pub const KEY_braille_dots_3478 = 16787660;
pub const KEY_braille_dots_348 = 16787596;
pub const KEY_braille_dots_35 = 16787476;
pub const KEY_braille_dots_356 = 16787508;
pub const KEY_braille_dots_3567 = 16787572;
pub const KEY_braille_dots_35678 = 16787700;
pub const KEY_braille_dots_3568 = 16787636;
pub const KEY_braille_dots_357 = 16787540;
pub const KEY_braille_dots_3578 = 16787668;
pub const KEY_braille_dots_358 = 16787604;
pub const KEY_braille_dots_36 = 16787492;
pub const KEY_braille_dots_367 = 16787556;
pub const KEY_braille_dots_3678 = 16787684;
pub const KEY_braille_dots_368 = 16787620;
pub const KEY_braille_dots_37 = 16787524;
pub const KEY_braille_dots_378 = 16787652;
pub const KEY_braille_dots_38 = 16787588;
pub const KEY_braille_dots_4 = 16787464;
pub const KEY_braille_dots_45 = 16787480;
pub const KEY_braille_dots_456 = 16787512;
pub const KEY_braille_dots_4567 = 16787576;
pub const KEY_braille_dots_45678 = 16787704;
pub const KEY_braille_dots_4568 = 16787640;
pub const KEY_braille_dots_457 = 16787544;
pub const KEY_braille_dots_4578 = 16787672;
pub const KEY_braille_dots_458 = 16787608;
pub const KEY_braille_dots_46 = 16787496;
pub const KEY_braille_dots_467 = 16787560;
pub const KEY_braille_dots_4678 = 16787688;
pub const KEY_braille_dots_468 = 16787624;
pub const KEY_braille_dots_47 = 16787528;
pub const KEY_braille_dots_478 = 16787656;
pub const KEY_braille_dots_48 = 16787592;
pub const KEY_braille_dots_5 = 16787472;
pub const KEY_braille_dots_56 = 16787504;
pub const KEY_braille_dots_567 = 16787568;
pub const KEY_braille_dots_5678 = 16787696;
pub const KEY_braille_dots_568 = 16787632;
pub const KEY_braille_dots_57 = 16787536;
pub const KEY_braille_dots_578 = 16787664;
pub const KEY_braille_dots_58 = 16787600;
pub const KEY_braille_dots_6 = 16787488;
pub const KEY_braille_dots_67 = 16787552;
pub const KEY_braille_dots_678 = 16787680;
pub const KEY_braille_dots_68 = 16787616;
pub const KEY_braille_dots_7 = 16787520;
pub const KEY_braille_dots_78 = 16787648;
pub const KEY_braille_dots_8 = 16787584;
pub const KEY_breve = 418;
pub const KEY_brokenbar = 166;
pub const KEY_c = 99;
pub const KEY_c_h = 65187;
pub const KEY_cabovedot = 741;
pub const KEY_cacute = 486;
pub const KEY_careof = 2744;
pub const KEY_caret = 2812;
pub const KEY_caron = 439;
pub const KEY_ccaron = 488;
pub const KEY_ccedilla = 231;
pub const KEY_ccircumflex = 742;
pub const KEY_cedilla = 184;
pub const KEY_cent = 162;
pub const KEY_ch = 65184;
pub const KEY_checkerboard = 2529;
pub const KEY_checkmark = 2803;
pub const KEY_circle = 3023;
pub const KEY_club = 2796;
pub const KEY_colon = 58;
pub const KEY_combining_acute = 16777985;
pub const KEY_combining_belowdot = 16778019;
pub const KEY_combining_grave = 16777984;
pub const KEY_combining_hook = 16777993;
pub const KEY_combining_tilde = 16777987;
pub const KEY_comma = 44;
pub const KEY_containsas = 16785931;
pub const KEY_copyright = 169;
pub const KEY_cr = 2532;
pub const KEY_crossinglines = 2542;
pub const KEY_cuberoot = 16785947;
pub const KEY_currency = 164;
pub const KEY_cursor = 2815;
pub const KEY_d = 100;
pub const KEY_dabovedot = 16784907;
pub const KEY_dagger = 2801;
pub const KEY_dcaron = 495;
pub const KEY_dead_A = 65153;
pub const KEY_dead_E = 65155;
pub const KEY_dead_I = 65157;
pub const KEY_dead_O = 65159;
pub const KEY_dead_SCHWA = 65163;
pub const KEY_dead_U = 65161;
pub const KEY_dead_a = 65152;
pub const KEY_dead_abovecomma = 65124;
pub const KEY_dead_abovedot = 65110;
pub const KEY_dead_abovereversedcomma = 65125;
pub const KEY_dead_abovering = 65112;
pub const KEY_dead_aboveverticalline = 65169;
pub const KEY_dead_acute = 65105;
pub const KEY_dead_belowbreve = 65131;
pub const KEY_dead_belowcircumflex = 65129;
pub const KEY_dead_belowcomma = 65134;
pub const KEY_dead_belowdiaeresis = 65132;
pub const KEY_dead_belowdot = 65120;
pub const KEY_dead_belowmacron = 65128;
pub const KEY_dead_belowring = 65127;
pub const KEY_dead_belowtilde = 65130;
pub const KEY_dead_belowverticalline = 65170;
pub const KEY_dead_breve = 65109;
pub const KEY_dead_capital_schwa = 65163;
pub const KEY_dead_caron = 65114;
pub const KEY_dead_cedilla = 65115;
pub const KEY_dead_circumflex = 65106;
pub const KEY_dead_currency = 65135;
pub const KEY_dead_dasia = 65125;
pub const KEY_dead_diaeresis = 65111;
pub const KEY_dead_doubleacute = 65113;
pub const KEY_dead_doublegrave = 65126;
pub const KEY_dead_e = 65154;
pub const KEY_dead_grave = 65104;
pub const KEY_dead_greek = 65164;
pub const KEY_dead_hamza = 65165;
pub const KEY_dead_hook = 65121;
pub const KEY_dead_horn = 65122;
pub const KEY_dead_i = 65156;
pub const KEY_dead_invertedbreve = 65133;
pub const KEY_dead_iota = 65117;
pub const KEY_dead_longsolidusoverlay = 65171;
pub const KEY_dead_lowline = 65168;
pub const KEY_dead_macron = 65108;
pub const KEY_dead_o = 65158;
pub const KEY_dead_ogonek = 65116;
pub const KEY_dead_perispomeni = 65107;
pub const KEY_dead_psili = 65124;
pub const KEY_dead_schwa = 65162;
pub const KEY_dead_semivoiced_sound = 65119;
pub const KEY_dead_small_schwa = 65162;
pub const KEY_dead_stroke = 65123;
pub const KEY_dead_tilde = 65107;
pub const KEY_dead_u = 65160;
pub const KEY_dead_voiced_sound = 65118;
pub const KEY_decimalpoint = 2749;
pub const KEY_degree = 176;
pub const KEY_diaeresis = 168;
pub const KEY_diamond = 2797;
pub const KEY_digitspace = 2725;
pub const KEY_dintegral = 16785964;
pub const KEY_division = 247;
pub const KEY_dollar = 36;
pub const KEY_doubbaselinedot = 2735;
pub const KEY_doubleacute = 445;
pub const KEY_doubledagger = 2802;
pub const KEY_doublelowquotemark = 2814;
pub const KEY_downarrow = 2302;
pub const KEY_downcaret = 2984;
pub const KEY_downshoe = 3030;
pub const KEY_downstile = 3012;
pub const KEY_downtack = 3010;
pub const KEY_dstroke = 496;
pub const KEY_e = 101;
pub const KEY_eabovedot = 1004;
pub const KEY_eacute = 233;
pub const KEY_ebelowdot = 16785081;
pub const KEY_ecaron = 492;
pub const KEY_ecircumflex = 234;
pub const KEY_ecircumflexacute = 16785087;
pub const KEY_ecircumflexbelowdot = 16785095;
pub const KEY_ecircumflexgrave = 16785089;
pub const KEY_ecircumflexhook = 16785091;
pub const KEY_ecircumflextilde = 16785093;
pub const KEY_ediaeresis = 235;
pub const KEY_egrave = 232;
pub const KEY_ehook = 16785083;
pub const KEY_eightsubscript = 16785544;
pub const KEY_eightsuperior = 16785528;
pub const KEY_elementof = 16785928;
pub const KEY_ellipsis = 2734;
pub const KEY_em3space = 2723;
pub const KEY_em4space = 2724;
pub const KEY_emacron = 954;
pub const KEY_emdash = 2729;
pub const KEY_emfilledcircle = 2782;
pub const KEY_emfilledrect = 2783;
pub const KEY_emopencircle = 2766;
pub const KEY_emopenrectangle = 2767;
pub const KEY_emptyset = 16785925;
pub const KEY_emspace = 2721;
pub const KEY_endash = 2730;
pub const KEY_enfilledcircbullet = 2790;
pub const KEY_enfilledsqbullet = 2791;
pub const KEY_eng = 959;
pub const KEY_enopencircbullet = 2784;
pub const KEY_enopensquarebullet = 2785;
pub const KEY_enspace = 2722;
pub const KEY_eogonek = 490;
pub const KEY_equal = 61;
pub const KEY_eth = 240;
pub const KEY_etilde = 16785085;
pub const KEY_exclam = 33;
pub const KEY_exclamdown = 161;
pub const KEY_ezh = 16777874;
pub const KEY_f = 102;
pub const KEY_fabovedot = 16784927;
pub const KEY_femalesymbol = 2808;
pub const KEY_ff = 2531;
pub const KEY_figdash = 2747;
pub const KEY_filledlefttribullet = 2780;
pub const KEY_filledrectbullet = 2779;
pub const KEY_filledrighttribullet = 2781;
pub const KEY_filledtribulletdown = 2793;
pub const KEY_filledtribulletup = 2792;
pub const KEY_fiveeighths = 2757;
pub const KEY_fivesixths = 2743;
pub const KEY_fivesubscript = 16785541;
pub const KEY_fivesuperior = 16785525;
pub const KEY_fourfifths = 2741;
pub const KEY_foursubscript = 16785540;
pub const KEY_foursuperior = 16785524;
pub const KEY_fourthroot = 16785948;
pub const KEY_function = 2294;
pub const KEY_g = 103;
pub const KEY_gabovedot = 757;
pub const KEY_gbreve = 699;
pub const KEY_gcaron = 16777703;
pub const KEY_gcedilla = 955;
pub const KEY_gcircumflex = 760;
pub const KEY_grave = 96;
pub const KEY_greater = 62;
pub const KEY_greaterthanequal = 2238;
pub const KEY_guillemetleft = 171;
pub const KEY_guillemetright = 187;
pub const KEY_guillemotleft = 171;
pub const KEY_guillemotright = 187;
pub const KEY_h = 104;
pub const KEY_hairspace = 2728;
pub const KEY_hcircumflex = 694;
pub const KEY_heart = 2798;
pub const KEY_hebrew_aleph = 3296;
pub const KEY_hebrew_ayin = 3314;
pub const KEY_hebrew_bet = 3297;
pub const KEY_hebrew_beth = 3297;
pub const KEY_hebrew_chet = 3303;
pub const KEY_hebrew_dalet = 3299;
pub const KEY_hebrew_daleth = 3299;
pub const KEY_hebrew_doublelowline = 3295;
pub const KEY_hebrew_finalkaph = 3306;
pub const KEY_hebrew_finalmem = 3309;
pub const KEY_hebrew_finalnun = 3311;
pub const KEY_hebrew_finalpe = 3315;
pub const KEY_hebrew_finalzade = 3317;
pub const KEY_hebrew_finalzadi = 3317;
pub const KEY_hebrew_gimel = 3298;
pub const KEY_hebrew_gimmel = 3298;
pub const KEY_hebrew_he = 3300;
pub const KEY_hebrew_het = 3303;
pub const KEY_hebrew_kaph = 3307;
pub const KEY_hebrew_kuf = 3319;
pub const KEY_hebrew_lamed = 3308;
pub const KEY_hebrew_mem = 3310;
pub const KEY_hebrew_nun = 3312;
pub const KEY_hebrew_pe = 3316;
pub const KEY_hebrew_qoph = 3319;
pub const KEY_hebrew_resh = 3320;
pub const KEY_hebrew_samech = 3313;
pub const KEY_hebrew_samekh = 3313;
pub const KEY_hebrew_shin = 3321;
pub const KEY_hebrew_taf = 3322;
pub const KEY_hebrew_taw = 3322;
pub const KEY_hebrew_tet = 3304;
pub const KEY_hebrew_teth = 3304;
pub const KEY_hebrew_waw = 3301;
pub const KEY_hebrew_yod = 3305;
pub const KEY_hebrew_zade = 3318;
pub const KEY_hebrew_zadi = 3318;
pub const KEY_hebrew_zain = 3302;
pub const KEY_hebrew_zayin = 3302;
pub const KEY_hexagram = 2778;
pub const KEY_horizconnector = 2211;
pub const KEY_horizlinescan1 = 2543;
pub const KEY_horizlinescan3 = 2544;
pub const KEY_horizlinescan5 = 2545;
pub const KEY_horizlinescan7 = 2546;
pub const KEY_horizlinescan9 = 2547;
pub const KEY_hstroke = 689;
pub const KEY_ht = 2530;
pub const KEY_hyphen = 173;
pub const KEY_i = 105;
pub const KEY_iTouch = 269025120;
pub const KEY_iacute = 237;
pub const KEY_ibelowdot = 16785099;
pub const KEY_ibreve = 16777517;
pub const KEY_icircumflex = 238;
pub const KEY_identical = 2255;
pub const KEY_idiaeresis = 239;
pub const KEY_idotless = 697;
pub const KEY_ifonlyif = 2253;
pub const KEY_igrave = 236;
pub const KEY_ihook = 16785097;
pub const KEY_imacron = 1007;
pub const KEY_implies = 2254;
pub const KEY_includedin = 2266;
pub const KEY_includes = 2267;
pub const KEY_infinity = 2242;
pub const KEY_integral = 2239;
pub const KEY_intersection = 2268;
pub const KEY_iogonek = 999;
pub const KEY_itilde = 949;
pub const KEY_j = 106;
pub const KEY_jcircumflex = 700;
pub const KEY_jot = 3018;
pub const KEY_k = 107;
pub const KEY_kana_A = 1201;
pub const KEY_kana_CHI = 1217;
pub const KEY_kana_E = 1204;
pub const KEY_kana_FU = 1228;
pub const KEY_kana_HA = 1226;
pub const KEY_kana_HE = 1229;
pub const KEY_kana_HI = 1227;
pub const KEY_kana_HO = 1230;
pub const KEY_kana_HU = 1228;
pub const KEY_kana_I = 1202;
pub const KEY_kana_KA = 1206;
pub const KEY_kana_KE = 1209;
pub const KEY_kana_KI = 1207;
pub const KEY_kana_KO = 1210;
pub const KEY_kana_KU = 1208;
pub const KEY_kana_MA = 1231;
pub const KEY_kana_ME = 1234;
pub const KEY_kana_MI = 1232;
pub const KEY_kana_MO = 1235;
pub const KEY_kana_MU = 1233;
pub const KEY_kana_N = 1245;
pub const KEY_kana_NA = 1221;
pub const KEY_kana_NE = 1224;
pub const KEY_kana_NI = 1222;
pub const KEY_kana_NO = 1225;
pub const KEY_kana_NU = 1223;
pub const KEY_kana_O = 1205;
pub const KEY_kana_RA = 1239;
pub const KEY_kana_RE = 1242;
pub const KEY_kana_RI = 1240;
pub const KEY_kana_RO = 1243;
pub const KEY_kana_RU = 1241;
pub const KEY_kana_SA = 1211;
pub const KEY_kana_SE = 1214;
pub const KEY_kana_SHI = 1212;
pub const KEY_kana_SO = 1215;
pub const KEY_kana_SU = 1213;
pub const KEY_kana_TA = 1216;
pub const KEY_kana_TE = 1219;
pub const KEY_kana_TI = 1217;
pub const KEY_kana_TO = 1220;
pub const KEY_kana_TSU = 1218;
pub const KEY_kana_TU = 1218;
pub const KEY_kana_U = 1203;
pub const KEY_kana_WA = 1244;
pub const KEY_kana_WO = 1190;
pub const KEY_kana_YA = 1236;
pub const KEY_kana_YO = 1238;
pub const KEY_kana_YU = 1237;
pub const KEY_kana_a = 1191;
pub const KEY_kana_closingbracket = 1187;
pub const KEY_kana_comma = 1188;
pub const KEY_kana_conjunctive = 1189;
pub const KEY_kana_e = 1194;
pub const KEY_kana_fullstop = 1185;
pub const KEY_kana_i = 1192;
pub const KEY_kana_middledot = 1189;
pub const KEY_kana_o = 1195;
pub const KEY_kana_openingbracket = 1186;
pub const KEY_kana_switch = 65406;
pub const KEY_kana_tsu = 1199;
pub const KEY_kana_tu = 1199;
pub const KEY_kana_u = 1193;
pub const KEY_kana_ya = 1196;
pub const KEY_kana_yo = 1198;
pub const KEY_kana_yu = 1197;
pub const KEY_kappa = 930;
pub const KEY_kcedilla = 1011;
pub const KEY_kra = 930;
pub const KEY_l = 108;
pub const KEY_lacute = 485;
pub const KEY_latincross = 2777;
pub const KEY_lbelowdot = 16784951;
pub const KEY_lcaron = 437;
pub const KEY_lcedilla = 950;
pub const KEY_leftanglebracket = 2748;
pub const KEY_leftarrow = 2299;
pub const KEY_leftcaret = 2979;
pub const KEY_leftdoublequotemark = 2770;
pub const KEY_leftmiddlecurlybrace = 2223;
pub const KEY_leftopentriangle = 2764;
pub const KEY_leftpointer = 2794;
pub const KEY_leftradical = 2209;
pub const KEY_leftshoe = 3034;
pub const KEY_leftsinglequotemark = 2768;
pub const KEY_leftt = 2548;
pub const KEY_lefttack = 3036;
pub const KEY_less = 60;
pub const KEY_lessthanequal = 2236;
pub const KEY_lf = 2533;
pub const KEY_logicaland = 2270;
pub const KEY_logicalor = 2271;
pub const KEY_lowleftcorner = 2541;
pub const KEY_lowrightcorner = 2538;
pub const KEY_lstroke = 435;
pub const KEY_m = 109;
pub const KEY_mabovedot = 16784961;
pub const KEY_macron = 175;
pub const KEY_malesymbol = 2807;
pub const KEY_maltesecross = 2800;
pub const KEY_marker = 2751;
pub const KEY_masculine = 186;
pub const KEY_minus = 45;
pub const KEY_minutes = 2774;
pub const KEY_mu = 181;
pub const KEY_multiply = 215;
pub const KEY_musicalflat = 2806;
pub const KEY_musicalsharp = 2805;
pub const KEY_n = 110;
pub const KEY_nabla = 2245;
pub const KEY_nacute = 497;
pub const KEY_ncaron = 498;
pub const KEY_ncedilla = 1009;
pub const KEY_ninesubscript = 16785545;
pub const KEY_ninesuperior = 16785529;
pub const KEY_nl = 2536;
pub const KEY_nobreakspace = 160;
pub const KEY_notapproxeq = 16785991;
pub const KEY_notelementof = 16785929;
pub const KEY_notequal = 2237;
pub const KEY_notidentical = 16786018;
pub const KEY_notsign = 172;
pub const KEY_ntilde = 241;
pub const KEY_numbersign = 35;
pub const KEY_numerosign = 1712;
pub const KEY_o = 111;
pub const KEY_oacute = 243;
pub const KEY_obarred = 16777845;
pub const KEY_obelowdot = 16785101;
pub const KEY_ocaron = 16777682;
pub const KEY_ocircumflex = 244;
pub const KEY_ocircumflexacute = 16785105;
pub const KEY_ocircumflexbelowdot = 16785113;
pub const KEY_ocircumflexgrave = 16785107;
pub const KEY_ocircumflexhook = 16785109;
pub const KEY_ocircumflextilde = 16785111;
pub const KEY_odiaeresis = 246;
pub const KEY_odoubleacute = 501;
pub const KEY_oe = 5053;
pub const KEY_ogonek = 434;
pub const KEY_ograve = 242;
pub const KEY_ohook = 16785103;
pub const KEY_ohorn = 16777633;
pub const KEY_ohornacute = 16785115;
pub const KEY_ohornbelowdot = 16785123;
pub const KEY_ohorngrave = 16785117;
pub const KEY_ohornhook = 16785119;
pub const KEY_ohorntilde = 16785121;
pub const KEY_omacron = 1010;
pub const KEY_oneeighth = 2755;
pub const KEY_onefifth = 2738;
pub const KEY_onehalf = 189;
pub const KEY_onequarter = 188;
pub const KEY_onesixth = 2742;
pub const KEY_onesubscript = 16785537;
pub const KEY_onesuperior = 185;
pub const KEY_onethird = 2736;
pub const KEY_ooblique = 248;
pub const KEY_openrectbullet = 2786;
pub const KEY_openstar = 2789;
pub const KEY_opentribulletdown = 2788;
pub const KEY_opentribulletup = 2787;
pub const KEY_ordfeminine = 170;
pub const KEY_ordmasculine = 186;
pub const KEY_oslash = 248;
pub const KEY_otilde = 245;
pub const KEY_overbar = 3008;
pub const KEY_overline = 1150;
pub const KEY_p = 112;
pub const KEY_pabovedot = 16784983;
pub const KEY_paragraph = 182;
pub const KEY_parenleft = 40;
pub const KEY_parenright = 41;
pub const KEY_partdifferential = 16785922;
pub const KEY_partialderivative = 2287;
pub const KEY_percent = 37;
pub const KEY_period = 46;
pub const KEY_periodcentered = 183;
pub const KEY_permille = 2773;
pub const KEY_phonographcopyright = 2811;
pub const KEY_plus = 43;
pub const KEY_plusminus = 177;
pub const KEY_prescription = 2772;
pub const KEY_prolongedsound = 1200;
pub const KEY_punctspace = 2726;
pub const KEY_q = 113;
pub const KEY_quad = 3020;
pub const KEY_question = 63;
pub const KEY_questiondown = 191;
pub const KEY_quotedbl = 34;
pub const KEY_quoteleft = 96;
pub const KEY_quoteright = 39;
pub const KEY_r = 114;
pub const KEY_racute = 480;
pub const KEY_radical = 2262;
pub const KEY_rcaron = 504;
pub const KEY_rcedilla = 947;
pub const KEY_registered = 174;
pub const KEY_rightanglebracket = 2750;
pub const KEY_rightarrow = 2301;
pub const KEY_rightcaret = 2982;
pub const KEY_rightdoublequotemark = 2771;
pub const KEY_rightmiddlecurlybrace = 2224;
pub const KEY_rightmiddlesummation = 2231;
pub const KEY_rightopentriangle = 2765;
pub const KEY_rightpointer = 2795;
pub const KEY_rightshoe = 3032;
pub const KEY_rightsinglequotemark = 2769;
pub const KEY_rightt = 2549;
pub const KEY_righttack = 3068;
pub const KEY_s = 115;
pub const KEY_sabovedot = 16784993;
pub const KEY_sacute = 438;
pub const KEY_scaron = 441;
pub const KEY_scedilla = 442;
pub const KEY_schwa = 16777817;
pub const KEY_scircumflex = 766;
pub const KEY_script_switch = 65406;
pub const KEY_seconds = 2775;
pub const KEY_section = 167;
pub const KEY_semicolon = 59;
pub const KEY_semivoicedsound = 1247;
pub const KEY_seveneighths = 2758;
pub const KEY_sevensubscript = 16785543;
pub const KEY_sevensuperior = 16785527;
pub const KEY_signaturemark = 2762;
pub const KEY_signifblank = 2732;
pub const KEY_similarequal = 2249;
pub const KEY_singlelowquotemark = 2813;
pub const KEY_sixsubscript = 16785542;
pub const KEY_sixsuperior = 16785526;
pub const KEY_slash = 47;
pub const KEY_soliddiamond = 2528;
pub const KEY_space = 32;
pub const KEY_squareroot = 16785946;
pub const KEY_ssharp = 223;
pub const KEY_sterling = 163;
pub const KEY_stricteq = 16786019;
pub const KEY_t = 116;
pub const KEY_tabovedot = 16785003;
pub const KEY_tcaron = 443;
pub const KEY_tcedilla = 510;
pub const KEY_telephone = 2809;
pub const KEY_telephonerecorder = 2810;
pub const KEY_therefore = 2240;
pub const KEY_thinspace = 2727;
pub const KEY_thorn = 254;
pub const KEY_threeeighths = 2756;
pub const KEY_threefifths = 2740;
pub const KEY_threequarters = 190;
pub const KEY_threesubscript = 16785539;
pub const KEY_threesuperior = 179;
pub const KEY_tintegral = 16785965;
pub const KEY_topintegral = 2212;
pub const KEY_topleftparens = 2219;
pub const KEY_topleftradical = 2210;
pub const KEY_topleftsqbracket = 2215;
pub const KEY_topleftsummation = 2225;
pub const KEY_toprightparens = 2221;
pub const KEY_toprightsqbracket = 2217;
pub const KEY_toprightsummation = 2229;
pub const KEY_topt = 2551;
pub const KEY_topvertsummationconnector = 2227;
pub const KEY_trademark = 2761;
pub const KEY_trademarkincircle = 2763;
pub const KEY_tslash = 956;
pub const KEY_twofifths = 2739;
pub const KEY_twosubscript = 16785538;
pub const KEY_twosuperior = 178;
pub const KEY_twothirds = 2737;
pub const KEY_u = 117;
pub const KEY_uacute = 250;
pub const KEY_ubelowdot = 16785125;
pub const KEY_ubreve = 765;
pub const KEY_ucircumflex = 251;
pub const KEY_udiaeresis = 252;
pub const KEY_udoubleacute = 507;
pub const KEY_ugrave = 249;
pub const KEY_uhook = 16785127;
pub const KEY_uhorn = 16777648;
pub const KEY_uhornacute = 16785129;
pub const KEY_uhornbelowdot = 16785137;
pub const KEY_uhorngrave = 16785131;
pub const KEY_uhornhook = 16785133;
pub const KEY_uhorntilde = 16785135;
pub const KEY_umacron = 1022;
pub const KEY_underbar = 3014;
pub const KEY_underscore = 95;
pub const KEY_union = 2269;
pub const KEY_uogonek = 1017;
pub const KEY_uparrow = 2300;
pub const KEY_upcaret = 2985;
pub const KEY_upleftcorner = 2540;
pub const KEY_uprightcorner = 2539;
pub const KEY_upshoe = 3011;
pub const KEY_upstile = 3027;
pub const KEY_uptack = 3022;
pub const KEY_uring = 505;
pub const KEY_utilde = 1021;
pub const KEY_v = 118;
pub const KEY_variation = 2241;
pub const KEY_vertbar = 2552;
pub const KEY_vertconnector = 2214;
pub const KEY_voicedsound = 1246;
pub const KEY_vt = 2537;
pub const KEY_w = 119;
pub const KEY_wacute = 16785027;
pub const KEY_wcircumflex = 16777589;
pub const KEY_wdiaeresis = 16785029;
pub const KEY_wgrave = 16785025;
pub const KEY_x = 120;
pub const KEY_xabovedot = 16785035;
pub const KEY_y = 121;
pub const KEY_yacute = 253;
pub const KEY_ybelowdot = 16785141;
pub const KEY_ycircumflex = 16777591;
pub const KEY_ydiaeresis = 255;
pub const KEY_yen = 165;
pub const KEY_ygrave = 16785139;
pub const KEY_yhook = 16785143;
pub const KEY_ytilde = 16785145;
pub const KEY_z = 122;
pub const KEY_zabovedot = 447;
pub const KEY_zacute = 444;
pub const KEY_zcaron = 446;
pub const KEY_zerosubscript = 16785536;
pub const KEY_zerosuperior = 16785520;
pub const KEY_zstroke = 16777654;
pub const KeyEvent = struct {
    pub const Parent = Event;
    pub fn getConsumedModifiers(self: *KeyEvent) ModifierType {
        const cFn = @extern(*const fn (*KeyEvent) callconv(.c) ModifierType, .{ .name = "gdk_key_event_get_consumed_modifiers" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getKeycode(self: *KeyEvent) u32 {
        const cFn = @extern(*const fn (*KeyEvent) callconv(.c) u32, .{ .name = "gdk_key_event_get_keycode" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getKeyval(self: *KeyEvent) u32 {
        const cFn = @extern(*const fn (*KeyEvent) callconv(.c) u32, .{ .name = "gdk_key_event_get_keyval" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLayout(self: *KeyEvent) u32 {
        const cFn = @extern(*const fn (*KeyEvent) callconv(.c) u32, .{ .name = "gdk_key_event_get_layout" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLevel(self: *KeyEvent) u32 {
        const cFn = @extern(*const fn (*KeyEvent) callconv(.c) u32, .{ .name = "gdk_key_event_get_level" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMatch(self: *KeyEvent) ?struct {
        keyval: u32,
        modifiers: ModifierType,
    } {
        var argO_keyval: u32 = undefined;
        const arg_keyval: *u32 = &argO_keyval;
        var argO_modifiers: ModifierType = undefined;
        const arg_modifiers: *ModifierType = &argO_modifiers;
        const cFn = @extern(*const fn (*KeyEvent, *u32, *ModifierType) callconv(.c) bool, .{ .name = "gdk_key_event_get_match" });
        const ret = cFn(self, arg_keyval, arg_modifiers);
        if (!ret) return null;
        return .{ .keyval = argO_keyval, .modifiers = argO_modifiers };
    }
    pub fn isModifier(self: *KeyEvent) bool {
        const cFn = @extern(*const fn (*KeyEvent) callconv(.c) bool, .{ .name = "gdk_key_event_is_modifier" });
        const ret = cFn(self);
        return ret;
    }
    pub fn matches(self: *KeyEvent, arg_keyval: u32, arg_modifiers: ModifierType) KeyMatch {
        const cFn = @extern(*const fn (*KeyEvent, u32, ModifierType) callconv(.c) KeyMatch, .{ .name = "gdk_key_event_matches" });
        const ret = cFn(self, arg_keyval, arg_modifiers);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_key_event_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const KeyMatch = enum(u32) {
    none = 0,
    partial = 1,
    exact = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_key_match_get_type" });
        return cFn();
    }
};
pub const KeymapKey = extern struct {
    keycode: u32,
    group: i32,
    level: i32,
};
pub const MODIFIER_MASK = 469769999;
pub const MemoryFormat = enum(u32) {
    b8g8r8a8_premultiplied = 0,
    a8r8g8b8_premultiplied = 1,
    r8g8b8a8_premultiplied = 2,
    b8g8r8a8 = 3,
    a8r8g8b8 = 4,
    r8g8b8a8 = 5,
    a8b8g8r8 = 6,
    r8g8b8 = 7,
    b8g8r8 = 8,
    r16g16b16 = 9,
    r16g16b16a16_premultiplied = 10,
    r16g16b16a16 = 11,
    r16g16b16_float = 12,
    r16g16b16a16_float_premultiplied = 13,
    r16g16b16a16_float = 14,
    r32g32b32_float = 15,
    r32g32b32a32_float_premultiplied = 16,
    r32g32b32a32_float = 17,
    g8a8_premultiplied = 18,
    g8a8 = 19,
    g8 = 20,
    g16a16_premultiplied = 21,
    g16a16 = 22,
    g16 = 23,
    a8 = 24,
    a16 = 25,
    a16_float = 26,
    a32_float = 27,
    a8b8g8r8_premultiplied = 28,
    b8g8r8x8 = 29,
    x8r8g8b8 = 30,
    r8g8b8x8 = 31,
    x8b8g8r8 = 32,
    n_formats = 33,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_memory_format_get_type" });
        return cFn();
    }
};
pub const MemoryTexture = struct {
    pub const Interfaces = [_]type{ Paintable, Gio.Icon, Gio.LoadableIcon };
    pub const Parent = Texture;
    pub const Class = MemoryTextureClass;
    pub fn new(arg_width: i32, arg_height: i32, arg_format: MemoryFormat, arg_bytes: *GLib.Bytes, arg_stride: u64) *MemoryTexture {
        const cFn = @extern(*const fn (i32, i32, MemoryFormat, *GLib.Bytes, u64) callconv(.c) *MemoryTexture, .{ .name = "gdk_memory_texture_new" });
        const ret = cFn(arg_width, arg_height, arg_format, arg_bytes, arg_stride);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_memory_texture_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const MemoryTextureBuilder = struct {
    pub const Parent = GObject.Object;
    pub const Class = MemoryTextureBuilderClass;
    _props: struct {
        bytes: core.Property(GLib.Bytes, "bytes") = .{},
        @"color-state": core.Property(ColorState, "color-state") = .{},
        format: core.Property(MemoryFormat, "format") = .{},
        height: core.Property(i32, "height") = .{},
        stride: core.Property(u64, "stride") = .{},
        @"update-region": core.Property(cairo.Region, "update-region") = .{},
        @"update-texture": core.Property(Texture, "update-texture") = .{},
        width: core.Property(i32, "width") = .{},
    },
    pub fn new() *MemoryTextureBuilder {
        const cFn = @extern(*const fn () callconv(.c) *MemoryTextureBuilder, .{ .name = "gdk_memory_texture_builder_new" });
        const ret = cFn();
        return ret;
    }
    pub fn build(self: *MemoryTextureBuilder) *Texture {
        const cFn = @extern(*const fn (*MemoryTextureBuilder) callconv(.c) *Texture, .{ .name = "gdk_memory_texture_builder_build" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBytes(self: *MemoryTextureBuilder) ?*GLib.Bytes {
        const cFn = @extern(*const fn (*MemoryTextureBuilder) callconv(.c) ?*GLib.Bytes, .{ .name = "gdk_memory_texture_builder_get_bytes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getColorState(self: *MemoryTextureBuilder) *ColorState {
        const cFn = @extern(*const fn (*MemoryTextureBuilder) callconv(.c) *ColorState, .{ .name = "gdk_memory_texture_builder_get_color_state" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFormat(self: *MemoryTextureBuilder) MemoryFormat {
        const cFn = @extern(*const fn (*MemoryTextureBuilder) callconv(.c) MemoryFormat, .{ .name = "gdk_memory_texture_builder_get_format" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHeight(self: *MemoryTextureBuilder) i32 {
        const cFn = @extern(*const fn (*MemoryTextureBuilder) callconv(.c) i32, .{ .name = "gdk_memory_texture_builder_get_height" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStride(self: *MemoryTextureBuilder) u64 {
        const cFn = @extern(*const fn (*MemoryTextureBuilder) callconv(.c) u64, .{ .name = "gdk_memory_texture_builder_get_stride" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUpdateRegion(self: *MemoryTextureBuilder) ?*cairo.Region {
        const cFn = @extern(*const fn (*MemoryTextureBuilder) callconv(.c) ?*cairo.Region, .{ .name = "gdk_memory_texture_builder_get_update_region" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUpdateTexture(self: *MemoryTextureBuilder) ?*Texture {
        const cFn = @extern(*const fn (*MemoryTextureBuilder) callconv(.c) ?*Texture, .{ .name = "gdk_memory_texture_builder_get_update_texture" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWidth(self: *MemoryTextureBuilder) i32 {
        const cFn = @extern(*const fn (*MemoryTextureBuilder) callconv(.c) i32, .{ .name = "gdk_memory_texture_builder_get_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setBytes(self: *MemoryTextureBuilder, arg_bytes: ?*GLib.Bytes) void {
        const cFn = @extern(*const fn (*MemoryTextureBuilder, ?*GLib.Bytes) callconv(.c) void, .{ .name = "gdk_memory_texture_builder_set_bytes" });
        const ret = cFn(self, arg_bytes);
        return ret;
    }
    pub fn setColorState(self: *MemoryTextureBuilder, arg_color_state: *ColorState) void {
        const cFn = @extern(*const fn (*MemoryTextureBuilder, *ColorState) callconv(.c) void, .{ .name = "gdk_memory_texture_builder_set_color_state" });
        const ret = cFn(self, arg_color_state);
        return ret;
    }
    pub fn setFormat(self: *MemoryTextureBuilder, arg_format: MemoryFormat) void {
        const cFn = @extern(*const fn (*MemoryTextureBuilder, MemoryFormat) callconv(.c) void, .{ .name = "gdk_memory_texture_builder_set_format" });
        const ret = cFn(self, arg_format);
        return ret;
    }
    pub fn setHeight(self: *MemoryTextureBuilder, arg_height: i32) void {
        const cFn = @extern(*const fn (*MemoryTextureBuilder, i32) callconv(.c) void, .{ .name = "gdk_memory_texture_builder_set_height" });
        const ret = cFn(self, arg_height);
        return ret;
    }
    pub fn setStride(self: *MemoryTextureBuilder, arg_stride: u64) void {
        const cFn = @extern(*const fn (*MemoryTextureBuilder, u64) callconv(.c) void, .{ .name = "gdk_memory_texture_builder_set_stride" });
        const ret = cFn(self, arg_stride);
        return ret;
    }
    pub fn setUpdateRegion(self: *MemoryTextureBuilder, arg_region: ?*cairo.Region) void {
        const cFn = @extern(*const fn (*MemoryTextureBuilder, ?*cairo.Region) callconv(.c) void, .{ .name = "gdk_memory_texture_builder_set_update_region" });
        const ret = cFn(self, arg_region);
        return ret;
    }
    pub fn setUpdateTexture(self: *MemoryTextureBuilder, arg_texture: ?*Texture) void {
        const cFn = @extern(*const fn (*MemoryTextureBuilder, ?*Texture) callconv(.c) void, .{ .name = "gdk_memory_texture_builder_set_update_texture" });
        const ret = cFn(self, arg_texture);
        return ret;
    }
    pub fn setWidth(self: *MemoryTextureBuilder, arg_width: i32) void {
        const cFn = @extern(*const fn (*MemoryTextureBuilder, i32) callconv(.c) void, .{ .name = "gdk_memory_texture_builder_set_width" });
        const ret = cFn(self, arg_width);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_memory_texture_builder_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const MemoryTextureBuilderClass = opaque {};
pub const MemoryTextureClass = opaque {};
pub const ModifierType = packed struct(u32) {
    shift_mask: bool = false,
    lock_mask: bool = false,
    control_mask: bool = false,
    alt_mask: bool = false,
    _4: u4 = 0,
    button1_mask: bool = false,
    button2_mask: bool = false,
    button3_mask: bool = false,
    button4_mask: bool = false,
    button5_mask: bool = false,
    _13: u13 = 0,
    super_mask: bool = false,
    hyper_mask: bool = false,
    meta_mask: bool = false,
    _: u3 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_modifier_type_get_type" });
        return cFn();
    }
};
pub const Monitor = struct {
    pub const Parent = GObject.Object;
    pub const Class = MonitorClass;
    _props: struct {
        connector: core.Property([*:0]const u8, "connector") = .{},
        description: core.Property([*:0]const u8, "description") = .{},
        display: core.Property(Display, "display") = .{},
        geometry: core.Property(Rectangle, "geometry") = .{},
        @"height-mm": core.Property(i32, "height-mm") = .{},
        manufacturer: core.Property([*:0]const u8, "manufacturer") = .{},
        model: core.Property([*:0]const u8, "model") = .{},
        @"refresh-rate": core.Property(i32, "refresh-rate") = .{},
        scale: core.Property(f64, "scale") = .{},
        @"scale-factor": core.Property(i32, "scale-factor") = .{},
        @"subpixel-layout": core.Property(SubpixelLayout, "subpixel-layout") = .{},
        valid: core.Property(bool, "valid") = .{},
        @"width-mm": core.Property(i32, "width-mm") = .{},
    },
    _signals: struct {
        invalidate: core.Signal(fn (*Monitor) void, "invalidate") = .{},
    },
    pub fn getConnector(self: *Monitor) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Monitor) callconv(.c) ?[*:0]u8, .{ .name = "gdk_monitor_get_connector" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDescription(self: *Monitor) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Monitor) callconv(.c) ?[*:0]u8, .{ .name = "gdk_monitor_get_description" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDisplay(self: *Monitor) *Display {
        const cFn = @extern(*const fn (*Monitor) callconv(.c) *Display, .{ .name = "gdk_monitor_get_display" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getGeometry(self: *Monitor, arg_geometry: *Rectangle) void {
        const cFn = @extern(*const fn (*Monitor, *Rectangle) callconv(.c) void, .{ .name = "gdk_monitor_get_geometry" });
        const ret = cFn(self, arg_geometry);
        return ret;
    }
    pub fn getHeightMm(self: *Monitor) i32 {
        const cFn = @extern(*const fn (*Monitor) callconv(.c) i32, .{ .name = "gdk_monitor_get_height_mm" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getManufacturer(self: *Monitor) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Monitor) callconv(.c) ?[*:0]u8, .{ .name = "gdk_monitor_get_manufacturer" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getModel(self: *Monitor) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Monitor) callconv(.c) ?[*:0]u8, .{ .name = "gdk_monitor_get_model" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRefreshRate(self: *Monitor) i32 {
        const cFn = @extern(*const fn (*Monitor) callconv(.c) i32, .{ .name = "gdk_monitor_get_refresh_rate" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getScale(self: *Monitor) f64 {
        const cFn = @extern(*const fn (*Monitor) callconv(.c) f64, .{ .name = "gdk_monitor_get_scale" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getScaleFactor(self: *Monitor) i32 {
        const cFn = @extern(*const fn (*Monitor) callconv(.c) i32, .{ .name = "gdk_monitor_get_scale_factor" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSubpixelLayout(self: *Monitor) SubpixelLayout {
        const cFn = @extern(*const fn (*Monitor) callconv(.c) SubpixelLayout, .{ .name = "gdk_monitor_get_subpixel_layout" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWidthMm(self: *Monitor) i32 {
        const cFn = @extern(*const fn (*Monitor) callconv(.c) i32, .{ .name = "gdk_monitor_get_width_mm" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isValid(self: *Monitor) bool {
        const cFn = @extern(*const fn (*Monitor) callconv(.c) bool, .{ .name = "gdk_monitor_is_valid" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_monitor_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const MonitorClass = opaque {};
pub const MotionEvent = struct {
    pub const Parent = Event;
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_motion_event_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const NotifyType = enum(u32) {
    ancestor = 0,
    virtual = 1,
    inferior = 2,
    nonlinear = 3,
    nonlinear_virtual = 4,
    unknown = 5,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_notify_type_get_type" });
        return cFn();
    }
};
pub const PRIORITY_REDRAW = 120;
pub const PadEvent = struct {
    pub const Parent = Event;
    pub fn getAxisValue(self: *PadEvent) struct {
        index: u32,
        value: f64,
    } {
        var argO_index: u32 = undefined;
        const arg_index: *u32 = &argO_index;
        var argO_value: f64 = undefined;
        const arg_value: *f64 = &argO_value;
        const cFn = @extern(*const fn (*PadEvent, *u32, *f64) callconv(.c) void, .{ .name = "gdk_pad_event_get_axis_value" });
        const ret = cFn(self, arg_index, arg_value);
        _ = ret;
        return .{ .index = argO_index, .value = argO_value };
    }
    pub fn getButton(self: *PadEvent) u32 {
        const cFn = @extern(*const fn (*PadEvent) callconv(.c) u32, .{ .name = "gdk_pad_event_get_button" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getGroupMode(self: *PadEvent) struct {
        group: u32,
        mode: u32,
    } {
        var argO_group: u32 = undefined;
        const arg_group: *u32 = &argO_group;
        var argO_mode: u32 = undefined;
        const arg_mode: *u32 = &argO_mode;
        const cFn = @extern(*const fn (*PadEvent, *u32, *u32) callconv(.c) void, .{ .name = "gdk_pad_event_get_group_mode" });
        const ret = cFn(self, arg_group, arg_mode);
        _ = ret;
        return .{ .group = argO_group, .mode = argO_mode };
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_pad_event_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const Paintable = struct {
    pub const Class = PaintableInterface;
    _signals: struct {
        @"invalidate-contents": core.Signal(fn (*Paintable) void, "invalidate-contents") = .{},
        @"invalidate-size": core.Signal(fn (*Paintable) void, "invalidate-size") = .{},
    },
    pub fn newEmpty(arg_intrinsic_width: i32, arg_intrinsic_height: i32) *Paintable {
        const cFn = @extern(*const fn (i32, i32) callconv(.c) *Paintable, .{ .name = "gdk_paintable_new_empty" });
        const ret = cFn(arg_intrinsic_width, arg_intrinsic_height);
        return ret;
    }
    pub fn computeConcreteSize(self: *Paintable, arg_specified_width: f64, arg_specified_height: f64, arg_default_width: f64, arg_default_height: f64) struct {
        concrete_width: f64,
        concrete_height: f64,
    } {
        var argO_concrete_width: f64 = undefined;
        const arg_concrete_width: *f64 = &argO_concrete_width;
        var argO_concrete_height: f64 = undefined;
        const arg_concrete_height: *f64 = &argO_concrete_height;
        const cFn = @extern(*const fn (*Paintable, f64, f64, f64, f64, *f64, *f64) callconv(.c) void, .{ .name = "gdk_paintable_compute_concrete_size" });
        const ret = cFn(self, arg_specified_width, arg_specified_height, arg_default_width, arg_default_height, arg_concrete_width, arg_concrete_height);
        _ = ret;
        return .{ .concrete_width = argO_concrete_width, .concrete_height = argO_concrete_height };
    }
    pub fn getCurrentImage(self: *Paintable) *Paintable {
        const cFn = @extern(*const fn (*Paintable) callconv(.c) *Paintable, .{ .name = "gdk_paintable_get_current_image" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFlags(self: *Paintable) PaintableFlags {
        const cFn = @extern(*const fn (*Paintable) callconv(.c) PaintableFlags, .{ .name = "gdk_paintable_get_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIntrinsicAspectRatio(self: *Paintable) f64 {
        const cFn = @extern(*const fn (*Paintable) callconv(.c) f64, .{ .name = "gdk_paintable_get_intrinsic_aspect_ratio" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIntrinsicHeight(self: *Paintable) i32 {
        const cFn = @extern(*const fn (*Paintable) callconv(.c) i32, .{ .name = "gdk_paintable_get_intrinsic_height" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIntrinsicWidth(self: *Paintable) i32 {
        const cFn = @extern(*const fn (*Paintable) callconv(.c) i32, .{ .name = "gdk_paintable_get_intrinsic_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn invalidateContents(self: *Paintable) void {
        const cFn = @extern(*const fn (*Paintable) callconv(.c) void, .{ .name = "gdk_paintable_invalidate_contents" });
        const ret = cFn(self);
        return ret;
    }
    pub fn invalidateSize(self: *Paintable) void {
        const cFn = @extern(*const fn (*Paintable) callconv(.c) void, .{ .name = "gdk_paintable_invalidate_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn snapshot(self: *Paintable, arg_snapshot: *Snapshot, arg_width: f64, arg_height: f64) void {
        const cFn = @extern(*const fn (*Paintable, *Snapshot, f64, f64) callconv(.c) void, .{ .name = "gdk_paintable_snapshot" });
        const ret = cFn(self, arg_snapshot, arg_width, arg_height);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_paintable_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const PaintableFlags = packed struct(u32) {
    size: bool = false,
    contents: bool = false,
    _: u30 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_paintable_flags_get_type" });
        return cFn();
    }
};
pub const PaintableInterface = extern struct {
    g_iface: GObject.TypeInterface,
    snapshot: ?*const fn (arg_paintable: *Paintable, arg_snapshot: *Snapshot, arg_width: f64, arg_height: f64) callconv(.c) void,
    get_current_image: ?*const fn (arg_paintable: *Paintable) callconv(.c) *Paintable,
    get_flags: ?*const fn (arg_paintable: *Paintable) callconv(.c) PaintableFlags,
    get_intrinsic_width: ?*const fn (arg_paintable: *Paintable) callconv(.c) i32,
    get_intrinsic_height: ?*const fn (arg_paintable: *Paintable) callconv(.c) i32,
    get_intrinsic_aspect_ratio: ?*const fn (arg_paintable: *Paintable) callconv(.c) f64,
};
pub const Popup = struct {
    pub const Prerequistes = [_]type{Surface};
    pub const Class = PopupInterface;
    _props: struct {
        autohide: core.Property(bool, "autohide") = .{},
        parent: core.Property(Surface, "parent") = .{},
    },
    pub fn getAutohide(self: *Popup) bool {
        const cFn = @extern(*const fn (*Popup) callconv(.c) bool, .{ .name = "gdk_popup_get_autohide" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getParent(self: *Popup) ?*Surface {
        const cFn = @extern(*const fn (*Popup) callconv(.c) ?*Surface, .{ .name = "gdk_popup_get_parent" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPositionX(self: *Popup) i32 {
        const cFn = @extern(*const fn (*Popup) callconv(.c) i32, .{ .name = "gdk_popup_get_position_x" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPositionY(self: *Popup) i32 {
        const cFn = @extern(*const fn (*Popup) callconv(.c) i32, .{ .name = "gdk_popup_get_position_y" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRectAnchor(self: *Popup) Gravity {
        const cFn = @extern(*const fn (*Popup) callconv(.c) Gravity, .{ .name = "gdk_popup_get_rect_anchor" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSurfaceAnchor(self: *Popup) Gravity {
        const cFn = @extern(*const fn (*Popup) callconv(.c) Gravity, .{ .name = "gdk_popup_get_surface_anchor" });
        const ret = cFn(self);
        return ret;
    }
    pub fn present(self: *Popup, arg_width: i32, arg_height: i32, arg_layout: *PopupLayout) bool {
        const cFn = @extern(*const fn (*Popup, i32, i32, *PopupLayout) callconv(.c) bool, .{ .name = "gdk_popup_present" });
        const ret = cFn(self, arg_width, arg_height, arg_layout);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_popup_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const PopupInterface = opaque {};
pub const PopupLayout = opaque {
    pub fn new(arg_anchor_rect: *Rectangle, arg_rect_anchor: Gravity, arg_surface_anchor: Gravity) *PopupLayout {
        const cFn = @extern(*const fn (*Rectangle, Gravity, Gravity) callconv(.c) *PopupLayout, .{ .name = "gdk_popup_layout_new" });
        const ret = cFn(arg_anchor_rect, arg_rect_anchor, arg_surface_anchor);
        return ret;
    }
    pub fn copy(self: *PopupLayout) *PopupLayout {
        const cFn = @extern(*const fn (*PopupLayout) callconv(.c) *PopupLayout, .{ .name = "gdk_popup_layout_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn equal(self: *PopupLayout, arg_other: *PopupLayout) bool {
        const cFn = @extern(*const fn (*PopupLayout, *PopupLayout) callconv(.c) bool, .{ .name = "gdk_popup_layout_equal" });
        const ret = cFn(self, arg_other);
        return ret;
    }
    pub fn getAnchorHints(self: *PopupLayout) AnchorHints {
        const cFn = @extern(*const fn (*PopupLayout) callconv(.c) AnchorHints, .{ .name = "gdk_popup_layout_get_anchor_hints" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getAnchorRect(self: *PopupLayout) *Rectangle {
        const cFn = @extern(*const fn (*PopupLayout) callconv(.c) *Rectangle, .{ .name = "gdk_popup_layout_get_anchor_rect" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOffset(self: *PopupLayout) struct {
        dx: i32,
        dy: i32,
    } {
        var argO_dx: i32 = undefined;
        const arg_dx: *i32 = &argO_dx;
        var argO_dy: i32 = undefined;
        const arg_dy: *i32 = &argO_dy;
        const cFn = @extern(*const fn (*PopupLayout, *i32, *i32) callconv(.c) void, .{ .name = "gdk_popup_layout_get_offset" });
        const ret = cFn(self, arg_dx, arg_dy);
        _ = ret;
        return .{ .dx = argO_dx, .dy = argO_dy };
    }
    pub fn getRectAnchor(self: *PopupLayout) Gravity {
        const cFn = @extern(*const fn (*PopupLayout) callconv(.c) Gravity, .{ .name = "gdk_popup_layout_get_rect_anchor" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getShadowWidth(self: *PopupLayout) struct {
        left: i32,
        right: i32,
        top: i32,
        bottom: i32,
    } {
        var argO_left: i32 = undefined;
        const arg_left: *i32 = &argO_left;
        var argO_right: i32 = undefined;
        const arg_right: *i32 = &argO_right;
        var argO_top: i32 = undefined;
        const arg_top: *i32 = &argO_top;
        var argO_bottom: i32 = undefined;
        const arg_bottom: *i32 = &argO_bottom;
        const cFn = @extern(*const fn (*PopupLayout, *i32, *i32, *i32, *i32) callconv(.c) void, .{ .name = "gdk_popup_layout_get_shadow_width" });
        const ret = cFn(self, arg_left, arg_right, arg_top, arg_bottom);
        _ = ret;
        return .{ .left = argO_left, .right = argO_right, .top = argO_top, .bottom = argO_bottom };
    }
    pub fn getSurfaceAnchor(self: *PopupLayout) Gravity {
        const cFn = @extern(*const fn (*PopupLayout) callconv(.c) Gravity, .{ .name = "gdk_popup_layout_get_surface_anchor" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *PopupLayout) *PopupLayout {
        const cFn = @extern(*const fn (*PopupLayout) callconv(.c) *PopupLayout, .{ .name = "gdk_popup_layout_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setAnchorHints(self: *PopupLayout, arg_anchor_hints: AnchorHints) void {
        const cFn = @extern(*const fn (*PopupLayout, AnchorHints) callconv(.c) void, .{ .name = "gdk_popup_layout_set_anchor_hints" });
        const ret = cFn(self, arg_anchor_hints);
        return ret;
    }
    pub fn setAnchorRect(self: *PopupLayout, arg_anchor_rect: *Rectangle) void {
        const cFn = @extern(*const fn (*PopupLayout, *Rectangle) callconv(.c) void, .{ .name = "gdk_popup_layout_set_anchor_rect" });
        const ret = cFn(self, arg_anchor_rect);
        return ret;
    }
    pub fn setOffset(self: *PopupLayout, arg_dx: i32, arg_dy: i32) void {
        const cFn = @extern(*const fn (*PopupLayout, i32, i32) callconv(.c) void, .{ .name = "gdk_popup_layout_set_offset" });
        const ret = cFn(self, arg_dx, arg_dy);
        return ret;
    }
    pub fn setRectAnchor(self: *PopupLayout, arg_anchor: Gravity) void {
        const cFn = @extern(*const fn (*PopupLayout, Gravity) callconv(.c) void, .{ .name = "gdk_popup_layout_set_rect_anchor" });
        const ret = cFn(self, arg_anchor);
        return ret;
    }
    pub fn setShadowWidth(self: *PopupLayout, arg_left: i32, arg_right: i32, arg_top: i32, arg_bottom: i32) void {
        const cFn = @extern(*const fn (*PopupLayout, i32, i32, i32, i32) callconv(.c) void, .{ .name = "gdk_popup_layout_set_shadow_width" });
        const ret = cFn(self, arg_left, arg_right, arg_top, arg_bottom);
        return ret;
    }
    pub fn setSurfaceAnchor(self: *PopupLayout, arg_anchor: Gravity) void {
        const cFn = @extern(*const fn (*PopupLayout, Gravity) callconv(.c) void, .{ .name = "gdk_popup_layout_set_surface_anchor" });
        const ret = cFn(self, arg_anchor);
        return ret;
    }
    pub fn unref(self: *PopupLayout) void {
        const cFn = @extern(*const fn (*PopupLayout) callconv(.c) void, .{ .name = "gdk_popup_layout_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_popup_layout_get_type" });
        return cFn();
    }
};
pub const ProximityEvent = struct {
    pub const Parent = Event;
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_proximity_event_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const RGBA = extern struct {
    red: f32,
    green: f32,
    blue: f32,
    alpha: f32,
    pub fn copy(self: *RGBA) *RGBA {
        const cFn = @extern(*const fn (*RGBA) callconv(.c) *RGBA, .{ .name = "gdk_rgba_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn equal(self: *RGBA, arg_p2: *RGBA) bool {
        const cFn = @extern(*const fn (*RGBA, *RGBA) callconv(.c) bool, .{ .name = "gdk_rgba_equal" });
        const ret = cFn(self, arg_p2);
        return ret;
    }
    pub fn free(self: *RGBA) void {
        const cFn = @extern(*const fn (*RGBA) callconv(.c) void, .{ .name = "gdk_rgba_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hash(self: *RGBA) u32 {
        const cFn = @extern(*const fn (*RGBA) callconv(.c) u32, .{ .name = "gdk_rgba_hash" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isClear(self: *RGBA) bool {
        const cFn = @extern(*const fn (*RGBA) callconv(.c) bool, .{ .name = "gdk_rgba_is_clear" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isOpaque(self: *RGBA) bool {
        const cFn = @extern(*const fn (*RGBA) callconv(.c) bool, .{ .name = "gdk_rgba_is_opaque" });
        const ret = cFn(self);
        return ret;
    }
    pub fn parse(self: *RGBA, arg_spec: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*RGBA, [*:0]const u8) callconv(.c) bool, .{ .name = "gdk_rgba_parse" });
        const ret = cFn(self, arg_spec);
        return ret;
    }
    pub fn toString(self: *RGBA) [*:0]u8 {
        const cFn = @extern(*const fn (*RGBA) callconv(.c) [*:0]u8, .{ .name = "gdk_rgba_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_rgba_get_type" });
        return cFn();
    }
};
pub const Rectangle = extern struct {
    x: i32,
    y: i32,
    width: i32,
    height: i32,
    pub fn containsPoint(self: *Rectangle, arg_x: i32, arg_y: i32) bool {
        const cFn = @extern(*const fn (*Rectangle, i32, i32) callconv(.c) bool, .{ .name = "gdk_rectangle_contains_point" });
        const ret = cFn(self, arg_x, arg_y);
        return ret;
    }
    pub fn equal(self: *Rectangle, arg_rect2: *Rectangle) bool {
        const cFn = @extern(*const fn (*Rectangle, *Rectangle) callconv(.c) bool, .{ .name = "gdk_rectangle_equal" });
        const ret = cFn(self, arg_rect2);
        return ret;
    }
    pub fn intersect(self: *Rectangle, arg_src2: *Rectangle, arg_dest: ?*Rectangle) bool {
        const cFn = @extern(*const fn (*Rectangle, *Rectangle, ?*Rectangle) callconv(.c) bool, .{ .name = "gdk_rectangle_intersect" });
        const ret = cFn(self, arg_src2, arg_dest);
        return ret;
    }
    pub fn @"union"(self: *Rectangle, arg_src2: *Rectangle, arg_dest: *Rectangle) void {
        const cFn = @extern(*const fn (*Rectangle, *Rectangle, *Rectangle) callconv(.c) void, .{ .name = "gdk_rectangle_union" });
        const ret = cFn(self, arg_src2, arg_dest);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_rectangle_get_type" });
        return cFn();
    }
};
pub const ScrollDirection = enum(u32) {
    up = 0,
    down = 1,
    left = 2,
    right = 3,
    smooth = 4,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_scroll_direction_get_type" });
        return cFn();
    }
};
pub const ScrollEvent = struct {
    pub const Parent = Event;
    pub fn getDeltas(self: *ScrollEvent) struct {
        delta_x: f64,
        delta_y: f64,
    } {
        var argO_delta_x: f64 = undefined;
        const arg_delta_x: *f64 = &argO_delta_x;
        var argO_delta_y: f64 = undefined;
        const arg_delta_y: *f64 = &argO_delta_y;
        const cFn = @extern(*const fn (*ScrollEvent, *f64, *f64) callconv(.c) void, .{ .name = "gdk_scroll_event_get_deltas" });
        const ret = cFn(self, arg_delta_x, arg_delta_y);
        _ = ret;
        return .{ .delta_x = argO_delta_x, .delta_y = argO_delta_y };
    }
    pub fn getDirection(self: *ScrollEvent) ScrollDirection {
        const cFn = @extern(*const fn (*ScrollEvent) callconv(.c) ScrollDirection, .{ .name = "gdk_scroll_event_get_direction" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUnit(self: *ScrollEvent) ScrollUnit {
        const cFn = @extern(*const fn (*ScrollEvent) callconv(.c) ScrollUnit, .{ .name = "gdk_scroll_event_get_unit" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isStop(self: *ScrollEvent) bool {
        const cFn = @extern(*const fn (*ScrollEvent) callconv(.c) bool, .{ .name = "gdk_scroll_event_is_stop" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_scroll_event_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ScrollUnit = enum(u32) {
    wheel = 0,
    surface = 1,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_scroll_unit_get_type" });
        return cFn();
    }
};
pub const Seat = extern struct {
    pub const Parent = GObject.Object;
    _props: struct {
        display: core.Property(Display, "display") = .{},
    },
    _signals: struct {
        @"device-added": core.Signal(fn (*Seat, *Device) void, "device-added") = .{},
        @"device-removed": core.Signal(fn (*Seat, *Device) void, "device-removed") = .{},
        @"tool-added": core.Signal(fn (*Seat, *DeviceTool) void, "tool-added") = .{},
        @"tool-removed": core.Signal(fn (*Seat, *DeviceTool) void, "tool-removed") = .{},
    },
    parent_instance: GObject.Object,
    pub fn getCapabilities(self: *Seat) SeatCapabilities {
        const cFn = @extern(*const fn (*Seat) callconv(.c) SeatCapabilities, .{ .name = "gdk_seat_get_capabilities" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDevices(self: *Seat, arg_capabilities: SeatCapabilities) ?*GLib.List {
        const cFn = @extern(*const fn (*Seat, SeatCapabilities) callconv(.c) ?*GLib.List, .{ .name = "gdk_seat_get_devices" });
        const ret = cFn(self, arg_capabilities);
        return ret;
    }
    pub fn getDisplay(self: *Seat) *Display {
        const cFn = @extern(*const fn (*Seat) callconv(.c) *Display, .{ .name = "gdk_seat_get_display" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getKeyboard(self: *Seat) ?*Device {
        const cFn = @extern(*const fn (*Seat) callconv(.c) ?*Device, .{ .name = "gdk_seat_get_keyboard" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPointer(self: *Seat) ?*Device {
        const cFn = @extern(*const fn (*Seat) callconv(.c) ?*Device, .{ .name = "gdk_seat_get_pointer" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTools(self: *Seat) ?*GLib.List {
        const cFn = @extern(*const fn (*Seat) callconv(.c) ?*GLib.List, .{ .name = "gdk_seat_get_tools" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_seat_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SeatCapabilities = packed struct(u32) {
    pointer: bool = false,
    touch: bool = false,
    tablet_stylus: bool = false,
    keyboard: bool = false,
    tablet_pad: bool = false,
    _: u27 = 0,
    pub const all_pointing: @This() = @bitCast(@as(u32, 7));
    pub const all: @This() = @bitCast(@as(u32, 31));
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_seat_capabilities_get_type" });
        return cFn();
    }
};
pub const Snapshot = struct {
    pub const Parent = GObject.Object;
    pub const Class = SnapshotClass;
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_snapshot_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SnapshotClass = opaque {};
pub const SubpixelLayout = enum(u32) {
    unknown = 0,
    none = 1,
    horizontal_rgb = 2,
    horizontal_bgr = 3,
    vertical_rgb = 4,
    vertical_bgr = 5,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_subpixel_layout_get_type" });
        return cFn();
    }
};
pub const Surface = struct {
    pub const Parent = GObject.Object;
    pub const Class = SurfaceClass;
    _props: struct {
        cursor: core.Property(Cursor, "cursor") = .{},
        display: core.Property(Display, "display") = .{},
        @"frame-clock": core.Property(FrameClock, "frame-clock") = .{},
        height: core.Property(i32, "height") = .{},
        mapped: core.Property(bool, "mapped") = .{},
        scale: core.Property(f64, "scale") = .{},
        @"scale-factor": core.Property(i32, "scale-factor") = .{},
        width: core.Property(i32, "width") = .{},
    },
    _signals: struct {
        @"enter-monitor": core.Signal(fn (*Surface, *Monitor) void, "enter-monitor") = .{},
        event: core.Signal(fn (*Surface, *Event) bool, "event") = .{},
        layout: core.Signal(fn (*Surface, i32, i32) void, "layout") = .{},
        @"leave-monitor": core.Signal(fn (*Surface, *Monitor) void, "leave-monitor") = .{},
        render: core.Signal(fn (*Surface, *cairo.Region) bool, "render") = .{},
    },
    pub fn newPopup(arg_parent: *Surface, arg_autohide: bool) *Surface {
        const cFn = @extern(*const fn (*Surface, bool) callconv(.c) *Surface, .{ .name = "gdk_surface_new_popup" });
        const ret = cFn(arg_parent, arg_autohide);
        return ret;
    }
    pub fn newToplevel(arg_display: *Display) *Surface {
        const cFn = @extern(*const fn (*Display) callconv(.c) *Surface, .{ .name = "gdk_surface_new_toplevel" });
        const ret = cFn(arg_display);
        return ret;
    }
    pub fn beep(self: *Surface) void {
        const cFn = @extern(*const fn (*Surface) callconv(.c) void, .{ .name = "gdk_surface_beep" });
        const ret = cFn(self);
        return ret;
    }
    pub fn createCairoContext(self: *Surface) *CairoContext {
        const cFn = @extern(*const fn (*Surface) callconv(.c) *CairoContext, .{ .name = "gdk_surface_create_cairo_context" });
        const ret = cFn(self);
        return ret;
    }
    pub fn createGlContext(self: *Surface, arg_error: *?*GLib.Error) error{GError}!*GLContext {
        const cFn = @extern(*const fn (*Surface, *?*GLib.Error) callconv(.c) *GLContext, .{ .name = "gdk_surface_create_gl_context" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn createSimilarSurface(self: *Surface, arg_content: cairo.Content, arg_width: i32, arg_height: i32) *cairo.Surface {
        const cFn = @extern(*const fn (*Surface, cairo.Content, i32, i32) callconv(.c) *cairo.Surface, .{ .name = "gdk_surface_create_similar_surface" });
        const ret = cFn(self, arg_content, arg_width, arg_height);
        return ret;
    }
    pub fn createVulkanContext(self: *Surface, arg_error: *?*GLib.Error) error{GError}!*VulkanContext {
        const cFn = @extern(*const fn (*Surface, *?*GLib.Error) callconv(.c) *VulkanContext, .{ .name = "gdk_surface_create_vulkan_context" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn destroy(self: *Surface) void {
        const cFn = @extern(*const fn (*Surface) callconv(.c) void, .{ .name = "gdk_surface_destroy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCursor(self: *Surface) ?*Cursor {
        const cFn = @extern(*const fn (*Surface) callconv(.c) ?*Cursor, .{ .name = "gdk_surface_get_cursor" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDeviceCursor(self: *Surface, arg_device: *Device) ?*Cursor {
        const cFn = @extern(*const fn (*Surface, *Device) callconv(.c) ?*Cursor, .{ .name = "gdk_surface_get_device_cursor" });
        const ret = cFn(self, arg_device);
        return ret;
    }
    pub fn getDevicePosition(self: *Surface, arg_device: *Device) ?struct {
        x: f64,
        y: f64,
        mask: ModifierType,
    } {
        var argO_x: f64 = undefined;
        const arg_x: ?*f64 = &argO_x;
        var argO_y: f64 = undefined;
        const arg_y: ?*f64 = &argO_y;
        var argO_mask: ModifierType = undefined;
        const arg_mask: ?*ModifierType = &argO_mask;
        const cFn = @extern(*const fn (*Surface, *Device, ?*f64, ?*f64, ?*ModifierType) callconv(.c) bool, .{ .name = "gdk_surface_get_device_position" });
        const ret = cFn(self, arg_device, arg_x, arg_y, arg_mask);
        if (!ret) return null;
        return .{ .x = argO_x, .y = argO_y, .mask = argO_mask };
    }
    pub fn getDisplay(self: *Surface) *Display {
        const cFn = @extern(*const fn (*Surface) callconv(.c) *Display, .{ .name = "gdk_surface_get_display" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFrameClock(self: *Surface) *FrameClock {
        const cFn = @extern(*const fn (*Surface) callconv(.c) *FrameClock, .{ .name = "gdk_surface_get_frame_clock" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHeight(self: *Surface) i32 {
        const cFn = @extern(*const fn (*Surface) callconv(.c) i32, .{ .name = "gdk_surface_get_height" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMapped(self: *Surface) bool {
        const cFn = @extern(*const fn (*Surface) callconv(.c) bool, .{ .name = "gdk_surface_get_mapped" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getScale(self: *Surface) f64 {
        const cFn = @extern(*const fn (*Surface) callconv(.c) f64, .{ .name = "gdk_surface_get_scale" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getScaleFactor(self: *Surface) i32 {
        const cFn = @extern(*const fn (*Surface) callconv(.c) i32, .{ .name = "gdk_surface_get_scale_factor" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWidth(self: *Surface) i32 {
        const cFn = @extern(*const fn (*Surface) callconv(.c) i32, .{ .name = "gdk_surface_get_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hide(self: *Surface) void {
        const cFn = @extern(*const fn (*Surface) callconv(.c) void, .{ .name = "gdk_surface_hide" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isDestroyed(self: *Surface) bool {
        const cFn = @extern(*const fn (*Surface) callconv(.c) bool, .{ .name = "gdk_surface_is_destroyed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn queueRender(self: *Surface) void {
        const cFn = @extern(*const fn (*Surface) callconv(.c) void, .{ .name = "gdk_surface_queue_render" });
        const ret = cFn(self);
        return ret;
    }
    pub fn requestLayout(self: *Surface) void {
        const cFn = @extern(*const fn (*Surface) callconv(.c) void, .{ .name = "gdk_surface_request_layout" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setCursor(self: *Surface, arg_cursor: ?*Cursor) void {
        const cFn = @extern(*const fn (*Surface, ?*Cursor) callconv(.c) void, .{ .name = "gdk_surface_set_cursor" });
        const ret = cFn(self, arg_cursor);
        return ret;
    }
    pub fn setDeviceCursor(self: *Surface, arg_device: *Device, arg_cursor: *Cursor) void {
        const cFn = @extern(*const fn (*Surface, *Device, *Cursor) callconv(.c) void, .{ .name = "gdk_surface_set_device_cursor" });
        const ret = cFn(self, arg_device, arg_cursor);
        return ret;
    }
    pub fn setInputRegion(self: *Surface, arg_region: *cairo.Region) void {
        const cFn = @extern(*const fn (*Surface, *cairo.Region) callconv(.c) void, .{ .name = "gdk_surface_set_input_region" });
        const ret = cFn(self, arg_region);
        return ret;
    }
    pub fn setOpaqueRegion(self: *Surface, arg_region: ?*cairo.Region) void {
        const cFn = @extern(*const fn (*Surface, ?*cairo.Region) callconv(.c) void, .{ .name = "gdk_surface_set_opaque_region" });
        const ret = cFn(self, arg_region);
        return ret;
    }
    pub fn translateCoordinates(self: *Surface, arg_to: *Surface, arg_x: *f64, arg_y: *f64) bool {
        const cFn = @extern(*const fn (*Surface, *Surface, *f64, *f64) callconv(.c) bool, .{ .name = "gdk_surface_translate_coordinates" });
        const ret = cFn(self, arg_to, arg_x, arg_y);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_surface_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SurfaceClass = opaque {};
pub const SurfaceEdge = enum(u32) {
    north_west = 0,
    north = 1,
    north_east = 2,
    west = 3,
    east = 4,
    south_west = 5,
    south = 6,
    south_east = 7,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_surface_edge_get_type" });
        return cFn();
    }
};
pub const Texture = struct {
    pub const Interfaces = [_]type{ Paintable, Gio.Icon, Gio.LoadableIcon };
    pub const Parent = GObject.Object;
    pub const Class = TextureClass;
    _props: struct {
        @"color-state": core.Property(ColorState, "color-state") = .{},
        height: core.Property(i32, "height") = .{},
        width: core.Property(i32, "width") = .{},
    },
    pub fn newForPixbuf(arg_pixbuf: *GdkPixbuf.Pixbuf) *Texture {
        const cFn = @extern(*const fn (*GdkPixbuf.Pixbuf) callconv(.c) *Texture, .{ .name = "gdk_texture_new_for_pixbuf" });
        const ret = cFn(arg_pixbuf);
        return ret;
    }
    pub fn newFromBytes(arg_bytes: *GLib.Bytes, arg_error: *?*GLib.Error) error{GError}!*Texture {
        const cFn = @extern(*const fn (*GLib.Bytes, *?*GLib.Error) callconv(.c) *Texture, .{ .name = "gdk_texture_new_from_bytes" });
        const ret = cFn(arg_bytes, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromFile(arg_file: *Gio.File, arg_error: *?*GLib.Error) error{GError}!*Texture {
        const cFn = @extern(*const fn (*Gio.File, *?*GLib.Error) callconv(.c) *Texture, .{ .name = "gdk_texture_new_from_file" });
        const ret = cFn(arg_file, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromFilename(arg_path: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*Texture {
        const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) *Texture, .{ .name = "gdk_texture_new_from_filename" });
        const ret = cFn(arg_path, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromResource(arg_resource_path: [*:0]const u8) *Texture {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *Texture, .{ .name = "gdk_texture_new_from_resource" });
        const ret = cFn(arg_resource_path);
        return ret;
    }
    pub fn download(self: *Texture, arg_data: [*]u8, arg_stride: u64) void {
        const cFn = @extern(*const fn (*Texture, [*]u8, u64) callconv(.c) void, .{ .name = "gdk_texture_download" });
        const ret = cFn(self, arg_data, arg_stride);
        return ret;
    }
    pub fn getColorState(self: *Texture) *ColorState {
        const cFn = @extern(*const fn (*Texture) callconv(.c) *ColorState, .{ .name = "gdk_texture_get_color_state" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFormat(self: *Texture) MemoryFormat {
        const cFn = @extern(*const fn (*Texture) callconv(.c) MemoryFormat, .{ .name = "gdk_texture_get_format" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHeight(self: *Texture) i32 {
        const cFn = @extern(*const fn (*Texture) callconv(.c) i32, .{ .name = "gdk_texture_get_height" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWidth(self: *Texture) i32 {
        const cFn = @extern(*const fn (*Texture) callconv(.c) i32, .{ .name = "gdk_texture_get_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn saveToPng(self: *Texture, arg_filename: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*Texture, [*:0]const u8) callconv(.c) bool, .{ .name = "gdk_texture_save_to_png" });
        const ret = cFn(self, arg_filename);
        return ret;
    }
    pub fn saveToPngBytes(self: *Texture) *GLib.Bytes {
        const cFn = @extern(*const fn (*Texture) callconv(.c) *GLib.Bytes, .{ .name = "gdk_texture_save_to_png_bytes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn saveToTiff(self: *Texture, arg_filename: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*Texture, [*:0]const u8) callconv(.c) bool, .{ .name = "gdk_texture_save_to_tiff" });
        const ret = cFn(self, arg_filename);
        return ret;
    }
    pub fn saveToTiffBytes(self: *Texture) *GLib.Bytes {
        const cFn = @extern(*const fn (*Texture) callconv(.c) *GLib.Bytes, .{ .name = "gdk_texture_save_to_tiff_bytes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_texture_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TextureClass = opaque {};
pub const TextureDownloader = opaque {
    pub fn new(arg_texture: *Texture) *TextureDownloader {
        const cFn = @extern(*const fn (*Texture) callconv(.c) *TextureDownloader, .{ .name = "gdk_texture_downloader_new" });
        const ret = cFn(arg_texture);
        return ret;
    }
    pub fn copy(self: *TextureDownloader) *TextureDownloader {
        const cFn = @extern(*const fn (*TextureDownloader) callconv(.c) *TextureDownloader, .{ .name = "gdk_texture_downloader_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn downloadBytes(self: *TextureDownloader) struct {
        ret: *GLib.Bytes,
        out_stride: u64,
    } {
        var argO_out_stride: u64 = undefined;
        const arg_out_stride: *u64 = &argO_out_stride;
        const cFn = @extern(*const fn (*TextureDownloader, *u64) callconv(.c) *GLib.Bytes, .{ .name = "gdk_texture_downloader_download_bytes" });
        const ret = cFn(self, arg_out_stride);
        return .{ .ret = ret, .out_stride = argO_out_stride };
    }
    pub fn downloadInto(self: *TextureDownloader, arg_data: [*]u8, arg_stride: u64) void {
        const cFn = @extern(*const fn (*TextureDownloader, [*]u8, u64) callconv(.c) void, .{ .name = "gdk_texture_downloader_download_into" });
        const ret = cFn(self, arg_data, arg_stride);
        return ret;
    }
    pub fn free(self: *TextureDownloader) void {
        const cFn = @extern(*const fn (*TextureDownloader) callconv(.c) void, .{ .name = "gdk_texture_downloader_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getColorState(self: *TextureDownloader) *ColorState {
        const cFn = @extern(*const fn (*TextureDownloader) callconv(.c) *ColorState, .{ .name = "gdk_texture_downloader_get_color_state" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFormat(self: *TextureDownloader) MemoryFormat {
        const cFn = @extern(*const fn (*TextureDownloader) callconv(.c) MemoryFormat, .{ .name = "gdk_texture_downloader_get_format" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTexture(self: *TextureDownloader) *Texture {
        const cFn = @extern(*const fn (*TextureDownloader) callconv(.c) *Texture, .{ .name = "gdk_texture_downloader_get_texture" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setColorState(self: *TextureDownloader, arg_color_state: *ColorState) void {
        const cFn = @extern(*const fn (*TextureDownloader, *ColorState) callconv(.c) void, .{ .name = "gdk_texture_downloader_set_color_state" });
        const ret = cFn(self, arg_color_state);
        return ret;
    }
    pub fn setFormat(self: *TextureDownloader, arg_format: MemoryFormat) void {
        const cFn = @extern(*const fn (*TextureDownloader, MemoryFormat) callconv(.c) void, .{ .name = "gdk_texture_downloader_set_format" });
        const ret = cFn(self, arg_format);
        return ret;
    }
    pub fn setTexture(self: *TextureDownloader, arg_texture: *Texture) void {
        const cFn = @extern(*const fn (*TextureDownloader, *Texture) callconv(.c) void, .{ .name = "gdk_texture_downloader_set_texture" });
        const ret = cFn(self, arg_texture);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_texture_downloader_get_type" });
        return cFn();
    }
};
pub const TextureError = enum(u32) {
    too_large = 0,
    corrupt_image = 1,
    unsupported_content = 2,
    unsupported_format = 3,
    pub fn quark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "gdk_texture_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_texture_error_get_type" });
        return cFn();
    }
};
pub const TimeCoord = extern struct {
    time: u32,
    flags: AxisFlags,
    axes: [12]f64,
};
pub const TitlebarGesture = enum(u32) {
    double_click = 1,
    right_click = 2,
    middle_click = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_titlebar_gesture_get_type" });
        return cFn();
    }
};
pub const Toplevel = struct {
    pub const Prerequistes = [_]type{Surface};
    pub const Class = ToplevelInterface;
    _props: struct {
        decorated: core.Property(bool, "decorated") = .{},
        deletable: core.Property(bool, "deletable") = .{},
        @"fullscreen-mode": core.Property(FullscreenMode, "fullscreen-mode") = .{},
        @"icon-list": core.Property(*anyopaque, "icon-list") = .{},
        modal: core.Property(bool, "modal") = .{},
        @"shortcuts-inhibited": core.Property(bool, "shortcuts-inhibited") = .{},
        @"startup-id": core.Property([*:0]const u8, "startup-id") = .{},
        state: core.Property(ToplevelState, "state") = .{},
        title: core.Property([*:0]const u8, "title") = .{},
        @"transient-for": core.Property(Surface, "transient-for") = .{},
    },
    _signals: struct {
        @"compute-size": core.Signal(fn (*Toplevel, *ToplevelSize) void, "compute-size") = .{},
    },
    pub fn beginMove(self: *Toplevel, arg_device: *Device, arg_button: i32, arg_x: f64, arg_y: f64, arg_timestamp: u32) void {
        const cFn = @extern(*const fn (*Toplevel, *Device, i32, f64, f64, u32) callconv(.c) void, .{ .name = "gdk_toplevel_begin_move" });
        const ret = cFn(self, arg_device, arg_button, arg_x, arg_y, arg_timestamp);
        return ret;
    }
    pub fn beginResize(self: *Toplevel, arg_edge: SurfaceEdge, arg_device: ?*Device, arg_button: i32, arg_x: f64, arg_y: f64, arg_timestamp: u32) void {
        const cFn = @extern(*const fn (*Toplevel, SurfaceEdge, ?*Device, i32, f64, f64, u32) callconv(.c) void, .{ .name = "gdk_toplevel_begin_resize" });
        const ret = cFn(self, arg_edge, arg_device, arg_button, arg_x, arg_y, arg_timestamp);
        return ret;
    }
    pub fn focus(self: *Toplevel, arg_timestamp: u32) void {
        const cFn = @extern(*const fn (*Toplevel, u32) callconv(.c) void, .{ .name = "gdk_toplevel_focus" });
        const ret = cFn(self, arg_timestamp);
        return ret;
    }
    pub fn getState(self: *Toplevel) ToplevelState {
        const cFn = @extern(*const fn (*Toplevel) callconv(.c) ToplevelState, .{ .name = "gdk_toplevel_get_state" });
        const ret = cFn(self);
        return ret;
    }
    pub fn inhibitSystemShortcuts(self: *Toplevel, arg_event: ?*Event) void {
        const cFn = @extern(*const fn (*Toplevel, ?*Event) callconv(.c) void, .{ .name = "gdk_toplevel_inhibit_system_shortcuts" });
        const ret = cFn(self, arg_event);
        return ret;
    }
    pub fn lower(self: *Toplevel) bool {
        const cFn = @extern(*const fn (*Toplevel) callconv(.c) bool, .{ .name = "gdk_toplevel_lower" });
        const ret = cFn(self);
        return ret;
    }
    pub fn minimize(self: *Toplevel) bool {
        const cFn = @extern(*const fn (*Toplevel) callconv(.c) bool, .{ .name = "gdk_toplevel_minimize" });
        const ret = cFn(self);
        return ret;
    }
    pub fn present(self: *Toplevel, arg_layout: *ToplevelLayout) void {
        const cFn = @extern(*const fn (*Toplevel, *ToplevelLayout) callconv(.c) void, .{ .name = "gdk_toplevel_present" });
        const ret = cFn(self, arg_layout);
        return ret;
    }
    pub fn restoreSystemShortcuts(self: *Toplevel) void {
        const cFn = @extern(*const fn (*Toplevel) callconv(.c) void, .{ .name = "gdk_toplevel_restore_system_shortcuts" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setDecorated(self: *Toplevel, arg_decorated: bool) void {
        const cFn = @extern(*const fn (*Toplevel, bool) callconv(.c) void, .{ .name = "gdk_toplevel_set_decorated" });
        const ret = cFn(self, arg_decorated);
        return ret;
    }
    pub fn setDeletable(self: *Toplevel, arg_deletable: bool) void {
        const cFn = @extern(*const fn (*Toplevel, bool) callconv(.c) void, .{ .name = "gdk_toplevel_set_deletable" });
        const ret = cFn(self, arg_deletable);
        return ret;
    }
    pub fn setIconList(self: *Toplevel, arg_surfaces: *GLib.List) void {
        const cFn = @extern(*const fn (*Toplevel, *GLib.List) callconv(.c) void, .{ .name = "gdk_toplevel_set_icon_list" });
        const ret = cFn(self, arg_surfaces);
        return ret;
    }
    pub fn setModal(self: *Toplevel, arg_modal: bool) void {
        const cFn = @extern(*const fn (*Toplevel, bool) callconv(.c) void, .{ .name = "gdk_toplevel_set_modal" });
        const ret = cFn(self, arg_modal);
        return ret;
    }
    pub fn setStartupId(self: *Toplevel, arg_startup_id: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Toplevel, [*:0]const u8) callconv(.c) void, .{ .name = "gdk_toplevel_set_startup_id" });
        const ret = cFn(self, arg_startup_id);
        return ret;
    }
    pub fn setTitle(self: *Toplevel, arg_title: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Toplevel, [*:0]const u8) callconv(.c) void, .{ .name = "gdk_toplevel_set_title" });
        const ret = cFn(self, arg_title);
        return ret;
    }
    pub fn setTransientFor(self: *Toplevel, arg_parent: *Surface) void {
        const cFn = @extern(*const fn (*Toplevel, *Surface) callconv(.c) void, .{ .name = "gdk_toplevel_set_transient_for" });
        const ret = cFn(self, arg_parent);
        return ret;
    }
    pub fn showWindowMenu(self: *Toplevel, arg_event: *Event) bool {
        const cFn = @extern(*const fn (*Toplevel, *Event) callconv(.c) bool, .{ .name = "gdk_toplevel_show_window_menu" });
        const ret = cFn(self, arg_event);
        return ret;
    }
    pub fn supportsEdgeConstraints(self: *Toplevel) bool {
        const cFn = @extern(*const fn (*Toplevel) callconv(.c) bool, .{ .name = "gdk_toplevel_supports_edge_constraints" });
        const ret = cFn(self);
        return ret;
    }
    pub fn titlebarGesture(self: *Toplevel, arg_gesture: TitlebarGesture) bool {
        const cFn = @extern(*const fn (*Toplevel, TitlebarGesture) callconv(.c) bool, .{ .name = "gdk_toplevel_titlebar_gesture" });
        const ret = cFn(self, arg_gesture);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_toplevel_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ToplevelInterface = opaque {};
pub const ToplevelLayout = opaque {
    pub fn new() *ToplevelLayout {
        const cFn = @extern(*const fn () callconv(.c) *ToplevelLayout, .{ .name = "gdk_toplevel_layout_new" });
        const ret = cFn();
        return ret;
    }
    pub fn copy(self: *ToplevelLayout) *ToplevelLayout {
        const cFn = @extern(*const fn (*ToplevelLayout) callconv(.c) *ToplevelLayout, .{ .name = "gdk_toplevel_layout_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn equal(self: *ToplevelLayout, arg_other: *ToplevelLayout) bool {
        const cFn = @extern(*const fn (*ToplevelLayout, *ToplevelLayout) callconv(.c) bool, .{ .name = "gdk_toplevel_layout_equal" });
        const ret = cFn(self, arg_other);
        return ret;
    }
    pub fn getFullscreen(self: *ToplevelLayout) ?bool {
        var argO_fullscreen: bool = undefined;
        const arg_fullscreen: *bool = &argO_fullscreen;
        const cFn = @extern(*const fn (*ToplevelLayout, *bool) callconv(.c) bool, .{ .name = "gdk_toplevel_layout_get_fullscreen" });
        const ret = cFn(self, arg_fullscreen);
        if (!ret) return null;
        return argO_fullscreen;
    }
    pub fn getFullscreenMonitor(self: *ToplevelLayout) ?*Monitor {
        const cFn = @extern(*const fn (*ToplevelLayout) callconv(.c) ?*Monitor, .{ .name = "gdk_toplevel_layout_get_fullscreen_monitor" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMaximized(self: *ToplevelLayout) ?bool {
        var argO_maximized: bool = undefined;
        const arg_maximized: *bool = &argO_maximized;
        const cFn = @extern(*const fn (*ToplevelLayout, *bool) callconv(.c) bool, .{ .name = "gdk_toplevel_layout_get_maximized" });
        const ret = cFn(self, arg_maximized);
        if (!ret) return null;
        return argO_maximized;
    }
    pub fn getResizable(self: *ToplevelLayout) bool {
        const cFn = @extern(*const fn (*ToplevelLayout) callconv(.c) bool, .{ .name = "gdk_toplevel_layout_get_resizable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *ToplevelLayout) *ToplevelLayout {
        const cFn = @extern(*const fn (*ToplevelLayout) callconv(.c) *ToplevelLayout, .{ .name = "gdk_toplevel_layout_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setFullscreen(self: *ToplevelLayout, arg_fullscreen: bool, arg_monitor: ?*Monitor) void {
        const cFn = @extern(*const fn (*ToplevelLayout, bool, ?*Monitor) callconv(.c) void, .{ .name = "gdk_toplevel_layout_set_fullscreen" });
        const ret = cFn(self, arg_fullscreen, arg_monitor);
        return ret;
    }
    pub fn setMaximized(self: *ToplevelLayout, arg_maximized: bool) void {
        const cFn = @extern(*const fn (*ToplevelLayout, bool) callconv(.c) void, .{ .name = "gdk_toplevel_layout_set_maximized" });
        const ret = cFn(self, arg_maximized);
        return ret;
    }
    pub fn setResizable(self: *ToplevelLayout, arg_resizable: bool) void {
        const cFn = @extern(*const fn (*ToplevelLayout, bool) callconv(.c) void, .{ .name = "gdk_toplevel_layout_set_resizable" });
        const ret = cFn(self, arg_resizable);
        return ret;
    }
    pub fn unref(self: *ToplevelLayout) void {
        const cFn = @extern(*const fn (*ToplevelLayout) callconv(.c) void, .{ .name = "gdk_toplevel_layout_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_toplevel_layout_get_type" });
        return cFn();
    }
};
pub const ToplevelSize = opaque {
    pub fn getBounds(self: *ToplevelSize) struct {
        bounds_width: i32,
        bounds_height: i32,
    } {
        var argO_bounds_width: i32 = undefined;
        const arg_bounds_width: *i32 = &argO_bounds_width;
        var argO_bounds_height: i32 = undefined;
        const arg_bounds_height: *i32 = &argO_bounds_height;
        const cFn = @extern(*const fn (*ToplevelSize, *i32, *i32) callconv(.c) void, .{ .name = "gdk_toplevel_size_get_bounds" });
        const ret = cFn(self, arg_bounds_width, arg_bounds_height);
        _ = ret;
        return .{ .bounds_width = argO_bounds_width, .bounds_height = argO_bounds_height };
    }
    pub fn setMinSize(self: *ToplevelSize, arg_min_width: i32, arg_min_height: i32) void {
        const cFn = @extern(*const fn (*ToplevelSize, i32, i32) callconv(.c) void, .{ .name = "gdk_toplevel_size_set_min_size" });
        const ret = cFn(self, arg_min_width, arg_min_height);
        return ret;
    }
    pub fn setShadowWidth(self: *ToplevelSize, arg_left: i32, arg_right: i32, arg_top: i32, arg_bottom: i32) void {
        const cFn = @extern(*const fn (*ToplevelSize, i32, i32, i32, i32) callconv(.c) void, .{ .name = "gdk_toplevel_size_set_shadow_width" });
        const ret = cFn(self, arg_left, arg_right, arg_top, arg_bottom);
        return ret;
    }
    pub fn setSize(self: *ToplevelSize, arg_width: i32, arg_height: i32) void {
        const cFn = @extern(*const fn (*ToplevelSize, i32, i32) callconv(.c) void, .{ .name = "gdk_toplevel_size_set_size" });
        const ret = cFn(self, arg_width, arg_height);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_toplevel_size_get_type" });
        return cFn();
    }
};
pub const ToplevelState = packed struct(u32) {
    minimized: bool = false,
    maximized: bool = false,
    sticky: bool = false,
    fullscreen: bool = false,
    above: bool = false,
    below: bool = false,
    focused: bool = false,
    tiled: bool = false,
    top_tiled: bool = false,
    top_resizable: bool = false,
    right_tiled: bool = false,
    right_resizable: bool = false,
    bottom_tiled: bool = false,
    bottom_resizable: bool = false,
    left_tiled: bool = false,
    left_resizable: bool = false,
    suspended: bool = false,
    _: u15 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_toplevel_state_get_type" });
        return cFn();
    }
};
pub const TouchEvent = struct {
    pub const Parent = Event;
    pub fn getEmulatingPointer(self: *TouchEvent) bool {
        const cFn = @extern(*const fn (*TouchEvent) callconv(.c) bool, .{ .name = "gdk_touch_event_get_emulating_pointer" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_touch_event_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TouchpadEvent = struct {
    pub const Parent = Event;
    pub fn getDeltas(self: *TouchpadEvent) struct {
        dx: f64,
        dy: f64,
    } {
        var argO_dx: f64 = undefined;
        const arg_dx: *f64 = &argO_dx;
        var argO_dy: f64 = undefined;
        const arg_dy: *f64 = &argO_dy;
        const cFn = @extern(*const fn (*TouchpadEvent, *f64, *f64) callconv(.c) void, .{ .name = "gdk_touchpad_event_get_deltas" });
        const ret = cFn(self, arg_dx, arg_dy);
        _ = ret;
        return .{ .dx = argO_dx, .dy = argO_dy };
    }
    pub fn getGesturePhase(self: *TouchpadEvent) TouchpadGesturePhase {
        const cFn = @extern(*const fn (*TouchpadEvent) callconv(.c) TouchpadGesturePhase, .{ .name = "gdk_touchpad_event_get_gesture_phase" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNFingers(self: *TouchpadEvent) u32 {
        const cFn = @extern(*const fn (*TouchpadEvent) callconv(.c) u32, .{ .name = "gdk_touchpad_event_get_n_fingers" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPinchAngleDelta(self: *TouchpadEvent) f64 {
        const cFn = @extern(*const fn (*TouchpadEvent) callconv(.c) f64, .{ .name = "gdk_touchpad_event_get_pinch_angle_delta" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPinchScale(self: *TouchpadEvent) f64 {
        const cFn = @extern(*const fn (*TouchpadEvent) callconv(.c) f64, .{ .name = "gdk_touchpad_event_get_pinch_scale" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_touchpad_event_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TouchpadGesturePhase = enum(u32) {
    begin = 0,
    update = 1,
    end = 2,
    cancel = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_touchpad_gesture_phase_get_type" });
        return cFn();
    }
};
pub const VulkanContext = struct {
    pub const Interfaces = [_]type{Gio.Initable};
    pub const Parent = DrawContext;
    _signals: struct {
        @"images-updated": core.Signal(fn (*VulkanContext) void, "images-updated") = .{},
    },
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_vulkan_context_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const VulkanError = enum(u32) {
    unsupported = 0,
    not_available = 1,
    pub fn quark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "gdk_vulkan_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_vulkan_error_get_type" });
        return cFn();
    }
};
pub fn cairoDrawFromGl(arg_cr: *cairo.Context, arg_surface: *Surface, arg_source: i32, arg_source_type: i32, arg_buffer_scale: i32, arg_x: i32, arg_y: i32, arg_width: i32, arg_height: i32) void {
    const cFn = @extern(*const fn (*cairo.Context, *Surface, i32, i32, i32, i32, i32, i32, i32) callconv(.c) void, .{ .name = "gdk_cairo_draw_from_gl" });
    const ret = cFn(arg_cr, arg_surface, arg_source, arg_source_type, arg_buffer_scale, arg_x, arg_y, arg_width, arg_height);
    return ret;
}
pub fn cairoRectangle(arg_cr: *cairo.Context, arg_rectangle: *Rectangle) void {
    const cFn = @extern(*const fn (*cairo.Context, *Rectangle) callconv(.c) void, .{ .name = "gdk_cairo_rectangle" });
    const ret = cFn(arg_cr, arg_rectangle);
    return ret;
}
pub fn cairoRegion(arg_cr: *cairo.Context, arg_region: *cairo.Region) void {
    const cFn = @extern(*const fn (*cairo.Context, *cairo.Region) callconv(.c) void, .{ .name = "gdk_cairo_region" });
    const ret = cFn(arg_cr, arg_region);
    return ret;
}
pub fn cairoRegionCreateFromSurface(arg_surface: *cairo.Surface) *cairo.Region {
    const cFn = @extern(*const fn (*cairo.Surface) callconv(.c) *cairo.Region, .{ .name = "gdk_cairo_region_create_from_surface" });
    const ret = cFn(arg_surface);
    return ret;
}
pub fn cairoSetSourcePixbuf(arg_cr: *cairo.Context, arg_pixbuf: *GdkPixbuf.Pixbuf, arg_pixbuf_x: f64, arg_pixbuf_y: f64) void {
    const cFn = @extern(*const fn (*cairo.Context, *GdkPixbuf.Pixbuf, f64, f64) callconv(.c) void, .{ .name = "gdk_cairo_set_source_pixbuf" });
    const ret = cFn(arg_cr, arg_pixbuf, arg_pixbuf_x, arg_pixbuf_y);
    return ret;
}
pub fn cairoSetSourceRgba(arg_cr: *cairo.Context, arg_rgba: *RGBA) void {
    const cFn = @extern(*const fn (*cairo.Context, *RGBA) callconv(.c) void, .{ .name = "gdk_cairo_set_source_rgba" });
    const ret = cFn(arg_cr, arg_rgba);
    return ret;
}
pub fn colorStateGetOklab() *ColorState {
    const cFn = @extern(*const fn () callconv(.c) *ColorState, .{ .name = "gdk_color_state_get_oklab" });
    const ret = cFn();
    return ret;
}
pub fn colorStateGetOklch() *ColorState {
    const cFn = @extern(*const fn () callconv(.c) *ColorState, .{ .name = "gdk_color_state_get_oklch" });
    const ret = cFn();
    return ret;
}
pub fn colorStateGetRec2100Linear() *ColorState {
    const cFn = @extern(*const fn () callconv(.c) *ColorState, .{ .name = "gdk_color_state_get_rec2100_linear" });
    const ret = cFn();
    return ret;
}
pub fn colorStateGetRec2100Pq() *ColorState {
    const cFn = @extern(*const fn () callconv(.c) *ColorState, .{ .name = "gdk_color_state_get_rec2100_pq" });
    const ret = cFn();
    return ret;
}
pub fn colorStateGetSrgb() *ColorState {
    const cFn = @extern(*const fn () callconv(.c) *ColorState, .{ .name = "gdk_color_state_get_srgb" });
    const ret = cFn();
    return ret;
}
pub fn colorStateGetSrgbLinear() *ColorState {
    const cFn = @extern(*const fn () callconv(.c) *ColorState, .{ .name = "gdk_color_state_get_srgb_linear" });
    const ret = cFn();
    return ret;
}
pub fn contentDeserializeAsync(arg_stream: *Gio.InputStream, arg_mime_type: [*:0]const u8, arg_type: core.Type, arg_io_priority: i32, arg_cancellable: ?*Gio.Cancellable, argC_callback: core.Closure(?Gio.AsyncReadyCallback)) void {
    const arg_callback: ?Gio.AsyncReadyCallback = @ptrCast(argC_callback.callback());
    argC_callback.closure.once = true;
    const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
    const cFn = @extern(*const fn (*Gio.InputStream, [*:0]const u8, core.Type, i32, ?*Gio.Cancellable, ?Gio.AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_content_deserialize_async" });
    const ret = cFn(arg_stream, arg_mime_type, arg_type, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
    return ret;
}
pub fn contentDeserializeFinish(arg_result: *Gio.AsyncResult, arg_value: *GObject.Value, arg_error: *?*GLib.Error) error{GError}!bool {
    const cFn = @extern(*const fn (*Gio.AsyncResult, *GObject.Value, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_content_deserialize_finish" });
    const ret = cFn(arg_result, arg_value, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn contentFormatsParse(arg_string: [*:0]const u8) ?*ContentFormats {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*ContentFormats, .{ .name = "gdk_content_formats_parse" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn contentRegisterDeserializer(arg_mime_type: [*:0]const u8, arg_type: core.Type, argC_deserialize: core.Closure(ContentDeserializeFunc)) void {
    const arg_deserialize: ContentDeserializeFunc = @ptrCast(argC_deserialize.callback());
    const arg_data: ?*anyopaque = @ptrCast(argC_deserialize.data());
    const arg_notify: GLib.DestroyNotify = @ptrCast(argC_deserialize.destroy());
    const cFn = @extern(*const fn ([*:0]const u8, core.Type, ContentDeserializeFunc, ?*anyopaque, GLib.DestroyNotify) callconv(.c) void, .{ .name = "gdk_content_register_deserializer" });
    const ret = cFn(arg_mime_type, arg_type, arg_deserialize, @ptrCast(arg_data), arg_notify);
    return ret;
}
pub fn contentRegisterSerializer(arg_type: core.Type, arg_mime_type: [*:0]const u8, argC_serialize: core.Closure(ContentSerializeFunc)) void {
    const arg_serialize: ContentSerializeFunc = @ptrCast(argC_serialize.callback());
    const arg_data: ?*anyopaque = @ptrCast(argC_serialize.data());
    const arg_notify: GLib.DestroyNotify = @ptrCast(argC_serialize.destroy());
    const cFn = @extern(*const fn (core.Type, [*:0]const u8, ContentSerializeFunc, ?*anyopaque, GLib.DestroyNotify) callconv(.c) void, .{ .name = "gdk_content_register_serializer" });
    const ret = cFn(arg_type, arg_mime_type, arg_serialize, @ptrCast(arg_data), arg_notify);
    return ret;
}
pub fn contentSerializeAsync(arg_stream: *Gio.OutputStream, arg_mime_type: [*:0]const u8, arg_value: *GObject.Value, arg_io_priority: i32, arg_cancellable: ?*Gio.Cancellable, argC_callback: core.Closure(?Gio.AsyncReadyCallback)) void {
    const arg_callback: ?Gio.AsyncReadyCallback = @ptrCast(argC_callback.callback());
    argC_callback.closure.once = true;
    const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
    const cFn = @extern(*const fn (*Gio.OutputStream, [*:0]const u8, *GObject.Value, i32, ?*Gio.Cancellable, ?Gio.AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_content_serialize_async" });
    const ret = cFn(arg_stream, arg_mime_type, arg_value, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
    return ret;
}
pub fn contentSerializeFinish(arg_result: *Gio.AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
    const cFn = @extern(*const fn (*Gio.AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_content_serialize_finish" });
    const ret = cFn(arg_result, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn dmabufErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "gdk_dmabuf_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn dragActionIsUnique(arg_action: DragAction) bool {
    const cFn = @extern(*const fn (DragAction) callconv(.c) bool, .{ .name = "gdk_drag_action_is_unique" });
    const ret = cFn(arg_action);
    return ret;
}
pub fn eventsGetAngle(arg_event1: *Event, arg_event2: *Event) struct {
    ret: bool,
    angle: f64,
} {
    var argO_angle: f64 = undefined;
    const arg_angle: *f64 = &argO_angle;
    const cFn = @extern(*const fn (*Event, *Event, *f64) callconv(.c) bool, .{ .name = "gdk_events_get_angle" });
    const ret = cFn(arg_event1, arg_event2, arg_angle);
    return .{ .ret = ret, .angle = argO_angle };
}
pub fn eventsGetCenter(arg_event1: *Event, arg_event2: *Event) struct {
    ret: bool,
    x: f64,
    y: f64,
} {
    var argO_x: f64 = undefined;
    const arg_x: *f64 = &argO_x;
    var argO_y: f64 = undefined;
    const arg_y: *f64 = &argO_y;
    const cFn = @extern(*const fn (*Event, *Event, *f64, *f64) callconv(.c) bool, .{ .name = "gdk_events_get_center" });
    const ret = cFn(arg_event1, arg_event2, arg_x, arg_y);
    return .{ .ret = ret, .x = argO_x, .y = argO_y };
}
pub fn eventsGetDistance(arg_event1: *Event, arg_event2: *Event) struct {
    ret: bool,
    distance: f64,
} {
    var argO_distance: f64 = undefined;
    const arg_distance: *f64 = &argO_distance;
    const cFn = @extern(*const fn (*Event, *Event, *f64) callconv(.c) bool, .{ .name = "gdk_events_get_distance" });
    const ret = cFn(arg_event1, arg_event2, arg_distance);
    return .{ .ret = ret, .distance = argO_distance };
}
pub fn glErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "gdk_gl_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn internMimeType(arg_string: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "gdk_intern_mime_type" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn keyvalConvertCase(arg_symbol: u32) struct {
    lower: u32,
    upper: u32,
} {
    var argO_lower: u32 = undefined;
    const arg_lower: *u32 = &argO_lower;
    var argO_upper: u32 = undefined;
    const arg_upper: *u32 = &argO_upper;
    const cFn = @extern(*const fn (u32, *u32, *u32) callconv(.c) void, .{ .name = "gdk_keyval_convert_case" });
    const ret = cFn(arg_symbol, arg_lower, arg_upper);
    _ = ret;
    return .{ .lower = argO_lower, .upper = argO_upper };
}
pub fn keyvalFromName(arg_keyval_name: [*:0]const u8) u32 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) u32, .{ .name = "gdk_keyval_from_name" });
    const ret = cFn(arg_keyval_name);
    return ret;
}
pub fn keyvalIsLower(arg_keyval: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "gdk_keyval_is_lower" });
    const ret = cFn(arg_keyval);
    return ret;
}
pub fn keyvalIsUpper(arg_keyval: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "gdk_keyval_is_upper" });
    const ret = cFn(arg_keyval);
    return ret;
}
pub fn keyvalName(arg_keyval: u32) ?[*:0]u8 {
    const cFn = @extern(*const fn (u32) callconv(.c) ?[*:0]u8, .{ .name = "gdk_keyval_name" });
    const ret = cFn(arg_keyval);
    return ret;
}
pub fn keyvalToLower(arg_keyval: u32) u32 {
    const cFn = @extern(*const fn (u32) callconv(.c) u32, .{ .name = "gdk_keyval_to_lower" });
    const ret = cFn(arg_keyval);
    return ret;
}
pub fn keyvalToUnicode(arg_keyval: u32) u32 {
    const cFn = @extern(*const fn (u32) callconv(.c) u32, .{ .name = "gdk_keyval_to_unicode" });
    const ret = cFn(arg_keyval);
    return ret;
}
pub fn keyvalToUpper(arg_keyval: u32) u32 {
    const cFn = @extern(*const fn (u32) callconv(.c) u32, .{ .name = "gdk_keyval_to_upper" });
    const ret = cFn(arg_keyval);
    return ret;
}
pub fn paintableNewEmpty(arg_intrinsic_width: i32, arg_intrinsic_height: i32) *Paintable {
    const cFn = @extern(*const fn (i32, i32) callconv(.c) *Paintable, .{ .name = "gdk_paintable_new_empty" });
    const ret = cFn(arg_intrinsic_width, arg_intrinsic_height);
    return ret;
}
pub fn pixbufGetFromSurface(arg_surface: *cairo.Surface, arg_src_x: i32, arg_src_y: i32, arg_width: i32, arg_height: i32) ?*GdkPixbuf.Pixbuf {
    const cFn = @extern(*const fn (*cairo.Surface, i32, i32, i32, i32) callconv(.c) ?*GdkPixbuf.Pixbuf, .{ .name = "gdk_pixbuf_get_from_surface" });
    const ret = cFn(arg_surface, arg_src_x, arg_src_y, arg_width, arg_height);
    return ret;
}
pub fn pixbufGetFromTexture(arg_texture: *Texture) ?*GdkPixbuf.Pixbuf {
    const cFn = @extern(*const fn (*Texture) callconv(.c) ?*GdkPixbuf.Pixbuf, .{ .name = "gdk_pixbuf_get_from_texture" });
    const ret = cFn(arg_texture);
    return ret;
}
pub fn setAllowedBackends(arg_backends: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) void, .{ .name = "gdk_set_allowed_backends" });
    const ret = cFn(arg_backends);
    return ret;
}
pub fn textureErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "gdk_texture_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn unicodeToKeyval(arg_wc: u32) u32 {
    const cFn = @extern(*const fn (u32) callconv(.c) u32, .{ .name = "gdk_unicode_to_keyval" });
    const ret = cFn(arg_wc);
    return ret;
}
pub fn vulkanErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "gdk_vulkan_error_quark" });
    const ret = cFn();
    return ret;
}

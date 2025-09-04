const core = @import("core.zig");
const GObject = @import("GObject.zig");
const Gio = @import("Gio.zig");
const GLib = @import("GLib.zig");
const GModule = @import("GModule.zig");
const GdkPixbuf = @This();
pub const Colorspace = enum(u32) {
    rgb = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_colorspace_get_type" });
        return cFn();
    }
};
pub const InterpType = enum(u32) {
    nearest = 0,
    tiles = 1,
    bilinear = 2,
    hyper = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_interp_type_get_type" });
        return cFn();
    }
};
pub const PIXBUF_MAJOR = 2;
pub const PIXBUF_MICRO = 12;
pub const PIXBUF_MINOR = 42;
pub const PIXBUF_VERSION = "2.42.12";
pub const Pixbuf = struct {
    pub const Interfaces = [_]type{ Gio.Icon, Gio.LoadableIcon };
    pub const Parent = GObject.Object;
    _props: struct {
        @"bits-per-sample": core.Property(i32, "bits-per-sample") = .{},
        colorspace: core.Property(Colorspace, "colorspace") = .{},
        @"has-alpha": core.Property(bool, "has-alpha") = .{},
        height: core.Property(i32, "height") = .{},
        @"n-channels": core.Property(i32, "n-channels") = .{},
        @"pixel-bytes": core.Property(GLib.Bytes, "pixel-bytes") = .{},
        pixels: core.Property(*anyopaque, "pixels") = .{},
        rowstride: core.Property(i32, "rowstride") = .{},
        width: core.Property(i32, "width") = .{},
    },
    pub fn new(arg_colorspace: Colorspace, arg_has_alpha: bool, arg_bits_per_sample: i32, arg_width: i32, arg_height: i32) ?*Pixbuf {
        const cFn = @extern(*const fn (Colorspace, bool, i32, i32, i32) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_new" });
        const ret = cFn(arg_colorspace, arg_has_alpha, arg_bits_per_sample, arg_width, arg_height);
        return ret;
    }
    pub fn newFromBytes(arg_data: *GLib.Bytes, arg_colorspace: Colorspace, arg_has_alpha: bool, arg_bits_per_sample: i32, arg_width: i32, arg_height: i32, arg_rowstride: i32) *Pixbuf {
        const cFn = @extern(*const fn (*GLib.Bytes, Colorspace, bool, i32, i32, i32, i32) callconv(.c) *Pixbuf, .{ .name = "gdk_pixbuf_new_from_bytes" });
        const ret = cFn(arg_data, arg_colorspace, arg_has_alpha, arg_bits_per_sample, arg_width, arg_height, arg_rowstride);
        return ret;
    }
    pub fn newFromData(arg_data: [*]u8, arg_colorspace: Colorspace, arg_has_alpha: bool, arg_bits_per_sample: i32, arg_width: i32, arg_height: i32, arg_rowstride: i32, argC_destroy_fn: core.Closure(?PixbufDestroyNotify)) *Pixbuf {
        const arg_destroy_fn: ?PixbufDestroyNotify = @ptrCast(argC_destroy_fn.callback());
        argC_destroy_fn.closure.once = true;
        const arg_destroy_fn_data: ?*anyopaque = @ptrCast(argC_destroy_fn.data());
        const cFn = @extern(*const fn ([*]u8, Colorspace, bool, i32, i32, i32, i32, ?PixbufDestroyNotify, ?*anyopaque) callconv(.c) *Pixbuf, .{ .name = "gdk_pixbuf_new_from_data" });
        const ret = cFn(arg_data, arg_colorspace, arg_has_alpha, arg_bits_per_sample, arg_width, arg_height, arg_rowstride, arg_destroy_fn, @ptrCast(arg_destroy_fn_data));
        return ret;
    }
    pub fn newFromFile(arg_filename: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!?*Pixbuf {
        const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_new_from_file" });
        const ret = cFn(arg_filename, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromFileAtScale(arg_filename: [*:0]const u8, arg_width: i32, arg_height: i32, arg_preserve_aspect_ratio: bool, arg_error: *?*GLib.Error) error{GError}!?*Pixbuf {
        const cFn = @extern(*const fn ([*:0]const u8, i32, i32, bool, *?*GLib.Error) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_new_from_file_at_scale" });
        const ret = cFn(arg_filename, arg_width, arg_height, arg_preserve_aspect_ratio, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromFileAtSize(arg_filename: [*:0]const u8, arg_width: i32, arg_height: i32, arg_error: *?*GLib.Error) error{GError}!?*Pixbuf {
        const cFn = @extern(*const fn ([*:0]const u8, i32, i32, *?*GLib.Error) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_new_from_file_at_size" });
        const ret = cFn(arg_filename, arg_width, arg_height, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromInline(argS_data: []u8, arg_copy_pixels: bool, arg_error: *?*GLib.Error) error{GError}!*Pixbuf {
        const arg_data_length: i32 = @intCast((argS_data).len);
        const arg_data: [*]u8 = @ptrCast(argS_data);
        const cFn = @extern(*const fn (i32, [*]u8, bool, *?*GLib.Error) callconv(.c) *Pixbuf, .{ .name = "gdk_pixbuf_new_from_inline" });
        const ret = cFn(arg_data_length, arg_data, arg_copy_pixels, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromResource(arg_resource_path: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!?*Pixbuf {
        const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_new_from_resource" });
        const ret = cFn(arg_resource_path, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromResourceAtScale(arg_resource_path: [*:0]const u8, arg_width: i32, arg_height: i32, arg_preserve_aspect_ratio: bool, arg_error: *?*GLib.Error) error{GError}!?*Pixbuf {
        const cFn = @extern(*const fn ([*:0]const u8, i32, i32, bool, *?*GLib.Error) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_new_from_resource_at_scale" });
        const ret = cFn(arg_resource_path, arg_width, arg_height, arg_preserve_aspect_ratio, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromStream(arg_stream: *Gio.InputStream, arg_cancellable: ?*Gio.Cancellable, arg_error: *?*GLib.Error) error{GError}!?*Pixbuf {
        const cFn = @extern(*const fn (*Gio.InputStream, ?*Gio.Cancellable, *?*GLib.Error) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_new_from_stream" });
        const ret = cFn(arg_stream, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromStreamAtScale(arg_stream: *Gio.InputStream, arg_width: i32, arg_height: i32, arg_preserve_aspect_ratio: bool, arg_cancellable: ?*Gio.Cancellable, arg_error: *?*GLib.Error) error{GError}!?*Pixbuf {
        const cFn = @extern(*const fn (*Gio.InputStream, i32, i32, bool, ?*Gio.Cancellable, *?*GLib.Error) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_new_from_stream_at_scale" });
        const ret = cFn(arg_stream, arg_width, arg_height, arg_preserve_aspect_ratio, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromStreamFinish(arg_async_result: *Gio.AsyncResult, arg_error: *?*GLib.Error) error{GError}!?*Pixbuf {
        const cFn = @extern(*const fn (*Gio.AsyncResult, *?*GLib.Error) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_new_from_stream_finish" });
        const ret = cFn(arg_async_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromXpmData(arg_data: [*]?[*:0]const u8) ?*Pixbuf {
        const cFn = @extern(*const fn ([*]?[*:0]const u8) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_new_from_xpm_data" });
        const ret = cFn(arg_data);
        return ret;
    }
    pub fn calculateRowstride(arg_colorspace: Colorspace, arg_has_alpha: bool, arg_bits_per_sample: i32, arg_width: i32, arg_height: i32) i32 {
        const cFn = @extern(*const fn (Colorspace, bool, i32, i32, i32) callconv(.c) i32, .{ .name = "gdk_pixbuf_calculate_rowstride" });
        const ret = cFn(arg_colorspace, arg_has_alpha, arg_bits_per_sample, arg_width, arg_height);
        return ret;
    }
    pub fn getFileInfo(arg_filename: [*:0]const u8) struct {
        ret: ?*PixbufFormat,
        width: i32,
        height: i32,
    } {
        var argO_width: i32 = undefined;
        const arg_width: ?*i32 = &argO_width;
        var argO_height: i32 = undefined;
        const arg_height: ?*i32 = &argO_height;
        const cFn = @extern(*const fn ([*:0]const u8, ?*i32, ?*i32) callconv(.c) ?*PixbufFormat, .{ .name = "gdk_pixbuf_get_file_info" });
        const ret = cFn(arg_filename, arg_width, arg_height);
        return .{ .ret = ret, .width = argO_width, .height = argO_height };
    }
    pub fn getFileInfoAsync(arg_filename: [*:0]const u8, arg_cancellable: ?*Gio.Cancellable, argC_callback: core.Closure(?Gio.AsyncReadyCallback)) void {
        const arg_callback: ?Gio.AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn ([*:0]const u8, ?*Gio.Cancellable, ?Gio.AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_pixbuf_get_file_info_async" });
        const ret = cFn(arg_filename, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn getFileInfoFinish(arg_async_result: *Gio.AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: ?*PixbufFormat,
        width: i32,
        height: i32,
    } {
        var argO_width: i32 = undefined;
        const arg_width: *i32 = &argO_width;
        var argO_height: i32 = undefined;
        const arg_height: *i32 = &argO_height;
        const cFn = @extern(*const fn (*Gio.AsyncResult, *i32, *i32, *?*GLib.Error) callconv(.c) ?*PixbufFormat, .{ .name = "gdk_pixbuf_get_file_info_finish" });
        const ret = cFn(arg_async_result, arg_width, arg_height, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .width = argO_width, .height = argO_height };
    }
    pub fn getFormats() ?*GLib.SList {
        const cFn = @extern(*const fn () callconv(.c) ?*GLib.SList, .{ .name = "gdk_pixbuf_get_formats" });
        const ret = cFn();
        return ret;
    }
    pub fn initModules(arg_path: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_pixbuf_init_modules" });
        const ret = cFn(arg_path, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromStreamAsync(arg_stream: *Gio.InputStream, arg_cancellable: ?*Gio.Cancellable, argC_callback: core.Closure(?Gio.AsyncReadyCallback)) void {
        const arg_callback: ?Gio.AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Gio.InputStream, ?*Gio.Cancellable, ?Gio.AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_pixbuf_new_from_stream_async" });
        const ret = cFn(arg_stream, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn newFromStreamAtScaleAsync(arg_stream: *Gio.InputStream, arg_width: i32, arg_height: i32, arg_preserve_aspect_ratio: bool, arg_cancellable: ?*Gio.Cancellable, argC_callback: core.Closure(?Gio.AsyncReadyCallback)) void {
        const arg_callback: ?Gio.AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Gio.InputStream, i32, i32, bool, ?*Gio.Cancellable, ?Gio.AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_pixbuf_new_from_stream_at_scale_async" });
        const ret = cFn(arg_stream, arg_width, arg_height, arg_preserve_aspect_ratio, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn saveToStreamFinish(arg_async_result: *Gio.AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Gio.AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_pixbuf_save_to_stream_finish" });
        const ret = cFn(arg_async_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn addAlpha(self: *Pixbuf, arg_substitute_color: bool, arg_r: u8, arg_g: u8, arg_b: u8) ?*Pixbuf {
        const cFn = @extern(*const fn (*Pixbuf, bool, u8, u8, u8) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_add_alpha" });
        const ret = cFn(self, arg_substitute_color, arg_r, arg_g, arg_b);
        return ret;
    }
    pub fn applyEmbeddedOrientation(self: *Pixbuf) ?*Pixbuf {
        const cFn = @extern(*const fn (*Pixbuf) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_apply_embedded_orientation" });
        const ret = cFn(self);
        return ret;
    }
    pub fn composite(self: *Pixbuf, arg_dest: *Pixbuf, arg_dest_x: i32, arg_dest_y: i32, arg_dest_width: i32, arg_dest_height: i32, arg_offset_x: f64, arg_offset_y: f64, arg_scale_x: f64, arg_scale_y: f64, arg_interp_type: InterpType, arg_overall_alpha: i32) void {
        const cFn = @extern(*const fn (*Pixbuf, *Pixbuf, i32, i32, i32, i32, f64, f64, f64, f64, InterpType, i32) callconv(.c) void, .{ .name = "gdk_pixbuf_composite" });
        const ret = cFn(self, arg_dest, arg_dest_x, arg_dest_y, arg_dest_width, arg_dest_height, arg_offset_x, arg_offset_y, arg_scale_x, arg_scale_y, arg_interp_type, arg_overall_alpha);
        return ret;
    }
    pub fn compositeColor(self: *Pixbuf, arg_dest: *Pixbuf, arg_dest_x: i32, arg_dest_y: i32, arg_dest_width: i32, arg_dest_height: i32, arg_offset_x: f64, arg_offset_y: f64, arg_scale_x: f64, arg_scale_y: f64, arg_interp_type: InterpType, arg_overall_alpha: i32, arg_check_x: i32, arg_check_y: i32, arg_check_size: i32, arg_color1: u32, arg_color2: u32) void {
        const cFn = @extern(*const fn (*Pixbuf, *Pixbuf, i32, i32, i32, i32, f64, f64, f64, f64, InterpType, i32, i32, i32, i32, u32, u32) callconv(.c) void, .{ .name = "gdk_pixbuf_composite_color" });
        const ret = cFn(self, arg_dest, arg_dest_x, arg_dest_y, arg_dest_width, arg_dest_height, arg_offset_x, arg_offset_y, arg_scale_x, arg_scale_y, arg_interp_type, arg_overall_alpha, arg_check_x, arg_check_y, arg_check_size, arg_color1, arg_color2);
        return ret;
    }
    pub fn compositeColorSimple(self: *Pixbuf, arg_dest_width: i32, arg_dest_height: i32, arg_interp_type: InterpType, arg_overall_alpha: i32, arg_check_size: i32, arg_color1: u32, arg_color2: u32) ?*Pixbuf {
        const cFn = @extern(*const fn (*Pixbuf, i32, i32, InterpType, i32, i32, u32, u32) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_composite_color_simple" });
        const ret = cFn(self, arg_dest_width, arg_dest_height, arg_interp_type, arg_overall_alpha, arg_check_size, arg_color1, arg_color2);
        return ret;
    }
    pub fn copy(self: *Pixbuf) ?*Pixbuf {
        const cFn = @extern(*const fn (*Pixbuf) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn copyArea(self: *Pixbuf, arg_src_x: i32, arg_src_y: i32, arg_width: i32, arg_height: i32, arg_dest_pixbuf: *Pixbuf, arg_dest_x: i32, arg_dest_y: i32) void {
        const cFn = @extern(*const fn (*Pixbuf, i32, i32, i32, i32, *Pixbuf, i32, i32) callconv(.c) void, .{ .name = "gdk_pixbuf_copy_area" });
        const ret = cFn(self, arg_src_x, arg_src_y, arg_width, arg_height, arg_dest_pixbuf, arg_dest_x, arg_dest_y);
        return ret;
    }
    pub fn copyOptions(self: *Pixbuf, arg_dest_pixbuf: *Pixbuf) bool {
        const cFn = @extern(*const fn (*Pixbuf, *Pixbuf) callconv(.c) bool, .{ .name = "gdk_pixbuf_copy_options" });
        const ret = cFn(self, arg_dest_pixbuf);
        return ret;
    }
    pub fn fill(self: *Pixbuf, arg_pixel: u32) void {
        const cFn = @extern(*const fn (*Pixbuf, u32) callconv(.c) void, .{ .name = "gdk_pixbuf_fill" });
        const ret = cFn(self, arg_pixel);
        return ret;
    }
    pub fn flip(self: *Pixbuf, arg_horizontal: bool) ?*Pixbuf {
        const cFn = @extern(*const fn (*Pixbuf, bool) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_flip" });
        const ret = cFn(self, arg_horizontal);
        return ret;
    }
    pub fn getBitsPerSample(self: *Pixbuf) i32 {
        const cFn = @extern(*const fn (*Pixbuf) callconv(.c) i32, .{ .name = "gdk_pixbuf_get_bits_per_sample" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getByteLength(self: *Pixbuf) u64 {
        const cFn = @extern(*const fn (*Pixbuf) callconv(.c) u64, .{ .name = "gdk_pixbuf_get_byte_length" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getColorspace(self: *Pixbuf) Colorspace {
        const cFn = @extern(*const fn (*Pixbuf) callconv(.c) Colorspace, .{ .name = "gdk_pixbuf_get_colorspace" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHasAlpha(self: *Pixbuf) bool {
        const cFn = @extern(*const fn (*Pixbuf) callconv(.c) bool, .{ .name = "gdk_pixbuf_get_has_alpha" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHeight(self: *Pixbuf) i32 {
        const cFn = @extern(*const fn (*Pixbuf) callconv(.c) i32, .{ .name = "gdk_pixbuf_get_height" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNChannels(self: *Pixbuf) i32 {
        const cFn = @extern(*const fn (*Pixbuf) callconv(.c) i32, .{ .name = "gdk_pixbuf_get_n_channels" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOption(self: *Pixbuf, arg_key: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Pixbuf, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "gdk_pixbuf_get_option" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getOptions(self: *Pixbuf) *GLib.HashTable {
        const cFn = @extern(*const fn (*Pixbuf) callconv(.c) *GLib.HashTable, .{ .name = "gdk_pixbuf_get_options" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPixels(self: *Pixbuf) []u8 {
        var argO_length: u32 = undefined;
        const arg_length: *u32 = &argO_length;
        const cFn = @extern(*const fn (*Pixbuf, *u32) callconv(.c) [*]u8, .{ .name = "gdk_pixbuf_get_pixels_with_length" });
        const ret = cFn(self, arg_length);
        return ret[0..@intCast(argO_length)];
    }
    pub fn getRowstride(self: *Pixbuf) i32 {
        const cFn = @extern(*const fn (*Pixbuf) callconv(.c) i32, .{ .name = "gdk_pixbuf_get_rowstride" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWidth(self: *Pixbuf) i32 {
        const cFn = @extern(*const fn (*Pixbuf) callconv(.c) i32, .{ .name = "gdk_pixbuf_get_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn newSubpixbuf(self: *Pixbuf, arg_src_x: i32, arg_src_y: i32, arg_width: i32, arg_height: i32) *Pixbuf {
        const cFn = @extern(*const fn (*Pixbuf, i32, i32, i32, i32) callconv(.c) *Pixbuf, .{ .name = "gdk_pixbuf_new_subpixbuf" });
        const ret = cFn(self, arg_src_x, arg_src_y, arg_width, arg_height);
        return ret;
    }
    pub fn readPixelBytes(self: *Pixbuf) *GLib.Bytes {
        const cFn = @extern(*const fn (*Pixbuf) callconv(.c) *GLib.Bytes, .{ .name = "gdk_pixbuf_read_pixel_bytes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn readPixels(self: *Pixbuf) *u8 {
        const cFn = @extern(*const fn (*Pixbuf) callconv(.c) *u8, .{ .name = "gdk_pixbuf_read_pixels" });
        const ret = cFn(self);
        return ret;
    }
    pub fn removeOption(self: *Pixbuf, arg_key: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*Pixbuf, [*:0]const u8) callconv(.c) bool, .{ .name = "gdk_pixbuf_remove_option" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn rotateSimple(self: *Pixbuf, arg_angle: PixbufRotation) ?*Pixbuf {
        const cFn = @extern(*const fn (*Pixbuf, PixbufRotation) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_rotate_simple" });
        const ret = cFn(self, arg_angle);
        return ret;
    }
    pub fn saturateAndPixelate(self: *Pixbuf, arg_dest: *Pixbuf, arg_saturation: f32, arg_pixelate: bool) void {
        const cFn = @extern(*const fn (*Pixbuf, *Pixbuf, f32, bool) callconv(.c) void, .{ .name = "gdk_pixbuf_saturate_and_pixelate" });
        const ret = cFn(self, arg_dest, arg_saturation, arg_pixelate);
        return ret;
    }
    pub fn saveToBufferv(self: *Pixbuf, arg_type: [*:0]const u8, arg_option_keys: ?[*]?[*:0]const u8, arg_option_values: ?[*]?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        buffer: []u8,
    } {
        var argO_buffer: [*]u8 = undefined;
        const arg_buffer: *[*]u8 = &argO_buffer;
        var argO_buffer_size: u64 = undefined;
        const arg_buffer_size: *u64 = &argO_buffer_size;
        const cFn = @extern(*const fn (*Pixbuf, *[*]u8, *u64, [*:0]const u8, ?[*]?[*:0]const u8, ?[*]?[*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_pixbuf_save_to_bufferv" });
        const ret = cFn(self, arg_buffer, arg_buffer_size, arg_type, arg_option_keys, arg_option_values, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .buffer = argO_buffer[0..@intCast(argO_buffer_size)] };
    }
    pub fn saveToCallbackv(self: *Pixbuf, argC_save_func: core.Closure(PixbufSaveFunc), arg_type: [*:0]const u8, arg_option_keys: ?[*]?[*:0]const u8, arg_option_values: ?[*]?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const arg_save_func: PixbufSaveFunc = @ptrCast(argC_save_func.callback());
        defer argC_save_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_save_func.data());
        const cFn = @extern(*const fn (*Pixbuf, PixbufSaveFunc, ?*anyopaque, [*:0]const u8, ?[*]?[*:0]const u8, ?[*]?[*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_pixbuf_save_to_callbackv" });
        const ret = cFn(self, arg_save_func, @ptrCast(arg_user_data), arg_type, arg_option_keys, arg_option_values, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn saveToStreamv(self: *Pixbuf, arg_stream: *Gio.OutputStream, arg_type: [*:0]const u8, arg_option_keys: ?[*]?[*:0]const u8, arg_option_values: ?[*]?[*:0]const u8, arg_cancellable: ?*Gio.Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Pixbuf, *Gio.OutputStream, [*:0]const u8, ?[*]?[*:0]const u8, ?[*]?[*:0]const u8, ?*Gio.Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_pixbuf_save_to_streamv" });
        const ret = cFn(self, arg_stream, arg_type, arg_option_keys, arg_option_values, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn saveToStreamvAsync(self: *Pixbuf, arg_stream: *Gio.OutputStream, arg_type: [*:0]const u8, arg_option_keys: ?[*]?[*:0]const u8, arg_option_values: ?[*]?[*:0]const u8, arg_cancellable: ?*Gio.Cancellable, argC_callback: core.Closure(?Gio.AsyncReadyCallback)) void {
        const arg_callback: ?Gio.AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Pixbuf, *Gio.OutputStream, [*:0]const u8, ?[*]?[*:0]const u8, ?[*]?[*:0]const u8, ?*Gio.Cancellable, ?Gio.AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_pixbuf_save_to_streamv_async" });
        const ret = cFn(self, arg_stream, arg_type, arg_option_keys, arg_option_values, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn savev(self: *Pixbuf, arg_filename: [*:0]const u8, arg_type: [*:0]const u8, arg_option_keys: ?[*]?[*:0]const u8, arg_option_values: ?[*]?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Pixbuf, [*:0]const u8, [*:0]const u8, ?[*]?[*:0]const u8, ?[*]?[*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_pixbuf_savev" });
        const ret = cFn(self, arg_filename, arg_type, arg_option_keys, arg_option_values, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn scale(self: *Pixbuf, arg_dest: *Pixbuf, arg_dest_x: i32, arg_dest_y: i32, arg_dest_width: i32, arg_dest_height: i32, arg_offset_x: f64, arg_offset_y: f64, arg_scale_x: f64, arg_scale_y: f64, arg_interp_type: InterpType) void {
        const cFn = @extern(*const fn (*Pixbuf, *Pixbuf, i32, i32, i32, i32, f64, f64, f64, f64, InterpType) callconv(.c) void, .{ .name = "gdk_pixbuf_scale" });
        const ret = cFn(self, arg_dest, arg_dest_x, arg_dest_y, arg_dest_width, arg_dest_height, arg_offset_x, arg_offset_y, arg_scale_x, arg_scale_y, arg_interp_type);
        return ret;
    }
    pub fn scaleSimple(self: *Pixbuf, arg_dest_width: i32, arg_dest_height: i32, arg_interp_type: InterpType) ?*Pixbuf {
        const cFn = @extern(*const fn (*Pixbuf, i32, i32, InterpType) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_scale_simple" });
        const ret = cFn(self, arg_dest_width, arg_dest_height, arg_interp_type);
        return ret;
    }
    pub fn setOption(self: *Pixbuf, arg_key: [*:0]const u8, arg_value: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*Pixbuf, [*:0]const u8, [*:0]const u8) callconv(.c) bool, .{ .name = "gdk_pixbuf_set_option" });
        const ret = cFn(self, arg_key, arg_value);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_pixbuf_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const PixbufAlphaMode = enum(u32) {
    bilevel = 0,
    full = 1,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_pixbuf_alpha_mode_get_type" });
        return cFn();
    }
};
pub const PixbufAnimation = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = PixbufAnimationClass;
    parent_instance: GObject.Object,
    pub fn newFromFile(arg_filename: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!?*PixbufAnimation {
        const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) ?*PixbufAnimation, .{ .name = "gdk_pixbuf_animation_new_from_file" });
        const ret = cFn(arg_filename, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromResource(arg_resource_path: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!?*PixbufAnimation {
        const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) ?*PixbufAnimation, .{ .name = "gdk_pixbuf_animation_new_from_resource" });
        const ret = cFn(arg_resource_path, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromStream(arg_stream: *Gio.InputStream, arg_cancellable: ?*Gio.Cancellable, arg_error: *?*GLib.Error) error{GError}!?*PixbufAnimation {
        const cFn = @extern(*const fn (*Gio.InputStream, ?*Gio.Cancellable, *?*GLib.Error) callconv(.c) ?*PixbufAnimation, .{ .name = "gdk_pixbuf_animation_new_from_stream" });
        const ret = cFn(arg_stream, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromStreamFinish(arg_async_result: *Gio.AsyncResult, arg_error: *?*GLib.Error) error{GError}!?*PixbufAnimation {
        const cFn = @extern(*const fn (*Gio.AsyncResult, *?*GLib.Error) callconv(.c) ?*PixbufAnimation, .{ .name = "gdk_pixbuf_animation_new_from_stream_finish" });
        const ret = cFn(arg_async_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromStreamAsync(arg_stream: *Gio.InputStream, arg_cancellable: ?*Gio.Cancellable, argC_callback: core.Closure(?Gio.AsyncReadyCallback)) void {
        const arg_callback: ?Gio.AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Gio.InputStream, ?*Gio.Cancellable, ?Gio.AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "gdk_pixbuf_animation_new_from_stream_async" });
        const ret = cFn(arg_stream, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn getHeight(self: *PixbufAnimation) i32 {
        const cFn = @extern(*const fn (*PixbufAnimation) callconv(.c) i32, .{ .name = "gdk_pixbuf_animation_get_height" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIter(self: *PixbufAnimation, arg_start_time: ?*GLib.TimeVal) *PixbufAnimationIter {
        const cFn = @extern(*const fn (*PixbufAnimation, ?*GLib.TimeVal) callconv(.c) *PixbufAnimationIter, .{ .name = "gdk_pixbuf_animation_get_iter" });
        const ret = cFn(self, arg_start_time);
        return ret;
    }
    pub fn getStaticImage(self: *PixbufAnimation) *Pixbuf {
        const cFn = @extern(*const fn (*PixbufAnimation) callconv(.c) *Pixbuf, .{ .name = "gdk_pixbuf_animation_get_static_image" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWidth(self: *PixbufAnimation) i32 {
        const cFn = @extern(*const fn (*PixbufAnimation) callconv(.c) i32, .{ .name = "gdk_pixbuf_animation_get_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isStaticImage(self: *PixbufAnimation) bool {
        const cFn = @extern(*const fn (*PixbufAnimation) callconv(.c) bool, .{ .name = "gdk_pixbuf_animation_is_static_image" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_pixbuf_animation_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const PixbufAnimationClass = extern struct {
    parent_class: GObject.ObjectClass,
    is_static_image: ?*const fn (arg_animation: *PixbufAnimation) callconv(.c) bool,
    get_static_image: ?*const fn (arg_animation: *PixbufAnimation) callconv(.c) *Pixbuf,
    get_size: ?*const fn (arg_animation: *PixbufAnimation, arg_width: *i32, arg_height: *i32) callconv(.c) void,
    get_iter: ?*const fn (arg_animation: *PixbufAnimation, arg_start_time: ?*GLib.TimeVal) callconv(.c) *PixbufAnimationIter,
};
pub const PixbufAnimationIter = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = PixbufAnimationIterClass;
    parent_instance: GObject.Object,
    pub fn advance(self: *PixbufAnimationIter, arg_current_time: ?*GLib.TimeVal) bool {
        const cFn = @extern(*const fn (*PixbufAnimationIter, ?*GLib.TimeVal) callconv(.c) bool, .{ .name = "gdk_pixbuf_animation_iter_advance" });
        const ret = cFn(self, arg_current_time);
        return ret;
    }
    pub fn getDelayTime(self: *PixbufAnimationIter) i32 {
        const cFn = @extern(*const fn (*PixbufAnimationIter) callconv(.c) i32, .{ .name = "gdk_pixbuf_animation_iter_get_delay_time" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPixbuf(self: *PixbufAnimationIter) *Pixbuf {
        const cFn = @extern(*const fn (*PixbufAnimationIter) callconv(.c) *Pixbuf, .{ .name = "gdk_pixbuf_animation_iter_get_pixbuf" });
        const ret = cFn(self);
        return ret;
    }
    pub fn onCurrentlyLoadingFrame(self: *PixbufAnimationIter) bool {
        const cFn = @extern(*const fn (*PixbufAnimationIter) callconv(.c) bool, .{ .name = "gdk_pixbuf_animation_iter_on_currently_loading_frame" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_pixbuf_animation_iter_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const PixbufAnimationIterClass = extern struct {
    parent_class: GObject.ObjectClass,
    get_delay_time: ?*const fn (arg_iter: *PixbufAnimationIter) callconv(.c) i32,
    get_pixbuf: ?*const fn (arg_iter: *PixbufAnimationIter) callconv(.c) *Pixbuf,
    on_currently_loading_frame: ?*const fn (arg_iter: *PixbufAnimationIter) callconv(.c) bool,
    advance: ?*const fn (arg_iter: *PixbufAnimationIter, arg_current_time: ?*GLib.TimeVal) callconv(.c) bool,
};
pub const PixbufDestroyNotify = *const fn (arg_pixels: [*]u8, arg_data: ?*anyopaque) callconv(.c) void;
pub const PixbufError = enum(u32) {
    corrupt_image = 0,
    insufficient_memory = 1,
    bad_option = 2,
    unknown_type = 3,
    unsupported_operation = 4,
    failed = 5,
    incomplete_animation = 6,
    pub fn quark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "gdk_pixbuf_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_pixbuf_error_get_type" });
        return cFn();
    }
};
pub const PixbufFormat = extern struct {
    name: ?[*:0]const u8,
    signature: ?*PixbufModulePattern,
    domain: ?[*:0]const u8,
    description: ?[*:0]const u8,
    mime_types: ?[*]?[*:0]const u8,
    extensions: ?[*]?[*:0]const u8,
    flags: u32,
    disabled: bool,
    license: ?[*:0]const u8,
    pub fn copy(self: *PixbufFormat) ?*PixbufFormat {
        const cFn = @extern(*const fn (*PixbufFormat) callconv(.c) ?*PixbufFormat, .{ .name = "gdk_pixbuf_format_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *PixbufFormat) void {
        const cFn = @extern(*const fn (*PixbufFormat) callconv(.c) void, .{ .name = "gdk_pixbuf_format_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDescription(self: *PixbufFormat) ?[*:0]u8 {
        const cFn = @extern(*const fn (*PixbufFormat) callconv(.c) ?[*:0]u8, .{ .name = "gdk_pixbuf_format_get_description" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getExtensions(self: *PixbufFormat) ?[*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*PixbufFormat) callconv(.c) ?[*]?[*:0]const u8, .{ .name = "gdk_pixbuf_format_get_extensions" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLicense(self: *PixbufFormat) ?[*:0]u8 {
        const cFn = @extern(*const fn (*PixbufFormat) callconv(.c) ?[*:0]u8, .{ .name = "gdk_pixbuf_format_get_license" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMimeTypes(self: *PixbufFormat) ?[*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*PixbufFormat) callconv(.c) ?[*]?[*:0]const u8, .{ .name = "gdk_pixbuf_format_get_mime_types" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getName(self: *PixbufFormat) ?[*:0]u8 {
        const cFn = @extern(*const fn (*PixbufFormat) callconv(.c) ?[*:0]u8, .{ .name = "gdk_pixbuf_format_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isDisabled(self: *PixbufFormat) bool {
        const cFn = @extern(*const fn (*PixbufFormat) callconv(.c) bool, .{ .name = "gdk_pixbuf_format_is_disabled" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isSaveOptionSupported(self: *PixbufFormat, arg_option_key: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*PixbufFormat, [*:0]const u8) callconv(.c) bool, .{ .name = "gdk_pixbuf_format_is_save_option_supported" });
        const ret = cFn(self, arg_option_key);
        return ret;
    }
    pub fn isScalable(self: *PixbufFormat) bool {
        const cFn = @extern(*const fn (*PixbufFormat) callconv(.c) bool, .{ .name = "gdk_pixbuf_format_is_scalable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isWritable(self: *PixbufFormat) bool {
        const cFn = @extern(*const fn (*PixbufFormat) callconv(.c) bool, .{ .name = "gdk_pixbuf_format_is_writable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setDisabled(self: *PixbufFormat, arg_disabled: bool) void {
        const cFn = @extern(*const fn (*PixbufFormat, bool) callconv(.c) void, .{ .name = "gdk_pixbuf_format_set_disabled" });
        const ret = cFn(self, arg_disabled);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_pixbuf_format_get_type" });
        return cFn();
    }
};
pub const PixbufFormatFlags = packed struct(u32) {
    writable: bool = false,
    scalable: bool = false,
    threadsafe: bool = false,
    _: u29 = 0,
};
pub const PixbufLoader = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = PixbufLoaderClass;
    _signals: struct {
        @"area-prepared": core.Signal(fn (*PixbufLoader) void, "area-prepared") = .{},
        @"area-updated": core.Signal(fn (*PixbufLoader, i32, i32, i32, i32) void, "area-updated") = .{},
        closed: core.Signal(fn (*PixbufLoader) void, "closed") = .{},
        @"size-prepared": core.Signal(fn (*PixbufLoader, i32, i32) void, "size-prepared") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*anyopaque,
    pub fn new() *PixbufLoader {
        const cFn = @extern(*const fn () callconv(.c) *PixbufLoader, .{ .name = "gdk_pixbuf_loader_new" });
        const ret = cFn();
        return ret;
    }
    pub fn newWithMimeType(arg_mime_type: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*PixbufLoader {
        const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) *PixbufLoader, .{ .name = "gdk_pixbuf_loader_new_with_mime_type" });
        const ret = cFn(arg_mime_type, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newWithType(arg_image_type: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*PixbufLoader {
        const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) *PixbufLoader, .{ .name = "gdk_pixbuf_loader_new_with_type" });
        const ret = cFn(arg_image_type, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn close(self: *PixbufLoader, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*PixbufLoader, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_pixbuf_loader_close" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getAnimation(self: *PixbufLoader) ?*PixbufAnimation {
        const cFn = @extern(*const fn (*PixbufLoader) callconv(.c) ?*PixbufAnimation, .{ .name = "gdk_pixbuf_loader_get_animation" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFormat(self: *PixbufLoader) ?*PixbufFormat {
        const cFn = @extern(*const fn (*PixbufLoader) callconv(.c) ?*PixbufFormat, .{ .name = "gdk_pixbuf_loader_get_format" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPixbuf(self: *PixbufLoader) ?*Pixbuf {
        const cFn = @extern(*const fn (*PixbufLoader) callconv(.c) ?*Pixbuf, .{ .name = "gdk_pixbuf_loader_get_pixbuf" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setSize(self: *PixbufLoader, arg_width: i32, arg_height: i32) void {
        const cFn = @extern(*const fn (*PixbufLoader, i32, i32) callconv(.c) void, .{ .name = "gdk_pixbuf_loader_set_size" });
        const ret = cFn(self, arg_width, arg_height);
        return ret;
    }
    pub fn write(self: *PixbufLoader, argS_buf: []u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const arg_buf: [*]u8 = @ptrCast(argS_buf);
        const arg_count: u64 = @intCast((argS_buf).len);
        const cFn = @extern(*const fn (*PixbufLoader, [*]u8, u64, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_pixbuf_loader_write" });
        const ret = cFn(self, arg_buf, arg_count, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn writeBytes(self: *PixbufLoader, arg_buffer: *GLib.Bytes, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*PixbufLoader, *GLib.Bytes, *?*GLib.Error) callconv(.c) bool, .{ .name = "gdk_pixbuf_loader_write_bytes" });
        const ret = cFn(self, arg_buffer, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_pixbuf_loader_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const PixbufLoaderClass = extern struct {
    parent_class: GObject.ObjectClass,
    size_prepared: ?*const fn (arg_loader: *PixbufLoader, arg_width: i32, arg_height: i32) callconv(.c) void,
    area_prepared: ?*const fn (arg_loader: *PixbufLoader) callconv(.c) void,
    area_updated: ?*const fn (arg_loader: *PixbufLoader, arg_x: i32, arg_y: i32, arg_width: i32, arg_height: i32) callconv(.c) void,
    closed: ?*const fn (arg_loader: *PixbufLoader) callconv(.c) void,
};
pub const PixbufModule = extern struct {
    module_name: ?[*:0]const u8,
    module_path: ?[*:0]const u8,
    module: ?*GModule.Module,
    info: ?*PixbufFormat,
    load: ?PixbufModuleLoadFunc,
    load_xpm_data: ?PixbufModuleLoadXpmDataFunc,
    begin_load: ?*anyopaque,
    stop_load: ?PixbufModuleStopLoadFunc,
    load_increment: ?PixbufModuleIncrementLoadFunc,
    load_animation: ?PixbufModuleLoadAnimationFunc,
    save: ?PixbufModuleSaveFunc,
    save_to_callback: ?*anyopaque,
    is_save_option_supported: ?PixbufModuleSaveOptionSupportedFunc,
    _reserved1: ?*anyopaque,
    _reserved2: ?*anyopaque,
    _reserved3: ?*anyopaque,
    _reserved4: ?*anyopaque,
};
pub const PixbufModuleFillInfoFunc = *const fn (arg_info: *PixbufFormat) callconv(.c) void;
pub const PixbufModuleFillVtableFunc = *const fn (arg_module: *PixbufModule) callconv(.c) void;
pub const PixbufModuleIncrementLoadFunc = *const fn (arg_context: ?*anyopaque, arg_buf: [*]u8, arg_size: u32, arg_error: *?*GLib.Error) callconv(.c) bool;
pub const PixbufModuleLoadAnimationFunc = *const fn (arg_f: ?*anyopaque, arg_error: *?*GLib.Error) callconv(.c) *PixbufAnimation;
pub const PixbufModuleLoadFunc = *const fn (arg_f: ?*anyopaque, arg_error: *?*GLib.Error) callconv(.c) *Pixbuf;
pub const PixbufModuleLoadXpmDataFunc = *const fn (arg_data: [*]?[*:0]const u8) callconv(.c) *Pixbuf;
pub const PixbufModulePattern = extern struct {
    prefix: ?[*:0]const u8,
    mask: ?[*:0]const u8,
    relevance: i32,
};
pub const PixbufModulePreparedFunc = *const fn (arg_pixbuf: *Pixbuf, arg_anim: *PixbufAnimation, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const PixbufModuleSaveFunc = *const fn (arg_f: ?*anyopaque, arg_pixbuf: *Pixbuf, arg_param_keys: ?[*]?[*:0]const u8, arg_param_values: ?[*]?[*:0]const u8, arg_error: *?*GLib.Error) callconv(.c) bool;
pub const PixbufModuleSaveOptionSupportedFunc = *const fn (arg_option_key: [*:0]const u8) callconv(.c) bool;
pub const PixbufModuleSizeFunc = *const fn (arg_width: *i32, arg_height: *i32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const PixbufModuleStopLoadFunc = *const fn (arg_context: ?*anyopaque, arg_error: *?*GLib.Error) callconv(.c) bool;
pub const PixbufModuleUpdatedFunc = *const fn (arg_pixbuf: *Pixbuf, arg_x: i32, arg_y: i32, arg_width: i32, arg_height: i32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const PixbufNonAnim = struct {
    pub const Parent = PixbufAnimation;
    pub fn new(arg_pixbuf: *Pixbuf) *PixbufNonAnim {
        const cFn = @extern(*const fn (*Pixbuf) callconv(.c) *PixbufNonAnim, .{ .name = "gdk_pixbuf_non_anim_new" });
        const ret = cFn(arg_pixbuf);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_pixbuf_non_anim_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const PixbufRotation = enum(u32) {
    none = 0,
    counterclockwise = 90,
    upsidedown = 180,
    clockwise = 270,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_pixbuf_rotation_get_type" });
        return cFn();
    }
};
pub const PixbufSaveFunc = *const fn (arg_buf: [*]u8, arg_count: u64, arg_error: **GLib.Error, arg_data: ?*anyopaque) callconv(.c) bool;
pub const PixbufSimpleAnim = struct {
    pub const Parent = PixbufAnimation;
    pub const Class = PixbufSimpleAnimClass;
    _props: struct {
        loop: core.Property(bool, "loop") = .{},
    },
    pub fn new(arg_width: i32, arg_height: i32, arg_rate: f32) *PixbufSimpleAnim {
        const cFn = @extern(*const fn (i32, i32, f32) callconv(.c) *PixbufSimpleAnim, .{ .name = "gdk_pixbuf_simple_anim_new" });
        const ret = cFn(arg_width, arg_height, arg_rate);
        return ret;
    }
    pub fn addFrame(self: *PixbufSimpleAnim, arg_pixbuf: *Pixbuf) void {
        const cFn = @extern(*const fn (*PixbufSimpleAnim, *Pixbuf) callconv(.c) void, .{ .name = "gdk_pixbuf_simple_anim_add_frame" });
        const ret = cFn(self, arg_pixbuf);
        return ret;
    }
    pub fn getLoop(self: *PixbufSimpleAnim) bool {
        const cFn = @extern(*const fn (*PixbufSimpleAnim) callconv(.c) bool, .{ .name = "gdk_pixbuf_simple_anim_get_loop" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setLoop(self: *PixbufSimpleAnim, arg_loop: bool) void {
        const cFn = @extern(*const fn (*PixbufSimpleAnim, bool) callconv(.c) void, .{ .name = "gdk_pixbuf_simple_anim_set_loop" });
        const ret = cFn(self, arg_loop);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_pixbuf_simple_anim_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const PixbufSimpleAnimClass = opaque {};
pub const PixbufSimpleAnimIter = struct {
    pub const Parent = PixbufAnimationIter;
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gdk_pixbuf_simple_anim_iter_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub fn pixbufErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "gdk_pixbuf_error_quark" });
    const ret = cFn();
    return ret;
}

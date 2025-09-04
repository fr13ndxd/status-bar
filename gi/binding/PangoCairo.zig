const core = @import("core.zig");
const freetype2 = @import("freetype2.zig");
const GLib = @import("GLib.zig");
const HarfBuzz = @import("HarfBuzz.zig");
const GModule = @import("GModule.zig");
const cairo = @import("cairo.zig");
const GObject = @import("GObject.zig");
const Pango = @import("Pango.zig");
const Gio = @import("Gio.zig");
const PangoCairo = @This();
pub const Font = struct {
    pub const Prerequistes = [_]type{Pango.Font};
    pub fn getScaledFont(self: *Font) ?*cairo.ScaledFont {
        const cFn = @extern(*const fn (*Font) callconv(.c) ?*cairo.ScaledFont, .{ .name = "pango_cairo_font_get_scaled_font" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_cairo_font_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FontMap = struct {
    pub const Prerequistes = [_]type{Pango.FontMap};
    pub fn getDefault() *Pango.FontMap {
        const cFn = @extern(*const fn () callconv(.c) *Pango.FontMap, .{ .name = "pango_cairo_font_map_get_default" });
        const ret = cFn();
        return ret;
    }
    pub fn new() *Pango.FontMap {
        const cFn = @extern(*const fn () callconv(.c) *Pango.FontMap, .{ .name = "pango_cairo_font_map_new" });
        const ret = cFn();
        return ret;
    }
    pub fn newForFontType(arg_fonttype: cairo.FontType) ?*Pango.FontMap {
        const cFn = @extern(*const fn (cairo.FontType) callconv(.c) ?*Pango.FontMap, .{ .name = "pango_cairo_font_map_new_for_font_type" });
        const ret = cFn(arg_fonttype);
        return ret;
    }
    pub fn getFontType(self: *FontMap) cairo.FontType {
        const cFn = @extern(*const fn (*FontMap) callconv(.c) cairo.FontType, .{ .name = "pango_cairo_font_map_get_font_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getResolution(self: *FontMap) f64 {
        const cFn = @extern(*const fn (*FontMap) callconv(.c) f64, .{ .name = "pango_cairo_font_map_get_resolution" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setDefault(self: *FontMap) void {
        const cFn = @extern(*const fn (*FontMap) callconv(.c) void, .{ .name = "pango_cairo_font_map_set_default" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setResolution(self: *FontMap, arg_dpi: f64) void {
        const cFn = @extern(*const fn (*FontMap, f64) callconv(.c) void, .{ .name = "pango_cairo_font_map_set_resolution" });
        const ret = cFn(self, arg_dpi);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_cairo_font_map_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ShapeRendererFunc = *const fn (arg_cr: *cairo.Context, arg_attr: *Pango.AttrShape, arg_do_path: bool, arg_data: ?*anyopaque) callconv(.c) void;
pub fn contextGetFontOptions(arg_context: *Pango.Context) ?*cairo.FontOptions {
    const cFn = @extern(*const fn (*Pango.Context) callconv(.c) ?*cairo.FontOptions, .{ .name = "pango_cairo_context_get_font_options" });
    const ret = cFn(arg_context);
    return ret;
}
pub fn contextGetResolution(arg_context: *Pango.Context) f64 {
    const cFn = @extern(*const fn (*Pango.Context) callconv(.c) f64, .{ .name = "pango_cairo_context_get_resolution" });
    const ret = cFn(arg_context);
    return ret;
}
pub fn contextSetFontOptions(arg_context: *Pango.Context, arg_options: ?*cairo.FontOptions) void {
    const cFn = @extern(*const fn (*Pango.Context, ?*cairo.FontOptions) callconv(.c) void, .{ .name = "pango_cairo_context_set_font_options" });
    const ret = cFn(arg_context, arg_options);
    return ret;
}
pub fn contextSetResolution(arg_context: *Pango.Context, arg_dpi: f64) void {
    const cFn = @extern(*const fn (*Pango.Context, f64) callconv(.c) void, .{ .name = "pango_cairo_context_set_resolution" });
    const ret = cFn(arg_context, arg_dpi);
    return ret;
}
pub fn contextSetShapeRenderer(arg_context: *Pango.Context, argC_func: core.Closure(?ShapeRendererFunc)) void {
    const arg_func: ?ShapeRendererFunc = @ptrCast(argC_func.callback());
    const arg_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_dnotify: ?GLib.DestroyNotify = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*Pango.Context, ?ShapeRendererFunc, ?*anyopaque, ?GLib.DestroyNotify) callconv(.c) void, .{ .name = "pango_cairo_context_set_shape_renderer" });
    const ret = cFn(arg_context, arg_func, @ptrCast(arg_data), arg_dnotify);
    return ret;
}
pub fn createContext(arg_cr: *cairo.Context) *Pango.Context {
    const cFn = @extern(*const fn (*cairo.Context) callconv(.c) *Pango.Context, .{ .name = "pango_cairo_create_context" });
    const ret = cFn(arg_cr);
    return ret;
}
pub fn createLayout(arg_cr: *cairo.Context) *Pango.Layout {
    const cFn = @extern(*const fn (*cairo.Context) callconv(.c) *Pango.Layout, .{ .name = "pango_cairo_create_layout" });
    const ret = cFn(arg_cr);
    return ret;
}
pub fn errorUnderlinePath(arg_cr: *cairo.Context, arg_x: f64, arg_y: f64, arg_width: f64, arg_height: f64) void {
    const cFn = @extern(*const fn (*cairo.Context, f64, f64, f64, f64) callconv(.c) void, .{ .name = "pango_cairo_error_underline_path" });
    const ret = cFn(arg_cr, arg_x, arg_y, arg_width, arg_height);
    return ret;
}
pub fn fontMapGetDefault() *Pango.FontMap {
    const cFn = @extern(*const fn () callconv(.c) *Pango.FontMap, .{ .name = "pango_cairo_font_map_get_default" });
    const ret = cFn();
    return ret;
}
pub fn fontMapNew() *Pango.FontMap {
    const cFn = @extern(*const fn () callconv(.c) *Pango.FontMap, .{ .name = "pango_cairo_font_map_new" });
    const ret = cFn();
    return ret;
}
pub fn fontMapNewForFontType(arg_fonttype: cairo.FontType) ?*Pango.FontMap {
    const cFn = @extern(*const fn (cairo.FontType) callconv(.c) ?*Pango.FontMap, .{ .name = "pango_cairo_font_map_new_for_font_type" });
    const ret = cFn(arg_fonttype);
    return ret;
}
pub fn glyphStringPath(arg_cr: *cairo.Context, arg_font: *Pango.Font, arg_glyphs: *Pango.GlyphString) void {
    const cFn = @extern(*const fn (*cairo.Context, *Pango.Font, *Pango.GlyphString) callconv(.c) void, .{ .name = "pango_cairo_glyph_string_path" });
    const ret = cFn(arg_cr, arg_font, arg_glyphs);
    return ret;
}
pub fn layoutLinePath(arg_cr: *cairo.Context, arg_line: *Pango.LayoutLine) void {
    const cFn = @extern(*const fn (*cairo.Context, *Pango.LayoutLine) callconv(.c) void, .{ .name = "pango_cairo_layout_line_path" });
    const ret = cFn(arg_cr, arg_line);
    return ret;
}
pub fn layoutPath(arg_cr: *cairo.Context, arg_layout: *Pango.Layout) void {
    const cFn = @extern(*const fn (*cairo.Context, *Pango.Layout) callconv(.c) void, .{ .name = "pango_cairo_layout_path" });
    const ret = cFn(arg_cr, arg_layout);
    return ret;
}
pub fn showErrorUnderline(arg_cr: *cairo.Context, arg_x: f64, arg_y: f64, arg_width: f64, arg_height: f64) void {
    const cFn = @extern(*const fn (*cairo.Context, f64, f64, f64, f64) callconv(.c) void, .{ .name = "pango_cairo_show_error_underline" });
    const ret = cFn(arg_cr, arg_x, arg_y, arg_width, arg_height);
    return ret;
}
pub fn showGlyphItem(arg_cr: *cairo.Context, arg_text: [*:0]const u8, arg_glyph_item: *Pango.GlyphItem) void {
    const cFn = @extern(*const fn (*cairo.Context, [*:0]const u8, *Pango.GlyphItem) callconv(.c) void, .{ .name = "pango_cairo_show_glyph_item" });
    const ret = cFn(arg_cr, arg_text, arg_glyph_item);
    return ret;
}
pub fn showGlyphString(arg_cr: *cairo.Context, arg_font: *Pango.Font, arg_glyphs: *Pango.GlyphString) void {
    const cFn = @extern(*const fn (*cairo.Context, *Pango.Font, *Pango.GlyphString) callconv(.c) void, .{ .name = "pango_cairo_show_glyph_string" });
    const ret = cFn(arg_cr, arg_font, arg_glyphs);
    return ret;
}
pub fn showLayout(arg_cr: *cairo.Context, arg_layout: *Pango.Layout) void {
    const cFn = @extern(*const fn (*cairo.Context, *Pango.Layout) callconv(.c) void, .{ .name = "pango_cairo_show_layout" });
    const ret = cFn(arg_cr, arg_layout);
    return ret;
}
pub fn showLayoutLine(arg_cr: *cairo.Context, arg_line: *Pango.LayoutLine) void {
    const cFn = @extern(*const fn (*cairo.Context, *Pango.LayoutLine) callconv(.c) void, .{ .name = "pango_cairo_show_layout_line" });
    const ret = cFn(arg_cr, arg_line);
    return ret;
}
pub fn updateContext(arg_cr: *cairo.Context, arg_context: *Pango.Context) void {
    const cFn = @extern(*const fn (*cairo.Context, *Pango.Context) callconv(.c) void, .{ .name = "pango_cairo_update_context" });
    const ret = cFn(arg_cr, arg_context);
    return ret;
}
pub fn updateLayout(arg_cr: *cairo.Context, arg_layout: *Pango.Layout) void {
    const cFn = @extern(*const fn (*cairo.Context, *Pango.Layout) callconv(.c) void, .{ .name = "pango_cairo_update_layout" });
    const ret = cFn(arg_cr, arg_layout);
    return ret;
}

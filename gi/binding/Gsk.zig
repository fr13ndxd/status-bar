const core = @import("core.zig");
const PangoCairo = @import("PangoCairo.zig");
const freetype2 = @import("freetype2.zig");
const GLib = @import("GLib.zig");
const GdkPixbuf = @import("GdkPixbuf.zig");
const HarfBuzz = @import("HarfBuzz.zig");
const GModule = @import("GModule.zig");
const cairo = @import("cairo.zig");
const Graphene = @import("Graphene.zig");
const GObject = @import("GObject.zig");
const Pango = @import("Pango.zig");
const Gdk = @import("Gdk.zig");
const Gio = @import("Gio.zig");
const Gsk = @This();
pub const BlendMode = enum(u32) {
    default = 0,
    multiply = 1,
    screen = 2,
    overlay = 3,
    darken = 4,
    lighten = 5,
    color_dodge = 6,
    color_burn = 7,
    hard_light = 8,
    soft_light = 9,
    difference = 10,
    exclusion = 11,
    color = 12,
    hue = 13,
    saturation = 14,
    luminosity = 15,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_blend_mode_get_type" });
        return cFn();
    }
};
pub const BlendNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_bottom: *RenderNode, arg_top: *RenderNode, arg_blend_mode: BlendMode) *BlendNode {
        const cFn = @extern(*const fn (*RenderNode, *RenderNode, BlendMode) callconv(.c) *BlendNode, .{ .name = "gsk_blend_node_new" });
        const ret = cFn(arg_bottom, arg_top, arg_blend_mode);
        return ret;
    }
    pub fn getBlendMode(self: *BlendNode) BlendMode {
        const cFn = @extern(*const fn (*BlendNode) callconv(.c) BlendMode, .{ .name = "gsk_blend_node_get_blend_mode" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBottomChild(self: *BlendNode) *RenderNode {
        const cFn = @extern(*const fn (*BlendNode) callconv(.c) *RenderNode, .{ .name = "gsk_blend_node_get_bottom_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTopChild(self: *BlendNode) *RenderNode {
        const cFn = @extern(*const fn (*BlendNode) callconv(.c) *RenderNode, .{ .name = "gsk_blend_node_get_top_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_blend_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const BlurNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_child: *RenderNode, arg_radius: f32) *BlurNode {
        const cFn = @extern(*const fn (*RenderNode, f32) callconv(.c) *BlurNode, .{ .name = "gsk_blur_node_new" });
        const ret = cFn(arg_child, arg_radius);
        return ret;
    }
    pub fn getChild(self: *BlurNode) *RenderNode {
        const cFn = @extern(*const fn (*BlurNode) callconv(.c) *RenderNode, .{ .name = "gsk_blur_node_get_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRadius(self: *BlurNode) f32 {
        const cFn = @extern(*const fn (*BlurNode) callconv(.c) f32, .{ .name = "gsk_blur_node_get_radius" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_blur_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const BorderNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_outline: *RoundedRect, arg_border_width: *[4]f32, arg_border_color: *[4]Gdk.RGBA) *BorderNode {
        const cFn = @extern(*const fn (*RoundedRect, *[4]f32, *[4]Gdk.RGBA) callconv(.c) *BorderNode, .{ .name = "gsk_border_node_new" });
        const ret = cFn(arg_outline, arg_border_width, arg_border_color);
        return ret;
    }
    pub fn getColors(self: *BorderNode) *[4]Gdk.RGBA {
        const cFn = @extern(*const fn (*BorderNode) callconv(.c) *[4]Gdk.RGBA, .{ .name = "gsk_border_node_get_colors" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOutline(self: *BorderNode) *RoundedRect {
        const cFn = @extern(*const fn (*BorderNode) callconv(.c) *RoundedRect, .{ .name = "gsk_border_node_get_outline" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWidths(self: *BorderNode) *[4]f32 {
        const cFn = @extern(*const fn (*BorderNode) callconv(.c) *[4]f32, .{ .name = "gsk_border_node_get_widths" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_border_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const BroadwayRenderer = struct {
    pub const Parent = Renderer;
    pub const Class = BroadwayRendererClass;
    pub fn new() *BroadwayRenderer {
        const cFn = @extern(*const fn () callconv(.c) *BroadwayRenderer, .{ .name = "gsk_broadway_renderer_new" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_broadway_renderer_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const BroadwayRendererClass = opaque {};
pub const CairoNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_bounds: *Graphene.Rect) *CairoNode {
        const cFn = @extern(*const fn (*Graphene.Rect) callconv(.c) *CairoNode, .{ .name = "gsk_cairo_node_new" });
        const ret = cFn(arg_bounds);
        return ret;
    }
    pub fn getDrawContext(self: *CairoNode) *cairo.Context {
        const cFn = @extern(*const fn (*CairoNode) callconv(.c) *cairo.Context, .{ .name = "gsk_cairo_node_get_draw_context" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSurface(self: *CairoNode) *cairo.Surface {
        const cFn = @extern(*const fn (*CairoNode) callconv(.c) *cairo.Surface, .{ .name = "gsk_cairo_node_get_surface" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_cairo_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const CairoRenderer = struct {
    pub const Parent = Renderer;
    pub const Class = CairoRendererClass;
    pub fn new() *CairoRenderer {
        const cFn = @extern(*const fn () callconv(.c) *CairoRenderer, .{ .name = "gsk_cairo_renderer_new" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_cairo_renderer_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const CairoRendererClass = opaque {};
pub const ClipNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_child: *RenderNode, arg_clip: *Graphene.Rect) *ClipNode {
        const cFn = @extern(*const fn (*RenderNode, *Graphene.Rect) callconv(.c) *ClipNode, .{ .name = "gsk_clip_node_new" });
        const ret = cFn(arg_child, arg_clip);
        return ret;
    }
    pub fn getChild(self: *ClipNode) *RenderNode {
        const cFn = @extern(*const fn (*ClipNode) callconv(.c) *RenderNode, .{ .name = "gsk_clip_node_get_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getClip(self: *ClipNode) *Graphene.Rect {
        const cFn = @extern(*const fn (*ClipNode) callconv(.c) *Graphene.Rect, .{ .name = "gsk_clip_node_get_clip" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_clip_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ColorMatrixNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_child: *RenderNode, arg_color_matrix: *Graphene.Matrix, arg_color_offset: *Graphene.Vec4) *ColorMatrixNode {
        const cFn = @extern(*const fn (*RenderNode, *Graphene.Matrix, *Graphene.Vec4) callconv(.c) *ColorMatrixNode, .{ .name = "gsk_color_matrix_node_new" });
        const ret = cFn(arg_child, arg_color_matrix, arg_color_offset);
        return ret;
    }
    pub fn getChild(self: *ColorMatrixNode) *RenderNode {
        const cFn = @extern(*const fn (*ColorMatrixNode) callconv(.c) *RenderNode, .{ .name = "gsk_color_matrix_node_get_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getColorMatrix(self: *ColorMatrixNode) *Graphene.Matrix {
        const cFn = @extern(*const fn (*ColorMatrixNode) callconv(.c) *Graphene.Matrix, .{ .name = "gsk_color_matrix_node_get_color_matrix" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getColorOffset(self: *ColorMatrixNode) *Graphene.Vec4 {
        const cFn = @extern(*const fn (*ColorMatrixNode) callconv(.c) *Graphene.Vec4, .{ .name = "gsk_color_matrix_node_get_color_offset" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_color_matrix_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ColorNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_rgba: *Gdk.RGBA, arg_bounds: *Graphene.Rect) *ColorNode {
        const cFn = @extern(*const fn (*Gdk.RGBA, *Graphene.Rect) callconv(.c) *ColorNode, .{ .name = "gsk_color_node_new" });
        const ret = cFn(arg_rgba, arg_bounds);
        return ret;
    }
    pub fn getColor(self: *ColorNode) *Gdk.RGBA {
        const cFn = @extern(*const fn (*ColorNode) callconv(.c) *Gdk.RGBA, .{ .name = "gsk_color_node_get_color" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_color_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ColorStop = extern struct {
    offset: f32,
    color: Gdk.RGBA,
};
pub const ConicGradientNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_bounds: *Graphene.Rect, arg_center: *Graphene.Point, arg_rotation: f32, argS_color_stops: []ColorStop) *ConicGradientNode {
        const arg_color_stops: [*]ColorStop = @ptrCast(argS_color_stops);
        const arg_n_color_stops: u64 = @intCast((argS_color_stops).len);
        const cFn = @extern(*const fn (*Graphene.Rect, *Graphene.Point, f32, [*]ColorStop, u64) callconv(.c) *ConicGradientNode, .{ .name = "gsk_conic_gradient_node_new" });
        const ret = cFn(arg_bounds, arg_center, arg_rotation, arg_color_stops, arg_n_color_stops);
        return ret;
    }
    pub fn getAngle(self: *ConicGradientNode) f32 {
        const cFn = @extern(*const fn (*ConicGradientNode) callconv(.c) f32, .{ .name = "gsk_conic_gradient_node_get_angle" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCenter(self: *ConicGradientNode) *Graphene.Point {
        const cFn = @extern(*const fn (*ConicGradientNode) callconv(.c) *Graphene.Point, .{ .name = "gsk_conic_gradient_node_get_center" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getColorStops(self: *ConicGradientNode) []ColorStop {
        var argO_n_stops: u64 = undefined;
        const arg_n_stops: ?*u64 = &argO_n_stops;
        const cFn = @extern(*const fn (*ConicGradientNode, ?*u64) callconv(.c) [*]ColorStop, .{ .name = "gsk_conic_gradient_node_get_color_stops" });
        const ret = cFn(self, arg_n_stops);
        return ret[0..@intCast(argO_n_stops)];
    }
    pub fn getNColorStops(self: *ConicGradientNode) u64 {
        const cFn = @extern(*const fn (*ConicGradientNode) callconv(.c) u64, .{ .name = "gsk_conic_gradient_node_get_n_color_stops" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRotation(self: *ConicGradientNode) f32 {
        const cFn = @extern(*const fn (*ConicGradientNode) callconv(.c) f32, .{ .name = "gsk_conic_gradient_node_get_rotation" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_conic_gradient_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ContainerNode = struct {
    pub const Parent = RenderNode;
    pub fn new(argS_children: []*RenderNode) *ContainerNode {
        const arg_children: [*]*RenderNode = @ptrCast(argS_children);
        const arg_n_children: u32 = @intCast((argS_children).len);
        const cFn = @extern(*const fn ([*]*RenderNode, u32) callconv(.c) *ContainerNode, .{ .name = "gsk_container_node_new" });
        const ret = cFn(arg_children, arg_n_children);
        return ret;
    }
    pub fn getChild(self: *ContainerNode, arg_idx: u32) *RenderNode {
        const cFn = @extern(*const fn (*ContainerNode, u32) callconv(.c) *RenderNode, .{ .name = "gsk_container_node_get_child" });
        const ret = cFn(self, arg_idx);
        return ret;
    }
    pub fn getNChildren(self: *ContainerNode) u32 {
        const cFn = @extern(*const fn (*ContainerNode) callconv(.c) u32, .{ .name = "gsk_container_node_get_n_children" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_container_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const Corner = enum(u32) {
    top_left = 0,
    top_right = 1,
    bottom_right = 2,
    bottom_left = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_corner_get_type" });
        return cFn();
    }
};
pub const CrossFadeNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_start: *RenderNode, arg_end: *RenderNode, arg_progress: f32) *CrossFadeNode {
        const cFn = @extern(*const fn (*RenderNode, *RenderNode, f32) callconv(.c) *CrossFadeNode, .{ .name = "gsk_cross_fade_node_new" });
        const ret = cFn(arg_start, arg_end, arg_progress);
        return ret;
    }
    pub fn getEndChild(self: *CrossFadeNode) *RenderNode {
        const cFn = @extern(*const fn (*CrossFadeNode) callconv(.c) *RenderNode, .{ .name = "gsk_cross_fade_node_get_end_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getProgress(self: *CrossFadeNode) f32 {
        const cFn = @extern(*const fn (*CrossFadeNode) callconv(.c) f32, .{ .name = "gsk_cross_fade_node_get_progress" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStartChild(self: *CrossFadeNode) *RenderNode {
        const cFn = @extern(*const fn (*CrossFadeNode) callconv(.c) *RenderNode, .{ .name = "gsk_cross_fade_node_get_start_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_cross_fade_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DebugNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_child: *RenderNode, arg_message: [*:0]const u8) *DebugNode {
        const cFn = @extern(*const fn (*RenderNode, [*:0]const u8) callconv(.c) *DebugNode, .{ .name = "gsk_debug_node_new" });
        const ret = cFn(arg_child, arg_message);
        return ret;
    }
    pub fn getChild(self: *DebugNode) *RenderNode {
        const cFn = @extern(*const fn (*DebugNode) callconv(.c) *RenderNode, .{ .name = "gsk_debug_node_get_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMessage(self: *DebugNode) [*:0]u8 {
        const cFn = @extern(*const fn (*DebugNode) callconv(.c) [*:0]u8, .{ .name = "gsk_debug_node_get_message" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_debug_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FillNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_child: *RenderNode, arg_path: *Path, arg_fill_rule: FillRule) *FillNode {
        const cFn = @extern(*const fn (*RenderNode, *Path, FillRule) callconv(.c) *FillNode, .{ .name = "gsk_fill_node_new" });
        const ret = cFn(arg_child, arg_path, arg_fill_rule);
        return ret;
    }
    pub fn getChild(self: *FillNode) *RenderNode {
        const cFn = @extern(*const fn (*FillNode) callconv(.c) *RenderNode, .{ .name = "gsk_fill_node_get_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFillRule(self: *FillNode) FillRule {
        const cFn = @extern(*const fn (*FillNode) callconv(.c) FillRule, .{ .name = "gsk_fill_node_get_fill_rule" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPath(self: *FillNode) *Path {
        const cFn = @extern(*const fn (*FillNode) callconv(.c) *Path, .{ .name = "gsk_fill_node_get_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_fill_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FillRule = enum(u32) {
    winding = 0,
    even_odd = 1,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_fill_rule_get_type" });
        return cFn();
    }
};
pub const GLRenderer = struct {
    pub const Parent = Renderer;
    pub const Class = GLRendererClass;
    pub fn new() *GLRenderer {
        const cFn = @extern(*const fn () callconv(.c) *GLRenderer, .{ .name = "gsk_gl_renderer_new" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_gl_renderer_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const GLRendererClass = opaque {};
pub const GLShader = struct {
    pub const Parent = GObject.Object;
    pub const Class = GLShaderClass;
    _props: struct {
        resource: core.Property([*:0]const u8, "resource") = .{},
        source: core.Property(GLib.Bytes, "source") = .{},
    },
    pub fn newFromBytes(arg_sourcecode: *GLib.Bytes) *GLShader {
        const cFn = @extern(*const fn (*GLib.Bytes) callconv(.c) *GLShader, .{ .name = "gsk_gl_shader_new_from_bytes" });
        const ret = cFn(arg_sourcecode);
        return ret;
    }
    pub fn newFromResource(arg_resource_path: [*:0]const u8) *GLShader {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *GLShader, .{ .name = "gsk_gl_shader_new_from_resource" });
        const ret = cFn(arg_resource_path);
        return ret;
    }
    pub fn compile(self: *GLShader, arg_renderer: *Renderer, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*GLShader, *Renderer, *?*GLib.Error) callconv(.c) bool, .{ .name = "gsk_gl_shader_compile" });
        const ret = cFn(self, arg_renderer, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn findUniformByName(self: *GLShader, arg_name: [*:0]const u8) i32 {
        const cFn = @extern(*const fn (*GLShader, [*:0]const u8) callconv(.c) i32, .{ .name = "gsk_gl_shader_find_uniform_by_name" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn getArgBool(self: *GLShader, arg_args: *GLib.Bytes, arg_idx: i32) bool {
        const cFn = @extern(*const fn (*GLShader, *GLib.Bytes, i32) callconv(.c) bool, .{ .name = "gsk_gl_shader_get_arg_bool" });
        const ret = cFn(self, arg_args, arg_idx);
        return ret;
    }
    pub fn getArgFloat(self: *GLShader, arg_args: *GLib.Bytes, arg_idx: i32) f32 {
        const cFn = @extern(*const fn (*GLShader, *GLib.Bytes, i32) callconv(.c) f32, .{ .name = "gsk_gl_shader_get_arg_float" });
        const ret = cFn(self, arg_args, arg_idx);
        return ret;
    }
    pub fn getArgInt(self: *GLShader, arg_args: *GLib.Bytes, arg_idx: i32) i32 {
        const cFn = @extern(*const fn (*GLShader, *GLib.Bytes, i32) callconv(.c) i32, .{ .name = "gsk_gl_shader_get_arg_int" });
        const ret = cFn(self, arg_args, arg_idx);
        return ret;
    }
    pub fn getArgUint(self: *GLShader, arg_args: *GLib.Bytes, arg_idx: i32) u32 {
        const cFn = @extern(*const fn (*GLShader, *GLib.Bytes, i32) callconv(.c) u32, .{ .name = "gsk_gl_shader_get_arg_uint" });
        const ret = cFn(self, arg_args, arg_idx);
        return ret;
    }
    pub fn getArgVec2(self: *GLShader, arg_args: *GLib.Bytes, arg_idx: i32, arg_out_value: *Graphene.Vec2) void {
        const cFn = @extern(*const fn (*GLShader, *GLib.Bytes, i32, *Graphene.Vec2) callconv(.c) void, .{ .name = "gsk_gl_shader_get_arg_vec2" });
        const ret = cFn(self, arg_args, arg_idx, arg_out_value);
        return ret;
    }
    pub fn getArgVec3(self: *GLShader, arg_args: *GLib.Bytes, arg_idx: i32, arg_out_value: *Graphene.Vec3) void {
        const cFn = @extern(*const fn (*GLShader, *GLib.Bytes, i32, *Graphene.Vec3) callconv(.c) void, .{ .name = "gsk_gl_shader_get_arg_vec3" });
        const ret = cFn(self, arg_args, arg_idx, arg_out_value);
        return ret;
    }
    pub fn getArgVec4(self: *GLShader, arg_args: *GLib.Bytes, arg_idx: i32, arg_out_value: *Graphene.Vec4) void {
        const cFn = @extern(*const fn (*GLShader, *GLib.Bytes, i32, *Graphene.Vec4) callconv(.c) void, .{ .name = "gsk_gl_shader_get_arg_vec4" });
        const ret = cFn(self, arg_args, arg_idx, arg_out_value);
        return ret;
    }
    pub fn getArgsSize(self: *GLShader) u64 {
        const cFn = @extern(*const fn (*GLShader) callconv(.c) u64, .{ .name = "gsk_gl_shader_get_args_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNTextures(self: *GLShader) i32 {
        const cFn = @extern(*const fn (*GLShader) callconv(.c) i32, .{ .name = "gsk_gl_shader_get_n_textures" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNUniforms(self: *GLShader) i32 {
        const cFn = @extern(*const fn (*GLShader) callconv(.c) i32, .{ .name = "gsk_gl_shader_get_n_uniforms" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getResource(self: *GLShader) ?[*:0]u8 {
        const cFn = @extern(*const fn (*GLShader) callconv(.c) ?[*:0]u8, .{ .name = "gsk_gl_shader_get_resource" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSource(self: *GLShader) *GLib.Bytes {
        const cFn = @extern(*const fn (*GLShader) callconv(.c) *GLib.Bytes, .{ .name = "gsk_gl_shader_get_source" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUniformName(self: *GLShader, arg_idx: i32) [*:0]u8 {
        const cFn = @extern(*const fn (*GLShader, i32) callconv(.c) [*:0]u8, .{ .name = "gsk_gl_shader_get_uniform_name" });
        const ret = cFn(self, arg_idx);
        return ret;
    }
    pub fn getUniformOffset(self: *GLShader, arg_idx: i32) i32 {
        const cFn = @extern(*const fn (*GLShader, i32) callconv(.c) i32, .{ .name = "gsk_gl_shader_get_uniform_offset" });
        const ret = cFn(self, arg_idx);
        return ret;
    }
    pub fn getUniformType(self: *GLShader, arg_idx: i32) GLUniformType {
        const cFn = @extern(*const fn (*GLShader, i32) callconv(.c) GLUniformType, .{ .name = "gsk_gl_shader_get_uniform_type" });
        const ret = cFn(self, arg_idx);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_gl_shader_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const GLShaderClass = extern struct {
    parent_class: GObject.ObjectClass,
};
pub const GLShaderNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_shader: *GLShader, arg_bounds: *Graphene.Rect, arg_args: *GLib.Bytes, argS_children: []*RenderNode) *GLShaderNode {
        const arg_children: ?[*]*RenderNode = @ptrCast(argS_children);
        const arg_n_children: u32 = @intCast((argS_children).len);
        const cFn = @extern(*const fn (*GLShader, *Graphene.Rect, *GLib.Bytes, ?[*]*RenderNode, u32) callconv(.c) *GLShaderNode, .{ .name = "gsk_gl_shader_node_new" });
        const ret = cFn(arg_shader, arg_bounds, arg_args, arg_children, arg_n_children);
        return ret;
    }
    pub fn getArgs(self: *GLShaderNode) *GLib.Bytes {
        const cFn = @extern(*const fn (*GLShaderNode) callconv(.c) *GLib.Bytes, .{ .name = "gsk_gl_shader_node_get_args" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getChild(self: *GLShaderNode, arg_idx: u32) *RenderNode {
        const cFn = @extern(*const fn (*GLShaderNode, u32) callconv(.c) *RenderNode, .{ .name = "gsk_gl_shader_node_get_child" });
        const ret = cFn(self, arg_idx);
        return ret;
    }
    pub fn getNChildren(self: *GLShaderNode) u32 {
        const cFn = @extern(*const fn (*GLShaderNode) callconv(.c) u32, .{ .name = "gsk_gl_shader_node_get_n_children" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getShader(self: *GLShaderNode) *GLShader {
        const cFn = @extern(*const fn (*GLShaderNode) callconv(.c) *GLShader, .{ .name = "gsk_gl_shader_node_get_shader" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_gl_shader_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const GLUniformType = enum(u32) {
    none = 0,
    float = 1,
    int = 2,
    uint = 3,
    bool = 4,
    vec2 = 5,
    vec3 = 6,
    vec4 = 7,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_gl_uniform_type_get_type" });
        return cFn();
    }
};
pub const InsetShadowNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_outline: *RoundedRect, arg_color: *Gdk.RGBA, arg_dx: f32, arg_dy: f32, arg_spread: f32, arg_blur_radius: f32) *InsetShadowNode {
        const cFn = @extern(*const fn (*RoundedRect, *Gdk.RGBA, f32, f32, f32, f32) callconv(.c) *InsetShadowNode, .{ .name = "gsk_inset_shadow_node_new" });
        const ret = cFn(arg_outline, arg_color, arg_dx, arg_dy, arg_spread, arg_blur_radius);
        return ret;
    }
    pub fn getBlurRadius(self: *InsetShadowNode) f32 {
        const cFn = @extern(*const fn (*InsetShadowNode) callconv(.c) f32, .{ .name = "gsk_inset_shadow_node_get_blur_radius" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getColor(self: *InsetShadowNode) *Gdk.RGBA {
        const cFn = @extern(*const fn (*InsetShadowNode) callconv(.c) *Gdk.RGBA, .{ .name = "gsk_inset_shadow_node_get_color" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDx(self: *InsetShadowNode) f32 {
        const cFn = @extern(*const fn (*InsetShadowNode) callconv(.c) f32, .{ .name = "gsk_inset_shadow_node_get_dx" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDy(self: *InsetShadowNode) f32 {
        const cFn = @extern(*const fn (*InsetShadowNode) callconv(.c) f32, .{ .name = "gsk_inset_shadow_node_get_dy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOutline(self: *InsetShadowNode) *RoundedRect {
        const cFn = @extern(*const fn (*InsetShadowNode) callconv(.c) *RoundedRect, .{ .name = "gsk_inset_shadow_node_get_outline" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSpread(self: *InsetShadowNode) f32 {
        const cFn = @extern(*const fn (*InsetShadowNode) callconv(.c) f32, .{ .name = "gsk_inset_shadow_node_get_spread" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_inset_shadow_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const LineCap = enum(u32) {
    butt = 0,
    round = 1,
    square = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_line_cap_get_type" });
        return cFn();
    }
};
pub const LineJoin = enum(u32) {
    miter = 0,
    round = 1,
    bevel = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_line_join_get_type" });
        return cFn();
    }
};
pub const LinearGradientNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_bounds: *Graphene.Rect, arg_start: *Graphene.Point, arg_end: *Graphene.Point, argS_color_stops: []ColorStop) *LinearGradientNode {
        const arg_color_stops: [*]ColorStop = @ptrCast(argS_color_stops);
        const arg_n_color_stops: u64 = @intCast((argS_color_stops).len);
        const cFn = @extern(*const fn (*Graphene.Rect, *Graphene.Point, *Graphene.Point, [*]ColorStop, u64) callconv(.c) *LinearGradientNode, .{ .name = "gsk_linear_gradient_node_new" });
        const ret = cFn(arg_bounds, arg_start, arg_end, arg_color_stops, arg_n_color_stops);
        return ret;
    }
    pub fn getColorStops(self: *LinearGradientNode) []ColorStop {
        var argO_n_stops: u64 = undefined;
        const arg_n_stops: ?*u64 = &argO_n_stops;
        const cFn = @extern(*const fn (*LinearGradientNode, ?*u64) callconv(.c) [*]ColorStop, .{ .name = "gsk_linear_gradient_node_get_color_stops" });
        const ret = cFn(self, arg_n_stops);
        return ret[0..@intCast(argO_n_stops)];
    }
    pub fn getEnd(self: *LinearGradientNode) *Graphene.Point {
        const cFn = @extern(*const fn (*LinearGradientNode) callconv(.c) *Graphene.Point, .{ .name = "gsk_linear_gradient_node_get_end" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNColorStops(self: *LinearGradientNode) u64 {
        const cFn = @extern(*const fn (*LinearGradientNode) callconv(.c) u64, .{ .name = "gsk_linear_gradient_node_get_n_color_stops" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStart(self: *LinearGradientNode) *Graphene.Point {
        const cFn = @extern(*const fn (*LinearGradientNode) callconv(.c) *Graphene.Point, .{ .name = "gsk_linear_gradient_node_get_start" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_linear_gradient_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const MaskMode = enum(u32) {
    alpha = 0,
    inverted_alpha = 1,
    luminance = 2,
    inverted_luminance = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_mask_mode_get_type" });
        return cFn();
    }
};
pub const MaskNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_source: *RenderNode, arg_mask: *RenderNode, arg_mask_mode: MaskMode) *MaskNode {
        const cFn = @extern(*const fn (*RenderNode, *RenderNode, MaskMode) callconv(.c) *MaskNode, .{ .name = "gsk_mask_node_new" });
        const ret = cFn(arg_source, arg_mask, arg_mask_mode);
        return ret;
    }
    pub fn getMask(self: *MaskNode) *RenderNode {
        const cFn = @extern(*const fn (*MaskNode) callconv(.c) *RenderNode, .{ .name = "gsk_mask_node_get_mask" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMaskMode(self: *MaskNode) MaskMode {
        const cFn = @extern(*const fn (*MaskNode) callconv(.c) MaskMode, .{ .name = "gsk_mask_node_get_mask_mode" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSource(self: *MaskNode) *RenderNode {
        const cFn = @extern(*const fn (*MaskNode) callconv(.c) *RenderNode, .{ .name = "gsk_mask_node_get_source" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_mask_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const NglRenderer = struct {
    pub const Parent = Renderer;
    pub fn new() *NglRenderer {
        const cFn = @extern(*const fn () callconv(.c) *NglRenderer, .{ .name = "gsk_ngl_renderer_new" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_ngl_renderer_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const OpacityNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_child: *RenderNode, arg_opacity: f32) *OpacityNode {
        const cFn = @extern(*const fn (*RenderNode, f32) callconv(.c) *OpacityNode, .{ .name = "gsk_opacity_node_new" });
        const ret = cFn(arg_child, arg_opacity);
        return ret;
    }
    pub fn getChild(self: *OpacityNode) *RenderNode {
        const cFn = @extern(*const fn (*OpacityNode) callconv(.c) *RenderNode, .{ .name = "gsk_opacity_node_get_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOpacity(self: *OpacityNode) f32 {
        const cFn = @extern(*const fn (*OpacityNode) callconv(.c) f32, .{ .name = "gsk_opacity_node_get_opacity" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_opacity_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const OutsetShadowNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_outline: *RoundedRect, arg_color: *Gdk.RGBA, arg_dx: f32, arg_dy: f32, arg_spread: f32, arg_blur_radius: f32) *OutsetShadowNode {
        const cFn = @extern(*const fn (*RoundedRect, *Gdk.RGBA, f32, f32, f32, f32) callconv(.c) *OutsetShadowNode, .{ .name = "gsk_outset_shadow_node_new" });
        const ret = cFn(arg_outline, arg_color, arg_dx, arg_dy, arg_spread, arg_blur_radius);
        return ret;
    }
    pub fn getBlurRadius(self: *OutsetShadowNode) f32 {
        const cFn = @extern(*const fn (*OutsetShadowNode) callconv(.c) f32, .{ .name = "gsk_outset_shadow_node_get_blur_radius" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getColor(self: *OutsetShadowNode) *Gdk.RGBA {
        const cFn = @extern(*const fn (*OutsetShadowNode) callconv(.c) *Gdk.RGBA, .{ .name = "gsk_outset_shadow_node_get_color" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDx(self: *OutsetShadowNode) f32 {
        const cFn = @extern(*const fn (*OutsetShadowNode) callconv(.c) f32, .{ .name = "gsk_outset_shadow_node_get_dx" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDy(self: *OutsetShadowNode) f32 {
        const cFn = @extern(*const fn (*OutsetShadowNode) callconv(.c) f32, .{ .name = "gsk_outset_shadow_node_get_dy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOutline(self: *OutsetShadowNode) *RoundedRect {
        const cFn = @extern(*const fn (*OutsetShadowNode) callconv(.c) *RoundedRect, .{ .name = "gsk_outset_shadow_node_get_outline" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSpread(self: *OutsetShadowNode) f32 {
        const cFn = @extern(*const fn (*OutsetShadowNode) callconv(.c) f32, .{ .name = "gsk_outset_shadow_node_get_spread" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_outset_shadow_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParseErrorFunc = *const fn (arg_start: *ParseLocation, arg_end: *ParseLocation, arg_error: *GLib.Error, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const ParseLocation = extern struct {
    bytes: u64,
    chars: u64,
    lines: u64,
    line_bytes: u64,
    line_chars: u64,
};
pub const Path = opaque {
    pub fn foreach(self: *Path, arg_flags: PathForeachFlags, argC_func: core.Closure(PathForeachFunc)) bool {
        const arg_func: PathForeachFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*Path, PathForeachFlags, PathForeachFunc, ?*anyopaque) callconv(.c) bool, .{ .name = "gsk_path_foreach" });
        const ret = cFn(self, arg_flags, arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn getBounds(self: *Path, arg_bounds: *Graphene.Rect) bool {
        const cFn = @extern(*const fn (*Path, *Graphene.Rect) callconv(.c) bool, .{ .name = "gsk_path_get_bounds" });
        const ret = cFn(self, arg_bounds);
        return ret;
    }
    pub fn getClosestPoint(self: *Path, arg_point: *Graphene.Point, arg_threshold: f32, arg_result: *PathPoint) ?f32 {
        var argO_distance: f32 = undefined;
        const arg_distance: ?*f32 = &argO_distance;
        const cFn = @extern(*const fn (*Path, *Graphene.Point, f32, *PathPoint, ?*f32) callconv(.c) bool, .{ .name = "gsk_path_get_closest_point" });
        const ret = cFn(self, arg_point, arg_threshold, arg_result, arg_distance);
        if (!ret) return null;
        return argO_distance;
    }
    pub fn getEndPoint(self: *Path, arg_result: *PathPoint) bool {
        const cFn = @extern(*const fn (*Path, *PathPoint) callconv(.c) bool, .{ .name = "gsk_path_get_end_point" });
        const ret = cFn(self, arg_result);
        return ret;
    }
    pub fn getStartPoint(self: *Path, arg_result: *PathPoint) bool {
        const cFn = @extern(*const fn (*Path, *PathPoint) callconv(.c) bool, .{ .name = "gsk_path_get_start_point" });
        const ret = cFn(self, arg_result);
        return ret;
    }
    pub fn getStrokeBounds(self: *Path, arg_stroke: *Stroke, arg_bounds: *Graphene.Rect) bool {
        const cFn = @extern(*const fn (*Path, *Stroke, *Graphene.Rect) callconv(.c) bool, .{ .name = "gsk_path_get_stroke_bounds" });
        const ret = cFn(self, arg_stroke, arg_bounds);
        return ret;
    }
    pub fn inFill(self: *Path, arg_point: *Graphene.Point, arg_fill_rule: FillRule) bool {
        const cFn = @extern(*const fn (*Path, *Graphene.Point, FillRule) callconv(.c) bool, .{ .name = "gsk_path_in_fill" });
        const ret = cFn(self, arg_point, arg_fill_rule);
        return ret;
    }
    pub fn isClosed(self: *Path) bool {
        const cFn = @extern(*const fn (*Path) callconv(.c) bool, .{ .name = "gsk_path_is_closed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isEmpty(self: *Path) bool {
        const cFn = @extern(*const fn (*Path) callconv(.c) bool, .{ .name = "gsk_path_is_empty" });
        const ret = cFn(self);
        return ret;
    }
    pub fn print(self: *Path, arg_string: *GLib.String) void {
        const cFn = @extern(*const fn (*Path, *GLib.String) callconv(.c) void, .{ .name = "gsk_path_print" });
        const ret = cFn(self, arg_string);
        return ret;
    }
    pub fn ref(self: *Path) *Path {
        const cFn = @extern(*const fn (*Path) callconv(.c) *Path, .{ .name = "gsk_path_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn toCairo(self: *Path, arg_cr: *cairo.Context) void {
        const cFn = @extern(*const fn (*Path, *cairo.Context) callconv(.c) void, .{ .name = "gsk_path_to_cairo" });
        const ret = cFn(self, arg_cr);
        return ret;
    }
    pub fn toString(self: *Path) [*:0]u8 {
        const cFn = @extern(*const fn (*Path) callconv(.c) [*:0]u8, .{ .name = "gsk_path_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *Path) void {
        const cFn = @extern(*const fn (*Path) callconv(.c) void, .{ .name = "gsk_path_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn parse(arg_string: [*:0]const u8) ?*Path {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*Path, .{ .name = "gsk_path_parse" });
        const ret = cFn(arg_string);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_path_get_type" });
        return cFn();
    }
};
pub const PathBuilder = opaque {
    pub fn new() *PathBuilder {
        const cFn = @extern(*const fn () callconv(.c) *PathBuilder, .{ .name = "gsk_path_builder_new" });
        const ret = cFn();
        return ret;
    }
    pub fn addCairoPath(self: *PathBuilder, arg_path: *cairo.Path) void {
        const cFn = @extern(*const fn (*PathBuilder, *cairo.Path) callconv(.c) void, .{ .name = "gsk_path_builder_add_cairo_path" });
        const ret = cFn(self, arg_path);
        return ret;
    }
    pub fn addCircle(self: *PathBuilder, arg_center: *Graphene.Point, arg_radius: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, *Graphene.Point, f32) callconv(.c) void, .{ .name = "gsk_path_builder_add_circle" });
        const ret = cFn(self, arg_center, arg_radius);
        return ret;
    }
    pub fn addLayout(self: *PathBuilder, arg_layout: *Pango.Layout) void {
        const cFn = @extern(*const fn (*PathBuilder, *Pango.Layout) callconv(.c) void, .{ .name = "gsk_path_builder_add_layout" });
        const ret = cFn(self, arg_layout);
        return ret;
    }
    pub fn addPath(self: *PathBuilder, arg_path: *Path) void {
        const cFn = @extern(*const fn (*PathBuilder, *Path) callconv(.c) void, .{ .name = "gsk_path_builder_add_path" });
        const ret = cFn(self, arg_path);
        return ret;
    }
    pub fn addRect(self: *PathBuilder, arg_rect: *Graphene.Rect) void {
        const cFn = @extern(*const fn (*PathBuilder, *Graphene.Rect) callconv(.c) void, .{ .name = "gsk_path_builder_add_rect" });
        const ret = cFn(self, arg_rect);
        return ret;
    }
    pub fn addReversePath(self: *PathBuilder, arg_path: *Path) void {
        const cFn = @extern(*const fn (*PathBuilder, *Path) callconv(.c) void, .{ .name = "gsk_path_builder_add_reverse_path" });
        const ret = cFn(self, arg_path);
        return ret;
    }
    pub fn addRoundedRect(self: *PathBuilder, arg_rect: *RoundedRect) void {
        const cFn = @extern(*const fn (*PathBuilder, *RoundedRect) callconv(.c) void, .{ .name = "gsk_path_builder_add_rounded_rect" });
        const ret = cFn(self, arg_rect);
        return ret;
    }
    pub fn addSegment(self: *PathBuilder, arg_path: *Path, arg_start: *PathPoint, arg_end: *PathPoint) void {
        const cFn = @extern(*const fn (*PathBuilder, *Path, *PathPoint, *PathPoint) callconv(.c) void, .{ .name = "gsk_path_builder_add_segment" });
        const ret = cFn(self, arg_path, arg_start, arg_end);
        return ret;
    }
    pub fn arcTo(self: *PathBuilder, arg_x1: f32, arg_y1: f32, arg_x2: f32, arg_y2: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_arc_to" });
        const ret = cFn(self, arg_x1, arg_y1, arg_x2, arg_y2);
        return ret;
    }
    pub fn close(self: *PathBuilder) void {
        const cFn = @extern(*const fn (*PathBuilder) callconv(.c) void, .{ .name = "gsk_path_builder_close" });
        const ret = cFn(self);
        return ret;
    }
    pub fn conicTo(self: *PathBuilder, arg_x1: f32, arg_y1: f32, arg_x2: f32, arg_y2: f32, arg_weight: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32, f32, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_conic_to" });
        const ret = cFn(self, arg_x1, arg_y1, arg_x2, arg_y2, arg_weight);
        return ret;
    }
    pub fn cubicTo(self: *PathBuilder, arg_x1: f32, arg_y1: f32, arg_x2: f32, arg_y2: f32, arg_x3: f32, arg_y3: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32, f32, f32, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_cubic_to" });
        const ret = cFn(self, arg_x1, arg_y1, arg_x2, arg_y2, arg_x3, arg_y3);
        return ret;
    }
    pub fn getCurrentPoint(self: *PathBuilder) *Graphene.Point {
        const cFn = @extern(*const fn (*PathBuilder) callconv(.c) *Graphene.Point, .{ .name = "gsk_path_builder_get_current_point" });
        const ret = cFn(self);
        return ret;
    }
    pub fn htmlArcTo(self: *PathBuilder, arg_x1: f32, arg_y1: f32, arg_x2: f32, arg_y2: f32, arg_radius: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32, f32, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_html_arc_to" });
        const ret = cFn(self, arg_x1, arg_y1, arg_x2, arg_y2, arg_radius);
        return ret;
    }
    pub fn lineTo(self: *PathBuilder, arg_x: f32, arg_y: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_line_to" });
        const ret = cFn(self, arg_x, arg_y);
        return ret;
    }
    pub fn moveTo(self: *PathBuilder, arg_x: f32, arg_y: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_move_to" });
        const ret = cFn(self, arg_x, arg_y);
        return ret;
    }
    pub fn quadTo(self: *PathBuilder, arg_x1: f32, arg_y1: f32, arg_x2: f32, arg_y2: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_quad_to" });
        const ret = cFn(self, arg_x1, arg_y1, arg_x2, arg_y2);
        return ret;
    }
    pub fn ref(self: *PathBuilder) *PathBuilder {
        const cFn = @extern(*const fn (*PathBuilder) callconv(.c) *PathBuilder, .{ .name = "gsk_path_builder_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn relArcTo(self: *PathBuilder, arg_x1: f32, arg_y1: f32, arg_x2: f32, arg_y2: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_rel_arc_to" });
        const ret = cFn(self, arg_x1, arg_y1, arg_x2, arg_y2);
        return ret;
    }
    pub fn relConicTo(self: *PathBuilder, arg_x1: f32, arg_y1: f32, arg_x2: f32, arg_y2: f32, arg_weight: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32, f32, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_rel_conic_to" });
        const ret = cFn(self, arg_x1, arg_y1, arg_x2, arg_y2, arg_weight);
        return ret;
    }
    pub fn relCubicTo(self: *PathBuilder, arg_x1: f32, arg_y1: f32, arg_x2: f32, arg_y2: f32, arg_x3: f32, arg_y3: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32, f32, f32, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_rel_cubic_to" });
        const ret = cFn(self, arg_x1, arg_y1, arg_x2, arg_y2, arg_x3, arg_y3);
        return ret;
    }
    pub fn relHtmlArcTo(self: *PathBuilder, arg_x1: f32, arg_y1: f32, arg_x2: f32, arg_y2: f32, arg_radius: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32, f32, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_rel_html_arc_to" });
        const ret = cFn(self, arg_x1, arg_y1, arg_x2, arg_y2, arg_radius);
        return ret;
    }
    pub fn relLineTo(self: *PathBuilder, arg_x: f32, arg_y: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_rel_line_to" });
        const ret = cFn(self, arg_x, arg_y);
        return ret;
    }
    pub fn relMoveTo(self: *PathBuilder, arg_x: f32, arg_y: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_rel_move_to" });
        const ret = cFn(self, arg_x, arg_y);
        return ret;
    }
    pub fn relQuadTo(self: *PathBuilder, arg_x1: f32, arg_y1: f32, arg_x2: f32, arg_y2: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_rel_quad_to" });
        const ret = cFn(self, arg_x1, arg_y1, arg_x2, arg_y2);
        return ret;
    }
    pub fn relSvgArcTo(self: *PathBuilder, arg_rx: f32, arg_ry: f32, arg_x_axis_rotation: f32, arg_large_arc: bool, arg_positive_sweep: bool, arg_x: f32, arg_y: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32, f32, bool, bool, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_rel_svg_arc_to" });
        const ret = cFn(self, arg_rx, arg_ry, arg_x_axis_rotation, arg_large_arc, arg_positive_sweep, arg_x, arg_y);
        return ret;
    }
    pub fn svgArcTo(self: *PathBuilder, arg_rx: f32, arg_ry: f32, arg_x_axis_rotation: f32, arg_large_arc: bool, arg_positive_sweep: bool, arg_x: f32, arg_y: f32) void {
        const cFn = @extern(*const fn (*PathBuilder, f32, f32, f32, bool, bool, f32, f32) callconv(.c) void, .{ .name = "gsk_path_builder_svg_arc_to" });
        const ret = cFn(self, arg_rx, arg_ry, arg_x_axis_rotation, arg_large_arc, arg_positive_sweep, arg_x, arg_y);
        return ret;
    }
    pub fn toPath(self: *PathBuilder) *Path {
        const cFn = @extern(*const fn (*PathBuilder) callconv(.c) *Path, .{ .name = "gsk_path_builder_to_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *PathBuilder) void {
        const cFn = @extern(*const fn (*PathBuilder) callconv(.c) void, .{ .name = "gsk_path_builder_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_path_builder_get_type" });
        return cFn();
    }
};
pub const PathDirection = enum(u32) {
    from_start = 0,
    to_start = 1,
    to_end = 2,
    from_end = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_path_direction_get_type" });
        return cFn();
    }
};
pub const PathForeachFlags = packed struct(u32) {
    quad: bool = false,
    cubic: bool = false,
    conic: bool = false,
    _: u29 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_path_foreach_flags_get_type" });
        return cFn();
    }
};
pub const PathForeachFunc = *const fn (arg_op: PathOperation, arg_pts: *Graphene.Point, arg_n_pts: u64, arg_weight: f32, arg_user_data: ?*anyopaque) callconv(.c) bool;
pub const PathMeasure = opaque {
    pub fn new(arg_path: *Path) *PathMeasure {
        const cFn = @extern(*const fn (*Path) callconv(.c) *PathMeasure, .{ .name = "gsk_path_measure_new" });
        const ret = cFn(arg_path);
        return ret;
    }
    pub fn newWithTolerance(arg_path: *Path, arg_tolerance: f32) *PathMeasure {
        const cFn = @extern(*const fn (*Path, f32) callconv(.c) *PathMeasure, .{ .name = "gsk_path_measure_new_with_tolerance" });
        const ret = cFn(arg_path, arg_tolerance);
        return ret;
    }
    pub fn getLength(self: *PathMeasure) f32 {
        const cFn = @extern(*const fn (*PathMeasure) callconv(.c) f32, .{ .name = "gsk_path_measure_get_length" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPath(self: *PathMeasure) *Path {
        const cFn = @extern(*const fn (*PathMeasure) callconv(.c) *Path, .{ .name = "gsk_path_measure_get_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPoint(self: *PathMeasure, arg_distance: f32, arg_result: *PathPoint) bool {
        const cFn = @extern(*const fn (*PathMeasure, f32, *PathPoint) callconv(.c) bool, .{ .name = "gsk_path_measure_get_point" });
        const ret = cFn(self, arg_distance, arg_result);
        return ret;
    }
    pub fn getTolerance(self: *PathMeasure) f32 {
        const cFn = @extern(*const fn (*PathMeasure) callconv(.c) f32, .{ .name = "gsk_path_measure_get_tolerance" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *PathMeasure) *PathMeasure {
        const cFn = @extern(*const fn (*PathMeasure) callconv(.c) *PathMeasure, .{ .name = "gsk_path_measure_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *PathMeasure) void {
        const cFn = @extern(*const fn (*PathMeasure) callconv(.c) void, .{ .name = "gsk_path_measure_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_path_measure_get_type" });
        return cFn();
    }
};
pub const PathOperation = enum(u32) {
    move = 0,
    close = 1,
    line = 2,
    quad = 3,
    cubic = 4,
    conic = 5,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_path_operation_get_type" });
        return cFn();
    }
};
pub const PathPoint = opaque {
    pub fn compare(self: *PathPoint, arg_point2: *PathPoint) i32 {
        const cFn = @extern(*const fn (*PathPoint, *PathPoint) callconv(.c) i32, .{ .name = "gsk_path_point_compare" });
        const ret = cFn(self, arg_point2);
        return ret;
    }
    pub fn copy(self: *PathPoint) *PathPoint {
        const cFn = @extern(*const fn (*PathPoint) callconv(.c) *PathPoint, .{ .name = "gsk_path_point_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn equal(self: *PathPoint, arg_point2: *PathPoint) bool {
        const cFn = @extern(*const fn (*PathPoint, *PathPoint) callconv(.c) bool, .{ .name = "gsk_path_point_equal" });
        const ret = cFn(self, arg_point2);
        return ret;
    }
    pub fn free(self: *PathPoint) void {
        const cFn = @extern(*const fn (*PathPoint) callconv(.c) void, .{ .name = "gsk_path_point_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCurvature(self: *PathPoint, arg_path: *Path, arg_direction: PathDirection, arg_center: *Graphene.Point) f32 {
        const cFn = @extern(*const fn (*PathPoint, *Path, PathDirection, *Graphene.Point) callconv(.c) f32, .{ .name = "gsk_path_point_get_curvature" });
        const ret = cFn(self, arg_path, arg_direction, arg_center);
        return ret;
    }
    pub fn getDistance(self: *PathPoint, arg_measure: *PathMeasure) f32 {
        const cFn = @extern(*const fn (*PathPoint, *PathMeasure) callconv(.c) f32, .{ .name = "gsk_path_point_get_distance" });
        const ret = cFn(self, arg_measure);
        return ret;
    }
    pub fn getPosition(self: *PathPoint, arg_path: *Path, arg_position: *Graphene.Point) void {
        const cFn = @extern(*const fn (*PathPoint, *Path, *Graphene.Point) callconv(.c) void, .{ .name = "gsk_path_point_get_position" });
        const ret = cFn(self, arg_path, arg_position);
        return ret;
    }
    pub fn getRotation(self: *PathPoint, arg_path: *Path, arg_direction: PathDirection) f32 {
        const cFn = @extern(*const fn (*PathPoint, *Path, PathDirection) callconv(.c) f32, .{ .name = "gsk_path_point_get_rotation" });
        const ret = cFn(self, arg_path, arg_direction);
        return ret;
    }
    pub fn getTangent(self: *PathPoint, arg_path: *Path, arg_direction: PathDirection, arg_tangent: *Graphene.Vec2) void {
        const cFn = @extern(*const fn (*PathPoint, *Path, PathDirection, *Graphene.Vec2) callconv(.c) void, .{ .name = "gsk_path_point_get_tangent" });
        const ret = cFn(self, arg_path, arg_direction, arg_tangent);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_path_point_get_type" });
        return cFn();
    }
};
pub const RadialGradientNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_bounds: *Graphene.Rect, arg_center: *Graphene.Point, arg_hradius: f32, arg_vradius: f32, arg_start: f32, arg_end: f32, argS_color_stops: []ColorStop) *RadialGradientNode {
        const arg_color_stops: [*]ColorStop = @ptrCast(argS_color_stops);
        const arg_n_color_stops: u64 = @intCast((argS_color_stops).len);
        const cFn = @extern(*const fn (*Graphene.Rect, *Graphene.Point, f32, f32, f32, f32, [*]ColorStop, u64) callconv(.c) *RadialGradientNode, .{ .name = "gsk_radial_gradient_node_new" });
        const ret = cFn(arg_bounds, arg_center, arg_hradius, arg_vradius, arg_start, arg_end, arg_color_stops, arg_n_color_stops);
        return ret;
    }
    pub fn getCenter(self: *RadialGradientNode) *Graphene.Point {
        const cFn = @extern(*const fn (*RadialGradientNode) callconv(.c) *Graphene.Point, .{ .name = "gsk_radial_gradient_node_get_center" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getColorStops(self: *RadialGradientNode) []ColorStop {
        var argO_n_stops: u64 = undefined;
        const arg_n_stops: ?*u64 = &argO_n_stops;
        const cFn = @extern(*const fn (*RadialGradientNode, ?*u64) callconv(.c) [*]ColorStop, .{ .name = "gsk_radial_gradient_node_get_color_stops" });
        const ret = cFn(self, arg_n_stops);
        return ret[0..@intCast(argO_n_stops)];
    }
    pub fn getEnd(self: *RadialGradientNode) f32 {
        const cFn = @extern(*const fn (*RadialGradientNode) callconv(.c) f32, .{ .name = "gsk_radial_gradient_node_get_end" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHradius(self: *RadialGradientNode) f32 {
        const cFn = @extern(*const fn (*RadialGradientNode) callconv(.c) f32, .{ .name = "gsk_radial_gradient_node_get_hradius" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNColorStops(self: *RadialGradientNode) u64 {
        const cFn = @extern(*const fn (*RadialGradientNode) callconv(.c) u64, .{ .name = "gsk_radial_gradient_node_get_n_color_stops" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStart(self: *RadialGradientNode) f32 {
        const cFn = @extern(*const fn (*RadialGradientNode) callconv(.c) f32, .{ .name = "gsk_radial_gradient_node_get_start" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getVradius(self: *RadialGradientNode) f32 {
        const cFn = @extern(*const fn (*RadialGradientNode) callconv(.c) f32, .{ .name = "gsk_radial_gradient_node_get_vradius" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_radial_gradient_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const RenderNode = struct {
    pub fn deserialize(arg_bytes: *GLib.Bytes, argC_error_func: core.Closure(?ParseErrorFunc)) ?*RenderNode {
        const arg_error_func: ?ParseErrorFunc = @ptrCast(argC_error_func.callback());
        defer argC_error_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_error_func.data());
        const cFn = @extern(*const fn (*GLib.Bytes, ?ParseErrorFunc, ?*anyopaque) callconv(.c) ?*RenderNode, .{ .name = "gsk_render_node_deserialize" });
        const ret = cFn(arg_bytes, arg_error_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn draw(self: *RenderNode, arg_cr: *cairo.Context) void {
        const cFn = @extern(*const fn (*RenderNode, *cairo.Context) callconv(.c) void, .{ .name = "gsk_render_node_draw" });
        const ret = cFn(self, arg_cr);
        return ret;
    }
    pub fn getBounds(self: *RenderNode, arg_bounds: *Graphene.Rect) void {
        const cFn = @extern(*const fn (*RenderNode, *Graphene.Rect) callconv(.c) void, .{ .name = "gsk_render_node_get_bounds" });
        const ret = cFn(self, arg_bounds);
        return ret;
    }
    pub fn getNodeType(self: *RenderNode) RenderNodeType {
        const cFn = @extern(*const fn (*RenderNode) callconv(.c) RenderNodeType, .{ .name = "gsk_render_node_get_node_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOpaqueRect(self: *RenderNode, arg_out_opaque: *Graphene.Rect) bool {
        const cFn = @extern(*const fn (*RenderNode, *Graphene.Rect) callconv(.c) bool, .{ .name = "gsk_render_node_get_opaque_rect" });
        const ret = cFn(self, arg_out_opaque);
        return ret;
    }
    pub fn ref(self: *RenderNode) *RenderNode {
        const cFn = @extern(*const fn (*RenderNode) callconv(.c) *RenderNode, .{ .name = "gsk_render_node_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn serialize(self: *RenderNode) *GLib.Bytes {
        const cFn = @extern(*const fn (*RenderNode) callconv(.c) *GLib.Bytes, .{ .name = "gsk_render_node_serialize" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *RenderNode) void {
        const cFn = @extern(*const fn (*RenderNode) callconv(.c) void, .{ .name = "gsk_render_node_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn writeToFile(self: *RenderNode, arg_filename: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*RenderNode, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "gsk_render_node_write_to_file" });
        const ret = cFn(self, arg_filename, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_render_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const RenderNodeType = enum(u32) {
    not_a_render_node = 0,
    container_node = 1,
    cairo_node = 2,
    color_node = 3,
    linear_gradient_node = 4,
    repeating_linear_gradient_node = 5,
    radial_gradient_node = 6,
    repeating_radial_gradient_node = 7,
    conic_gradient_node = 8,
    border_node = 9,
    texture_node = 10,
    inset_shadow_node = 11,
    outset_shadow_node = 12,
    transform_node = 13,
    opacity_node = 14,
    color_matrix_node = 15,
    repeat_node = 16,
    clip_node = 17,
    rounded_clip_node = 18,
    shadow_node = 19,
    blend_node = 20,
    cross_fade_node = 21,
    text_node = 22,
    blur_node = 23,
    debug_node = 24,
    gl_shader_node = 25,
    texture_scale_node = 26,
    mask_node = 27,
    fill_node = 28,
    stroke_node = 29,
    subsurface_node = 30,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_render_node_type_get_type" });
        return cFn();
    }
};
pub const Renderer = struct {
    pub const Parent = GObject.Object;
    pub const Class = RendererClass;
    _props: struct {
        realized: core.Property(bool, "realized") = .{},
        surface: core.Property(Gdk.Surface, "surface") = .{},
    },
    pub fn newForSurface(arg_surface: *Gdk.Surface) ?*Renderer {
        const cFn = @extern(*const fn (*Gdk.Surface) callconv(.c) ?*Renderer, .{ .name = "gsk_renderer_new_for_surface" });
        const ret = cFn(arg_surface);
        return ret;
    }
    pub fn getSurface(self: *Renderer) ?*Gdk.Surface {
        const cFn = @extern(*const fn (*Renderer) callconv(.c) ?*Gdk.Surface, .{ .name = "gsk_renderer_get_surface" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isRealized(self: *Renderer) bool {
        const cFn = @extern(*const fn (*Renderer) callconv(.c) bool, .{ .name = "gsk_renderer_is_realized" });
        const ret = cFn(self);
        return ret;
    }
    pub fn realize(self: *Renderer, arg_surface: ?*Gdk.Surface, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Renderer, ?*Gdk.Surface, *?*GLib.Error) callconv(.c) bool, .{ .name = "gsk_renderer_realize" });
        const ret = cFn(self, arg_surface, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn realizeForDisplay(self: *Renderer, arg_display: *Gdk.Display, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Renderer, *Gdk.Display, *?*GLib.Error) callconv(.c) bool, .{ .name = "gsk_renderer_realize_for_display" });
        const ret = cFn(self, arg_display, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn render(self: *Renderer, arg_root: *RenderNode, arg_region: ?*cairo.Region) void {
        const cFn = @extern(*const fn (*Renderer, *RenderNode, ?*cairo.Region) callconv(.c) void, .{ .name = "gsk_renderer_render" });
        const ret = cFn(self, arg_root, arg_region);
        return ret;
    }
    pub fn renderTexture(self: *Renderer, arg_root: *RenderNode, arg_viewport: ?*Graphene.Rect) *Gdk.Texture {
        const cFn = @extern(*const fn (*Renderer, *RenderNode, ?*Graphene.Rect) callconv(.c) *Gdk.Texture, .{ .name = "gsk_renderer_render_texture" });
        const ret = cFn(self, arg_root, arg_viewport);
        return ret;
    }
    pub fn unrealize(self: *Renderer) void {
        const cFn = @extern(*const fn (*Renderer) callconv(.c) void, .{ .name = "gsk_renderer_unrealize" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_renderer_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const RendererClass = opaque {};
pub const RepeatNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_bounds: *Graphene.Rect, arg_child: *RenderNode, arg_child_bounds: ?*Graphene.Rect) *RepeatNode {
        const cFn = @extern(*const fn (*Graphene.Rect, *RenderNode, ?*Graphene.Rect) callconv(.c) *RepeatNode, .{ .name = "gsk_repeat_node_new" });
        const ret = cFn(arg_bounds, arg_child, arg_child_bounds);
        return ret;
    }
    pub fn getChild(self: *RepeatNode) *RenderNode {
        const cFn = @extern(*const fn (*RepeatNode) callconv(.c) *RenderNode, .{ .name = "gsk_repeat_node_get_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getChildBounds(self: *RepeatNode) *Graphene.Rect {
        const cFn = @extern(*const fn (*RepeatNode) callconv(.c) *Graphene.Rect, .{ .name = "gsk_repeat_node_get_child_bounds" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_repeat_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const RepeatingLinearGradientNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_bounds: *Graphene.Rect, arg_start: *Graphene.Point, arg_end: *Graphene.Point, argS_color_stops: []ColorStop) *RepeatingLinearGradientNode {
        const arg_color_stops: [*]ColorStop = @ptrCast(argS_color_stops);
        const arg_n_color_stops: u64 = @intCast((argS_color_stops).len);
        const cFn = @extern(*const fn (*Graphene.Rect, *Graphene.Point, *Graphene.Point, [*]ColorStop, u64) callconv(.c) *RepeatingLinearGradientNode, .{ .name = "gsk_repeating_linear_gradient_node_new" });
        const ret = cFn(arg_bounds, arg_start, arg_end, arg_color_stops, arg_n_color_stops);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_repeating_linear_gradient_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const RepeatingRadialGradientNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_bounds: *Graphene.Rect, arg_center: *Graphene.Point, arg_hradius: f32, arg_vradius: f32, arg_start: f32, arg_end: f32, argS_color_stops: []ColorStop) *RepeatingRadialGradientNode {
        const arg_color_stops: [*]ColorStop = @ptrCast(argS_color_stops);
        const arg_n_color_stops: u64 = @intCast((argS_color_stops).len);
        const cFn = @extern(*const fn (*Graphene.Rect, *Graphene.Point, f32, f32, f32, f32, [*]ColorStop, u64) callconv(.c) *RepeatingRadialGradientNode, .{ .name = "gsk_repeating_radial_gradient_node_new" });
        const ret = cFn(arg_bounds, arg_center, arg_hradius, arg_vradius, arg_start, arg_end, arg_color_stops, arg_n_color_stops);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_repeating_radial_gradient_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const RoundedClipNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_child: *RenderNode, arg_clip: *RoundedRect) *RoundedClipNode {
        const cFn = @extern(*const fn (*RenderNode, *RoundedRect) callconv(.c) *RoundedClipNode, .{ .name = "gsk_rounded_clip_node_new" });
        const ret = cFn(arg_child, arg_clip);
        return ret;
    }
    pub fn getChild(self: *RoundedClipNode) *RenderNode {
        const cFn = @extern(*const fn (*RoundedClipNode) callconv(.c) *RenderNode, .{ .name = "gsk_rounded_clip_node_get_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getClip(self: *RoundedClipNode) *RoundedRect {
        const cFn = @extern(*const fn (*RoundedClipNode) callconv(.c) *RoundedRect, .{ .name = "gsk_rounded_clip_node_get_clip" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_rounded_clip_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const RoundedRect = extern struct {
    bounds: Graphene.Rect,
    corner: [4]Graphene.Size,
    pub fn containsPoint(self: *RoundedRect, arg_point: *Graphene.Point) bool {
        const cFn = @extern(*const fn (*RoundedRect, *Graphene.Point) callconv(.c) bool, .{ .name = "gsk_rounded_rect_contains_point" });
        const ret = cFn(self, arg_point);
        return ret;
    }
    pub fn containsRect(self: *RoundedRect, arg_rect: *Graphene.Rect) bool {
        const cFn = @extern(*const fn (*RoundedRect, *Graphene.Rect) callconv(.c) bool, .{ .name = "gsk_rounded_rect_contains_rect" });
        const ret = cFn(self, arg_rect);
        return ret;
    }
    pub fn init(self: *RoundedRect, arg_bounds: *Graphene.Rect, arg_top_left: *Graphene.Size, arg_top_right: *Graphene.Size, arg_bottom_right: *Graphene.Size, arg_bottom_left: *Graphene.Size) *RoundedRect {
        const cFn = @extern(*const fn (*RoundedRect, *Graphene.Rect, *Graphene.Size, *Graphene.Size, *Graphene.Size, *Graphene.Size) callconv(.c) *RoundedRect, .{ .name = "gsk_rounded_rect_init" });
        const ret = cFn(self, arg_bounds, arg_top_left, arg_top_right, arg_bottom_right, arg_bottom_left);
        return ret;
    }
    pub fn initCopy(self: *RoundedRect, arg_src: *RoundedRect) *RoundedRect {
        const cFn = @extern(*const fn (*RoundedRect, *RoundedRect) callconv(.c) *RoundedRect, .{ .name = "gsk_rounded_rect_init_copy" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn initFromRect(self: *RoundedRect, arg_bounds: *Graphene.Rect, arg_radius: f32) *RoundedRect {
        const cFn = @extern(*const fn (*RoundedRect, *Graphene.Rect, f32) callconv(.c) *RoundedRect, .{ .name = "gsk_rounded_rect_init_from_rect" });
        const ret = cFn(self, arg_bounds, arg_radius);
        return ret;
    }
    pub fn intersectsRect(self: *RoundedRect, arg_rect: *Graphene.Rect) bool {
        const cFn = @extern(*const fn (*RoundedRect, *Graphene.Rect) callconv(.c) bool, .{ .name = "gsk_rounded_rect_intersects_rect" });
        const ret = cFn(self, arg_rect);
        return ret;
    }
    pub fn isRectilinear(self: *RoundedRect) bool {
        const cFn = @extern(*const fn (*RoundedRect) callconv(.c) bool, .{ .name = "gsk_rounded_rect_is_rectilinear" });
        const ret = cFn(self);
        return ret;
    }
    pub fn normalize(self: *RoundedRect) *RoundedRect {
        const cFn = @extern(*const fn (*RoundedRect) callconv(.c) *RoundedRect, .{ .name = "gsk_rounded_rect_normalize" });
        const ret = cFn(self);
        return ret;
    }
    pub fn offset(self: *RoundedRect, arg_dx: f32, arg_dy: f32) *RoundedRect {
        const cFn = @extern(*const fn (*RoundedRect, f32, f32) callconv(.c) *RoundedRect, .{ .name = "gsk_rounded_rect_offset" });
        const ret = cFn(self, arg_dx, arg_dy);
        return ret;
    }
    pub fn shrink(self: *RoundedRect, arg_top: f32, arg_right: f32, arg_bottom: f32, arg_left: f32) *RoundedRect {
        const cFn = @extern(*const fn (*RoundedRect, f32, f32, f32, f32) callconv(.c) *RoundedRect, .{ .name = "gsk_rounded_rect_shrink" });
        const ret = cFn(self, arg_top, arg_right, arg_bottom, arg_left);
        return ret;
    }
};
pub const ScalingFilter = enum(u32) {
    linear = 0,
    nearest = 1,
    trilinear = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_scaling_filter_get_type" });
        return cFn();
    }
};
pub const SerializationError = enum(u32) {
    unsupported_format = 0,
    unsupported_version = 1,
    invalid_data = 2,
    pub fn quark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "gsk_serialization_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_serialization_error_get_type" });
        return cFn();
    }
};
pub const ShaderArgsBuilder = opaque {
    pub fn new(arg_shader: *GLShader, arg_initial_values: ?*GLib.Bytes) *ShaderArgsBuilder {
        const cFn = @extern(*const fn (*GLShader, ?*GLib.Bytes) callconv(.c) *ShaderArgsBuilder, .{ .name = "gsk_shader_args_builder_new" });
        const ret = cFn(arg_shader, arg_initial_values);
        return ret;
    }
    pub fn ref(self: *ShaderArgsBuilder) *ShaderArgsBuilder {
        const cFn = @extern(*const fn (*ShaderArgsBuilder) callconv(.c) *ShaderArgsBuilder, .{ .name = "gsk_shader_args_builder_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setBool(self: *ShaderArgsBuilder, arg_idx: i32, arg_value: bool) void {
        const cFn = @extern(*const fn (*ShaderArgsBuilder, i32, bool) callconv(.c) void, .{ .name = "gsk_shader_args_builder_set_bool" });
        const ret = cFn(self, arg_idx, arg_value);
        return ret;
    }
    pub fn setFloat(self: *ShaderArgsBuilder, arg_idx: i32, arg_value: f32) void {
        const cFn = @extern(*const fn (*ShaderArgsBuilder, i32, f32) callconv(.c) void, .{ .name = "gsk_shader_args_builder_set_float" });
        const ret = cFn(self, arg_idx, arg_value);
        return ret;
    }
    pub fn setInt(self: *ShaderArgsBuilder, arg_idx: i32, arg_value: i32) void {
        const cFn = @extern(*const fn (*ShaderArgsBuilder, i32, i32) callconv(.c) void, .{ .name = "gsk_shader_args_builder_set_int" });
        const ret = cFn(self, arg_idx, arg_value);
        return ret;
    }
    pub fn setUint(self: *ShaderArgsBuilder, arg_idx: i32, arg_value: u32) void {
        const cFn = @extern(*const fn (*ShaderArgsBuilder, i32, u32) callconv(.c) void, .{ .name = "gsk_shader_args_builder_set_uint" });
        const ret = cFn(self, arg_idx, arg_value);
        return ret;
    }
    pub fn setVec2(self: *ShaderArgsBuilder, arg_idx: i32, arg_value: *Graphene.Vec2) void {
        const cFn = @extern(*const fn (*ShaderArgsBuilder, i32, *Graphene.Vec2) callconv(.c) void, .{ .name = "gsk_shader_args_builder_set_vec2" });
        const ret = cFn(self, arg_idx, arg_value);
        return ret;
    }
    pub fn setVec3(self: *ShaderArgsBuilder, arg_idx: i32, arg_value: *Graphene.Vec3) void {
        const cFn = @extern(*const fn (*ShaderArgsBuilder, i32, *Graphene.Vec3) callconv(.c) void, .{ .name = "gsk_shader_args_builder_set_vec3" });
        const ret = cFn(self, arg_idx, arg_value);
        return ret;
    }
    pub fn setVec4(self: *ShaderArgsBuilder, arg_idx: i32, arg_value: *Graphene.Vec4) void {
        const cFn = @extern(*const fn (*ShaderArgsBuilder, i32, *Graphene.Vec4) callconv(.c) void, .{ .name = "gsk_shader_args_builder_set_vec4" });
        const ret = cFn(self, arg_idx, arg_value);
        return ret;
    }
    pub fn toArgs(self: *ShaderArgsBuilder) *GLib.Bytes {
        const cFn = @extern(*const fn (*ShaderArgsBuilder) callconv(.c) *GLib.Bytes, .{ .name = "gsk_shader_args_builder_to_args" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *ShaderArgsBuilder) void {
        const cFn = @extern(*const fn (*ShaderArgsBuilder) callconv(.c) void, .{ .name = "gsk_shader_args_builder_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_shader_args_builder_get_type" });
        return cFn();
    }
};
pub const Shadow = extern struct {
    color: Gdk.RGBA,
    dx: f32,
    dy: f32,
    radius: f32,
};
pub const ShadowNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_child: *RenderNode, argS_shadows: []Shadow) *ShadowNode {
        const arg_shadows: [*]Shadow = @ptrCast(argS_shadows);
        const arg_n_shadows: u64 = @intCast((argS_shadows).len);
        const cFn = @extern(*const fn (*RenderNode, [*]Shadow, u64) callconv(.c) *ShadowNode, .{ .name = "gsk_shadow_node_new" });
        const ret = cFn(arg_child, arg_shadows, arg_n_shadows);
        return ret;
    }
    pub fn getChild(self: *ShadowNode) *RenderNode {
        const cFn = @extern(*const fn (*ShadowNode) callconv(.c) *RenderNode, .{ .name = "gsk_shadow_node_get_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNShadows(self: *ShadowNode) u64 {
        const cFn = @extern(*const fn (*ShadowNode) callconv(.c) u64, .{ .name = "gsk_shadow_node_get_n_shadows" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getShadow(self: *ShadowNode, arg_i: u64) *Shadow {
        const cFn = @extern(*const fn (*ShadowNode, u64) callconv(.c) *Shadow, .{ .name = "gsk_shadow_node_get_shadow" });
        const ret = cFn(self, arg_i);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_shadow_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const Stroke = opaque {
    pub fn new(arg_line_width: f32) *Stroke {
        const cFn = @extern(*const fn (f32) callconv(.c) *Stroke, .{ .name = "gsk_stroke_new" });
        const ret = cFn(arg_line_width);
        return ret;
    }
    pub fn copy(self: *Stroke) *Stroke {
        const cFn = @extern(*const fn (*Stroke) callconv(.c) *Stroke, .{ .name = "gsk_stroke_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *Stroke) void {
        const cFn = @extern(*const fn (*Stroke) callconv(.c) void, .{ .name = "gsk_stroke_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDash(self: *Stroke) []f32 {
        var argO_n_dash: u64 = undefined;
        const arg_n_dash: *u64 = &argO_n_dash;
        const cFn = @extern(*const fn (*Stroke, *u64) callconv(.c) ?[*]f32, .{ .name = "gsk_stroke_get_dash" });
        const ret = cFn(self, arg_n_dash);
        return ret[0..@intCast(argO_n_dash)];
    }
    pub fn getDashOffset(self: *Stroke) f32 {
        const cFn = @extern(*const fn (*Stroke) callconv(.c) f32, .{ .name = "gsk_stroke_get_dash_offset" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLineCap(self: *Stroke) LineCap {
        const cFn = @extern(*const fn (*Stroke) callconv(.c) LineCap, .{ .name = "gsk_stroke_get_line_cap" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLineJoin(self: *Stroke) LineJoin {
        const cFn = @extern(*const fn (*Stroke) callconv(.c) LineJoin, .{ .name = "gsk_stroke_get_line_join" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLineWidth(self: *Stroke) f32 {
        const cFn = @extern(*const fn (*Stroke) callconv(.c) f32, .{ .name = "gsk_stroke_get_line_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMiterLimit(self: *Stroke) f32 {
        const cFn = @extern(*const fn (*Stroke) callconv(.c) f32, .{ .name = "gsk_stroke_get_miter_limit" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setDash(self: *Stroke, argS_dash: []f32) void {
        const arg_dash: ?[*]f32 = @ptrCast(argS_dash);
        const arg_n_dash: u64 = @intCast((argS_dash).len);
        const cFn = @extern(*const fn (*Stroke, ?[*]f32, u64) callconv(.c) void, .{ .name = "gsk_stroke_set_dash" });
        const ret = cFn(self, arg_dash, arg_n_dash);
        return ret;
    }
    pub fn setDashOffset(self: *Stroke, arg_offset: f32) void {
        const cFn = @extern(*const fn (*Stroke, f32) callconv(.c) void, .{ .name = "gsk_stroke_set_dash_offset" });
        const ret = cFn(self, arg_offset);
        return ret;
    }
    pub fn setLineCap(self: *Stroke, arg_line_cap: LineCap) void {
        const cFn = @extern(*const fn (*Stroke, LineCap) callconv(.c) void, .{ .name = "gsk_stroke_set_line_cap" });
        const ret = cFn(self, arg_line_cap);
        return ret;
    }
    pub fn setLineJoin(self: *Stroke, arg_line_join: LineJoin) void {
        const cFn = @extern(*const fn (*Stroke, LineJoin) callconv(.c) void, .{ .name = "gsk_stroke_set_line_join" });
        const ret = cFn(self, arg_line_join);
        return ret;
    }
    pub fn setLineWidth(self: *Stroke, arg_line_width: f32) void {
        const cFn = @extern(*const fn (*Stroke, f32) callconv(.c) void, .{ .name = "gsk_stroke_set_line_width" });
        const ret = cFn(self, arg_line_width);
        return ret;
    }
    pub fn setMiterLimit(self: *Stroke, arg_limit: f32) void {
        const cFn = @extern(*const fn (*Stroke, f32) callconv(.c) void, .{ .name = "gsk_stroke_set_miter_limit" });
        const ret = cFn(self, arg_limit);
        return ret;
    }
    pub fn toCairo(self: *Stroke, arg_cr: *cairo.Context) void {
        const cFn = @extern(*const fn (*Stroke, *cairo.Context) callconv(.c) void, .{ .name = "gsk_stroke_to_cairo" });
        const ret = cFn(self, arg_cr);
        return ret;
    }
    pub fn equal(arg_stroke1: ?*anyopaque, arg_stroke2: ?*anyopaque) bool {
        const cFn = @extern(*const fn (?*anyopaque, ?*anyopaque) callconv(.c) bool, .{ .name = "gsk_stroke_equal" });
        const ret = cFn(@ptrCast(arg_stroke1), @ptrCast(arg_stroke2));
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_stroke_get_type" });
        return cFn();
    }
};
pub const StrokeNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_child: *RenderNode, arg_path: *Path, arg_stroke: *Stroke) *StrokeNode {
        const cFn = @extern(*const fn (*RenderNode, *Path, *Stroke) callconv(.c) *StrokeNode, .{ .name = "gsk_stroke_node_new" });
        const ret = cFn(arg_child, arg_path, arg_stroke);
        return ret;
    }
    pub fn getChild(self: *StrokeNode) *RenderNode {
        const cFn = @extern(*const fn (*StrokeNode) callconv(.c) *RenderNode, .{ .name = "gsk_stroke_node_get_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPath(self: *StrokeNode) *Path {
        const cFn = @extern(*const fn (*StrokeNode) callconv(.c) *Path, .{ .name = "gsk_stroke_node_get_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStroke(self: *StrokeNode) *Stroke {
        const cFn = @extern(*const fn (*StrokeNode) callconv(.c) *Stroke, .{ .name = "gsk_stroke_node_get_stroke" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_stroke_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SubsurfaceNode = struct {
    pub const Parent = RenderNode;
    pub fn getChild(self: *SubsurfaceNode) *RenderNode {
        const cFn = @extern(*const fn (*SubsurfaceNode) callconv(.c) *RenderNode, .{ .name = "gsk_subsurface_node_get_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_subsurface_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TextNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_font: *Pango.Font, arg_glyphs: *Pango.GlyphString, arg_color: *Gdk.RGBA, arg_offset: *Graphene.Point) ?*TextNode {
        const cFn = @extern(*const fn (*Pango.Font, *Pango.GlyphString, *Gdk.RGBA, *Graphene.Point) callconv(.c) ?*TextNode, .{ .name = "gsk_text_node_new" });
        const ret = cFn(arg_font, arg_glyphs, arg_color, arg_offset);
        return ret;
    }
    pub fn getColor(self: *TextNode) *Gdk.RGBA {
        const cFn = @extern(*const fn (*TextNode) callconv(.c) *Gdk.RGBA, .{ .name = "gsk_text_node_get_color" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFont(self: *TextNode) *Pango.Font {
        const cFn = @extern(*const fn (*TextNode) callconv(.c) *Pango.Font, .{ .name = "gsk_text_node_get_font" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getGlyphs(self: *TextNode) []Pango.GlyphInfo {
        var argO_n_glyphs: u32 = undefined;
        const arg_n_glyphs: ?*u32 = &argO_n_glyphs;
        const cFn = @extern(*const fn (*TextNode, ?*u32) callconv(.c) [*]Pango.GlyphInfo, .{ .name = "gsk_text_node_get_glyphs" });
        const ret = cFn(self, arg_n_glyphs);
        return ret[0..@intCast(argO_n_glyphs)];
    }
    pub fn getNumGlyphs(self: *TextNode) u32 {
        const cFn = @extern(*const fn (*TextNode) callconv(.c) u32, .{ .name = "gsk_text_node_get_num_glyphs" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOffset(self: *TextNode) *Graphene.Point {
        const cFn = @extern(*const fn (*TextNode) callconv(.c) *Graphene.Point, .{ .name = "gsk_text_node_get_offset" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hasColorGlyphs(self: *TextNode) bool {
        const cFn = @extern(*const fn (*TextNode) callconv(.c) bool, .{ .name = "gsk_text_node_has_color_glyphs" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_text_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TextureNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_texture: *Gdk.Texture, arg_bounds: *Graphene.Rect) *TextureNode {
        const cFn = @extern(*const fn (*Gdk.Texture, *Graphene.Rect) callconv(.c) *TextureNode, .{ .name = "gsk_texture_node_new" });
        const ret = cFn(arg_texture, arg_bounds);
        return ret;
    }
    pub fn getTexture(self: *TextureNode) *Gdk.Texture {
        const cFn = @extern(*const fn (*TextureNode) callconv(.c) *Gdk.Texture, .{ .name = "gsk_texture_node_get_texture" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_texture_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TextureScaleNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_texture: *Gdk.Texture, arg_bounds: *Graphene.Rect, arg_filter: ScalingFilter) *TextureScaleNode {
        const cFn = @extern(*const fn (*Gdk.Texture, *Graphene.Rect, ScalingFilter) callconv(.c) *TextureScaleNode, .{ .name = "gsk_texture_scale_node_new" });
        const ret = cFn(arg_texture, arg_bounds, arg_filter);
        return ret;
    }
    pub fn getFilter(self: *TextureScaleNode) ScalingFilter {
        const cFn = @extern(*const fn (*TextureScaleNode) callconv(.c) ScalingFilter, .{ .name = "gsk_texture_scale_node_get_filter" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTexture(self: *TextureScaleNode) *Gdk.Texture {
        const cFn = @extern(*const fn (*TextureScaleNode) callconv(.c) *Gdk.Texture, .{ .name = "gsk_texture_scale_node_get_texture" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_texture_scale_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const Transform = opaque {
    pub fn new() *Transform {
        const cFn = @extern(*const fn () callconv(.c) *Transform, .{ .name = "gsk_transform_new" });
        const ret = cFn();
        return ret;
    }
    pub fn equal(self: *Transform, arg_second: ?*Transform) bool {
        const cFn = @extern(*const fn (*Transform, ?*Transform) callconv(.c) bool, .{ .name = "gsk_transform_equal" });
        const ret = cFn(self, arg_second);
        return ret;
    }
    pub fn getCategory(self: *Transform) TransformCategory {
        const cFn = @extern(*const fn (*Transform) callconv(.c) TransformCategory, .{ .name = "gsk_transform_get_category" });
        const ret = cFn(self);
        return ret;
    }
    pub fn invert(self: *Transform) ?*Transform {
        const cFn = @extern(*const fn (*Transform) callconv(.c) ?*Transform, .{ .name = "gsk_transform_invert" });
        const ret = cFn(self);
        return ret;
    }
    pub fn matrix(self: *Transform, arg_matrix: *Graphene.Matrix) *Transform {
        const cFn = @extern(*const fn (*Transform, *Graphene.Matrix) callconv(.c) *Transform, .{ .name = "gsk_transform_matrix" });
        const ret = cFn(self, arg_matrix);
        return ret;
    }
    pub fn perspective(self: *Transform, arg_depth: f32) *Transform {
        const cFn = @extern(*const fn (*Transform, f32) callconv(.c) *Transform, .{ .name = "gsk_transform_perspective" });
        const ret = cFn(self, arg_depth);
        return ret;
    }
    pub fn print(self: *Transform, arg_string: *GLib.String) void {
        const cFn = @extern(*const fn (*Transform, *GLib.String) callconv(.c) void, .{ .name = "gsk_transform_print" });
        const ret = cFn(self, arg_string);
        return ret;
    }
    pub fn ref(self: *Transform) ?*Transform {
        const cFn = @extern(*const fn (*Transform) callconv(.c) ?*Transform, .{ .name = "gsk_transform_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn rotate(self: *Transform, arg_angle: f32) ?*Transform {
        const cFn = @extern(*const fn (*Transform, f32) callconv(.c) ?*Transform, .{ .name = "gsk_transform_rotate" });
        const ret = cFn(self, arg_angle);
        return ret;
    }
    pub fn rotate3d(self: *Transform, arg_angle: f32, arg_axis: *Graphene.Vec3) ?*Transform {
        const cFn = @extern(*const fn (*Transform, f32, *Graphene.Vec3) callconv(.c) ?*Transform, .{ .name = "gsk_transform_rotate_3d" });
        const ret = cFn(self, arg_angle, arg_axis);
        return ret;
    }
    pub fn scale(self: *Transform, arg_factor_x: f32, arg_factor_y: f32) ?*Transform {
        const cFn = @extern(*const fn (*Transform, f32, f32) callconv(.c) ?*Transform, .{ .name = "gsk_transform_scale" });
        const ret = cFn(self, arg_factor_x, arg_factor_y);
        return ret;
    }
    pub fn scale3d(self: *Transform, arg_factor_x: f32, arg_factor_y: f32, arg_factor_z: f32) ?*Transform {
        const cFn = @extern(*const fn (*Transform, f32, f32, f32) callconv(.c) ?*Transform, .{ .name = "gsk_transform_scale_3d" });
        const ret = cFn(self, arg_factor_x, arg_factor_y, arg_factor_z);
        return ret;
    }
    pub fn skew(self: *Transform, arg_skew_x: f32, arg_skew_y: f32) ?*Transform {
        const cFn = @extern(*const fn (*Transform, f32, f32) callconv(.c) ?*Transform, .{ .name = "gsk_transform_skew" });
        const ret = cFn(self, arg_skew_x, arg_skew_y);
        return ret;
    }
    pub fn to2d(self: *Transform) struct {
        out_xx: f32,
        out_yx: f32,
        out_xy: f32,
        out_yy: f32,
        out_dx: f32,
        out_dy: f32,
    } {
        var argO_out_xx: f32 = undefined;
        const arg_out_xx: *f32 = &argO_out_xx;
        var argO_out_yx: f32 = undefined;
        const arg_out_yx: *f32 = &argO_out_yx;
        var argO_out_xy: f32 = undefined;
        const arg_out_xy: *f32 = &argO_out_xy;
        var argO_out_yy: f32 = undefined;
        const arg_out_yy: *f32 = &argO_out_yy;
        var argO_out_dx: f32 = undefined;
        const arg_out_dx: *f32 = &argO_out_dx;
        var argO_out_dy: f32 = undefined;
        const arg_out_dy: *f32 = &argO_out_dy;
        const cFn = @extern(*const fn (*Transform, *f32, *f32, *f32, *f32, *f32, *f32) callconv(.c) void, .{ .name = "gsk_transform_to_2d" });
        const ret = cFn(self, arg_out_xx, arg_out_yx, arg_out_xy, arg_out_yy, arg_out_dx, arg_out_dy);
        _ = ret;
        return .{ .out_xx = argO_out_xx, .out_yx = argO_out_yx, .out_xy = argO_out_xy, .out_yy = argO_out_yy, .out_dx = argO_out_dx, .out_dy = argO_out_dy };
    }
    pub fn to2dComponents(self: *Transform) struct {
        out_skew_x: f32,
        out_skew_y: f32,
        out_scale_x: f32,
        out_scale_y: f32,
        out_angle: f32,
        out_dx: f32,
        out_dy: f32,
    } {
        var argO_out_skew_x: f32 = undefined;
        const arg_out_skew_x: *f32 = &argO_out_skew_x;
        var argO_out_skew_y: f32 = undefined;
        const arg_out_skew_y: *f32 = &argO_out_skew_y;
        var argO_out_scale_x: f32 = undefined;
        const arg_out_scale_x: *f32 = &argO_out_scale_x;
        var argO_out_scale_y: f32 = undefined;
        const arg_out_scale_y: *f32 = &argO_out_scale_y;
        var argO_out_angle: f32 = undefined;
        const arg_out_angle: *f32 = &argO_out_angle;
        var argO_out_dx: f32 = undefined;
        const arg_out_dx: *f32 = &argO_out_dx;
        var argO_out_dy: f32 = undefined;
        const arg_out_dy: *f32 = &argO_out_dy;
        const cFn = @extern(*const fn (*Transform, *f32, *f32, *f32, *f32, *f32, *f32, *f32) callconv(.c) void, .{ .name = "gsk_transform_to_2d_components" });
        const ret = cFn(self, arg_out_skew_x, arg_out_skew_y, arg_out_scale_x, arg_out_scale_y, arg_out_angle, arg_out_dx, arg_out_dy);
        _ = ret;
        return .{ .out_skew_x = argO_out_skew_x, .out_skew_y = argO_out_skew_y, .out_scale_x = argO_out_scale_x, .out_scale_y = argO_out_scale_y, .out_angle = argO_out_angle, .out_dx = argO_out_dx, .out_dy = argO_out_dy };
    }
    pub fn toAffine(self: *Transform) struct {
        out_scale_x: f32,
        out_scale_y: f32,
        out_dx: f32,
        out_dy: f32,
    } {
        var argO_out_scale_x: f32 = undefined;
        const arg_out_scale_x: *f32 = &argO_out_scale_x;
        var argO_out_scale_y: f32 = undefined;
        const arg_out_scale_y: *f32 = &argO_out_scale_y;
        var argO_out_dx: f32 = undefined;
        const arg_out_dx: *f32 = &argO_out_dx;
        var argO_out_dy: f32 = undefined;
        const arg_out_dy: *f32 = &argO_out_dy;
        const cFn = @extern(*const fn (*Transform, *f32, *f32, *f32, *f32) callconv(.c) void, .{ .name = "gsk_transform_to_affine" });
        const ret = cFn(self, arg_out_scale_x, arg_out_scale_y, arg_out_dx, arg_out_dy);
        _ = ret;
        return .{ .out_scale_x = argO_out_scale_x, .out_scale_y = argO_out_scale_y, .out_dx = argO_out_dx, .out_dy = argO_out_dy };
    }
    pub fn toMatrix(self: *Transform, arg_out_matrix: *Graphene.Matrix) void {
        const cFn = @extern(*const fn (*Transform, *Graphene.Matrix) callconv(.c) void, .{ .name = "gsk_transform_to_matrix" });
        const ret = cFn(self, arg_out_matrix);
        return ret;
    }
    pub fn toString(self: *Transform) [*:0]u8 {
        const cFn = @extern(*const fn (*Transform) callconv(.c) [*:0]u8, .{ .name = "gsk_transform_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn toTranslate(self: *Transform) struct {
        out_dx: f32,
        out_dy: f32,
    } {
        var argO_out_dx: f32 = undefined;
        const arg_out_dx: *f32 = &argO_out_dx;
        var argO_out_dy: f32 = undefined;
        const arg_out_dy: *f32 = &argO_out_dy;
        const cFn = @extern(*const fn (*Transform, *f32, *f32) callconv(.c) void, .{ .name = "gsk_transform_to_translate" });
        const ret = cFn(self, arg_out_dx, arg_out_dy);
        _ = ret;
        return .{ .out_dx = argO_out_dx, .out_dy = argO_out_dy };
    }
    pub fn transform(self: *Transform, arg_other: ?*Transform) ?*Transform {
        const cFn = @extern(*const fn (*Transform, ?*Transform) callconv(.c) ?*Transform, .{ .name = "gsk_transform_transform" });
        const ret = cFn(self, arg_other);
        return ret;
    }
    pub fn transformBounds(self: *Transform, arg_rect: *Graphene.Rect, arg_out_rect: *Graphene.Rect) void {
        const cFn = @extern(*const fn (*Transform, *Graphene.Rect, *Graphene.Rect) callconv(.c) void, .{ .name = "gsk_transform_transform_bounds" });
        const ret = cFn(self, arg_rect, arg_out_rect);
        return ret;
    }
    pub fn transformPoint(self: *Transform, arg_point: *Graphene.Point, arg_out_point: *Graphene.Point) void {
        const cFn = @extern(*const fn (*Transform, *Graphene.Point, *Graphene.Point) callconv(.c) void, .{ .name = "gsk_transform_transform_point" });
        const ret = cFn(self, arg_point, arg_out_point);
        return ret;
    }
    pub fn translate(self: *Transform, arg_point: *Graphene.Point) ?*Transform {
        const cFn = @extern(*const fn (*Transform, *Graphene.Point) callconv(.c) ?*Transform, .{ .name = "gsk_transform_translate" });
        const ret = cFn(self, arg_point);
        return ret;
    }
    pub fn translate3d(self: *Transform, arg_point: *Graphene.Point3D) ?*Transform {
        const cFn = @extern(*const fn (*Transform, *Graphene.Point3D) callconv(.c) ?*Transform, .{ .name = "gsk_transform_translate_3d" });
        const ret = cFn(self, arg_point);
        return ret;
    }
    pub fn unref(self: *Transform) void {
        const cFn = @extern(*const fn (*Transform) callconv(.c) void, .{ .name = "gsk_transform_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn parse(arg_string: [*:0]const u8) struct {
        ret: bool,
        out_transform: *Transform,
    } {
        var argO_out_transform: *Transform = undefined;
        const arg_out_transform: **Transform = &argO_out_transform;
        const cFn = @extern(*const fn ([*:0]const u8, **Transform) callconv(.c) bool, .{ .name = "gsk_transform_parse" });
        const ret = cFn(arg_string, arg_out_transform);
        return .{ .ret = ret, .out_transform = argO_out_transform };
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_transform_get_type" });
        return cFn();
    }
};
pub const TransformCategory = enum(u32) {
    unknown = 0,
    any = 1,
    @"3d" = 2,
    @"2d" = 3,
    @"2d_affine" = 4,
    @"2d_translate" = 5,
    identity = 6,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_transform_category_get_type" });
        return cFn();
    }
};
pub const TransformNode = struct {
    pub const Parent = RenderNode;
    pub fn new(arg_child: *RenderNode, arg_transform: *Transform) *TransformNode {
        const cFn = @extern(*const fn (*RenderNode, *Transform) callconv(.c) *TransformNode, .{ .name = "gsk_transform_node_new" });
        const ret = cFn(arg_child, arg_transform);
        return ret;
    }
    pub fn getChild(self: *TransformNode) *RenderNode {
        const cFn = @extern(*const fn (*TransformNode) callconv(.c) *RenderNode, .{ .name = "gsk_transform_node_get_child" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTransform(self: *TransformNode) *Transform {
        const cFn = @extern(*const fn (*TransformNode) callconv(.c) *Transform, .{ .name = "gsk_transform_node_get_transform" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_transform_node_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const VulkanRenderer = struct {
    pub const Parent = Renderer;
    pub const Class = VulkanRendererClass;
    pub fn new() *VulkanRenderer {
        const cFn = @extern(*const fn () callconv(.c) *VulkanRenderer, .{ .name = "gsk_vulkan_renderer_new" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "gsk_vulkan_renderer_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const VulkanRendererClass = opaque {};
pub fn pathParse(arg_string: [*:0]const u8) ?*Path {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*Path, .{ .name = "gsk_path_parse" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn serializationErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "gsk_serialization_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn strokeEqual(arg_stroke1: ?*anyopaque, arg_stroke2: ?*anyopaque) bool {
    const cFn = @extern(*const fn (?*anyopaque, ?*anyopaque) callconv(.c) bool, .{ .name = "gsk_stroke_equal" });
    const ret = cFn(@ptrCast(arg_stroke1), @ptrCast(arg_stroke2));
    return ret;
}
pub fn transformParse(arg_string: [*:0]const u8) struct {
    ret: bool,
    out_transform: *Transform,
} {
    var argO_out_transform: *Transform = undefined;
    const arg_out_transform: **Transform = &argO_out_transform;
    const cFn = @extern(*const fn ([*:0]const u8, **Transform) callconv(.c) bool, .{ .name = "gsk_transform_parse" });
    const ret = cFn(arg_string, arg_out_transform);
    return .{ .ret = ret, .out_transform = argO_out_transform };
}
pub fn valueDupRenderNode(arg_value: *GObject.Value) ?*RenderNode {
    const cFn = @extern(*const fn (*GObject.Value) callconv(.c) ?*RenderNode, .{ .name = "gsk_value_dup_render_node" });
    const ret = cFn(arg_value);
    return ret;
}
pub fn valueGetRenderNode(arg_value: *GObject.Value) ?*RenderNode {
    const cFn = @extern(*const fn (*GObject.Value) callconv(.c) ?*RenderNode, .{ .name = "gsk_value_get_render_node" });
    const ret = cFn(arg_value);
    return ret;
}
pub fn valueSetRenderNode(arg_value: *GObject.Value, arg_node: *RenderNode) void {
    const cFn = @extern(*const fn (*GObject.Value, *RenderNode) callconv(.c) void, .{ .name = "gsk_value_set_render_node" });
    const ret = cFn(arg_value, arg_node);
    return ret;
}
pub fn valueTakeRenderNode(arg_value: *GObject.Value, arg_node: ?*RenderNode) void {
    const cFn = @extern(*const fn (*GObject.Value, ?*RenderNode) callconv(.c) void, .{ .name = "gsk_value_take_render_node" });
    const ret = cFn(arg_value, arg_node);
    return ret;
}

const core = @import("core.zig");
const GObject = @import("GObject.zig");
const GLib = @import("GLib.zig");
const cairo = @This();
pub const Context = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_context_get_type" });
        return cFn();
    }
};
pub const Device = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_device_get_type" });
        return cFn();
    }
};
pub const Surface = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_surface_get_type" });
        return cFn();
    }
};
pub const Matrix = opaque {};
pub const Pattern = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_pattern_get_type" });
        return cFn();
    }
};
pub const Region = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_region_get_type" });
        return cFn();
    }
};
pub const Status = enum(u32) {
    success = 0,
    no_memory = 1,
    invalid_restore = 2,
    invalid_pop_group = 3,
    no_current_point = 4,
    invalid_matrix = 5,
    invalid_status = 6,
    null_pointer = 7,
    invalid_string = 8,
    invalid_path_data = 9,
    read_error = 10,
    write_error = 11,
    surface_finished = 12,
    surface_type_mismatch = 13,
    pattern_type_mismatch = 14,
    invalid_content = 15,
    invalid_format = 16,
    invalid_visual = 17,
    file_not_found = 18,
    invalid_dash = 19,
    invalid_dsc_comment = 20,
    invalid_index = 21,
    clip_not_representable = 22,
    temp_file_error = 23,
    invalid_stride = 24,
    font_type_mismatch = 25,
    user_font_immutable = 26,
    user_font_error = 27,
    negative_count = 28,
    invalid_clusters = 29,
    invalid_slant = 30,
    invalid_weight = 31,
    invalid_size = 32,
    user_font_not_implemented = 33,
    device_type_mismatch = 34,
    device_error = 35,
    invalid_mesh_construction = 36,
    device_finished = 37,
    jbig2_global_missing = 38,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_status_get_type" });
        return cFn();
    }
};
pub const Content = enum(u32) {
    color = 4096,
    alpha = 8192,
    color_alpha = 12288,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_content_get_type" });
        return cFn();
    }
};
pub const Operator = enum(u32) {
    clear = 0,
    source = 1,
    over = 2,
    in = 3,
    out = 4,
    atop = 5,
    dest = 6,
    dest_over = 7,
    dest_in = 8,
    dest_out = 9,
    dest_atop = 10,
    xor = 11,
    add = 12,
    saturate = 13,
    multiply = 14,
    screen = 15,
    overlay = 16,
    darken = 17,
    lighten = 18,
    color_dodge = 19,
    color_burn = 20,
    hard_light = 21,
    soft_light = 22,
    difference = 23,
    exclusion = 24,
    hsl_hue = 25,
    hsl_saturation = 26,
    hsl_color = 27,
    hsl_luminosity = 28,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_operator_get_type" });
        return cFn();
    }
};
pub const Antialias = enum(u32) {
    default = 0,
    none = 1,
    gray = 2,
    subpixel = 3,
    fast = 4,
    good = 5,
    best = 6,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_antialias_get_type" });
        return cFn();
    }
};
pub const FillRule = enum(u32) {
    winding = 0,
    even_odd = 1,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_fill_rule_get_type" });
        return cFn();
    }
};
pub const LineCap = enum(u32) {
    butt = 0,
    round = 1,
    square = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_line_cap_get_type" });
        return cFn();
    }
};
pub const LineJoin = enum(u32) {
    miter = 0,
    round = 1,
    bevel = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_line_join_get_type" });
        return cFn();
    }
};
pub const TextClusterFlags = enum(u32) {
    backward = 1,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_text_cluster_flags_get_type" });
        return cFn();
    }
};
pub const FontSlant = enum(u32) {
    normal = 0,
    italic = 1,
    oblique = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_font_slant_get_type" });
        return cFn();
    }
};
pub const FontWeight = enum(u32) {
    normal = 0,
    bold = 1,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_font_weight_get_type" });
        return cFn();
    }
};
pub const SubpixelOrder = enum(u32) {
    default = 0,
    rgb = 1,
    bgr = 2,
    vrgb = 3,
    vbgr = 4,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_subpixel_order_get_type" });
        return cFn();
    }
};
pub const HintStyle = enum(u32) {
    default = 0,
    none = 1,
    slight = 2,
    medium = 3,
    full = 4,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_hint_style_get_type" });
        return cFn();
    }
};
pub const HintMetrics = enum(u32) {
    default = 0,
    off = 1,
    on = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_hint_metrics_get_type" });
        return cFn();
    }
};
pub const FontOptions = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_font_options_get_type" });
        return cFn();
    }
};
pub const FontType = enum(u32) {
    toy = 0,
    ft = 1,
    win32 = 2,
    quartz = 3,
    user = 4,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_font_type_get_type" });
        return cFn();
    }
};
pub const PathDataType = enum(u32) {
    move_to = 0,
    line_to = 1,
    curve_to = 2,
    close_path = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_path_data_type_get_type" });
        return cFn();
    }
};
pub const DeviceType = enum(i32) {
    drm = 0,
    gl = 1,
    script = 2,
    xcb = 3,
    xlib = 4,
    xml = 5,
    cogl = 6,
    win32 = 7,
    invalid = -1,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_device_type_get_type" });
        return cFn();
    }
};
pub const SurfaceType = enum(u32) {
    image = 0,
    pdf = 1,
    ps = 2,
    xlib = 3,
    xcb = 4,
    glitz = 5,
    quartz = 6,
    win32 = 7,
    beos = 8,
    directfb = 9,
    svg = 10,
    os2 = 11,
    win32_printing = 12,
    quartz_image = 13,
    script = 14,
    qt = 15,
    recording = 16,
    vg = 17,
    gl = 18,
    drm = 19,
    tee = 20,
    xml = 21,
    skia = 22,
    subsurface = 23,
    cogl = 24,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_surface_type_get_type" });
        return cFn();
    }
};
pub const Format = enum(i32) {
    invalid = -1,
    argb32 = 0,
    rgb24 = 1,
    a8 = 2,
    a1 = 3,
    rgb16_565 = 4,
    rgb30 = 5,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_format_get_type" });
        return cFn();
    }
};
pub const PatternType = enum(u32) {
    solid = 0,
    surface = 1,
    linear = 2,
    radial = 3,
    mesh = 4,
    raster_source = 5,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_pattern_type_get_type" });
        return cFn();
    }
};
pub const Extend = enum(u32) {
    none = 0,
    repeat = 1,
    reflect = 2,
    pad = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_extend_get_type" });
        return cFn();
    }
};
pub const Filter = enum(u32) {
    fast = 0,
    good = 1,
    best = 2,
    nearest = 3,
    bilinear = 4,
    gaussian = 5,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_filter_get_type" });
        return cFn();
    }
};
pub const RegionOverlap = enum(u32) {
    in = 0,
    out = 1,
    part = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_region_overlap_get_type" });
        return cFn();
    }
};
pub const FontFace = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_font_face_get_type" });
        return cFn();
    }
};
pub const ScaledFont = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_scaled_font_get_type" });
        return cFn();
    }
};
pub const Path = opaque {};
pub const Rectangle = extern struct {
    x: f64,
    y: f64,
    width: f64,
    height: f64,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_rectangle_get_type" });
        return cFn();
    }
};
pub const RectangleInt = extern struct {
    x: i32,
    y: i32,
    width: i32,
    height: i32,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_rectangle_int_get_type" });
        return cFn();
    }
};
pub const Glyph = extern struct {
    index: u64,
    x: f64,
    y: f64,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_glyph_get_type" });
        return cFn();
    }
};
pub const TextCluster = extern struct {
    num_bytes: i32,
    num_glyphs: i32,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "cairo_gobject_text_cluster_get_type" });
        return cFn();
    }
};
pub fn imageSurfaceCreate() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "cairo_image_surface_create" });
    const ret = cFn();
    return ret;
}

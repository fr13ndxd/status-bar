const core = @import("core.zig");
const GObject = @import("GObject.zig");
const Gio = @import("Gio.zig");
const cairo = @import("cairo.zig");
const GLib = @import("GLib.zig");
const HarfBuzz = @import("HarfBuzz.zig");
const freetype2 = @import("freetype2.zig");
const GModule = @import("GModule.zig");
const Pango = @This();
pub const ANALYSIS_FLAG_CENTERED_BASELINE = 1;
pub const ANALYSIS_FLAG_IS_ELLIPSIS = 2;
pub const ANALYSIS_FLAG_NEED_HYPHEN = 4;
pub const ATTR_INDEX_FROM_TEXT_BEGINNING = 0;
pub const ATTR_INDEX_TO_TEXT_END = 4294967295;
pub const Alignment = enum(u32) {
    left = 0,
    center = 1,
    right = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_alignment_get_type" });
        return cFn();
    }
};
pub const Analysis = extern struct {
    shape_engine: ?*anyopaque,
    lang_engine: ?*anyopaque,
    font: ?*Font,
    level: u8,
    gravity: u8,
    flags: u8,
    script: u8,
    language: ?*Language,
    extra_attrs: ?*GLib.SList,
};
pub const AttrClass = extern struct {
    type: AttrType,
    copy: ?*const fn (arg_attr: *Attribute) callconv(.c) *Attribute,
    destroy: ?*const fn (arg_attr: *Attribute) callconv(.c) void,
    equal: ?*const fn (arg_attr1: *Attribute, arg_attr2: *Attribute) callconv(.c) bool,
};
pub const AttrColor = extern struct {
    attr: Attribute,
    color: Color,
};
pub const AttrDataCopyFunc = *const fn (arg_user_data: ?*anyopaque) callconv(.c) ?*anyopaque;
pub const AttrFilterFunc = *const fn (arg_attribute: *Attribute, arg_user_data: ?*anyopaque) callconv(.c) bool;
pub const AttrFloat = extern struct {
    attr: Attribute,
    value: f64,
};
pub const AttrFontDesc = extern struct {
    attr: Attribute,
    desc: ?*FontDescription,
    pub fn new(arg_desc: *FontDescription) *Attribute {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) *Attribute, .{ .name = "pango_attr_font_desc_new" });
        const ret = cFn(arg_desc);
        return ret;
    }
};
pub const AttrFontFeatures = extern struct {
    attr: Attribute,
    features: ?[*:0]const u8,
    pub fn new(arg_features: [*:0]const u8) *Attribute {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *Attribute, .{ .name = "pango_attr_font_features_new" });
        const ret = cFn(arg_features);
        return ret;
    }
};
pub const AttrInt = extern struct {
    attr: Attribute,
    value: i32,
};
pub const AttrIterator = opaque {
    pub fn copy(self: *AttrIterator) *AttrIterator {
        const cFn = @extern(*const fn (*AttrIterator) callconv(.c) *AttrIterator, .{ .name = "pango_attr_iterator_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn destroy(self: *AttrIterator) void {
        const cFn = @extern(*const fn (*AttrIterator) callconv(.c) void, .{ .name = "pango_attr_iterator_destroy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn get(self: *AttrIterator, arg_type: AttrType) ?*Attribute {
        const cFn = @extern(*const fn (*AttrIterator, AttrType) callconv(.c) ?*Attribute, .{ .name = "pango_attr_iterator_get" });
        const ret = cFn(self, arg_type);
        return ret;
    }
    pub fn getAttrs(self: *AttrIterator) ?*GLib.SList {
        const cFn = @extern(*const fn (*AttrIterator) callconv(.c) ?*GLib.SList, .{ .name = "pango_attr_iterator_get_attrs" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFont(self: *AttrIterator, arg_desc: *FontDescription) struct {
        language: *Language,
        extra_attrs: *GLib.SList,
    } {
        var argO_language: ?*Language = undefined;
        const arg_language: ?**Language = &argO_language;
        var argO_extra_attrs: ?*GLib.SList = undefined;
        const arg_extra_attrs: ?**GLib.SList = &argO_extra_attrs;
        const cFn = @extern(*const fn (*AttrIterator, *FontDescription, ?**Language, ?**GLib.SList) callconv(.c) void, .{ .name = "pango_attr_iterator_get_font" });
        const ret = cFn(self, arg_desc, arg_language, arg_extra_attrs);
        _ = ret;
        return .{ .language = argO_language, .extra_attrs = argO_extra_attrs };
    }
    pub fn next(self: *AttrIterator) bool {
        const cFn = @extern(*const fn (*AttrIterator) callconv(.c) bool, .{ .name = "pango_attr_iterator_next" });
        const ret = cFn(self);
        return ret;
    }
    pub fn range(self: *AttrIterator) struct {
        start: i32,
        end: i32,
    } {
        var argO_start: i32 = undefined;
        const arg_start: *i32 = &argO_start;
        var argO_end: i32 = undefined;
        const arg_end: *i32 = &argO_end;
        const cFn = @extern(*const fn (*AttrIterator, *i32, *i32) callconv(.c) void, .{ .name = "pango_attr_iterator_range" });
        const ret = cFn(self, arg_start, arg_end);
        _ = ret;
        return .{ .start = argO_start, .end = argO_end };
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_attr_iterator_get_type" });
        return cFn();
    }
};
pub const AttrLanguage = extern struct {
    attr: Attribute,
    value: ?*Language,
    pub fn new(arg_language: *Language) *Attribute {
        const cFn = @extern(*const fn (*Language) callconv(.c) *Attribute, .{ .name = "pango_attr_language_new" });
        const ret = cFn(arg_language);
        return ret;
    }
};
pub const AttrList = opaque {
    pub fn new() *AttrList {
        const cFn = @extern(*const fn () callconv(.c) *AttrList, .{ .name = "pango_attr_list_new" });
        const ret = cFn();
        return ret;
    }
    pub fn change(self: *AttrList, arg_attr: *Attribute) void {
        const cFn = @extern(*const fn (*AttrList, *Attribute) callconv(.c) void, .{ .name = "pango_attr_list_change" });
        const ret = cFn(self, arg_attr);
        return ret;
    }
    pub fn copy(self: *AttrList) ?*AttrList {
        const cFn = @extern(*const fn (*AttrList) callconv(.c) ?*AttrList, .{ .name = "pango_attr_list_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn equal(self: *AttrList, arg_other_list: *AttrList) bool {
        const cFn = @extern(*const fn (*AttrList, *AttrList) callconv(.c) bool, .{ .name = "pango_attr_list_equal" });
        const ret = cFn(self, arg_other_list);
        return ret;
    }
    pub fn filter(self: *AttrList, argC_func: core.Closure(AttrFilterFunc)) ?*AttrList {
        const arg_func: AttrFilterFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*AttrList, AttrFilterFunc, ?*anyopaque) callconv(.c) ?*AttrList, .{ .name = "pango_attr_list_filter" });
        const ret = cFn(self, arg_func, @ptrCast(arg_data));
        return ret;
    }
    pub fn getAttributes(self: *AttrList) ?*GLib.SList {
        const cFn = @extern(*const fn (*AttrList) callconv(.c) ?*GLib.SList, .{ .name = "pango_attr_list_get_attributes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIterator(self: *AttrList) *AttrIterator {
        const cFn = @extern(*const fn (*AttrList) callconv(.c) *AttrIterator, .{ .name = "pango_attr_list_get_iterator" });
        const ret = cFn(self);
        return ret;
    }
    pub fn insert(self: *AttrList, arg_attr: *Attribute) void {
        const cFn = @extern(*const fn (*AttrList, *Attribute) callconv(.c) void, .{ .name = "pango_attr_list_insert" });
        const ret = cFn(self, arg_attr);
        return ret;
    }
    pub fn insertBefore(self: *AttrList, arg_attr: *Attribute) void {
        const cFn = @extern(*const fn (*AttrList, *Attribute) callconv(.c) void, .{ .name = "pango_attr_list_insert_before" });
        const ret = cFn(self, arg_attr);
        return ret;
    }
    pub fn ref(self: *AttrList) *AttrList {
        const cFn = @extern(*const fn (*AttrList) callconv(.c) *AttrList, .{ .name = "pango_attr_list_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn splice(self: *AttrList, arg_other: *AttrList, arg_pos: i32, arg_len: i32) void {
        const cFn = @extern(*const fn (*AttrList, *AttrList, i32, i32) callconv(.c) void, .{ .name = "pango_attr_list_splice" });
        const ret = cFn(self, arg_other, arg_pos, arg_len);
        return ret;
    }
    pub fn toString(self: *AttrList) [*:0]u8 {
        const cFn = @extern(*const fn (*AttrList) callconv(.c) [*:0]u8, .{ .name = "pango_attr_list_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *AttrList) void {
        const cFn = @extern(*const fn (*AttrList) callconv(.c) void, .{ .name = "pango_attr_list_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn update(self: *AttrList, arg_pos: i32, arg_remove: i32, arg_add: i32) void {
        const cFn = @extern(*const fn (*AttrList, i32, i32, i32) callconv(.c) void, .{ .name = "pango_attr_list_update" });
        const ret = cFn(self, arg_pos, arg_remove, arg_add);
        return ret;
    }
    pub fn fromString(arg_text: [*:0]const u8) ?*AttrList {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*AttrList, .{ .name = "pango_attr_list_from_string" });
        const ret = cFn(arg_text);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_attr_list_get_type" });
        return cFn();
    }
};
pub const AttrShape = extern struct {
    attr: Attribute,
    ink_rect: Rectangle,
    logical_rect: Rectangle,
    data: ?*anyopaque,
    copy_func: ?AttrDataCopyFunc,
    destroy_func: ?GLib.DestroyNotify,
    pub fn new(arg_ink_rect: *Rectangle, arg_logical_rect: *Rectangle) *Attribute {
        const cFn = @extern(*const fn (*Rectangle, *Rectangle) callconv(.c) *Attribute, .{ .name = "pango_attr_shape_new" });
        const ret = cFn(arg_ink_rect, arg_logical_rect);
        return ret;
    }
    pub fn newWithData(arg_ink_rect: *Rectangle, arg_logical_rect: *Rectangle, arg_data: ?*anyopaque, arg_copy_func: ?AttrDataCopyFunc, arg_destroy_func: ?GLib.DestroyNotify) *Attribute {
        const cFn = @extern(*const fn (*Rectangle, *Rectangle, ?*anyopaque, ?AttrDataCopyFunc, ?GLib.DestroyNotify) callconv(.c) *Attribute, .{ .name = "pango_attr_shape_new_with_data" });
        const ret = cFn(arg_ink_rect, arg_logical_rect, @ptrCast(arg_data), arg_copy_func, arg_destroy_func);
        return ret;
    }
};
pub const AttrSize = extern struct {
    attr: Attribute,
    size: i32,
    _20: packed struct(u32) {
        absolute: bool,
        _: u31,
    },
    pub fn new(arg_size: i32) *Attribute {
        const cFn = @extern(*const fn (i32) callconv(.c) *Attribute, .{ .name = "pango_attr_size_new" });
        const ret = cFn(arg_size);
        return ret;
    }
    pub fn newAbsolute(arg_size: i32) *Attribute {
        const cFn = @extern(*const fn (i32) callconv(.c) *Attribute, .{ .name = "pango_attr_size_new_absolute" });
        const ret = cFn(arg_size);
        return ret;
    }
};
pub const AttrString = extern struct {
    attr: Attribute,
    value: ?[*:0]const u8,
};
pub const AttrType = enum(u32) {
    invalid = 0,
    language = 1,
    family = 2,
    style = 3,
    weight = 4,
    variant = 5,
    stretch = 6,
    size = 7,
    font_desc = 8,
    foreground = 9,
    background = 10,
    underline = 11,
    strikethrough = 12,
    rise = 13,
    shape = 14,
    scale = 15,
    fallback = 16,
    letter_spacing = 17,
    underline_color = 18,
    strikethrough_color = 19,
    absolute_size = 20,
    gravity = 21,
    gravity_hint = 22,
    font_features = 23,
    foreground_alpha = 24,
    background_alpha = 25,
    allow_breaks = 26,
    show = 27,
    insert_hyphens = 28,
    overline = 29,
    overline_color = 30,
    line_height = 31,
    absolute_line_height = 32,
    text_transform = 33,
    word = 34,
    sentence = 35,
    baseline_shift = 36,
    font_scale = 37,
    pub fn getName(arg_type: AttrType) ?[*:0]u8 {
        const cFn = @extern(*const fn (AttrType) callconv(.c) ?[*:0]u8, .{ .name = "pango_attr_type_get_name" });
        const ret = cFn(arg_type);
        return ret;
    }
    pub fn register(arg_name: [*:0]const u8) AttrType {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) AttrType, .{ .name = "pango_attr_type_register" });
        const ret = cFn(arg_name);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_attr_type_get_type" });
        return cFn();
    }
};
pub const Attribute = extern struct {
    klass: ?*AttrClass,
    start_index: u32,
    end_index: u32,
    pub fn asColor(self: *Attribute) ?*AttrColor {
        const cFn = @extern(*const fn (*Attribute) callconv(.c) ?*AttrColor, .{ .name = "pango_attribute_as_color" });
        const ret = cFn(self);
        return ret;
    }
    pub fn asFloat(self: *Attribute) ?*AttrFloat {
        const cFn = @extern(*const fn (*Attribute) callconv(.c) ?*AttrFloat, .{ .name = "pango_attribute_as_float" });
        const ret = cFn(self);
        return ret;
    }
    pub fn asFontDesc(self: *Attribute) ?*AttrFontDesc {
        const cFn = @extern(*const fn (*Attribute) callconv(.c) ?*AttrFontDesc, .{ .name = "pango_attribute_as_font_desc" });
        const ret = cFn(self);
        return ret;
    }
    pub fn asFontFeatures(self: *Attribute) ?*AttrFontFeatures {
        const cFn = @extern(*const fn (*Attribute) callconv(.c) ?*AttrFontFeatures, .{ .name = "pango_attribute_as_font_features" });
        const ret = cFn(self);
        return ret;
    }
    pub fn asInt(self: *Attribute) ?*AttrInt {
        const cFn = @extern(*const fn (*Attribute) callconv(.c) ?*AttrInt, .{ .name = "pango_attribute_as_int" });
        const ret = cFn(self);
        return ret;
    }
    pub fn asLanguage(self: *Attribute) ?*AttrLanguage {
        const cFn = @extern(*const fn (*Attribute) callconv(.c) ?*AttrLanguage, .{ .name = "pango_attribute_as_language" });
        const ret = cFn(self);
        return ret;
    }
    pub fn asShape(self: *Attribute) ?*AttrShape {
        const cFn = @extern(*const fn (*Attribute) callconv(.c) ?*AttrShape, .{ .name = "pango_attribute_as_shape" });
        const ret = cFn(self);
        return ret;
    }
    pub fn asSize(self: *Attribute) ?*AttrSize {
        const cFn = @extern(*const fn (*Attribute) callconv(.c) ?*AttrSize, .{ .name = "pango_attribute_as_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn asString(self: *Attribute) ?*AttrString {
        const cFn = @extern(*const fn (*Attribute) callconv(.c) ?*AttrString, .{ .name = "pango_attribute_as_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn copy(self: *Attribute) *Attribute {
        const cFn = @extern(*const fn (*Attribute) callconv(.c) *Attribute, .{ .name = "pango_attribute_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn destroy(self: *Attribute) void {
        const cFn = @extern(*const fn (*Attribute) callconv(.c) void, .{ .name = "pango_attribute_destroy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn equal(self: *Attribute, arg_attr2: *Attribute) bool {
        const cFn = @extern(*const fn (*Attribute, *Attribute) callconv(.c) bool, .{ .name = "pango_attribute_equal" });
        const ret = cFn(self, arg_attr2);
        return ret;
    }
    pub fn init(self: *Attribute, arg_klass: *AttrClass) void {
        const cFn = @extern(*const fn (*Attribute, *AttrClass) callconv(.c) void, .{ .name = "pango_attribute_init" });
        const ret = cFn(self, arg_klass);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_attribute_get_type" });
        return cFn();
    }
};
pub const BaselineShift = enum(u32) {
    none = 0,
    superscript = 1,
    subscript = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_baseline_shift_get_type" });
        return cFn();
    }
};
pub const BidiType = enum(u32) {
    l = 0,
    lre = 1,
    lro = 2,
    r = 3,
    al = 4,
    rle = 5,
    rlo = 6,
    pdf = 7,
    en = 8,
    es = 9,
    et = 10,
    an = 11,
    cs = 12,
    nsm = 13,
    bn = 14,
    b = 15,
    s = 16,
    ws = 17,
    on = 18,
    lri = 19,
    rli = 20,
    fsi = 21,
    pdi = 22,
    pub fn forUnichar(arg_ch: u32) BidiType {
        const cFn = @extern(*const fn (u32) callconv(.c) BidiType, .{ .name = "pango_bidi_type_for_unichar" });
        const ret = cFn(arg_ch);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_bidi_type_get_type" });
        return cFn();
    }
};
pub const Color = extern struct {
    red: u16,
    green: u16,
    blue: u16,
    pub fn copy(self: *Color) ?*Color {
        const cFn = @extern(*const fn (*Color) callconv(.c) ?*Color, .{ .name = "pango_color_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *Color) void {
        const cFn = @extern(*const fn (*Color) callconv(.c) void, .{ .name = "pango_color_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn parse(self: *Color, arg_spec: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*Color, [*:0]const u8) callconv(.c) bool, .{ .name = "pango_color_parse" });
        const ret = cFn(self, arg_spec);
        return ret;
    }
    pub fn parseWithAlpha(self: *Color, arg_spec: [*:0]const u8) struct {
        ret: bool,
        alpha: u16,
    } {
        var argO_alpha: u16 = undefined;
        const arg_alpha: ?*u16 = &argO_alpha;
        const cFn = @extern(*const fn (*Color, ?*u16, [*:0]const u8) callconv(.c) bool, .{ .name = "pango_color_parse_with_alpha" });
        const ret = cFn(self, arg_alpha, arg_spec);
        return .{ .ret = ret, .alpha = argO_alpha };
    }
    pub fn toString(self: *Color) [*:0]u8 {
        const cFn = @extern(*const fn (*Color) callconv(.c) [*:0]u8, .{ .name = "pango_color_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_color_get_type" });
        return cFn();
    }
};
pub const Context = struct {
    pub const Parent = GObject.Object;
    pub const Class = ContextClass;
    pub fn new() *Context {
        const cFn = @extern(*const fn () callconv(.c) *Context, .{ .name = "pango_context_new" });
        const ret = cFn();
        return ret;
    }
    pub fn changed(self: *Context) void {
        const cFn = @extern(*const fn (*Context) callconv(.c) void, .{ .name = "pango_context_changed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBaseDir(self: *Context) Direction {
        const cFn = @extern(*const fn (*Context) callconv(.c) Direction, .{ .name = "pango_context_get_base_dir" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBaseGravity(self: *Context) Gravity {
        const cFn = @extern(*const fn (*Context) callconv(.c) Gravity, .{ .name = "pango_context_get_base_gravity" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFontDescription(self: *Context) ?*FontDescription {
        const cFn = @extern(*const fn (*Context) callconv(.c) ?*FontDescription, .{ .name = "pango_context_get_font_description" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFontMap(self: *Context) ?*FontMap {
        const cFn = @extern(*const fn (*Context) callconv(.c) ?*FontMap, .{ .name = "pango_context_get_font_map" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getGravity(self: *Context) Gravity {
        const cFn = @extern(*const fn (*Context) callconv(.c) Gravity, .{ .name = "pango_context_get_gravity" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getGravityHint(self: *Context) GravityHint {
        const cFn = @extern(*const fn (*Context) callconv(.c) GravityHint, .{ .name = "pango_context_get_gravity_hint" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLanguage(self: *Context) *Language {
        const cFn = @extern(*const fn (*Context) callconv(.c) *Language, .{ .name = "pango_context_get_language" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMatrix(self: *Context) ?*Matrix {
        const cFn = @extern(*const fn (*Context) callconv(.c) ?*Matrix, .{ .name = "pango_context_get_matrix" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMetrics(self: *Context, arg_desc: ?*FontDescription, arg_language: ?*Language) *FontMetrics {
        const cFn = @extern(*const fn (*Context, ?*FontDescription, ?*Language) callconv(.c) *FontMetrics, .{ .name = "pango_context_get_metrics" });
        const ret = cFn(self, arg_desc, arg_language);
        return ret;
    }
    pub fn getRoundGlyphPositions(self: *Context) bool {
        const cFn = @extern(*const fn (*Context) callconv(.c) bool, .{ .name = "pango_context_get_round_glyph_positions" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSerial(self: *Context) u32 {
        const cFn = @extern(*const fn (*Context) callconv(.c) u32, .{ .name = "pango_context_get_serial" });
        const ret = cFn(self);
        return ret;
    }
    pub fn listFamilies(self: *Context) []*FontFamily {
        var argO_families: [*]*FontFamily = undefined;
        const arg_families: *[*]*FontFamily = &argO_families;
        var argO_n_families: i32 = undefined;
        const arg_n_families: *i32 = &argO_n_families;
        const cFn = @extern(*const fn (*Context, *[*]*FontFamily, *i32) callconv(.c) void, .{ .name = "pango_context_list_families" });
        const ret = cFn(self, arg_families, arg_n_families);
        _ = ret;
        return argO_families[0..@intCast(argO_n_families)];
    }
    pub fn loadFont(self: *Context, arg_desc: *FontDescription) ?*Font {
        const cFn = @extern(*const fn (*Context, *FontDescription) callconv(.c) ?*Font, .{ .name = "pango_context_load_font" });
        const ret = cFn(self, arg_desc);
        return ret;
    }
    pub fn loadFontset(self: *Context, arg_desc: *FontDescription, arg_language: *Language) ?*Fontset {
        const cFn = @extern(*const fn (*Context, *FontDescription, *Language) callconv(.c) ?*Fontset, .{ .name = "pango_context_load_fontset" });
        const ret = cFn(self, arg_desc, arg_language);
        return ret;
    }
    pub fn setBaseDir(self: *Context, arg_direction: Direction) void {
        const cFn = @extern(*const fn (*Context, Direction) callconv(.c) void, .{ .name = "pango_context_set_base_dir" });
        const ret = cFn(self, arg_direction);
        return ret;
    }
    pub fn setBaseGravity(self: *Context, arg_gravity: Gravity) void {
        const cFn = @extern(*const fn (*Context, Gravity) callconv(.c) void, .{ .name = "pango_context_set_base_gravity" });
        const ret = cFn(self, arg_gravity);
        return ret;
    }
    pub fn setFontDescription(self: *Context, arg_desc: ?*FontDescription) void {
        const cFn = @extern(*const fn (*Context, ?*FontDescription) callconv(.c) void, .{ .name = "pango_context_set_font_description" });
        const ret = cFn(self, arg_desc);
        return ret;
    }
    pub fn setFontMap(self: *Context, arg_font_map: ?*FontMap) void {
        const cFn = @extern(*const fn (*Context, ?*FontMap) callconv(.c) void, .{ .name = "pango_context_set_font_map" });
        const ret = cFn(self, arg_font_map);
        return ret;
    }
    pub fn setGravityHint(self: *Context, arg_hint: GravityHint) void {
        const cFn = @extern(*const fn (*Context, GravityHint) callconv(.c) void, .{ .name = "pango_context_set_gravity_hint" });
        const ret = cFn(self, arg_hint);
        return ret;
    }
    pub fn setLanguage(self: *Context, arg_language: ?*Language) void {
        const cFn = @extern(*const fn (*Context, ?*Language) callconv(.c) void, .{ .name = "pango_context_set_language" });
        const ret = cFn(self, arg_language);
        return ret;
    }
    pub fn setMatrix(self: *Context, arg_matrix: ?*Matrix) void {
        const cFn = @extern(*const fn (*Context, ?*Matrix) callconv(.c) void, .{ .name = "pango_context_set_matrix" });
        const ret = cFn(self, arg_matrix);
        return ret;
    }
    pub fn setRoundGlyphPositions(self: *Context, arg_round_positions: bool) void {
        const cFn = @extern(*const fn (*Context, bool) callconv(.c) void, .{ .name = "pango_context_set_round_glyph_positions" });
        const ret = cFn(self, arg_round_positions);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_context_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ContextClass = opaque {};
pub const Coverage = struct {
    pub const Parent = GObject.Object;
    pub fn new() *Coverage {
        const cFn = @extern(*const fn () callconv(.c) *Coverage, .{ .name = "pango_coverage_new" });
        const ret = cFn();
        return ret;
    }
    pub fn fromBytes(argS_bytes: []u8) ?*Coverage {
        const arg_bytes: [*]u8 = @ptrCast(argS_bytes);
        const arg_n_bytes: i32 = @intCast((argS_bytes).len);
        const cFn = @extern(*const fn ([*]u8, i32) callconv(.c) ?*Coverage, .{ .name = "pango_coverage_from_bytes" });
        const ret = cFn(arg_bytes, arg_n_bytes);
        return ret;
    }
    pub fn copy(self: *Coverage) *Coverage {
        const cFn = @extern(*const fn (*Coverage) callconv(.c) *Coverage, .{ .name = "pango_coverage_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn get(self: *Coverage, arg_index_: i32) CoverageLevel {
        const cFn = @extern(*const fn (*Coverage, i32) callconv(.c) CoverageLevel, .{ .name = "pango_coverage_get" });
        const ret = cFn(self, arg_index_);
        return ret;
    }
    pub fn max(self: *Coverage, arg_other: *Coverage) void {
        const cFn = @extern(*const fn (*Coverage, *Coverage) callconv(.c) void, .{ .name = "pango_coverage_max" });
        const ret = cFn(self, arg_other);
        return ret;
    }
    pub fn ref(self: *Coverage) *Coverage {
        const cFn = @extern(*const fn (*Coverage) callconv(.c) *Coverage, .{ .name = "pango_coverage_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn set(self: *Coverage, arg_index_: i32, arg_level: CoverageLevel) void {
        const cFn = @extern(*const fn (*Coverage, i32, CoverageLevel) callconv(.c) void, .{ .name = "pango_coverage_set" });
        const ret = cFn(self, arg_index_, arg_level);
        return ret;
    }
    pub fn toBytes(self: *Coverage) []u8 {
        var argO_bytes: [*]u8 = undefined;
        const arg_bytes: *[*]u8 = &argO_bytes;
        var argO_n_bytes: i32 = undefined;
        const arg_n_bytes: *i32 = &argO_n_bytes;
        const cFn = @extern(*const fn (*Coverage, *[*]u8, *i32) callconv(.c) void, .{ .name = "pango_coverage_to_bytes" });
        const ret = cFn(self, arg_bytes, arg_n_bytes);
        _ = ret;
        return argO_bytes[0..@intCast(argO_n_bytes)];
    }
    pub fn unref(self: *Coverage) void {
        const cFn = @extern(*const fn (*Coverage) callconv(.c) void, .{ .name = "pango_coverage_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_coverage_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const CoverageLevel = enum(u32) {
    none = 0,
    fallback = 1,
    approximate = 2,
    exact = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_coverage_level_get_type" });
        return cFn();
    }
};
pub const Direction = enum(u32) {
    ltr = 0,
    rtl = 1,
    ttb_ltr = 2,
    ttb_rtl = 3,
    weak_ltr = 4,
    weak_rtl = 5,
    neutral = 6,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_direction_get_type" });
        return cFn();
    }
};
pub const EllipsizeMode = enum(u32) {
    none = 0,
    start = 1,
    middle = 2,
    end = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_ellipsize_mode_get_type" });
        return cFn();
    }
};
pub const Font = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = FontClass;
    parent_instance: GObject.Object,
    pub fn descriptionsFree(argS_descs: []*FontDescription) void {
        const arg_descs: ?[*]*FontDescription = @ptrCast(argS_descs);
        const arg_n_descs: i32 = @intCast((argS_descs).len);
        const cFn = @extern(*const fn (?[*]*FontDescription, i32) callconv(.c) void, .{ .name = "pango_font_descriptions_free" });
        const ret = cFn(arg_descs, arg_n_descs);
        return ret;
    }
    pub fn deserialize(arg_context: *Context, arg_bytes: *GLib.Bytes, arg_error: *?*GLib.Error) error{GError}!?*Font {
        const cFn = @extern(*const fn (*Context, *GLib.Bytes, *?*GLib.Error) callconv(.c) ?*Font, .{ .name = "pango_font_deserialize" });
        const ret = cFn(arg_context, arg_bytes, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn describe(self: *Font) *FontDescription {
        const cFn = @extern(*const fn (*Font) callconv(.c) *FontDescription, .{ .name = "pango_font_describe" });
        const ret = cFn(self);
        return ret;
    }
    pub fn describeWithAbsoluteSize(self: *Font) *FontDescription {
        const cFn = @extern(*const fn (*Font) callconv(.c) *FontDescription, .{ .name = "pango_font_describe_with_absolute_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCoverage(self: *Font, arg_language: *Language) *Coverage {
        const cFn = @extern(*const fn (*Font, *Language) callconv(.c) *Coverage, .{ .name = "pango_font_get_coverage" });
        const ret = cFn(self, arg_language);
        return ret;
    }
    pub fn getFace(self: *Font) ?*FontFace {
        const cFn = @extern(*const fn (*Font) callconv(.c) ?*FontFace, .{ .name = "pango_font_get_face" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFeatures(self: *Font, arg_features: *anyopaque, arg_len: u32, arg_num_features: *u32) void {
        const cFn = @extern(*const fn (*Font, *anyopaque, u32, *u32) callconv(.c) void, .{ .name = "pango_font_get_features" });
        const ret = cFn(self, @ptrCast(arg_features), arg_len, arg_num_features);
        return ret;
    }
    pub fn getFontMap(self: *Font) ?*FontMap {
        const cFn = @extern(*const fn (*Font) callconv(.c) ?*FontMap, .{ .name = "pango_font_get_font_map" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getGlyphExtents(self: *Font, arg_glyph: u32, arg_ink_rect: ?*Rectangle, arg_logical_rect: ?*Rectangle) void {
        const cFn = @extern(*const fn (*Font, u32, ?*Rectangle, ?*Rectangle) callconv(.c) void, .{ .name = "pango_font_get_glyph_extents" });
        const ret = cFn(self, arg_glyph, arg_ink_rect, arg_logical_rect);
        return ret;
    }
    pub fn getLanguages(self: *Font) ?[*]Language {
        const cFn = @extern(*const fn (*Font) callconv(.c) ?[*]Language, .{ .name = "pango_font_get_languages" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMetrics(self: *Font, arg_language: ?*Language) *FontMetrics {
        const cFn = @extern(*const fn (*Font, ?*Language) callconv(.c) *FontMetrics, .{ .name = "pango_font_get_metrics" });
        const ret = cFn(self, arg_language);
        return ret;
    }
    pub fn hasChar(self: *Font, arg_wc: u32) bool {
        const cFn = @extern(*const fn (*Font, u32) callconv(.c) bool, .{ .name = "pango_font_has_char" });
        const ret = cFn(self, arg_wc);
        return ret;
    }
    pub fn serialize(self: *Font) *GLib.Bytes {
        const cFn = @extern(*const fn (*Font) callconv(.c) *GLib.Bytes, .{ .name = "pango_font_serialize" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_font_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FontClass = extern struct {
    parent_class: GObject.ObjectClass,
    describe: ?*const fn (arg_font: *Font) callconv(.c) *FontDescription,
    get_coverage: ?*const fn (arg_font: *Font, arg_language: *Language) callconv(.c) *Coverage,
    get_glyph_extents: ?*const fn (arg_font: ?*Font, arg_glyph: u32, arg_ink_rect: ?*Rectangle, arg_logical_rect: ?*Rectangle) callconv(.c) void,
    get_metrics: ?*const fn (arg_font: ?*Font, arg_language: ?*Language) callconv(.c) *FontMetrics,
    get_font_map: ?*const fn (arg_font: ?*Font) callconv(.c) ?*FontMap,
    describe_absolute: ?*const fn (arg_font: *Font) callconv(.c) *FontDescription,
    get_features: ?*const fn (arg_font: *Font, arg_features: *anyopaque, arg_len: u32, arg_num_features: *u32) callconv(.c) void,
    create_hb_font: ?*const fn (arg_font: *Font) callconv(.c) *HarfBuzz.font_t,
};
pub const FontDescription = opaque {
    pub fn new() *FontDescription {
        const cFn = @extern(*const fn () callconv(.c) *FontDescription, .{ .name = "pango_font_description_new" });
        const ret = cFn();
        return ret;
    }
    pub fn betterMatch(self: *FontDescription, arg_old_match: ?*FontDescription, arg_new_match: *FontDescription) bool {
        const cFn = @extern(*const fn (*FontDescription, ?*FontDescription, *FontDescription) callconv(.c) bool, .{ .name = "pango_font_description_better_match" });
        const ret = cFn(self, arg_old_match, arg_new_match);
        return ret;
    }
    pub fn copy(self: *FontDescription) ?*FontDescription {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) ?*FontDescription, .{ .name = "pango_font_description_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn copyStatic(self: *FontDescription) ?*FontDescription {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) ?*FontDescription, .{ .name = "pango_font_description_copy_static" });
        const ret = cFn(self);
        return ret;
    }
    pub fn equal(self: *FontDescription, arg_desc2: *FontDescription) bool {
        const cFn = @extern(*const fn (*FontDescription, *FontDescription) callconv(.c) bool, .{ .name = "pango_font_description_equal" });
        const ret = cFn(self, arg_desc2);
        return ret;
    }
    pub fn free(self: *FontDescription) void {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) void, .{ .name = "pango_font_description_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFamily(self: *FontDescription) ?[*:0]u8 {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) ?[*:0]u8, .{ .name = "pango_font_description_get_family" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFeatures(self: *FontDescription) ?[*:0]u8 {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) ?[*:0]u8, .{ .name = "pango_font_description_get_features" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getGravity(self: *FontDescription) Gravity {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) Gravity, .{ .name = "pango_font_description_get_gravity" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSetFields(self: *FontDescription) FontMask {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) FontMask, .{ .name = "pango_font_description_get_set_fields" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSize(self: *FontDescription) i32 {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) i32, .{ .name = "pango_font_description_get_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSizeIsAbsolute(self: *FontDescription) bool {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) bool, .{ .name = "pango_font_description_get_size_is_absolute" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStretch(self: *FontDescription) Stretch {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) Stretch, .{ .name = "pango_font_description_get_stretch" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStyle(self: *FontDescription) Style {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) Style, .{ .name = "pango_font_description_get_style" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getVariant(self: *FontDescription) Variant {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) Variant, .{ .name = "pango_font_description_get_variant" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getVariations(self: *FontDescription) ?[*:0]u8 {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) ?[*:0]u8, .{ .name = "pango_font_description_get_variations" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWeight(self: *FontDescription) Weight {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) Weight, .{ .name = "pango_font_description_get_weight" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hash(self: *FontDescription) u32 {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) u32, .{ .name = "pango_font_description_hash" });
        const ret = cFn(self);
        return ret;
    }
    pub fn merge(self: *FontDescription, arg_desc_to_merge: ?*FontDescription, arg_replace_existing: bool) void {
        const cFn = @extern(*const fn (*FontDescription, ?*FontDescription, bool) callconv(.c) void, .{ .name = "pango_font_description_merge" });
        const ret = cFn(self, arg_desc_to_merge, arg_replace_existing);
        return ret;
    }
    pub fn mergeStatic(self: *FontDescription, arg_desc_to_merge: *FontDescription, arg_replace_existing: bool) void {
        const cFn = @extern(*const fn (*FontDescription, *FontDescription, bool) callconv(.c) void, .{ .name = "pango_font_description_merge_static" });
        const ret = cFn(self, arg_desc_to_merge, arg_replace_existing);
        return ret;
    }
    pub fn setAbsoluteSize(self: *FontDescription, arg_size: f64) void {
        const cFn = @extern(*const fn (*FontDescription, f64) callconv(.c) void, .{ .name = "pango_font_description_set_absolute_size" });
        const ret = cFn(self, arg_size);
        return ret;
    }
    pub fn setFamily(self: *FontDescription, arg_family: [*:0]const u8) void {
        const cFn = @extern(*const fn (*FontDescription, [*:0]const u8) callconv(.c) void, .{ .name = "pango_font_description_set_family" });
        const ret = cFn(self, arg_family);
        return ret;
    }
    pub fn setFamilyStatic(self: *FontDescription, arg_family: [*:0]const u8) void {
        const cFn = @extern(*const fn (*FontDescription, [*:0]const u8) callconv(.c) void, .{ .name = "pango_font_description_set_family_static" });
        const ret = cFn(self, arg_family);
        return ret;
    }
    pub fn setFeatures(self: *FontDescription, arg_features: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*FontDescription, ?[*:0]const u8) callconv(.c) void, .{ .name = "pango_font_description_set_features" });
        const ret = cFn(self, arg_features);
        return ret;
    }
    pub fn setFeaturesStatic(self: *FontDescription, arg_features: [*:0]const u8) void {
        const cFn = @extern(*const fn (*FontDescription, [*:0]const u8) callconv(.c) void, .{ .name = "pango_font_description_set_features_static" });
        const ret = cFn(self, arg_features);
        return ret;
    }
    pub fn setGravity(self: *FontDescription, arg_gravity: Gravity) void {
        const cFn = @extern(*const fn (*FontDescription, Gravity) callconv(.c) void, .{ .name = "pango_font_description_set_gravity" });
        const ret = cFn(self, arg_gravity);
        return ret;
    }
    pub fn setSize(self: *FontDescription, arg_size: i32) void {
        const cFn = @extern(*const fn (*FontDescription, i32) callconv(.c) void, .{ .name = "pango_font_description_set_size" });
        const ret = cFn(self, arg_size);
        return ret;
    }
    pub fn setStretch(self: *FontDescription, arg_stretch: Stretch) void {
        const cFn = @extern(*const fn (*FontDescription, Stretch) callconv(.c) void, .{ .name = "pango_font_description_set_stretch" });
        const ret = cFn(self, arg_stretch);
        return ret;
    }
    pub fn setStyle(self: *FontDescription, arg_style: Style) void {
        const cFn = @extern(*const fn (*FontDescription, Style) callconv(.c) void, .{ .name = "pango_font_description_set_style" });
        const ret = cFn(self, arg_style);
        return ret;
    }
    pub fn setVariant(self: *FontDescription, arg_variant: Variant) void {
        const cFn = @extern(*const fn (*FontDescription, Variant) callconv(.c) void, .{ .name = "pango_font_description_set_variant" });
        const ret = cFn(self, arg_variant);
        return ret;
    }
    pub fn setVariations(self: *FontDescription, arg_variations: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*FontDescription, ?[*:0]const u8) callconv(.c) void, .{ .name = "pango_font_description_set_variations" });
        const ret = cFn(self, arg_variations);
        return ret;
    }
    pub fn setVariationsStatic(self: *FontDescription, arg_variations: [*:0]const u8) void {
        const cFn = @extern(*const fn (*FontDescription, [*:0]const u8) callconv(.c) void, .{ .name = "pango_font_description_set_variations_static" });
        const ret = cFn(self, arg_variations);
        return ret;
    }
    pub fn setWeight(self: *FontDescription, arg_weight: Weight) void {
        const cFn = @extern(*const fn (*FontDescription, Weight) callconv(.c) void, .{ .name = "pango_font_description_set_weight" });
        const ret = cFn(self, arg_weight);
        return ret;
    }
    pub fn toFilename(self: *FontDescription) ?[*:0]u8 {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) ?[*:0]u8, .{ .name = "pango_font_description_to_filename" });
        const ret = cFn(self);
        return ret;
    }
    pub fn toString(self: *FontDescription) [*:0]u8 {
        const cFn = @extern(*const fn (*FontDescription) callconv(.c) [*:0]u8, .{ .name = "pango_font_description_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unsetFields(self: *FontDescription, arg_to_unset: FontMask) void {
        const cFn = @extern(*const fn (*FontDescription, FontMask) callconv(.c) void, .{ .name = "pango_font_description_unset_fields" });
        const ret = cFn(self, arg_to_unset);
        return ret;
    }
    pub fn fromString(arg_str: [*:0]const u8) *FontDescription {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *FontDescription, .{ .name = "pango_font_description_from_string" });
        const ret = cFn(arg_str);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_font_description_get_type" });
        return cFn();
    }
};
pub const FontFace = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = FontFaceClass;
    parent_instance: GObject.Object,
    pub fn describe(self: *FontFace) *FontDescription {
        const cFn = @extern(*const fn (*FontFace) callconv(.c) *FontDescription, .{ .name = "pango_font_face_describe" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFaceName(self: *FontFace) [*:0]u8 {
        const cFn = @extern(*const fn (*FontFace) callconv(.c) [*:0]u8, .{ .name = "pango_font_face_get_face_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFamily(self: *FontFace) *FontFamily {
        const cFn = @extern(*const fn (*FontFace) callconv(.c) *FontFamily, .{ .name = "pango_font_face_get_family" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isSynthesized(self: *FontFace) bool {
        const cFn = @extern(*const fn (*FontFace) callconv(.c) bool, .{ .name = "pango_font_face_is_synthesized" });
        const ret = cFn(self);
        return ret;
    }
    pub fn listSizes(self: *FontFace) ?[]i32 {
        var argO_sizes: ?[*]i32 = undefined;
        const arg_sizes: ?*?[*]i32 = &argO_sizes;
        var argO_n_sizes: i32 = undefined;
        const arg_n_sizes: *i32 = &argO_n_sizes;
        const cFn = @extern(*const fn (*FontFace, ?*?[*]i32, *i32) callconv(.c) void, .{ .name = "pango_font_face_list_sizes" });
        const ret = cFn(self, arg_sizes, arg_n_sizes);
        _ = ret;
        return argO_sizes[0..@intCast(argO_n_sizes)];
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_font_face_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FontFaceClass = extern struct {
    parent_class: GObject.ObjectClass,
    get_face_name: ?*const fn (arg_face: *FontFace) callconv(.c) [*:0]u8,
    describe: ?*const fn (arg_face: *FontFace) callconv(.c) *FontDescription,
    list_sizes: ?*const fn (arg_face: *FontFace, arg_sizes: ?*?[*]i32, arg_n_sizes: *i32) callconv(.c) void,
    is_synthesized: ?*const fn (arg_face: *FontFace) callconv(.c) bool,
    get_family: ?*const fn (arg_face: *FontFace) callconv(.c) *FontFamily,
    _pango_reserved3: ?*anyopaque,
    _pango_reserved4: ?*anyopaque,
};
pub const FontFamily = extern struct {
    pub const Interfaces = [_]type{Gio.ListModel};
    pub const Parent = GObject.Object;
    pub const Class = FontFamilyClass;
    _props: struct {
        @"is-monospace": core.Property(bool, "is-monospace") = .{},
        @"is-variable": core.Property(bool, "is-variable") = .{},
        @"item-type": core.Property(core.Type, "item-type") = .{},
        @"n-items": core.Property(u32, "n-items") = .{},
        name: core.Property([*:0]const u8, "name") = .{},
    },
    parent_instance: GObject.Object,
    pub fn getFace(self: *FontFamily, arg_name: ?[*:0]const u8) ?*FontFace {
        const cFn = @extern(*const fn (*FontFamily, ?[*:0]const u8) callconv(.c) ?*FontFace, .{ .name = "pango_font_family_get_face" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn getName(self: *FontFamily) [*:0]u8 {
        const cFn = @extern(*const fn (*FontFamily) callconv(.c) [*:0]u8, .{ .name = "pango_font_family_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isMonospace(self: *FontFamily) bool {
        const cFn = @extern(*const fn (*FontFamily) callconv(.c) bool, .{ .name = "pango_font_family_is_monospace" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isVariable(self: *FontFamily) bool {
        const cFn = @extern(*const fn (*FontFamily) callconv(.c) bool, .{ .name = "pango_font_family_is_variable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn listFaces(self: *FontFamily) ?[]*FontFace {
        var argO_faces: ?[*]*FontFace = undefined;
        const arg_faces: ?*[*]*FontFace = &argO_faces;
        var argO_n_faces: i32 = undefined;
        const arg_n_faces: *i32 = &argO_n_faces;
        const cFn = @extern(*const fn (*FontFamily, ?*[*]*FontFace, *i32) callconv(.c) void, .{ .name = "pango_font_family_list_faces" });
        const ret = cFn(self, arg_faces, arg_n_faces);
        _ = ret;
        return argO_faces[0..@intCast(argO_n_faces)];
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_font_family_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FontFamilyClass = extern struct {
    parent_class: GObject.ObjectClass,
    list_faces: ?*const fn (arg_family: *FontFamily, arg_faces: ?*[*]*FontFace, arg_n_faces: *i32) callconv(.c) void,
    get_name: ?*const fn (arg_family: *FontFamily) callconv(.c) [*:0]u8,
    is_monospace: ?*const fn (arg_family: *FontFamily) callconv(.c) bool,
    is_variable: ?*const fn (arg_family: *FontFamily) callconv(.c) bool,
    get_face: ?*const fn (arg_family: *FontFamily, arg_name: ?[*:0]const u8) callconv(.c) ?*FontFace,
    _pango_reserved2: ?*anyopaque,
};
pub const FontMap = extern struct {
    pub const Interfaces = [_]type{Gio.ListModel};
    pub const Parent = GObject.Object;
    pub const Class = FontMapClass;
    _props: struct {
        @"item-type": core.Property(core.Type, "item-type") = .{},
        @"n-items": core.Property(u32, "n-items") = .{},
    },
    parent_instance: GObject.Object,
    pub fn addFontFile(self: *FontMap, arg_filename: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*FontMap, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "pango_font_map_add_font_file" });
        const ret = cFn(self, arg_filename, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn changed(self: *FontMap) void {
        const cFn = @extern(*const fn (*FontMap) callconv(.c) void, .{ .name = "pango_font_map_changed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn createContext(self: *FontMap) *Context {
        const cFn = @extern(*const fn (*FontMap) callconv(.c) *Context, .{ .name = "pango_font_map_create_context" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFamily(self: *FontMap, arg_name: [*:0]const u8) *FontFamily {
        const cFn = @extern(*const fn (*FontMap, [*:0]const u8) callconv(.c) *FontFamily, .{ .name = "pango_font_map_get_family" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn getSerial(self: *FontMap) u32 {
        const cFn = @extern(*const fn (*FontMap) callconv(.c) u32, .{ .name = "pango_font_map_get_serial" });
        const ret = cFn(self);
        return ret;
    }
    pub fn listFamilies(self: *FontMap) []*FontFamily {
        var argO_families: [*]*FontFamily = undefined;
        const arg_families: *[*]*FontFamily = &argO_families;
        var argO_n_families: i32 = undefined;
        const arg_n_families: *i32 = &argO_n_families;
        const cFn = @extern(*const fn (*FontMap, *[*]*FontFamily, *i32) callconv(.c) void, .{ .name = "pango_font_map_list_families" });
        const ret = cFn(self, arg_families, arg_n_families);
        _ = ret;
        return argO_families[0..@intCast(argO_n_families)];
    }
    pub fn loadFont(self: *FontMap, arg_context: *Context, arg_desc: *FontDescription) ?*Font {
        const cFn = @extern(*const fn (*FontMap, *Context, *FontDescription) callconv(.c) ?*Font, .{ .name = "pango_font_map_load_font" });
        const ret = cFn(self, arg_context, arg_desc);
        return ret;
    }
    pub fn loadFontset(self: *FontMap, arg_context: *Context, arg_desc: *FontDescription, arg_language: *Language) ?*Fontset {
        const cFn = @extern(*const fn (*FontMap, *Context, *FontDescription, *Language) callconv(.c) ?*Fontset, .{ .name = "pango_font_map_load_fontset" });
        const ret = cFn(self, arg_context, arg_desc, arg_language);
        return ret;
    }
    pub fn reloadFont(self: *FontMap, arg_font: *Font, arg_scale: f64, arg_context: ?*Context, arg_variations: ?[*:0]const u8) *Font {
        const cFn = @extern(*const fn (*FontMap, *Font, f64, ?*Context, ?[*:0]const u8) callconv(.c) *Font, .{ .name = "pango_font_map_reload_font" });
        const ret = cFn(self, arg_font, arg_scale, arg_context, arg_variations);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_font_map_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FontMapClass = extern struct {
    parent_class: GObject.ObjectClass,
    load_font: ?*const fn (arg_fontmap: *FontMap, arg_context: *Context, arg_desc: *FontDescription) callconv(.c) ?*Font,
    list_families: ?*const fn (arg_fontmap: *FontMap, arg_families: *[*]*FontFamily, arg_n_families: *i32) callconv(.c) void,
    load_fontset: ?*const fn (arg_fontmap: *FontMap, arg_context: *Context, arg_desc: *FontDescription, arg_language: *Language) callconv(.c) ?*Fontset,
    shape_engine_type: ?[*:0]const u8,
    get_serial: ?*const fn (arg_fontmap: *FontMap) callconv(.c) u32,
    changed: ?*const fn (arg_fontmap: *FontMap) callconv(.c) void,
    get_family: ?*const fn (arg_fontmap: *FontMap, arg_name: [*:0]const u8) callconv(.c) *FontFamily,
    get_face: ?*anyopaque,
};
pub const FontMask = packed struct(u32) {
    family: bool = false,
    style: bool = false,
    variant: bool = false,
    weight: bool = false,
    stretch: bool = false,
    size: bool = false,
    gravity: bool = false,
    variations: bool = false,
    features: bool = false,
    _: u23 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_font_mask_get_type" });
        return cFn();
    }
};
pub const FontMetrics = extern struct {
    ref_count: u32,
    ascent: i32,
    descent: i32,
    height: i32,
    approximate_char_width: i32,
    approximate_digit_width: i32,
    underline_position: i32,
    underline_thickness: i32,
    strikethrough_position: i32,
    strikethrough_thickness: i32,
    pub fn getApproximateCharWidth(self: *FontMetrics) i32 {
        const cFn = @extern(*const fn (*FontMetrics) callconv(.c) i32, .{ .name = "pango_font_metrics_get_approximate_char_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getApproximateDigitWidth(self: *FontMetrics) i32 {
        const cFn = @extern(*const fn (*FontMetrics) callconv(.c) i32, .{ .name = "pango_font_metrics_get_approximate_digit_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getAscent(self: *FontMetrics) i32 {
        const cFn = @extern(*const fn (*FontMetrics) callconv(.c) i32, .{ .name = "pango_font_metrics_get_ascent" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDescent(self: *FontMetrics) i32 {
        const cFn = @extern(*const fn (*FontMetrics) callconv(.c) i32, .{ .name = "pango_font_metrics_get_descent" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHeight(self: *FontMetrics) i32 {
        const cFn = @extern(*const fn (*FontMetrics) callconv(.c) i32, .{ .name = "pango_font_metrics_get_height" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStrikethroughPosition(self: *FontMetrics) i32 {
        const cFn = @extern(*const fn (*FontMetrics) callconv(.c) i32, .{ .name = "pango_font_metrics_get_strikethrough_position" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStrikethroughThickness(self: *FontMetrics) i32 {
        const cFn = @extern(*const fn (*FontMetrics) callconv(.c) i32, .{ .name = "pango_font_metrics_get_strikethrough_thickness" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUnderlinePosition(self: *FontMetrics) i32 {
        const cFn = @extern(*const fn (*FontMetrics) callconv(.c) i32, .{ .name = "pango_font_metrics_get_underline_position" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUnderlineThickness(self: *FontMetrics) i32 {
        const cFn = @extern(*const fn (*FontMetrics) callconv(.c) i32, .{ .name = "pango_font_metrics_get_underline_thickness" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *FontMetrics) ?*FontMetrics {
        const cFn = @extern(*const fn (*FontMetrics) callconv(.c) ?*FontMetrics, .{ .name = "pango_font_metrics_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *FontMetrics) void {
        const cFn = @extern(*const fn (*FontMetrics) callconv(.c) void, .{ .name = "pango_font_metrics_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_font_metrics_get_type" });
        return cFn();
    }
};
pub const FontScale = enum(u32) {
    none = 0,
    superscript = 1,
    subscript = 2,
    small_caps = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_font_scale_get_type" });
        return cFn();
    }
};
pub const Fontset = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = FontsetClass;
    parent_instance: GObject.Object,
    pub fn foreach(self: *Fontset, argC_func: core.Closure(FontsetForeachFunc)) void {
        const arg_func: FontsetForeachFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*Fontset, FontsetForeachFunc, ?*anyopaque) callconv(.c) void, .{ .name = "pango_fontset_foreach" });
        const ret = cFn(self, arg_func, @ptrCast(arg_data));
        return ret;
    }
    pub fn getFont(self: *Fontset, arg_wc: u32) *Font {
        const cFn = @extern(*const fn (*Fontset, u32) callconv(.c) *Font, .{ .name = "pango_fontset_get_font" });
        const ret = cFn(self, arg_wc);
        return ret;
    }
    pub fn getMetrics(self: *Fontset) *FontMetrics {
        const cFn = @extern(*const fn (*Fontset) callconv(.c) *FontMetrics, .{ .name = "pango_fontset_get_metrics" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_fontset_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FontsetClass = extern struct {
    parent_class: GObject.ObjectClass,
    get_font: ?*const fn (arg_fontset: *Fontset, arg_wc: u32) callconv(.c) *Font,
    get_metrics: ?*const fn (arg_fontset: *Fontset) callconv(.c) *FontMetrics,
    get_language: ?*const fn (arg_fontset: *Fontset) callconv(.c) *Language,
    foreach: ?*const fn (arg_fontset: *Fontset, arg_func: FontsetForeachFunc, arg_data: ?*anyopaque) callconv(.c) void,
    _pango_reserved1: ?*anyopaque,
    _pango_reserved2: ?*anyopaque,
    _pango_reserved3: ?*anyopaque,
    _pango_reserved4: ?*anyopaque,
};
pub const FontsetForeachFunc = *const fn (arg_fontset: *Fontset, arg_font: *Font, arg_user_data: ?*anyopaque) callconv(.c) bool;
pub const FontsetSimple = struct {
    pub const Parent = Fontset;
    pub const Class = FontsetSimpleClass;
    pub fn new(arg_language: *Language) *FontsetSimple {
        const cFn = @extern(*const fn (*Language) callconv(.c) *FontsetSimple, .{ .name = "pango_fontset_simple_new" });
        const ret = cFn(arg_language);
        return ret;
    }
    pub fn append(self: *FontsetSimple, arg_font: *Font) void {
        const cFn = @extern(*const fn (*FontsetSimple, *Font) callconv(.c) void, .{ .name = "pango_fontset_simple_append" });
        const ret = cFn(self, arg_font);
        return ret;
    }
    pub fn size(self: *FontsetSimple) i32 {
        const cFn = @extern(*const fn (*FontsetSimple) callconv(.c) i32, .{ .name = "pango_fontset_simple_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_fontset_simple_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FontsetSimpleClass = opaque {};
pub const GLYPH_EMPTY = 268435455;
pub const GLYPH_INVALID_INPUT = 4294967295;
pub const GLYPH_UNKNOWN_FLAG = 268435456;
pub const GlyphGeometry = extern struct {
    width: i32,
    x_offset: i32,
    y_offset: i32,
};
pub const GlyphInfo = extern struct {
    glyph: u32,
    geometry: GlyphGeometry,
    attr: GlyphVisAttr,
};
pub const GlyphItem = extern struct {
    item: ?*Item,
    glyphs: ?*GlyphString,
    y_offset: i32,
    start_x_offset: i32,
    end_x_offset: i32,
    pub fn applyAttrs(self: *GlyphItem, arg_text: [*:0]const u8, arg_list: *AttrList) ?*GLib.SList {
        const cFn = @extern(*const fn (*GlyphItem, [*:0]const u8, *AttrList) callconv(.c) ?*GLib.SList, .{ .name = "pango_glyph_item_apply_attrs" });
        const ret = cFn(self, arg_text, arg_list);
        return ret;
    }
    pub fn copy(self: *GlyphItem) ?*GlyphItem {
        const cFn = @extern(*const fn (*GlyphItem) callconv(.c) ?*GlyphItem, .{ .name = "pango_glyph_item_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *GlyphItem) void {
        const cFn = @extern(*const fn (*GlyphItem) callconv(.c) void, .{ .name = "pango_glyph_item_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLogicalWidths(self: *GlyphItem, arg_text: [*:0]const u8, arg_logical_widths: [*]i32) void {
        const cFn = @extern(*const fn (*GlyphItem, [*:0]const u8, [*]i32) callconv(.c) void, .{ .name = "pango_glyph_item_get_logical_widths" });
        const ret = cFn(self, arg_text, arg_logical_widths);
        return ret;
    }
    pub fn letterSpace(self: *GlyphItem, arg_text: [*:0]const u8, arg_log_attrs: [*]LogAttr, arg_letter_spacing: i32) void {
        const cFn = @extern(*const fn (*GlyphItem, [*:0]const u8, [*]LogAttr, i32) callconv(.c) void, .{ .name = "pango_glyph_item_letter_space" });
        const ret = cFn(self, arg_text, arg_log_attrs, arg_letter_spacing);
        return ret;
    }
    pub fn split(self: *GlyphItem, arg_text: [*:0]const u8, arg_split_index: i32) ?*GlyphItem {
        const cFn = @extern(*const fn (*GlyphItem, [*:0]const u8, i32) callconv(.c) ?*GlyphItem, .{ .name = "pango_glyph_item_split" });
        const ret = cFn(self, arg_text, arg_split_index);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_glyph_item_get_type" });
        return cFn();
    }
};
pub const GlyphItemIter = extern struct {
    glyph_item: ?*GlyphItem,
    text: ?[*:0]const u8,
    start_glyph: i32,
    start_index: i32,
    start_char: i32,
    end_glyph: i32,
    end_index: i32,
    end_char: i32,
    pub fn copy(self: *GlyphItemIter) ?*GlyphItemIter {
        const cFn = @extern(*const fn (*GlyphItemIter) callconv(.c) ?*GlyphItemIter, .{ .name = "pango_glyph_item_iter_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *GlyphItemIter) void {
        const cFn = @extern(*const fn (*GlyphItemIter) callconv(.c) void, .{ .name = "pango_glyph_item_iter_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn initEnd(self: *GlyphItemIter, arg_glyph_item: *GlyphItem, arg_text: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*GlyphItemIter, *GlyphItem, [*:0]const u8) callconv(.c) bool, .{ .name = "pango_glyph_item_iter_init_end" });
        const ret = cFn(self, arg_glyph_item, arg_text);
        return ret;
    }
    pub fn initStart(self: *GlyphItemIter, arg_glyph_item: *GlyphItem, arg_text: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*GlyphItemIter, *GlyphItem, [*:0]const u8) callconv(.c) bool, .{ .name = "pango_glyph_item_iter_init_start" });
        const ret = cFn(self, arg_glyph_item, arg_text);
        return ret;
    }
    pub fn nextCluster(self: *GlyphItemIter) bool {
        const cFn = @extern(*const fn (*GlyphItemIter) callconv(.c) bool, .{ .name = "pango_glyph_item_iter_next_cluster" });
        const ret = cFn(self);
        return ret;
    }
    pub fn prevCluster(self: *GlyphItemIter) bool {
        const cFn = @extern(*const fn (*GlyphItemIter) callconv(.c) bool, .{ .name = "pango_glyph_item_iter_prev_cluster" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_glyph_item_iter_get_type" });
        return cFn();
    }
};
pub const GlyphString = extern struct {
    num_glyphs: i32,
    glyphs: ?[*]GlyphInfo,
    log_clusters: ?*i32,
    space: i32,
    pub fn new() *GlyphString {
        const cFn = @extern(*const fn () callconv(.c) *GlyphString, .{ .name = "pango_glyph_string_new" });
        const ret = cFn();
        return ret;
    }
    pub fn copy(self: *GlyphString) ?*GlyphString {
        const cFn = @extern(*const fn (*GlyphString) callconv(.c) ?*GlyphString, .{ .name = "pango_glyph_string_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn extents(self: *GlyphString, arg_font: *Font, arg_ink_rect: ?*Rectangle, arg_logical_rect: ?*Rectangle) void {
        const cFn = @extern(*const fn (*GlyphString, *Font, ?*Rectangle, ?*Rectangle) callconv(.c) void, .{ .name = "pango_glyph_string_extents" });
        const ret = cFn(self, arg_font, arg_ink_rect, arg_logical_rect);
        return ret;
    }
    pub fn extentsRange(self: *GlyphString, arg_start: i32, arg_end: i32, arg_font: *Font, arg_ink_rect: ?*Rectangle, arg_logical_rect: ?*Rectangle) void {
        const cFn = @extern(*const fn (*GlyphString, i32, i32, *Font, ?*Rectangle, ?*Rectangle) callconv(.c) void, .{ .name = "pango_glyph_string_extents_range" });
        const ret = cFn(self, arg_start, arg_end, arg_font, arg_ink_rect, arg_logical_rect);
        return ret;
    }
    pub fn free(self: *GlyphString) void {
        const cFn = @extern(*const fn (*GlyphString) callconv(.c) void, .{ .name = "pango_glyph_string_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLogicalWidths(self: *GlyphString, arg_text: [*:0]const u8, arg_length: i32, arg_embedding_level: i32, arg_logical_widths: [*]i32) void {
        const cFn = @extern(*const fn (*GlyphString, [*:0]const u8, i32, i32, [*]i32) callconv(.c) void, .{ .name = "pango_glyph_string_get_logical_widths" });
        const ret = cFn(self, arg_text, arg_length, arg_embedding_level, arg_logical_widths);
        return ret;
    }
    pub fn getWidth(self: *GlyphString) i32 {
        const cFn = @extern(*const fn (*GlyphString) callconv(.c) i32, .{ .name = "pango_glyph_string_get_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn indexToX(self: *GlyphString, arg_text: [*:0]const u8, arg_length: i32, arg_analysis: *Analysis, arg_index_: i32, arg_trailing: bool) i32 {
        var argO_x_pos: i32 = undefined;
        const arg_x_pos: ?*i32 = &argO_x_pos;
        const cFn = @extern(*const fn (*GlyphString, [*:0]const u8, i32, *Analysis, i32, bool, ?*i32) callconv(.c) void, .{ .name = "pango_glyph_string_index_to_x" });
        const ret = cFn(self, arg_text, arg_length, arg_analysis, arg_index_, arg_trailing, arg_x_pos);
        _ = ret;
        return argO_x_pos;
    }
    pub fn indexToXFull(self: *GlyphString, arg_text: [*:0]const u8, arg_length: i32, arg_analysis: *Analysis, arg_attrs: ?*LogAttr, arg_index_: i32, arg_trailing: bool) i32 {
        var argO_x_pos: i32 = undefined;
        const arg_x_pos: ?*i32 = &argO_x_pos;
        const cFn = @extern(*const fn (*GlyphString, [*:0]const u8, i32, *Analysis, ?*LogAttr, i32, bool, ?*i32) callconv(.c) void, .{ .name = "pango_glyph_string_index_to_x_full" });
        const ret = cFn(self, arg_text, arg_length, arg_analysis, arg_attrs, arg_index_, arg_trailing, arg_x_pos);
        _ = ret;
        return argO_x_pos;
    }
    pub fn setSize(self: *GlyphString, arg_new_len: i32) void {
        const cFn = @extern(*const fn (*GlyphString, i32) callconv(.c) void, .{ .name = "pango_glyph_string_set_size" });
        const ret = cFn(self, arg_new_len);
        return ret;
    }
    pub fn xToIndex(self: *GlyphString, arg_text: [*:0]const u8, arg_length: i32, arg_analysis: *Analysis, arg_x_pos: i32) struct {
        index_: i32,
        trailing: i32,
    } {
        var argO_index_: i32 = undefined;
        const arg_index_: ?*i32 = &argO_index_;
        var argO_trailing: i32 = undefined;
        const arg_trailing: ?*i32 = &argO_trailing;
        const cFn = @extern(*const fn (*GlyphString, [*:0]const u8, i32, *Analysis, i32, ?*i32, ?*i32) callconv(.c) void, .{ .name = "pango_glyph_string_x_to_index" });
        const ret = cFn(self, arg_text, arg_length, arg_analysis, arg_x_pos, arg_index_, arg_trailing);
        _ = ret;
        return .{ .index_ = argO_index_, .trailing = argO_trailing };
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_glyph_string_get_type" });
        return cFn();
    }
};
pub const GlyphVisAttr = extern struct {
    is_cluster_start: u32,
};
pub const Gravity = enum(u32) {
    south = 0,
    east = 1,
    north = 2,
    west = 3,
    auto = 4,
    pub fn getForMatrix(arg_matrix: ?*Matrix) Gravity {
        const cFn = @extern(*const fn (?*Matrix) callconv(.c) Gravity, .{ .name = "pango_gravity_get_for_matrix" });
        const ret = cFn(arg_matrix);
        return ret;
    }
    pub fn getForScript(arg_script: Script, arg_base_gravity: Gravity, arg_hint: GravityHint) Gravity {
        const cFn = @extern(*const fn (Script, Gravity, GravityHint) callconv(.c) Gravity, .{ .name = "pango_gravity_get_for_script" });
        const ret = cFn(arg_script, arg_base_gravity, arg_hint);
        return ret;
    }
    pub fn getForScriptAndWidth(arg_script: Script, arg_wide: bool, arg_base_gravity: Gravity, arg_hint: GravityHint) Gravity {
        const cFn = @extern(*const fn (Script, bool, Gravity, GravityHint) callconv(.c) Gravity, .{ .name = "pango_gravity_get_for_script_and_width" });
        const ret = cFn(arg_script, arg_wide, arg_base_gravity, arg_hint);
        return ret;
    }
    pub fn toRotation(arg_gravity: Gravity) f64 {
        const cFn = @extern(*const fn (Gravity) callconv(.c) f64, .{ .name = "pango_gravity_to_rotation" });
        const ret = cFn(arg_gravity);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_gravity_get_type" });
        return cFn();
    }
};
pub const GravityHint = enum(u32) {
    natural = 0,
    strong = 1,
    line = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_gravity_hint_get_type" });
        return cFn();
    }
};
pub const Item = extern struct {
    offset: i32,
    length: i32,
    num_chars: i32,
    analysis: Analysis,
    pub fn new() *Item {
        const cFn = @extern(*const fn () callconv(.c) *Item, .{ .name = "pango_item_new" });
        const ret = cFn();
        return ret;
    }
    pub fn applyAttrs(self: *Item, arg_iter: *AttrIterator) void {
        const cFn = @extern(*const fn (*Item, *AttrIterator) callconv(.c) void, .{ .name = "pango_item_apply_attrs" });
        const ret = cFn(self, arg_iter);
        return ret;
    }
    pub fn copy(self: *Item) ?*Item {
        const cFn = @extern(*const fn (*Item) callconv(.c) ?*Item, .{ .name = "pango_item_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *Item) void {
        const cFn = @extern(*const fn (*Item) callconv(.c) void, .{ .name = "pango_item_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCharOffset(self: *Item) i32 {
        const cFn = @extern(*const fn (*Item) callconv(.c) i32, .{ .name = "pango_item_get_char_offset" });
        const ret = cFn(self);
        return ret;
    }
    pub fn split(self: *Item, arg_split_index: i32, arg_split_offset: i32) *Item {
        const cFn = @extern(*const fn (*Item, i32, i32) callconv(.c) *Item, .{ .name = "pango_item_split" });
        const ret = cFn(self, arg_split_index, arg_split_offset);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_item_get_type" });
        return cFn();
    }
};
pub const Language = opaque {
    pub fn getSampleString(self: *Language) [*:0]u8 {
        const cFn = @extern(*const fn (*Language) callconv(.c) [*:0]u8, .{ .name = "pango_language_get_sample_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getScripts(self: *Language) []Script {
        var argO_num_scripts: i32 = undefined;
        const arg_num_scripts: ?*i32 = &argO_num_scripts;
        const cFn = @extern(*const fn (*Language, ?*i32) callconv(.c) ?[*]Script, .{ .name = "pango_language_get_scripts" });
        const ret = cFn(self, arg_num_scripts);
        return ret[0..@intCast(argO_num_scripts)];
    }
    pub fn includesScript(self: *Language, arg_script: Script) bool {
        const cFn = @extern(*const fn (*Language, Script) callconv(.c) bool, .{ .name = "pango_language_includes_script" });
        const ret = cFn(self, arg_script);
        return ret;
    }
    pub fn matches(self: *Language, arg_range_list: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*Language, [*:0]const u8) callconv(.c) bool, .{ .name = "pango_language_matches" });
        const ret = cFn(self, arg_range_list);
        return ret;
    }
    pub fn toString(self: *Language) [*:0]u8 {
        const cFn = @extern(*const fn (*Language) callconv(.c) [*:0]u8, .{ .name = "pango_language_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn fromString(arg_language: ?[*:0]const u8) ?*Language {
        const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) ?*Language, .{ .name = "pango_language_from_string" });
        const ret = cFn(arg_language);
        return ret;
    }
    pub fn getDefault() *Language {
        const cFn = @extern(*const fn () callconv(.c) *Language, .{ .name = "pango_language_get_default" });
        const ret = cFn();
        return ret;
    }
    pub fn getPreferred() ?[*:null]?*Language {
        const cFn = @extern(*const fn () callconv(.c) ?[*:null]?*Language, .{ .name = "pango_language_get_preferred" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_language_get_type" });
        return cFn();
    }
};
pub const Layout = struct {
    pub const Parent = GObject.Object;
    pub const Class = LayoutClass;
    pub fn new(arg_context: *Context) *Layout {
        const cFn = @extern(*const fn (*Context) callconv(.c) *Layout, .{ .name = "pango_layout_new" });
        const ret = cFn(arg_context);
        return ret;
    }
    pub fn deserialize(arg_context: *Context, arg_bytes: *GLib.Bytes, arg_flags: LayoutDeserializeFlags, arg_error: *?*GLib.Error) error{GError}!?*Layout {
        const cFn = @extern(*const fn (*Context, *GLib.Bytes, LayoutDeserializeFlags, *?*GLib.Error) callconv(.c) ?*Layout, .{ .name = "pango_layout_deserialize" });
        const ret = cFn(arg_context, arg_bytes, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn contextChanged(self: *Layout) void {
        const cFn = @extern(*const fn (*Layout) callconv(.c) void, .{ .name = "pango_layout_context_changed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn copy(self: *Layout) *Layout {
        const cFn = @extern(*const fn (*Layout) callconv(.c) *Layout, .{ .name = "pango_layout_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getAlignment(self: *Layout) Alignment {
        const cFn = @extern(*const fn (*Layout) callconv(.c) Alignment, .{ .name = "pango_layout_get_alignment" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getAttributes(self: *Layout) ?*AttrList {
        const cFn = @extern(*const fn (*Layout) callconv(.c) ?*AttrList, .{ .name = "pango_layout_get_attributes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getAutoDir(self: *Layout) bool {
        const cFn = @extern(*const fn (*Layout) callconv(.c) bool, .{ .name = "pango_layout_get_auto_dir" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBaseline(self: *Layout) i32 {
        const cFn = @extern(*const fn (*Layout) callconv(.c) i32, .{ .name = "pango_layout_get_baseline" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCaretPos(self: *Layout, arg_index_: i32, arg_strong_pos: ?*Rectangle, arg_weak_pos: ?*Rectangle) void {
        const cFn = @extern(*const fn (*Layout, i32, ?*Rectangle, ?*Rectangle) callconv(.c) void, .{ .name = "pango_layout_get_caret_pos" });
        const ret = cFn(self, arg_index_, arg_strong_pos, arg_weak_pos);
        return ret;
    }
    pub fn getCharacterCount(self: *Layout) i32 {
        const cFn = @extern(*const fn (*Layout) callconv(.c) i32, .{ .name = "pango_layout_get_character_count" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getContext(self: *Layout) *Context {
        const cFn = @extern(*const fn (*Layout) callconv(.c) *Context, .{ .name = "pango_layout_get_context" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCursorPos(self: *Layout, arg_index_: i32, arg_strong_pos: ?*Rectangle, arg_weak_pos: ?*Rectangle) void {
        const cFn = @extern(*const fn (*Layout, i32, ?*Rectangle, ?*Rectangle) callconv(.c) void, .{ .name = "pango_layout_get_cursor_pos" });
        const ret = cFn(self, arg_index_, arg_strong_pos, arg_weak_pos);
        return ret;
    }
    pub fn getDirection(self: *Layout, arg_index: i32) Direction {
        const cFn = @extern(*const fn (*Layout, i32) callconv(.c) Direction, .{ .name = "pango_layout_get_direction" });
        const ret = cFn(self, arg_index);
        return ret;
    }
    pub fn getEllipsize(self: *Layout) EllipsizeMode {
        const cFn = @extern(*const fn (*Layout) callconv(.c) EllipsizeMode, .{ .name = "pango_layout_get_ellipsize" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getExtents(self: *Layout, arg_ink_rect: ?*Rectangle, arg_logical_rect: ?*Rectangle) void {
        const cFn = @extern(*const fn (*Layout, ?*Rectangle, ?*Rectangle) callconv(.c) void, .{ .name = "pango_layout_get_extents" });
        const ret = cFn(self, arg_ink_rect, arg_logical_rect);
        return ret;
    }
    pub fn getFontDescription(self: *Layout) ?*FontDescription {
        const cFn = @extern(*const fn (*Layout) callconv(.c) ?*FontDescription, .{ .name = "pango_layout_get_font_description" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHeight(self: *Layout) i32 {
        const cFn = @extern(*const fn (*Layout) callconv(.c) i32, .{ .name = "pango_layout_get_height" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIndent(self: *Layout) i32 {
        const cFn = @extern(*const fn (*Layout) callconv(.c) i32, .{ .name = "pango_layout_get_indent" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIter(self: *Layout) *LayoutIter {
        const cFn = @extern(*const fn (*Layout) callconv(.c) *LayoutIter, .{ .name = "pango_layout_get_iter" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getJustify(self: *Layout) bool {
        const cFn = @extern(*const fn (*Layout) callconv(.c) bool, .{ .name = "pango_layout_get_justify" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getJustifyLastLine(self: *Layout) bool {
        const cFn = @extern(*const fn (*Layout) callconv(.c) bool, .{ .name = "pango_layout_get_justify_last_line" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLine(self: *Layout, arg_line: i32) ?*LayoutLine {
        const cFn = @extern(*const fn (*Layout, i32) callconv(.c) ?*LayoutLine, .{ .name = "pango_layout_get_line" });
        const ret = cFn(self, arg_line);
        return ret;
    }
    pub fn getLineCount(self: *Layout) i32 {
        const cFn = @extern(*const fn (*Layout) callconv(.c) i32, .{ .name = "pango_layout_get_line_count" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLineReadonly(self: *Layout, arg_line: i32) ?*LayoutLine {
        const cFn = @extern(*const fn (*Layout, i32) callconv(.c) ?*LayoutLine, .{ .name = "pango_layout_get_line_readonly" });
        const ret = cFn(self, arg_line);
        return ret;
    }
    pub fn getLineSpacing(self: *Layout) f32 {
        const cFn = @extern(*const fn (*Layout) callconv(.c) f32, .{ .name = "pango_layout_get_line_spacing" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLines(self: *Layout) ?*GLib.SList {
        const cFn = @extern(*const fn (*Layout) callconv(.c) ?*GLib.SList, .{ .name = "pango_layout_get_lines" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLinesReadonly(self: *Layout) ?*GLib.SList {
        const cFn = @extern(*const fn (*Layout) callconv(.c) ?*GLib.SList, .{ .name = "pango_layout_get_lines_readonly" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLogAttrs(self: *Layout) []LogAttr {
        var argO_attrs: [*]LogAttr = undefined;
        const arg_attrs: *[*]LogAttr = &argO_attrs;
        var argO_n_attrs: i32 = undefined;
        const arg_n_attrs: *i32 = &argO_n_attrs;
        const cFn = @extern(*const fn (*Layout, *[*]LogAttr, *i32) callconv(.c) void, .{ .name = "pango_layout_get_log_attrs" });
        const ret = cFn(self, arg_attrs, arg_n_attrs);
        _ = ret;
        return argO_attrs[0..@intCast(argO_n_attrs)];
    }
    pub fn getLogAttrsReadonly(self: *Layout) []LogAttr {
        var argO_n_attrs: i32 = undefined;
        const arg_n_attrs: *i32 = &argO_n_attrs;
        const cFn = @extern(*const fn (*Layout, *i32) callconv(.c) [*]LogAttr, .{ .name = "pango_layout_get_log_attrs_readonly" });
        const ret = cFn(self, arg_n_attrs);
        return ret[0..@intCast(argO_n_attrs)];
    }
    pub fn getPixelExtents(self: *Layout, arg_ink_rect: ?*Rectangle, arg_logical_rect: ?*Rectangle) void {
        const cFn = @extern(*const fn (*Layout, ?*Rectangle, ?*Rectangle) callconv(.c) void, .{ .name = "pango_layout_get_pixel_extents" });
        const ret = cFn(self, arg_ink_rect, arg_logical_rect);
        return ret;
    }
    pub fn getPixelSize(self: *Layout) struct {
        width: i32,
        height: i32,
    } {
        var argO_width: i32 = undefined;
        const arg_width: ?*i32 = &argO_width;
        var argO_height: i32 = undefined;
        const arg_height: ?*i32 = &argO_height;
        const cFn = @extern(*const fn (*Layout, ?*i32, ?*i32) callconv(.c) void, .{ .name = "pango_layout_get_pixel_size" });
        const ret = cFn(self, arg_width, arg_height);
        _ = ret;
        return .{ .width = argO_width, .height = argO_height };
    }
    pub fn getSerial(self: *Layout) u32 {
        const cFn = @extern(*const fn (*Layout) callconv(.c) u32, .{ .name = "pango_layout_get_serial" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSingleParagraphMode(self: *Layout) bool {
        const cFn = @extern(*const fn (*Layout) callconv(.c) bool, .{ .name = "pango_layout_get_single_paragraph_mode" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSize(self: *Layout) struct {
        width: i32,
        height: i32,
    } {
        var argO_width: i32 = undefined;
        const arg_width: ?*i32 = &argO_width;
        var argO_height: i32 = undefined;
        const arg_height: ?*i32 = &argO_height;
        const cFn = @extern(*const fn (*Layout, ?*i32, ?*i32) callconv(.c) void, .{ .name = "pango_layout_get_size" });
        const ret = cFn(self, arg_width, arg_height);
        _ = ret;
        return .{ .width = argO_width, .height = argO_height };
    }
    pub fn getSpacing(self: *Layout) i32 {
        const cFn = @extern(*const fn (*Layout) callconv(.c) i32, .{ .name = "pango_layout_get_spacing" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTabs(self: *Layout) ?*TabArray {
        const cFn = @extern(*const fn (*Layout) callconv(.c) ?*TabArray, .{ .name = "pango_layout_get_tabs" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getText(self: *Layout) [*:0]u8 {
        const cFn = @extern(*const fn (*Layout) callconv(.c) [*:0]u8, .{ .name = "pango_layout_get_text" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUnknownGlyphsCount(self: *Layout) i32 {
        const cFn = @extern(*const fn (*Layout) callconv(.c) i32, .{ .name = "pango_layout_get_unknown_glyphs_count" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWidth(self: *Layout) i32 {
        const cFn = @extern(*const fn (*Layout) callconv(.c) i32, .{ .name = "pango_layout_get_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWrap(self: *Layout) WrapMode {
        const cFn = @extern(*const fn (*Layout) callconv(.c) WrapMode, .{ .name = "pango_layout_get_wrap" });
        const ret = cFn(self);
        return ret;
    }
    pub fn indexToLineX(self: *Layout, arg_index_: i32, arg_trailing: bool) struct {
        line: i32,
        x_pos: i32,
    } {
        var argO_line: i32 = undefined;
        const arg_line: ?*i32 = &argO_line;
        var argO_x_pos: i32 = undefined;
        const arg_x_pos: ?*i32 = &argO_x_pos;
        const cFn = @extern(*const fn (*Layout, i32, bool, ?*i32, ?*i32) callconv(.c) void, .{ .name = "pango_layout_index_to_line_x" });
        const ret = cFn(self, arg_index_, arg_trailing, arg_line, arg_x_pos);
        _ = ret;
        return .{ .line = argO_line, .x_pos = argO_x_pos };
    }
    pub fn indexToPos(self: *Layout, arg_index_: i32, arg_pos: *Rectangle) void {
        const cFn = @extern(*const fn (*Layout, i32, *Rectangle) callconv(.c) void, .{ .name = "pango_layout_index_to_pos" });
        const ret = cFn(self, arg_index_, arg_pos);
        return ret;
    }
    pub fn isEllipsized(self: *Layout) bool {
        const cFn = @extern(*const fn (*Layout) callconv(.c) bool, .{ .name = "pango_layout_is_ellipsized" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isWrapped(self: *Layout) bool {
        const cFn = @extern(*const fn (*Layout) callconv(.c) bool, .{ .name = "pango_layout_is_wrapped" });
        const ret = cFn(self);
        return ret;
    }
    pub fn moveCursorVisually(self: *Layout, arg_strong: bool, arg_old_index: i32, arg_old_trailing: i32, arg_direction: i32) struct {
        new_index: i32,
        new_trailing: i32,
    } {
        var argO_new_index: i32 = undefined;
        const arg_new_index: *i32 = &argO_new_index;
        var argO_new_trailing: i32 = undefined;
        const arg_new_trailing: *i32 = &argO_new_trailing;
        const cFn = @extern(*const fn (*Layout, bool, i32, i32, i32, *i32, *i32) callconv(.c) void, .{ .name = "pango_layout_move_cursor_visually" });
        const ret = cFn(self, arg_strong, arg_old_index, arg_old_trailing, arg_direction, arg_new_index, arg_new_trailing);
        _ = ret;
        return .{ .new_index = argO_new_index, .new_trailing = argO_new_trailing };
    }
    pub fn serialize(self: *Layout, arg_flags: LayoutSerializeFlags) *GLib.Bytes {
        const cFn = @extern(*const fn (*Layout, LayoutSerializeFlags) callconv(.c) *GLib.Bytes, .{ .name = "pango_layout_serialize" });
        const ret = cFn(self, arg_flags);
        return ret;
    }
    pub fn setAlignment(self: *Layout, arg_alignment: Alignment) void {
        const cFn = @extern(*const fn (*Layout, Alignment) callconv(.c) void, .{ .name = "pango_layout_set_alignment" });
        const ret = cFn(self, arg_alignment);
        return ret;
    }
    pub fn setAttributes(self: *Layout, arg_attrs: ?*AttrList) void {
        const cFn = @extern(*const fn (*Layout, ?*AttrList) callconv(.c) void, .{ .name = "pango_layout_set_attributes" });
        const ret = cFn(self, arg_attrs);
        return ret;
    }
    pub fn setAutoDir(self: *Layout, arg_auto_dir: bool) void {
        const cFn = @extern(*const fn (*Layout, bool) callconv(.c) void, .{ .name = "pango_layout_set_auto_dir" });
        const ret = cFn(self, arg_auto_dir);
        return ret;
    }
    pub fn setEllipsize(self: *Layout, arg_ellipsize: EllipsizeMode) void {
        const cFn = @extern(*const fn (*Layout, EllipsizeMode) callconv(.c) void, .{ .name = "pango_layout_set_ellipsize" });
        const ret = cFn(self, arg_ellipsize);
        return ret;
    }
    pub fn setFontDescription(self: *Layout, arg_desc: ?*FontDescription) void {
        const cFn = @extern(*const fn (*Layout, ?*FontDescription) callconv(.c) void, .{ .name = "pango_layout_set_font_description" });
        const ret = cFn(self, arg_desc);
        return ret;
    }
    pub fn setHeight(self: *Layout, arg_height: i32) void {
        const cFn = @extern(*const fn (*Layout, i32) callconv(.c) void, .{ .name = "pango_layout_set_height" });
        const ret = cFn(self, arg_height);
        return ret;
    }
    pub fn setIndent(self: *Layout, arg_indent: i32) void {
        const cFn = @extern(*const fn (*Layout, i32) callconv(.c) void, .{ .name = "pango_layout_set_indent" });
        const ret = cFn(self, arg_indent);
        return ret;
    }
    pub fn setJustify(self: *Layout, arg_justify: bool) void {
        const cFn = @extern(*const fn (*Layout, bool) callconv(.c) void, .{ .name = "pango_layout_set_justify" });
        const ret = cFn(self, arg_justify);
        return ret;
    }
    pub fn setJustifyLastLine(self: *Layout, arg_justify: bool) void {
        const cFn = @extern(*const fn (*Layout, bool) callconv(.c) void, .{ .name = "pango_layout_set_justify_last_line" });
        const ret = cFn(self, arg_justify);
        return ret;
    }
    pub fn setLineSpacing(self: *Layout, arg_factor: f32) void {
        const cFn = @extern(*const fn (*Layout, f32) callconv(.c) void, .{ .name = "pango_layout_set_line_spacing" });
        const ret = cFn(self, arg_factor);
        return ret;
    }
    pub fn setMarkup(self: *Layout, arg_markup: [*:0]const u8, arg_length: i32) void {
        const cFn = @extern(*const fn (*Layout, [*:0]const u8, i32) callconv(.c) void, .{ .name = "pango_layout_set_markup" });
        const ret = cFn(self, arg_markup, arg_length);
        return ret;
    }
    pub fn setMarkupWithAccel(self: *Layout, arg_markup: [*:0]const u8, arg_length: i32, arg_accel_marker: u32) u32 {
        var argO_accel_char: u32 = undefined;
        const arg_accel_char: ?*u32 = &argO_accel_char;
        const cFn = @extern(*const fn (*Layout, [*:0]const u8, i32, u32, ?*u32) callconv(.c) void, .{ .name = "pango_layout_set_markup_with_accel" });
        const ret = cFn(self, arg_markup, arg_length, arg_accel_marker, arg_accel_char);
        _ = ret;
        return argO_accel_char;
    }
    pub fn setSingleParagraphMode(self: *Layout, arg_setting: bool) void {
        const cFn = @extern(*const fn (*Layout, bool) callconv(.c) void, .{ .name = "pango_layout_set_single_paragraph_mode" });
        const ret = cFn(self, arg_setting);
        return ret;
    }
    pub fn setSpacing(self: *Layout, arg_spacing: i32) void {
        const cFn = @extern(*const fn (*Layout, i32) callconv(.c) void, .{ .name = "pango_layout_set_spacing" });
        const ret = cFn(self, arg_spacing);
        return ret;
    }
    pub fn setTabs(self: *Layout, arg_tabs: ?*TabArray) void {
        const cFn = @extern(*const fn (*Layout, ?*TabArray) callconv(.c) void, .{ .name = "pango_layout_set_tabs" });
        const ret = cFn(self, arg_tabs);
        return ret;
    }
    pub fn setText(self: *Layout, arg_text: [*:0]const u8, arg_length: i32) void {
        const cFn = @extern(*const fn (*Layout, [*:0]const u8, i32) callconv(.c) void, .{ .name = "pango_layout_set_text" });
        const ret = cFn(self, arg_text, arg_length);
        return ret;
    }
    pub fn setWidth(self: *Layout, arg_width: i32) void {
        const cFn = @extern(*const fn (*Layout, i32) callconv(.c) void, .{ .name = "pango_layout_set_width" });
        const ret = cFn(self, arg_width);
        return ret;
    }
    pub fn setWrap(self: *Layout, arg_wrap: WrapMode) void {
        const cFn = @extern(*const fn (*Layout, WrapMode) callconv(.c) void, .{ .name = "pango_layout_set_wrap" });
        const ret = cFn(self, arg_wrap);
        return ret;
    }
    pub fn writeToFile(self: *Layout, arg_flags: LayoutSerializeFlags, arg_filename: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Layout, LayoutSerializeFlags, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "pango_layout_write_to_file" });
        const ret = cFn(self, arg_flags, arg_filename, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn xyToIndex(self: *Layout, arg_x: i32, arg_y: i32) struct {
        ret: bool,
        index_: i32,
        trailing: i32,
    } {
        var argO_index_: i32 = undefined;
        const arg_index_: *i32 = &argO_index_;
        var argO_trailing: i32 = undefined;
        const arg_trailing: *i32 = &argO_trailing;
        const cFn = @extern(*const fn (*Layout, i32, i32, *i32, *i32) callconv(.c) bool, .{ .name = "pango_layout_xy_to_index" });
        const ret = cFn(self, arg_x, arg_y, arg_index_, arg_trailing);
        return .{ .ret = ret, .index_ = argO_index_, .trailing = argO_trailing };
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_layout_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const LayoutClass = opaque {};
pub const LayoutDeserializeError = enum(u32) {
    invalid = 0,
    invalid_value = 1,
    missing_value = 2,
    pub fn quark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "pango_layout_deserialize_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_layout_deserialize_error_get_type" });
        return cFn();
    }
};
pub const LayoutDeserializeFlags = packed struct(u32) {
    context: bool = false,
    _: u31 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_layout_deserialize_flags_get_type" });
        return cFn();
    }
};
pub const LayoutIter = opaque {
    pub fn atLastLine(self: *LayoutIter) bool {
        const cFn = @extern(*const fn (*LayoutIter) callconv(.c) bool, .{ .name = "pango_layout_iter_at_last_line" });
        const ret = cFn(self);
        return ret;
    }
    pub fn copy(self: *LayoutIter) ?*LayoutIter {
        const cFn = @extern(*const fn (*LayoutIter) callconv(.c) ?*LayoutIter, .{ .name = "pango_layout_iter_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *LayoutIter) void {
        const cFn = @extern(*const fn (*LayoutIter) callconv(.c) void, .{ .name = "pango_layout_iter_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBaseline(self: *LayoutIter) i32 {
        const cFn = @extern(*const fn (*LayoutIter) callconv(.c) i32, .{ .name = "pango_layout_iter_get_baseline" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCharExtents(self: *LayoutIter, arg_logical_rect: *Rectangle) void {
        const cFn = @extern(*const fn (*LayoutIter, *Rectangle) callconv(.c) void, .{ .name = "pango_layout_iter_get_char_extents" });
        const ret = cFn(self, arg_logical_rect);
        return ret;
    }
    pub fn getClusterExtents(self: *LayoutIter, arg_ink_rect: ?*Rectangle, arg_logical_rect: ?*Rectangle) void {
        const cFn = @extern(*const fn (*LayoutIter, ?*Rectangle, ?*Rectangle) callconv(.c) void, .{ .name = "pango_layout_iter_get_cluster_extents" });
        const ret = cFn(self, arg_ink_rect, arg_logical_rect);
        return ret;
    }
    pub fn getIndex(self: *LayoutIter) i32 {
        const cFn = @extern(*const fn (*LayoutIter) callconv(.c) i32, .{ .name = "pango_layout_iter_get_index" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLayout(self: *LayoutIter) ?*Layout {
        const cFn = @extern(*const fn (*LayoutIter) callconv(.c) ?*Layout, .{ .name = "pango_layout_iter_get_layout" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLayoutExtents(self: *LayoutIter, arg_ink_rect: ?*Rectangle, arg_logical_rect: ?*Rectangle) void {
        const cFn = @extern(*const fn (*LayoutIter, ?*Rectangle, ?*Rectangle) callconv(.c) void, .{ .name = "pango_layout_iter_get_layout_extents" });
        const ret = cFn(self, arg_ink_rect, arg_logical_rect);
        return ret;
    }
    pub fn getLine(self: *LayoutIter) ?*LayoutLine {
        const cFn = @extern(*const fn (*LayoutIter) callconv(.c) ?*LayoutLine, .{ .name = "pango_layout_iter_get_line" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLineExtents(self: *LayoutIter, arg_ink_rect: ?*Rectangle, arg_logical_rect: ?*Rectangle) void {
        const cFn = @extern(*const fn (*LayoutIter, ?*Rectangle, ?*Rectangle) callconv(.c) void, .{ .name = "pango_layout_iter_get_line_extents" });
        const ret = cFn(self, arg_ink_rect, arg_logical_rect);
        return ret;
    }
    pub fn getLineReadonly(self: *LayoutIter) ?*LayoutLine {
        const cFn = @extern(*const fn (*LayoutIter) callconv(.c) ?*LayoutLine, .{ .name = "pango_layout_iter_get_line_readonly" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLineYrange(self: *LayoutIter) struct {
        y0_: i32,
        y1_: i32,
    } {
        var argO_y0_: i32 = undefined;
        const arg_y0_: ?*i32 = &argO_y0_;
        var argO_y1_: i32 = undefined;
        const arg_y1_: ?*i32 = &argO_y1_;
        const cFn = @extern(*const fn (*LayoutIter, ?*i32, ?*i32) callconv(.c) void, .{ .name = "pango_layout_iter_get_line_yrange" });
        const ret = cFn(self, arg_y0_, arg_y1_);
        _ = ret;
        return .{ .y0_ = argO_y0_, .y1_ = argO_y1_ };
    }
    pub fn getRun(self: *LayoutIter) ?*GlyphItem {
        const cFn = @extern(*const fn (*LayoutIter) callconv(.c) ?*GlyphItem, .{ .name = "pango_layout_iter_get_run" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRunBaseline(self: *LayoutIter) i32 {
        const cFn = @extern(*const fn (*LayoutIter) callconv(.c) i32, .{ .name = "pango_layout_iter_get_run_baseline" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRunExtents(self: *LayoutIter, arg_ink_rect: ?*Rectangle, arg_logical_rect: ?*Rectangle) void {
        const cFn = @extern(*const fn (*LayoutIter, ?*Rectangle, ?*Rectangle) callconv(.c) void, .{ .name = "pango_layout_iter_get_run_extents" });
        const ret = cFn(self, arg_ink_rect, arg_logical_rect);
        return ret;
    }
    pub fn getRunReadonly(self: *LayoutIter) ?*GlyphItem {
        const cFn = @extern(*const fn (*LayoutIter) callconv(.c) ?*GlyphItem, .{ .name = "pango_layout_iter_get_run_readonly" });
        const ret = cFn(self);
        return ret;
    }
    pub fn nextChar(self: *LayoutIter) bool {
        const cFn = @extern(*const fn (*LayoutIter) callconv(.c) bool, .{ .name = "pango_layout_iter_next_char" });
        const ret = cFn(self);
        return ret;
    }
    pub fn nextCluster(self: *LayoutIter) bool {
        const cFn = @extern(*const fn (*LayoutIter) callconv(.c) bool, .{ .name = "pango_layout_iter_next_cluster" });
        const ret = cFn(self);
        return ret;
    }
    pub fn nextLine(self: *LayoutIter) bool {
        const cFn = @extern(*const fn (*LayoutIter) callconv(.c) bool, .{ .name = "pango_layout_iter_next_line" });
        const ret = cFn(self);
        return ret;
    }
    pub fn nextRun(self: *LayoutIter) bool {
        const cFn = @extern(*const fn (*LayoutIter) callconv(.c) bool, .{ .name = "pango_layout_iter_next_run" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_layout_iter_get_type" });
        return cFn();
    }
};
pub const LayoutLine = extern struct {
    layout: ?*Layout,
    start_index: i32,
    length: i32,
    runs: ?*GLib.SList,
    _24: packed struct(u32) {
        _is_paragraph_start: bool,
        resolved_dir: u3,
        _: u28,
    },
    pub fn getExtents(self: *LayoutLine, arg_ink_rect: ?*Rectangle, arg_logical_rect: ?*Rectangle) void {
        const cFn = @extern(*const fn (*LayoutLine, ?*Rectangle, ?*Rectangle) callconv(.c) void, .{ .name = "pango_layout_line_get_extents" });
        const ret = cFn(self, arg_ink_rect, arg_logical_rect);
        return ret;
    }
    pub fn getHeight(self: *LayoutLine) i32 {
        var argO_height: i32 = undefined;
        const arg_height: ?*i32 = &argO_height;
        const cFn = @extern(*const fn (*LayoutLine, ?*i32) callconv(.c) void, .{ .name = "pango_layout_line_get_height" });
        const ret = cFn(self, arg_height);
        _ = ret;
        return argO_height;
    }
    pub fn getLength(self: *LayoutLine) i32 {
        const cFn = @extern(*const fn (*LayoutLine) callconv(.c) i32, .{ .name = "pango_layout_line_get_length" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPixelExtents(self: *LayoutLine, arg_ink_rect: ?*Rectangle, arg_logical_rect: ?*Rectangle) void {
        const cFn = @extern(*const fn (*LayoutLine, ?*Rectangle, ?*Rectangle) callconv(.c) void, .{ .name = "pango_layout_line_get_pixel_extents" });
        const ret = cFn(self, arg_ink_rect, arg_logical_rect);
        return ret;
    }
    pub fn getResolvedDirection(self: *LayoutLine) Direction {
        const cFn = @extern(*const fn (*LayoutLine) callconv(.c) Direction, .{ .name = "pango_layout_line_get_resolved_direction" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStartIndex(self: *LayoutLine) i32 {
        const cFn = @extern(*const fn (*LayoutLine) callconv(.c) i32, .{ .name = "pango_layout_line_get_start_index" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getXRanges(self: *LayoutLine, arg_start_index: i32, arg_end_index: i32) []i32 {
        var argO_ranges: [*]i32 = undefined;
        const arg_ranges: *[*]i32 = &argO_ranges;
        var argO_n_ranges: i32 = undefined;
        const arg_n_ranges: *i32 = &argO_n_ranges;
        const cFn = @extern(*const fn (*LayoutLine, i32, i32, *[*]i32, *i32) callconv(.c) void, .{ .name = "pango_layout_line_get_x_ranges" });
        const ret = cFn(self, arg_start_index, arg_end_index, arg_ranges, arg_n_ranges);
        _ = ret;
        return argO_ranges[0..@intCast(argO_n_ranges)];
    }
    pub fn indexToX(self: *LayoutLine, arg_index_: i32, arg_trailing: bool) i32 {
        var argO_x_pos: i32 = undefined;
        const arg_x_pos: *i32 = &argO_x_pos;
        const cFn = @extern(*const fn (*LayoutLine, i32, bool, *i32) callconv(.c) void, .{ .name = "pango_layout_line_index_to_x" });
        const ret = cFn(self, arg_index_, arg_trailing, arg_x_pos);
        _ = ret;
        return argO_x_pos;
    }
    pub fn isParagraphStart(self: *LayoutLine) bool {
        const cFn = @extern(*const fn (*LayoutLine) callconv(.c) bool, .{ .name = "pango_layout_line_is_paragraph_start" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *LayoutLine) ?*LayoutLine {
        const cFn = @extern(*const fn (*LayoutLine) callconv(.c) ?*LayoutLine, .{ .name = "pango_layout_line_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *LayoutLine) void {
        const cFn = @extern(*const fn (*LayoutLine) callconv(.c) void, .{ .name = "pango_layout_line_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn xToIndex(self: *LayoutLine, arg_x_pos: i32) struct {
        ret: bool,
        index_: i32,
        trailing: i32,
    } {
        var argO_index_: i32 = undefined;
        const arg_index_: *i32 = &argO_index_;
        var argO_trailing: i32 = undefined;
        const arg_trailing: *i32 = &argO_trailing;
        const cFn = @extern(*const fn (*LayoutLine, i32, *i32, *i32) callconv(.c) bool, .{ .name = "pango_layout_line_x_to_index" });
        const ret = cFn(self, arg_x_pos, arg_index_, arg_trailing);
        return .{ .ret = ret, .index_ = argO_index_, .trailing = argO_trailing };
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_layout_line_get_type" });
        return cFn();
    }
};
pub const LayoutSerializeFlags = packed struct(u32) {
    context: bool = false,
    output: bool = false,
    _: u30 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_layout_serialize_flags_get_type" });
        return cFn();
    }
};
pub const LogAttr = extern struct {
    _0: packed struct(u32) {
        is_line_break: bool,
        is_mandatory_break: bool,
        is_char_break: bool,
        is_white: bool,
        is_cursor_position: bool,
        is_word_start: bool,
        is_word_end: bool,
        is_sentence_boundary: bool,
        is_sentence_start: bool,
        is_sentence_end: bool,
        backspace_deletes_character: bool,
        is_expandable_space: bool,
        is_word_boundary: bool,
        break_inserts_hyphen: bool,
        break_removes_preceding: bool,
        reserved: u17,
    },
};
pub const Matrix = extern struct {
    xx: f64,
    xy: f64,
    yx: f64,
    yy: f64,
    x0: f64,
    y0: f64,
    pub fn concat(self: *Matrix, arg_new_matrix: *Matrix) void {
        const cFn = @extern(*const fn (*Matrix, *Matrix) callconv(.c) void, .{ .name = "pango_matrix_concat" });
        const ret = cFn(self, arg_new_matrix);
        return ret;
    }
    pub fn copy(self: *Matrix) ?*Matrix {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) ?*Matrix, .{ .name = "pango_matrix_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *Matrix) void {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) void, .{ .name = "pango_matrix_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFontScaleFactor(self: *Matrix) f64 {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) f64, .{ .name = "pango_matrix_get_font_scale_factor" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFontScaleFactors(self: *Matrix) struct {
        xscale: f64,
        yscale: f64,
    } {
        var argO_xscale: f64 = undefined;
        const arg_xscale: ?*f64 = &argO_xscale;
        var argO_yscale: f64 = undefined;
        const arg_yscale: ?*f64 = &argO_yscale;
        const cFn = @extern(*const fn (*Matrix, ?*f64, ?*f64) callconv(.c) void, .{ .name = "pango_matrix_get_font_scale_factors" });
        const ret = cFn(self, arg_xscale, arg_yscale);
        _ = ret;
        return .{ .xscale = argO_xscale, .yscale = argO_yscale };
    }
    pub fn getSlantRatio(self: *Matrix) f64 {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) f64, .{ .name = "pango_matrix_get_slant_ratio" });
        const ret = cFn(self);
        return ret;
    }
    pub fn rotate(self: *Matrix, arg_degrees: f64) void {
        const cFn = @extern(*const fn (*Matrix, f64) callconv(.c) void, .{ .name = "pango_matrix_rotate" });
        const ret = cFn(self, arg_degrees);
        return ret;
    }
    pub fn scale(self: *Matrix, arg_scale_x: f64, arg_scale_y: f64) void {
        const cFn = @extern(*const fn (*Matrix, f64, f64) callconv(.c) void, .{ .name = "pango_matrix_scale" });
        const ret = cFn(self, arg_scale_x, arg_scale_y);
        return ret;
    }
    pub fn transformDistance(self: *Matrix, arg_dx: *f64, arg_dy: *f64) void {
        const cFn = @extern(*const fn (*Matrix, *f64, *f64) callconv(.c) void, .{ .name = "pango_matrix_transform_distance" });
        const ret = cFn(self, arg_dx, arg_dy);
        return ret;
    }
    pub fn transformPixelRectangle(self: *Matrix, arg_rect: ?*Rectangle) void {
        const cFn = @extern(*const fn (*Matrix, ?*Rectangle) callconv(.c) void, .{ .name = "pango_matrix_transform_pixel_rectangle" });
        const ret = cFn(self, arg_rect);
        return ret;
    }
    pub fn transformPoint(self: *Matrix, arg_x: *f64, arg_y: *f64) void {
        const cFn = @extern(*const fn (*Matrix, *f64, *f64) callconv(.c) void, .{ .name = "pango_matrix_transform_point" });
        const ret = cFn(self, arg_x, arg_y);
        return ret;
    }
    pub fn transformRectangle(self: *Matrix, arg_rect: ?*Rectangle) void {
        const cFn = @extern(*const fn (*Matrix, ?*Rectangle) callconv(.c) void, .{ .name = "pango_matrix_transform_rectangle" });
        const ret = cFn(self, arg_rect);
        return ret;
    }
    pub fn translate(self: *Matrix, arg_tx: f64, arg_ty: f64) void {
        const cFn = @extern(*const fn (*Matrix, f64, f64) callconv(.c) void, .{ .name = "pango_matrix_translate" });
        const ret = cFn(self, arg_tx, arg_ty);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_matrix_get_type" });
        return cFn();
    }
};
pub const Overline = enum(u32) {
    none = 0,
    single = 1,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_overline_get_type" });
        return cFn();
    }
};
pub const Rectangle = extern struct {
    x: i32,
    y: i32,
    width: i32,
    height: i32,
};
pub const RenderPart = enum(u32) {
    foreground = 0,
    background = 1,
    underline = 2,
    strikethrough = 3,
    overline = 4,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_render_part_get_type" });
        return cFn();
    }
};
pub const Renderer = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = RendererClass;
    parent_instance: GObject.Object,
    underline: Underline,
    strikethrough: bool,
    active_count: i32,
    matrix: ?*Matrix,
    priv: ?*RendererPrivate,
    pub fn activate(self: *Renderer) void {
        const cFn = @extern(*const fn (*Renderer) callconv(.c) void, .{ .name = "pango_renderer_activate" });
        const ret = cFn(self);
        return ret;
    }
    pub fn deactivate(self: *Renderer) void {
        const cFn = @extern(*const fn (*Renderer) callconv(.c) void, .{ .name = "pango_renderer_deactivate" });
        const ret = cFn(self);
        return ret;
    }
    pub fn drawErrorUnderline(self: *Renderer, arg_x: i32, arg_y: i32, arg_width: i32, arg_height: i32) void {
        const cFn = @extern(*const fn (*Renderer, i32, i32, i32, i32) callconv(.c) void, .{ .name = "pango_renderer_draw_error_underline" });
        const ret = cFn(self, arg_x, arg_y, arg_width, arg_height);
        return ret;
    }
    pub fn drawGlyph(self: *Renderer, arg_font: *Font, arg_glyph: u32, arg_x: f64, arg_y: f64) void {
        const cFn = @extern(*const fn (*Renderer, *Font, u32, f64, f64) callconv(.c) void, .{ .name = "pango_renderer_draw_glyph" });
        const ret = cFn(self, arg_font, arg_glyph, arg_x, arg_y);
        return ret;
    }
    pub fn drawGlyphItem(self: *Renderer, arg_text: ?[*:0]const u8, arg_glyph_item: *GlyphItem, arg_x: i32, arg_y: i32) void {
        const cFn = @extern(*const fn (*Renderer, ?[*:0]const u8, *GlyphItem, i32, i32) callconv(.c) void, .{ .name = "pango_renderer_draw_glyph_item" });
        const ret = cFn(self, arg_text, arg_glyph_item, arg_x, arg_y);
        return ret;
    }
    pub fn drawGlyphs(self: *Renderer, arg_font: *Font, arg_glyphs: *GlyphString, arg_x: i32, arg_y: i32) void {
        const cFn = @extern(*const fn (*Renderer, *Font, *GlyphString, i32, i32) callconv(.c) void, .{ .name = "pango_renderer_draw_glyphs" });
        const ret = cFn(self, arg_font, arg_glyphs, arg_x, arg_y);
        return ret;
    }
    pub fn drawLayout(self: *Renderer, arg_layout: *Layout, arg_x: i32, arg_y: i32) void {
        const cFn = @extern(*const fn (*Renderer, *Layout, i32, i32) callconv(.c) void, .{ .name = "pango_renderer_draw_layout" });
        const ret = cFn(self, arg_layout, arg_x, arg_y);
        return ret;
    }
    pub fn drawLayoutLine(self: *Renderer, arg_line: *LayoutLine, arg_x: i32, arg_y: i32) void {
        const cFn = @extern(*const fn (*Renderer, *LayoutLine, i32, i32) callconv(.c) void, .{ .name = "pango_renderer_draw_layout_line" });
        const ret = cFn(self, arg_line, arg_x, arg_y);
        return ret;
    }
    pub fn drawRectangle(self: *Renderer, arg_part: RenderPart, arg_x: i32, arg_y: i32, arg_width: i32, arg_height: i32) void {
        const cFn = @extern(*const fn (*Renderer, RenderPart, i32, i32, i32, i32) callconv(.c) void, .{ .name = "pango_renderer_draw_rectangle" });
        const ret = cFn(self, arg_part, arg_x, arg_y, arg_width, arg_height);
        return ret;
    }
    pub fn drawTrapezoid(self: *Renderer, arg_part: RenderPart, arg_y1_: f64, arg_x11: f64, arg_x21: f64, arg_y2: f64, arg_x12: f64, arg_x22: f64) void {
        const cFn = @extern(*const fn (*Renderer, RenderPart, f64, f64, f64, f64, f64, f64) callconv(.c) void, .{ .name = "pango_renderer_draw_trapezoid" });
        const ret = cFn(self, arg_part, arg_y1_, arg_x11, arg_x21, arg_y2, arg_x12, arg_x22);
        return ret;
    }
    pub fn getAlpha(self: *Renderer, arg_part: RenderPart) u16 {
        const cFn = @extern(*const fn (*Renderer, RenderPart) callconv(.c) u16, .{ .name = "pango_renderer_get_alpha" });
        const ret = cFn(self, arg_part);
        return ret;
    }
    pub fn getColor(self: *Renderer, arg_part: RenderPart) ?*Color {
        const cFn = @extern(*const fn (*Renderer, RenderPart) callconv(.c) ?*Color, .{ .name = "pango_renderer_get_color" });
        const ret = cFn(self, arg_part);
        return ret;
    }
    pub fn getLayout(self: *Renderer) ?*Layout {
        const cFn = @extern(*const fn (*Renderer) callconv(.c) ?*Layout, .{ .name = "pango_renderer_get_layout" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLayoutLine(self: *Renderer) ?*LayoutLine {
        const cFn = @extern(*const fn (*Renderer) callconv(.c) ?*LayoutLine, .{ .name = "pango_renderer_get_layout_line" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMatrix(self: *Renderer) ?*Matrix {
        const cFn = @extern(*const fn (*Renderer) callconv(.c) ?*Matrix, .{ .name = "pango_renderer_get_matrix" });
        const ret = cFn(self);
        return ret;
    }
    pub fn partChanged(self: *Renderer, arg_part: RenderPart) void {
        const cFn = @extern(*const fn (*Renderer, RenderPart) callconv(.c) void, .{ .name = "pango_renderer_part_changed" });
        const ret = cFn(self, arg_part);
        return ret;
    }
    pub fn setAlpha(self: *Renderer, arg_part: RenderPart, arg_alpha: u16) void {
        const cFn = @extern(*const fn (*Renderer, RenderPart, u16) callconv(.c) void, .{ .name = "pango_renderer_set_alpha" });
        const ret = cFn(self, arg_part, arg_alpha);
        return ret;
    }
    pub fn setColor(self: *Renderer, arg_part: RenderPart, arg_color: ?*Color) void {
        const cFn = @extern(*const fn (*Renderer, RenderPart, ?*Color) callconv(.c) void, .{ .name = "pango_renderer_set_color" });
        const ret = cFn(self, arg_part, arg_color);
        return ret;
    }
    pub fn setMatrix(self: *Renderer, arg_matrix: ?*Matrix) void {
        const cFn = @extern(*const fn (*Renderer, ?*Matrix) callconv(.c) void, .{ .name = "pango_renderer_set_matrix" });
        const ret = cFn(self, arg_matrix);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_renderer_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const RendererClass = extern struct {
    parent_class: GObject.ObjectClass,
    draw_glyphs: ?*const fn (arg_renderer: *Renderer, arg_font: *Font, arg_glyphs: *GlyphString, arg_x: i32, arg_y: i32) callconv(.c) void,
    draw_rectangle: ?*const fn (arg_renderer: *Renderer, arg_part: RenderPart, arg_x: i32, arg_y: i32, arg_width: i32, arg_height: i32) callconv(.c) void,
    draw_error_underline: ?*const fn (arg_renderer: *Renderer, arg_x: i32, arg_y: i32, arg_width: i32, arg_height: i32) callconv(.c) void,
    draw_shape: ?*const fn (arg_renderer: *Renderer, arg_attr: *AttrShape, arg_x: i32, arg_y: i32) callconv(.c) void,
    draw_trapezoid: ?*const fn (arg_renderer: *Renderer, arg_part: RenderPart, arg_y1_: f64, arg_x11: f64, arg_x21: f64, arg_y2: f64, arg_x12: f64, arg_x22: f64) callconv(.c) void,
    draw_glyph: ?*const fn (arg_renderer: *Renderer, arg_font: *Font, arg_glyph: u32, arg_x: f64, arg_y: f64) callconv(.c) void,
    part_changed: ?*const fn (arg_renderer: *Renderer, arg_part: RenderPart) callconv(.c) void,
    begin: ?*const fn (arg_renderer: *Renderer) callconv(.c) void,
    end: ?*const fn (arg_renderer: *Renderer) callconv(.c) void,
    prepare_run: ?*const fn (arg_renderer: *Renderer, arg_run: *GlyphItem) callconv(.c) void,
    draw_glyph_item: ?*const fn (arg_renderer: *Renderer, arg_text: ?[*:0]const u8, arg_glyph_item: *GlyphItem, arg_x: i32, arg_y: i32) callconv(.c) void,
    _pango_reserved2: ?*anyopaque,
    _pango_reserved3: ?*anyopaque,
    _pango_reserved4: ?*anyopaque,
};
pub const RendererPrivate = opaque {};
pub const SCALE = 1024;
pub const Script = enum(i32) {
    invalid_code = -1,
    common = 0,
    inherited = 1,
    arabic = 2,
    armenian = 3,
    bengali = 4,
    bopomofo = 5,
    cherokee = 6,
    coptic = 7,
    cyrillic = 8,
    deseret = 9,
    devanagari = 10,
    ethiopic = 11,
    georgian = 12,
    gothic = 13,
    greek = 14,
    gujarati = 15,
    gurmukhi = 16,
    han = 17,
    hangul = 18,
    hebrew = 19,
    hiragana = 20,
    kannada = 21,
    katakana = 22,
    khmer = 23,
    lao = 24,
    latin = 25,
    malayalam = 26,
    mongolian = 27,
    myanmar = 28,
    ogham = 29,
    old_italic = 30,
    oriya = 31,
    runic = 32,
    sinhala = 33,
    syriac = 34,
    tamil = 35,
    telugu = 36,
    thaana = 37,
    thai = 38,
    tibetan = 39,
    canadian_aboriginal = 40,
    yi = 41,
    tagalog = 42,
    hanunoo = 43,
    buhid = 44,
    tagbanwa = 45,
    braille = 46,
    cypriot = 47,
    limbu = 48,
    osmanya = 49,
    shavian = 50,
    linear_b = 51,
    tai_le = 52,
    ugaritic = 53,
    new_tai_lue = 54,
    buginese = 55,
    glagolitic = 56,
    tifinagh = 57,
    syloti_nagri = 58,
    old_persian = 59,
    kharoshthi = 60,
    unknown = 61,
    balinese = 62,
    cuneiform = 63,
    phoenician = 64,
    phags_pa = 65,
    nko = 66,
    kayah_li = 67,
    lepcha = 68,
    rejang = 69,
    sundanese = 70,
    saurashtra = 71,
    cham = 72,
    ol_chiki = 73,
    vai = 74,
    carian = 75,
    lycian = 76,
    lydian = 77,
    batak = 78,
    brahmi = 79,
    mandaic = 80,
    chakma = 81,
    meroitic_cursive = 82,
    meroitic_hieroglyphs = 83,
    miao = 84,
    sharada = 85,
    sora_sompeng = 86,
    takri = 87,
    bassa_vah = 88,
    caucasian_albanian = 89,
    duployan = 90,
    elbasan = 91,
    grantha = 92,
    khojki = 93,
    khudawadi = 94,
    linear_a = 95,
    mahajani = 96,
    manichaean = 97,
    mende_kikakui = 98,
    modi = 99,
    mro = 100,
    nabataean = 101,
    old_north_arabian = 102,
    old_permic = 103,
    pahawh_hmong = 104,
    palmyrene = 105,
    pau_cin_hau = 106,
    psalter_pahlavi = 107,
    siddham = 108,
    tirhuta = 109,
    warang_citi = 110,
    ahom = 111,
    anatolian_hieroglyphs = 112,
    hatran = 113,
    multani = 114,
    old_hungarian = 115,
    signwriting = 116,
    pub fn forUnichar(arg_ch: u32) Script {
        const cFn = @extern(*const fn (u32) callconv(.c) Script, .{ .name = "pango_script_for_unichar" });
        const ret = cFn(arg_ch);
        return ret;
    }
    pub fn getSampleLanguage(arg_script: Script) ?*Language {
        const cFn = @extern(*const fn (Script) callconv(.c) ?*Language, .{ .name = "pango_script_get_sample_language" });
        const ret = cFn(arg_script);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_script_get_type" });
        return cFn();
    }
};
pub const ScriptIter = opaque {
    pub fn new(arg_text: [*:0]const u8, arg_length: i32) *ScriptIter {
        const cFn = @extern(*const fn ([*:0]const u8, i32) callconv(.c) *ScriptIter, .{ .name = "pango_script_iter_new" });
        const ret = cFn(arg_text, arg_length);
        return ret;
    }
    pub fn free(self: *ScriptIter) void {
        const cFn = @extern(*const fn (*ScriptIter) callconv(.c) void, .{ .name = "pango_script_iter_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRange(self: *ScriptIter) struct {
        start: [*:0]u8,
        end: [*:0]u8,
        script: Script,
    } {
        var argO_start: ?[*:0]u8 = undefined;
        const arg_start: ?*[*:0]u8 = &argO_start;
        var argO_end: ?[*:0]u8 = undefined;
        const arg_end: ?*[*:0]u8 = &argO_end;
        var argO_script: Script = undefined;
        const arg_script: ?*Script = &argO_script;
        const cFn = @extern(*const fn (*ScriptIter, ?*[*:0]u8, ?*[*:0]u8, ?*Script) callconv(.c) void, .{ .name = "pango_script_iter_get_range" });
        const ret = cFn(self, arg_start, arg_end, arg_script);
        _ = ret;
        return .{ .start = argO_start, .end = argO_end, .script = argO_script };
    }
    pub fn next(self: *ScriptIter) bool {
        const cFn = @extern(*const fn (*ScriptIter) callconv(.c) bool, .{ .name = "pango_script_iter_next" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_script_iter_get_type" });
        return cFn();
    }
};
pub const ShapeFlags = packed struct(u32) {
    round_positions: bool = false,
    _: u31 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_shape_flags_get_type" });
        return cFn();
    }
};
pub const ShowFlags = packed struct(u32) {
    spaces: bool = false,
    line_breaks: bool = false,
    ignorables: bool = false,
    _: u29 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_show_flags_get_type" });
        return cFn();
    }
};
pub const Stretch = enum(u32) {
    ultra_condensed = 0,
    extra_condensed = 1,
    condensed = 2,
    semi_condensed = 3,
    normal = 4,
    semi_expanded = 5,
    expanded = 6,
    extra_expanded = 7,
    ultra_expanded = 8,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_stretch_get_type" });
        return cFn();
    }
};
pub const Style = enum(u32) {
    normal = 0,
    oblique = 1,
    italic = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_style_get_type" });
        return cFn();
    }
};
pub const TabAlign = enum(u32) {
    left = 0,
    right = 1,
    center = 2,
    decimal = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_tab_align_get_type" });
        return cFn();
    }
};
pub const TabArray = opaque {
    pub fn new(arg_initial_size: i32, arg_positions_in_pixels: bool) *TabArray {
        const cFn = @extern(*const fn (i32, bool) callconv(.c) *TabArray, .{ .name = "pango_tab_array_new" });
        const ret = cFn(arg_initial_size, arg_positions_in_pixels);
        return ret;
    }
    pub fn copy(self: *TabArray) *TabArray {
        const cFn = @extern(*const fn (*TabArray) callconv(.c) *TabArray, .{ .name = "pango_tab_array_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *TabArray) void {
        const cFn = @extern(*const fn (*TabArray) callconv(.c) void, .{ .name = "pango_tab_array_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDecimalPoint(self: *TabArray, arg_tab_index: i32) u32 {
        const cFn = @extern(*const fn (*TabArray, i32) callconv(.c) u32, .{ .name = "pango_tab_array_get_decimal_point" });
        const ret = cFn(self, arg_tab_index);
        return ret;
    }
    pub fn getPositionsInPixels(self: *TabArray) bool {
        const cFn = @extern(*const fn (*TabArray) callconv(.c) bool, .{ .name = "pango_tab_array_get_positions_in_pixels" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSize(self: *TabArray) i32 {
        const cFn = @extern(*const fn (*TabArray) callconv(.c) i32, .{ .name = "pango_tab_array_get_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTab(self: *TabArray, arg_tab_index: i32) struct {
        alignment: TabAlign,
        location: i32,
    } {
        var argO_alignment: TabAlign = undefined;
        const arg_alignment: ?*TabAlign = &argO_alignment;
        var argO_location: i32 = undefined;
        const arg_location: ?*i32 = &argO_location;
        const cFn = @extern(*const fn (*TabArray, i32, ?*TabAlign, ?*i32) callconv(.c) void, .{ .name = "pango_tab_array_get_tab" });
        const ret = cFn(self, arg_tab_index, arg_alignment, arg_location);
        _ = ret;
        return .{ .alignment = argO_alignment, .location = argO_location };
    }
    pub fn getTabs(self: *TabArray) struct {
        alignments: *TabAlign,
        locations: [*]i32,
    } {
        var argO_alignments: ?*TabAlign = undefined;
        const arg_alignments: ?**TabAlign = &argO_alignments;
        var argO_locations: ?[*]i32 = undefined;
        const arg_locations: ?*[*]i32 = &argO_locations;
        const cFn = @extern(*const fn (*TabArray, ?**TabAlign, ?*[*]i32) callconv(.c) void, .{ .name = "pango_tab_array_get_tabs" });
        const ret = cFn(self, arg_alignments, arg_locations);
        _ = ret;
        return .{ .alignments = argO_alignments, .locations = argO_locations };
    }
    pub fn resize(self: *TabArray, arg_new_size: i32) void {
        const cFn = @extern(*const fn (*TabArray, i32) callconv(.c) void, .{ .name = "pango_tab_array_resize" });
        const ret = cFn(self, arg_new_size);
        return ret;
    }
    pub fn setDecimalPoint(self: *TabArray, arg_tab_index: i32, arg_decimal_point: u32) void {
        const cFn = @extern(*const fn (*TabArray, i32, u32) callconv(.c) void, .{ .name = "pango_tab_array_set_decimal_point" });
        const ret = cFn(self, arg_tab_index, arg_decimal_point);
        return ret;
    }
    pub fn setPositionsInPixels(self: *TabArray, arg_positions_in_pixels: bool) void {
        const cFn = @extern(*const fn (*TabArray, bool) callconv(.c) void, .{ .name = "pango_tab_array_set_positions_in_pixels" });
        const ret = cFn(self, arg_positions_in_pixels);
        return ret;
    }
    pub fn setTab(self: *TabArray, arg_tab_index: i32, arg_alignment: TabAlign, arg_location: i32) void {
        const cFn = @extern(*const fn (*TabArray, i32, TabAlign, i32) callconv(.c) void, .{ .name = "pango_tab_array_set_tab" });
        const ret = cFn(self, arg_tab_index, arg_alignment, arg_location);
        return ret;
    }
    pub fn sort(self: *TabArray) void {
        const cFn = @extern(*const fn (*TabArray) callconv(.c) void, .{ .name = "pango_tab_array_sort" });
        const ret = cFn(self);
        return ret;
    }
    pub fn toString(self: *TabArray) [*:0]u8 {
        const cFn = @extern(*const fn (*TabArray) callconv(.c) [*:0]u8, .{ .name = "pango_tab_array_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn fromString(arg_text: [*:0]const u8) ?*TabArray {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*TabArray, .{ .name = "pango_tab_array_from_string" });
        const ret = cFn(arg_text);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_tab_array_get_type" });
        return cFn();
    }
};
pub const TextTransform = enum(u32) {
    none = 0,
    lowercase = 1,
    uppercase = 2,
    capitalize = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_text_transform_get_type" });
        return cFn();
    }
};
pub const Underline = enum(u32) {
    none = 0,
    single = 1,
    double = 2,
    low = 3,
    @"error" = 4,
    single_line = 5,
    double_line = 6,
    error_line = 7,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_underline_get_type" });
        return cFn();
    }
};
pub const VERSION_MAJOR = 1;
pub const VERSION_MICRO = 5;
pub const VERSION_MINOR = 56;
pub const VERSION_STRING = "1.56.5";
pub const Variant = enum(u32) {
    normal = 0,
    small_caps = 1,
    all_small_caps = 2,
    petite_caps = 3,
    all_petite_caps = 4,
    unicase = 5,
    title_caps = 6,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_variant_get_type" });
        return cFn();
    }
};
pub const Weight = enum(u32) {
    thin = 100,
    ultralight = 200,
    light = 300,
    semilight = 350,
    book = 380,
    normal = 400,
    medium = 500,
    semibold = 600,
    bold = 700,
    ultrabold = 800,
    heavy = 900,
    ultraheavy = 1000,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_weight_get_type" });
        return cFn();
    }
};
pub const WrapMode = enum(u32) {
    word = 0,
    char = 1,
    word_char = 2,
    none = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "pango_wrap_mode_get_type" });
        return cFn();
    }
};
pub fn attrAllowBreaksNew(arg_allow_breaks: bool) *Attribute {
    const cFn = @extern(*const fn (bool) callconv(.c) *Attribute, .{ .name = "pango_attr_allow_breaks_new" });
    const ret = cFn(arg_allow_breaks);
    return ret;
}
pub fn attrBackgroundAlphaNew(arg_alpha: u16) *Attribute {
    const cFn = @extern(*const fn (u16) callconv(.c) *Attribute, .{ .name = "pango_attr_background_alpha_new" });
    const ret = cFn(arg_alpha);
    return ret;
}
pub fn attrBackgroundNew(arg_red: u16, arg_green: u16, arg_blue: u16) *Attribute {
    const cFn = @extern(*const fn (u16, u16, u16) callconv(.c) *Attribute, .{ .name = "pango_attr_background_new" });
    const ret = cFn(arg_red, arg_green, arg_blue);
    return ret;
}
pub fn attrBaselineShiftNew(arg_shift: i32) *Attribute {
    const cFn = @extern(*const fn (i32) callconv(.c) *Attribute, .{ .name = "pango_attr_baseline_shift_new" });
    const ret = cFn(arg_shift);
    return ret;
}
pub fn attrBreak(arg_text: [*:0]const u8, arg_length: i32, arg_attr_list: *AttrList, arg_offset: i32, argS_attrs: []LogAttr) void {
    const arg_attrs: [*]LogAttr = @ptrCast(argS_attrs);
    const arg_attrs_len: i32 = @intCast((argS_attrs).len);
    const cFn = @extern(*const fn ([*:0]const u8, i32, *AttrList, i32, [*]LogAttr, i32) callconv(.c) void, .{ .name = "pango_attr_break" });
    const ret = cFn(arg_text, arg_length, arg_attr_list, arg_offset, arg_attrs, arg_attrs_len);
    return ret;
}
pub fn attrFallbackNew(arg_enable_fallback: bool) *Attribute {
    const cFn = @extern(*const fn (bool) callconv(.c) *Attribute, .{ .name = "pango_attr_fallback_new" });
    const ret = cFn(arg_enable_fallback);
    return ret;
}
pub fn attrFamilyNew(arg_family: [*:0]const u8) *Attribute {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *Attribute, .{ .name = "pango_attr_family_new" });
    const ret = cFn(arg_family);
    return ret;
}
pub fn attrFontDescNew(arg_desc: *FontDescription) *Attribute {
    const cFn = @extern(*const fn (*FontDescription) callconv(.c) *Attribute, .{ .name = "pango_attr_font_desc_new" });
    const ret = cFn(arg_desc);
    return ret;
}
pub fn attrFontFeaturesNew(arg_features: [*:0]const u8) *Attribute {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *Attribute, .{ .name = "pango_attr_font_features_new" });
    const ret = cFn(arg_features);
    return ret;
}
pub fn attrFontScaleNew(arg_scale: FontScale) *Attribute {
    const cFn = @extern(*const fn (FontScale) callconv(.c) *Attribute, .{ .name = "pango_attr_font_scale_new" });
    const ret = cFn(arg_scale);
    return ret;
}
pub fn attrForegroundAlphaNew(arg_alpha: u16) *Attribute {
    const cFn = @extern(*const fn (u16) callconv(.c) *Attribute, .{ .name = "pango_attr_foreground_alpha_new" });
    const ret = cFn(arg_alpha);
    return ret;
}
pub fn attrForegroundNew(arg_red: u16, arg_green: u16, arg_blue: u16) *Attribute {
    const cFn = @extern(*const fn (u16, u16, u16) callconv(.c) *Attribute, .{ .name = "pango_attr_foreground_new" });
    const ret = cFn(arg_red, arg_green, arg_blue);
    return ret;
}
pub fn attrGravityHintNew(arg_hint: GravityHint) *Attribute {
    const cFn = @extern(*const fn (GravityHint) callconv(.c) *Attribute, .{ .name = "pango_attr_gravity_hint_new" });
    const ret = cFn(arg_hint);
    return ret;
}
pub fn attrGravityNew(arg_gravity: Gravity) *Attribute {
    const cFn = @extern(*const fn (Gravity) callconv(.c) *Attribute, .{ .name = "pango_attr_gravity_new" });
    const ret = cFn(arg_gravity);
    return ret;
}
pub fn attrInsertHyphensNew(arg_insert_hyphens: bool) *Attribute {
    const cFn = @extern(*const fn (bool) callconv(.c) *Attribute, .{ .name = "pango_attr_insert_hyphens_new" });
    const ret = cFn(arg_insert_hyphens);
    return ret;
}
pub fn attrLanguageNew(arg_language: *Language) *Attribute {
    const cFn = @extern(*const fn (*Language) callconv(.c) *Attribute, .{ .name = "pango_attr_language_new" });
    const ret = cFn(arg_language);
    return ret;
}
pub fn attrLetterSpacingNew(arg_letter_spacing: i32) *Attribute {
    const cFn = @extern(*const fn (i32) callconv(.c) *Attribute, .{ .name = "pango_attr_letter_spacing_new" });
    const ret = cFn(arg_letter_spacing);
    return ret;
}
pub fn attrLineHeightNew(arg_factor: f64) *Attribute {
    const cFn = @extern(*const fn (f64) callconv(.c) *Attribute, .{ .name = "pango_attr_line_height_new" });
    const ret = cFn(arg_factor);
    return ret;
}
pub fn attrLineHeightNewAbsolute(arg_height: i32) *Attribute {
    const cFn = @extern(*const fn (i32) callconv(.c) *Attribute, .{ .name = "pango_attr_line_height_new_absolute" });
    const ret = cFn(arg_height);
    return ret;
}
pub fn attrListFromString(arg_text: [*:0]const u8) ?*AttrList {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*AttrList, .{ .name = "pango_attr_list_from_string" });
    const ret = cFn(arg_text);
    return ret;
}
pub fn attrOverlineColorNew(arg_red: u16, arg_green: u16, arg_blue: u16) *Attribute {
    const cFn = @extern(*const fn (u16, u16, u16) callconv(.c) *Attribute, .{ .name = "pango_attr_overline_color_new" });
    const ret = cFn(arg_red, arg_green, arg_blue);
    return ret;
}
pub fn attrOverlineNew(arg_overline: Overline) *Attribute {
    const cFn = @extern(*const fn (Overline) callconv(.c) *Attribute, .{ .name = "pango_attr_overline_new" });
    const ret = cFn(arg_overline);
    return ret;
}
pub fn attrRiseNew(arg_rise: i32) *Attribute {
    const cFn = @extern(*const fn (i32) callconv(.c) *Attribute, .{ .name = "pango_attr_rise_new" });
    const ret = cFn(arg_rise);
    return ret;
}
pub fn attrScaleNew(arg_scale_factor: f64) *Attribute {
    const cFn = @extern(*const fn (f64) callconv(.c) *Attribute, .{ .name = "pango_attr_scale_new" });
    const ret = cFn(arg_scale_factor);
    return ret;
}
pub fn attrSentenceNew() *Attribute {
    const cFn = @extern(*const fn () callconv(.c) *Attribute, .{ .name = "pango_attr_sentence_new" });
    const ret = cFn();
    return ret;
}
pub fn attrShapeNew(arg_ink_rect: *Rectangle, arg_logical_rect: *Rectangle) *Attribute {
    const cFn = @extern(*const fn (*Rectangle, *Rectangle) callconv(.c) *Attribute, .{ .name = "pango_attr_shape_new" });
    const ret = cFn(arg_ink_rect, arg_logical_rect);
    return ret;
}
pub fn attrShapeNewWithData(arg_ink_rect: *Rectangle, arg_logical_rect: *Rectangle, arg_data: ?*anyopaque, arg_copy_func: ?AttrDataCopyFunc, arg_destroy_func: ?GLib.DestroyNotify) *Attribute {
    const cFn = @extern(*const fn (*Rectangle, *Rectangle, ?*anyopaque, ?AttrDataCopyFunc, ?GLib.DestroyNotify) callconv(.c) *Attribute, .{ .name = "pango_attr_shape_new_with_data" });
    const ret = cFn(arg_ink_rect, arg_logical_rect, @ptrCast(arg_data), arg_copy_func, arg_destroy_func);
    return ret;
}
pub fn attrShowNew(arg_flags: ShowFlags) *Attribute {
    const cFn = @extern(*const fn (ShowFlags) callconv(.c) *Attribute, .{ .name = "pango_attr_show_new" });
    const ret = cFn(arg_flags);
    return ret;
}
pub fn attrSizeNew(arg_size: i32) *Attribute {
    const cFn = @extern(*const fn (i32) callconv(.c) *Attribute, .{ .name = "pango_attr_size_new" });
    const ret = cFn(arg_size);
    return ret;
}
pub fn attrSizeNewAbsolute(arg_size: i32) *Attribute {
    const cFn = @extern(*const fn (i32) callconv(.c) *Attribute, .{ .name = "pango_attr_size_new_absolute" });
    const ret = cFn(arg_size);
    return ret;
}
pub fn attrStretchNew(arg_stretch: Stretch) *Attribute {
    const cFn = @extern(*const fn (Stretch) callconv(.c) *Attribute, .{ .name = "pango_attr_stretch_new" });
    const ret = cFn(arg_stretch);
    return ret;
}
pub fn attrStrikethroughColorNew(arg_red: u16, arg_green: u16, arg_blue: u16) *Attribute {
    const cFn = @extern(*const fn (u16, u16, u16) callconv(.c) *Attribute, .{ .name = "pango_attr_strikethrough_color_new" });
    const ret = cFn(arg_red, arg_green, arg_blue);
    return ret;
}
pub fn attrStrikethroughNew(arg_strikethrough: bool) *Attribute {
    const cFn = @extern(*const fn (bool) callconv(.c) *Attribute, .{ .name = "pango_attr_strikethrough_new" });
    const ret = cFn(arg_strikethrough);
    return ret;
}
pub fn attrStyleNew(arg_style: Style) *Attribute {
    const cFn = @extern(*const fn (Style) callconv(.c) *Attribute, .{ .name = "pango_attr_style_new" });
    const ret = cFn(arg_style);
    return ret;
}
pub fn attrTextTransformNew(arg_transform: TextTransform) *Attribute {
    const cFn = @extern(*const fn (TextTransform) callconv(.c) *Attribute, .{ .name = "pango_attr_text_transform_new" });
    const ret = cFn(arg_transform);
    return ret;
}
pub fn attrTypeGetName(arg_type: AttrType) ?[*:0]u8 {
    const cFn = @extern(*const fn (AttrType) callconv(.c) ?[*:0]u8, .{ .name = "pango_attr_type_get_name" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn attrTypeRegister(arg_name: [*:0]const u8) AttrType {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) AttrType, .{ .name = "pango_attr_type_register" });
    const ret = cFn(arg_name);
    return ret;
}
pub fn attrUnderlineColorNew(arg_red: u16, arg_green: u16, arg_blue: u16) *Attribute {
    const cFn = @extern(*const fn (u16, u16, u16) callconv(.c) *Attribute, .{ .name = "pango_attr_underline_color_new" });
    const ret = cFn(arg_red, arg_green, arg_blue);
    return ret;
}
pub fn attrUnderlineNew(arg_underline: Underline) *Attribute {
    const cFn = @extern(*const fn (Underline) callconv(.c) *Attribute, .{ .name = "pango_attr_underline_new" });
    const ret = cFn(arg_underline);
    return ret;
}
pub fn attrVariantNew(arg_variant: Variant) *Attribute {
    const cFn = @extern(*const fn (Variant) callconv(.c) *Attribute, .{ .name = "pango_attr_variant_new" });
    const ret = cFn(arg_variant);
    return ret;
}
pub fn attrWeightNew(arg_weight: Weight) *Attribute {
    const cFn = @extern(*const fn (Weight) callconv(.c) *Attribute, .{ .name = "pango_attr_weight_new" });
    const ret = cFn(arg_weight);
    return ret;
}
pub fn attrWordNew() *Attribute {
    const cFn = @extern(*const fn () callconv(.c) *Attribute, .{ .name = "pango_attr_word_new" });
    const ret = cFn();
    return ret;
}
pub fn bidiTypeForUnichar(arg_ch: u32) BidiType {
    const cFn = @extern(*const fn (u32) callconv(.c) BidiType, .{ .name = "pango_bidi_type_for_unichar" });
    const ret = cFn(arg_ch);
    return ret;
}
pub fn @"break"(arg_text: [*:0]const u8, arg_length: i32, arg_analysis: *Analysis, argS_attrs: []LogAttr) void {
    const arg_attrs: [*]LogAttr = @ptrCast(argS_attrs);
    const arg_attrs_len: i32 = @intCast((argS_attrs).len);
    const cFn = @extern(*const fn ([*:0]const u8, i32, *Analysis, [*]LogAttr, i32) callconv(.c) void, .{ .name = "pango_break" });
    const ret = cFn(arg_text, arg_length, arg_analysis, arg_attrs, arg_attrs_len);
    return ret;
}
pub fn defaultBreak(arg_text: [*:0]const u8, arg_length: i32, arg_analysis: ?*Analysis, argS_attrs: []LogAttr) void {
    const arg_attrs: [*]LogAttr = @ptrCast(argS_attrs);
    const arg_attrs_len: i32 = @intCast((argS_attrs).len);
    const cFn = @extern(*const fn ([*:0]const u8, i32, ?*Analysis, [*]LogAttr, i32) callconv(.c) void, .{ .name = "pango_default_break" });
    const ret = cFn(arg_text, arg_length, arg_analysis, arg_attrs, arg_attrs_len);
    return ret;
}
pub fn extentsToPixels(arg_inclusive: ?*Rectangle, arg_nearest: ?*Rectangle) void {
    const cFn = @extern(*const fn (?*Rectangle, ?*Rectangle) callconv(.c) void, .{ .name = "pango_extents_to_pixels" });
    const ret = cFn(arg_inclusive, arg_nearest);
    return ret;
}
pub fn findBaseDir(arg_text: [*:0]const u8, arg_length: i32) Direction {
    const cFn = @extern(*const fn ([*:0]const u8, i32) callconv(.c) Direction, .{ .name = "pango_find_base_dir" });
    const ret = cFn(arg_text, arg_length);
    return ret;
}
pub fn findParagraphBoundary(arg_text: [*:0]const u8, arg_length: i32) struct {
    paragraph_delimiter_index: i32,
    next_paragraph_start: i32,
} {
    var argO_paragraph_delimiter_index: i32 = undefined;
    const arg_paragraph_delimiter_index: ?*i32 = &argO_paragraph_delimiter_index;
    var argO_next_paragraph_start: i32 = undefined;
    const arg_next_paragraph_start: ?*i32 = &argO_next_paragraph_start;
    const cFn = @extern(*const fn ([*:0]const u8, i32, ?*i32, ?*i32) callconv(.c) void, .{ .name = "pango_find_paragraph_boundary" });
    const ret = cFn(arg_text, arg_length, arg_paragraph_delimiter_index, arg_next_paragraph_start);
    _ = ret;
    return .{ .paragraph_delimiter_index = argO_paragraph_delimiter_index, .next_paragraph_start = argO_next_paragraph_start };
}
pub fn fontDescriptionFromString(arg_str: [*:0]const u8) *FontDescription {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *FontDescription, .{ .name = "pango_font_description_from_string" });
    const ret = cFn(arg_str);
    return ret;
}
pub fn getLogAttrs(arg_text: [*:0]const u8, arg_length: i32, arg_level: i32, arg_language: *Language, argS_attrs: []LogAttr) void {
    const arg_attrs: [*]LogAttr = @ptrCast(argS_attrs);
    const arg_attrs_len: i32 = @intCast((argS_attrs).len);
    const cFn = @extern(*const fn ([*:0]const u8, i32, i32, *Language, [*]LogAttr, i32) callconv(.c) void, .{ .name = "pango_get_log_attrs" });
    const ret = cFn(arg_text, arg_length, arg_level, arg_language, arg_attrs, arg_attrs_len);
    return ret;
}
pub fn getMirrorChar(arg_ch: u32) struct {
    ret: bool,
    mirrored_ch: u32,
} {
    var argO_mirrored_ch: u32 = undefined;
    const arg_mirrored_ch: ?*u32 = &argO_mirrored_ch;
    const cFn = @extern(*const fn (u32, ?*u32) callconv(.c) bool, .{ .name = "pango_get_mirror_char" });
    const ret = cFn(arg_ch, arg_mirrored_ch);
    return .{ .ret = ret, .mirrored_ch = argO_mirrored_ch };
}
pub fn gravityGetForMatrix(arg_matrix: ?*Matrix) Gravity {
    const cFn = @extern(*const fn (?*Matrix) callconv(.c) Gravity, .{ .name = "pango_gravity_get_for_matrix" });
    const ret = cFn(arg_matrix);
    return ret;
}
pub fn gravityGetForScript(arg_script: Script, arg_base_gravity: Gravity, arg_hint: GravityHint) Gravity {
    const cFn = @extern(*const fn (Script, Gravity, GravityHint) callconv(.c) Gravity, .{ .name = "pango_gravity_get_for_script" });
    const ret = cFn(arg_script, arg_base_gravity, arg_hint);
    return ret;
}
pub fn gravityGetForScriptAndWidth(arg_script: Script, arg_wide: bool, arg_base_gravity: Gravity, arg_hint: GravityHint) Gravity {
    const cFn = @extern(*const fn (Script, bool, Gravity, GravityHint) callconv(.c) Gravity, .{ .name = "pango_gravity_get_for_script_and_width" });
    const ret = cFn(arg_script, arg_wide, arg_base_gravity, arg_hint);
    return ret;
}
pub fn gravityToRotation(arg_gravity: Gravity) f64 {
    const cFn = @extern(*const fn (Gravity) callconv(.c) f64, .{ .name = "pango_gravity_to_rotation" });
    const ret = cFn(arg_gravity);
    return ret;
}
pub fn isZeroWidth(arg_ch: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "pango_is_zero_width" });
    const ret = cFn(arg_ch);
    return ret;
}
pub fn itemize(arg_context: *Context, arg_text: [*:0]const u8, arg_start_index: i32, arg_length: i32, arg_attrs: *AttrList, arg_cached_iter: ?*AttrIterator) ?*GLib.List {
    const cFn = @extern(*const fn (*Context, [*:0]const u8, i32, i32, *AttrList, ?*AttrIterator) callconv(.c) ?*GLib.List, .{ .name = "pango_itemize" });
    const ret = cFn(arg_context, arg_text, arg_start_index, arg_length, arg_attrs, arg_cached_iter);
    return ret;
}
pub fn itemizeWithBaseDir(arg_context: *Context, arg_base_dir: Direction, arg_text: [*:0]const u8, arg_start_index: i32, arg_length: i32, arg_attrs: *AttrList, arg_cached_iter: ?*AttrIterator) ?*GLib.List {
    const cFn = @extern(*const fn (*Context, Direction, [*:0]const u8, i32, i32, *AttrList, ?*AttrIterator) callconv(.c) ?*GLib.List, .{ .name = "pango_itemize_with_base_dir" });
    const ret = cFn(arg_context, arg_base_dir, arg_text, arg_start_index, arg_length, arg_attrs, arg_cached_iter);
    return ret;
}
pub fn languageFromString(arg_language: ?[*:0]const u8) ?*Language {
    const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) ?*Language, .{ .name = "pango_language_from_string" });
    const ret = cFn(arg_language);
    return ret;
}
pub fn languageGetDefault() *Language {
    const cFn = @extern(*const fn () callconv(.c) *Language, .{ .name = "pango_language_get_default" });
    const ret = cFn();
    return ret;
}
pub fn languageGetPreferred() ?[*:null]?*Language {
    const cFn = @extern(*const fn () callconv(.c) ?[*:null]?*Language, .{ .name = "pango_language_get_preferred" });
    const ret = cFn();
    return ret;
}
pub fn layoutDeserializeErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "pango_layout_deserialize_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn log2visGetEmbeddingLevels(arg_text: [*:0]const u8, arg_length: i32, arg_pbase_dir: *Direction) [*]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i32, *Direction) callconv(.c) [*]u8, .{ .name = "pango_log2vis_get_embedding_levels" });
    const ret = cFn(arg_text, arg_length, arg_pbase_dir);
    return ret;
}
pub fn markupParserFinish(arg_context: *GLib.MarkupParseContext, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    attr_list: *AttrList,
    text: [*:0]u8,
    accel_char: u32,
} {
    var argO_attr_list: ?*AttrList = undefined;
    const arg_attr_list: ?**AttrList = &argO_attr_list;
    var argO_text: ?[*:0]u8 = undefined;
    const arg_text: ?*[*:0]u8 = &argO_text;
    var argO_accel_char: u32 = undefined;
    const arg_accel_char: ?*u32 = &argO_accel_char;
    const cFn = @extern(*const fn (*GLib.MarkupParseContext, ?**AttrList, ?*[*:0]u8, ?*u32, *?*GLib.Error) callconv(.c) bool, .{ .name = "pango_markup_parser_finish" });
    const ret = cFn(arg_context, arg_attr_list, arg_text, arg_accel_char, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .attr_list = argO_attr_list, .text = argO_text, .accel_char = argO_accel_char };
}
pub fn markupParserNew(arg_accel_marker: u32) *GLib.MarkupParseContext {
    const cFn = @extern(*const fn (u32) callconv(.c) *GLib.MarkupParseContext, .{ .name = "pango_markup_parser_new" });
    const ret = cFn(arg_accel_marker);
    return ret;
}
pub fn parseEnum(arg_type: core.Type, arg_str: ?[*:0]const u8, arg_warn: bool) struct {
    ret: bool,
    value: i32,
    possible_values: [*:0]u8,
} {
    var argO_value: i32 = undefined;
    const arg_value: ?*i32 = &argO_value;
    var argO_possible_values: ?[*:0]u8 = undefined;
    const arg_possible_values: ?*[*:0]u8 = &argO_possible_values;
    const cFn = @extern(*const fn (core.Type, ?[*:0]const u8, ?*i32, bool, ?*[*:0]u8) callconv(.c) bool, .{ .name = "pango_parse_enum" });
    const ret = cFn(arg_type, arg_str, arg_value, arg_warn, arg_possible_values);
    return .{ .ret = ret, .value = argO_value, .possible_values = argO_possible_values };
}
pub fn parseMarkup(arg_markup_text: [*:0]const u8, arg_length: i32, arg_accel_marker: u32, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    attr_list: *AttrList,
    text: [*:0]u8,
    accel_char: u32,
} {
    var argO_attr_list: ?*AttrList = undefined;
    const arg_attr_list: ?**AttrList = &argO_attr_list;
    var argO_text: ?[*:0]u8 = undefined;
    const arg_text: ?*[*:0]u8 = &argO_text;
    var argO_accel_char: u32 = undefined;
    const arg_accel_char: ?*u32 = &argO_accel_char;
    const cFn = @extern(*const fn ([*:0]const u8, i32, u32, ?**AttrList, ?*[*:0]u8, ?*u32, *?*GLib.Error) callconv(.c) bool, .{ .name = "pango_parse_markup" });
    const ret = cFn(arg_markup_text, arg_length, arg_accel_marker, arg_attr_list, arg_text, arg_accel_char, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .attr_list = argO_attr_list, .text = argO_text, .accel_char = argO_accel_char };
}
pub fn parseStretch(arg_str: [*:0]const u8, arg_warn: bool) struct {
    ret: bool,
    stretch: Stretch,
} {
    var argO_stretch: Stretch = undefined;
    const arg_stretch: *Stretch = &argO_stretch;
    const cFn = @extern(*const fn ([*:0]const u8, *Stretch, bool) callconv(.c) bool, .{ .name = "pango_parse_stretch" });
    const ret = cFn(arg_str, arg_stretch, arg_warn);
    return .{ .ret = ret, .stretch = argO_stretch };
}
pub fn parseStyle(arg_str: [*:0]const u8, arg_warn: bool) struct {
    ret: bool,
    style: Style,
} {
    var argO_style: Style = undefined;
    const arg_style: *Style = &argO_style;
    const cFn = @extern(*const fn ([*:0]const u8, *Style, bool) callconv(.c) bool, .{ .name = "pango_parse_style" });
    const ret = cFn(arg_str, arg_style, arg_warn);
    return .{ .ret = ret, .style = argO_style };
}
pub fn parseVariant(arg_str: [*:0]const u8, arg_warn: bool) struct {
    ret: bool,
    variant: Variant,
} {
    var argO_variant: Variant = undefined;
    const arg_variant: *Variant = &argO_variant;
    const cFn = @extern(*const fn ([*:0]const u8, *Variant, bool) callconv(.c) bool, .{ .name = "pango_parse_variant" });
    const ret = cFn(arg_str, arg_variant, arg_warn);
    return .{ .ret = ret, .variant = argO_variant };
}
pub fn parseWeight(arg_str: [*:0]const u8, arg_warn: bool) struct {
    ret: bool,
    weight: Weight,
} {
    var argO_weight: Weight = undefined;
    const arg_weight: *Weight = &argO_weight;
    const cFn = @extern(*const fn ([*:0]const u8, *Weight, bool) callconv(.c) bool, .{ .name = "pango_parse_weight" });
    const ret = cFn(arg_str, arg_weight, arg_warn);
    return .{ .ret = ret, .weight = argO_weight };
}
pub fn quantizeLineGeometry(arg_thickness: *i32, arg_position: *i32) void {
    const cFn = @extern(*const fn (*i32, *i32) callconv(.c) void, .{ .name = "pango_quantize_line_geometry" });
    const ret = cFn(arg_thickness, arg_position);
    return ret;
}
pub fn readLine(arg_stream: ?*anyopaque, arg_str: *GLib.String) i32 {
    const cFn = @extern(*const fn (?*anyopaque, *GLib.String) callconv(.c) i32, .{ .name = "pango_read_line" });
    const ret = cFn(@ptrCast(arg_stream), arg_str);
    return ret;
}
pub fn reorderItems(arg_items: *GLib.List) ?*GLib.List {
    const cFn = @extern(*const fn (*GLib.List) callconv(.c) ?*GLib.List, .{ .name = "pango_reorder_items" });
    const ret = cFn(arg_items);
    return ret;
}
pub fn scanInt(arg_pos: *[*:0]u8) struct {
    ret: bool,
    out: i32,
} {
    var argO_out: i32 = undefined;
    const arg_out: *i32 = &argO_out;
    const cFn = @extern(*const fn (*[*:0]u8, *i32) callconv(.c) bool, .{ .name = "pango_scan_int" });
    const ret = cFn(arg_pos, arg_out);
    return .{ .ret = ret, .out = argO_out };
}
pub fn scanString(arg_pos: *[*:0]u8, arg_out: *GLib.String) bool {
    const cFn = @extern(*const fn (*[*:0]u8, *GLib.String) callconv(.c) bool, .{ .name = "pango_scan_string" });
    const ret = cFn(arg_pos, arg_out);
    return ret;
}
pub fn scanWord(arg_pos: *[*:0]u8, arg_out: *GLib.String) bool {
    const cFn = @extern(*const fn (*[*:0]u8, *GLib.String) callconv(.c) bool, .{ .name = "pango_scan_word" });
    const ret = cFn(arg_pos, arg_out);
    return ret;
}
pub fn scriptForUnichar(arg_ch: u32) Script {
    const cFn = @extern(*const fn (u32) callconv(.c) Script, .{ .name = "pango_script_for_unichar" });
    const ret = cFn(arg_ch);
    return ret;
}
pub fn scriptGetSampleLanguage(arg_script: Script) ?*Language {
    const cFn = @extern(*const fn (Script) callconv(.c) ?*Language, .{ .name = "pango_script_get_sample_language" });
    const ret = cFn(arg_script);
    return ret;
}
pub fn shape(arg_text: [*:0]const u8, arg_length: i32, arg_analysis: *Analysis, arg_glyphs: *GlyphString) void {
    const cFn = @extern(*const fn ([*:0]const u8, i32, *Analysis, *GlyphString) callconv(.c) void, .{ .name = "pango_shape" });
    const ret = cFn(arg_text, arg_length, arg_analysis, arg_glyphs);
    return ret;
}
pub fn shapeFull(arg_item_text: [*:0]const u8, arg_item_length: i32, arg_paragraph_text: ?[*:0]const u8, arg_paragraph_length: i32, arg_analysis: *Analysis, arg_glyphs: *GlyphString) void {
    const cFn = @extern(*const fn ([*:0]const u8, i32, ?[*:0]const u8, i32, *Analysis, *GlyphString) callconv(.c) void, .{ .name = "pango_shape_full" });
    const ret = cFn(arg_item_text, arg_item_length, arg_paragraph_text, arg_paragraph_length, arg_analysis, arg_glyphs);
    return ret;
}
pub fn shapeItem(arg_item: *Item, arg_paragraph_text: ?[*:0]const u8, arg_paragraph_length: i32, arg_log_attrs: ?*LogAttr, arg_glyphs: *GlyphString, arg_flags: ShapeFlags) void {
    const cFn = @extern(*const fn (*Item, ?[*:0]const u8, i32, ?*LogAttr, *GlyphString, ShapeFlags) callconv(.c) void, .{ .name = "pango_shape_item" });
    const ret = cFn(arg_item, arg_paragraph_text, arg_paragraph_length, arg_log_attrs, arg_glyphs, arg_flags);
    return ret;
}
pub fn shapeWithFlags(arg_item_text: [*:0]const u8, arg_item_length: i32, arg_paragraph_text: ?[*:0]const u8, arg_paragraph_length: i32, arg_analysis: *Analysis, arg_glyphs: *GlyphString, arg_flags: ShapeFlags) void {
    const cFn = @extern(*const fn ([*:0]const u8, i32, ?[*:0]const u8, i32, *Analysis, *GlyphString, ShapeFlags) callconv(.c) void, .{ .name = "pango_shape_with_flags" });
    const ret = cFn(arg_item_text, arg_item_length, arg_paragraph_text, arg_paragraph_length, arg_analysis, arg_glyphs, arg_flags);
    return ret;
}
pub fn skipSpace(arg_pos: *[*:0]u8) bool {
    const cFn = @extern(*const fn (*[*:0]u8) callconv(.c) bool, .{ .name = "pango_skip_space" });
    const ret = cFn(arg_pos);
    return ret;
}
pub fn splitFileList(arg_str: [*:0]const u8) [*]?[*:0]const u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*]?[*:0]const u8, .{ .name = "pango_split_file_list" });
    const ret = cFn(arg_str);
    return ret;
}
pub fn tabArrayFromString(arg_text: [*:0]const u8) ?*TabArray {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*TabArray, .{ .name = "pango_tab_array_from_string" });
    const ret = cFn(arg_text);
    return ret;
}
pub fn tailorBreak(arg_text: [*:0]const u8, arg_length: i32, arg_analysis: *Analysis, arg_offset: i32, argS_attrs: []LogAttr) void {
    const arg_attrs: [*]LogAttr = @ptrCast(argS_attrs);
    const arg_attrs_len: i32 = @intCast((argS_attrs).len);
    const cFn = @extern(*const fn ([*:0]const u8, i32, *Analysis, i32, [*]LogAttr, i32) callconv(.c) void, .{ .name = "pango_tailor_break" });
    const ret = cFn(arg_text, arg_length, arg_analysis, arg_offset, arg_attrs, arg_attrs_len);
    return ret;
}
pub fn trimString(arg_str: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "pango_trim_string" });
    const ret = cFn(arg_str);
    return ret;
}
pub fn unicharDirection(arg_ch: u32) Direction {
    const cFn = @extern(*const fn (u32) callconv(.c) Direction, .{ .name = "pango_unichar_direction" });
    const ret = cFn(arg_ch);
    return ret;
}
pub fn unitsFromDouble(arg_d: f64) i32 {
    const cFn = @extern(*const fn (f64) callconv(.c) i32, .{ .name = "pango_units_from_double" });
    const ret = cFn(arg_d);
    return ret;
}
pub fn unitsToDouble(arg_i: i32) f64 {
    const cFn = @extern(*const fn (i32) callconv(.c) f64, .{ .name = "pango_units_to_double" });
    const ret = cFn(arg_i);
    return ret;
}
pub fn version() i32 {
    const cFn = @extern(*const fn () callconv(.c) i32, .{ .name = "pango_version" });
    const ret = cFn();
    return ret;
}
pub fn versionCheck(arg_required_major: i32, arg_required_minor: i32, arg_required_micro: i32) ?[*:0]u8 {
    const cFn = @extern(*const fn (i32, i32, i32) callconv(.c) ?[*:0]u8, .{ .name = "pango_version_check" });
    const ret = cFn(arg_required_major, arg_required_minor, arg_required_micro);
    return ret;
}
pub fn versionString() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "pango_version_string" });
    const ret = cFn();
    return ret;
}

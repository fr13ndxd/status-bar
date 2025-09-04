const core = @import("core.zig");
const GLib = @import("GLib.zig");
const GObject = @This();
pub const Array = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_array_get_type" });
        return cFn();
    }
};
pub const BaseFinalizeFunc = *const fn (arg_g_class: *TypeClass) callconv(.c) void;
pub const BaseInitFunc = *const fn (arg_g_class: *TypeClass) callconv(.c) void;
pub const Binding = struct {
    pub const Parent = Object;
    _props: struct {
        flags: core.Property(BindingFlags, "flags") = .{},
        source: core.Property(Object, "source") = .{},
        @"source-property": core.Property([*:0]const u8, "source-property") = .{},
        target: core.Property(Object, "target") = .{},
        @"target-property": core.Property([*:0]const u8, "target-property") = .{},
    },
    pub fn dupSource(self: *Binding) ?*Object {
        const cFn = @extern(*const fn (*Binding) callconv(.c) ?*Object, .{ .name = "g_binding_dup_source" });
        const ret = cFn(self);
        return ret;
    }
    pub fn dupTarget(self: *Binding) ?*Object {
        const cFn = @extern(*const fn (*Binding) callconv(.c) ?*Object, .{ .name = "g_binding_dup_target" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFlags(self: *Binding) BindingFlags {
        const cFn = @extern(*const fn (*Binding) callconv(.c) BindingFlags, .{ .name = "g_binding_get_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSource(self: *Binding) ?*Object {
        const cFn = @extern(*const fn (*Binding) callconv(.c) ?*Object, .{ .name = "g_binding_get_source" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSourceProperty(self: *Binding) [*:0]u8 {
        const cFn = @extern(*const fn (*Binding) callconv(.c) [*:0]u8, .{ .name = "g_binding_get_source_property" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTarget(self: *Binding) ?*Object {
        const cFn = @extern(*const fn (*Binding) callconv(.c) ?*Object, .{ .name = "g_binding_get_target" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTargetProperty(self: *Binding) [*:0]u8 {
        const cFn = @extern(*const fn (*Binding) callconv(.c) [*:0]u8, .{ .name = "g_binding_get_target_property" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unbind(self: *Binding) void {
        const cFn = @extern(*const fn (*Binding) callconv(.c) void, .{ .name = "g_binding_unbind" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_binding_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const BindingFlags = packed struct(u32) {
    bidirectional: bool = false,
    sync_create: bool = false,
    invert_boolean: bool = false,
    _: u29 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_binding_flags_get_type" });
        return cFn();
    }
};
pub const BindingGroup = struct {
    pub const Parent = Object;
    _props: struct {
        source: core.Property(Object, "source") = .{},
    },
    pub fn new() *BindingGroup {
        const cFn = @extern(*const fn () callconv(.c) *BindingGroup, .{ .name = "g_binding_group_new" });
        const ret = cFn();
        return ret;
    }
    pub fn bind(self: *BindingGroup, arg_source_property: [*:0]const u8, arg_target: *Object, arg_target_property: [*:0]const u8, arg_flags: BindingFlags) void {
        const cFn = @extern(*const fn (*BindingGroup, [*:0]const u8, *Object, [*:0]const u8, BindingFlags) callconv(.c) void, .{ .name = "g_binding_group_bind" });
        const ret = cFn(self, arg_source_property, arg_target, arg_target_property, arg_flags);
        return ret;
    }
    pub fn bindFull(self: *BindingGroup, arg_source_property: [*:0]const u8, arg_target: *Object, arg_target_property: [*:0]const u8, arg_flags: BindingFlags, arg_transform_to: ?*Closure, arg_transform_from: ?*Closure) void {
        const cFn = @extern(*const fn (*BindingGroup, [*:0]const u8, *Object, [*:0]const u8, BindingFlags, ?*Closure, ?*Closure) callconv(.c) void, .{ .name = "g_binding_group_bind_with_closures" });
        const ret = cFn(self, arg_source_property, arg_target, arg_target_property, arg_flags, arg_transform_to, arg_transform_from);
        return ret;
    }
    pub fn dupSource(self: *BindingGroup) ?*Object {
        const cFn = @extern(*const fn (*BindingGroup) callconv(.c) ?*Object, .{ .name = "g_binding_group_dup_source" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setSource(self: *BindingGroup, arg_source: ?*Object) void {
        const cFn = @extern(*const fn (*BindingGroup, ?*Object) callconv(.c) void, .{ .name = "g_binding_group_set_source" });
        const ret = cFn(self, arg_source);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_binding_group_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const BindingTransformFunc = *const fn (arg_binding: *Binding, arg_from_value: *Value, arg_to_value: *Value, arg_user_data: ?*anyopaque) callconv(.c) bool;
pub const BookmarkFile = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_bookmark_file_get_type" });
        return cFn();
    }
};
pub const BoxedCopyFunc = *const fn (arg_boxed: *anyopaque) callconv(.c) *anyopaque;
pub const BoxedFreeFunc = *const fn (arg_boxed: *anyopaque) callconv(.c) void;
pub const ByteArray = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_byte_array_get_type" });
        return cFn();
    }
};
pub const Bytes = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_bytes_get_type" });
        return cFn();
    }
};
pub const CClosure = extern struct {
    closure: Closure,
    callback: ?*anyopaque,
    pub fn marshalBOOLEANBOXEDBOXED(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_BOOLEAN__BOXED_BOXED" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalBOOLEANFLAGS(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_BOOLEAN__FLAGS" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalSTRINGOBJECTPOINTER(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_STRING__OBJECT_POINTER" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDBOOLEAN(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__BOOLEAN" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDBOXED(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__BOXED" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDCHAR(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__CHAR" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDDOUBLE(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__DOUBLE" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDENUM(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__ENUM" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDFLAGS(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__FLAGS" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDFLOAT(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__FLOAT" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDINT(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__INT" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDLONG(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__LONG" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDOBJECT(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__OBJECT" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDPARAM(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__PARAM" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDPOINTER(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__POINTER" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDSTRING(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__STRING" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDUCHAR(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__UCHAR" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDUINT(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__UINT" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDUINTPOINTER(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__UINT_POINTER" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDULONG(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__ULONG" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDVARIANT(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__VARIANT" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalVOIDVOID(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__VOID" });
        const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalGeneric(arg_closure: *Closure, arg_return_gvalue: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_generic" });
        const ret = cFn(arg_closure, arg_return_gvalue, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
        return ret;
    }
};
pub const Callback = *const fn () callconv(.c) void;
pub const Checksum = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_checksum_get_type" });
        return cFn();
    }
};
pub const ClassFinalizeFunc = *const fn (arg_g_class: *TypeClass, arg_class_data: ?*anyopaque) callconv(.c) void;
pub const ClassInitFunc = *const fn (arg_g_class: *TypeClass, arg_class_data: ?*anyopaque) callconv(.c) void;
pub const Closure = extern struct {
    _0: packed struct(u32) {
        ref_count: u15,
        meta_marshal_nouse: bool,
        n_guards: bool,
        n_fnotifiers: u2,
        n_inotifiers: u8,
        in_inotify: bool,
        floating: bool,
        derivative_flag: bool,
        in_marshal: bool,
        is_invalid: bool,
    },
    marshal: ?*const fn (arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: *anyopaque, arg_marshal_data: *anyopaque) callconv(.c) void,
    data: ?*anyopaque,
    notifiers: ?*ClosureNotifyData,
    pub fn newObject(arg_sizeof_closure: u32, arg_object: *Object) *Closure {
        const cFn = @extern(*const fn (u32, *Object) callconv(.c) *Closure, .{ .name = "g_closure_new_object" });
        const ret = cFn(arg_sizeof_closure, arg_object);
        return ret;
    }
    pub fn newSimple(arg_sizeof_closure: u32, arg_data: ?*anyopaque) *Closure {
        const cFn = @extern(*const fn (u32, ?*anyopaque) callconv(.c) *Closure, .{ .name = "g_closure_new_simple" });
        const ret = cFn(arg_sizeof_closure, @ptrCast(arg_data));
        return ret;
    }
    pub fn invalidate(self: *Closure) void {
        const cFn = @extern(*const fn (*Closure) callconv(.c) void, .{ .name = "g_closure_invalidate" });
        const ret = cFn(self);
        return ret;
    }
    pub fn invoke(self: *Closure, arg_return_value: ?*Value, argS_param_values: []Value, arg_invocation_hint: ?*anyopaque) void {
        const arg_n_param_values: u32 = @intCast((argS_param_values).len);
        const arg_param_values: [*]Value = @ptrCast(argS_param_values);
        const cFn = @extern(*const fn (*Closure, ?*Value, u32, [*]Value, ?*anyopaque) callconv(.c) void, .{ .name = "g_closure_invoke" });
        const ret = cFn(self, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint));
        return ret;
    }
    pub fn ref(self: *Closure) *Closure {
        const cFn = @extern(*const fn (*Closure) callconv(.c) *Closure, .{ .name = "g_closure_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn sink(self: *Closure) void {
        const cFn = @extern(*const fn (*Closure) callconv(.c) void, .{ .name = "g_closure_sink" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *Closure) void {
        const cFn = @extern(*const fn (*Closure) callconv(.c) void, .{ .name = "g_closure_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_closure_get_type" });
        return cFn();
    }
};
pub const ClosureMarshal = *const fn (arg_closure: *Closure, arg_return_value: ?*Value, arg_n_param_values: u32, arg_param_values: [*]Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) callconv(.c) void;
pub const ClosureNotify = *const fn (arg_data: ?*anyopaque, arg_closure: *Closure) callconv(.c) void;
pub const ClosureNotifyData = extern struct {
    data: ?*anyopaque,
    notify: ?ClosureNotify,
};
pub const ConnectFlags = packed struct(u32) {
    after: bool = false,
    swapped: bool = false,
    _: u30 = 0,
};
pub const Date = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_date_get_type" });
        return cFn();
    }
};
pub const DateTime = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_date_time_get_type" });
        return cFn();
    }
};
pub const Dir = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dir_get_type" });
        return cFn();
    }
};
pub const EnumClass = extern struct {
    g_type_class: TypeClass,
    minimum: i32,
    maximum: i32,
    n_values: u32,
    values: ?*EnumValue,
};
pub const EnumValue = extern struct {
    value: i32,
    value_name: ?[*:0]const u8,
    value_nick: ?[*:0]const u8,
};
pub const Error = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_error_get_type" });
        return cFn();
    }
};
pub const FlagsClass = extern struct {
    g_type_class: TypeClass,
    mask: u32,
    n_values: u32,
    values: ?*FlagsValue,
};
pub const FlagsValue = extern struct {
    value: u32,
    value_name: ?[*:0]const u8,
    value_nick: ?[*:0]const u8,
};
pub const HashTable = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_hash_table_get_type" });
        return cFn();
    }
};
pub const Hmac = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_hmac_get_type" });
        return cFn();
    }
};
pub const IOChannel = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_io_channel_get_type" });
        return cFn();
    }
};
pub const IOCondition = packed struct(u32) {
    in: bool = false,
    pri: bool = false,
    out: bool = false,
    err: bool = false,
    hup: bool = false,
    nval: bool = false,
    _: u26 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_io_condition_get_type" });
        return cFn();
    }
};
pub const InitiallyUnowned = extern struct {
    pub const Parent = Object;
    pub const Class = InitiallyUnownedClass;
    g_type_instance: TypeInstance,
    ref_count: u32,
    qdata: ?*GLib.Data,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_initially_unowned_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const InitiallyUnownedClass = extern struct {
    g_type_class: TypeClass,
    construct_properties: ?*GLib.SList,
    constructor: ?*anyopaque,
    set_property: ?*const fn (arg_object: *Object, arg_property_id: u32, arg_value: *Value, arg_pspec: *ParamSpec) callconv(.c) void,
    get_property: ?*const fn (arg_object: *Object, arg_property_id: u32, arg_value: *Value, arg_pspec: *ParamSpec) callconv(.c) void,
    dispose: ?*const fn (arg_object: *Object) callconv(.c) void,
    finalize: ?*const fn (arg_object: *Object) callconv(.c) void,
    dispatch_properties_changed: ?*const fn (arg_object: *Object, arg_n_pspecs: u32, arg_pspecs: *ParamSpec) callconv(.c) void,
    notify: ?*const fn (arg_object: *Object, arg_pspec: *ParamSpec) callconv(.c) void,
    constructed: ?*const fn (arg_object: *Object) callconv(.c) void,
    flags: u64,
    n_construct_properties: u64,
    pspecs: ?*anyopaque,
    n_pspecs: u64,
    pdummy: [3]?*anyopaque,
};
pub const InstanceInitFunc = *const fn (arg_instance: *TypeInstance, arg_g_class: *TypeClass) callconv(.c) void;
pub const InterfaceFinalizeFunc = *const fn (arg_g_iface: *TypeInterface, arg_iface_data: ?*anyopaque) callconv(.c) void;
pub const InterfaceInfo = extern struct {
    interface_init: ?InterfaceInitFunc,
    interface_finalize: ?InterfaceFinalizeFunc,
    interface_data: ?*anyopaque,
};
pub const InterfaceInitFunc = *const fn (arg_g_iface: *TypeInterface, arg_iface_data: ?*anyopaque) callconv(.c) void;
pub const KeyFile = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_key_file_get_type" });
        return cFn();
    }
};
pub const MainContext = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_main_context_get_type" });
        return cFn();
    }
};
pub const MainLoop = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_main_loop_get_type" });
        return cFn();
    }
};
pub const MappedFile = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_mapped_file_get_type" });
        return cFn();
    }
};
pub const MarkupParseContext = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_markup_parse_context_get_type" });
        return cFn();
    }
};
pub const MatchInfo = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_match_info_get_type" });
        return cFn();
    }
};
pub const Object = extern struct {
    pub const Class = ObjectClass;
    _signals: struct {
        notify: core.Signal(fn (*Object, *ParamSpec) void, "notify") = .{},
    },
    g_type_instance: TypeInstance,
    ref_count: u32,
    qdata: ?*GLib.Data,
    pub fn newv(arg_object_type: core.Type, argS_parameters: []Parameter) *Object {
        const arg_n_parameters: u32 = @intCast((argS_parameters).len);
        const arg_parameters: [*]Parameter = @ptrCast(argS_parameters);
        const cFn = @extern(*const fn (core.Type, u32, [*]Parameter) callconv(.c) *Object, .{ .name = "g_object_newv" });
        const ret = cFn(arg_object_type, arg_n_parameters, arg_parameters);
        return ret;
    }
    pub fn compatControl(arg_what: u64, arg_data: ?*anyopaque) u64 {
        const cFn = @extern(*const fn (u64, ?*anyopaque) callconv(.c) u64, .{ .name = "g_object_compat_control" });
        const ret = cFn(arg_what, @ptrCast(arg_data));
        return ret;
    }
    pub fn interfaceFindProperty(arg_g_iface: *TypeInterface, arg_property_name: [*:0]const u8) *ParamSpec {
        const cFn = @extern(*const fn (*TypeInterface, [*:0]const u8) callconv(.c) *ParamSpec, .{ .name = "g_object_interface_find_property" });
        const ret = cFn(arg_g_iface, arg_property_name);
        return ret;
    }
    pub fn interfaceInstallProperty(arg_g_iface: *TypeInterface, arg_pspec: *ParamSpec) void {
        const cFn = @extern(*const fn (*TypeInterface, *ParamSpec) callconv(.c) void, .{ .name = "g_object_interface_install_property" });
        const ret = cFn(arg_g_iface, arg_pspec);
        return ret;
    }
    pub fn interfaceListProperties(arg_g_iface: *TypeInterface) []*ParamSpec {
        var argO_n_properties_p: u32 = undefined;
        const arg_n_properties_p: *u32 = &argO_n_properties_p;
        const cFn = @extern(*const fn (*TypeInterface, *u32) callconv(.c) [*]*ParamSpec, .{ .name = "g_object_interface_list_properties" });
        const ret = cFn(arg_g_iface, arg_n_properties_p);
        return ret[0..@intCast(argO_n_properties_p)];
    }
    pub fn bindProperty(self: *Object, arg_source_property: [*:0]const u8, arg_target: *Object, arg_target_property: [*:0]const u8, arg_flags: BindingFlags) *Binding {
        const cFn = @extern(*const fn (*Object, [*:0]const u8, *Object, [*:0]const u8, BindingFlags) callconv(.c) *Binding, .{ .name = "g_object_bind_property" });
        const ret = cFn(self, arg_source_property, arg_target, arg_target_property, arg_flags);
        return ret;
    }
    pub fn bindPropertyFull(self: *Object, arg_source_property: [*:0]const u8, arg_target: *Object, arg_target_property: [*:0]const u8, arg_flags: BindingFlags, arg_transform_to: *Closure, arg_transform_from: *Closure) *Binding {
        const cFn = @extern(*const fn (*Object, [*:0]const u8, *Object, [*:0]const u8, BindingFlags, *Closure, *Closure) callconv(.c) *Binding, .{ .name = "g_object_bind_property_with_closures" });
        const ret = cFn(self, arg_source_property, arg_target, arg_target_property, arg_flags, arg_transform_to, arg_transform_from);
        return ret;
    }
    pub fn forceFloating(self: *Object) void {
        const cFn = @extern(*const fn (*Object) callconv(.c) void, .{ .name = "g_object_force_floating" });
        const ret = cFn(self);
        return ret;
    }
    pub fn freezeNotify(self: *Object) void {
        const cFn = @extern(*const fn (*Object) callconv(.c) void, .{ .name = "g_object_freeze_notify" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getData(self: *Object, arg_key: [*:0]const u8) ?*anyopaque {
        const cFn = @extern(*const fn (*Object, [*:0]const u8) callconv(.c) ?*anyopaque, .{ .name = "g_object_get_data" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getProperty(self: *Object, arg_property_name: [*:0]const u8, arg_value: *Value) void {
        const cFn = @extern(*const fn (*Object, [*:0]const u8, *Value) callconv(.c) void, .{ .name = "g_object_get_property" });
        const ret = cFn(self, arg_property_name, arg_value);
        return ret;
    }
    pub fn getQdata(self: *Object, arg_quark: u32) ?*anyopaque {
        const cFn = @extern(*const fn (*Object, u32) callconv(.c) ?*anyopaque, .{ .name = "g_object_get_qdata" });
        const ret = cFn(self, arg_quark);
        return ret;
    }
    pub fn getv(self: *Object, argS_names: [][*:0]const u8, argS_values: []Value) void {
        const arg_n_properties: u32 = @intCast((argS_names).len);
        const arg_names: [*][*:0]const u8 = @ptrCast(argS_names);
        const arg_values: [*]Value = @ptrCast(argS_values);
        const cFn = @extern(*const fn (*Object, u32, [*][*:0]const u8, [*]Value) callconv(.c) void, .{ .name = "g_object_getv" });
        const ret = cFn(self, arg_n_properties, arg_names, arg_values);
        return ret;
    }
    pub fn isFloating(self: *Object) bool {
        const cFn = @extern(*const fn (*Object) callconv(.c) bool, .{ .name = "g_object_is_floating" });
        const ret = cFn(self);
        return ret;
    }
    pub fn notify(self: *Object, arg_property_name: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Object, [*:0]const u8) callconv(.c) void, .{ .name = "g_object_notify" });
        const ret = cFn(self, arg_property_name);
        return ret;
    }
    pub fn notifyByPspec(self: *Object, arg_pspec: *ParamSpec) void {
        const cFn = @extern(*const fn (*Object, *ParamSpec) callconv(.c) void, .{ .name = "g_object_notify_by_pspec" });
        const ret = cFn(self, arg_pspec);
        return ret;
    }
    pub fn ref(self: *Object) *Object {
        const cFn = @extern(*const fn (*Object) callconv(.c) *Object, .{ .name = "g_object_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn refSink(self: *Object) *Object {
        const cFn = @extern(*const fn (*Object) callconv(.c) *Object, .{ .name = "g_object_ref_sink" });
        const ret = cFn(self);
        return ret;
    }
    pub fn runDispose(self: *Object) void {
        const cFn = @extern(*const fn (*Object) callconv(.c) void, .{ .name = "g_object_run_dispose" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setData(self: *Object, arg_key: [*:0]const u8, arg_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Object, [*:0]const u8, ?*anyopaque) callconv(.c) void, .{ .name = "g_object_set_data" });
        const ret = cFn(self, arg_key, @ptrCast(arg_data));
        return ret;
    }
    pub fn setProperty(self: *Object, arg_property_name: [*:0]const u8, arg_value: *Value) void {
        const cFn = @extern(*const fn (*Object, [*:0]const u8, *Value) callconv(.c) void, .{ .name = "g_object_set_property" });
        const ret = cFn(self, arg_property_name, arg_value);
        return ret;
    }
    pub fn stealData(self: *Object, arg_key: [*:0]const u8) ?*anyopaque {
        const cFn = @extern(*const fn (*Object, [*:0]const u8) callconv(.c) ?*anyopaque, .{ .name = "g_object_steal_data" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn stealQdata(self: *Object, arg_quark: u32) ?*anyopaque {
        const cFn = @extern(*const fn (*Object, u32) callconv(.c) ?*anyopaque, .{ .name = "g_object_steal_qdata" });
        const ret = cFn(self, arg_quark);
        return ret;
    }
    pub fn thawNotify(self: *Object) void {
        const cFn = @extern(*const fn (*Object) callconv(.c) void, .{ .name = "g_object_thaw_notify" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *Object) void {
        const cFn = @extern(*const fn (*Object) callconv(.c) void, .{ .name = "g_object_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn watchClosure(self: *Object, arg_closure: *Closure) void {
        const cFn = @extern(*const fn (*Object, *Closure) callconv(.c) void, .{ .name = "g_object_watch_closure" });
        const ret = cFn(self, arg_closure);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_object_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ObjectClass = extern struct {
    g_type_class: TypeClass,
    construct_properties: ?*GLib.SList,
    constructor: ?*anyopaque,
    set_property: ?*const fn (arg_object: *Object, arg_property_id: u32, arg_value: *Value, arg_pspec: *ParamSpec) callconv(.c) void,
    get_property: ?*const fn (arg_object: *Object, arg_property_id: u32, arg_value: *Value, arg_pspec: *ParamSpec) callconv(.c) void,
    dispose: ?*const fn (arg_object: *Object) callconv(.c) void,
    finalize: ?*const fn (arg_object: *Object) callconv(.c) void,
    dispatch_properties_changed: ?*const fn (arg_object: *Object, arg_n_pspecs: u32, arg_pspecs: *ParamSpec) callconv(.c) void,
    notify: ?*const fn (arg_object: *Object, arg_pspec: *ParamSpec) callconv(.c) void,
    constructed: ?*const fn (arg_object: *Object) callconv(.c) void,
    flags: u64,
    n_construct_properties: u64,
    pspecs: ?*anyopaque,
    n_pspecs: u64,
    pdummy: [3]?*anyopaque,
    pub fn findProperty(self: *ObjectClass, arg_property_name: [*:0]const u8) *ParamSpec {
        const cFn = @extern(*const fn (*ObjectClass, [*:0]const u8) callconv(.c) *ParamSpec, .{ .name = "g_object_class_find_property" });
        const ret = cFn(self, arg_property_name);
        return ret;
    }
    pub fn installProperties(self: *ObjectClass, argS_pspecs: []*ParamSpec) void {
        const arg_n_pspecs: u32 = @intCast((argS_pspecs).len);
        const arg_pspecs: [*]*ParamSpec = @ptrCast(argS_pspecs);
        const cFn = @extern(*const fn (*ObjectClass, u32, [*]*ParamSpec) callconv(.c) void, .{ .name = "g_object_class_install_properties" });
        const ret = cFn(self, arg_n_pspecs, arg_pspecs);
        return ret;
    }
    pub fn installProperty(self: *ObjectClass, arg_property_id: u32, arg_pspec: *ParamSpec) void {
        const cFn = @extern(*const fn (*ObjectClass, u32, *ParamSpec) callconv(.c) void, .{ .name = "g_object_class_install_property" });
        const ret = cFn(self, arg_property_id, arg_pspec);
        return ret;
    }
    pub fn listProperties(self: *ObjectClass) []*ParamSpec {
        var argO_n_properties: u32 = undefined;
        const arg_n_properties: *u32 = &argO_n_properties;
        const cFn = @extern(*const fn (*ObjectClass, *u32) callconv(.c) [*]*ParamSpec, .{ .name = "g_object_class_list_properties" });
        const ret = cFn(self, arg_n_properties);
        return ret[0..@intCast(argO_n_properties)];
    }
    pub fn overrideProperty(self: *ObjectClass, arg_property_id: u32, arg_name: [*:0]const u8) void {
        const cFn = @extern(*const fn (*ObjectClass, u32, [*:0]const u8) callconv(.c) void, .{ .name = "g_object_class_override_property" });
        const ret = cFn(self, arg_property_id, arg_name);
        return ret;
    }
};
pub const ObjectConstructParam = extern struct {
    pspec: ?*ParamSpec,
    value: ?*Value,
};
pub const ObjectFinalizeFunc = *const fn (arg_object: *Object) callconv(.c) void;
pub const ObjectGetPropertyFunc = *const fn (arg_object: *Object, arg_property_id: u32, arg_value: *Value, arg_pspec: *ParamSpec) callconv(.c) void;
pub const ObjectSetPropertyFunc = *const fn (arg_object: *Object, arg_property_id: u32, arg_value: *Value, arg_pspec: *ParamSpec) callconv(.c) void;
pub const OptionGroup = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_option_group_get_type" });
        return cFn();
    }
};
pub const PARAM_MASK = 255;
pub const PARAM_STATIC_STRINGS = 224;
pub const PARAM_USER_SHIFT = 8;
pub const ParamFlags = packed struct(u32) {
    readable: bool = false,
    writable: bool = false,
    construct: bool = false,
    construct_only: bool = false,
    lax_validation: bool = false,
    static_name: bool = false,
    static_nick: bool = false,
    static_blurb: bool = false,
    _8: u22 = 0,
    explicit_notify: bool = false,
    deprecated: bool = false,
    pub const readwrite: @This() = @bitCast(@as(u32, 3));
};
pub const ParamSpec = extern struct {
    pub const Class = ParamSpecClass;
    g_type_instance: TypeInstance,
    name: ?[*:0]const u8,
    flags: ParamFlags,
    value_type: core.Type,
    owner_type: core.Type,
    _nick: ?[*:0]const u8,
    _blurb: ?[*:0]const u8,
    qdata: ?*GLib.Data,
    ref_count: u32,
    param_id: u32,
    pub fn isValidName(arg_name: [*:0]const u8) bool {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_param_spec_is_valid_name" });
        const ret = cFn(arg_name);
        return ret;
    }
    pub fn getBlurb(self: *ParamSpec) ?[*:0]u8 {
        const cFn = @extern(*const fn (*ParamSpec) callconv(.c) ?[*:0]u8, .{ .name = "g_param_spec_get_blurb" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDefaultValue(self: *ParamSpec) *Value {
        const cFn = @extern(*const fn (*ParamSpec) callconv(.c) *Value, .{ .name = "g_param_spec_get_default_value" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getName(self: *ParamSpec) [*:0]u8 {
        const cFn = @extern(*const fn (*ParamSpec) callconv(.c) [*:0]u8, .{ .name = "g_param_spec_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNameQuark(self: *ParamSpec) u32 {
        const cFn = @extern(*const fn (*ParamSpec) callconv(.c) u32, .{ .name = "g_param_spec_get_name_quark" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNick(self: *ParamSpec) [*:0]u8 {
        const cFn = @extern(*const fn (*ParamSpec) callconv(.c) [*:0]u8, .{ .name = "g_param_spec_get_nick" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getQdata(self: *ParamSpec, arg_quark: u32) ?*anyopaque {
        const cFn = @extern(*const fn (*ParamSpec, u32) callconv(.c) ?*anyopaque, .{ .name = "g_param_spec_get_qdata" });
        const ret = cFn(self, arg_quark);
        return ret;
    }
    pub fn getRedirectTarget(self: *ParamSpec) ?*ParamSpec {
        const cFn = @extern(*const fn (*ParamSpec) callconv(.c) ?*ParamSpec, .{ .name = "g_param_spec_get_redirect_target" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setQdata(self: *ParamSpec, arg_quark: u32, arg_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*ParamSpec, u32, ?*anyopaque) callconv(.c) void, .{ .name = "g_param_spec_set_qdata" });
        const ret = cFn(self, arg_quark, @ptrCast(arg_data));
        return ret;
    }
    pub fn sink(self: *ParamSpec) void {
        const cFn = @extern(*const fn (*ParamSpec) callconv(.c) void, .{ .name = "g_param_spec_sink" });
        const ret = cFn(self);
        return ret;
    }
    pub fn stealQdata(self: *ParamSpec, arg_quark: u32) ?*anyopaque {
        const cFn = @extern(*const fn (*ParamSpec, u32) callconv(.c) ?*anyopaque, .{ .name = "g_param_spec_steal_qdata" });
        const ret = cFn(self, arg_quark);
        return ret;
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecBoolean = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    default_value: bool,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecBoxed = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecChar = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    minimum: i8,
    maximum: i8,
    default_value: i8,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecClass = extern struct {
    g_type_class: TypeClass,
    value_type: core.Type,
    finalize: ?*const fn (arg_pspec: *ParamSpec) callconv(.c) void,
    value_set_default: ?*const fn (arg_pspec: *ParamSpec, arg_value: *Value) callconv(.c) void,
    value_validate: ?*const fn (arg_pspec: *ParamSpec, arg_value: *Value) callconv(.c) bool,
    values_cmp: ?*const fn (arg_pspec: *ParamSpec, arg_value1: *Value, arg_value2: *Value) callconv(.c) i32,
    value_is_valid: ?*const fn (arg_pspec: *ParamSpec, arg_value: *Value) callconv(.c) bool,
    dummy: [3]?*anyopaque,
};
pub const ParamSpecDouble = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    minimum: f64,
    maximum: f64,
    default_value: f64,
    epsilon: f64,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecEnum = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    enum_class: ?*EnumClass,
    default_value: i32,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecFlags = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    flags_class: ?*FlagsClass,
    default_value: u32,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecFloat = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    minimum: f32,
    maximum: f32,
    default_value: f32,
    epsilon: f32,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecGType = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    is_a_type: core.Type,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecInt = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    minimum: i32,
    maximum: i32,
    default_value: i32,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecInt64 = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    minimum: i64,
    maximum: i64,
    default_value: i64,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecLong = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    minimum: i64,
    maximum: i64,
    default_value: i64,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecObject = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecOverride = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    overridden: ?*ParamSpec,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecParam = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecPointer = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecPool = opaque {
    pub fn free(self: *ParamSpecPool) void {
        const cFn = @extern(*const fn (*ParamSpecPool) callconv(.c) void, .{ .name = "g_param_spec_pool_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn insert(self: *ParamSpecPool, arg_pspec: *ParamSpec, arg_owner_type: core.Type) void {
        const cFn = @extern(*const fn (*ParamSpecPool, *ParamSpec, core.Type) callconv(.c) void, .{ .name = "g_param_spec_pool_insert" });
        const ret = cFn(self, arg_pspec, arg_owner_type);
        return ret;
    }
    pub fn list(self: *ParamSpecPool, arg_owner_type: core.Type) []*ParamSpec {
        var argO_n_pspecs_p: u32 = undefined;
        const arg_n_pspecs_p: *u32 = &argO_n_pspecs_p;
        const cFn = @extern(*const fn (*ParamSpecPool, core.Type, *u32) callconv(.c) [*]*ParamSpec, .{ .name = "g_param_spec_pool_list" });
        const ret = cFn(self, arg_owner_type, arg_n_pspecs_p);
        return ret[0..@intCast(argO_n_pspecs_p)];
    }
    pub fn listOwned(self: *ParamSpecPool, arg_owner_type: core.Type) ?*GLib.List {
        const cFn = @extern(*const fn (*ParamSpecPool, core.Type) callconv(.c) ?*GLib.List, .{ .name = "g_param_spec_pool_list_owned" });
        const ret = cFn(self, arg_owner_type);
        return ret;
    }
    pub fn lookup(self: *ParamSpecPool, arg_param_name: [*:0]const u8, arg_owner_type: core.Type, arg_walk_ancestors: bool) ?*ParamSpec {
        const cFn = @extern(*const fn (*ParamSpecPool, [*:0]const u8, core.Type, bool) callconv(.c) ?*ParamSpec, .{ .name = "g_param_spec_pool_lookup" });
        const ret = cFn(self, arg_param_name, arg_owner_type, arg_walk_ancestors);
        return ret;
    }
    pub fn remove(self: *ParamSpecPool, arg_pspec: *ParamSpec) void {
        const cFn = @extern(*const fn (*ParamSpecPool, *ParamSpec) callconv(.c) void, .{ .name = "g_param_spec_pool_remove" });
        const ret = cFn(self, arg_pspec);
        return ret;
    }
};
pub const ParamSpecString = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    default_value: ?[*:0]const u8,
    cset_first: ?[*:0]const u8,
    cset_nth: ?[*:0]const u8,
    substitutor: i8,
    _100: packed struct(u32) {
        null_fold_if_empty: bool,
        ensure_non_null: bool,
        _: u30,
    },
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecTypeInfo = extern struct {
    instance_size: u16,
    n_preallocs: u16,
    instance_init: ?*const fn (arg_pspec: *ParamSpec) callconv(.c) void,
    value_type: core.Type,
    finalize: ?*const fn (arg_pspec: *ParamSpec) callconv(.c) void,
    value_set_default: ?*const fn (arg_pspec: *ParamSpec, arg_value: *Value) callconv(.c) void,
    value_validate: ?*const fn (arg_pspec: *ParamSpec, arg_value: *Value) callconv(.c) bool,
    values_cmp: ?*const fn (arg_pspec: *ParamSpec, arg_value1: *Value, arg_value2: *Value) callconv(.c) i32,
};
pub const ParamSpecUChar = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    minimum: u8,
    maximum: u8,
    default_value: u8,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecUInt = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    minimum: u32,
    maximum: u32,
    default_value: u32,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecUInt64 = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    minimum: u64,
    maximum: u64,
    default_value: u64,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecULong = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    minimum: u64,
    maximum: u64,
    default_value: u64,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecUnichar = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    default_value: u32,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecValueArray = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    element_spec: ?*ParamSpec,
    fixed_n_elements: u32,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ParamSpecVariant = extern struct {
    pub const Parent = ParamSpec;
    parent_instance: ParamSpec,
    type: ?*GLib.VariantType,
    default_value: ?*GLib.Variant,
    padding: [4]?*anyopaque,
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const Parameter = extern struct {
    name: ?[*:0]const u8,
    value: Value,
};
pub const PatternSpec = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_pattern_spec_get_type" });
        return cFn();
    }
};
pub const PollFD = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_pollfd_get_type" });
        return cFn();
    }
};
pub const PtrArray = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_ptr_array_get_type" });
        return cFn();
    }
};
pub const Rand = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_rand_get_type" });
        return cFn();
    }
};
pub const Regex = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_regex_get_type" });
        return cFn();
    }
};
pub const SIGNAL_FLAGS_MASK = 511;
pub const SIGNAL_MATCH_MASK = 63;
pub const SignalAccumulator = *const fn (arg_ihint: *SignalInvocationHint, arg_return_accu: *Value, arg_handler_return: *Value, arg_data: ?*anyopaque) callconv(.c) bool;
pub const SignalEmissionHook = *const fn (arg_ihint: *SignalInvocationHint, arg_n_param_values: u32, arg_param_values: [*]Value, arg_data: ?*anyopaque) callconv(.c) bool;
pub const SignalFlags = packed struct(u32) {
    run_first: bool = false,
    run_last: bool = false,
    run_cleanup: bool = false,
    no_recurse: bool = false,
    detailed: bool = false,
    action: bool = false,
    no_hooks: bool = false,
    must_collect: bool = false,
    deprecated: bool = false,
    _9: u8 = 0,
    accumulator_first_run: bool = false,
    _: u14 = 0,
};
pub const SignalGroup = struct {
    pub const Parent = Object;
    _props: struct {
        target: core.Property(Object, "target") = .{},
        @"target-type": core.Property(core.Type, "target-type") = .{},
    },
    _signals: struct {
        bind: core.Signal(fn (*SignalGroup, *Object) void, "bind") = .{},
        unbind: core.Signal(fn (*SignalGroup) void, "unbind") = .{},
    },
    pub fn new(arg_target_type: core.Type) *SignalGroup {
        const cFn = @extern(*const fn (core.Type) callconv(.c) *SignalGroup, .{ .name = "g_signal_group_new" });
        const ret = cFn(arg_target_type);
        return ret;
    }
    pub fn block(self: *SignalGroup) void {
        const cFn = @extern(*const fn (*SignalGroup) callconv(.c) void, .{ .name = "g_signal_group_block" });
        const ret = cFn(self);
        return ret;
    }
    pub fn connectClosure(self: *SignalGroup, arg_detailed_signal: [*:0]const u8, arg_closure: *Closure, arg_after: bool) void {
        const cFn = @extern(*const fn (*SignalGroup, [*:0]const u8, *Closure, bool) callconv(.c) void, .{ .name = "g_signal_group_connect_closure" });
        const ret = cFn(self, arg_detailed_signal, arg_closure, arg_after);
        return ret;
    }
    pub fn connectData(self: *SignalGroup, arg_detailed_signal: [*:0]const u8, argC_c_handler: core.Closure(Callback), arg_flags: ConnectFlags) void {
        const arg_c_handler: Callback = @ptrCast(argC_c_handler.callback());
        const arg_data: ?*anyopaque = @ptrCast(argC_c_handler.data());
        const arg_notify: ClosureNotify = @ptrCast(argC_c_handler.destroy());
        const cFn = @extern(*const fn (*SignalGroup, [*:0]const u8, Callback, ?*anyopaque, ClosureNotify, ConnectFlags) callconv(.c) void, .{ .name = "g_signal_group_connect_data" });
        const ret = cFn(self, arg_detailed_signal, arg_c_handler, @ptrCast(arg_data), arg_notify, arg_flags);
        return ret;
    }
    pub fn connectSwapped(self: *SignalGroup, arg_detailed_signal: [*:0]const u8, argC_c_handler: core.Closure(Callback)) void {
        const arg_c_handler: Callback = @ptrCast(argC_c_handler.callback());
        argC_c_handler.closure.once = true;
        const arg_data: ?*anyopaque = @ptrCast(argC_c_handler.data());
        const cFn = @extern(*const fn (*SignalGroup, [*:0]const u8, Callback, ?*anyopaque) callconv(.c) void, .{ .name = "g_signal_group_connect_swapped" });
        const ret = cFn(self, arg_detailed_signal, arg_c_handler, @ptrCast(arg_data));
        return ret;
    }
    pub fn dupTarget(self: *SignalGroup) ?*Object {
        const cFn = @extern(*const fn (*SignalGroup) callconv(.c) ?*Object, .{ .name = "g_signal_group_dup_target" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setTarget(self: *SignalGroup, arg_target: ?*Object) void {
        const cFn = @extern(*const fn (*SignalGroup, ?*Object) callconv(.c) void, .{ .name = "g_signal_group_set_target" });
        const ret = cFn(self, arg_target);
        return ret;
    }
    pub fn unblock(self: *SignalGroup) void {
        const cFn = @extern(*const fn (*SignalGroup) callconv(.c) void, .{ .name = "g_signal_group_unblock" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_signal_group_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SignalInvocationHint = extern struct {
    signal_id: u32,
    detail: u32,
    run_type: SignalFlags,
};
pub const SignalMatchType = packed struct(u32) {
    id: bool = false,
    detail: bool = false,
    closure: bool = false,
    func: bool = false,
    data: bool = false,
    unblocked: bool = false,
    _: u26 = 0,
};
pub const SignalQuery = extern struct {
    signal_id: u32,
    signal_name: ?[*:0]const u8,
    itype: core.Type,
    signal_flags: SignalFlags,
    return_type: core.Type,
    n_params: u32,
    param_types: ?[*]core.Type,
};
pub const Source = opaque {
    pub fn setClosure(arg_source: *GLib.Source, arg_closure: *Closure) void {
        const cFn = @extern(*const fn (*GLib.Source, *Closure) callconv(.c) void, .{ .name = "g_source_set_closure" });
        const ret = cFn(arg_source, arg_closure);
        return ret;
    }
    pub fn setDummyCallback(arg_source: *GLib.Source) void {
        const cFn = @extern(*const fn (*GLib.Source) callconv(.c) void, .{ .name = "g_source_set_dummy_callback" });
        const ret = cFn(arg_source);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_source_get_type" });
        return cFn();
    }
};
pub const String = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_gstring_get_type" });
        return cFn();
    }
};
pub const Strv = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_strv_get_type" });
        return cFn();
    }
};
pub const StrvBuilder = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_strv_builder_get_type" });
        return cFn();
    }
};
pub const TYPE_FLAG_RESERVED_ID_BIT = 1;
pub const TYPE_FUNDAMENTAL_MAX = 1020;
pub const TYPE_FUNDAMENTAL_SHIFT = 2;
pub const TYPE_RESERVED_BSE_FIRST = 32;
pub const TYPE_RESERVED_BSE_LAST = 48;
pub const TYPE_RESERVED_GLIB_FIRST = 22;
pub const TYPE_RESERVED_GLIB_LAST = 31;
pub const TYPE_RESERVED_USER_FIRST = 49;
pub const Thread = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_thread_get_type" });
        return cFn();
    }
};
pub const TimeZone = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_time_zone_get_type" });
        return cFn();
    }
};
pub const ToggleNotify = *const fn (arg_data: ?*anyopaque, arg_object: *Object, arg_is_last_ref: bool) callconv(.c) void;
pub const Tree = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tree_get_type" });
        return cFn();
    }
};
pub const TypeCValue = extern union {
    v_int: i32,
    v_long: i64,
    v_int64: i64,
    v_double: f64,
    v_pointer: ?*anyopaque,
};
pub const TypeClass = extern struct {
    g_type: core.Type,
    pub fn addPrivate(self: *TypeClass, arg_private_size: u64) void {
        const cFn = @extern(*const fn (*TypeClass, u64) callconv(.c) void, .{ .name = "g_type_class_add_private" });
        const ret = cFn(self, arg_private_size);
        return ret;
    }
    pub fn getPrivate(self: *TypeClass, arg_private_type: core.Type) ?*anyopaque {
        const cFn = @extern(*const fn (*TypeClass, core.Type) callconv(.c) ?*anyopaque, .{ .name = "g_type_class_get_private" });
        const ret = cFn(self, arg_private_type);
        return ret;
    }
    pub fn peekParent(self: *TypeClass) *TypeClass {
        const cFn = @extern(*const fn (*TypeClass) callconv(.c) *TypeClass, .{ .name = "g_type_class_peek_parent" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *TypeClass) void {
        const cFn = @extern(*const fn (*TypeClass) callconv(.c) void, .{ .name = "g_type_class_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn adjustPrivateOffset(arg_g_class: ?*anyopaque, arg_private_size_or_offset: *i32) void {
        const cFn = @extern(*const fn (?*anyopaque, *i32) callconv(.c) void, .{ .name = "g_type_class_adjust_private_offset" });
        const ret = cFn(@ptrCast(arg_g_class), arg_private_size_or_offset);
        return ret;
    }
    pub fn get(arg_type: core.Type) *TypeClass {
        const cFn = @extern(*const fn (core.Type) callconv(.c) *TypeClass, .{ .name = "g_type_class_get" });
        const ret = cFn(arg_type);
        return ret;
    }
    pub fn peek(arg_type: core.Type) ?*TypeClass {
        const cFn = @extern(*const fn (core.Type) callconv(.c) ?*TypeClass, .{ .name = "g_type_class_peek" });
        const ret = cFn(arg_type);
        return ret;
    }
    pub fn peekStatic(arg_type: core.Type) ?*TypeClass {
        const cFn = @extern(*const fn (core.Type) callconv(.c) ?*TypeClass, .{ .name = "g_type_class_peek_static" });
        const ret = cFn(arg_type);
        return ret;
    }
    pub fn ref(arg_type: core.Type) *TypeClass {
        const cFn = @extern(*const fn (core.Type) callconv(.c) *TypeClass, .{ .name = "g_type_class_ref" });
        const ret = cFn(arg_type);
        return ret;
    }
};
pub const TypeClassCacheFunc = *const fn (arg_cache_data: ?*anyopaque, arg_g_class: *TypeClass) callconv(.c) bool;
pub const TypeDebugFlags = packed struct(u32) {
    objects: bool = false,
    signals: bool = false,
    instance_count: bool = false,
    _: u29 = 0,
    pub const mask: @This() = @bitCast(@as(u32, 7));
};
pub const TypeFlags = packed struct(u32) {
    _0: u4 = 0,
    abstract: bool = false,
    value_abstract: bool = false,
    final: bool = false,
    deprecated: bool = false,
    _: u24 = 0,
};
pub const TypeFundamentalFlags = packed struct(u32) {
    classed: bool = false,
    instantiatable: bool = false,
    derivable: bool = false,
    deep_derivable: bool = false,
    _: u28 = 0,
};
pub const TypeFundamentalInfo = extern struct {
    type_flags: TypeFundamentalFlags,
};
pub const TypeInfo = extern struct {
    class_size: u16,
    base_init: ?BaseInitFunc,
    base_finalize: ?BaseFinalizeFunc,
    class_init: ?ClassInitFunc,
    class_finalize: ?ClassFinalizeFunc,
    class_data: ?*anyopaque,
    instance_size: u16,
    n_preallocs: u16,
    instance_init: ?InstanceInitFunc,
    value_table: ?*TypeValueTable,
};
pub const TypeInstance = extern struct {
    g_class: ?*TypeClass,
    pub fn getPrivate(self: *TypeInstance, arg_private_type: core.Type) ?*anyopaque {
        const cFn = @extern(*const fn (*TypeInstance, core.Type) callconv(.c) ?*anyopaque, .{ .name = "g_type_instance_get_private" });
        const ret = cFn(self, arg_private_type);
        return ret;
    }
};
pub const TypeInterface = extern struct {
    g_type: core.Type,
    g_instance_type: core.Type,
    pub fn peekParent(self: *TypeInterface) ?*TypeInterface {
        const cFn = @extern(*const fn (*TypeInterface) callconv(.c) ?*TypeInterface, .{ .name = "g_type_interface_peek_parent" });
        const ret = cFn(self);
        return ret;
    }
    pub fn addPrerequisite(arg_interface_type: core.Type, arg_prerequisite_type: core.Type) void {
        const cFn = @extern(*const fn (core.Type, core.Type) callconv(.c) void, .{ .name = "g_type_interface_add_prerequisite" });
        const ret = cFn(arg_interface_type, arg_prerequisite_type);
        return ret;
    }
    pub fn getPlugin(arg_instance_type: core.Type, arg_interface_type: core.Type) *TypePlugin {
        const cFn = @extern(*const fn (core.Type, core.Type) callconv(.c) *TypePlugin, .{ .name = "g_type_interface_get_plugin" });
        const ret = cFn(arg_instance_type, arg_interface_type);
        return ret;
    }
    pub fn instantiatablePrerequisite(arg_interface_type: core.Type) core.Type {
        const cFn = @extern(*const fn (core.Type) callconv(.c) core.Type, .{ .name = "g_type_interface_instantiatable_prerequisite" });
        const ret = cFn(arg_interface_type);
        return ret;
    }
    pub fn peek(arg_instance_class: *TypeClass, arg_iface_type: core.Type) ?*TypeInterface {
        const cFn = @extern(*const fn (*TypeClass, core.Type) callconv(.c) ?*TypeInterface, .{ .name = "g_type_interface_peek" });
        const ret = cFn(arg_instance_class, arg_iface_type);
        return ret;
    }
    pub fn prerequisites(arg_interface_type: core.Type) []core.Type {
        var argO_n_prerequisites: u32 = undefined;
        const arg_n_prerequisites: ?*u32 = &argO_n_prerequisites;
        const cFn = @extern(*const fn (core.Type, ?*u32) callconv(.c) [*]core.Type, .{ .name = "g_type_interface_prerequisites" });
        const ret = cFn(arg_interface_type, arg_n_prerequisites);
        return ret[0..@intCast(argO_n_prerequisites)];
    }
};
pub const TypeInterfaceCheckFunc = *const fn (arg_check_data: ?*anyopaque, arg_g_iface: *TypeInterface) callconv(.c) void;
pub const TypeModule = extern struct {
    pub const Interfaces = [_]type{TypePlugin};
    pub const Parent = Object;
    pub const Class = TypeModuleClass;
    parent_instance: Object,
    use_count: u32,
    type_infos: ?*GLib.SList,
    interface_infos: ?*GLib.SList,
    name: ?[*:0]const u8,
    pub fn addInterface(self: *TypeModule, arg_instance_type: core.Type, arg_interface_type: core.Type, arg_interface_info: *InterfaceInfo) void {
        const cFn = @extern(*const fn (*TypeModule, core.Type, core.Type, *InterfaceInfo) callconv(.c) void, .{ .name = "g_type_module_add_interface" });
        const ret = cFn(self, arg_instance_type, arg_interface_type, arg_interface_info);
        return ret;
    }
    pub fn registerEnum(self: *TypeModule, arg_name: [*:0]const u8, arg_const_static_values: [*]EnumValue) core.Type {
        const cFn = @extern(*const fn (*TypeModule, [*:0]const u8, [*]EnumValue) callconv(.c) core.Type, .{ .name = "g_type_module_register_enum" });
        const ret = cFn(self, arg_name, arg_const_static_values);
        return ret;
    }
    pub fn registerFlags(self: *TypeModule, arg_name: [*:0]const u8, arg_const_static_values: [*]FlagsValue) core.Type {
        const cFn = @extern(*const fn (*TypeModule, [*:0]const u8, [*]FlagsValue) callconv(.c) core.Type, .{ .name = "g_type_module_register_flags" });
        const ret = cFn(self, arg_name, arg_const_static_values);
        return ret;
    }
    pub fn registerType(self: *TypeModule, arg_parent_type: core.Type, arg_type_name: [*:0]const u8, arg_type_info: *TypeInfo, arg_flags: TypeFlags) core.Type {
        const cFn = @extern(*const fn (*TypeModule, core.Type, [*:0]const u8, *TypeInfo, TypeFlags) callconv(.c) core.Type, .{ .name = "g_type_module_register_type" });
        const ret = cFn(self, arg_parent_type, arg_type_name, arg_type_info, arg_flags);
        return ret;
    }
    pub fn setName(self: *TypeModule, arg_name: [*:0]const u8) void {
        const cFn = @extern(*const fn (*TypeModule, [*:0]const u8) callconv(.c) void, .{ .name = "g_type_module_set_name" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn unuse(self: *TypeModule) void {
        const cFn = @extern(*const fn (*TypeModule) callconv(.c) void, .{ .name = "g_type_module_unuse" });
        const ret = cFn(self);
        return ret;
    }
    pub fn use(self: *TypeModule) bool {
        const cFn = @extern(*const fn (*TypeModule) callconv(.c) bool, .{ .name = "g_type_module_use" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_type_module_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TypeModuleClass = extern struct {
    parent_class: ObjectClass,
    load: ?*const fn (arg_module: *TypeModule) callconv(.c) bool,
    unload: ?*const fn (arg_module: *TypeModule) callconv(.c) void,
    reserved1: ?*const fn () callconv(.c) void,
    reserved2: ?*const fn () callconv(.c) void,
    reserved3: ?*const fn () callconv(.c) void,
    reserved4: ?*const fn () callconv(.c) void,
};
pub const TypePlugin = struct {
    pub const Class = TypePluginClass;
    pub fn completeInterfaceInfo(self: *TypePlugin, arg_instance_type: core.Type, arg_interface_type: core.Type, arg_info: *InterfaceInfo) void {
        const cFn = @extern(*const fn (*TypePlugin, core.Type, core.Type, *InterfaceInfo) callconv(.c) void, .{ .name = "g_type_plugin_complete_interface_info" });
        const ret = cFn(self, arg_instance_type, arg_interface_type, arg_info);
        return ret;
    }
    pub fn completeTypeInfo(self: *TypePlugin, arg_g_type: core.Type, arg_info: *TypeInfo, arg_value_table: *TypeValueTable) void {
        const cFn = @extern(*const fn (*TypePlugin, core.Type, *TypeInfo, *TypeValueTable) callconv(.c) void, .{ .name = "g_type_plugin_complete_type_info" });
        const ret = cFn(self, arg_g_type, arg_info, arg_value_table);
        return ret;
    }
    pub fn unuse(self: *TypePlugin) void {
        const cFn = @extern(*const fn (*TypePlugin) callconv(.c) void, .{ .name = "g_type_plugin_unuse" });
        const ret = cFn(self);
        return ret;
    }
    pub fn use(self: *TypePlugin) void {
        const cFn = @extern(*const fn (*TypePlugin) callconv(.c) void, .{ .name = "g_type_plugin_use" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_type_plugin_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TypePluginClass = extern struct {
    base_iface: TypeInterface,
    use_plugin: ?TypePluginUse,
    unuse_plugin: ?TypePluginUnuse,
    complete_type_info: ?TypePluginCompleteTypeInfo,
    complete_interface_info: ?TypePluginCompleteInterfaceInfo,
};
pub const TypePluginCompleteInterfaceInfo = *const fn (arg_plugin: *TypePlugin, arg_instance_type: core.Type, arg_interface_type: core.Type, arg_info: *InterfaceInfo) callconv(.c) void;
pub const TypePluginCompleteTypeInfo = *const fn (arg_plugin: *TypePlugin, arg_g_type: core.Type, arg_info: *TypeInfo, arg_value_table: *TypeValueTable) callconv(.c) void;
pub const TypePluginUnuse = *const fn (arg_plugin: *TypePlugin) callconv(.c) void;
pub const TypePluginUse = *const fn (arg_plugin: *TypePlugin) callconv(.c) void;
pub const TypeQuery = extern struct {
    type: core.Type,
    type_name: ?[*:0]const u8,
    class_size: u32,
    instance_size: u32,
};
pub const TypeValueCollectFunc = *const fn (arg_value: *Value, arg_n_collect_values: u32, arg_collect_values: [*]TypeCValue, arg_collect_flags: u32) callconv(.c) ?[*:0]u8;
pub const TypeValueCopyFunc = *const fn (arg_src_value: *Value, arg_dest_value: *Value) callconv(.c) void;
pub const TypeValueFreeFunc = *const fn (arg_value: *Value) callconv(.c) void;
pub const TypeValueInitFunc = *const fn (arg_value: *Value) callconv(.c) void;
pub const TypeValueLCopyFunc = *const fn (arg_value: *Value, arg_n_collect_values: u32, arg_collect_values: [*]TypeCValue, arg_collect_flags: u32) callconv(.c) ?[*:0]u8;
pub const TypeValuePeekPointerFunc = *const fn (arg_value: *Value) callconv(.c) ?*anyopaque;
pub const TypeValueTable = extern struct {
    value_init: ?TypeValueInitFunc,
    value_free: ?TypeValueFreeFunc,
    value_copy: ?TypeValueCopyFunc,
    value_peek_pointer: ?TypeValuePeekPointerFunc,
    collect_format: ?[*:0]const u8,
    collect_value: ?TypeValueCollectFunc,
    lcopy_format: ?[*:0]const u8,
    lcopy_value: ?TypeValueLCopyFunc,
};
pub const Uri = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_uri_get_type" });
        return cFn();
    }
};
pub const VALUE_COLLECT_FORMAT_MAX_LENGTH = 8;
pub const VALUE_INTERNED_STRING = 268435456;
pub const VALUE_NOCOPY_CONTENTS = 134217728;
pub const Value = extern struct {
    g_type: core.Type,
    data: [2]_Value__data__union,
    pub fn copy(self: *Value, arg_dest_value: *Value) void {
        const cFn = @extern(*const fn (*Value, *Value) callconv(.c) void, .{ .name = "g_value_copy" });
        const ret = cFn(self, arg_dest_value);
        return ret;
    }
    pub fn dupObject(self: *Value) ?*Object {
        const cFn = @extern(*const fn (*Value) callconv(.c) ?*Object, .{ .name = "g_value_dup_object" });
        const ret = cFn(self);
        return ret;
    }
    pub fn dupString(self: *Value) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Value) callconv(.c) ?[*:0]u8, .{ .name = "g_value_dup_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn dupVariant(self: *Value) ?*GLib.Variant {
        const cFn = @extern(*const fn (*Value) callconv(.c) ?*GLib.Variant, .{ .name = "g_value_dup_variant" });
        const ret = cFn(self);
        return ret;
    }
    pub fn fitsPointer(self: *Value) bool {
        const cFn = @extern(*const fn (*Value) callconv(.c) bool, .{ .name = "g_value_fits_pointer" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBoolean(self: *Value) bool {
        const cFn = @extern(*const fn (*Value) callconv(.c) bool, .{ .name = "g_value_get_boolean" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBoxed(self: *Value) ?*anyopaque {
        const cFn = @extern(*const fn (*Value) callconv(.c) ?*anyopaque, .{ .name = "g_value_get_boxed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getChar(self: *Value) i8 {
        const cFn = @extern(*const fn (*Value) callconv(.c) i8, .{ .name = "g_value_get_char" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDouble(self: *Value) f64 {
        const cFn = @extern(*const fn (*Value) callconv(.c) f64, .{ .name = "g_value_get_double" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getEnum(self: *Value) i32 {
        const cFn = @extern(*const fn (*Value) callconv(.c) i32, .{ .name = "g_value_get_enum" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFlags(self: *Value) u32 {
        const cFn = @extern(*const fn (*Value) callconv(.c) u32, .{ .name = "g_value_get_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFloat(self: *Value) f32 {
        const cFn = @extern(*const fn (*Value) callconv(.c) f32, .{ .name = "g_value_get_float" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getGtype(self: *Value) core.Type {
        const cFn = @extern(*const fn (*Value) callconv(.c) core.Type, .{ .name = "g_value_get_gtype" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInt(self: *Value) i32 {
        const cFn = @extern(*const fn (*Value) callconv(.c) i32, .{ .name = "g_value_get_int" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInt64(self: *Value) i64 {
        const cFn = @extern(*const fn (*Value) callconv(.c) i64, .{ .name = "g_value_get_int64" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLong(self: *Value) i64 {
        const cFn = @extern(*const fn (*Value) callconv(.c) i64, .{ .name = "g_value_get_long" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getObject(self: *Value) ?*Object {
        const cFn = @extern(*const fn (*Value) callconv(.c) ?*Object, .{ .name = "g_value_get_object" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getParam(self: *Value) *ParamSpec {
        const cFn = @extern(*const fn (*Value) callconv(.c) *ParamSpec, .{ .name = "g_value_get_param" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPointer(self: *Value) ?*anyopaque {
        const cFn = @extern(*const fn (*Value) callconv(.c) ?*anyopaque, .{ .name = "g_value_get_pointer" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSchar(self: *Value) i8 {
        const cFn = @extern(*const fn (*Value) callconv(.c) i8, .{ .name = "g_value_get_schar" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getString(self: *Value) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Value) callconv(.c) ?[*:0]u8, .{ .name = "g_value_get_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUchar(self: *Value) u8 {
        const cFn = @extern(*const fn (*Value) callconv(.c) u8, .{ .name = "g_value_get_uchar" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUint(self: *Value) u32 {
        const cFn = @extern(*const fn (*Value) callconv(.c) u32, .{ .name = "g_value_get_uint" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUint64(self: *Value) u64 {
        const cFn = @extern(*const fn (*Value) callconv(.c) u64, .{ .name = "g_value_get_uint64" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUlong(self: *Value) u64 {
        const cFn = @extern(*const fn (*Value) callconv(.c) u64, .{ .name = "g_value_get_ulong" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getVariant(self: *Value) ?*GLib.Variant {
        const cFn = @extern(*const fn (*Value) callconv(.c) ?*GLib.Variant, .{ .name = "g_value_get_variant" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *Value, arg_g_type: core.Type) *Value {
        const cFn = @extern(*const fn (*Value, core.Type) callconv(.c) *Value, .{ .name = "g_value_init" });
        const ret = cFn(self, arg_g_type);
        return ret;
    }
    pub fn initFromInstance(self: *Value, arg_instance: *TypeInstance) void {
        const cFn = @extern(*const fn (*Value, *TypeInstance) callconv(.c) void, .{ .name = "g_value_init_from_instance" });
        const ret = cFn(self, arg_instance);
        return ret;
    }
    pub fn peekPointer(self: *Value) ?*anyopaque {
        const cFn = @extern(*const fn (*Value) callconv(.c) ?*anyopaque, .{ .name = "g_value_peek_pointer" });
        const ret = cFn(self);
        return ret;
    }
    pub fn reset(self: *Value) *Value {
        const cFn = @extern(*const fn (*Value) callconv(.c) *Value, .{ .name = "g_value_reset" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setBoolean(self: *Value, arg_v_boolean: bool) void {
        const cFn = @extern(*const fn (*Value, bool) callconv(.c) void, .{ .name = "g_value_set_boolean" });
        const ret = cFn(self, arg_v_boolean);
        return ret;
    }
    pub fn setBoxed(self: *Value, arg_v_boxed: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Value, ?*anyopaque) callconv(.c) void, .{ .name = "g_value_set_boxed" });
        const ret = cFn(self, @ptrCast(arg_v_boxed));
        return ret;
    }
    pub fn setBoxedTakeOwnership(self: *Value, arg_v_boxed: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Value, ?*anyopaque) callconv(.c) void, .{ .name = "g_value_set_boxed_take_ownership" });
        const ret = cFn(self, @ptrCast(arg_v_boxed));
        return ret;
    }
    pub fn setChar(self: *Value, arg_v_char: i8) void {
        const cFn = @extern(*const fn (*Value, i8) callconv(.c) void, .{ .name = "g_value_set_char" });
        const ret = cFn(self, arg_v_char);
        return ret;
    }
    pub fn setDouble(self: *Value, arg_v_double: f64) void {
        const cFn = @extern(*const fn (*Value, f64) callconv(.c) void, .{ .name = "g_value_set_double" });
        const ret = cFn(self, arg_v_double);
        return ret;
    }
    pub fn setEnum(self: *Value, arg_v_enum: i32) void {
        const cFn = @extern(*const fn (*Value, i32) callconv(.c) void, .{ .name = "g_value_set_enum" });
        const ret = cFn(self, arg_v_enum);
        return ret;
    }
    pub fn setFlags(self: *Value, arg_v_flags: u32) void {
        const cFn = @extern(*const fn (*Value, u32) callconv(.c) void, .{ .name = "g_value_set_flags" });
        const ret = cFn(self, arg_v_flags);
        return ret;
    }
    pub fn setFloat(self: *Value, arg_v_float: f32) void {
        const cFn = @extern(*const fn (*Value, f32) callconv(.c) void, .{ .name = "g_value_set_float" });
        const ret = cFn(self, arg_v_float);
        return ret;
    }
    pub fn setGtype(self: *Value, arg_v_gtype: core.Type) void {
        const cFn = @extern(*const fn (*Value, core.Type) callconv(.c) void, .{ .name = "g_value_set_gtype" });
        const ret = cFn(self, arg_v_gtype);
        return ret;
    }
    pub fn setInstance(self: *Value, arg_instance: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Value, ?*anyopaque) callconv(.c) void, .{ .name = "g_value_set_instance" });
        const ret = cFn(self, @ptrCast(arg_instance));
        return ret;
    }
    pub fn setInt(self: *Value, arg_v_int: i32) void {
        const cFn = @extern(*const fn (*Value, i32) callconv(.c) void, .{ .name = "g_value_set_int" });
        const ret = cFn(self, arg_v_int);
        return ret;
    }
    pub fn setInt64(self: *Value, arg_v_int64: i64) void {
        const cFn = @extern(*const fn (*Value, i64) callconv(.c) void, .{ .name = "g_value_set_int64" });
        const ret = cFn(self, arg_v_int64);
        return ret;
    }
    pub fn setInternedString(self: *Value, arg_v_string: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Value, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_value_set_interned_string" });
        const ret = cFn(self, arg_v_string);
        return ret;
    }
    pub fn setLong(self: *Value, arg_v_long: i64) void {
        const cFn = @extern(*const fn (*Value, i64) callconv(.c) void, .{ .name = "g_value_set_long" });
        const ret = cFn(self, arg_v_long);
        return ret;
    }
    pub fn setObject(self: *Value, arg_v_object: ?*Object) void {
        const cFn = @extern(*const fn (*Value, ?*Object) callconv(.c) void, .{ .name = "g_value_set_object" });
        const ret = cFn(self, arg_v_object);
        return ret;
    }
    pub fn setParam(self: *Value, arg_param: ?*ParamSpec) void {
        const cFn = @extern(*const fn (*Value, ?*ParamSpec) callconv(.c) void, .{ .name = "g_value_set_param" });
        const ret = cFn(self, arg_param);
        return ret;
    }
    pub fn setPointer(self: *Value, arg_v_pointer: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Value, ?*anyopaque) callconv(.c) void, .{ .name = "g_value_set_pointer" });
        const ret = cFn(self, @ptrCast(arg_v_pointer));
        return ret;
    }
    pub fn setSchar(self: *Value, arg_v_char: i8) void {
        const cFn = @extern(*const fn (*Value, i8) callconv(.c) void, .{ .name = "g_value_set_schar" });
        const ret = cFn(self, arg_v_char);
        return ret;
    }
    pub fn setStaticBoxed(self: *Value, arg_v_boxed: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Value, ?*anyopaque) callconv(.c) void, .{ .name = "g_value_set_static_boxed" });
        const ret = cFn(self, @ptrCast(arg_v_boxed));
        return ret;
    }
    pub fn setStaticString(self: *Value, arg_v_string: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Value, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_value_set_static_string" });
        const ret = cFn(self, arg_v_string);
        return ret;
    }
    pub fn setString(self: *Value, arg_v_string: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Value, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_value_set_string" });
        const ret = cFn(self, arg_v_string);
        return ret;
    }
    pub fn setStringTakeOwnership(self: *Value, arg_v_string: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Value, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_value_set_string_take_ownership" });
        const ret = cFn(self, arg_v_string);
        return ret;
    }
    pub fn setUchar(self: *Value, arg_v_uchar: u8) void {
        const cFn = @extern(*const fn (*Value, u8) callconv(.c) void, .{ .name = "g_value_set_uchar" });
        const ret = cFn(self, arg_v_uchar);
        return ret;
    }
    pub fn setUint(self: *Value, arg_v_uint: u32) void {
        const cFn = @extern(*const fn (*Value, u32) callconv(.c) void, .{ .name = "g_value_set_uint" });
        const ret = cFn(self, arg_v_uint);
        return ret;
    }
    pub fn setUint64(self: *Value, arg_v_uint64: u64) void {
        const cFn = @extern(*const fn (*Value, u64) callconv(.c) void, .{ .name = "g_value_set_uint64" });
        const ret = cFn(self, arg_v_uint64);
        return ret;
    }
    pub fn setUlong(self: *Value, arg_v_ulong: u64) void {
        const cFn = @extern(*const fn (*Value, u64) callconv(.c) void, .{ .name = "g_value_set_ulong" });
        const ret = cFn(self, arg_v_ulong);
        return ret;
    }
    pub fn setVariant(self: *Value, arg_variant: ?*GLib.Variant) void {
        const cFn = @extern(*const fn (*Value, ?*GLib.Variant) callconv(.c) void, .{ .name = "g_value_set_variant" });
        const ret = cFn(self, arg_variant);
        return ret;
    }
    pub fn stealString(self: *Value) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Value) callconv(.c) ?[*:0]u8, .{ .name = "g_value_steal_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn takeBoxed(self: *Value, arg_v_boxed: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Value, ?*anyopaque) callconv(.c) void, .{ .name = "g_value_take_boxed" });
        const ret = cFn(self, @ptrCast(arg_v_boxed));
        return ret;
    }
    pub fn takeString(self: *Value, arg_v_string: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Value, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_value_take_string" });
        const ret = cFn(self, arg_v_string);
        return ret;
    }
    pub fn takeVariant(self: *Value, arg_variant: ?*GLib.Variant) void {
        const cFn = @extern(*const fn (*Value, ?*GLib.Variant) callconv(.c) void, .{ .name = "g_value_take_variant" });
        const ret = cFn(self, arg_variant);
        return ret;
    }
    pub fn transform(self: *Value, arg_dest_value: *Value) bool {
        const cFn = @extern(*const fn (*Value, *Value) callconv(.c) bool, .{ .name = "g_value_transform" });
        const ret = cFn(self, arg_dest_value);
        return ret;
    }
    pub fn unset(self: *Value) void {
        const cFn = @extern(*const fn (*Value) callconv(.c) void, .{ .name = "g_value_unset" });
        const ret = cFn(self);
        return ret;
    }
    pub fn typeCompatible(arg_src_type: core.Type, arg_dest_type: core.Type) bool {
        const cFn = @extern(*const fn (core.Type, core.Type) callconv(.c) bool, .{ .name = "g_value_type_compatible" });
        const ret = cFn(arg_src_type, arg_dest_type);
        return ret;
    }
    pub fn typeTransformable(arg_src_type: core.Type, arg_dest_type: core.Type) bool {
        const cFn = @extern(*const fn (core.Type, core.Type) callconv(.c) bool, .{ .name = "g_value_type_transformable" });
        const ret = cFn(arg_src_type, arg_dest_type);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_value_get_type" });
        return cFn();
    }
};
pub const ValueArray = extern struct {
    n_values: u32,
    values: ?*Value,
    n_prealloced: u32,
    pub fn new(arg_n_prealloced: u32) *ValueArray {
        const cFn = @extern(*const fn (u32) callconv(.c) *ValueArray, .{ .name = "g_value_array_new" });
        const ret = cFn(arg_n_prealloced);
        return ret;
    }
    pub fn append(self: *ValueArray, arg_value: ?*Value) *ValueArray {
        const cFn = @extern(*const fn (*ValueArray, ?*Value) callconv(.c) *ValueArray, .{ .name = "g_value_array_append" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn copy(self: *ValueArray) *ValueArray {
        const cFn = @extern(*const fn (*ValueArray) callconv(.c) *ValueArray, .{ .name = "g_value_array_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNth(self: *ValueArray, arg_index_: u32) *Value {
        const cFn = @extern(*const fn (*ValueArray, u32) callconv(.c) *Value, .{ .name = "g_value_array_get_nth" });
        const ret = cFn(self, arg_index_);
        return ret;
    }
    pub fn insert(self: *ValueArray, arg_index_: u32, arg_value: ?*Value) *ValueArray {
        const cFn = @extern(*const fn (*ValueArray, u32, ?*Value) callconv(.c) *ValueArray, .{ .name = "g_value_array_insert" });
        const ret = cFn(self, arg_index_, arg_value);
        return ret;
    }
    pub fn prepend(self: *ValueArray, arg_value: ?*Value) *ValueArray {
        const cFn = @extern(*const fn (*ValueArray, ?*Value) callconv(.c) *ValueArray, .{ .name = "g_value_array_prepend" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn remove(self: *ValueArray, arg_index_: u32) *ValueArray {
        const cFn = @extern(*const fn (*ValueArray, u32) callconv(.c) *ValueArray, .{ .name = "g_value_array_remove" });
        const ret = cFn(self, arg_index_);
        return ret;
    }
    pub fn sort(self: *ValueArray, argC_compare_func: core.Closure(GLib.CompareDataFunc)) *ValueArray {
        const arg_compare_func: GLib.CompareDataFunc = @ptrCast(argC_compare_func.callback());
        defer argC_compare_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_compare_func.data());
        const cFn = @extern(*const fn (*ValueArray, GLib.CompareDataFunc, ?*anyopaque) callconv(.c) *ValueArray, .{ .name = "g_value_array_sort_with_data" });
        const ret = cFn(self, arg_compare_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_value_array_get_type" });
        return cFn();
    }
};
pub const ValueTransform = *const fn (arg_src_value: *Value, arg_dest_value: *Value) callconv(.c) void;
pub const VariantBuilder = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_variant_builder_get_type" });
        return cFn();
    }
};
pub const VariantDict = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_variant_dict_get_type" });
        return cFn();
    }
};
pub const VariantType = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_variant_type_get_gtype" });
        return cFn();
    }
};
pub const WeakNotify = *const fn (arg_data: ?*anyopaque, arg_where_the_object_was: *Object) callconv(.c) void;
pub const WeakRef = opaque {};
pub const _Value__data__union = extern union {
    v_int: i32,
    v_uint: u32,
    v_long: i64,
    v_ulong: u64,
    v_int64: i64,
    v_uint64: u64,
    v_float: f32,
    v_double: f64,
    v_pointer: ?*anyopaque,
};
pub fn boxedCopy(arg_boxed_type: core.Type, arg_src_boxed: *anyopaque) *anyopaque {
    const cFn = @extern(*const fn (core.Type, *anyopaque) callconv(.c) *anyopaque, .{ .name = "g_boxed_copy" });
    const ret = cFn(arg_boxed_type, @ptrCast(arg_src_boxed));
    return ret;
}
pub fn boxedFree(arg_boxed_type: core.Type, arg_boxed: *anyopaque) void {
    const cFn = @extern(*const fn (core.Type, *anyopaque) callconv(.c) void, .{ .name = "g_boxed_free" });
    const ret = cFn(arg_boxed_type, @ptrCast(arg_boxed));
    return ret;
}
pub fn boxedTypeRegisterStatic(arg_name: [*:0]const u8, arg_boxed_copy: BoxedCopyFunc, arg_boxed_free: BoxedFreeFunc) core.Type {
    const cFn = @extern(*const fn ([*:0]const u8, BoxedCopyFunc, BoxedFreeFunc) callconv(.c) core.Type, .{ .name = "g_boxed_type_register_static" });
    const ret = cFn(arg_name, arg_boxed_copy, arg_boxed_free);
    return ret;
}
pub fn cclosureMarshalBOOLEANBOXEDBOXED(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_BOOLEAN__BOXED_BOXED" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalBOOLEANFLAGS(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_BOOLEAN__FLAGS" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalSTRINGOBJECTPOINTER(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_STRING__OBJECT_POINTER" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDBOOLEAN(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__BOOLEAN" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDBOXED(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__BOXED" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDCHAR(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__CHAR" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDDOUBLE(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__DOUBLE" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDENUM(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__ENUM" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDFLAGS(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__FLAGS" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDFLOAT(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__FLOAT" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDINT(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__INT" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDLONG(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__LONG" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDOBJECT(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__OBJECT" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDPARAM(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__PARAM" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDPOINTER(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__POINTER" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDSTRING(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__STRING" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDUCHAR(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__UCHAR" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDUINT(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__UINT" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDUINTPOINTER(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__UINT_POINTER" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDULONG(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__ULONG" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDVARIANT(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__VARIANT" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalVOIDVOID(arg_closure: *Closure, arg_return_value: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_VOID__VOID" });
    const ret = cFn(arg_closure, arg_return_value, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn cclosureMarshalGeneric(arg_closure: *Closure, arg_return_gvalue: *Value, arg_n_param_values: u32, arg_param_values: *Value, arg_invocation_hint: ?*anyopaque, arg_marshal_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*Closure, *Value, u32, *Value, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_cclosure_marshal_generic" });
    const ret = cFn(arg_closure, arg_return_gvalue, arg_n_param_values, arg_param_values, @ptrCast(arg_invocation_hint), @ptrCast(arg_marshal_data));
    return ret;
}
pub fn clearSignalHandler(arg_handler_id_ptr: *u64, arg_instance: *Object) void {
    const cFn = @extern(*const fn (*u64, *Object) callconv(.c) void, .{ .name = "g_clear_signal_handler" });
    const ret = cFn(arg_handler_id_ptr, arg_instance);
    return ret;
}
pub fn enumCompleteTypeInfo(arg_g_enum_type: core.Type, arg_const_values: [*]EnumValue) TypeInfo {
    var argO_info: TypeInfo = undefined;
    const arg_info: *TypeInfo = &argO_info;
    const cFn = @extern(*const fn (core.Type, *TypeInfo, [*]EnumValue) callconv(.c) void, .{ .name = "g_enum_complete_type_info" });
    const ret = cFn(arg_g_enum_type, arg_info, arg_const_values);
    _ = ret;
    return argO_info;
}
pub fn enumGetValue(arg_enum_class: *EnumClass, arg_value: i32) ?*EnumValue {
    const cFn = @extern(*const fn (*EnumClass, i32) callconv(.c) ?*EnumValue, .{ .name = "g_enum_get_value" });
    const ret = cFn(arg_enum_class, arg_value);
    return ret;
}
pub fn enumGetValueByName(arg_enum_class: *EnumClass, arg_name: [*:0]const u8) ?*EnumValue {
    const cFn = @extern(*const fn (*EnumClass, [*:0]const u8) callconv(.c) ?*EnumValue, .{ .name = "g_enum_get_value_by_name" });
    const ret = cFn(arg_enum_class, arg_name);
    return ret;
}
pub fn enumGetValueByNick(arg_enum_class: *EnumClass, arg_nick: [*:0]const u8) ?*EnumValue {
    const cFn = @extern(*const fn (*EnumClass, [*:0]const u8) callconv(.c) ?*EnumValue, .{ .name = "g_enum_get_value_by_nick" });
    const ret = cFn(arg_enum_class, arg_nick);
    return ret;
}
pub fn enumRegisterStatic(arg_name: [*:0]const u8, arg_const_static_values: [*]EnumValue) core.Type {
    const cFn = @extern(*const fn ([*:0]const u8, [*]EnumValue) callconv(.c) core.Type, .{ .name = "g_enum_register_static" });
    const ret = cFn(arg_name, arg_const_static_values);
    return ret;
}
pub fn enumToString(arg_g_enum_type: core.Type, arg_value: i32) [*:0]u8 {
    const cFn = @extern(*const fn (core.Type, i32) callconv(.c) [*:0]u8, .{ .name = "g_enum_to_string" });
    const ret = cFn(arg_g_enum_type, arg_value);
    return ret;
}
pub fn flagsCompleteTypeInfo(arg_g_flags_type: core.Type, arg_const_values: [*]FlagsValue) TypeInfo {
    var argO_info: TypeInfo = undefined;
    const arg_info: *TypeInfo = &argO_info;
    const cFn = @extern(*const fn (core.Type, *TypeInfo, [*]FlagsValue) callconv(.c) void, .{ .name = "g_flags_complete_type_info" });
    const ret = cFn(arg_g_flags_type, arg_info, arg_const_values);
    _ = ret;
    return argO_info;
}
pub fn flagsGetFirstValue(arg_flags_class: *FlagsClass, arg_value: u32) ?*FlagsValue {
    const cFn = @extern(*const fn (*FlagsClass, u32) callconv(.c) ?*FlagsValue, .{ .name = "g_flags_get_first_value" });
    const ret = cFn(arg_flags_class, arg_value);
    return ret;
}
pub fn flagsGetValueByName(arg_flags_class: *FlagsClass, arg_name: [*:0]const u8) ?*FlagsValue {
    const cFn = @extern(*const fn (*FlagsClass, [*:0]const u8) callconv(.c) ?*FlagsValue, .{ .name = "g_flags_get_value_by_name" });
    const ret = cFn(arg_flags_class, arg_name);
    return ret;
}
pub fn flagsGetValueByNick(arg_flags_class: *FlagsClass, arg_nick: [*:0]const u8) ?*FlagsValue {
    const cFn = @extern(*const fn (*FlagsClass, [*:0]const u8) callconv(.c) ?*FlagsValue, .{ .name = "g_flags_get_value_by_nick" });
    const ret = cFn(arg_flags_class, arg_nick);
    return ret;
}
pub fn flagsRegisterStatic(arg_name: [*:0]const u8, arg_const_static_values: [*]FlagsValue) core.Type {
    const cFn = @extern(*const fn ([*:0]const u8, [*]FlagsValue) callconv(.c) core.Type, .{ .name = "g_flags_register_static" });
    const ret = cFn(arg_name, arg_const_static_values);
    return ret;
}
pub fn flagsToString(arg_flags_type: core.Type, arg_value: u32) [*:0]u8 {
    const cFn = @extern(*const fn (core.Type, u32) callconv(.c) [*:0]u8, .{ .name = "g_flags_to_string" });
    const ret = cFn(arg_flags_type, arg_value);
    return ret;
}
pub fn gtypeGetType() core.Type {
    const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_gtype_get_type" });
    const ret = cFn();
    return ret;
}
pub fn paramSpecBoolean(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_default_value: bool, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, bool, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_boolean" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_default_value, arg_flags);
    return ret;
}
pub fn paramSpecBoxed(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_boxed_type: core.Type, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, core.Type, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_boxed" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_boxed_type, arg_flags);
    return ret;
}
pub fn paramSpecChar(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_minimum: i8, arg_maximum: i8, arg_default_value: i8, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, i8, i8, i8, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_char" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_minimum, arg_maximum, arg_default_value, arg_flags);
    return ret;
}
pub fn paramSpecDouble(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_minimum: f64, arg_maximum: f64, arg_default_value: f64, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, f64, f64, f64, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_double" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_minimum, arg_maximum, arg_default_value, arg_flags);
    return ret;
}
pub fn paramSpecEnum(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_enum_type: core.Type, arg_default_value: i32, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, core.Type, i32, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_enum" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_enum_type, arg_default_value, arg_flags);
    return ret;
}
pub fn paramSpecFlags(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_flags_type: core.Type, arg_default_value: u32, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, core.Type, u32, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_flags" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_flags_type, arg_default_value, arg_flags);
    return ret;
}
pub fn paramSpecFloat(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_minimum: f32, arg_maximum: f32, arg_default_value: f32, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, f32, f32, f32, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_float" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_minimum, arg_maximum, arg_default_value, arg_flags);
    return ret;
}
pub fn paramSpecGtype(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_is_a_type: core.Type, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, core.Type, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_gtype" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_is_a_type, arg_flags);
    return ret;
}
pub fn paramSpecInt(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_minimum: i32, arg_maximum: i32, arg_default_value: i32, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, i32, i32, i32, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_int" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_minimum, arg_maximum, arg_default_value, arg_flags);
    return ret;
}
pub fn paramSpecInt64(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_minimum: i64, arg_maximum: i64, arg_default_value: i64, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, i64, i64, i64, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_int64" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_minimum, arg_maximum, arg_default_value, arg_flags);
    return ret;
}
pub fn paramSpecLong(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_minimum: i64, arg_maximum: i64, arg_default_value: i64, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, i64, i64, i64, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_long" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_minimum, arg_maximum, arg_default_value, arg_flags);
    return ret;
}
pub fn paramSpecObject(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_object_type: core.Type, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, core.Type, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_object" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_object_type, arg_flags);
    return ret;
}
pub fn paramSpecParam(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_param_type: core.Type, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, core.Type, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_param" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_param_type, arg_flags);
    return ret;
}
pub fn paramSpecPointer(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_pointer" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_flags);
    return ret;
}
pub fn paramSpecString(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_default_value: ?[*:0]const u8, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_string" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_default_value, arg_flags);
    return ret;
}
pub fn paramSpecUchar(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_minimum: u8, arg_maximum: u8, arg_default_value: u8, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, u8, u8, u8, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_uchar" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_minimum, arg_maximum, arg_default_value, arg_flags);
    return ret;
}
pub fn paramSpecUint(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_minimum: u32, arg_maximum: u32, arg_default_value: u32, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, u32, u32, u32, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_uint" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_minimum, arg_maximum, arg_default_value, arg_flags);
    return ret;
}
pub fn paramSpecUint64(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_minimum: u64, arg_maximum: u64, arg_default_value: u64, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, u64, u64, u64, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_uint64" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_minimum, arg_maximum, arg_default_value, arg_flags);
    return ret;
}
pub fn paramSpecUlong(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_minimum: u64, arg_maximum: u64, arg_default_value: u64, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, u64, u64, u64, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_ulong" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_minimum, arg_maximum, arg_default_value, arg_flags);
    return ret;
}
pub fn paramSpecUnichar(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_default_value: u32, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, u32, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_unichar" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_default_value, arg_flags);
    return ret;
}
pub fn paramSpecVariant(arg_name: [*:0]const u8, arg_nick: ?[*:0]const u8, arg_blurb: ?[*:0]const u8, arg_type: *GLib.VariantType, arg_default_value: ?*GLib.Variant, arg_flags: ParamFlags) *ParamSpec {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, *GLib.VariantType, ?*GLib.Variant, ParamFlags) callconv(.c) *ParamSpec, .{ .name = "g_param_spec_variant" });
    const ret = cFn(arg_name, arg_nick, arg_blurb, arg_type, arg_default_value, arg_flags);
    return ret;
}
pub fn paramTypeRegisterStatic(arg_name: [*:0]const u8, arg_pspec_info: *ParamSpecTypeInfo) core.Type {
    const cFn = @extern(*const fn ([*:0]const u8, *ParamSpecTypeInfo) callconv(.c) core.Type, .{ .name = "g_param_type_register_static" });
    const ret = cFn(arg_name, arg_pspec_info);
    return ret;
}
pub fn paramValueConvert(arg_pspec: *ParamSpec, arg_src_value: *Value, arg_dest_value: *Value, arg_strict_validation: bool) bool {
    const cFn = @extern(*const fn (*ParamSpec, *Value, *Value, bool) callconv(.c) bool, .{ .name = "g_param_value_convert" });
    const ret = cFn(arg_pspec, arg_src_value, arg_dest_value, arg_strict_validation);
    return ret;
}
pub fn paramValueDefaults(arg_pspec: *ParamSpec, arg_value: *Value) bool {
    const cFn = @extern(*const fn (*ParamSpec, *Value) callconv(.c) bool, .{ .name = "g_param_value_defaults" });
    const ret = cFn(arg_pspec, arg_value);
    return ret;
}
pub fn paramValueIsValid(arg_pspec: *ParamSpec, arg_value: *Value) bool {
    const cFn = @extern(*const fn (*ParamSpec, *Value) callconv(.c) bool, .{ .name = "g_param_value_is_valid" });
    const ret = cFn(arg_pspec, arg_value);
    return ret;
}
pub fn paramValueSetDefault(arg_pspec: *ParamSpec, arg_value: *Value) void {
    const cFn = @extern(*const fn (*ParamSpec, *Value) callconv(.c) void, .{ .name = "g_param_value_set_default" });
    const ret = cFn(arg_pspec, arg_value);
    return ret;
}
pub fn paramValueValidate(arg_pspec: *ParamSpec, arg_value: *Value) bool {
    const cFn = @extern(*const fn (*ParamSpec, *Value) callconv(.c) bool, .{ .name = "g_param_value_validate" });
    const ret = cFn(arg_pspec, arg_value);
    return ret;
}
pub fn paramValuesCmp(arg_pspec: *ParamSpec, arg_value1: *Value, arg_value2: *Value) i32 {
    const cFn = @extern(*const fn (*ParamSpec, *Value, *Value) callconv(.c) i32, .{ .name = "g_param_values_cmp" });
    const ret = cFn(arg_pspec, arg_value1, arg_value2);
    return ret;
}
pub fn pointerTypeRegisterStatic(arg_name: [*:0]const u8) core.Type {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) core.Type, .{ .name = "g_pointer_type_register_static" });
    const ret = cFn(arg_name);
    return ret;
}
pub fn signalAccumulatorFirstWins(arg_ihint: *SignalInvocationHint, arg_return_accu: *Value, arg_handler_return: *Value, arg_dummy: ?*anyopaque) bool {
    const cFn = @extern(*const fn (*SignalInvocationHint, *Value, *Value, ?*anyopaque) callconv(.c) bool, .{ .name = "g_signal_accumulator_first_wins" });
    const ret = cFn(arg_ihint, arg_return_accu, arg_handler_return, @ptrCast(arg_dummy));
    return ret;
}
pub fn signalAccumulatorTrueHandled(arg_ihint: *SignalInvocationHint, arg_return_accu: *Value, arg_handler_return: *Value, arg_dummy: ?*anyopaque) bool {
    const cFn = @extern(*const fn (*SignalInvocationHint, *Value, *Value, ?*anyopaque) callconv(.c) bool, .{ .name = "g_signal_accumulator_true_handled" });
    const ret = cFn(arg_ihint, arg_return_accu, arg_handler_return, @ptrCast(arg_dummy));
    return ret;
}
pub fn signalAddEmissionHook(arg_signal_id: u32, arg_detail: u32, argC_hook_func: core.Closure(SignalEmissionHook)) u64 {
    const arg_hook_func: SignalEmissionHook = @ptrCast(argC_hook_func.callback());
    const arg_hook_data: ?*anyopaque = @ptrCast(argC_hook_func.data());
    const arg_data_destroy: ?GLib.DestroyNotify = @ptrCast(argC_hook_func.destroy());
    const cFn = @extern(*const fn (u32, u32, SignalEmissionHook, ?*anyopaque, ?GLib.DestroyNotify) callconv(.c) u64, .{ .name = "g_signal_add_emission_hook" });
    const ret = cFn(arg_signal_id, arg_detail, arg_hook_func, @ptrCast(arg_hook_data), arg_data_destroy);
    return ret;
}
pub fn signalChainFromOverridden(arg_instance_and_params: [*]Value, arg_return_value: *Value) void {
    const cFn = @extern(*const fn ([*]Value, *Value) callconv(.c) void, .{ .name = "g_signal_chain_from_overridden" });
    const ret = cFn(arg_instance_and_params, arg_return_value);
    return ret;
}
pub fn signalConnectClosure(arg_instance: *Object, arg_detailed_signal: [*:0]const u8, arg_closure: *Closure, arg_after: bool) u64 {
    const cFn = @extern(*const fn (*Object, [*:0]const u8, *Closure, bool) callconv(.c) u64, .{ .name = "g_signal_connect_closure" });
    const ret = cFn(arg_instance, arg_detailed_signal, arg_closure, arg_after);
    return ret;
}
pub fn signalConnectClosureById(arg_instance: *Object, arg_signal_id: u32, arg_detail: u32, arg_closure: *Closure, arg_after: bool) u64 {
    const cFn = @extern(*const fn (*Object, u32, u32, *Closure, bool) callconv(.c) u64, .{ .name = "g_signal_connect_closure_by_id" });
    const ret = cFn(arg_instance, arg_signal_id, arg_detail, arg_closure, arg_after);
    return ret;
}
pub fn signalEmitv(arg_instance_and_params: [*]Value, arg_signal_id: u32, arg_detail: u32, arg_return_value: ?*Value) void {
    const cFn = @extern(*const fn ([*]Value, u32, u32, ?*Value) callconv(.c) void, .{ .name = "g_signal_emitv" });
    const ret = cFn(arg_instance_and_params, arg_signal_id, arg_detail, arg_return_value);
    return ret;
}
pub fn signalGetInvocationHint(arg_instance: *Object) ?*SignalInvocationHint {
    const cFn = @extern(*const fn (*Object) callconv(.c) ?*SignalInvocationHint, .{ .name = "g_signal_get_invocation_hint" });
    const ret = cFn(arg_instance);
    return ret;
}
pub fn signalHandlerBlock(arg_instance: *Object, arg_handler_id: u64) void {
    const cFn = @extern(*const fn (*Object, u64) callconv(.c) void, .{ .name = "g_signal_handler_block" });
    const ret = cFn(arg_instance, arg_handler_id);
    return ret;
}
pub fn signalHandlerDisconnect(arg_instance: *Object, arg_handler_id: u64) void {
    const cFn = @extern(*const fn (*Object, u64) callconv(.c) void, .{ .name = "g_signal_handler_disconnect" });
    const ret = cFn(arg_instance, arg_handler_id);
    return ret;
}
pub fn signalHandlerFind(arg_instance: *Object, arg_mask: SignalMatchType, arg_signal_id: u32, arg_detail: u32, arg_closure: ?*Closure, arg_func: ?*anyopaque, arg_data: ?*anyopaque) u64 {
    const cFn = @extern(*const fn (*Object, SignalMatchType, u32, u32, ?*Closure, ?*anyopaque, ?*anyopaque) callconv(.c) u64, .{ .name = "g_signal_handler_find" });
    const ret = cFn(arg_instance, arg_mask, arg_signal_id, arg_detail, arg_closure, @ptrCast(arg_func), @ptrCast(arg_data));
    return ret;
}
pub fn signalHandlerIsConnected(arg_instance: *Object, arg_handler_id: u64) bool {
    const cFn = @extern(*const fn (*Object, u64) callconv(.c) bool, .{ .name = "g_signal_handler_is_connected" });
    const ret = cFn(arg_instance, arg_handler_id);
    return ret;
}
pub fn signalHandlerUnblock(arg_instance: *Object, arg_handler_id: u64) void {
    const cFn = @extern(*const fn (*Object, u64) callconv(.c) void, .{ .name = "g_signal_handler_unblock" });
    const ret = cFn(arg_instance, arg_handler_id);
    return ret;
}
pub fn signalHandlersBlockMatched(arg_instance: *Object, arg_mask: SignalMatchType, arg_signal_id: u32, arg_detail: u32, arg_closure: ?*Closure, arg_func: ?*anyopaque, arg_data: ?*anyopaque) u32 {
    const cFn = @extern(*const fn (*Object, SignalMatchType, u32, u32, ?*Closure, ?*anyopaque, ?*anyopaque) callconv(.c) u32, .{ .name = "g_signal_handlers_block_matched" });
    const ret = cFn(arg_instance, arg_mask, arg_signal_id, arg_detail, arg_closure, @ptrCast(arg_func), @ptrCast(arg_data));
    return ret;
}
pub fn signalHandlersDestroy(arg_instance: *Object) void {
    const cFn = @extern(*const fn (*Object) callconv(.c) void, .{ .name = "g_signal_handlers_destroy" });
    const ret = cFn(arg_instance);
    return ret;
}
pub fn signalHandlersDisconnectMatched(arg_instance: *Object, arg_mask: SignalMatchType, arg_signal_id: u32, arg_detail: u32, arg_closure: ?*Closure, arg_func: ?*anyopaque, arg_data: ?*anyopaque) u32 {
    const cFn = @extern(*const fn (*Object, SignalMatchType, u32, u32, ?*Closure, ?*anyopaque, ?*anyopaque) callconv(.c) u32, .{ .name = "g_signal_handlers_disconnect_matched" });
    const ret = cFn(arg_instance, arg_mask, arg_signal_id, arg_detail, arg_closure, @ptrCast(arg_func), @ptrCast(arg_data));
    return ret;
}
pub fn signalHandlersUnblockMatched(arg_instance: *Object, arg_mask: SignalMatchType, arg_signal_id: u32, arg_detail: u32, arg_closure: ?*Closure, arg_func: ?*anyopaque, arg_data: ?*anyopaque) u32 {
    const cFn = @extern(*const fn (*Object, SignalMatchType, u32, u32, ?*Closure, ?*anyopaque, ?*anyopaque) callconv(.c) u32, .{ .name = "g_signal_handlers_unblock_matched" });
    const ret = cFn(arg_instance, arg_mask, arg_signal_id, arg_detail, arg_closure, @ptrCast(arg_func), @ptrCast(arg_data));
    return ret;
}
pub fn signalHasHandlerPending(arg_instance: *Object, arg_signal_id: u32, arg_detail: u32, arg_may_be_blocked: bool) bool {
    const cFn = @extern(*const fn (*Object, u32, u32, bool) callconv(.c) bool, .{ .name = "g_signal_has_handler_pending" });
    const ret = cFn(arg_instance, arg_signal_id, arg_detail, arg_may_be_blocked);
    return ret;
}
pub fn signalIsValidName(arg_name: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_signal_is_valid_name" });
    const ret = cFn(arg_name);
    return ret;
}
pub fn signalListIds(arg_itype: core.Type) []u32 {
    var argO_n_ids: u32 = undefined;
    const arg_n_ids: *u32 = &argO_n_ids;
    const cFn = @extern(*const fn (core.Type, *u32) callconv(.c) [*]u32, .{ .name = "g_signal_list_ids" });
    const ret = cFn(arg_itype, arg_n_ids);
    return ret[0..@intCast(argO_n_ids)];
}
pub fn signalLookup(arg_name: [*:0]const u8, arg_itype: core.Type) u32 {
    const cFn = @extern(*const fn ([*:0]const u8, core.Type) callconv(.c) u32, .{ .name = "g_signal_lookup" });
    const ret = cFn(arg_name, arg_itype);
    return ret;
}
pub fn signalName(arg_signal_id: u32) ?[*:0]u8 {
    const cFn = @extern(*const fn (u32) callconv(.c) ?[*:0]u8, .{ .name = "g_signal_name" });
    const ret = cFn(arg_signal_id);
    return ret;
}
pub fn signalOverrideClassClosure(arg_signal_id: u32, arg_instance_type: core.Type, arg_class_closure: *Closure) void {
    const cFn = @extern(*const fn (u32, core.Type, *Closure) callconv(.c) void, .{ .name = "g_signal_override_class_closure" });
    const ret = cFn(arg_signal_id, arg_instance_type, arg_class_closure);
    return ret;
}
pub fn signalOverrideClassHandler(arg_signal_name: [*:0]const u8, arg_instance_type: core.Type, arg_class_handler: Callback) void {
    const cFn = @extern(*const fn ([*:0]const u8, core.Type, Callback) callconv(.c) void, .{ .name = "g_signal_override_class_handler" });
    const ret = cFn(arg_signal_name, arg_instance_type, arg_class_handler);
    return ret;
}
pub fn signalParseName(arg_detailed_signal: [*:0]const u8, arg_itype: core.Type, arg_force_detail_quark: bool) struct {
    ret: bool,
    signal_id_p: u32,
    detail_p: u32,
} {
    var argO_signal_id_p: u32 = undefined;
    const arg_signal_id_p: *u32 = &argO_signal_id_p;
    var argO_detail_p: u32 = undefined;
    const arg_detail_p: *u32 = &argO_detail_p;
    const cFn = @extern(*const fn ([*:0]const u8, core.Type, *u32, *u32, bool) callconv(.c) bool, .{ .name = "g_signal_parse_name" });
    const ret = cFn(arg_detailed_signal, arg_itype, arg_signal_id_p, arg_detail_p, arg_force_detail_quark);
    return .{ .ret = ret, .signal_id_p = argO_signal_id_p, .detail_p = argO_detail_p };
}
pub fn signalQuery(arg_signal_id: u32, arg_query: *SignalQuery) void {
    const cFn = @extern(*const fn (u32, *SignalQuery) callconv(.c) void, .{ .name = "g_signal_query" });
    const ret = cFn(arg_signal_id, arg_query);
    return ret;
}
pub fn signalRemoveEmissionHook(arg_signal_id: u32, arg_hook_id: u64) void {
    const cFn = @extern(*const fn (u32, u64) callconv(.c) void, .{ .name = "g_signal_remove_emission_hook" });
    const ret = cFn(arg_signal_id, arg_hook_id);
    return ret;
}
pub fn signalStopEmission(arg_instance: *Object, arg_signal_id: u32, arg_detail: u32) void {
    const cFn = @extern(*const fn (*Object, u32, u32) callconv(.c) void, .{ .name = "g_signal_stop_emission" });
    const ret = cFn(arg_instance, arg_signal_id, arg_detail);
    return ret;
}
pub fn signalStopEmissionByName(arg_instance: *Object, arg_detailed_signal: [*:0]const u8) void {
    const cFn = @extern(*const fn (*Object, [*:0]const u8) callconv(.c) void, .{ .name = "g_signal_stop_emission_by_name" });
    const ret = cFn(arg_instance, arg_detailed_signal);
    return ret;
}
pub fn signalTypeCclosureNew(arg_itype: core.Type, arg_struct_offset: u32) *Closure {
    const cFn = @extern(*const fn (core.Type, u32) callconv(.c) *Closure, .{ .name = "g_signal_type_cclosure_new" });
    const ret = cFn(arg_itype, arg_struct_offset);
    return ret;
}
pub fn sourceSetClosure(arg_source: *GLib.Source, arg_closure: *Closure) void {
    const cFn = @extern(*const fn (*GLib.Source, *Closure) callconv(.c) void, .{ .name = "g_source_set_closure" });
    const ret = cFn(arg_source, arg_closure);
    return ret;
}
pub fn sourceSetDummyCallback(arg_source: *GLib.Source) void {
    const cFn = @extern(*const fn (*GLib.Source) callconv(.c) void, .{ .name = "g_source_set_dummy_callback" });
    const ret = cFn(arg_source);
    return ret;
}
pub fn strdupValueContents(arg_value: *Value) [*:0]u8 {
    const cFn = @extern(*const fn (*Value) callconv(.c) [*:0]u8, .{ .name = "g_strdup_value_contents" });
    const ret = cFn(arg_value);
    return ret;
}
pub fn typeAddClassPrivate(arg_class_type: core.Type, arg_private_size: u64) void {
    const cFn = @extern(*const fn (core.Type, u64) callconv(.c) void, .{ .name = "g_type_add_class_private" });
    const ret = cFn(arg_class_type, arg_private_size);
    return ret;
}
pub fn typeAddInstancePrivate(arg_class_type: core.Type, arg_private_size: u64) i32 {
    const cFn = @extern(*const fn (core.Type, u64) callconv(.c) i32, .{ .name = "g_type_add_instance_private" });
    const ret = cFn(arg_class_type, arg_private_size);
    return ret;
}
pub fn typeAddInterfaceDynamic(arg_instance_type: core.Type, arg_interface_type: core.Type, arg_plugin: *TypePlugin) void {
    const cFn = @extern(*const fn (core.Type, core.Type, *TypePlugin) callconv(.c) void, .{ .name = "g_type_add_interface_dynamic" });
    const ret = cFn(arg_instance_type, arg_interface_type, arg_plugin);
    return ret;
}
pub fn typeAddInterfaceStatic(arg_instance_type: core.Type, arg_interface_type: core.Type, arg_info: *InterfaceInfo) void {
    const cFn = @extern(*const fn (core.Type, core.Type, *InterfaceInfo) callconv(.c) void, .{ .name = "g_type_add_interface_static" });
    const ret = cFn(arg_instance_type, arg_interface_type, arg_info);
    return ret;
}
pub fn typeCheckClassIsA(arg_g_class: *TypeClass, arg_is_a_type: core.Type) bool {
    const cFn = @extern(*const fn (*TypeClass, core.Type) callconv(.c) bool, .{ .name = "g_type_check_class_is_a" });
    const ret = cFn(arg_g_class, arg_is_a_type);
    return ret;
}
pub fn typeCheckInstance(arg_instance: *TypeInstance) bool {
    const cFn = @extern(*const fn (*TypeInstance) callconv(.c) bool, .{ .name = "g_type_check_instance" });
    const ret = cFn(arg_instance);
    return ret;
}
pub fn typeCheckInstanceIsA(arg_instance: *TypeInstance, arg_iface_type: core.Type) bool {
    const cFn = @extern(*const fn (*TypeInstance, core.Type) callconv(.c) bool, .{ .name = "g_type_check_instance_is_a" });
    const ret = cFn(arg_instance, arg_iface_type);
    return ret;
}
pub fn typeCheckInstanceIsFundamentallyA(arg_instance: *TypeInstance, arg_fundamental_type: core.Type) bool {
    const cFn = @extern(*const fn (*TypeInstance, core.Type) callconv(.c) bool, .{ .name = "g_type_check_instance_is_fundamentally_a" });
    const ret = cFn(arg_instance, arg_fundamental_type);
    return ret;
}
pub fn typeCheckIsValueType(arg_type: core.Type) bool {
    const cFn = @extern(*const fn (core.Type) callconv(.c) bool, .{ .name = "g_type_check_is_value_type" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn typeCheckValue(arg_value: *Value) bool {
    const cFn = @extern(*const fn (*Value) callconv(.c) bool, .{ .name = "g_type_check_value" });
    const ret = cFn(arg_value);
    return ret;
}
pub fn typeCheckValueHolds(arg_value: *Value, arg_type: core.Type) bool {
    const cFn = @extern(*const fn (*Value, core.Type) callconv(.c) bool, .{ .name = "g_type_check_value_holds" });
    const ret = cFn(arg_value, arg_type);
    return ret;
}
pub fn typeChildren(arg_type: core.Type) []core.Type {
    var argO_n_children: u32 = undefined;
    const arg_n_children: ?*u32 = &argO_n_children;
    const cFn = @extern(*const fn (core.Type, ?*u32) callconv(.c) [*]core.Type, .{ .name = "g_type_children" });
    const ret = cFn(arg_type, arg_n_children);
    return ret[0..@intCast(argO_n_children)];
}
pub fn typeClassAdjustPrivateOffset(arg_g_class: ?*anyopaque, arg_private_size_or_offset: *i32) void {
    const cFn = @extern(*const fn (?*anyopaque, *i32) callconv(.c) void, .{ .name = "g_type_class_adjust_private_offset" });
    const ret = cFn(@ptrCast(arg_g_class), arg_private_size_or_offset);
    return ret;
}
pub fn typeClassGet(arg_type: core.Type) *TypeClass {
    const cFn = @extern(*const fn (core.Type) callconv(.c) *TypeClass, .{ .name = "g_type_class_get" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn typeClassPeek(arg_type: core.Type) ?*TypeClass {
    const cFn = @extern(*const fn (core.Type) callconv(.c) ?*TypeClass, .{ .name = "g_type_class_peek" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn typeClassPeekStatic(arg_type: core.Type) ?*TypeClass {
    const cFn = @extern(*const fn (core.Type) callconv(.c) ?*TypeClass, .{ .name = "g_type_class_peek_static" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn typeClassRef(arg_type: core.Type) *TypeClass {
    const cFn = @extern(*const fn (core.Type) callconv(.c) *TypeClass, .{ .name = "g_type_class_ref" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn typeDefaultInterfaceGet(arg_g_type: core.Type) *TypeInterface {
    const cFn = @extern(*const fn (core.Type) callconv(.c) *TypeInterface, .{ .name = "g_type_default_interface_get" });
    const ret = cFn(arg_g_type);
    return ret;
}
pub fn typeDefaultInterfacePeek(arg_g_type: core.Type) *TypeInterface {
    const cFn = @extern(*const fn (core.Type) callconv(.c) *TypeInterface, .{ .name = "g_type_default_interface_peek" });
    const ret = cFn(arg_g_type);
    return ret;
}
pub fn typeDefaultInterfaceRef(arg_g_type: core.Type) *TypeInterface {
    const cFn = @extern(*const fn (core.Type) callconv(.c) *TypeInterface, .{ .name = "g_type_default_interface_ref" });
    const ret = cFn(arg_g_type);
    return ret;
}
pub fn typeDefaultInterfaceUnref(arg_g_iface: *TypeInterface) void {
    const cFn = @extern(*const fn (*TypeInterface) callconv(.c) void, .{ .name = "g_type_default_interface_unref" });
    const ret = cFn(arg_g_iface);
    return ret;
}
pub fn typeDepth(arg_type: core.Type) u32 {
    const cFn = @extern(*const fn (core.Type) callconv(.c) u32, .{ .name = "g_type_depth" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn typeEnsure(arg_type: core.Type) void {
    const cFn = @extern(*const fn (core.Type) callconv(.c) void, .{ .name = "g_type_ensure" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn typeFreeInstance(arg_instance: *TypeInstance) void {
    const cFn = @extern(*const fn (*TypeInstance) callconv(.c) void, .{ .name = "g_type_free_instance" });
    const ret = cFn(arg_instance);
    return ret;
}
pub fn typeFromName(arg_name: [*:0]const u8) core.Type {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) core.Type, .{ .name = "g_type_from_name" });
    const ret = cFn(arg_name);
    return ret;
}
pub fn typeFundamental(arg_type_id: core.Type) core.Type {
    const cFn = @extern(*const fn (core.Type) callconv(.c) core.Type, .{ .name = "g_type_fundamental" });
    const ret = cFn(arg_type_id);
    return ret;
}
pub fn typeFundamentalNext() core.Type {
    const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_type_fundamental_next" });
    const ret = cFn();
    return ret;
}
pub fn typeGetInstanceCount(arg_type: core.Type) i32 {
    const cFn = @extern(*const fn (core.Type) callconv(.c) i32, .{ .name = "g_type_get_instance_count" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn typeGetPlugin(arg_type: core.Type) *TypePlugin {
    const cFn = @extern(*const fn (core.Type) callconv(.c) *TypePlugin, .{ .name = "g_type_get_plugin" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn typeGetQdata(arg_type: core.Type, arg_quark: u32) ?*anyopaque {
    const cFn = @extern(*const fn (core.Type, u32) callconv(.c) ?*anyopaque, .{ .name = "g_type_get_qdata" });
    const ret = cFn(arg_type, arg_quark);
    return ret;
}
pub fn typeGetTypeRegistrationSerial() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_type_get_type_registration_serial" });
    const ret = cFn();
    return ret;
}
pub fn typeInit() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_type_init" });
    const ret = cFn();
    return ret;
}
pub fn typeInitWithDebugFlags(arg_debug_flags: TypeDebugFlags) void {
    const cFn = @extern(*const fn (TypeDebugFlags) callconv(.c) void, .{ .name = "g_type_init_with_debug_flags" });
    const ret = cFn(arg_debug_flags);
    return ret;
}
pub fn typeInterfaceAddPrerequisite(arg_interface_type: core.Type, arg_prerequisite_type: core.Type) void {
    const cFn = @extern(*const fn (core.Type, core.Type) callconv(.c) void, .{ .name = "g_type_interface_add_prerequisite" });
    const ret = cFn(arg_interface_type, arg_prerequisite_type);
    return ret;
}
pub fn typeInterfaceGetPlugin(arg_instance_type: core.Type, arg_interface_type: core.Type) *TypePlugin {
    const cFn = @extern(*const fn (core.Type, core.Type) callconv(.c) *TypePlugin, .{ .name = "g_type_interface_get_plugin" });
    const ret = cFn(arg_instance_type, arg_interface_type);
    return ret;
}
pub fn typeInterfaceInstantiatablePrerequisite(arg_interface_type: core.Type) core.Type {
    const cFn = @extern(*const fn (core.Type) callconv(.c) core.Type, .{ .name = "g_type_interface_instantiatable_prerequisite" });
    const ret = cFn(arg_interface_type);
    return ret;
}
pub fn typeInterfacePeek(arg_instance_class: *TypeClass, arg_iface_type: core.Type) ?*TypeInterface {
    const cFn = @extern(*const fn (*TypeClass, core.Type) callconv(.c) ?*TypeInterface, .{ .name = "g_type_interface_peek" });
    const ret = cFn(arg_instance_class, arg_iface_type);
    return ret;
}
pub fn typeInterfacePrerequisites(arg_interface_type: core.Type) []core.Type {
    var argO_n_prerequisites: u32 = undefined;
    const arg_n_prerequisites: ?*u32 = &argO_n_prerequisites;
    const cFn = @extern(*const fn (core.Type, ?*u32) callconv(.c) [*]core.Type, .{ .name = "g_type_interface_prerequisites" });
    const ret = cFn(arg_interface_type, arg_n_prerequisites);
    return ret[0..@intCast(argO_n_prerequisites)];
}
pub fn typeInterfaces(arg_type: core.Type) []core.Type {
    var argO_n_interfaces: u32 = undefined;
    const arg_n_interfaces: ?*u32 = &argO_n_interfaces;
    const cFn = @extern(*const fn (core.Type, ?*u32) callconv(.c) [*]core.Type, .{ .name = "g_type_interfaces" });
    const ret = cFn(arg_type, arg_n_interfaces);
    return ret[0..@intCast(argO_n_interfaces)];
}
pub fn typeIsA(arg_type: core.Type, arg_is_a_type: core.Type) bool {
    const cFn = @extern(*const fn (core.Type, core.Type) callconv(.c) bool, .{ .name = "g_type_is_a" });
    const ret = cFn(arg_type, arg_is_a_type);
    return ret;
}
pub fn typeName(arg_type: core.Type) ?[*:0]u8 {
    const cFn = @extern(*const fn (core.Type) callconv(.c) ?[*:0]u8, .{ .name = "g_type_name" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn typeNameFromClass(arg_g_class: *TypeClass) [*:0]u8 {
    const cFn = @extern(*const fn (*TypeClass) callconv(.c) [*:0]u8, .{ .name = "g_type_name_from_class" });
    const ret = cFn(arg_g_class);
    return ret;
}
pub fn typeNameFromInstance(arg_instance: *TypeInstance) [*:0]u8 {
    const cFn = @extern(*const fn (*TypeInstance) callconv(.c) [*:0]u8, .{ .name = "g_type_name_from_instance" });
    const ret = cFn(arg_instance);
    return ret;
}
pub fn typeNextBase(arg_leaf_type: core.Type, arg_root_type: core.Type) core.Type {
    const cFn = @extern(*const fn (core.Type, core.Type) callconv(.c) core.Type, .{ .name = "g_type_next_base" });
    const ret = cFn(arg_leaf_type, arg_root_type);
    return ret;
}
pub fn typeParent(arg_type: core.Type) core.Type {
    const cFn = @extern(*const fn (core.Type) callconv(.c) core.Type, .{ .name = "g_type_parent" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn typeQname(arg_type: core.Type) u32 {
    const cFn = @extern(*const fn (core.Type) callconv(.c) u32, .{ .name = "g_type_qname" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn typeQuery(arg_type: core.Type, arg_query: *TypeQuery) void {
    const cFn = @extern(*const fn (core.Type, *TypeQuery) callconv(.c) void, .{ .name = "g_type_query" });
    const ret = cFn(arg_type, arg_query);
    return ret;
}
pub fn typeRegisterDynamic(arg_parent_type: core.Type, arg_type_name: [*:0]const u8, arg_plugin: *TypePlugin, arg_flags: TypeFlags) core.Type {
    const cFn = @extern(*const fn (core.Type, [*:0]const u8, *TypePlugin, TypeFlags) callconv(.c) core.Type, .{ .name = "g_type_register_dynamic" });
    const ret = cFn(arg_parent_type, arg_type_name, arg_plugin, arg_flags);
    return ret;
}
pub fn typeRegisterFundamental(arg_type_id: core.Type, arg_type_name: [*:0]const u8, arg_info: *TypeInfo, arg_finfo: *TypeFundamentalInfo, arg_flags: TypeFlags) core.Type {
    const cFn = @extern(*const fn (core.Type, [*:0]const u8, *TypeInfo, *TypeFundamentalInfo, TypeFlags) callconv(.c) core.Type, .{ .name = "g_type_register_fundamental" });
    const ret = cFn(arg_type_id, arg_type_name, arg_info, arg_finfo, arg_flags);
    return ret;
}
pub fn typeRegisterStatic(arg_parent_type: core.Type, arg_type_name: [*:0]const u8, arg_info: *TypeInfo, arg_flags: TypeFlags) core.Type {
    const cFn = @extern(*const fn (core.Type, [*:0]const u8, *TypeInfo, TypeFlags) callconv(.c) core.Type, .{ .name = "g_type_register_static" });
    const ret = cFn(arg_parent_type, arg_type_name, arg_info, arg_flags);
    return ret;
}
pub fn typeSetQdata(arg_type: core.Type, arg_quark: u32, arg_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (core.Type, u32, ?*anyopaque) callconv(.c) void, .{ .name = "g_type_set_qdata" });
    const ret = cFn(arg_type, arg_quark, @ptrCast(arg_data));
    return ret;
}
pub fn typeTestFlags(arg_type: core.Type, arg_flags: u32) bool {
    const cFn = @extern(*const fn (core.Type, u32) callconv(.c) bool, .{ .name = "g_type_test_flags" });
    const ret = cFn(arg_type, arg_flags);
    return ret;
}
pub fn valueTypeCompatible(arg_src_type: core.Type, arg_dest_type: core.Type) bool {
    const cFn = @extern(*const fn (core.Type, core.Type) callconv(.c) bool, .{ .name = "g_value_type_compatible" });
    const ret = cFn(arg_src_type, arg_dest_type);
    return ret;
}
pub fn valueTypeTransformable(arg_src_type: core.Type, arg_dest_type: core.Type) bool {
    const cFn = @extern(*const fn (core.Type, core.Type) callconv(.c) bool, .{ .name = "g_value_type_transformable" });
    const ret = cFn(arg_src_type, arg_dest_type);
    return ret;
}
pub fn variantGetGtype() core.Type {
    const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_variant_get_gtype" });
    const ret = cFn();
    return ret;
}

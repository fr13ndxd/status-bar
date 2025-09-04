const core = @import("core.zig");
const GObject = @import("GObject.zig");
const GLib = @import("GLib.zig");
const GModule = @import("GModule.zig");
const Gio = @This();
pub const Action = struct {
    pub const Class = ActionInterface;
    _props: struct {
        enabled: core.Property(bool, "enabled") = .{},
        name: core.Property([*:0]const u8, "name") = .{},
        @"parameter-type": core.Property(GLib.VariantType, "parameter-type") = .{},
        state: core.Property(GLib.Variant, "state") = .{},
        @"state-type": core.Property(GLib.VariantType, "state-type") = .{},
    },
    pub fn nameIsValid(arg_action_name: [*:0]const u8) bool {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_action_name_is_valid" });
        const ret = cFn(arg_action_name);
        return ret;
    }
    pub fn parseDetailedName(arg_detailed_name: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        action_name: [*:0]u8,
        target_value: ?*GLib.Variant,
    } {
        var argO_action_name: ?[*:0]u8 = undefined;
        const arg_action_name: ?*[*:0]u8 = &argO_action_name;
        var argO_target_value: ?*GLib.Variant = undefined;
        const arg_target_value: ?*?*GLib.Variant = &argO_target_value;
        const cFn = @extern(*const fn ([*:0]const u8, ?*[*:0]u8, ?*?*GLib.Variant, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_action_parse_detailed_name" });
        const ret = cFn(arg_detailed_name, arg_action_name, arg_target_value, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .action_name = argO_action_name, .target_value = argO_target_value };
    }
    pub fn printDetailedName(arg_action_name: [*:0]const u8, arg_target_value: ?*GLib.Variant) [*:0]u8 {
        const cFn = @extern(*const fn ([*:0]const u8, ?*GLib.Variant) callconv(.c) [*:0]u8, .{ .name = "g_action_print_detailed_name" });
        const ret = cFn(arg_action_name, arg_target_value);
        return ret;
    }
    pub fn activate(self: *Action, arg_parameter: ?*GLib.Variant) void {
        const cFn = @extern(*const fn (*Action, ?*GLib.Variant) callconv(.c) void, .{ .name = "g_action_activate" });
        const ret = cFn(self, arg_parameter);
        return ret;
    }
    pub fn changeState(self: *Action, arg_value: *GLib.Variant) void {
        const cFn = @extern(*const fn (*Action, *GLib.Variant) callconv(.c) void, .{ .name = "g_action_change_state" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn getEnabled(self: *Action) bool {
        const cFn = @extern(*const fn (*Action) callconv(.c) bool, .{ .name = "g_action_get_enabled" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getName(self: *Action) [*:0]u8 {
        const cFn = @extern(*const fn (*Action) callconv(.c) [*:0]u8, .{ .name = "g_action_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getParameterType(self: *Action) ?*GLib.VariantType {
        const cFn = @extern(*const fn (*Action) callconv(.c) ?*GLib.VariantType, .{ .name = "g_action_get_parameter_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getState(self: *Action) ?*GLib.Variant {
        const cFn = @extern(*const fn (*Action) callconv(.c) ?*GLib.Variant, .{ .name = "g_action_get_state" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStateHint(self: *Action) ?*GLib.Variant {
        const cFn = @extern(*const fn (*Action) callconv(.c) ?*GLib.Variant, .{ .name = "g_action_get_state_hint" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStateType(self: *Action) ?*GLib.VariantType {
        const cFn = @extern(*const fn (*Action) callconv(.c) ?*GLib.VariantType, .{ .name = "g_action_get_state_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_action_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ActionEntry = extern struct {
    name: ?[*:0]const u8,
    activate: ?*const fn (arg_action: *SimpleAction, arg_parameter: *GLib.Variant, arg_user_data: ?*anyopaque) callconv(.c) void,
    parameter_type: ?[*:0]const u8,
    state: ?[*:0]const u8,
    change_state: ?*const fn (arg_action: *SimpleAction, arg_value: *GLib.Variant, arg_user_data: ?*anyopaque) callconv(.c) void,
    padding: [3]u64,
};
pub const ActionGroup = struct {
    pub const Class = ActionGroupInterface;
    _signals: struct {
        @"action-added": core.Signal(fn (*ActionGroup, [*:0]const u8) void, "action-added") = .{},
        @"action-enabled-changed": core.Signal(fn (*ActionGroup, [*:0]const u8, bool) void, "action-enabled-changed") = .{},
        @"action-removed": core.Signal(fn (*ActionGroup, [*:0]const u8) void, "action-removed") = .{},
        @"action-state-changed": core.Signal(fn (*ActionGroup, [*:0]const u8, *GLib.Variant) void, "action-state-changed") = .{},
    },
    pub fn actionAdded(self: *ActionGroup, arg_action_name: [*:0]const u8) void {
        const cFn = @extern(*const fn (*ActionGroup, [*:0]const u8) callconv(.c) void, .{ .name = "g_action_group_action_added" });
        const ret = cFn(self, arg_action_name);
        return ret;
    }
    pub fn actionEnabledChanged(self: *ActionGroup, arg_action_name: [*:0]const u8, arg_enabled: bool) void {
        const cFn = @extern(*const fn (*ActionGroup, [*:0]const u8, bool) callconv(.c) void, .{ .name = "g_action_group_action_enabled_changed" });
        const ret = cFn(self, arg_action_name, arg_enabled);
        return ret;
    }
    pub fn actionRemoved(self: *ActionGroup, arg_action_name: [*:0]const u8) void {
        const cFn = @extern(*const fn (*ActionGroup, [*:0]const u8) callconv(.c) void, .{ .name = "g_action_group_action_removed" });
        const ret = cFn(self, arg_action_name);
        return ret;
    }
    pub fn actionStateChanged(self: *ActionGroup, arg_action_name: [*:0]const u8, arg_state: *GLib.Variant) void {
        const cFn = @extern(*const fn (*ActionGroup, [*:0]const u8, *GLib.Variant) callconv(.c) void, .{ .name = "g_action_group_action_state_changed" });
        const ret = cFn(self, arg_action_name, arg_state);
        return ret;
    }
    pub fn activateAction(self: *ActionGroup, arg_action_name: [*:0]const u8, arg_parameter: ?*GLib.Variant) void {
        const cFn = @extern(*const fn (*ActionGroup, [*:0]const u8, ?*GLib.Variant) callconv(.c) void, .{ .name = "g_action_group_activate_action" });
        const ret = cFn(self, arg_action_name, arg_parameter);
        return ret;
    }
    pub fn changeActionState(self: *ActionGroup, arg_action_name: [*:0]const u8, arg_value: *GLib.Variant) void {
        const cFn = @extern(*const fn (*ActionGroup, [*:0]const u8, *GLib.Variant) callconv(.c) void, .{ .name = "g_action_group_change_action_state" });
        const ret = cFn(self, arg_action_name, arg_value);
        return ret;
    }
    pub fn getActionEnabled(self: *ActionGroup, arg_action_name: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*ActionGroup, [*:0]const u8) callconv(.c) bool, .{ .name = "g_action_group_get_action_enabled" });
        const ret = cFn(self, arg_action_name);
        return ret;
    }
    pub fn getActionParameterType(self: *ActionGroup, arg_action_name: [*:0]const u8) ?*GLib.VariantType {
        const cFn = @extern(*const fn (*ActionGroup, [*:0]const u8) callconv(.c) ?*GLib.VariantType, .{ .name = "g_action_group_get_action_parameter_type" });
        const ret = cFn(self, arg_action_name);
        return ret;
    }
    pub fn getActionState(self: *ActionGroup, arg_action_name: [*:0]const u8) ?*GLib.Variant {
        const cFn = @extern(*const fn (*ActionGroup, [*:0]const u8) callconv(.c) ?*GLib.Variant, .{ .name = "g_action_group_get_action_state" });
        const ret = cFn(self, arg_action_name);
        return ret;
    }
    pub fn getActionStateHint(self: *ActionGroup, arg_action_name: [*:0]const u8) ?*GLib.Variant {
        const cFn = @extern(*const fn (*ActionGroup, [*:0]const u8) callconv(.c) ?*GLib.Variant, .{ .name = "g_action_group_get_action_state_hint" });
        const ret = cFn(self, arg_action_name);
        return ret;
    }
    pub fn getActionStateType(self: *ActionGroup, arg_action_name: [*:0]const u8) ?*GLib.VariantType {
        const cFn = @extern(*const fn (*ActionGroup, [*:0]const u8) callconv(.c) ?*GLib.VariantType, .{ .name = "g_action_group_get_action_state_type" });
        const ret = cFn(self, arg_action_name);
        return ret;
    }
    pub fn hasAction(self: *ActionGroup, arg_action_name: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*ActionGroup, [*:0]const u8) callconv(.c) bool, .{ .name = "g_action_group_has_action" });
        const ret = cFn(self, arg_action_name);
        return ret;
    }
    pub fn listActions(self: *ActionGroup) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*ActionGroup) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_action_group_list_actions" });
        const ret = cFn(self);
        return ret;
    }
    pub fn queryAction(self: *ActionGroup, arg_action_name: [*:0]const u8) struct {
        ret: bool,
        enabled: bool,
        parameter_type: *GLib.VariantType,
        state_type: *GLib.VariantType,
        state_hint: *GLib.Variant,
        state: *GLib.Variant,
    } {
        var argO_enabled: bool = undefined;
        const arg_enabled: *bool = &argO_enabled;
        var argO_parameter_type: ?*GLib.VariantType = undefined;
        const arg_parameter_type: ?**GLib.VariantType = &argO_parameter_type;
        var argO_state_type: ?*GLib.VariantType = undefined;
        const arg_state_type: ?**GLib.VariantType = &argO_state_type;
        var argO_state_hint: ?*GLib.Variant = undefined;
        const arg_state_hint: ?**GLib.Variant = &argO_state_hint;
        var argO_state: ?*GLib.Variant = undefined;
        const arg_state: ?**GLib.Variant = &argO_state;
        const cFn = @extern(*const fn (*ActionGroup, [*:0]const u8, *bool, ?**GLib.VariantType, ?**GLib.VariantType, ?**GLib.Variant, ?**GLib.Variant) callconv(.c) bool, .{ .name = "g_action_group_query_action" });
        const ret = cFn(self, arg_action_name, arg_enabled, arg_parameter_type, arg_state_type, arg_state_hint, arg_state);
        return .{ .ret = ret, .enabled = argO_enabled, .parameter_type = argO_parameter_type, .state_type = argO_state_type, .state_hint = argO_state_hint, .state = argO_state };
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_action_group_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ActionGroupInterface = extern struct {
    g_iface: GObject.TypeInterface,
    has_action: ?*const fn (arg_action_group: *ActionGroup, arg_action_name: [*:0]const u8) callconv(.c) bool,
    list_actions: ?*const fn (arg_action_group: *ActionGroup) callconv(.c) [*]?[*:0]const u8,
    get_action_enabled: ?*const fn (arg_action_group: *ActionGroup, arg_action_name: [*:0]const u8) callconv(.c) bool,
    get_action_parameter_type: ?*const fn (arg_action_group: *ActionGroup, arg_action_name: [*:0]const u8) callconv(.c) ?*GLib.VariantType,
    get_action_state_type: ?*const fn (arg_action_group: *ActionGroup, arg_action_name: [*:0]const u8) callconv(.c) ?*GLib.VariantType,
    get_action_state_hint: ?*const fn (arg_action_group: *ActionGroup, arg_action_name: [*:0]const u8) callconv(.c) ?*GLib.Variant,
    get_action_state: ?*const fn (arg_action_group: *ActionGroup, arg_action_name: [*:0]const u8) callconv(.c) ?*GLib.Variant,
    change_action_state: ?*const fn (arg_action_group: *ActionGroup, arg_action_name: [*:0]const u8, arg_value: *GLib.Variant) callconv(.c) void,
    activate_action: ?*const fn (arg_action_group: *ActionGroup, arg_action_name: [*:0]const u8, arg_parameter: ?*GLib.Variant) callconv(.c) void,
    action_added: ?*const fn (arg_action_group: *ActionGroup, arg_action_name: [*:0]const u8) callconv(.c) void,
    action_removed: ?*const fn (arg_action_group: *ActionGroup, arg_action_name: [*:0]const u8) callconv(.c) void,
    action_enabled_changed: ?*const fn (arg_action_group: *ActionGroup, arg_action_name: [*:0]const u8, arg_enabled: bool) callconv(.c) void,
    action_state_changed: ?*const fn (arg_action_group: *ActionGroup, arg_action_name: [*:0]const u8, arg_state: *GLib.Variant) callconv(.c) void,
    query_action: ?*const fn (arg_action_group: *ActionGroup, arg_action_name: [*:0]const u8, arg_enabled: *bool, arg_parameter_type: ?**GLib.VariantType, arg_state_type: ?**GLib.VariantType, arg_state_hint: ?**GLib.Variant, arg_state: ?**GLib.Variant) callconv(.c) bool,
};
pub const ActionInterface = extern struct {
    g_iface: GObject.TypeInterface,
    get_name: ?*const fn (arg_action: *Action) callconv(.c) [*:0]u8,
    get_parameter_type: ?*const fn (arg_action: *Action) callconv(.c) ?*GLib.VariantType,
    get_state_type: ?*const fn (arg_action: *Action) callconv(.c) ?*GLib.VariantType,
    get_state_hint: ?*const fn (arg_action: *Action) callconv(.c) ?*GLib.Variant,
    get_enabled: ?*const fn (arg_action: *Action) callconv(.c) bool,
    get_state: ?*const fn (arg_action: *Action) callconv(.c) ?*GLib.Variant,
    change_state: ?*const fn (arg_action: *Action, arg_value: *GLib.Variant) callconv(.c) void,
    activate: ?*const fn (arg_action: *Action, arg_parameter: ?*GLib.Variant) callconv(.c) void,
};
pub const ActionMap = struct {
    pub const Class = ActionMapInterface;
    pub fn addAction(self: *ActionMap, arg_action: *Action) void {
        const cFn = @extern(*const fn (*ActionMap, *Action) callconv(.c) void, .{ .name = "g_action_map_add_action" });
        const ret = cFn(self, arg_action);
        return ret;
    }
    pub fn addActionEntries(self: *ActionMap, argS_entries: []ActionEntry, arg_user_data: ?*anyopaque) void {
        const arg_entries: [*]ActionEntry = @ptrCast(argS_entries);
        const arg_n_entries: i32 = @intCast((argS_entries).len);
        const cFn = @extern(*const fn (*ActionMap, [*]ActionEntry, i32, ?*anyopaque) callconv(.c) void, .{ .name = "g_action_map_add_action_entries" });
        const ret = cFn(self, arg_entries, arg_n_entries, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn lookupAction(self: *ActionMap, arg_action_name: [*:0]const u8) ?*Action {
        const cFn = @extern(*const fn (*ActionMap, [*:0]const u8) callconv(.c) ?*Action, .{ .name = "g_action_map_lookup_action" });
        const ret = cFn(self, arg_action_name);
        return ret;
    }
    pub fn removeAction(self: *ActionMap, arg_action_name: [*:0]const u8) void {
        const cFn = @extern(*const fn (*ActionMap, [*:0]const u8) callconv(.c) void, .{ .name = "g_action_map_remove_action" });
        const ret = cFn(self, arg_action_name);
        return ret;
    }
    pub fn removeActionEntries(self: *ActionMap, argS_entries: []ActionEntry) void {
        const arg_entries: [*]ActionEntry = @ptrCast(argS_entries);
        const arg_n_entries: i32 = @intCast((argS_entries).len);
        const cFn = @extern(*const fn (*ActionMap, [*]ActionEntry, i32) callconv(.c) void, .{ .name = "g_action_map_remove_action_entries" });
        const ret = cFn(self, arg_entries, arg_n_entries);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_action_map_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ActionMapInterface = extern struct {
    g_iface: GObject.TypeInterface,
    lookup_action: ?*const fn (arg_action_map: *ActionMap, arg_action_name: [*:0]const u8) callconv(.c) ?*Action,
    add_action: ?*const fn (arg_action_map: *ActionMap, arg_action: *Action) callconv(.c) void,
    remove_action: ?*const fn (arg_action_map: *ActionMap, arg_action_name: [*:0]const u8) callconv(.c) void,
};
pub const AppInfo = struct {
    pub const Class = AppInfoIface;
    pub fn createFromCommandline(arg_commandline: [*:0]const u8, arg_application_name: ?[*:0]const u8, arg_flags: AppInfoCreateFlags, arg_error: *?*GLib.Error) error{GError}!*AppInfo {
        const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, AppInfoCreateFlags, *?*GLib.Error) callconv(.c) *AppInfo, .{ .name = "g_app_info_create_from_commandline" });
        const ret = cFn(arg_commandline, arg_application_name, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getAll() ?*GLib.List {
        const cFn = @extern(*const fn () callconv(.c) ?*GLib.List, .{ .name = "g_app_info_get_all" });
        const ret = cFn();
        return ret;
    }
    pub fn getAllForType(arg_content_type: [*:0]const u8) ?*GLib.List {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*GLib.List, .{ .name = "g_app_info_get_all_for_type" });
        const ret = cFn(arg_content_type);
        return ret;
    }
    pub fn getDefaultForType(arg_content_type: [*:0]const u8, arg_must_support_uris: bool) ?*AppInfo {
        const cFn = @extern(*const fn ([*:0]const u8, bool) callconv(.c) ?*AppInfo, .{ .name = "g_app_info_get_default_for_type" });
        const ret = cFn(arg_content_type, arg_must_support_uris);
        return ret;
    }
    pub fn getDefaultForTypeAsync(arg_content_type: [*:0]const u8, arg_must_support_uris: bool, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn ([*:0]const u8, bool, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_app_info_get_default_for_type_async" });
        const ret = cFn(arg_content_type, arg_must_support_uris, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn getDefaultForTypeFinish(arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*AppInfo {
        const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) *AppInfo, .{ .name = "g_app_info_get_default_for_type_finish" });
        const ret = cFn(arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getDefaultForUriScheme(arg_uri_scheme: [*:0]const u8) ?*AppInfo {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*AppInfo, .{ .name = "g_app_info_get_default_for_uri_scheme" });
        const ret = cFn(arg_uri_scheme);
        return ret;
    }
    pub fn getDefaultForUriSchemeAsync(arg_uri_scheme: [*:0]const u8, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn ([*:0]const u8, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_app_info_get_default_for_uri_scheme_async" });
        const ret = cFn(arg_uri_scheme, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn getDefaultForUriSchemeFinish(arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*AppInfo {
        const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) *AppInfo, .{ .name = "g_app_info_get_default_for_uri_scheme_finish" });
        const ret = cFn(arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getFallbackForType(arg_content_type: [*:0]const u8) ?*GLib.List {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*GLib.List, .{ .name = "g_app_info_get_fallback_for_type" });
        const ret = cFn(arg_content_type);
        return ret;
    }
    pub fn getRecommendedForType(arg_content_type: [*:0]const u8) ?*GLib.List {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*GLib.List, .{ .name = "g_app_info_get_recommended_for_type" });
        const ret = cFn(arg_content_type);
        return ret;
    }
    pub fn launchDefaultForUri(arg_uri: [*:0]const u8, arg_context: ?*AppLaunchContext, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn ([*:0]const u8, ?*AppLaunchContext, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_app_info_launch_default_for_uri" });
        const ret = cFn(arg_uri, arg_context, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn launchDefaultForUriAsync(arg_uri: [*:0]const u8, arg_context: ?*AppLaunchContext, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn ([*:0]const u8, ?*AppLaunchContext, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_app_info_launch_default_for_uri_async" });
        const ret = cFn(arg_uri, arg_context, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn launchDefaultForUriFinish(arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_app_info_launch_default_for_uri_finish" });
        const ret = cFn(arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn resetTypeAssociations(arg_content_type: [*:0]const u8) void {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) void, .{ .name = "g_app_info_reset_type_associations" });
        const ret = cFn(arg_content_type);
        return ret;
    }
    pub fn addSupportsType(self: *AppInfo, arg_content_type: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*AppInfo, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_app_info_add_supports_type" });
        const ret = cFn(self, arg_content_type, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn canDelete(self: *AppInfo) bool {
        const cFn = @extern(*const fn (*AppInfo) callconv(.c) bool, .{ .name = "g_app_info_can_delete" });
        const ret = cFn(self);
        return ret;
    }
    pub fn canRemoveSupportsType(self: *AppInfo) bool {
        const cFn = @extern(*const fn (*AppInfo) callconv(.c) bool, .{ .name = "g_app_info_can_remove_supports_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn delete(self: *AppInfo) bool {
        const cFn = @extern(*const fn (*AppInfo) callconv(.c) bool, .{ .name = "g_app_info_delete" });
        const ret = cFn(self);
        return ret;
    }
    pub fn dup(self: *AppInfo) *AppInfo {
        const cFn = @extern(*const fn (*AppInfo) callconv(.c) *AppInfo, .{ .name = "g_app_info_dup" });
        const ret = cFn(self);
        return ret;
    }
    pub fn equal(self: *AppInfo, arg_appinfo2: *AppInfo) bool {
        const cFn = @extern(*const fn (*AppInfo, *AppInfo) callconv(.c) bool, .{ .name = "g_app_info_equal" });
        const ret = cFn(self, arg_appinfo2);
        return ret;
    }
    pub fn getCommandline(self: *AppInfo) ?[*:0]u8 {
        const cFn = @extern(*const fn (*AppInfo) callconv(.c) ?[*:0]u8, .{ .name = "g_app_info_get_commandline" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDescription(self: *AppInfo) ?[*:0]u8 {
        const cFn = @extern(*const fn (*AppInfo) callconv(.c) ?[*:0]u8, .{ .name = "g_app_info_get_description" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDisplayName(self: *AppInfo) [*:0]u8 {
        const cFn = @extern(*const fn (*AppInfo) callconv(.c) [*:0]u8, .{ .name = "g_app_info_get_display_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getExecutable(self: *AppInfo) [*:0]u8 {
        const cFn = @extern(*const fn (*AppInfo) callconv(.c) [*:0]u8, .{ .name = "g_app_info_get_executable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIcon(self: *AppInfo) ?*Icon {
        const cFn = @extern(*const fn (*AppInfo) callconv(.c) ?*Icon, .{ .name = "g_app_info_get_icon" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getId(self: *AppInfo) ?[*:0]u8 {
        const cFn = @extern(*const fn (*AppInfo) callconv(.c) ?[*:0]u8, .{ .name = "g_app_info_get_id" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getName(self: *AppInfo) [*:0]u8 {
        const cFn = @extern(*const fn (*AppInfo) callconv(.c) [*:0]u8, .{ .name = "g_app_info_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSupportedTypes(self: *AppInfo) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*AppInfo) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_app_info_get_supported_types" });
        const ret = cFn(self);
        return ret;
    }
    pub fn launch(self: *AppInfo, arg_files: ?*GLib.List, arg_context: ?*AppLaunchContext, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*AppInfo, ?*GLib.List, ?*AppLaunchContext, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_app_info_launch" });
        const ret = cFn(self, arg_files, arg_context, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn launchUris(self: *AppInfo, arg_uris: ?*GLib.List, arg_context: ?*AppLaunchContext, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*AppInfo, ?*GLib.List, ?*AppLaunchContext, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_app_info_launch_uris" });
        const ret = cFn(self, arg_uris, arg_context, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn launchUrisAsync(self: *AppInfo, arg_uris: ?*GLib.List, arg_context: ?*AppLaunchContext, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*AppInfo, ?*GLib.List, ?*AppLaunchContext, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_app_info_launch_uris_async" });
        const ret = cFn(self, arg_uris, arg_context, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn launchUrisFinish(self: *AppInfo, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*AppInfo, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_app_info_launch_uris_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn removeSupportsType(self: *AppInfo, arg_content_type: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*AppInfo, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_app_info_remove_supports_type" });
        const ret = cFn(self, arg_content_type, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setAsDefaultForExtension(self: *AppInfo, arg_extension: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*AppInfo, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_app_info_set_as_default_for_extension" });
        const ret = cFn(self, arg_extension, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setAsDefaultForType(self: *AppInfo, arg_content_type: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*AppInfo, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_app_info_set_as_default_for_type" });
        const ret = cFn(self, arg_content_type, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setAsLastUsedForType(self: *AppInfo, arg_content_type: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*AppInfo, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_app_info_set_as_last_used_for_type" });
        const ret = cFn(self, arg_content_type, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn shouldShow(self: *AppInfo) bool {
        const cFn = @extern(*const fn (*AppInfo) callconv(.c) bool, .{ .name = "g_app_info_should_show" });
        const ret = cFn(self);
        return ret;
    }
    pub fn supportsFiles(self: *AppInfo) bool {
        const cFn = @extern(*const fn (*AppInfo) callconv(.c) bool, .{ .name = "g_app_info_supports_files" });
        const ret = cFn(self);
        return ret;
    }
    pub fn supportsUris(self: *AppInfo) bool {
        const cFn = @extern(*const fn (*AppInfo) callconv(.c) bool, .{ .name = "g_app_info_supports_uris" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_app_info_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const AppInfoCreateFlags = packed struct(u32) {
    needs_terminal: bool = false,
    supports_uris: bool = false,
    supports_startup_notification: bool = false,
    _: u29 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_app_info_create_flags_get_type" });
        return cFn();
    }
};
pub const AppInfoIface = extern struct {
    g_iface: GObject.TypeInterface,
    dup: ?*const fn (arg_appinfo: *AppInfo) callconv(.c) *AppInfo,
    equal: ?*const fn (arg_appinfo1: *AppInfo, arg_appinfo2: *AppInfo) callconv(.c) bool,
    get_id: ?*const fn (arg_appinfo: *AppInfo) callconv(.c) ?[*:0]u8,
    get_name: ?*const fn (arg_appinfo: *AppInfo) callconv(.c) [*:0]u8,
    get_description: ?*const fn (arg_appinfo: *AppInfo) callconv(.c) ?[*:0]u8,
    get_executable: ?*const fn (arg_appinfo: *AppInfo) callconv(.c) [*:0]u8,
    get_icon: ?*const fn (arg_appinfo: *AppInfo) callconv(.c) ?*Icon,
    launch: ?*const fn (arg_appinfo: *AppInfo, arg_files: ?*GLib.List, arg_context: ?*AppLaunchContext, arg_error: *?*GLib.Error) callconv(.c) bool,
    supports_uris: ?*const fn (arg_appinfo: *AppInfo) callconv(.c) bool,
    supports_files: ?*const fn (arg_appinfo: *AppInfo) callconv(.c) bool,
    launch_uris: ?*const fn (arg_appinfo: *AppInfo, arg_uris: ?*GLib.List, arg_context: ?*AppLaunchContext, arg_error: *?*GLib.Error) callconv(.c) bool,
    should_show: ?*const fn (arg_appinfo: *AppInfo) callconv(.c) bool,
    set_as_default_for_type: ?*const fn (arg_appinfo: *AppInfo, arg_content_type: [*:0]const u8, arg_error: *?*GLib.Error) callconv(.c) bool,
    set_as_default_for_extension: ?*const fn (arg_appinfo: *AppInfo, arg_extension: [*:0]const u8, arg_error: *?*GLib.Error) callconv(.c) bool,
    add_supports_type: ?*const fn (arg_appinfo: *AppInfo, arg_content_type: [*:0]const u8, arg_error: *?*GLib.Error) callconv(.c) bool,
    can_remove_supports_type: ?*const fn (arg_appinfo: *AppInfo) callconv(.c) bool,
    remove_supports_type: ?*const fn (arg_appinfo: *AppInfo, arg_content_type: [*:0]const u8, arg_error: *?*GLib.Error) callconv(.c) bool,
    can_delete: ?*const fn (arg_appinfo: *AppInfo) callconv(.c) bool,
    do_delete: ?*const fn (arg_appinfo: *AppInfo) callconv(.c) bool,
    get_commandline: ?*const fn (arg_appinfo: *AppInfo) callconv(.c) ?[*:0]u8,
    get_display_name: ?*const fn (arg_appinfo: *AppInfo) callconv(.c) [*:0]u8,
    set_as_last_used_for_type: ?*const fn (arg_appinfo: *AppInfo, arg_content_type: [*:0]const u8, arg_error: *?*GLib.Error) callconv(.c) bool,
    get_supported_types: ?*const fn (arg_appinfo: *AppInfo) callconv(.c) [*]?[*:0]const u8,
    launch_uris_async: ?*const fn (arg_appinfo: *AppInfo, arg_uris: ?*GLib.List, arg_context: ?*AppLaunchContext, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    launch_uris_finish: ?*const fn (arg_appinfo: *AppInfo, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
};
pub const AppInfoMonitor = struct {
    pub const Parent = GObject.Object;
    _signals: struct {
        changed: core.Signal(fn (*AppInfoMonitor) void, "changed") = .{},
    },
    pub fn get() *AppInfoMonitor {
        const cFn = @extern(*const fn () callconv(.c) *AppInfoMonitor, .{ .name = "g_app_info_monitor_get" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_app_info_monitor_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const AppLaunchContext = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = AppLaunchContextClass;
    _signals: struct {
        @"launch-failed": core.Signal(fn (*AppLaunchContext, [*:0]const u8) void, "launch-failed") = .{},
        @"launch-started": core.Signal(fn (*AppLaunchContext, *AppInfo, ?*GLib.Variant) void, "launch-started") = .{},
        launched: core.Signal(fn (*AppLaunchContext, *AppInfo, *GLib.Variant) void, "launched") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*AppLaunchContextPrivate,
    pub fn new() *AppLaunchContext {
        const cFn = @extern(*const fn () callconv(.c) *AppLaunchContext, .{ .name = "g_app_launch_context_new" });
        const ret = cFn();
        return ret;
    }
    pub fn getDisplay(self: *AppLaunchContext, arg_info: *AppInfo, arg_files: *GLib.List) ?[*:0]u8 {
        const cFn = @extern(*const fn (*AppLaunchContext, *AppInfo, *GLib.List) callconv(.c) ?[*:0]u8, .{ .name = "g_app_launch_context_get_display" });
        const ret = cFn(self, arg_info, arg_files);
        return ret;
    }
    pub fn getEnvironment(self: *AppLaunchContext) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*AppLaunchContext) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_app_launch_context_get_environment" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStartupNotifyId(self: *AppLaunchContext, arg_info: ?*AppInfo, arg_files: ?*GLib.List) ?[*:0]u8 {
        const cFn = @extern(*const fn (*AppLaunchContext, ?*AppInfo, ?*GLib.List) callconv(.c) ?[*:0]u8, .{ .name = "g_app_launch_context_get_startup_notify_id" });
        const ret = cFn(self, arg_info, arg_files);
        return ret;
    }
    pub fn launchFailed(self: *AppLaunchContext, arg_startup_notify_id: [*:0]const u8) void {
        const cFn = @extern(*const fn (*AppLaunchContext, [*:0]const u8) callconv(.c) void, .{ .name = "g_app_launch_context_launch_failed" });
        const ret = cFn(self, arg_startup_notify_id);
        return ret;
    }
    pub fn setenv(self: *AppLaunchContext, arg_variable: [*:0]const u8, arg_value: [*:0]const u8) void {
        const cFn = @extern(*const fn (*AppLaunchContext, [*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_app_launch_context_setenv" });
        const ret = cFn(self, arg_variable, arg_value);
        return ret;
    }
    pub fn unsetenv(self: *AppLaunchContext, arg_variable: [*:0]const u8) void {
        const cFn = @extern(*const fn (*AppLaunchContext, [*:0]const u8) callconv(.c) void, .{ .name = "g_app_launch_context_unsetenv" });
        const ret = cFn(self, arg_variable);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_app_launch_context_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const AppLaunchContextClass = extern struct {
    parent_class: GObject.ObjectClass,
    get_display: ?*const fn (arg_context: *AppLaunchContext, arg_info: *AppInfo, arg_files: *GLib.List) callconv(.c) ?[*:0]u8,
    get_startup_notify_id: ?*const fn (arg_context: *AppLaunchContext, arg_info: ?*AppInfo, arg_files: ?*GLib.List) callconv(.c) ?[*:0]u8,
    launch_failed: ?*const fn (arg_context: *AppLaunchContext, arg_startup_notify_id: [*:0]const u8) callconv(.c) void,
    launched: ?*const fn (arg_context: *AppLaunchContext, arg_info: *AppInfo, arg_platform_data: *GLib.Variant) callconv(.c) void,
    launch_started: ?*const fn (arg_context: *AppLaunchContext, arg_info: *AppInfo, arg_platform_data: *GLib.Variant) callconv(.c) void,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
};
pub const AppLaunchContextPrivate = opaque {};
pub const Application = extern struct {
    pub const Interfaces = [_]type{ ActionGroup, ActionMap };
    pub const Parent = GObject.Object;
    pub const Class = ApplicationClass;
    _props: struct {
        @"action-group": core.Property(ActionGroup, "action-group") = .{},
        @"application-id": core.Property([*:0]const u8, "application-id") = .{},
        flags: core.Property(ApplicationFlags, "flags") = .{},
        @"inactivity-timeout": core.Property(u32, "inactivity-timeout") = .{},
        @"is-busy": core.Property(bool, "is-busy") = .{},
        @"is-registered": core.Property(bool, "is-registered") = .{},
        @"is-remote": core.Property(bool, "is-remote") = .{},
        @"resource-base-path": core.Property([*:0]const u8, "resource-base-path") = .{},
        version: core.Property([*:0]const u8, "version") = .{},
    },
    _signals: struct {
        activate: core.Signal(fn (*Application) void, "activate") = .{},
        @"command-line": core.Signal(fn (*Application, *ApplicationCommandLine) i32, "command-line") = .{},
        @"handle-local-options": core.Signal(fn (*Application, *GLib.VariantDict) i32, "handle-local-options") = .{},
        @"name-lost": core.Signal(fn (*Application) bool, "name-lost") = .{},
        open: core.Signal(fn (*Application, [*]File, i32, [*:0]const u8) void, "open") = .{},
        shutdown: core.Signal(fn (*Application) void, "shutdown") = .{},
        startup: core.Signal(fn (*Application) void, "startup") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*ApplicationPrivate,
    pub fn new(arg_application_id: ?[*:0]const u8, arg_flags: ApplicationFlags) *Application {
        const cFn = @extern(*const fn (?[*:0]const u8, ApplicationFlags) callconv(.c) *Application, .{ .name = "g_application_new" });
        const ret = cFn(arg_application_id, arg_flags);
        return ret;
    }
    pub fn getDefault() ?*Application {
        const cFn = @extern(*const fn () callconv(.c) ?*Application, .{ .name = "g_application_get_default" });
        const ret = cFn();
        return ret;
    }
    pub fn idIsValid(arg_application_id: [*:0]const u8) bool {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_application_id_is_valid" });
        const ret = cFn(arg_application_id);
        return ret;
    }
    pub fn activate(self: *Application) void {
        const cFn = @extern(*const fn (*Application) callconv(.c) void, .{ .name = "g_application_activate" });
        const ret = cFn(self);
        return ret;
    }
    pub fn addMainOption(self: *Application, arg_long_name: [*:0]const u8, arg_short_name: i8, arg_flags: GLib.OptionFlags, arg_arg: GLib.OptionArg, arg_description: [*:0]const u8, arg_arg_description: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Application, [*:0]const u8, i8, GLib.OptionFlags, GLib.OptionArg, [*:0]const u8, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_application_add_main_option" });
        const ret = cFn(self, arg_long_name, arg_short_name, arg_flags, arg_arg, arg_description, arg_arg_description);
        return ret;
    }
    pub fn addMainOptionEntries(self: *Application, arg_entries: [*]GLib.OptionEntry) void {
        const cFn = @extern(*const fn (*Application, [*]GLib.OptionEntry) callconv(.c) void, .{ .name = "g_application_add_main_option_entries" });
        const ret = cFn(self, arg_entries);
        return ret;
    }
    pub fn addOptionGroup(self: *Application, arg_group: *GLib.OptionGroup) void {
        const cFn = @extern(*const fn (*Application, *GLib.OptionGroup) callconv(.c) void, .{ .name = "g_application_add_option_group" });
        const ret = cFn(self, arg_group);
        return ret;
    }
    pub fn bindBusyProperty(self: *Application, arg_object: *GObject.Object, arg_property: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Application, *GObject.Object, [*:0]const u8) callconv(.c) void, .{ .name = "g_application_bind_busy_property" });
        const ret = cFn(self, arg_object, arg_property);
        return ret;
    }
    pub fn getApplicationId(self: *Application) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Application) callconv(.c) ?[*:0]u8, .{ .name = "g_application_get_application_id" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDbusConnection(self: *Application) ?*DBusConnection {
        const cFn = @extern(*const fn (*Application) callconv(.c) ?*DBusConnection, .{ .name = "g_application_get_dbus_connection" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDbusObjectPath(self: *Application) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Application) callconv(.c) ?[*:0]u8, .{ .name = "g_application_get_dbus_object_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFlags(self: *Application) ApplicationFlags {
        const cFn = @extern(*const fn (*Application) callconv(.c) ApplicationFlags, .{ .name = "g_application_get_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInactivityTimeout(self: *Application) u32 {
        const cFn = @extern(*const fn (*Application) callconv(.c) u32, .{ .name = "g_application_get_inactivity_timeout" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsBusy(self: *Application) bool {
        const cFn = @extern(*const fn (*Application) callconv(.c) bool, .{ .name = "g_application_get_is_busy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsRegistered(self: *Application) bool {
        const cFn = @extern(*const fn (*Application) callconv(.c) bool, .{ .name = "g_application_get_is_registered" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsRemote(self: *Application) bool {
        const cFn = @extern(*const fn (*Application) callconv(.c) bool, .{ .name = "g_application_get_is_remote" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getResourceBasePath(self: *Application) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Application) callconv(.c) ?[*:0]u8, .{ .name = "g_application_get_resource_base_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getVersion(self: *Application) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Application) callconv(.c) ?[*:0]u8, .{ .name = "g_application_get_version" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hold(self: *Application) void {
        const cFn = @extern(*const fn (*Application) callconv(.c) void, .{ .name = "g_application_hold" });
        const ret = cFn(self);
        return ret;
    }
    pub fn markBusy(self: *Application) void {
        const cFn = @extern(*const fn (*Application) callconv(.c) void, .{ .name = "g_application_mark_busy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn open(self: *Application, argS_files: []*File, arg_hint: [*:0]const u8) void {
        const arg_files: [*]*File = @ptrCast(argS_files);
        const arg_n_files: i32 = @intCast((argS_files).len);
        const cFn = @extern(*const fn (*Application, [*]*File, i32, [*:0]const u8) callconv(.c) void, .{ .name = "g_application_open" });
        const ret = cFn(self, arg_files, arg_n_files, arg_hint);
        return ret;
    }
    pub fn quit(self: *Application) void {
        const cFn = @extern(*const fn (*Application) callconv(.c) void, .{ .name = "g_application_quit" });
        const ret = cFn(self);
        return ret;
    }
    pub fn register(self: *Application, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Application, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_application_register" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn release(self: *Application) void {
        const cFn = @extern(*const fn (*Application) callconv(.c) void, .{ .name = "g_application_release" });
        const ret = cFn(self);
        return ret;
    }
    pub fn run(self: *Application, argS_argv: [][*:0]const u8) i32 {
        const arg_argc: i32 = @intCast((argS_argv).len);
        const arg_argv: ?[*][*:0]const u8 = @ptrCast(argS_argv);
        const cFn = @extern(*const fn (*Application, i32, ?[*][*:0]const u8) callconv(.c) i32, .{ .name = "g_application_run" });
        const ret = cFn(self, arg_argc, arg_argv);
        return ret;
    }
    pub fn sendNotification(self: *Application, arg_id: ?[*:0]const u8, arg_notification: *Notification) void {
        const cFn = @extern(*const fn (*Application, ?[*:0]const u8, *Notification) callconv(.c) void, .{ .name = "g_application_send_notification" });
        const ret = cFn(self, arg_id, arg_notification);
        return ret;
    }
    pub fn setActionGroup(self: *Application, arg_action_group: ?*ActionGroup) void {
        const cFn = @extern(*const fn (*Application, ?*ActionGroup) callconv(.c) void, .{ .name = "g_application_set_action_group" });
        const ret = cFn(self, arg_action_group);
        return ret;
    }
    pub fn setApplicationId(self: *Application, arg_application_id: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Application, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_application_set_application_id" });
        const ret = cFn(self, arg_application_id);
        return ret;
    }
    pub fn setDefault(self: *Application) void {
        const cFn = @extern(*const fn (*Application) callconv(.c) void, .{ .name = "g_application_set_default" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setFlags(self: *Application, arg_flags: ApplicationFlags) void {
        const cFn = @extern(*const fn (*Application, ApplicationFlags) callconv(.c) void, .{ .name = "g_application_set_flags" });
        const ret = cFn(self, arg_flags);
        return ret;
    }
    pub fn setInactivityTimeout(self: *Application, arg_inactivity_timeout: u32) void {
        const cFn = @extern(*const fn (*Application, u32) callconv(.c) void, .{ .name = "g_application_set_inactivity_timeout" });
        const ret = cFn(self, arg_inactivity_timeout);
        return ret;
    }
    pub fn setOptionContextDescription(self: *Application, arg_description: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Application, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_application_set_option_context_description" });
        const ret = cFn(self, arg_description);
        return ret;
    }
    pub fn setOptionContextParameterString(self: *Application, arg_parameter_string: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Application, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_application_set_option_context_parameter_string" });
        const ret = cFn(self, arg_parameter_string);
        return ret;
    }
    pub fn setOptionContextSummary(self: *Application, arg_summary: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Application, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_application_set_option_context_summary" });
        const ret = cFn(self, arg_summary);
        return ret;
    }
    pub fn setResourceBasePath(self: *Application, arg_resource_path: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Application, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_application_set_resource_base_path" });
        const ret = cFn(self, arg_resource_path);
        return ret;
    }
    pub fn setVersion(self: *Application, arg_version: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Application, [*:0]const u8) callconv(.c) void, .{ .name = "g_application_set_version" });
        const ret = cFn(self, arg_version);
        return ret;
    }
    pub fn unbindBusyProperty(self: *Application, arg_object: *GObject.Object, arg_property: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Application, *GObject.Object, [*:0]const u8) callconv(.c) void, .{ .name = "g_application_unbind_busy_property" });
        const ret = cFn(self, arg_object, arg_property);
        return ret;
    }
    pub fn unmarkBusy(self: *Application) void {
        const cFn = @extern(*const fn (*Application) callconv(.c) void, .{ .name = "g_application_unmark_busy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn withdrawNotification(self: *Application, arg_id: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Application, [*:0]const u8) callconv(.c) void, .{ .name = "g_application_withdraw_notification" });
        const ret = cFn(self, arg_id);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_application_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ApplicationClass = extern struct {
    parent_class: GObject.ObjectClass,
    startup: ?*const fn (arg_application: *Application) callconv(.c) void,
    activate: ?*const fn (arg_application: *Application) callconv(.c) void,
    open: ?*const fn (arg_application: *Application, arg_files: [*]*File, arg_n_files: i32, arg_hint: [*:0]const u8) callconv(.c) void,
    command_line: ?*const fn (arg_application: *Application, arg_command_line: *ApplicationCommandLine) callconv(.c) i32,
    local_command_line: ?*const fn (arg_application: *Application, arg_arguments: *[*]?[*:0]const u8, arg_exit_status: *i32) callconv(.c) bool,
    before_emit: ?*const fn (arg_application: *Application, arg_platform_data: *GLib.Variant) callconv(.c) void,
    after_emit: ?*const fn (arg_application: *Application, arg_platform_data: *GLib.Variant) callconv(.c) void,
    add_platform_data: ?*const fn (arg_application: *Application, arg_builder: *GLib.VariantBuilder) callconv(.c) void,
    quit_mainloop: ?*const fn (arg_application: *Application) callconv(.c) void,
    run_mainloop: ?*const fn (arg_application: *Application) callconv(.c) void,
    shutdown: ?*const fn (arg_application: *Application) callconv(.c) void,
    dbus_register: ?*const fn (arg_application: *Application, arg_connection: *DBusConnection, arg_object_path: [*:0]const u8, arg_error: *?*GLib.Error) callconv(.c) bool,
    dbus_unregister: ?*const fn (arg_application: *Application, arg_connection: *DBusConnection, arg_object_path: [*:0]const u8) callconv(.c) void,
    handle_local_options: ?*const fn (arg_application: *Application, arg_options: *GLib.VariantDict) callconv(.c) i32,
    name_lost: ?*const fn (arg_application: *Application) callconv(.c) bool,
    padding: [7]?*anyopaque,
};
pub const ApplicationCommandLine = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = ApplicationCommandLineClass;
    _props: struct {
        arguments: core.Property(GLib.Variant, "arguments") = .{},
        @"is-remote": core.Property(bool, "is-remote") = .{},
        options: core.Property(GLib.Variant, "options") = .{},
        @"platform-data": core.Property(GLib.Variant, "platform-data") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*ApplicationCommandLinePrivate,
    pub fn createFileForArg(self: *ApplicationCommandLine, arg_arg: [*:0]const u8) *File {
        const cFn = @extern(*const fn (*ApplicationCommandLine, [*:0]const u8) callconv(.c) *File, .{ .name = "g_application_command_line_create_file_for_arg" });
        const ret = cFn(self, arg_arg);
        return ret;
    }
    pub fn done(self: *ApplicationCommandLine) void {
        const cFn = @extern(*const fn (*ApplicationCommandLine) callconv(.c) void, .{ .name = "g_application_command_line_done" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getArguments(self: *ApplicationCommandLine) [][*:0]const u8 {
        var argO_argc: i32 = undefined;
        const arg_argc: ?*i32 = &argO_argc;
        const cFn = @extern(*const fn (*ApplicationCommandLine, ?*i32) callconv(.c) [*][*:0]const u8, .{ .name = "g_application_command_line_get_arguments" });
        const ret = cFn(self, arg_argc);
        return ret[0..@intCast(argO_argc)];
    }
    pub fn getCwd(self: *ApplicationCommandLine) ?[*:0]u8 {
        const cFn = @extern(*const fn (*ApplicationCommandLine) callconv(.c) ?[*:0]u8, .{ .name = "g_application_command_line_get_cwd" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getEnviron(self: *ApplicationCommandLine) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*ApplicationCommandLine) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_application_command_line_get_environ" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getExitStatus(self: *ApplicationCommandLine) i32 {
        const cFn = @extern(*const fn (*ApplicationCommandLine) callconv(.c) i32, .{ .name = "g_application_command_line_get_exit_status" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsRemote(self: *ApplicationCommandLine) bool {
        const cFn = @extern(*const fn (*ApplicationCommandLine) callconv(.c) bool, .{ .name = "g_application_command_line_get_is_remote" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOptionsDict(self: *ApplicationCommandLine) *GLib.VariantDict {
        const cFn = @extern(*const fn (*ApplicationCommandLine) callconv(.c) *GLib.VariantDict, .{ .name = "g_application_command_line_get_options_dict" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPlatformData(self: *ApplicationCommandLine) ?*GLib.Variant {
        const cFn = @extern(*const fn (*ApplicationCommandLine) callconv(.c) ?*GLib.Variant, .{ .name = "g_application_command_line_get_platform_data" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStdin(self: *ApplicationCommandLine) ?*InputStream {
        const cFn = @extern(*const fn (*ApplicationCommandLine) callconv(.c) ?*InputStream, .{ .name = "g_application_command_line_get_stdin" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getenv(self: *ApplicationCommandLine, arg_name: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (*ApplicationCommandLine, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_application_command_line_getenv" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn printLiteral(self: *ApplicationCommandLine, arg_message: [*:0]const u8) void {
        const cFn = @extern(*const fn (*ApplicationCommandLine, [*:0]const u8) callconv(.c) void, .{ .name = "g_application_command_line_print_literal" });
        const ret = cFn(self, arg_message);
        return ret;
    }
    pub fn printerrLiteral(self: *ApplicationCommandLine, arg_message: [*:0]const u8) void {
        const cFn = @extern(*const fn (*ApplicationCommandLine, [*:0]const u8) callconv(.c) void, .{ .name = "g_application_command_line_printerr_literal" });
        const ret = cFn(self, arg_message);
        return ret;
    }
    pub fn setExitStatus(self: *ApplicationCommandLine, arg_exit_status: i32) void {
        const cFn = @extern(*const fn (*ApplicationCommandLine, i32) callconv(.c) void, .{ .name = "g_application_command_line_set_exit_status" });
        const ret = cFn(self, arg_exit_status);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_application_command_line_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ApplicationCommandLineClass = extern struct {
    parent_class: GObject.ObjectClass,
    print_literal: ?*const fn (arg_cmdline: *ApplicationCommandLine, arg_message: [*:0]const u8) callconv(.c) void,
    printerr_literal: ?*const fn (arg_cmdline: *ApplicationCommandLine, arg_message: [*:0]const u8) callconv(.c) void,
    get_stdin: ?*const fn (arg_cmdline: *ApplicationCommandLine) callconv(.c) ?*InputStream,
    done: ?*const fn (arg_cmdline: *ApplicationCommandLine) callconv(.c) void,
    padding: [10]?*anyopaque,
};
pub const ApplicationCommandLinePrivate = opaque {};
pub const ApplicationFlags = packed struct(u32) {
    is_service: bool = false,
    is_launcher: bool = false,
    handles_open: bool = false,
    handles_command_line: bool = false,
    send_environment: bool = false,
    non_unique: bool = false,
    can_override_app_id: bool = false,
    allow_replacement: bool = false,
    replace: bool = false,
    _: u23 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_application_flags_get_type" });
        return cFn();
    }
};
pub const ApplicationPrivate = opaque {};
pub const AskPasswordFlags = packed struct(u32) {
    need_password: bool = false,
    need_username: bool = false,
    need_domain: bool = false,
    saving_supported: bool = false,
    anonymous_supported: bool = false,
    tcrypt: bool = false,
    _: u26 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_ask_password_flags_get_type" });
        return cFn();
    }
};
pub const AsyncInitable = struct {
    pub const Class = AsyncInitableIface;
    pub fn newvAsync(arg_object_type: core.Type, arg_n_parameters: u32, arg_parameters: *GObject.Parameter, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (core.Type, u32, *GObject.Parameter, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_async_initable_newv_async" });
        const ret = cFn(arg_object_type, arg_n_parameters, arg_parameters, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn initAsync(self: *AsyncInitable, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*AsyncInitable, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_async_initable_init_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn initFinish(self: *AsyncInitable, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*AsyncInitable, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_async_initable_init_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFinish(self: *AsyncInitable, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*GObject.Object {
        const cFn = @extern(*const fn (*AsyncInitable, *AsyncResult, *?*GLib.Error) callconv(.c) *GObject.Object, .{ .name = "g_async_initable_new_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_async_initable_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const AsyncInitableIface = extern struct {
    g_iface: GObject.TypeInterface,
    init_async: ?*const fn (arg_initable: *AsyncInitable, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    init_finish: ?*const fn (arg_initable: *AsyncInitable, arg_res: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
};
pub const AsyncReadyCallback = *const fn (arg_source_object: ?*GObject.Object, arg_res: *AsyncResult, arg_data: ?*anyopaque) callconv(.c) void;
pub const AsyncResult = struct {
    pub const Class = AsyncResultIface;
    pub fn getSourceObject(self: *AsyncResult) ?*GObject.Object {
        const cFn = @extern(*const fn (*AsyncResult) callconv(.c) ?*GObject.Object, .{ .name = "g_async_result_get_source_object" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUserData(self: *AsyncResult) ?*anyopaque {
        const cFn = @extern(*const fn (*AsyncResult) callconv(.c) ?*anyopaque, .{ .name = "g_async_result_get_user_data" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isTagged(self: *AsyncResult, arg_source_tag: ?*anyopaque) bool {
        const cFn = @extern(*const fn (*AsyncResult, ?*anyopaque) callconv(.c) bool, .{ .name = "g_async_result_is_tagged" });
        const ret = cFn(self, @ptrCast(arg_source_tag));
        return ret;
    }
    pub fn legacyPropagateError(self: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_async_result_legacy_propagate_error" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_async_result_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const AsyncResultIface = extern struct {
    g_iface: GObject.TypeInterface,
    get_user_data: ?*const fn (arg_res: *AsyncResult) callconv(.c) ?*anyopaque,
    get_source_object: ?*const fn (arg_res: *AsyncResult) callconv(.c) ?*GObject.Object,
    is_tagged: ?*const fn (arg_res: *AsyncResult, arg_source_tag: ?*anyopaque) callconv(.c) bool,
};
pub const BufferedInputStream = extern struct {
    pub const Interfaces = [_]type{Seekable};
    pub const Parent = FilterInputStream;
    pub const Class = BufferedInputStreamClass;
    _props: struct {
        @"buffer-size": core.Property(u32, "buffer-size") = .{},
    },
    parent_instance: FilterInputStream,
    priv: ?*BufferedInputStreamPrivate,
    pub fn new(arg_base_stream: *InputStream) *BufferedInputStream {
        const cFn = @extern(*const fn (*InputStream) callconv(.c) *BufferedInputStream, .{ .name = "g_buffered_input_stream_new" });
        const ret = cFn(arg_base_stream);
        return ret;
    }
    pub fn newSized(arg_base_stream: *InputStream, arg_size: u64) *BufferedInputStream {
        const cFn = @extern(*const fn (*InputStream, u64) callconv(.c) *BufferedInputStream, .{ .name = "g_buffered_input_stream_new_sized" });
        const ret = cFn(arg_base_stream, arg_size);
        return ret;
    }
    pub fn fill(self: *BufferedInputStream, arg_count: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*BufferedInputStream, i64, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_buffered_input_stream_fill" });
        const ret = cFn(self, arg_count, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn fillAsync(self: *BufferedInputStream, arg_count: i64, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*BufferedInputStream, i64, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_buffered_input_stream_fill_async" });
        const ret = cFn(self, arg_count, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn fillFinish(self: *BufferedInputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*BufferedInputStream, *AsyncResult, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_buffered_input_stream_fill_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getAvailable(self: *BufferedInputStream) u64 {
        const cFn = @extern(*const fn (*BufferedInputStream) callconv(.c) u64, .{ .name = "g_buffered_input_stream_get_available" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBufferSize(self: *BufferedInputStream) u64 {
        const cFn = @extern(*const fn (*BufferedInputStream) callconv(.c) u64, .{ .name = "g_buffered_input_stream_get_buffer_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn peek(self: *BufferedInputStream, argS_buffer: []u8, arg_offset: u64) u64 {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_count: u64 = @intCast((argS_buffer).len);
        const cFn = @extern(*const fn (*BufferedInputStream, [*]u8, u64, u64) callconv(.c) u64, .{ .name = "g_buffered_input_stream_peek" });
        const ret = cFn(self, arg_buffer, arg_offset, arg_count);
        return ret;
    }
    pub fn peekBuffer(self: *BufferedInputStream) []u8 {
        var argO_count: u64 = undefined;
        const arg_count: *u64 = &argO_count;
        const cFn = @extern(*const fn (*BufferedInputStream, *u64) callconv(.c) [*]u8, .{ .name = "g_buffered_input_stream_peek_buffer" });
        const ret = cFn(self, arg_count);
        return ret[0..@intCast(argO_count)];
    }
    pub fn readByte(self: *BufferedInputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i32 {
        const cFn = @extern(*const fn (*BufferedInputStream, ?*Cancellable, *?*GLib.Error) callconv(.c) i32, .{ .name = "g_buffered_input_stream_read_byte" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setBufferSize(self: *BufferedInputStream, arg_size: u64) void {
        const cFn = @extern(*const fn (*BufferedInputStream, u64) callconv(.c) void, .{ .name = "g_buffered_input_stream_set_buffer_size" });
        const ret = cFn(self, arg_size);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_buffered_input_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const BufferedInputStreamClass = extern struct {
    parent_class: FilterInputStreamClass,
    fill: ?*const fn (arg_stream: *BufferedInputStream, arg_count: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) i64,
    fill_async: ?*const fn (arg_stream: *BufferedInputStream, arg_count: i64, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    fill_finish: ?*const fn (arg_stream: *BufferedInputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) i64,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const BufferedInputStreamPrivate = opaque {};
pub const BufferedOutputStream = extern struct {
    pub const Interfaces = [_]type{Seekable};
    pub const Parent = FilterOutputStream;
    pub const Class = BufferedOutputStreamClass;
    _props: struct {
        @"auto-grow": core.Property(bool, "auto-grow") = .{},
        @"buffer-size": core.Property(u32, "buffer-size") = .{},
    },
    parent_instance: FilterOutputStream,
    priv: ?*BufferedOutputStreamPrivate,
    pub fn new(arg_base_stream: *OutputStream) *BufferedOutputStream {
        const cFn = @extern(*const fn (*OutputStream) callconv(.c) *BufferedOutputStream, .{ .name = "g_buffered_output_stream_new" });
        const ret = cFn(arg_base_stream);
        return ret;
    }
    pub fn newSized(arg_base_stream: *OutputStream, arg_size: u64) *BufferedOutputStream {
        const cFn = @extern(*const fn (*OutputStream, u64) callconv(.c) *BufferedOutputStream, .{ .name = "g_buffered_output_stream_new_sized" });
        const ret = cFn(arg_base_stream, arg_size);
        return ret;
    }
    pub fn getAutoGrow(self: *BufferedOutputStream) bool {
        const cFn = @extern(*const fn (*BufferedOutputStream) callconv(.c) bool, .{ .name = "g_buffered_output_stream_get_auto_grow" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBufferSize(self: *BufferedOutputStream) u64 {
        const cFn = @extern(*const fn (*BufferedOutputStream) callconv(.c) u64, .{ .name = "g_buffered_output_stream_get_buffer_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setAutoGrow(self: *BufferedOutputStream, arg_auto_grow: bool) void {
        const cFn = @extern(*const fn (*BufferedOutputStream, bool) callconv(.c) void, .{ .name = "g_buffered_output_stream_set_auto_grow" });
        const ret = cFn(self, arg_auto_grow);
        return ret;
    }
    pub fn setBufferSize(self: *BufferedOutputStream, arg_size: u64) void {
        const cFn = @extern(*const fn (*BufferedOutputStream, u64) callconv(.c) void, .{ .name = "g_buffered_output_stream_set_buffer_size" });
        const ret = cFn(self, arg_size);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_buffered_output_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const BufferedOutputStreamClass = extern struct {
    parent_class: FilterOutputStreamClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
};
pub const BufferedOutputStreamPrivate = opaque {};
pub const BusAcquiredCallback = *const fn (arg_connection: *DBusConnection, arg_name: [*:0]const u8, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const BusNameAcquiredCallback = *const fn (arg_connection: *DBusConnection, arg_name: [*:0]const u8, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const BusNameAppearedCallback = *const fn (arg_connection: *DBusConnection, arg_name: [*:0]const u8, arg_name_owner: [*:0]const u8, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const BusNameLostCallback = *const fn (arg_connection: *DBusConnection, arg_name: [*:0]const u8, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const BusNameOwnerFlags = packed struct(u32) {
    allow_replacement: bool = false,
    replace: bool = false,
    do_not_queue: bool = false,
    _: u29 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_bus_name_owner_flags_get_type" });
        return cFn();
    }
};
pub const BusNameVanishedCallback = *const fn (arg_connection: *DBusConnection, arg_name: [*:0]const u8, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const BusNameWatcherFlags = packed struct(u32) {
    auto_start: bool = false,
    _: u31 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_bus_name_watcher_flags_get_type" });
        return cFn();
    }
};
pub const BusType = enum(i32) {
    starter = -1,
    none = 0,
    system = 1,
    session = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_bus_type_get_type" });
        return cFn();
    }
};
pub const BytesIcon = struct {
    pub const Interfaces = [_]type{ Icon, LoadableIcon };
    pub const Parent = GObject.Object;
    _props: struct {
        bytes: core.Property(GLib.Bytes, "bytes") = .{},
    },
    pub fn new(arg_bytes: *GLib.Bytes) *BytesIcon {
        const cFn = @extern(*const fn (*GLib.Bytes) callconv(.c) *BytesIcon, .{ .name = "g_bytes_icon_new" });
        const ret = cFn(arg_bytes);
        return ret;
    }
    pub fn getBytes(self: *BytesIcon) *GLib.Bytes {
        const cFn = @extern(*const fn (*BytesIcon) callconv(.c) *GLib.Bytes, .{ .name = "g_bytes_icon_get_bytes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_bytes_icon_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const Cancellable = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = CancellableClass;
    _signals: struct {
        cancelled: core.Signal(fn (*Cancellable) void, "cancelled") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*CancellablePrivate,
    pub fn new() *Cancellable {
        const cFn = @extern(*const fn () callconv(.c) *Cancellable, .{ .name = "g_cancellable_new" });
        const ret = cFn();
        return ret;
    }
    pub fn getCurrent() ?*Cancellable {
        const cFn = @extern(*const fn () callconv(.c) ?*Cancellable, .{ .name = "g_cancellable_get_current" });
        const ret = cFn();
        return ret;
    }
    pub fn cancel(self: *Cancellable) void {
        const cFn = @extern(*const fn (*Cancellable) callconv(.c) void, .{ .name = "g_cancellable_cancel" });
        const ret = cFn(self);
        return ret;
    }
    pub fn connect(self: *Cancellable, argC_callback: core.Closure(GObject.Callback)) u64 {
        const arg_callback: GObject.Callback = @ptrCast(argC_callback.callback());
        const arg_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const arg_data_destroy_func: ?GLib.DestroyNotify = @ptrCast(argC_callback.destroy());
        const cFn = @extern(*const fn (*Cancellable, GObject.Callback, ?*anyopaque, ?GLib.DestroyNotify) callconv(.c) u64, .{ .name = "g_cancellable_connect" });
        const ret = cFn(self, arg_callback, @ptrCast(arg_data), arg_data_destroy_func);
        return ret;
    }
    pub fn disconnect(self: *Cancellable, arg_handler_id: u64) void {
        const cFn = @extern(*const fn (*Cancellable, u64) callconv(.c) void, .{ .name = "g_cancellable_disconnect" });
        const ret = cFn(self, arg_handler_id);
        return ret;
    }
    pub fn getFd(self: *Cancellable) i32 {
        const cFn = @extern(*const fn (*Cancellable) callconv(.c) i32, .{ .name = "g_cancellable_get_fd" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isCancelled(self: *Cancellable) bool {
        const cFn = @extern(*const fn (*Cancellable) callconv(.c) bool, .{ .name = "g_cancellable_is_cancelled" });
        const ret = cFn(self);
        return ret;
    }
    pub fn makePollfd(self: *Cancellable, arg_pollfd: *GLib.PollFD) bool {
        const cFn = @extern(*const fn (*Cancellable, *GLib.PollFD) callconv(.c) bool, .{ .name = "g_cancellable_make_pollfd" });
        const ret = cFn(self, arg_pollfd);
        return ret;
    }
    pub fn popCurrent(self: *Cancellable) void {
        const cFn = @extern(*const fn (*Cancellable) callconv(.c) void, .{ .name = "g_cancellable_pop_current" });
        const ret = cFn(self);
        return ret;
    }
    pub fn pushCurrent(self: *Cancellable) void {
        const cFn = @extern(*const fn (*Cancellable) callconv(.c) void, .{ .name = "g_cancellable_push_current" });
        const ret = cFn(self);
        return ret;
    }
    pub fn releaseFd(self: *Cancellable) void {
        const cFn = @extern(*const fn (*Cancellable) callconv(.c) void, .{ .name = "g_cancellable_release_fd" });
        const ret = cFn(self);
        return ret;
    }
    pub fn reset(self: *Cancellable) void {
        const cFn = @extern(*const fn (*Cancellable) callconv(.c) void, .{ .name = "g_cancellable_reset" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setErrorIfCancelled(self: *Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_cancellable_set_error_if_cancelled" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn sourceNew(self: *Cancellable) *GLib.Source {
        const cFn = @extern(*const fn (*Cancellable) callconv(.c) *GLib.Source, .{ .name = "g_cancellable_source_new" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_cancellable_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const CancellableClass = extern struct {
    parent_class: GObject.ObjectClass,
    cancelled: ?*const fn (arg_cancellable: ?*Cancellable) callconv(.c) void,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const CancellablePrivate = opaque {};
pub const CancellableSourceFunc = *const fn (arg_cancellable: ?*Cancellable, arg_data: ?*anyopaque) callconv(.c) bool;
pub const CharsetConverter = struct {
    pub const Interfaces = [_]type{ Converter, Initable };
    pub const Parent = GObject.Object;
    pub const Class = CharsetConverterClass;
    _props: struct {
        @"from-charset": core.Property([*:0]const u8, "from-charset") = .{},
        @"to-charset": core.Property([*:0]const u8, "to-charset") = .{},
        @"use-fallback": core.Property(bool, "use-fallback") = .{},
    },
    pub fn new(arg_to_charset: [*:0]const u8, arg_from_charset: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*CharsetConverter {
        const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) *CharsetConverter, .{ .name = "g_charset_converter_new" });
        const ret = cFn(arg_to_charset, arg_from_charset, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getNumFallbacks(self: *CharsetConverter) u32 {
        const cFn = @extern(*const fn (*CharsetConverter) callconv(.c) u32, .{ .name = "g_charset_converter_get_num_fallbacks" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUseFallback(self: *CharsetConverter) bool {
        const cFn = @extern(*const fn (*CharsetConverter) callconv(.c) bool, .{ .name = "g_charset_converter_get_use_fallback" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setUseFallback(self: *CharsetConverter, arg_use_fallback: bool) void {
        const cFn = @extern(*const fn (*CharsetConverter, bool) callconv(.c) void, .{ .name = "g_charset_converter_set_use_fallback" });
        const ret = cFn(self, arg_use_fallback);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_charset_converter_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const CharsetConverterClass = extern struct {
    parent_class: GObject.ObjectClass,
};
pub const Converter = struct {
    pub const Class = ConverterIface;
    pub fn convert(self: *Converter, argS_inbuf: []u8, argS_outbuf: []u8, arg_flags: ConverterFlags, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: ConverterResult,
        bytes_read: u64,
        bytes_written: u64,
    } {
        const arg_inbuf: [*]u8 = @ptrCast(argS_inbuf);
        const arg_inbuf_size: u64 = @intCast((argS_inbuf).len);
        const arg_outbuf: [*]u8 = @ptrCast(argS_outbuf);
        const arg_outbuf_size: u64 = @intCast((argS_outbuf).len);
        var argO_bytes_read: u64 = undefined;
        const arg_bytes_read: *u64 = &argO_bytes_read;
        var argO_bytes_written: u64 = undefined;
        const arg_bytes_written: *u64 = &argO_bytes_written;
        const cFn = @extern(*const fn (*Converter, [*]u8, u64, [*]u8, u64, ConverterFlags, *u64, *u64, *?*GLib.Error) callconv(.c) ConverterResult, .{ .name = "g_converter_convert" });
        const ret = cFn(self, arg_inbuf, arg_inbuf_size, arg_outbuf, arg_outbuf_size, arg_flags, arg_bytes_read, arg_bytes_written, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .bytes_read = argO_bytes_read, .bytes_written = argO_bytes_written };
    }
    pub fn convertBytes(self: *Converter, arg_bytes: *GLib.Bytes, arg_error: *?*GLib.Error) error{GError}!*GLib.Bytes {
        const cFn = @extern(*const fn (*Converter, *GLib.Bytes, *?*GLib.Error) callconv(.c) *GLib.Bytes, .{ .name = "g_converter_convert_bytes" });
        const ret = cFn(self, arg_bytes, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn reset(self: *Converter) void {
        const cFn = @extern(*const fn (*Converter) callconv(.c) void, .{ .name = "g_converter_reset" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_converter_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ConverterFlags = packed struct(u32) {
    input_at_end: bool = false,
    flush: bool = false,
    _: u30 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_converter_flags_get_type" });
        return cFn();
    }
};
pub const ConverterIface = extern struct {
    g_iface: GObject.TypeInterface,
    convert: ?*const fn (arg_converter: *Converter, arg_inbuf: ?[*]u8, arg_inbuf_size: u64, arg_outbuf: [*]u8, arg_outbuf_size: u64, arg_flags: ConverterFlags, arg_bytes_read: *u64, arg_bytes_written: *u64, arg_error: *?*GLib.Error) callconv(.c) ConverterResult,
    reset: ?*const fn (arg_converter: *Converter) callconv(.c) void,
};
pub const ConverterInputStream = extern struct {
    pub const Interfaces = [_]type{PollableInputStream};
    pub const Parent = FilterInputStream;
    pub const Class = ConverterInputStreamClass;
    _props: struct {
        converter: core.Property(Converter, "converter") = .{},
    },
    parent_instance: FilterInputStream,
    priv: ?*ConverterInputStreamPrivate,
    pub fn new(arg_base_stream: *InputStream, arg_converter: *Converter) *ConverterInputStream {
        const cFn = @extern(*const fn (*InputStream, *Converter) callconv(.c) *ConverterInputStream, .{ .name = "g_converter_input_stream_new" });
        const ret = cFn(arg_base_stream, arg_converter);
        return ret;
    }
    pub fn getConverter(self: *ConverterInputStream) *Converter {
        const cFn = @extern(*const fn (*ConverterInputStream) callconv(.c) *Converter, .{ .name = "g_converter_input_stream_get_converter" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_converter_input_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ConverterInputStreamClass = extern struct {
    parent_class: FilterInputStreamClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const ConverterInputStreamPrivate = opaque {};
pub const ConverterOutputStream = extern struct {
    pub const Interfaces = [_]type{PollableOutputStream};
    pub const Parent = FilterOutputStream;
    pub const Class = ConverterOutputStreamClass;
    _props: struct {
        converter: core.Property(Converter, "converter") = .{},
    },
    parent_instance: FilterOutputStream,
    priv: ?*ConverterOutputStreamPrivate,
    pub fn new(arg_base_stream: *OutputStream, arg_converter: *Converter) *ConverterOutputStream {
        const cFn = @extern(*const fn (*OutputStream, *Converter) callconv(.c) *ConverterOutputStream, .{ .name = "g_converter_output_stream_new" });
        const ret = cFn(arg_base_stream, arg_converter);
        return ret;
    }
    pub fn getConverter(self: *ConverterOutputStream) *Converter {
        const cFn = @extern(*const fn (*ConverterOutputStream) callconv(.c) *Converter, .{ .name = "g_converter_output_stream_get_converter" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_converter_output_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ConverterOutputStreamClass = extern struct {
    parent_class: FilterOutputStreamClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const ConverterOutputStreamPrivate = opaque {};
pub const ConverterResult = enum(u32) {
    @"error" = 0,
    converted = 1,
    finished = 2,
    flushed = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_converter_result_get_type" });
        return cFn();
    }
};
pub const Credentials = struct {
    pub const Parent = GObject.Object;
    pub const Class = CredentialsClass;
    pub fn new() *Credentials {
        const cFn = @extern(*const fn () callconv(.c) *Credentials, .{ .name = "g_credentials_new" });
        const ret = cFn();
        return ret;
    }
    pub fn getUnixPid(self: *Credentials, arg_error: *?*GLib.Error) error{GError}!i32 {
        const cFn = @extern(*const fn (*Credentials, *?*GLib.Error) callconv(.c) i32, .{ .name = "g_credentials_get_unix_pid" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getUnixUser(self: *Credentials, arg_error: *?*GLib.Error) error{GError}!u32 {
        const cFn = @extern(*const fn (*Credentials, *?*GLib.Error) callconv(.c) u32, .{ .name = "g_credentials_get_unix_user" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn isSameUser(self: *Credentials, arg_other_credentials: *Credentials, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Credentials, *Credentials, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_credentials_is_same_user" });
        const ret = cFn(self, arg_other_credentials, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setNative(self: *Credentials, arg_native_type: CredentialsType, arg_native: *anyopaque) void {
        const cFn = @extern(*const fn (*Credentials, CredentialsType, *anyopaque) callconv(.c) void, .{ .name = "g_credentials_set_native" });
        const ret = cFn(self, arg_native_type, @ptrCast(arg_native));
        return ret;
    }
    pub fn setUnixUser(self: *Credentials, arg_uid: u32, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Credentials, u32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_credentials_set_unix_user" });
        const ret = cFn(self, arg_uid, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn toString(self: *Credentials) [*:0]u8 {
        const cFn = @extern(*const fn (*Credentials) callconv(.c) [*:0]u8, .{ .name = "g_credentials_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_credentials_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const CredentialsClass = opaque {};
pub const CredentialsType = enum(u32) {
    invalid = 0,
    linux_ucred = 1,
    freebsd_cmsgcred = 2,
    openbsd_sockpeercred = 3,
    solaris_ucred = 4,
    netbsd_unpcbid = 5,
    apple_xucred = 6,
    win32_pid = 7,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_credentials_type_get_type" });
        return cFn();
    }
};
pub const DBUS_METHOD_INVOCATION_HANDLED = true;
pub const DBUS_METHOD_INVOCATION_UNHANDLED = false;
pub const DBusActionGroup = struct {
    pub const Interfaces = [_]type{ ActionGroup, RemoteActionGroup };
    pub const Parent = GObject.Object;
    pub fn get(arg_connection: *DBusConnection, arg_bus_name: ?[*:0]const u8, arg_object_path: [*:0]const u8) *DBusActionGroup {
        const cFn = @extern(*const fn (*DBusConnection, ?[*:0]const u8, [*:0]const u8) callconv(.c) *DBusActionGroup, .{ .name = "g_dbus_action_group_get" });
        const ret = cFn(arg_connection, arg_bus_name, arg_object_path);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_action_group_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusAnnotationInfo = extern struct {
    ref_count: i32,
    key: ?[*:0]const u8,
    value: ?[*:0]const u8,
    annotations: ?[*:null]?*DBusAnnotationInfo,
    pub fn ref(self: *DBusAnnotationInfo) *DBusAnnotationInfo {
        const cFn = @extern(*const fn (*DBusAnnotationInfo) callconv(.c) *DBusAnnotationInfo, .{ .name = "g_dbus_annotation_info_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *DBusAnnotationInfo) void {
        const cFn = @extern(*const fn (*DBusAnnotationInfo) callconv(.c) void, .{ .name = "g_dbus_annotation_info_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn lookup(arg_annotations: ?[*:null]?*DBusAnnotationInfo, arg_name: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (?[*:null]?*DBusAnnotationInfo, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_annotation_info_lookup" });
        const ret = cFn(arg_annotations, arg_name);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_annotation_info_get_type" });
        return cFn();
    }
};
pub const DBusArgInfo = extern struct {
    ref_count: i32,
    name: ?[*:0]const u8,
    signature: ?[*:0]const u8,
    annotations: ?[*:null]?*DBusAnnotationInfo,
    pub fn ref(self: *DBusArgInfo) *DBusArgInfo {
        const cFn = @extern(*const fn (*DBusArgInfo) callconv(.c) *DBusArgInfo, .{ .name = "g_dbus_arg_info_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *DBusArgInfo) void {
        const cFn = @extern(*const fn (*DBusArgInfo) callconv(.c) void, .{ .name = "g_dbus_arg_info_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_arg_info_get_type" });
        return cFn();
    }
};
pub const DBusAuthObserver = struct {
    pub const Parent = GObject.Object;
    _signals: struct {
        @"allow-mechanism": core.Signal(fn (*DBusAuthObserver, [*:0]const u8) bool, "allow-mechanism") = .{},
        @"authorize-authenticated-peer": core.Signal(fn (*DBusAuthObserver, *IOStream, ?*Credentials) bool, "authorize-authenticated-peer") = .{},
    },
    pub fn new() *DBusAuthObserver {
        const cFn = @extern(*const fn () callconv(.c) *DBusAuthObserver, .{ .name = "g_dbus_auth_observer_new" });
        const ret = cFn();
        return ret;
    }
    pub fn allowMechanism(self: *DBusAuthObserver, arg_mechanism: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*DBusAuthObserver, [*:0]const u8) callconv(.c) bool, .{ .name = "g_dbus_auth_observer_allow_mechanism" });
        const ret = cFn(self, arg_mechanism);
        return ret;
    }
    pub fn authorizeAuthenticatedPeer(self: *DBusAuthObserver, arg_stream: *IOStream, arg_credentials: ?*Credentials) bool {
        const cFn = @extern(*const fn (*DBusAuthObserver, *IOStream, ?*Credentials) callconv(.c) bool, .{ .name = "g_dbus_auth_observer_authorize_authenticated_peer" });
        const ret = cFn(self, arg_stream, arg_credentials);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_auth_observer_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusCallFlags = packed struct(u32) {
    no_auto_start: bool = false,
    allow_interactive_authorization: bool = false,
    _: u30 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_call_flags_get_type" });
        return cFn();
    }
};
pub const DBusCapabilityFlags = packed struct(u32) {
    unix_fd_passing: bool = false,
    _: u31 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_capability_flags_get_type" });
        return cFn();
    }
};
pub const DBusConnection = struct {
    pub const Interfaces = [_]type{ AsyncInitable, Initable };
    pub const Parent = GObject.Object;
    _props: struct {
        address: core.Property([*:0]const u8, "address") = .{},
        @"authentication-observer": core.Property(DBusAuthObserver, "authentication-observer") = .{},
        capabilities: core.Property(DBusCapabilityFlags, "capabilities") = .{},
        closed: core.Property(bool, "closed") = .{},
        @"exit-on-close": core.Property(bool, "exit-on-close") = .{},
        flags: core.Property(DBusConnectionFlags, "flags") = .{},
        guid: core.Property([*:0]const u8, "guid") = .{},
        stream: core.Property(IOStream, "stream") = .{},
        @"unique-name": core.Property([*:0]const u8, "unique-name") = .{},
    },
    _signals: struct {
        closed: core.Signal(fn (*DBusConnection, bool, ?*GLib.Error) void, "closed") = .{},
    },
    pub fn newFinish(arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*DBusConnection {
        const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) *DBusConnection, .{ .name = "g_dbus_connection_new_finish" });
        const ret = cFn(arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newForAddressFinish(arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*DBusConnection {
        const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) *DBusConnection, .{ .name = "g_dbus_connection_new_for_address_finish" });
        const ret = cFn(arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newForAddressSync(arg_address: [*:0]const u8, arg_flags: DBusConnectionFlags, arg_observer: ?*DBusAuthObserver, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*DBusConnection {
        const cFn = @extern(*const fn ([*:0]const u8, DBusConnectionFlags, ?*DBusAuthObserver, ?*Cancellable, *?*GLib.Error) callconv(.c) *DBusConnection, .{ .name = "g_dbus_connection_new_for_address_sync" });
        const ret = cFn(arg_address, arg_flags, arg_observer, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newSync(arg_stream: *IOStream, arg_guid: ?[*:0]const u8, arg_flags: DBusConnectionFlags, arg_observer: ?*DBusAuthObserver, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*DBusConnection {
        const cFn = @extern(*const fn (*IOStream, ?[*:0]const u8, DBusConnectionFlags, ?*DBusAuthObserver, ?*Cancellable, *?*GLib.Error) callconv(.c) *DBusConnection, .{ .name = "g_dbus_connection_new_sync" });
        const ret = cFn(arg_stream, arg_guid, arg_flags, arg_observer, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn new(arg_stream: *IOStream, arg_guid: ?[*:0]const u8, arg_flags: DBusConnectionFlags, arg_observer: ?*DBusAuthObserver, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*IOStream, ?[*:0]const u8, DBusConnectionFlags, ?*DBusAuthObserver, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dbus_connection_new" });
        const ret = cFn(arg_stream, arg_guid, arg_flags, arg_observer, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn newForAddress(arg_address: [*:0]const u8, arg_flags: DBusConnectionFlags, arg_observer: ?*DBusAuthObserver, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn ([*:0]const u8, DBusConnectionFlags, ?*DBusAuthObserver, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dbus_connection_new_for_address" });
        const ret = cFn(arg_address, arg_flags, arg_observer, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn addFilter(self: *DBusConnection, argC_filter_function: core.Closure(DBusMessageFilterFunction)) u32 {
        const arg_filter_function: DBusMessageFilterFunction = @ptrCast(argC_filter_function.callback());
        const arg_user_data: ?*anyopaque = @ptrCast(argC_filter_function.data());
        const arg_user_data_free_func: GLib.DestroyNotify = @ptrCast(argC_filter_function.destroy());
        const cFn = @extern(*const fn (*DBusConnection, DBusMessageFilterFunction, ?*anyopaque, GLib.DestroyNotify) callconv(.c) u32, .{ .name = "g_dbus_connection_add_filter" });
        const ret = cFn(self, arg_filter_function, @ptrCast(arg_user_data), arg_user_data_free_func);
        return ret;
    }
    pub fn call(self: *DBusConnection, arg_bus_name: ?[*:0]const u8, arg_object_path: [*:0]const u8, arg_interface_name: [*:0]const u8, arg_method_name: [*:0]const u8, arg_parameters: ?*GLib.Variant, arg_reply_type: ?*GLib.VariantType, arg_flags: DBusCallFlags, arg_timeout_msec: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*DBusConnection, ?[*:0]const u8, [*:0]const u8, [*:0]const u8, [*:0]const u8, ?*GLib.Variant, ?*GLib.VariantType, DBusCallFlags, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dbus_connection_call" });
        const ret = cFn(self, arg_bus_name, arg_object_path, arg_interface_name, arg_method_name, arg_parameters, arg_reply_type, arg_flags, arg_timeout_msec, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn callFinish(self: *DBusConnection, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*GLib.Variant {
        const cFn = @extern(*const fn (*DBusConnection, *AsyncResult, *?*GLib.Error) callconv(.c) *GLib.Variant, .{ .name = "g_dbus_connection_call_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn callSync(self: *DBusConnection, arg_bus_name: ?[*:0]const u8, arg_object_path: [*:0]const u8, arg_interface_name: [*:0]const u8, arg_method_name: [*:0]const u8, arg_parameters: ?*GLib.Variant, arg_reply_type: ?*GLib.VariantType, arg_flags: DBusCallFlags, arg_timeout_msec: i32, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*GLib.Variant {
        const cFn = @extern(*const fn (*DBusConnection, ?[*:0]const u8, [*:0]const u8, [*:0]const u8, [*:0]const u8, ?*GLib.Variant, ?*GLib.VariantType, DBusCallFlags, i32, ?*Cancellable, *?*GLib.Error) callconv(.c) *GLib.Variant, .{ .name = "g_dbus_connection_call_sync" });
        const ret = cFn(self, arg_bus_name, arg_object_path, arg_interface_name, arg_method_name, arg_parameters, arg_reply_type, arg_flags, arg_timeout_msec, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn callWithUnixFdList(self: *DBusConnection, arg_bus_name: ?[*:0]const u8, arg_object_path: [*:0]const u8, arg_interface_name: [*:0]const u8, arg_method_name: [*:0]const u8, arg_parameters: ?*GLib.Variant, arg_reply_type: ?*GLib.VariantType, arg_flags: DBusCallFlags, arg_timeout_msec: i32, arg_fd_list: ?*UnixFDList, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*DBusConnection, ?[*:0]const u8, [*:0]const u8, [*:0]const u8, [*:0]const u8, ?*GLib.Variant, ?*GLib.VariantType, DBusCallFlags, i32, ?*UnixFDList, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dbus_connection_call_with_unix_fd_list" });
        const ret = cFn(self, arg_bus_name, arg_object_path, arg_interface_name, arg_method_name, arg_parameters, arg_reply_type, arg_flags, arg_timeout_msec, arg_fd_list, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn callWithUnixFdListFinish(self: *DBusConnection, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *GLib.Variant,
        out_fd_list: ?*UnixFDList,
    } {
        var argO_out_fd_list: ?*UnixFDList = undefined;
        const arg_out_fd_list: ?*?*UnixFDList = &argO_out_fd_list;
        const cFn = @extern(*const fn (*DBusConnection, ?*?*UnixFDList, *AsyncResult, *?*GLib.Error) callconv(.c) *GLib.Variant, .{ .name = "g_dbus_connection_call_with_unix_fd_list_finish" });
        const ret = cFn(self, arg_out_fd_list, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .out_fd_list = argO_out_fd_list };
    }
    pub fn callWithUnixFdListSync(self: *DBusConnection, arg_bus_name: ?[*:0]const u8, arg_object_path: [*:0]const u8, arg_interface_name: [*:0]const u8, arg_method_name: [*:0]const u8, arg_parameters: ?*GLib.Variant, arg_reply_type: ?*GLib.VariantType, arg_flags: DBusCallFlags, arg_timeout_msec: i32, arg_fd_list: ?*UnixFDList, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *GLib.Variant,
        out_fd_list: ?*UnixFDList,
    } {
        var argO_out_fd_list: ?*UnixFDList = undefined;
        const arg_out_fd_list: ?*?*UnixFDList = &argO_out_fd_list;
        const cFn = @extern(*const fn (*DBusConnection, ?[*:0]const u8, [*:0]const u8, [*:0]const u8, [*:0]const u8, ?*GLib.Variant, ?*GLib.VariantType, DBusCallFlags, i32, ?*UnixFDList, ?*?*UnixFDList, ?*Cancellable, *?*GLib.Error) callconv(.c) *GLib.Variant, .{ .name = "g_dbus_connection_call_with_unix_fd_list_sync" });
        const ret = cFn(self, arg_bus_name, arg_object_path, arg_interface_name, arg_method_name, arg_parameters, arg_reply_type, arg_flags, arg_timeout_msec, arg_fd_list, arg_out_fd_list, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .out_fd_list = argO_out_fd_list };
    }
    pub fn close(self: *DBusConnection, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*DBusConnection, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dbus_connection_close" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn closeFinish(self: *DBusConnection, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DBusConnection, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dbus_connection_close_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn closeSync(self: *DBusConnection, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DBusConnection, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dbus_connection_close_sync" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn emitSignal(self: *DBusConnection, arg_destination_bus_name: ?[*:0]const u8, arg_object_path: [*:0]const u8, arg_interface_name: [*:0]const u8, arg_signal_name: [*:0]const u8, arg_parameters: ?*GLib.Variant, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DBusConnection, ?[*:0]const u8, [*:0]const u8, [*:0]const u8, [*:0]const u8, ?*GLib.Variant, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dbus_connection_emit_signal" });
        const ret = cFn(self, arg_destination_bus_name, arg_object_path, arg_interface_name, arg_signal_name, arg_parameters, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn exportActionGroup(self: *DBusConnection, arg_object_path: [*:0]const u8, arg_action_group: *ActionGroup, arg_error: *?*GLib.Error) error{GError}!u32 {
        const cFn = @extern(*const fn (*DBusConnection, [*:0]const u8, *ActionGroup, *?*GLib.Error) callconv(.c) u32, .{ .name = "g_dbus_connection_export_action_group" });
        const ret = cFn(self, arg_object_path, arg_action_group, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn exportMenuModel(self: *DBusConnection, arg_object_path: [*:0]const u8, arg_menu: *MenuModel, arg_error: *?*GLib.Error) error{GError}!u32 {
        const cFn = @extern(*const fn (*DBusConnection, [*:0]const u8, *MenuModel, *?*GLib.Error) callconv(.c) u32, .{ .name = "g_dbus_connection_export_menu_model" });
        const ret = cFn(self, arg_object_path, arg_menu, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn flush(self: *DBusConnection, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*DBusConnection, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dbus_connection_flush" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn flushFinish(self: *DBusConnection, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DBusConnection, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dbus_connection_flush_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn flushSync(self: *DBusConnection, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DBusConnection, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dbus_connection_flush_sync" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getCapabilities(self: *DBusConnection) DBusCapabilityFlags {
        const cFn = @extern(*const fn (*DBusConnection) callconv(.c) DBusCapabilityFlags, .{ .name = "g_dbus_connection_get_capabilities" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getExitOnClose(self: *DBusConnection) bool {
        const cFn = @extern(*const fn (*DBusConnection) callconv(.c) bool, .{ .name = "g_dbus_connection_get_exit_on_close" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFlags(self: *DBusConnection) DBusConnectionFlags {
        const cFn = @extern(*const fn (*DBusConnection) callconv(.c) DBusConnectionFlags, .{ .name = "g_dbus_connection_get_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getGuid(self: *DBusConnection) [*:0]u8 {
        const cFn = @extern(*const fn (*DBusConnection) callconv(.c) [*:0]u8, .{ .name = "g_dbus_connection_get_guid" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLastSerial(self: *DBusConnection) u32 {
        const cFn = @extern(*const fn (*DBusConnection) callconv(.c) u32, .{ .name = "g_dbus_connection_get_last_serial" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPeerCredentials(self: *DBusConnection) ?*Credentials {
        const cFn = @extern(*const fn (*DBusConnection) callconv(.c) ?*Credentials, .{ .name = "g_dbus_connection_get_peer_credentials" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStream(self: *DBusConnection) *IOStream {
        const cFn = @extern(*const fn (*DBusConnection) callconv(.c) *IOStream, .{ .name = "g_dbus_connection_get_stream" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUniqueName(self: *DBusConnection) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DBusConnection) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_connection_get_unique_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isClosed(self: *DBusConnection) bool {
        const cFn = @extern(*const fn (*DBusConnection) callconv(.c) bool, .{ .name = "g_dbus_connection_is_closed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn registerObject(self: *DBusConnection, arg_object_path: [*:0]const u8, arg_interface_info: *DBusInterfaceInfo, arg_method_call_closure: ?*GObject.Closure, arg_get_property_closure: ?*GObject.Closure, arg_set_property_closure: ?*GObject.Closure, arg_error: *?*GLib.Error) error{GError}!u32 {
        const cFn = @extern(*const fn (*DBusConnection, [*:0]const u8, *DBusInterfaceInfo, ?*GObject.Closure, ?*GObject.Closure, ?*GObject.Closure, *?*GLib.Error) callconv(.c) u32, .{ .name = "g_dbus_connection_register_object_with_closures" });
        const ret = cFn(self, arg_object_path, arg_interface_info, arg_method_call_closure, arg_get_property_closure, arg_set_property_closure, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn registerObjectWithClosures2(self: *DBusConnection, arg_object_path: [*:0]const u8, arg_interface_info: *DBusInterfaceInfo, arg_method_call_closure: ?*GObject.Closure, arg_get_property_closure: ?*GObject.Closure, arg_set_property_closure: ?*GObject.Closure, arg_error: *?*GLib.Error) error{GError}!u32 {
        const cFn = @extern(*const fn (*DBusConnection, [*:0]const u8, *DBusInterfaceInfo, ?*GObject.Closure, ?*GObject.Closure, ?*GObject.Closure, *?*GLib.Error) callconv(.c) u32, .{ .name = "g_dbus_connection_register_object_with_closures2" });
        const ret = cFn(self, arg_object_path, arg_interface_info, arg_method_call_closure, arg_get_property_closure, arg_set_property_closure, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn registerSubtree(self: *DBusConnection, arg_object_path: [*:0]const u8, arg_vtable: *DBusSubtreeVTable, arg_flags: DBusSubtreeFlags, arg_user_data: ?*anyopaque, arg_user_data_free_func: GLib.DestroyNotify, arg_error: *?*GLib.Error) error{GError}!u32 {
        const cFn = @extern(*const fn (*DBusConnection, [*:0]const u8, *DBusSubtreeVTable, DBusSubtreeFlags, ?*anyopaque, GLib.DestroyNotify, *?*GLib.Error) callconv(.c) u32, .{ .name = "g_dbus_connection_register_subtree" });
        const ret = cFn(self, arg_object_path, arg_vtable, arg_flags, @ptrCast(arg_user_data), arg_user_data_free_func, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn removeFilter(self: *DBusConnection, arg_filter_id: u32) void {
        const cFn = @extern(*const fn (*DBusConnection, u32) callconv(.c) void, .{ .name = "g_dbus_connection_remove_filter" });
        const ret = cFn(self, arg_filter_id);
        return ret;
    }
    pub fn sendMessage(self: *DBusConnection, arg_message: *DBusMessage, arg_flags: DBusSendMessageFlags, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        out_serial: u32,
    } {
        var argO_out_serial: u32 = undefined;
        const arg_out_serial: ?*u32 = &argO_out_serial;
        const cFn = @extern(*const fn (*DBusConnection, *DBusMessage, DBusSendMessageFlags, ?*u32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dbus_connection_send_message" });
        const ret = cFn(self, arg_message, arg_flags, arg_out_serial, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .out_serial = argO_out_serial };
    }
    pub fn sendMessageWithReply(self: *DBusConnection, arg_message: *DBusMessage, arg_flags: DBusSendMessageFlags, arg_timeout_msec: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) u32 {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        var argO_out_serial: u32 = undefined;
        const arg_out_serial: ?*u32 = &argO_out_serial;
        const cFn = @extern(*const fn (*DBusConnection, *DBusMessage, DBusSendMessageFlags, i32, ?*u32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dbus_connection_send_message_with_reply" });
        const ret = cFn(self, arg_message, arg_flags, arg_timeout_msec, arg_out_serial, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        _ = ret;
        return argO_out_serial;
    }
    pub fn sendMessageWithReplyFinish(self: *DBusConnection, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*DBusMessage {
        const cFn = @extern(*const fn (*DBusConnection, *AsyncResult, *?*GLib.Error) callconv(.c) *DBusMessage, .{ .name = "g_dbus_connection_send_message_with_reply_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn sendMessageWithReplySync(self: *DBusConnection, arg_message: *DBusMessage, arg_flags: DBusSendMessageFlags, arg_timeout_msec: i32, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *DBusMessage,
        out_serial: u32,
    } {
        var argO_out_serial: u32 = undefined;
        const arg_out_serial: ?*u32 = &argO_out_serial;
        const cFn = @extern(*const fn (*DBusConnection, *DBusMessage, DBusSendMessageFlags, i32, ?*u32, ?*Cancellable, *?*GLib.Error) callconv(.c) *DBusMessage, .{ .name = "g_dbus_connection_send_message_with_reply_sync" });
        const ret = cFn(self, arg_message, arg_flags, arg_timeout_msec, arg_out_serial, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .out_serial = argO_out_serial };
    }
    pub fn setExitOnClose(self: *DBusConnection, arg_exit_on_close: bool) void {
        const cFn = @extern(*const fn (*DBusConnection, bool) callconv(.c) void, .{ .name = "g_dbus_connection_set_exit_on_close" });
        const ret = cFn(self, arg_exit_on_close);
        return ret;
    }
    pub fn signalSubscribe(self: *DBusConnection, arg_sender: ?[*:0]const u8, arg_interface_name: ?[*:0]const u8, arg_member: ?[*:0]const u8, arg_object_path: ?[*:0]const u8, arg_arg0: ?[*:0]const u8, arg_flags: DBusSignalFlags, argC_callback: core.Closure(DBusSignalCallback)) u32 {
        const arg_callback: DBusSignalCallback = @ptrCast(argC_callback.callback());
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const arg_user_data_free_func: ?GLib.DestroyNotify = @ptrCast(argC_callback.destroy());
        const cFn = @extern(*const fn (*DBusConnection, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, DBusSignalFlags, DBusSignalCallback, ?*anyopaque, ?GLib.DestroyNotify) callconv(.c) u32, .{ .name = "g_dbus_connection_signal_subscribe" });
        const ret = cFn(self, arg_sender, arg_interface_name, arg_member, arg_object_path, arg_arg0, arg_flags, arg_callback, @ptrCast(arg_user_data), arg_user_data_free_func);
        return ret;
    }
    pub fn signalUnsubscribe(self: *DBusConnection, arg_subscription_id: u32) void {
        const cFn = @extern(*const fn (*DBusConnection, u32) callconv(.c) void, .{ .name = "g_dbus_connection_signal_unsubscribe" });
        const ret = cFn(self, arg_subscription_id);
        return ret;
    }
    pub fn startMessageProcessing(self: *DBusConnection) void {
        const cFn = @extern(*const fn (*DBusConnection) callconv(.c) void, .{ .name = "g_dbus_connection_start_message_processing" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unexportActionGroup(self: *DBusConnection, arg_export_id: u32) void {
        const cFn = @extern(*const fn (*DBusConnection, u32) callconv(.c) void, .{ .name = "g_dbus_connection_unexport_action_group" });
        const ret = cFn(self, arg_export_id);
        return ret;
    }
    pub fn unexportMenuModel(self: *DBusConnection, arg_export_id: u32) void {
        const cFn = @extern(*const fn (*DBusConnection, u32) callconv(.c) void, .{ .name = "g_dbus_connection_unexport_menu_model" });
        const ret = cFn(self, arg_export_id);
        return ret;
    }
    pub fn unregisterObject(self: *DBusConnection, arg_registration_id: u32) bool {
        const cFn = @extern(*const fn (*DBusConnection, u32) callconv(.c) bool, .{ .name = "g_dbus_connection_unregister_object" });
        const ret = cFn(self, arg_registration_id);
        return ret;
    }
    pub fn unregisterSubtree(self: *DBusConnection, arg_registration_id: u32) bool {
        const cFn = @extern(*const fn (*DBusConnection, u32) callconv(.c) bool, .{ .name = "g_dbus_connection_unregister_subtree" });
        const ret = cFn(self, arg_registration_id);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_connection_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusConnectionFlags = packed struct(u32) {
    authentication_client: bool = false,
    authentication_server: bool = false,
    authentication_allow_anonymous: bool = false,
    message_bus_connection: bool = false,
    delay_message_processing: bool = false,
    authentication_require_same_user: bool = false,
    cross_namespace: bool = false,
    _: u25 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_connection_flags_get_type" });
        return cFn();
    }
};
pub const DBusError = enum(u32) {
    failed = 0,
    no_memory = 1,
    service_unknown = 2,
    name_has_no_owner = 3,
    no_reply = 4,
    io_error = 5,
    bad_address = 6,
    not_supported = 7,
    limits_exceeded = 8,
    access_denied = 9,
    auth_failed = 10,
    no_server = 11,
    timeout = 12,
    no_network = 13,
    address_in_use = 14,
    disconnected = 15,
    invalid_args = 16,
    file_not_found = 17,
    file_exists = 18,
    unknown_method = 19,
    timed_out = 20,
    match_rule_not_found = 21,
    match_rule_invalid = 22,
    spawn_exec_failed = 23,
    spawn_fork_failed = 24,
    spawn_child_exited = 25,
    spawn_child_signaled = 26,
    spawn_failed = 27,
    spawn_setup_failed = 28,
    spawn_config_invalid = 29,
    spawn_service_invalid = 30,
    spawn_service_not_found = 31,
    spawn_permissions_invalid = 32,
    spawn_file_invalid = 33,
    spawn_no_memory = 34,
    unix_process_id_unknown = 35,
    invalid_signature = 36,
    invalid_file_content = 37,
    selinux_security_context_unknown = 38,
    adt_audit_data_unknown = 39,
    object_path_in_use = 40,
    unknown_object = 41,
    unknown_interface = 42,
    unknown_property = 43,
    property_read_only = 44,
    pub fn encodeGerror(arg_error: *GLib.Error) [*:0]u8 {
        const cFn = @extern(*const fn (*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_dbus_error_encode_gerror" });
        const ret = cFn(arg_error);
        return ret;
    }
    pub fn getRemoteError(arg_error: *GLib.Error) ?[*:0]u8 {
        const cFn = @extern(*const fn (*GLib.Error) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_error_get_remote_error" });
        const ret = cFn(arg_error);
        return ret;
    }
    pub fn isRemoteError(arg_error: *GLib.Error) bool {
        const cFn = @extern(*const fn (*GLib.Error) callconv(.c) bool, .{ .name = "g_dbus_error_is_remote_error" });
        const ret = cFn(arg_error);
        return ret;
    }
    pub fn newForDbusError(arg_dbus_error_name: [*:0]const u8, arg_dbus_error_message: [*:0]const u8) *GLib.Error {
        const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) *GLib.Error, .{ .name = "g_dbus_error_new_for_dbus_error" });
        const ret = cFn(arg_dbus_error_name, arg_dbus_error_message);
        return ret;
    }
    pub fn quark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_dbus_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn registerError(arg_error_domain: u32, arg_error_code: i32, arg_dbus_error_name: [*:0]const u8) bool {
        const cFn = @extern(*const fn (u32, i32, [*:0]const u8) callconv(.c) bool, .{ .name = "g_dbus_error_register_error" });
        const ret = cFn(arg_error_domain, arg_error_code, arg_dbus_error_name);
        return ret;
    }
    pub fn registerErrorDomain(arg_error_domain_quark_name: [*:0]const u8, arg_quark_volatile: *u64, argS_entries: []DBusErrorEntry) void {
        const arg_entries: [*]DBusErrorEntry = @ptrCast(argS_entries);
        const arg_num_entries: u32 = @intCast((argS_entries).len);
        const cFn = @extern(*const fn ([*:0]const u8, *u64, [*]DBusErrorEntry, u32) callconv(.c) void, .{ .name = "g_dbus_error_register_error_domain" });
        const ret = cFn(arg_error_domain_quark_name, arg_quark_volatile, arg_entries, arg_num_entries);
        return ret;
    }
    pub fn stripRemoteError(arg_error: *GLib.Error) bool {
        const cFn = @extern(*const fn (*GLib.Error) callconv(.c) bool, .{ .name = "g_dbus_error_strip_remote_error" });
        const ret = cFn(arg_error);
        return ret;
    }
    pub fn unregisterError(arg_error_domain: u32, arg_error_code: i32, arg_dbus_error_name: [*:0]const u8) bool {
        const cFn = @extern(*const fn (u32, i32, [*:0]const u8) callconv(.c) bool, .{ .name = "g_dbus_error_unregister_error" });
        const ret = cFn(arg_error_domain, arg_error_code, arg_dbus_error_name);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_error_get_type" });
        return cFn();
    }
};
pub const DBusErrorEntry = extern struct {
    error_code: i32,
    dbus_error_name: ?[*:0]const u8,
};
pub const DBusInterface = struct {
    pub const Class = DBusInterfaceIface;
    pub fn getObject(self: *DBusInterface) ?*DBusObject {
        const cFn = @extern(*const fn (*DBusInterface) callconv(.c) ?*DBusObject, .{ .name = "g_dbus_interface_dup_object" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInfo(self: *DBusInterface) *DBusInterfaceInfo {
        const cFn = @extern(*const fn (*DBusInterface) callconv(.c) *DBusInterfaceInfo, .{ .name = "g_dbus_interface_get_info" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setObject(self: *DBusInterface, arg_object: ?*DBusObject) void {
        const cFn = @extern(*const fn (*DBusInterface, ?*DBusObject) callconv(.c) void, .{ .name = "g_dbus_interface_set_object" });
        const ret = cFn(self, arg_object);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_interface_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusInterfaceGetPropertyFunc = *const fn (arg_connection: *DBusConnection, arg_sender: ?[*:0]const u8, arg_object_path: [*:0]const u8, arg_interface_name: [*:0]const u8, arg_property_name: [*:0]const u8, arg_error: *GLib.Error, arg_user_data: ?*anyopaque) callconv(.c) *GLib.Variant;
pub const DBusInterfaceIface = extern struct {
    parent_iface: GObject.TypeInterface,
    get_info: ?*const fn (arg_interface_: *DBusInterface) callconv(.c) *DBusInterfaceInfo,
    get_object: ?*const fn (arg_interface_: *DBusInterface) callconv(.c) ?*DBusObject,
    set_object: ?*const fn (arg_interface_: *DBusInterface, arg_object: ?*DBusObject) callconv(.c) void,
    dup_object: ?*const fn (arg_interface_: *DBusInterface) callconv(.c) ?*DBusObject,
};
pub const DBusInterfaceInfo = extern struct {
    ref_count: i32,
    name: ?[*:0]const u8,
    methods: ?[*:null]?*DBusMethodInfo,
    signals: ?[*:null]?*DBusSignalInfo,
    properties: ?[*:null]?*DBusPropertyInfo,
    annotations: ?[*:null]?*DBusAnnotationInfo,
    pub fn cacheBuild(self: *DBusInterfaceInfo) void {
        const cFn = @extern(*const fn (*DBusInterfaceInfo) callconv(.c) void, .{ .name = "g_dbus_interface_info_cache_build" });
        const ret = cFn(self);
        return ret;
    }
    pub fn cacheRelease(self: *DBusInterfaceInfo) void {
        const cFn = @extern(*const fn (*DBusInterfaceInfo) callconv(.c) void, .{ .name = "g_dbus_interface_info_cache_release" });
        const ret = cFn(self);
        return ret;
    }
    pub fn generateXml(self: *DBusInterfaceInfo, arg_indent: u32, arg_string_builder: *GLib.String) void {
        const cFn = @extern(*const fn (*DBusInterfaceInfo, u32, *GLib.String) callconv(.c) void, .{ .name = "g_dbus_interface_info_generate_xml" });
        const ret = cFn(self, arg_indent, arg_string_builder);
        return ret;
    }
    pub fn lookupMethod(self: *DBusInterfaceInfo, arg_name: [*:0]const u8) ?*DBusMethodInfo {
        const cFn = @extern(*const fn (*DBusInterfaceInfo, [*:0]const u8) callconv(.c) ?*DBusMethodInfo, .{ .name = "g_dbus_interface_info_lookup_method" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn lookupProperty(self: *DBusInterfaceInfo, arg_name: [*:0]const u8) ?*DBusPropertyInfo {
        const cFn = @extern(*const fn (*DBusInterfaceInfo, [*:0]const u8) callconv(.c) ?*DBusPropertyInfo, .{ .name = "g_dbus_interface_info_lookup_property" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn lookupSignal(self: *DBusInterfaceInfo, arg_name: [*:0]const u8) ?*DBusSignalInfo {
        const cFn = @extern(*const fn (*DBusInterfaceInfo, [*:0]const u8) callconv(.c) ?*DBusSignalInfo, .{ .name = "g_dbus_interface_info_lookup_signal" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn ref(self: *DBusInterfaceInfo) *DBusInterfaceInfo {
        const cFn = @extern(*const fn (*DBusInterfaceInfo) callconv(.c) *DBusInterfaceInfo, .{ .name = "g_dbus_interface_info_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *DBusInterfaceInfo) void {
        const cFn = @extern(*const fn (*DBusInterfaceInfo) callconv(.c) void, .{ .name = "g_dbus_interface_info_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_interface_info_get_type" });
        return cFn();
    }
};
pub const DBusInterfaceMethodCallFunc = *const fn (arg_connection: *DBusConnection, arg_sender: ?[*:0]const u8, arg_object_path: [*:0]const u8, arg_interface_name: ?[*:0]const u8, arg_method_name: [*:0]const u8, arg_parameters: *GLib.Variant, arg_invocation: *DBusMethodInvocation, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const DBusInterfaceSetPropertyFunc = *const fn (arg_connection: *DBusConnection, arg_sender: ?[*:0]const u8, arg_object_path: [*:0]const u8, arg_interface_name: [*:0]const u8, arg_property_name: [*:0]const u8, arg_value: *GLib.Variant, arg_error: *GLib.Error, arg_user_data: ?*anyopaque) callconv(.c) bool;
pub const DBusInterfaceSkeleton = extern struct {
    pub const Interfaces = [_]type{DBusInterface};
    pub const Parent = GObject.Object;
    pub const Class = DBusInterfaceSkeletonClass;
    _props: struct {
        @"g-flags": core.Property(DBusInterfaceSkeletonFlags, "g-flags") = .{},
    },
    _signals: struct {
        @"g-authorize-method": core.Signal(fn (*DBusInterfaceSkeleton, *DBusMethodInvocation) bool, "g-authorize-method") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*DBusInterfaceSkeletonPrivate,
    pub fn @"export"(self: *DBusInterfaceSkeleton, arg_connection: *DBusConnection, arg_object_path: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DBusInterfaceSkeleton, *DBusConnection, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dbus_interface_skeleton_export" });
        const ret = cFn(self, arg_connection, arg_object_path, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn flush(self: *DBusInterfaceSkeleton) void {
        const cFn = @extern(*const fn (*DBusInterfaceSkeleton) callconv(.c) void, .{ .name = "g_dbus_interface_skeleton_flush" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getConnection(self: *DBusInterfaceSkeleton) ?*DBusConnection {
        const cFn = @extern(*const fn (*DBusInterfaceSkeleton) callconv(.c) ?*DBusConnection, .{ .name = "g_dbus_interface_skeleton_get_connection" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getConnections(self: *DBusInterfaceSkeleton) ?*GLib.List {
        const cFn = @extern(*const fn (*DBusInterfaceSkeleton) callconv(.c) ?*GLib.List, .{ .name = "g_dbus_interface_skeleton_get_connections" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFlags(self: *DBusInterfaceSkeleton) DBusInterfaceSkeletonFlags {
        const cFn = @extern(*const fn (*DBusInterfaceSkeleton) callconv(.c) DBusInterfaceSkeletonFlags, .{ .name = "g_dbus_interface_skeleton_get_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInfo(self: *DBusInterfaceSkeleton) *DBusInterfaceInfo {
        const cFn = @extern(*const fn (*DBusInterfaceSkeleton) callconv(.c) *DBusInterfaceInfo, .{ .name = "g_dbus_interface_skeleton_get_info" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getObjectPath(self: *DBusInterfaceSkeleton) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DBusInterfaceSkeleton) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_interface_skeleton_get_object_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getProperties(self: *DBusInterfaceSkeleton) *GLib.Variant {
        const cFn = @extern(*const fn (*DBusInterfaceSkeleton) callconv(.c) *GLib.Variant, .{ .name = "g_dbus_interface_skeleton_get_properties" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getVtable(self: *DBusInterfaceSkeleton) *DBusInterfaceVTable {
        const cFn = @extern(*const fn (*DBusInterfaceSkeleton) callconv(.c) *DBusInterfaceVTable, .{ .name = "g_dbus_interface_skeleton_get_vtable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hasConnection(self: *DBusInterfaceSkeleton, arg_connection: *DBusConnection) bool {
        const cFn = @extern(*const fn (*DBusInterfaceSkeleton, *DBusConnection) callconv(.c) bool, .{ .name = "g_dbus_interface_skeleton_has_connection" });
        const ret = cFn(self, arg_connection);
        return ret;
    }
    pub fn setFlags(self: *DBusInterfaceSkeleton, arg_flags: DBusInterfaceSkeletonFlags) void {
        const cFn = @extern(*const fn (*DBusInterfaceSkeleton, DBusInterfaceSkeletonFlags) callconv(.c) void, .{ .name = "g_dbus_interface_skeleton_set_flags" });
        const ret = cFn(self, arg_flags);
        return ret;
    }
    pub fn unexport(self: *DBusInterfaceSkeleton) void {
        const cFn = @extern(*const fn (*DBusInterfaceSkeleton) callconv(.c) void, .{ .name = "g_dbus_interface_skeleton_unexport" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unexportFromConnection(self: *DBusInterfaceSkeleton, arg_connection: *DBusConnection) void {
        const cFn = @extern(*const fn (*DBusInterfaceSkeleton, *DBusConnection) callconv(.c) void, .{ .name = "g_dbus_interface_skeleton_unexport_from_connection" });
        const ret = cFn(self, arg_connection);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_interface_skeleton_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusInterfaceSkeletonClass = extern struct {
    parent_class: GObject.ObjectClass,
    get_info: ?*const fn (arg_interface_: *DBusInterfaceSkeleton) callconv(.c) *DBusInterfaceInfo,
    get_vtable: ?*const fn (arg_interface_: *DBusInterfaceSkeleton) callconv(.c) *DBusInterfaceVTable,
    get_properties: ?*const fn (arg_interface_: *DBusInterfaceSkeleton) callconv(.c) *GLib.Variant,
    flush: ?*const fn (arg_interface_: *DBusInterfaceSkeleton) callconv(.c) void,
    vfunc_padding: [8]?*anyopaque,
    g_authorize_method: ?*const fn (arg_interface_: *DBusInterfaceSkeleton, arg_invocation: *DBusMethodInvocation) callconv(.c) bool,
    signal_padding: [8]?*anyopaque,
};
pub const DBusInterfaceSkeletonFlags = packed struct(u32) {
    handle_method_invocations_in_thread: bool = false,
    _: u31 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_interface_skeleton_flags_get_type" });
        return cFn();
    }
};
pub const DBusInterfaceSkeletonPrivate = opaque {};
pub const DBusInterfaceVTable = extern struct {
    method_call: ?DBusInterfaceMethodCallFunc,
    get_property: ?DBusInterfaceGetPropertyFunc,
    set_property: ?DBusInterfaceSetPropertyFunc,
    padding: [8]?*anyopaque,
};
pub const DBusMenuModel = struct {
    pub const Parent = MenuModel;
    pub fn get(arg_connection: *DBusConnection, arg_bus_name: ?[*:0]const u8, arg_object_path: [*:0]const u8) *DBusMenuModel {
        const cFn = @extern(*const fn (*DBusConnection, ?[*:0]const u8, [*:0]const u8) callconv(.c) *DBusMenuModel, .{ .name = "g_dbus_menu_model_get" });
        const ret = cFn(arg_connection, arg_bus_name, arg_object_path);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_menu_model_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusMessage = struct {
    pub const Parent = GObject.Object;
    _props: struct {
        locked: core.Property(bool, "locked") = .{},
    },
    pub fn new() *DBusMessage {
        const cFn = @extern(*const fn () callconv(.c) *DBusMessage, .{ .name = "g_dbus_message_new" });
        const ret = cFn();
        return ret;
    }
    pub fn newFromBlob(argS_blob: []u8, arg_capabilities: DBusCapabilityFlags, arg_error: *?*GLib.Error) error{GError}!*DBusMessage {
        const arg_blob: [*]u8 = @ptrCast(argS_blob);
        const arg_blob_len: u64 = @intCast((argS_blob).len);
        const cFn = @extern(*const fn ([*]u8, u64, DBusCapabilityFlags, *?*GLib.Error) callconv(.c) *DBusMessage, .{ .name = "g_dbus_message_new_from_blob" });
        const ret = cFn(arg_blob, arg_blob_len, arg_capabilities, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newMethodCall(arg_name: ?[*:0]const u8, arg_path: [*:0]const u8, arg_interface_: ?[*:0]const u8, arg_method: [*:0]const u8) *DBusMessage {
        const cFn = @extern(*const fn (?[*:0]const u8, [*:0]const u8, ?[*:0]const u8, [*:0]const u8) callconv(.c) *DBusMessage, .{ .name = "g_dbus_message_new_method_call" });
        const ret = cFn(arg_name, arg_path, arg_interface_, arg_method);
        return ret;
    }
    pub fn newSignal(arg_path: [*:0]const u8, arg_interface_: [*:0]const u8, arg_signal: [*:0]const u8) *DBusMessage {
        const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, [*:0]const u8) callconv(.c) *DBusMessage, .{ .name = "g_dbus_message_new_signal" });
        const ret = cFn(arg_path, arg_interface_, arg_signal);
        return ret;
    }
    pub fn bytesNeeded(argS_blob: []u8, arg_error: *?*GLib.Error) error{GError}!i64 {
        const arg_blob: [*]u8 = @ptrCast(argS_blob);
        const arg_blob_len: u64 = @intCast((argS_blob).len);
        const cFn = @extern(*const fn ([*]u8, u64, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_dbus_message_bytes_needed" });
        const ret = cFn(arg_blob, arg_blob_len, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn copy(self: *DBusMessage, arg_error: *?*GLib.Error) error{GError}!*DBusMessage {
        const cFn = @extern(*const fn (*DBusMessage, *?*GLib.Error) callconv(.c) *DBusMessage, .{ .name = "g_dbus_message_copy" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getArg0(self: *DBusMessage) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_message_get_arg0" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getArg0Path(self: *DBusMessage) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_message_get_arg0_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBody(self: *DBusMessage) ?*GLib.Variant {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) ?*GLib.Variant, .{ .name = "g_dbus_message_get_body" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getByteOrder(self: *DBusMessage) DBusMessageByteOrder {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) DBusMessageByteOrder, .{ .name = "g_dbus_message_get_byte_order" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDestination(self: *DBusMessage) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_message_get_destination" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getErrorName(self: *DBusMessage) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_message_get_error_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFlags(self: *DBusMessage) DBusMessageFlags {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) DBusMessageFlags, .{ .name = "g_dbus_message_get_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHeader(self: *DBusMessage, arg_header_field: DBusMessageHeaderField) ?*GLib.Variant {
        const cFn = @extern(*const fn (*DBusMessage, DBusMessageHeaderField) callconv(.c) ?*GLib.Variant, .{ .name = "g_dbus_message_get_header" });
        const ret = cFn(self, arg_header_field);
        return ret;
    }
    pub fn getHeaderFields(self: *DBusMessage) [*:0]u8 {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) [*:0]u8, .{ .name = "g_dbus_message_get_header_fields" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInterface(self: *DBusMessage) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_message_get_interface" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLocked(self: *DBusMessage) bool {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) bool, .{ .name = "g_dbus_message_get_locked" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMember(self: *DBusMessage) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_message_get_member" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMessageType(self: *DBusMessage) DBusMessageType {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) DBusMessageType, .{ .name = "g_dbus_message_get_message_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNumUnixFds(self: *DBusMessage) u32 {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) u32, .{ .name = "g_dbus_message_get_num_unix_fds" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPath(self: *DBusMessage) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_message_get_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getReplySerial(self: *DBusMessage) u32 {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) u32, .{ .name = "g_dbus_message_get_reply_serial" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSender(self: *DBusMessage) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_message_get_sender" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSerial(self: *DBusMessage) u32 {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) u32, .{ .name = "g_dbus_message_get_serial" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSignature(self: *DBusMessage) [*:0]u8 {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) [*:0]u8, .{ .name = "g_dbus_message_get_signature" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUnixFdList(self: *DBusMessage) ?*UnixFDList {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) ?*UnixFDList, .{ .name = "g_dbus_message_get_unix_fd_list" });
        const ret = cFn(self);
        return ret;
    }
    pub fn lock(self: *DBusMessage) void {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) void, .{ .name = "g_dbus_message_lock" });
        const ret = cFn(self);
        return ret;
    }
    pub fn newMethodErrorLiteral(self: *DBusMessage, arg_error_name: [*:0]const u8, arg_error_message: [*:0]const u8) *DBusMessage {
        const cFn = @extern(*const fn (*DBusMessage, [*:0]const u8, [*:0]const u8) callconv(.c) *DBusMessage, .{ .name = "g_dbus_message_new_method_error_literal" });
        const ret = cFn(self, arg_error_name, arg_error_message);
        return ret;
    }
    pub fn newMethodReply(self: *DBusMessage) *DBusMessage {
        const cFn = @extern(*const fn (*DBusMessage) callconv(.c) *DBusMessage, .{ .name = "g_dbus_message_new_method_reply" });
        const ret = cFn(self);
        return ret;
    }
    pub fn print(self: *DBusMessage, arg_indent: u32) [*:0]u8 {
        const cFn = @extern(*const fn (*DBusMessage, u32) callconv(.c) [*:0]u8, .{ .name = "g_dbus_message_print" });
        const ret = cFn(self, arg_indent);
        return ret;
    }
    pub fn setBody(self: *DBusMessage, arg_body: *GLib.Variant) void {
        const cFn = @extern(*const fn (*DBusMessage, *GLib.Variant) callconv(.c) void, .{ .name = "g_dbus_message_set_body" });
        const ret = cFn(self, arg_body);
        return ret;
    }
    pub fn setByteOrder(self: *DBusMessage, arg_byte_order: DBusMessageByteOrder) void {
        const cFn = @extern(*const fn (*DBusMessage, DBusMessageByteOrder) callconv(.c) void, .{ .name = "g_dbus_message_set_byte_order" });
        const ret = cFn(self, arg_byte_order);
        return ret;
    }
    pub fn setDestination(self: *DBusMessage, arg_value: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*DBusMessage, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_dbus_message_set_destination" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn setErrorName(self: *DBusMessage, arg_value: [*:0]const u8) void {
        const cFn = @extern(*const fn (*DBusMessage, [*:0]const u8) callconv(.c) void, .{ .name = "g_dbus_message_set_error_name" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn setFlags(self: *DBusMessage, arg_flags: DBusMessageFlags) void {
        const cFn = @extern(*const fn (*DBusMessage, DBusMessageFlags) callconv(.c) void, .{ .name = "g_dbus_message_set_flags" });
        const ret = cFn(self, arg_flags);
        return ret;
    }
    pub fn setHeader(self: *DBusMessage, arg_header_field: DBusMessageHeaderField, arg_value: ?*GLib.Variant) void {
        const cFn = @extern(*const fn (*DBusMessage, DBusMessageHeaderField, ?*GLib.Variant) callconv(.c) void, .{ .name = "g_dbus_message_set_header" });
        const ret = cFn(self, arg_header_field, arg_value);
        return ret;
    }
    pub fn setInterface(self: *DBusMessage, arg_value: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*DBusMessage, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_dbus_message_set_interface" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn setMember(self: *DBusMessage, arg_value: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*DBusMessage, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_dbus_message_set_member" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn setMessageType(self: *DBusMessage, arg_type: DBusMessageType) void {
        const cFn = @extern(*const fn (*DBusMessage, DBusMessageType) callconv(.c) void, .{ .name = "g_dbus_message_set_message_type" });
        const ret = cFn(self, arg_type);
        return ret;
    }
    pub fn setNumUnixFds(self: *DBusMessage, arg_value: u32) void {
        const cFn = @extern(*const fn (*DBusMessage, u32) callconv(.c) void, .{ .name = "g_dbus_message_set_num_unix_fds" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn setPath(self: *DBusMessage, arg_value: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*DBusMessage, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_dbus_message_set_path" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn setReplySerial(self: *DBusMessage, arg_value: u32) void {
        const cFn = @extern(*const fn (*DBusMessage, u32) callconv(.c) void, .{ .name = "g_dbus_message_set_reply_serial" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn setSender(self: *DBusMessage, arg_value: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*DBusMessage, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_dbus_message_set_sender" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn setSerial(self: *DBusMessage, arg_serial: u32) void {
        const cFn = @extern(*const fn (*DBusMessage, u32) callconv(.c) void, .{ .name = "g_dbus_message_set_serial" });
        const ret = cFn(self, arg_serial);
        return ret;
    }
    pub fn setSignature(self: *DBusMessage, arg_value: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*DBusMessage, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_dbus_message_set_signature" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn setUnixFdList(self: *DBusMessage, arg_fd_list: ?*UnixFDList) void {
        const cFn = @extern(*const fn (*DBusMessage, ?*UnixFDList) callconv(.c) void, .{ .name = "g_dbus_message_set_unix_fd_list" });
        const ret = cFn(self, arg_fd_list);
        return ret;
    }
    pub fn toBlob(self: *DBusMessage, arg_capabilities: DBusCapabilityFlags, arg_error: *?*GLib.Error) error{GError}![]u8 {
        var argO_out_size: u64 = undefined;
        const arg_out_size: *u64 = &argO_out_size;
        const cFn = @extern(*const fn (*DBusMessage, *u64, DBusCapabilityFlags, *?*GLib.Error) callconv(.c) [*]u8, .{ .name = "g_dbus_message_to_blob" });
        const ret = cFn(self, arg_out_size, arg_capabilities, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret[0..@intCast(argO_out_size)];
    }
    pub fn toGerror(self: *DBusMessage, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DBusMessage, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dbus_message_to_gerror" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_message_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusMessageByteOrder = enum(u32) {
    big_endian = 66,
    little_endian = 108,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_message_byte_order_get_type" });
        return cFn();
    }
};
pub const DBusMessageFilterFunction = *const fn (arg_connection: *DBusConnection, arg_message: *DBusMessage, arg_incoming: bool, arg_user_data: ?*anyopaque) callconv(.c) ?*DBusMessage;
pub const DBusMessageFlags = packed struct(u32) {
    no_reply_expected: bool = false,
    no_auto_start: bool = false,
    allow_interactive_authorization: bool = false,
    _: u29 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_message_flags_get_type" });
        return cFn();
    }
};
pub const DBusMessageHeaderField = enum(u32) {
    invalid = 0,
    path = 1,
    interface = 2,
    member = 3,
    error_name = 4,
    reply_serial = 5,
    destination = 6,
    sender = 7,
    signature = 8,
    num_unix_fds = 9,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_message_header_field_get_type" });
        return cFn();
    }
};
pub const DBusMessageType = enum(u32) {
    invalid = 0,
    method_call = 1,
    method_return = 2,
    @"error" = 3,
    signal = 4,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_message_type_get_type" });
        return cFn();
    }
};
pub const DBusMethodInfo = extern struct {
    ref_count: i32,
    name: ?[*:0]const u8,
    in_args: ?[*:null]?*DBusArgInfo,
    out_args: ?[*:null]?*DBusArgInfo,
    annotations: ?[*:null]?*DBusAnnotationInfo,
    pub fn ref(self: *DBusMethodInfo) *DBusMethodInfo {
        const cFn = @extern(*const fn (*DBusMethodInfo) callconv(.c) *DBusMethodInfo, .{ .name = "g_dbus_method_info_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *DBusMethodInfo) void {
        const cFn = @extern(*const fn (*DBusMethodInfo) callconv(.c) void, .{ .name = "g_dbus_method_info_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_method_info_get_type" });
        return cFn();
    }
};
pub const DBusMethodInvocation = struct {
    pub const Parent = GObject.Object;
    pub fn getConnection(self: *DBusMethodInvocation) *DBusConnection {
        const cFn = @extern(*const fn (*DBusMethodInvocation) callconv(.c) *DBusConnection, .{ .name = "g_dbus_method_invocation_get_connection" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInterfaceName(self: *DBusMethodInvocation) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DBusMethodInvocation) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_method_invocation_get_interface_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMessage(self: *DBusMethodInvocation) *DBusMessage {
        const cFn = @extern(*const fn (*DBusMethodInvocation) callconv(.c) *DBusMessage, .{ .name = "g_dbus_method_invocation_get_message" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMethodInfo(self: *DBusMethodInvocation) ?*DBusMethodInfo {
        const cFn = @extern(*const fn (*DBusMethodInvocation) callconv(.c) ?*DBusMethodInfo, .{ .name = "g_dbus_method_invocation_get_method_info" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMethodName(self: *DBusMethodInvocation) [*:0]u8 {
        const cFn = @extern(*const fn (*DBusMethodInvocation) callconv(.c) [*:0]u8, .{ .name = "g_dbus_method_invocation_get_method_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getObjectPath(self: *DBusMethodInvocation) [*:0]u8 {
        const cFn = @extern(*const fn (*DBusMethodInvocation) callconv(.c) [*:0]u8, .{ .name = "g_dbus_method_invocation_get_object_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getParameters(self: *DBusMethodInvocation) *GLib.Variant {
        const cFn = @extern(*const fn (*DBusMethodInvocation) callconv(.c) *GLib.Variant, .{ .name = "g_dbus_method_invocation_get_parameters" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPropertyInfo(self: *DBusMethodInvocation) ?*DBusPropertyInfo {
        const cFn = @extern(*const fn (*DBusMethodInvocation) callconv(.c) ?*DBusPropertyInfo, .{ .name = "g_dbus_method_invocation_get_property_info" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSender(self: *DBusMethodInvocation) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DBusMethodInvocation) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_method_invocation_get_sender" });
        const ret = cFn(self);
        return ret;
    }
    pub fn returnDbusError(self: *DBusMethodInvocation, arg_error_name: [*:0]const u8, arg_error_message: [*:0]const u8) void {
        const cFn = @extern(*const fn (*DBusMethodInvocation, [*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_dbus_method_invocation_return_dbus_error" });
        const ret = cFn(self, arg_error_name, arg_error_message);
        return ret;
    }
    pub fn returnErrorLiteral(self: *DBusMethodInvocation, arg_domain: u32, arg_code: i32, arg_message: [*:0]const u8) void {
        const cFn = @extern(*const fn (*DBusMethodInvocation, u32, i32, [*:0]const u8) callconv(.c) void, .{ .name = "g_dbus_method_invocation_return_error_literal" });
        const ret = cFn(self, arg_domain, arg_code, arg_message);
        return ret;
    }
    pub fn returnGerror(self: *DBusMethodInvocation, arg_error: *GLib.Error) void {
        const cFn = @extern(*const fn (*DBusMethodInvocation, *GLib.Error) callconv(.c) void, .{ .name = "g_dbus_method_invocation_return_gerror" });
        const ret = cFn(self, arg_error);
        return ret;
    }
    pub fn returnValue(self: *DBusMethodInvocation, arg_parameters: ?*GLib.Variant) void {
        const cFn = @extern(*const fn (*DBusMethodInvocation, ?*GLib.Variant) callconv(.c) void, .{ .name = "g_dbus_method_invocation_return_value" });
        const ret = cFn(self, arg_parameters);
        return ret;
    }
    pub fn returnValueWithUnixFdList(self: *DBusMethodInvocation, arg_parameters: ?*GLib.Variant, arg_fd_list: ?*UnixFDList) void {
        const cFn = @extern(*const fn (*DBusMethodInvocation, ?*GLib.Variant, ?*UnixFDList) callconv(.c) void, .{ .name = "g_dbus_method_invocation_return_value_with_unix_fd_list" });
        const ret = cFn(self, arg_parameters, arg_fd_list);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_method_invocation_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusNodeInfo = extern struct {
    ref_count: i32,
    path: ?[*:0]const u8,
    interfaces: ?[*:null]?*DBusInterfaceInfo,
    nodes: ?[*:null]?*DBusNodeInfo,
    annotations: ?[*:null]?*DBusAnnotationInfo,
    pub fn newForXml(arg_xml_data: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*DBusNodeInfo {
        const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) *DBusNodeInfo, .{ .name = "g_dbus_node_info_new_for_xml" });
        const ret = cFn(arg_xml_data, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn generateXml(self: *DBusNodeInfo, arg_indent: u32, arg_string_builder: *GLib.String) void {
        const cFn = @extern(*const fn (*DBusNodeInfo, u32, *GLib.String) callconv(.c) void, .{ .name = "g_dbus_node_info_generate_xml" });
        const ret = cFn(self, arg_indent, arg_string_builder);
        return ret;
    }
    pub fn lookupInterface(self: *DBusNodeInfo, arg_name: [*:0]const u8) ?*DBusInterfaceInfo {
        const cFn = @extern(*const fn (*DBusNodeInfo, [*:0]const u8) callconv(.c) ?*DBusInterfaceInfo, .{ .name = "g_dbus_node_info_lookup_interface" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn ref(self: *DBusNodeInfo) *DBusNodeInfo {
        const cFn = @extern(*const fn (*DBusNodeInfo) callconv(.c) *DBusNodeInfo, .{ .name = "g_dbus_node_info_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *DBusNodeInfo) void {
        const cFn = @extern(*const fn (*DBusNodeInfo) callconv(.c) void, .{ .name = "g_dbus_node_info_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_node_info_get_type" });
        return cFn();
    }
};
pub const DBusObject = struct {
    pub const Class = DBusObjectIface;
    _signals: struct {
        @"interface-added": core.Signal(fn (*DBusObject, *DBusInterface) void, "interface-added") = .{},
        @"interface-removed": core.Signal(fn (*DBusObject, *DBusInterface) void, "interface-removed") = .{},
    },
    pub fn getInterface(self: *DBusObject, arg_interface_name: [*:0]const u8) ?*DBusInterface {
        const cFn = @extern(*const fn (*DBusObject, [*:0]const u8) callconv(.c) ?*DBusInterface, .{ .name = "g_dbus_object_get_interface" });
        const ret = cFn(self, arg_interface_name);
        return ret;
    }
    pub fn getInterfaces(self: *DBusObject) ?*GLib.List {
        const cFn = @extern(*const fn (*DBusObject) callconv(.c) ?*GLib.List, .{ .name = "g_dbus_object_get_interfaces" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getObjectPath(self: *DBusObject) [*:0]u8 {
        const cFn = @extern(*const fn (*DBusObject) callconv(.c) [*:0]u8, .{ .name = "g_dbus_object_get_object_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_object_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusObjectIface = extern struct {
    parent_iface: GObject.TypeInterface,
    get_object_path: ?*const fn (arg_object: *DBusObject) callconv(.c) [*:0]u8,
    get_interfaces: ?*const fn (arg_object: *DBusObject) callconv(.c) ?*GLib.List,
    get_interface: ?*const fn (arg_object: *DBusObject, arg_interface_name: [*:0]const u8) callconv(.c) ?*DBusInterface,
    interface_added: ?*const fn (arg_object: *DBusObject, arg_interface_: *DBusInterface) callconv(.c) void,
    interface_removed: ?*const fn (arg_object: *DBusObject, arg_interface_: *DBusInterface) callconv(.c) void,
};
pub const DBusObjectManager = struct {
    pub const Class = DBusObjectManagerIface;
    _signals: struct {
        @"interface-added": core.Signal(fn (*DBusObjectManager, *DBusObject, *DBusInterface) void, "interface-added") = .{},
        @"interface-removed": core.Signal(fn (*DBusObjectManager, *DBusObject, *DBusInterface) void, "interface-removed") = .{},
        @"object-added": core.Signal(fn (*DBusObjectManager, *DBusObject) void, "object-added") = .{},
        @"object-removed": core.Signal(fn (*DBusObjectManager, *DBusObject) void, "object-removed") = .{},
    },
    pub fn getInterface(self: *DBusObjectManager, arg_object_path: [*:0]const u8, arg_interface_name: [*:0]const u8) ?*DBusInterface {
        const cFn = @extern(*const fn (*DBusObjectManager, [*:0]const u8, [*:0]const u8) callconv(.c) ?*DBusInterface, .{ .name = "g_dbus_object_manager_get_interface" });
        const ret = cFn(self, arg_object_path, arg_interface_name);
        return ret;
    }
    pub fn getObject(self: *DBusObjectManager, arg_object_path: [*:0]const u8) ?*DBusObject {
        const cFn = @extern(*const fn (*DBusObjectManager, [*:0]const u8) callconv(.c) ?*DBusObject, .{ .name = "g_dbus_object_manager_get_object" });
        const ret = cFn(self, arg_object_path);
        return ret;
    }
    pub fn getObjectPath(self: *DBusObjectManager) [*:0]u8 {
        const cFn = @extern(*const fn (*DBusObjectManager) callconv(.c) [*:0]u8, .{ .name = "g_dbus_object_manager_get_object_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getObjects(self: *DBusObjectManager) ?*GLib.List {
        const cFn = @extern(*const fn (*DBusObjectManager) callconv(.c) ?*GLib.List, .{ .name = "g_dbus_object_manager_get_objects" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_object_manager_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusObjectManagerClient = extern struct {
    pub const Interfaces = [_]type{ AsyncInitable, DBusObjectManager, Initable };
    pub const Parent = GObject.Object;
    pub const Class = DBusObjectManagerClientClass;
    _props: struct {
        @"bus-type": core.Property(BusType, "bus-type") = .{},
        connection: core.Property(DBusConnection, "connection") = .{},
        flags: core.Property(DBusObjectManagerClientFlags, "flags") = .{},
        @"get-proxy-type-destroy-notify": core.Property(*anyopaque, "get-proxy-type-destroy-notify") = .{},
        @"get-proxy-type-func": core.Property(*anyopaque, "get-proxy-type-func") = .{},
        @"get-proxy-type-user-data": core.Property(*anyopaque, "get-proxy-type-user-data") = .{},
        name: core.Property([*:0]const u8, "name") = .{},
        @"name-owner": core.Property([*:0]const u8, "name-owner") = .{},
        @"object-path": core.Property([*:0]const u8, "object-path") = .{},
    },
    _signals: struct {
        @"interface-proxy-properties-changed": core.Signal(fn (*DBusObjectManagerClient, *DBusObjectProxy, *DBusProxy, *GLib.Variant, [*]?[*:0]const u8) void, "interface-proxy-properties-changed") = .{},
        @"interface-proxy-signal": core.Signal(fn (*DBusObjectManagerClient, *DBusObjectProxy, *DBusProxy, [*:0]const u8, [*:0]const u8, *GLib.Variant) void, "interface-proxy-signal") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*DBusObjectManagerClientPrivate,
    pub fn newFinish(arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*DBusObjectManagerClient {
        const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) *DBusObjectManagerClient, .{ .name = "g_dbus_object_manager_client_new_finish" });
        const ret = cFn(arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newForBusFinish(arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*DBusObjectManagerClient {
        const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) *DBusObjectManagerClient, .{ .name = "g_dbus_object_manager_client_new_for_bus_finish" });
        const ret = cFn(arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newForBusSync(arg_bus_type: BusType, arg_flags: DBusObjectManagerClientFlags, arg_name: [*:0]const u8, arg_object_path: [*:0]const u8, argC_get_proxy_type_func: core.Closure(?DBusProxyTypeFunc), arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*DBusObjectManagerClient {
        const arg_get_proxy_type_func: ?DBusProxyTypeFunc = @ptrCast(argC_get_proxy_type_func.callback());
        const arg_get_proxy_type_user_data: ?*anyopaque = @ptrCast(argC_get_proxy_type_func.data());
        const arg_get_proxy_type_destroy_notify: ?GLib.DestroyNotify = @ptrCast(argC_get_proxy_type_func.destroy());
        const cFn = @extern(*const fn (BusType, DBusObjectManagerClientFlags, [*:0]const u8, [*:0]const u8, ?DBusProxyTypeFunc, ?*anyopaque, ?GLib.DestroyNotify, ?*Cancellable, *?*GLib.Error) callconv(.c) *DBusObjectManagerClient, .{ .name = "g_dbus_object_manager_client_new_for_bus_sync" });
        const ret = cFn(arg_bus_type, arg_flags, arg_name, arg_object_path, arg_get_proxy_type_func, @ptrCast(arg_get_proxy_type_user_data), arg_get_proxy_type_destroy_notify, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newSync(arg_connection: *DBusConnection, arg_flags: DBusObjectManagerClientFlags, arg_name: ?[*:0]const u8, arg_object_path: [*:0]const u8, argC_get_proxy_type_func: core.Closure(?DBusProxyTypeFunc), arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*DBusObjectManagerClient {
        const arg_get_proxy_type_func: ?DBusProxyTypeFunc = @ptrCast(argC_get_proxy_type_func.callback());
        const arg_get_proxy_type_user_data: ?*anyopaque = @ptrCast(argC_get_proxy_type_func.data());
        const arg_get_proxy_type_destroy_notify: ?GLib.DestroyNotify = @ptrCast(argC_get_proxy_type_func.destroy());
        const cFn = @extern(*const fn (*DBusConnection, DBusObjectManagerClientFlags, ?[*:0]const u8, [*:0]const u8, ?DBusProxyTypeFunc, ?*anyopaque, ?GLib.DestroyNotify, ?*Cancellable, *?*GLib.Error) callconv(.c) *DBusObjectManagerClient, .{ .name = "g_dbus_object_manager_client_new_sync" });
        const ret = cFn(arg_connection, arg_flags, arg_name, arg_object_path, arg_get_proxy_type_func, @ptrCast(arg_get_proxy_type_user_data), arg_get_proxy_type_destroy_notify, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn new(arg_connection: *DBusConnection, arg_flags: DBusObjectManagerClientFlags, arg_name: [*:0]const u8, arg_object_path: [*:0]const u8, argC_get_proxy_type_func: core.Closure(?DBusProxyTypeFunc), arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_get_proxy_type_func: ?DBusProxyTypeFunc = @ptrCast(argC_get_proxy_type_func.callback());
        const arg_get_proxy_type_user_data: ?*anyopaque = @ptrCast(argC_get_proxy_type_func.data());
        const arg_get_proxy_type_destroy_notify: ?GLib.DestroyNotify = @ptrCast(argC_get_proxy_type_func.destroy());
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*DBusConnection, DBusObjectManagerClientFlags, [*:0]const u8, [*:0]const u8, ?DBusProxyTypeFunc, ?*anyopaque, ?GLib.DestroyNotify, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dbus_object_manager_client_new" });
        const ret = cFn(arg_connection, arg_flags, arg_name, arg_object_path, arg_get_proxy_type_func, @ptrCast(arg_get_proxy_type_user_data), arg_get_proxy_type_destroy_notify, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn newForBus(arg_bus_type: BusType, arg_flags: DBusObjectManagerClientFlags, arg_name: [*:0]const u8, arg_object_path: [*:0]const u8, argC_get_proxy_type_func: core.Closure(?DBusProxyTypeFunc), arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_get_proxy_type_func: ?DBusProxyTypeFunc = @ptrCast(argC_get_proxy_type_func.callback());
        const arg_get_proxy_type_user_data: ?*anyopaque = @ptrCast(argC_get_proxy_type_func.data());
        const arg_get_proxy_type_destroy_notify: ?GLib.DestroyNotify = @ptrCast(argC_get_proxy_type_func.destroy());
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (BusType, DBusObjectManagerClientFlags, [*:0]const u8, [*:0]const u8, ?DBusProxyTypeFunc, ?*anyopaque, ?GLib.DestroyNotify, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dbus_object_manager_client_new_for_bus" });
        const ret = cFn(arg_bus_type, arg_flags, arg_name, arg_object_path, arg_get_proxy_type_func, @ptrCast(arg_get_proxy_type_user_data), arg_get_proxy_type_destroy_notify, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn getConnection(self: *DBusObjectManagerClient) *DBusConnection {
        const cFn = @extern(*const fn (*DBusObjectManagerClient) callconv(.c) *DBusConnection, .{ .name = "g_dbus_object_manager_client_get_connection" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFlags(self: *DBusObjectManagerClient) DBusObjectManagerClientFlags {
        const cFn = @extern(*const fn (*DBusObjectManagerClient) callconv(.c) DBusObjectManagerClientFlags, .{ .name = "g_dbus_object_manager_client_get_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getName(self: *DBusObjectManagerClient) [*:0]u8 {
        const cFn = @extern(*const fn (*DBusObjectManagerClient) callconv(.c) [*:0]u8, .{ .name = "g_dbus_object_manager_client_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNameOwner(self: *DBusObjectManagerClient) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DBusObjectManagerClient) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_object_manager_client_get_name_owner" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_object_manager_client_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusObjectManagerClientClass = extern struct {
    parent_class: GObject.ObjectClass,
    interface_proxy_signal: ?*const fn (arg_manager: *DBusObjectManagerClient, arg_object_proxy: *DBusObjectProxy, arg_interface_proxy: *DBusProxy, arg_sender_name: [*:0]const u8, arg_signal_name: [*:0]const u8, arg_parameters: *GLib.Variant) callconv(.c) void,
    interface_proxy_properties_changed: ?*const fn (arg_manager: *DBusObjectManagerClient, arg_object_proxy: *DBusObjectProxy, arg_interface_proxy: *DBusProxy, arg_changed_properties: *GLib.Variant, arg_invalidated_properties: [*:0]const u8) callconv(.c) void,
    padding: [8]?*anyopaque,
};
pub const DBusObjectManagerClientFlags = packed struct(u32) {
    do_not_auto_start: bool = false,
    _: u31 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_object_manager_client_flags_get_type" });
        return cFn();
    }
};
pub const DBusObjectManagerClientPrivate = opaque {};
pub const DBusObjectManagerIface = extern struct {
    parent_iface: GObject.TypeInterface,
    get_object_path: ?*const fn (arg_manager: *DBusObjectManager) callconv(.c) [*:0]u8,
    get_objects: ?*const fn (arg_manager: *DBusObjectManager) callconv(.c) ?*GLib.List,
    get_object: ?*const fn (arg_manager: *DBusObjectManager, arg_object_path: [*:0]const u8) callconv(.c) ?*DBusObject,
    get_interface: ?*const fn (arg_manager: *DBusObjectManager, arg_object_path: [*:0]const u8, arg_interface_name: [*:0]const u8) callconv(.c) ?*DBusInterface,
    object_added: ?*const fn (arg_manager: *DBusObjectManager, arg_object: *DBusObject) callconv(.c) void,
    object_removed: ?*const fn (arg_manager: *DBusObjectManager, arg_object: *DBusObject) callconv(.c) void,
    interface_added: ?*const fn (arg_manager: *DBusObjectManager, arg_object: *DBusObject, arg_interface_: *DBusInterface) callconv(.c) void,
    interface_removed: ?*const fn (arg_manager: *DBusObjectManager, arg_object: *DBusObject, arg_interface_: *DBusInterface) callconv(.c) void,
};
pub const DBusObjectManagerServer = extern struct {
    pub const Interfaces = [_]type{DBusObjectManager};
    pub const Parent = GObject.Object;
    pub const Class = DBusObjectManagerServerClass;
    _props: struct {
        connection: core.Property(DBusConnection, "connection") = .{},
        @"object-path": core.Property([*:0]const u8, "object-path") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*DBusObjectManagerServerPrivate,
    pub fn new(arg_object_path: [*:0]const u8) *DBusObjectManagerServer {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *DBusObjectManagerServer, .{ .name = "g_dbus_object_manager_server_new" });
        const ret = cFn(arg_object_path);
        return ret;
    }
    pub fn @"export"(self: *DBusObjectManagerServer, arg_object: *DBusObjectSkeleton) void {
        const cFn = @extern(*const fn (*DBusObjectManagerServer, *DBusObjectSkeleton) callconv(.c) void, .{ .name = "g_dbus_object_manager_server_export" });
        const ret = cFn(self, arg_object);
        return ret;
    }
    pub fn exportUniquely(self: *DBusObjectManagerServer, arg_object: *DBusObjectSkeleton) void {
        const cFn = @extern(*const fn (*DBusObjectManagerServer, *DBusObjectSkeleton) callconv(.c) void, .{ .name = "g_dbus_object_manager_server_export_uniquely" });
        const ret = cFn(self, arg_object);
        return ret;
    }
    pub fn getConnection(self: *DBusObjectManagerServer) ?*DBusConnection {
        const cFn = @extern(*const fn (*DBusObjectManagerServer) callconv(.c) ?*DBusConnection, .{ .name = "g_dbus_object_manager_server_get_connection" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isExported(self: *DBusObjectManagerServer, arg_object: *DBusObjectSkeleton) bool {
        const cFn = @extern(*const fn (*DBusObjectManagerServer, *DBusObjectSkeleton) callconv(.c) bool, .{ .name = "g_dbus_object_manager_server_is_exported" });
        const ret = cFn(self, arg_object);
        return ret;
    }
    pub fn setConnection(self: *DBusObjectManagerServer, arg_connection: ?*DBusConnection) void {
        const cFn = @extern(*const fn (*DBusObjectManagerServer, ?*DBusConnection) callconv(.c) void, .{ .name = "g_dbus_object_manager_server_set_connection" });
        const ret = cFn(self, arg_connection);
        return ret;
    }
    pub fn unexport(self: *DBusObjectManagerServer, arg_object_path: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*DBusObjectManagerServer, [*:0]const u8) callconv(.c) bool, .{ .name = "g_dbus_object_manager_server_unexport" });
        const ret = cFn(self, arg_object_path);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_object_manager_server_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusObjectManagerServerClass = extern struct {
    parent_class: GObject.ObjectClass,
    padding: [8]?*anyopaque,
};
pub const DBusObjectManagerServerPrivate = opaque {};
pub const DBusObjectProxy = extern struct {
    pub const Interfaces = [_]type{DBusObject};
    pub const Parent = GObject.Object;
    pub const Class = DBusObjectProxyClass;
    _props: struct {
        @"g-connection": core.Property(DBusConnection, "g-connection") = .{},
        @"g-object-path": core.Property([*:0]const u8, "g-object-path") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*DBusObjectProxyPrivate,
    pub fn new(arg_connection: *DBusConnection, arg_object_path: [*:0]const u8) *DBusObjectProxy {
        const cFn = @extern(*const fn (*DBusConnection, [*:0]const u8) callconv(.c) *DBusObjectProxy, .{ .name = "g_dbus_object_proxy_new" });
        const ret = cFn(arg_connection, arg_object_path);
        return ret;
    }
    pub fn getConnection(self: *DBusObjectProxy) *DBusConnection {
        const cFn = @extern(*const fn (*DBusObjectProxy) callconv(.c) *DBusConnection, .{ .name = "g_dbus_object_proxy_get_connection" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_object_proxy_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusObjectProxyClass = extern struct {
    parent_class: GObject.ObjectClass,
    padding: [8]?*anyopaque,
};
pub const DBusObjectProxyPrivate = opaque {};
pub const DBusObjectSkeleton = extern struct {
    pub const Interfaces = [_]type{DBusObject};
    pub const Parent = GObject.Object;
    pub const Class = DBusObjectSkeletonClass;
    _props: struct {
        @"g-object-path": core.Property([*:0]const u8, "g-object-path") = .{},
    },
    _signals: struct {
        @"authorize-method": core.Signal(fn (*DBusObjectSkeleton, *DBusInterfaceSkeleton, *DBusMethodInvocation) bool, "authorize-method") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*DBusObjectSkeletonPrivate,
    pub fn new(arg_object_path: [*:0]const u8) *DBusObjectSkeleton {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *DBusObjectSkeleton, .{ .name = "g_dbus_object_skeleton_new" });
        const ret = cFn(arg_object_path);
        return ret;
    }
    pub fn addInterface(self: *DBusObjectSkeleton, arg_interface_: *DBusInterfaceSkeleton) void {
        const cFn = @extern(*const fn (*DBusObjectSkeleton, *DBusInterfaceSkeleton) callconv(.c) void, .{ .name = "g_dbus_object_skeleton_add_interface" });
        const ret = cFn(self, arg_interface_);
        return ret;
    }
    pub fn flush(self: *DBusObjectSkeleton) void {
        const cFn = @extern(*const fn (*DBusObjectSkeleton) callconv(.c) void, .{ .name = "g_dbus_object_skeleton_flush" });
        const ret = cFn(self);
        return ret;
    }
    pub fn removeInterface(self: *DBusObjectSkeleton, arg_interface_: *DBusInterfaceSkeleton) void {
        const cFn = @extern(*const fn (*DBusObjectSkeleton, *DBusInterfaceSkeleton) callconv(.c) void, .{ .name = "g_dbus_object_skeleton_remove_interface" });
        const ret = cFn(self, arg_interface_);
        return ret;
    }
    pub fn removeInterfaceByName(self: *DBusObjectSkeleton, arg_interface_name: [*:0]const u8) void {
        const cFn = @extern(*const fn (*DBusObjectSkeleton, [*:0]const u8) callconv(.c) void, .{ .name = "g_dbus_object_skeleton_remove_interface_by_name" });
        const ret = cFn(self, arg_interface_name);
        return ret;
    }
    pub fn setObjectPath(self: *DBusObjectSkeleton, arg_object_path: [*:0]const u8) void {
        const cFn = @extern(*const fn (*DBusObjectSkeleton, [*:0]const u8) callconv(.c) void, .{ .name = "g_dbus_object_skeleton_set_object_path" });
        const ret = cFn(self, arg_object_path);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_object_skeleton_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusObjectSkeletonClass = extern struct {
    parent_class: GObject.ObjectClass,
    authorize_method: ?*const fn (arg_object: *DBusObjectSkeleton, arg_interface_: *DBusInterfaceSkeleton, arg_invocation: *DBusMethodInvocation) callconv(.c) bool,
    padding: [8]?*anyopaque,
};
pub const DBusObjectSkeletonPrivate = opaque {};
pub const DBusPropertyInfo = extern struct {
    ref_count: i32,
    name: ?[*:0]const u8,
    signature: ?[*:0]const u8,
    flags: DBusPropertyInfoFlags,
    annotations: ?[*:null]?*DBusAnnotationInfo,
    pub fn ref(self: *DBusPropertyInfo) *DBusPropertyInfo {
        const cFn = @extern(*const fn (*DBusPropertyInfo) callconv(.c) *DBusPropertyInfo, .{ .name = "g_dbus_property_info_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *DBusPropertyInfo) void {
        const cFn = @extern(*const fn (*DBusPropertyInfo) callconv(.c) void, .{ .name = "g_dbus_property_info_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_property_info_get_type" });
        return cFn();
    }
};
pub const DBusPropertyInfoFlags = packed struct(u32) {
    readable: bool = false,
    writable: bool = false,
    _: u30 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_property_info_flags_get_type" });
        return cFn();
    }
};
pub const DBusProxy = extern struct {
    pub const Interfaces = [_]type{ AsyncInitable, DBusInterface, Initable };
    pub const Parent = GObject.Object;
    pub const Class = DBusProxyClass;
    _props: struct {
        @"g-bus-type": core.Property(BusType, "g-bus-type") = .{},
        @"g-connection": core.Property(DBusConnection, "g-connection") = .{},
        @"g-default-timeout": core.Property(i32, "g-default-timeout") = .{},
        @"g-flags": core.Property(DBusProxyFlags, "g-flags") = .{},
        @"g-interface-info": core.Property(DBusInterfaceInfo, "g-interface-info") = .{},
        @"g-interface-name": core.Property([*:0]const u8, "g-interface-name") = .{},
        @"g-name": core.Property([*:0]const u8, "g-name") = .{},
        @"g-name-owner": core.Property([*:0]const u8, "g-name-owner") = .{},
        @"g-object-path": core.Property([*:0]const u8, "g-object-path") = .{},
    },
    _signals: struct {
        @"g-properties-changed": core.Signal(fn (*DBusProxy, *GLib.Variant, [*]?[*:0]const u8) void, "g-properties-changed") = .{},
        @"g-signal": core.Signal(fn (*DBusProxy, ?[*:0]const u8, [*:0]const u8, *GLib.Variant) void, "g-signal") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*DBusProxyPrivate,
    pub fn newFinish(arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*DBusProxy {
        const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) *DBusProxy, .{ .name = "g_dbus_proxy_new_finish" });
        const ret = cFn(arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newForBusFinish(arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*DBusProxy {
        const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) *DBusProxy, .{ .name = "g_dbus_proxy_new_for_bus_finish" });
        const ret = cFn(arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newForBusSync(arg_bus_type: BusType, arg_flags: DBusProxyFlags, arg_info: ?*DBusInterfaceInfo, arg_name: [*:0]const u8, arg_object_path: [*:0]const u8, arg_interface_name: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*DBusProxy {
        const cFn = @extern(*const fn (BusType, DBusProxyFlags, ?*DBusInterfaceInfo, [*:0]const u8, [*:0]const u8, [*:0]const u8, ?*Cancellable, *?*GLib.Error) callconv(.c) *DBusProxy, .{ .name = "g_dbus_proxy_new_for_bus_sync" });
        const ret = cFn(arg_bus_type, arg_flags, arg_info, arg_name, arg_object_path, arg_interface_name, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newSync(arg_connection: *DBusConnection, arg_flags: DBusProxyFlags, arg_info: ?*DBusInterfaceInfo, arg_name: ?[*:0]const u8, arg_object_path: [*:0]const u8, arg_interface_name: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*DBusProxy {
        const cFn = @extern(*const fn (*DBusConnection, DBusProxyFlags, ?*DBusInterfaceInfo, ?[*:0]const u8, [*:0]const u8, [*:0]const u8, ?*Cancellable, *?*GLib.Error) callconv(.c) *DBusProxy, .{ .name = "g_dbus_proxy_new_sync" });
        const ret = cFn(arg_connection, arg_flags, arg_info, arg_name, arg_object_path, arg_interface_name, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn new(arg_connection: *DBusConnection, arg_flags: DBusProxyFlags, arg_info: ?*DBusInterfaceInfo, arg_name: ?[*:0]const u8, arg_object_path: [*:0]const u8, arg_interface_name: [*:0]const u8, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*DBusConnection, DBusProxyFlags, ?*DBusInterfaceInfo, ?[*:0]const u8, [*:0]const u8, [*:0]const u8, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dbus_proxy_new" });
        const ret = cFn(arg_connection, arg_flags, arg_info, arg_name, arg_object_path, arg_interface_name, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn newForBus(arg_bus_type: BusType, arg_flags: DBusProxyFlags, arg_info: ?*DBusInterfaceInfo, arg_name: [*:0]const u8, arg_object_path: [*:0]const u8, arg_interface_name: [*:0]const u8, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (BusType, DBusProxyFlags, ?*DBusInterfaceInfo, [*:0]const u8, [*:0]const u8, [*:0]const u8, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dbus_proxy_new_for_bus" });
        const ret = cFn(arg_bus_type, arg_flags, arg_info, arg_name, arg_object_path, arg_interface_name, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn call(self: *DBusProxy, arg_method_name: [*:0]const u8, arg_parameters: ?*GLib.Variant, arg_flags: DBusCallFlags, arg_timeout_msec: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*DBusProxy, [*:0]const u8, ?*GLib.Variant, DBusCallFlags, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dbus_proxy_call" });
        const ret = cFn(self, arg_method_name, arg_parameters, arg_flags, arg_timeout_msec, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn callFinish(self: *DBusProxy, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*GLib.Variant {
        const cFn = @extern(*const fn (*DBusProxy, *AsyncResult, *?*GLib.Error) callconv(.c) *GLib.Variant, .{ .name = "g_dbus_proxy_call_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn callSync(self: *DBusProxy, arg_method_name: [*:0]const u8, arg_parameters: ?*GLib.Variant, arg_flags: DBusCallFlags, arg_timeout_msec: i32, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*GLib.Variant {
        const cFn = @extern(*const fn (*DBusProxy, [*:0]const u8, ?*GLib.Variant, DBusCallFlags, i32, ?*Cancellable, *?*GLib.Error) callconv(.c) *GLib.Variant, .{ .name = "g_dbus_proxy_call_sync" });
        const ret = cFn(self, arg_method_name, arg_parameters, arg_flags, arg_timeout_msec, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn callWithUnixFdList(self: *DBusProxy, arg_method_name: [*:0]const u8, arg_parameters: ?*GLib.Variant, arg_flags: DBusCallFlags, arg_timeout_msec: i32, arg_fd_list: ?*UnixFDList, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*DBusProxy, [*:0]const u8, ?*GLib.Variant, DBusCallFlags, i32, ?*UnixFDList, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dbus_proxy_call_with_unix_fd_list" });
        const ret = cFn(self, arg_method_name, arg_parameters, arg_flags, arg_timeout_msec, arg_fd_list, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn callWithUnixFdListFinish(self: *DBusProxy, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *GLib.Variant,
        out_fd_list: ?*UnixFDList,
    } {
        var argO_out_fd_list: ?*UnixFDList = undefined;
        const arg_out_fd_list: ?*?*UnixFDList = &argO_out_fd_list;
        const cFn = @extern(*const fn (*DBusProxy, ?*?*UnixFDList, *AsyncResult, *?*GLib.Error) callconv(.c) *GLib.Variant, .{ .name = "g_dbus_proxy_call_with_unix_fd_list_finish" });
        const ret = cFn(self, arg_out_fd_list, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .out_fd_list = argO_out_fd_list };
    }
    pub fn callWithUnixFdListSync(self: *DBusProxy, arg_method_name: [*:0]const u8, arg_parameters: ?*GLib.Variant, arg_flags: DBusCallFlags, arg_timeout_msec: i32, arg_fd_list: ?*UnixFDList, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *GLib.Variant,
        out_fd_list: ?*UnixFDList,
    } {
        var argO_out_fd_list: ?*UnixFDList = undefined;
        const arg_out_fd_list: ?*?*UnixFDList = &argO_out_fd_list;
        const cFn = @extern(*const fn (*DBusProxy, [*:0]const u8, ?*GLib.Variant, DBusCallFlags, i32, ?*UnixFDList, ?*?*UnixFDList, ?*Cancellable, *?*GLib.Error) callconv(.c) *GLib.Variant, .{ .name = "g_dbus_proxy_call_with_unix_fd_list_sync" });
        const ret = cFn(self, arg_method_name, arg_parameters, arg_flags, arg_timeout_msec, arg_fd_list, arg_out_fd_list, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .out_fd_list = argO_out_fd_list };
    }
    pub fn getCachedProperty(self: *DBusProxy, arg_property_name: [*:0]const u8) ?*GLib.Variant {
        const cFn = @extern(*const fn (*DBusProxy, [*:0]const u8) callconv(.c) ?*GLib.Variant, .{ .name = "g_dbus_proxy_get_cached_property" });
        const ret = cFn(self, arg_property_name);
        return ret;
    }
    pub fn getCachedPropertyNames(self: *DBusProxy) ?[*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*DBusProxy) callconv(.c) ?[*]?[*:0]const u8, .{ .name = "g_dbus_proxy_get_cached_property_names" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getConnection(self: *DBusProxy) *DBusConnection {
        const cFn = @extern(*const fn (*DBusProxy) callconv(.c) *DBusConnection, .{ .name = "g_dbus_proxy_get_connection" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDefaultTimeout(self: *DBusProxy) i32 {
        const cFn = @extern(*const fn (*DBusProxy) callconv(.c) i32, .{ .name = "g_dbus_proxy_get_default_timeout" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFlags(self: *DBusProxy) DBusProxyFlags {
        const cFn = @extern(*const fn (*DBusProxy) callconv(.c) DBusProxyFlags, .{ .name = "g_dbus_proxy_get_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInterfaceInfo(self: *DBusProxy) ?*DBusInterfaceInfo {
        const cFn = @extern(*const fn (*DBusProxy) callconv(.c) ?*DBusInterfaceInfo, .{ .name = "g_dbus_proxy_get_interface_info" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInterfaceName(self: *DBusProxy) [*:0]u8 {
        const cFn = @extern(*const fn (*DBusProxy) callconv(.c) [*:0]u8, .{ .name = "g_dbus_proxy_get_interface_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getName(self: *DBusProxy) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DBusProxy) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_proxy_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNameOwner(self: *DBusProxy) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DBusProxy) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_proxy_get_name_owner" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getObjectPath(self: *DBusProxy) [*:0]u8 {
        const cFn = @extern(*const fn (*DBusProxy) callconv(.c) [*:0]u8, .{ .name = "g_dbus_proxy_get_object_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setCachedProperty(self: *DBusProxy, arg_property_name: [*:0]const u8, arg_value: ?*GLib.Variant) void {
        const cFn = @extern(*const fn (*DBusProxy, [*:0]const u8, ?*GLib.Variant) callconv(.c) void, .{ .name = "g_dbus_proxy_set_cached_property" });
        const ret = cFn(self, arg_property_name, arg_value);
        return ret;
    }
    pub fn setDefaultTimeout(self: *DBusProxy, arg_timeout_msec: i32) void {
        const cFn = @extern(*const fn (*DBusProxy, i32) callconv(.c) void, .{ .name = "g_dbus_proxy_set_default_timeout" });
        const ret = cFn(self, arg_timeout_msec);
        return ret;
    }
    pub fn setInterfaceInfo(self: *DBusProxy, arg_info: ?*DBusInterfaceInfo) void {
        const cFn = @extern(*const fn (*DBusProxy, ?*DBusInterfaceInfo) callconv(.c) void, .{ .name = "g_dbus_proxy_set_interface_info" });
        const ret = cFn(self, arg_info);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_proxy_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusProxyClass = extern struct {
    parent_class: GObject.ObjectClass,
    g_properties_changed: ?*const fn (arg_proxy: *DBusProxy, arg_changed_properties: *GLib.Variant, arg_invalidated_properties: [*:0]const u8) callconv(.c) void,
    g_signal: ?*const fn (arg_proxy: *DBusProxy, arg_sender_name: [*:0]const u8, arg_signal_name: [*:0]const u8, arg_parameters: *GLib.Variant) callconv(.c) void,
    padding: [32]?*anyopaque,
};
pub const DBusProxyFlags = packed struct(u32) {
    do_not_load_properties: bool = false,
    do_not_connect_signals: bool = false,
    do_not_auto_start: bool = false,
    get_invalidated_properties: bool = false,
    do_not_auto_start_at_construction: bool = false,
    no_match_rule: bool = false,
    _: u26 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_proxy_flags_get_type" });
        return cFn();
    }
};
pub const DBusProxyPrivate = opaque {};
pub const DBusProxyTypeFunc = *const fn (arg_manager: *DBusObjectManagerClient, arg_object_path: [*:0]const u8, arg_interface_name: ?[*:0]const u8, arg_data: ?*anyopaque) callconv(.c) core.Type;
pub const DBusSendMessageFlags = packed struct(u32) {
    preserve_serial: bool = false,
    _: u31 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_send_message_flags_get_type" });
        return cFn();
    }
};
pub const DBusServer = struct {
    pub const Interfaces = [_]type{Initable};
    pub const Parent = GObject.Object;
    _props: struct {
        active: core.Property(bool, "active") = .{},
        address: core.Property([*:0]const u8, "address") = .{},
        @"authentication-observer": core.Property(DBusAuthObserver, "authentication-observer") = .{},
        @"client-address": core.Property([*:0]const u8, "client-address") = .{},
        flags: core.Property(DBusServerFlags, "flags") = .{},
        guid: core.Property([*:0]const u8, "guid") = .{},
    },
    _signals: struct {
        @"new-connection": core.Signal(fn (*DBusServer, *DBusConnection) bool, "new-connection") = .{},
    },
    pub fn newSync(arg_address: [*:0]const u8, arg_flags: DBusServerFlags, arg_guid: [*:0]const u8, arg_observer: ?*DBusAuthObserver, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*DBusServer {
        const cFn = @extern(*const fn ([*:0]const u8, DBusServerFlags, [*:0]const u8, ?*DBusAuthObserver, ?*Cancellable, *?*GLib.Error) callconv(.c) *DBusServer, .{ .name = "g_dbus_server_new_sync" });
        const ret = cFn(arg_address, arg_flags, arg_guid, arg_observer, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getClientAddress(self: *DBusServer) [*:0]u8 {
        const cFn = @extern(*const fn (*DBusServer) callconv(.c) [*:0]u8, .{ .name = "g_dbus_server_get_client_address" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFlags(self: *DBusServer) DBusServerFlags {
        const cFn = @extern(*const fn (*DBusServer) callconv(.c) DBusServerFlags, .{ .name = "g_dbus_server_get_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getGuid(self: *DBusServer) [*:0]u8 {
        const cFn = @extern(*const fn (*DBusServer) callconv(.c) [*:0]u8, .{ .name = "g_dbus_server_get_guid" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isActive(self: *DBusServer) bool {
        const cFn = @extern(*const fn (*DBusServer) callconv(.c) bool, .{ .name = "g_dbus_server_is_active" });
        const ret = cFn(self);
        return ret;
    }
    pub fn start(self: *DBusServer) void {
        const cFn = @extern(*const fn (*DBusServer) callconv(.c) void, .{ .name = "g_dbus_server_start" });
        const ret = cFn(self);
        return ret;
    }
    pub fn stop(self: *DBusServer) void {
        const cFn = @extern(*const fn (*DBusServer) callconv(.c) void, .{ .name = "g_dbus_server_stop" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_server_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DBusServerFlags = packed struct(u32) {
    run_in_thread: bool = false,
    authentication_allow_anonymous: bool = false,
    authentication_require_same_user: bool = false,
    _: u29 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_server_flags_get_type" });
        return cFn();
    }
};
pub const DBusSignalCallback = *const fn (arg_connection: *DBusConnection, arg_sender_name: ?[*:0]const u8, arg_object_path: [*:0]const u8, arg_interface_name: [*:0]const u8, arg_signal_name: [*:0]const u8, arg_parameters: *GLib.Variant, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const DBusSignalFlags = packed struct(u32) {
    no_match_rule: bool = false,
    match_arg0_namespace: bool = false,
    match_arg0_path: bool = false,
    _: u29 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_signal_flags_get_type" });
        return cFn();
    }
};
pub const DBusSignalInfo = extern struct {
    ref_count: i32,
    name: ?[*:0]const u8,
    args: ?[*:null]?*DBusArgInfo,
    annotations: ?[*:null]?*DBusAnnotationInfo,
    pub fn ref(self: *DBusSignalInfo) *DBusSignalInfo {
        const cFn = @extern(*const fn (*DBusSignalInfo) callconv(.c) *DBusSignalInfo, .{ .name = "g_dbus_signal_info_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *DBusSignalInfo) void {
        const cFn = @extern(*const fn (*DBusSignalInfo) callconv(.c) void, .{ .name = "g_dbus_signal_info_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_signal_info_get_type" });
        return cFn();
    }
};
pub const DBusSubtreeDispatchFunc = *const fn (arg_connection: *DBusConnection, arg_sender: [*:0]const u8, arg_object_path: [*:0]const u8, arg_interface_name: [*:0]const u8, arg_node: [*:0]const u8, arg_out_user_data: *anyopaque, arg_user_data: ?*anyopaque) callconv(.c) ?*DBusInterfaceVTable;
pub const DBusSubtreeEnumerateFunc = *const fn (arg_connection: *DBusConnection, arg_sender: [*:0]const u8, arg_object_path: [*:0]const u8, arg_user_data: ?*anyopaque) callconv(.c) [*]?[*:0]const u8;
pub const DBusSubtreeFlags = packed struct(u32) {
    dispatch_to_unenumerated_nodes: bool = false,
    _: u31 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dbus_subtree_flags_get_type" });
        return cFn();
    }
};
pub const DBusSubtreeIntrospectFunc = *const fn (arg_connection: *DBusConnection, arg_sender: [*:0]const u8, arg_object_path: [*:0]const u8, arg_node: [*:0]const u8, arg_user_data: ?*anyopaque) callconv(.c) ?[*:null]?*DBusInterfaceInfo;
pub const DBusSubtreeVTable = extern struct {
    enumerate: ?DBusSubtreeEnumerateFunc,
    introspect: ?DBusSubtreeIntrospectFunc,
    dispatch: ?DBusSubtreeDispatchFunc,
    padding: [8]?*anyopaque,
};
pub const DEBUG_CONTROLLER_EXTENSION_POINT_NAME = "gio-debug-controller";
pub const DESKTOP_APP_INFO_LOOKUP_EXTENSION_POINT_NAME = "gio-desktop-app-info-lookup";
pub const DRIVE_IDENTIFIER_KIND_UNIX_DEVICE = "unix-device";
pub const DataInputStream = extern struct {
    pub const Interfaces = [_]type{Seekable};
    pub const Parent = BufferedInputStream;
    pub const Class = DataInputStreamClass;
    _props: struct {
        @"byte-order": core.Property(DataStreamByteOrder, "byte-order") = .{},
        @"newline-type": core.Property(DataStreamNewlineType, "newline-type") = .{},
    },
    parent_instance: BufferedInputStream,
    priv: ?*DataInputStreamPrivate,
    pub fn new(arg_base_stream: *InputStream) *DataInputStream {
        const cFn = @extern(*const fn (*InputStream) callconv(.c) *DataInputStream, .{ .name = "g_data_input_stream_new" });
        const ret = cFn(arg_base_stream);
        return ret;
    }
    pub fn getByteOrder(self: *DataInputStream) DataStreamByteOrder {
        const cFn = @extern(*const fn (*DataInputStream) callconv(.c) DataStreamByteOrder, .{ .name = "g_data_input_stream_get_byte_order" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNewlineType(self: *DataInputStream) DataStreamNewlineType {
        const cFn = @extern(*const fn (*DataInputStream) callconv(.c) DataStreamNewlineType, .{ .name = "g_data_input_stream_get_newline_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn readByte(self: *DataInputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!u8 {
        const cFn = @extern(*const fn (*DataInputStream, ?*Cancellable, *?*GLib.Error) callconv(.c) u8, .{ .name = "g_data_input_stream_read_byte" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn readInt16(self: *DataInputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i16 {
        const cFn = @extern(*const fn (*DataInputStream, ?*Cancellable, *?*GLib.Error) callconv(.c) i16, .{ .name = "g_data_input_stream_read_int16" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn readInt32(self: *DataInputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i32 {
        const cFn = @extern(*const fn (*DataInputStream, ?*Cancellable, *?*GLib.Error) callconv(.c) i32, .{ .name = "g_data_input_stream_read_int32" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn readInt64(self: *DataInputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*DataInputStream, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_data_input_stream_read_int64" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn readLine(self: *DataInputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: ?[*:0]u8,
        length: u64,
    } {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*DataInputStream, ?*u64, ?*Cancellable, *?*GLib.Error) callconv(.c) ?[*:0]u8, .{ .name = "g_data_input_stream_read_line" });
        const ret = cFn(self, arg_length, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .length = argO_length };
    }
    pub fn readLineAsync(self: *DataInputStream, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*DataInputStream, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_data_input_stream_read_line_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn readLineFinish(self: *DataInputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: ?[*:0]u8,
        length: u64,
    } {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*DataInputStream, *AsyncResult, ?*u64, *?*GLib.Error) callconv(.c) ?[*:0]u8, .{ .name = "g_data_input_stream_read_line_finish" });
        const ret = cFn(self, arg_result, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .length = argO_length };
    }
    pub fn readLineFinishUtf8(self: *DataInputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: ?[*:0]u8,
        length: u64,
    } {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*DataInputStream, *AsyncResult, ?*u64, *?*GLib.Error) callconv(.c) ?[*:0]u8, .{ .name = "g_data_input_stream_read_line_finish_utf8" });
        const ret = cFn(self, arg_result, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .length = argO_length };
    }
    pub fn readLineUtf8(self: *DataInputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: ?[*:0]u8,
        length: u64,
    } {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*DataInputStream, ?*u64, ?*Cancellable, *?*GLib.Error) callconv(.c) ?[*:0]u8, .{ .name = "g_data_input_stream_read_line_utf8" });
        const ret = cFn(self, arg_length, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .length = argO_length };
    }
    pub fn readUint16(self: *DataInputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!u16 {
        const cFn = @extern(*const fn (*DataInputStream, ?*Cancellable, *?*GLib.Error) callconv(.c) u16, .{ .name = "g_data_input_stream_read_uint16" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn readUint32(self: *DataInputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!u32 {
        const cFn = @extern(*const fn (*DataInputStream, ?*Cancellable, *?*GLib.Error) callconv(.c) u32, .{ .name = "g_data_input_stream_read_uint32" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn readUint64(self: *DataInputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!u64 {
        const cFn = @extern(*const fn (*DataInputStream, ?*Cancellable, *?*GLib.Error) callconv(.c) u64, .{ .name = "g_data_input_stream_read_uint64" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn readUntil(self: *DataInputStream, arg_stop_chars: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: [*:0]u8,
        length: u64,
    } {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*DataInputStream, [*:0]const u8, ?*u64, ?*Cancellable, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_data_input_stream_read_until" });
        const ret = cFn(self, arg_stop_chars, arg_length, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .length = argO_length };
    }
    pub fn readUntilAsync(self: *DataInputStream, arg_stop_chars: [*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*DataInputStream, [*:0]const u8, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_data_input_stream_read_until_async" });
        const ret = cFn(self, arg_stop_chars, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn readUntilFinish(self: *DataInputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: [*:0]u8,
        length: u64,
    } {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*DataInputStream, *AsyncResult, ?*u64, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_data_input_stream_read_until_finish" });
        const ret = cFn(self, arg_result, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .length = argO_length };
    }
    pub fn readUpto(self: *DataInputStream, arg_stop_chars: [*:0]const u8, arg_stop_chars_len: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: [*:0]u8,
        length: u64,
    } {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*DataInputStream, [*:0]const u8, i64, ?*u64, ?*Cancellable, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_data_input_stream_read_upto" });
        const ret = cFn(self, arg_stop_chars, arg_stop_chars_len, arg_length, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .length = argO_length };
    }
    pub fn readUptoAsync(self: *DataInputStream, arg_stop_chars: [*:0]const u8, arg_stop_chars_len: i64, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*DataInputStream, [*:0]const u8, i64, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_data_input_stream_read_upto_async" });
        const ret = cFn(self, arg_stop_chars, arg_stop_chars_len, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn readUptoFinish(self: *DataInputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: [*:0]u8,
        length: u64,
    } {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*DataInputStream, *AsyncResult, ?*u64, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_data_input_stream_read_upto_finish" });
        const ret = cFn(self, arg_result, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .length = argO_length };
    }
    pub fn setByteOrder(self: *DataInputStream, arg_order: DataStreamByteOrder) void {
        const cFn = @extern(*const fn (*DataInputStream, DataStreamByteOrder) callconv(.c) void, .{ .name = "g_data_input_stream_set_byte_order" });
        const ret = cFn(self, arg_order);
        return ret;
    }
    pub fn setNewlineType(self: *DataInputStream, arg_type: DataStreamNewlineType) void {
        const cFn = @extern(*const fn (*DataInputStream, DataStreamNewlineType) callconv(.c) void, .{ .name = "g_data_input_stream_set_newline_type" });
        const ret = cFn(self, arg_type);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_data_input_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DataInputStreamClass = extern struct {
    parent_class: BufferedInputStreamClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const DataInputStreamPrivate = opaque {};
pub const DataOutputStream = extern struct {
    pub const Interfaces = [_]type{Seekable};
    pub const Parent = FilterOutputStream;
    pub const Class = DataOutputStreamClass;
    _props: struct {
        @"byte-order": core.Property(DataStreamByteOrder, "byte-order") = .{},
    },
    parent_instance: FilterOutputStream,
    priv: ?*DataOutputStreamPrivate,
    pub fn new(arg_base_stream: *OutputStream) *DataOutputStream {
        const cFn = @extern(*const fn (*OutputStream) callconv(.c) *DataOutputStream, .{ .name = "g_data_output_stream_new" });
        const ret = cFn(arg_base_stream);
        return ret;
    }
    pub fn getByteOrder(self: *DataOutputStream) DataStreamByteOrder {
        const cFn = @extern(*const fn (*DataOutputStream) callconv(.c) DataStreamByteOrder, .{ .name = "g_data_output_stream_get_byte_order" });
        const ret = cFn(self);
        return ret;
    }
    pub fn putByte(self: *DataOutputStream, arg_data: u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DataOutputStream, u8, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_data_output_stream_put_byte" });
        const ret = cFn(self, arg_data, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn putInt16(self: *DataOutputStream, arg_data: i16, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DataOutputStream, i16, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_data_output_stream_put_int16" });
        const ret = cFn(self, arg_data, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn putInt32(self: *DataOutputStream, arg_data: i32, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DataOutputStream, i32, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_data_output_stream_put_int32" });
        const ret = cFn(self, arg_data, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn putInt64(self: *DataOutputStream, arg_data: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DataOutputStream, i64, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_data_output_stream_put_int64" });
        const ret = cFn(self, arg_data, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn putString(self: *DataOutputStream, arg_str: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DataOutputStream, [*:0]const u8, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_data_output_stream_put_string" });
        const ret = cFn(self, arg_str, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn putUint16(self: *DataOutputStream, arg_data: u16, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DataOutputStream, u16, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_data_output_stream_put_uint16" });
        const ret = cFn(self, arg_data, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn putUint32(self: *DataOutputStream, arg_data: u32, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DataOutputStream, u32, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_data_output_stream_put_uint32" });
        const ret = cFn(self, arg_data, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn putUint64(self: *DataOutputStream, arg_data: u64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DataOutputStream, u64, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_data_output_stream_put_uint64" });
        const ret = cFn(self, arg_data, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setByteOrder(self: *DataOutputStream, arg_order: DataStreamByteOrder) void {
        const cFn = @extern(*const fn (*DataOutputStream, DataStreamByteOrder) callconv(.c) void, .{ .name = "g_data_output_stream_set_byte_order" });
        const ret = cFn(self, arg_order);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_data_output_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DataOutputStreamClass = extern struct {
    parent_class: FilterOutputStreamClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const DataOutputStreamPrivate = opaque {};
pub const DataStreamByteOrder = enum(u32) {
    big_endian = 0,
    little_endian = 1,
    host_endian = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_data_stream_byte_order_get_type" });
        return cFn();
    }
};
pub const DataStreamNewlineType = enum(u32) {
    lf = 0,
    cr = 1,
    cr_lf = 2,
    any = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_data_stream_newline_type_get_type" });
        return cFn();
    }
};
pub const DatagramBased = struct {
    pub const Class = DatagramBasedInterface;
    pub fn conditionCheck(self: *DatagramBased, arg_condition: GLib.IOCondition) GLib.IOCondition {
        const cFn = @extern(*const fn (*DatagramBased, GLib.IOCondition) callconv(.c) GLib.IOCondition, .{ .name = "g_datagram_based_condition_check" });
        const ret = cFn(self, arg_condition);
        return ret;
    }
    pub fn conditionWait(self: *DatagramBased, arg_condition: GLib.IOCondition, arg_timeout: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DatagramBased, GLib.IOCondition, i64, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_datagram_based_condition_wait" });
        const ret = cFn(self, arg_condition, arg_timeout, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn createSource(self: *DatagramBased, arg_condition: GLib.IOCondition, arg_cancellable: ?*Cancellable) *GLib.Source {
        const cFn = @extern(*const fn (*DatagramBased, GLib.IOCondition, ?*Cancellable) callconv(.c) *GLib.Source, .{ .name = "g_datagram_based_create_source" });
        const ret = cFn(self, arg_condition, arg_cancellable);
        return ret;
    }
    pub fn receiveMessages(self: *DatagramBased, argS_messages: []InputMessage, arg_flags: i32, arg_timeout: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i32 {
        const arg_messages: [*]InputMessage = @ptrCast(argS_messages);
        const arg_num_messages: u32 = @intCast((argS_messages).len);
        const cFn = @extern(*const fn (*DatagramBased, [*]InputMessage, u32, i32, i64, ?*Cancellable, *?*GLib.Error) callconv(.c) i32, .{ .name = "g_datagram_based_receive_messages" });
        const ret = cFn(self, arg_messages, arg_num_messages, arg_flags, arg_timeout, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn sendMessages(self: *DatagramBased, argS_messages: []OutputMessage, arg_flags: i32, arg_timeout: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i32 {
        const arg_messages: [*]OutputMessage = @ptrCast(argS_messages);
        const arg_num_messages: u32 = @intCast((argS_messages).len);
        const cFn = @extern(*const fn (*DatagramBased, [*]OutputMessage, u32, i32, i64, ?*Cancellable, *?*GLib.Error) callconv(.c) i32, .{ .name = "g_datagram_based_send_messages" });
        const ret = cFn(self, arg_messages, arg_num_messages, arg_flags, arg_timeout, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_datagram_based_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DatagramBasedInterface = extern struct {
    g_iface: GObject.TypeInterface,
    receive_messages: ?*const fn (arg_datagram_based: *DatagramBased, arg_messages: [*]InputMessage, arg_num_messages: u32, arg_flags: i32, arg_timeout: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) i32,
    send_messages: ?*const fn (arg_datagram_based: *DatagramBased, arg_messages: [*]OutputMessage, arg_num_messages: u32, arg_flags: i32, arg_timeout: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) i32,
    create_source: ?*const fn (arg_datagram_based: *DatagramBased, arg_condition: GLib.IOCondition, arg_cancellable: ?*Cancellable) callconv(.c) *GLib.Source,
    condition_check: ?*const fn (arg_datagram_based: *DatagramBased, arg_condition: GLib.IOCondition) callconv(.c) GLib.IOCondition,
    condition_wait: ?*const fn (arg_datagram_based: *DatagramBased, arg_condition: GLib.IOCondition, arg_timeout: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
};
pub const DatagramBasedSourceFunc = *const fn (arg_datagram_based: *DatagramBased, arg_condition: GLib.IOCondition, arg_data: ?*anyopaque) callconv(.c) bool;
pub const DebugController = struct {
    pub const Prerequistes = [_]type{Initable};
    pub const Class = DebugControllerInterface;
    _props: struct {
        @"debug-enabled": core.Property(bool, "debug-enabled") = .{},
    },
    pub fn getDebugEnabled(self: *DebugController) bool {
        const cFn = @extern(*const fn (*DebugController) callconv(.c) bool, .{ .name = "g_debug_controller_get_debug_enabled" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setDebugEnabled(self: *DebugController, arg_debug_enabled: bool) void {
        const cFn = @extern(*const fn (*DebugController, bool) callconv(.c) void, .{ .name = "g_debug_controller_set_debug_enabled" });
        const ret = cFn(self, arg_debug_enabled);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_debug_controller_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DebugControllerDBus = extern struct {
    pub const Interfaces = [_]type{ DebugController, Initable };
    pub const Parent = GObject.Object;
    pub const Class = DebugControllerDBusClass;
    _props: struct {
        connection: core.Property(DBusConnection, "connection") = .{},
    },
    _signals: struct {
        authorize: core.Signal(fn (*DebugControllerDBus, *DBusMethodInvocation) bool, "authorize") = .{},
    },
    parent_instance: GObject.Object,
    pub fn new(arg_connection: *DBusConnection, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!?*DebugControllerDBus {
        const cFn = @extern(*const fn (*DBusConnection, ?*Cancellable, *?*GLib.Error) callconv(.c) ?*DebugControllerDBus, .{ .name = "g_debug_controller_dbus_new" });
        const ret = cFn(arg_connection, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn stop(self: *DebugControllerDBus) void {
        const cFn = @extern(*const fn (*DebugControllerDBus) callconv(.c) void, .{ .name = "g_debug_controller_dbus_stop" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_debug_controller_dbus_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DebugControllerDBusClass = extern struct {
    parent_class: GObject.ObjectClass,
    authorize: ?*const fn (arg_controller: *DebugControllerDBus, arg_invocation: *DBusMethodInvocation) callconv(.c) bool,
    padding: [12]?*anyopaque,
};
pub const DebugControllerInterface = extern struct {
    g_iface: GObject.TypeInterface,
};
pub const DesktopAppInfo = struct {
    pub const Interfaces = [_]type{AppInfo};
    pub const Parent = GObject.Object;
    pub const Class = DesktopAppInfoClass;
    _props: struct {
        filename: core.Property([*:0]const u8, "filename") = .{},
    },
    pub fn new(arg_desktop_id: [*:0]const u8) ?*DesktopAppInfo {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*DesktopAppInfo, .{ .name = "g_desktop_app_info_new" });
        const ret = cFn(arg_desktop_id);
        return ret;
    }
    pub fn newFromFilename(arg_filename: [*:0]const u8) ?*DesktopAppInfo {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*DesktopAppInfo, .{ .name = "g_desktop_app_info_new_from_filename" });
        const ret = cFn(arg_filename);
        return ret;
    }
    pub fn newFromKeyfile(arg_key_file: *GLib.KeyFile) ?*DesktopAppInfo {
        const cFn = @extern(*const fn (*GLib.KeyFile) callconv(.c) ?*DesktopAppInfo, .{ .name = "g_desktop_app_info_new_from_keyfile" });
        const ret = cFn(arg_key_file);
        return ret;
    }
    pub fn getImplementations(arg_interface: [*:0]const u8) ?*GLib.List {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*GLib.List, .{ .name = "g_desktop_app_info_get_implementations" });
        const ret = cFn(arg_interface);
        return ret;
    }
    pub fn search(arg_search_string: [*:0]const u8) [*]?[*]?[*:0]const u8 {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*]?[*]?[*:0]const u8, .{ .name = "g_desktop_app_info_search" });
        const ret = cFn(arg_search_string);
        return ret;
    }
    pub fn setDesktopEnv(arg_desktop_env: [*:0]const u8) void {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) void, .{ .name = "g_desktop_app_info_set_desktop_env" });
        const ret = cFn(arg_desktop_env);
        return ret;
    }
    pub fn getActionName(self: *DesktopAppInfo, arg_action_name: [*:0]const u8) [*:0]u8 {
        const cFn = @extern(*const fn (*DesktopAppInfo, [*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_desktop_app_info_get_action_name" });
        const ret = cFn(self, arg_action_name);
        return ret;
    }
    pub fn getBoolean(self: *DesktopAppInfo, arg_key: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*DesktopAppInfo, [*:0]const u8) callconv(.c) bool, .{ .name = "g_desktop_app_info_get_boolean" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getCategories(self: *DesktopAppInfo) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DesktopAppInfo) callconv(.c) ?[*:0]u8, .{ .name = "g_desktop_app_info_get_categories" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFilename(self: *DesktopAppInfo) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DesktopAppInfo) callconv(.c) ?[*:0]u8, .{ .name = "g_desktop_app_info_get_filename" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getGenericName(self: *DesktopAppInfo) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DesktopAppInfo) callconv(.c) ?[*:0]u8, .{ .name = "g_desktop_app_info_get_generic_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsHidden(self: *DesktopAppInfo) bool {
        const cFn = @extern(*const fn (*DesktopAppInfo) callconv(.c) bool, .{ .name = "g_desktop_app_info_get_is_hidden" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getKeywords(self: *DesktopAppInfo) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*DesktopAppInfo) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_desktop_app_info_get_keywords" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLocaleString(self: *DesktopAppInfo, arg_key: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DesktopAppInfo, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_desktop_app_info_get_locale_string" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getNodisplay(self: *DesktopAppInfo) bool {
        const cFn = @extern(*const fn (*DesktopAppInfo) callconv(.c) bool, .{ .name = "g_desktop_app_info_get_nodisplay" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getShowIn(self: *DesktopAppInfo, arg_desktop_env: ?[*:0]const u8) bool {
        const cFn = @extern(*const fn (*DesktopAppInfo, ?[*:0]const u8) callconv(.c) bool, .{ .name = "g_desktop_app_info_get_show_in" });
        const ret = cFn(self, arg_desktop_env);
        return ret;
    }
    pub fn getStartupWmClass(self: *DesktopAppInfo) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DesktopAppInfo) callconv(.c) ?[*:0]u8, .{ .name = "g_desktop_app_info_get_startup_wm_class" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getString(self: *DesktopAppInfo, arg_key: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DesktopAppInfo, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_desktop_app_info_get_string" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getStringList(self: *DesktopAppInfo, arg_key: [*:0]const u8) [][*:0]const u8 {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*DesktopAppInfo, [*:0]const u8, ?*u64) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_desktop_app_info_get_string_list" });
        const ret = cFn(self, arg_key, arg_length);
        return ret[0..@intCast(argO_length)];
    }
    pub fn hasKey(self: *DesktopAppInfo, arg_key: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*DesktopAppInfo, [*:0]const u8) callconv(.c) bool, .{ .name = "g_desktop_app_info_has_key" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn launchAction(self: *DesktopAppInfo, arg_action_name: [*:0]const u8, arg_launch_context: ?*AppLaunchContext) void {
        const cFn = @extern(*const fn (*DesktopAppInfo, [*:0]const u8, ?*AppLaunchContext) callconv(.c) void, .{ .name = "g_desktop_app_info_launch_action" });
        const ret = cFn(self, arg_action_name, arg_launch_context);
        return ret;
    }
    pub fn launchUrisAsManager(self: *DesktopAppInfo, arg_uris: *GLib.List, arg_launch_context: ?*AppLaunchContext, arg_spawn_flags: GLib.SpawnFlags, argC_user_setup: core.Closure(?GLib.SpawnChildSetupFunc), argC_pid_callback: core.Closure(?DesktopAppLaunchCallback), arg_error: *?*GLib.Error) error{GError}!bool {
        const arg_user_setup: ?GLib.SpawnChildSetupFunc = @ptrCast(argC_user_setup.callback());
        argC_user_setup.closure.once = true;
        const arg_user_setup_data: ?*anyopaque = @ptrCast(argC_user_setup.data());
        const arg_pid_callback: ?DesktopAppLaunchCallback = @ptrCast(argC_pid_callback.callback());
        defer argC_pid_callback.deinit();
        const arg_pid_callback_data: ?*anyopaque = @ptrCast(argC_pid_callback.data());
        const cFn = @extern(*const fn (*DesktopAppInfo, *GLib.List, ?*AppLaunchContext, GLib.SpawnFlags, ?GLib.SpawnChildSetupFunc, ?*anyopaque, ?DesktopAppLaunchCallback, ?*anyopaque, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_desktop_app_info_launch_uris_as_manager" });
        const ret = cFn(self, arg_uris, arg_launch_context, arg_spawn_flags, arg_user_setup, @ptrCast(arg_user_setup_data), arg_pid_callback, @ptrCast(arg_pid_callback_data), arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn launchUrisAsManagerWithFds(self: *DesktopAppInfo, arg_uris: *GLib.List, arg_launch_context: ?*AppLaunchContext, arg_spawn_flags: GLib.SpawnFlags, argC_user_setup: core.Closure(?GLib.SpawnChildSetupFunc), argC_pid_callback: core.Closure(?DesktopAppLaunchCallback), arg_stdin_fd: i32, arg_stdout_fd: i32, arg_stderr_fd: i32, arg_error: *?*GLib.Error) error{GError}!bool {
        const arg_user_setup: ?GLib.SpawnChildSetupFunc = @ptrCast(argC_user_setup.callback());
        argC_user_setup.closure.once = true;
        const arg_user_setup_data: ?*anyopaque = @ptrCast(argC_user_setup.data());
        const arg_pid_callback: ?DesktopAppLaunchCallback = @ptrCast(argC_pid_callback.callback());
        defer argC_pid_callback.deinit();
        const arg_pid_callback_data: ?*anyopaque = @ptrCast(argC_pid_callback.data());
        const cFn = @extern(*const fn (*DesktopAppInfo, *GLib.List, ?*AppLaunchContext, GLib.SpawnFlags, ?GLib.SpawnChildSetupFunc, ?*anyopaque, ?DesktopAppLaunchCallback, ?*anyopaque, i32, i32, i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_desktop_app_info_launch_uris_as_manager_with_fds" });
        const ret = cFn(self, arg_uris, arg_launch_context, arg_spawn_flags, arg_user_setup, @ptrCast(arg_user_setup_data), arg_pid_callback, @ptrCast(arg_pid_callback_data), arg_stdin_fd, arg_stdout_fd, arg_stderr_fd, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn listActions(self: *DesktopAppInfo) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*DesktopAppInfo) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_desktop_app_info_list_actions" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_desktop_app_info_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DesktopAppInfoClass = extern struct {
    parent_class: GObject.ObjectClass,
};
pub const DesktopAppInfoLookup = struct {
    pub const Class = DesktopAppInfoLookupIface;
    pub fn getDefaultForUriScheme(self: *DesktopAppInfoLookup, arg_uri_scheme: [*:0]const u8) ?*AppInfo {
        const cFn = @extern(*const fn (*DesktopAppInfoLookup, [*:0]const u8) callconv(.c) ?*AppInfo, .{ .name = "g_desktop_app_info_lookup_get_default_for_uri_scheme" });
        const ret = cFn(self, arg_uri_scheme);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_desktop_app_info_lookup_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DesktopAppInfoLookupIface = extern struct {
    g_iface: GObject.TypeInterface,
    get_default_for_uri_scheme: ?*const fn (arg_lookup: *DesktopAppInfoLookup, arg_uri_scheme: [*:0]const u8) callconv(.c) ?*AppInfo,
};
pub const DesktopAppLaunchCallback = *const fn (arg_appinfo: *DesktopAppInfo, arg_pid: i32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const Drive = struct {
    pub const Class = DriveIface;
    _signals: struct {
        changed: core.Signal(fn (*Drive) void, "changed") = .{},
        disconnected: core.Signal(fn (*Drive) void, "disconnected") = .{},
        @"eject-button": core.Signal(fn (*Drive) void, "eject-button") = .{},
        @"stop-button": core.Signal(fn (*Drive) void, "stop-button") = .{},
    },
    pub fn canEject(self: *Drive) bool {
        const cFn = @extern(*const fn (*Drive) callconv(.c) bool, .{ .name = "g_drive_can_eject" });
        const ret = cFn(self);
        return ret;
    }
    pub fn canPollForMedia(self: *Drive) bool {
        const cFn = @extern(*const fn (*Drive) callconv(.c) bool, .{ .name = "g_drive_can_poll_for_media" });
        const ret = cFn(self);
        return ret;
    }
    pub fn canStart(self: *Drive) bool {
        const cFn = @extern(*const fn (*Drive) callconv(.c) bool, .{ .name = "g_drive_can_start" });
        const ret = cFn(self);
        return ret;
    }
    pub fn canStartDegraded(self: *Drive) bool {
        const cFn = @extern(*const fn (*Drive) callconv(.c) bool, .{ .name = "g_drive_can_start_degraded" });
        const ret = cFn(self);
        return ret;
    }
    pub fn canStop(self: *Drive) bool {
        const cFn = @extern(*const fn (*Drive) callconv(.c) bool, .{ .name = "g_drive_can_stop" });
        const ret = cFn(self);
        return ret;
    }
    pub fn eject(self: *Drive, arg_flags: MountUnmountFlags, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Drive, MountUnmountFlags, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_drive_eject" });
        const ret = cFn(self, arg_flags, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn ejectFinish(self: *Drive, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Drive, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_drive_eject_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn ejectWithOperation(self: *Drive, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Drive, MountUnmountFlags, ?*MountOperation, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_drive_eject_with_operation" });
        const ret = cFn(self, arg_flags, arg_mount_operation, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn ejectWithOperationFinish(self: *Drive, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Drive, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_drive_eject_with_operation_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn enumerateIdentifiers(self: *Drive) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*Drive) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_drive_enumerate_identifiers" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIcon(self: *Drive) *Icon {
        const cFn = @extern(*const fn (*Drive) callconv(.c) *Icon, .{ .name = "g_drive_get_icon" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIdentifier(self: *Drive, arg_kind: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Drive, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_drive_get_identifier" });
        const ret = cFn(self, arg_kind);
        return ret;
    }
    pub fn getName(self: *Drive) [*:0]u8 {
        const cFn = @extern(*const fn (*Drive) callconv(.c) [*:0]u8, .{ .name = "g_drive_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSortKey(self: *Drive) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Drive) callconv(.c) ?[*:0]u8, .{ .name = "g_drive_get_sort_key" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStartStopType(self: *Drive) DriveStartStopType {
        const cFn = @extern(*const fn (*Drive) callconv(.c) DriveStartStopType, .{ .name = "g_drive_get_start_stop_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSymbolicIcon(self: *Drive) *Icon {
        const cFn = @extern(*const fn (*Drive) callconv(.c) *Icon, .{ .name = "g_drive_get_symbolic_icon" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getVolumes(self: *Drive) ?*GLib.List {
        const cFn = @extern(*const fn (*Drive) callconv(.c) ?*GLib.List, .{ .name = "g_drive_get_volumes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hasMedia(self: *Drive) bool {
        const cFn = @extern(*const fn (*Drive) callconv(.c) bool, .{ .name = "g_drive_has_media" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hasVolumes(self: *Drive) bool {
        const cFn = @extern(*const fn (*Drive) callconv(.c) bool, .{ .name = "g_drive_has_volumes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isMediaCheckAutomatic(self: *Drive) bool {
        const cFn = @extern(*const fn (*Drive) callconv(.c) bool, .{ .name = "g_drive_is_media_check_automatic" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isMediaRemovable(self: *Drive) bool {
        const cFn = @extern(*const fn (*Drive) callconv(.c) bool, .{ .name = "g_drive_is_media_removable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isRemovable(self: *Drive) bool {
        const cFn = @extern(*const fn (*Drive) callconv(.c) bool, .{ .name = "g_drive_is_removable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn pollForMedia(self: *Drive, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Drive, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_drive_poll_for_media" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn pollForMediaFinish(self: *Drive, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Drive, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_drive_poll_for_media_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn start(self: *Drive, arg_flags: DriveStartFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Drive, DriveStartFlags, ?*MountOperation, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_drive_start" });
        const ret = cFn(self, arg_flags, arg_mount_operation, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn startFinish(self: *Drive, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Drive, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_drive_start_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn stop(self: *Drive, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Drive, MountUnmountFlags, ?*MountOperation, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_drive_stop" });
        const ret = cFn(self, arg_flags, arg_mount_operation, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn stopFinish(self: *Drive, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Drive, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_drive_stop_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_drive_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DriveIface = extern struct {
    g_iface: GObject.TypeInterface,
    changed: ?*const fn (arg_drive: *Drive) callconv(.c) void,
    disconnected: ?*const fn (arg_drive: *Drive) callconv(.c) void,
    eject_button: ?*const fn (arg_drive: *Drive) callconv(.c) void,
    get_name: ?*const fn (arg_drive: *Drive) callconv(.c) [*:0]u8,
    get_icon: ?*const fn (arg_drive: *Drive) callconv(.c) *Icon,
    has_volumes: ?*const fn (arg_drive: *Drive) callconv(.c) bool,
    get_volumes: ?*const fn (arg_drive: *Drive) callconv(.c) ?*GLib.List,
    is_media_removable: ?*const fn (arg_drive: *Drive) callconv(.c) bool,
    has_media: ?*const fn (arg_drive: *Drive) callconv(.c) bool,
    is_media_check_automatic: ?*const fn (arg_drive: *Drive) callconv(.c) bool,
    can_eject: ?*const fn (arg_drive: *Drive) callconv(.c) bool,
    can_poll_for_media: ?*const fn (arg_drive: *Drive) callconv(.c) bool,
    eject: ?*const fn (arg_drive: *Drive, arg_flags: MountUnmountFlags, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    eject_finish: ?*const fn (arg_drive: *Drive, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    poll_for_media: ?*const fn (arg_drive: *Drive, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    poll_for_media_finish: ?*const fn (arg_drive: *Drive, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    get_identifier: ?*const fn (arg_drive: *Drive, arg_kind: [*:0]const u8) callconv(.c) ?[*:0]u8,
    enumerate_identifiers: ?*const fn (arg_drive: *Drive) callconv(.c) [*]?[*:0]const u8,
    get_start_stop_type: ?*const fn (arg_drive: *Drive) callconv(.c) DriveStartStopType,
    can_start: ?*const fn (arg_drive: *Drive) callconv(.c) bool,
    can_start_degraded: ?*const fn (arg_drive: *Drive) callconv(.c) bool,
    start: ?*const fn (arg_drive: *Drive, arg_flags: DriveStartFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    start_finish: ?*const fn (arg_drive: *Drive, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    can_stop: ?*const fn (arg_drive: *Drive) callconv(.c) bool,
    stop: ?*const fn (arg_drive: *Drive, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    stop_finish: ?*const fn (arg_drive: *Drive, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    stop_button: ?*const fn (arg_drive: *Drive) callconv(.c) void,
    eject_with_operation: ?*const fn (arg_drive: *Drive, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    eject_with_operation_finish: ?*const fn (arg_drive: *Drive, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    get_sort_key: ?*const fn (arg_drive: *Drive) callconv(.c) ?[*:0]u8,
    get_symbolic_icon: ?*const fn (arg_drive: *Drive) callconv(.c) *Icon,
    is_removable: ?*const fn (arg_drive: *Drive) callconv(.c) bool,
};
pub const DriveStartFlags = packed struct(u32) {
    _: u32 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_drive_start_flags_get_type" });
        return cFn();
    }
};
pub const DriveStartStopType = enum(u32) {
    unknown = 0,
    shutdown = 1,
    network = 2,
    multidisk = 3,
    password = 4,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_drive_start_stop_type_get_type" });
        return cFn();
    }
};
pub const DtlsClientConnection = struct {
    pub const Prerequistes = [_]type{ DatagramBased, DtlsConnection };
    pub const Class = DtlsClientConnectionInterface;
    _props: struct {
        @"accepted-cas": core.Property(*GLib.List, "accepted-cas") = .{},
        @"server-identity": core.Property(SocketConnectable, "server-identity") = .{},
        @"validation-flags": core.Property(TlsCertificateFlags, "validation-flags") = .{},
    },
    pub fn new(arg_base_socket: *DatagramBased, arg_server_identity: ?*SocketConnectable, arg_error: *?*GLib.Error) error{GError}!*DtlsClientConnection {
        const cFn = @extern(*const fn (*DatagramBased, ?*SocketConnectable, *?*GLib.Error) callconv(.c) *DtlsClientConnection, .{ .name = "g_dtls_client_connection_new" });
        const ret = cFn(arg_base_socket, arg_server_identity, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getAcceptedCas(self: *DtlsClientConnection) ?*GLib.List {
        const cFn = @extern(*const fn (*DtlsClientConnection) callconv(.c) ?*GLib.List, .{ .name = "g_dtls_client_connection_get_accepted_cas" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getServerIdentity(self: *DtlsClientConnection) *SocketConnectable {
        const cFn = @extern(*const fn (*DtlsClientConnection) callconv(.c) *SocketConnectable, .{ .name = "g_dtls_client_connection_get_server_identity" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getValidationFlags(self: *DtlsClientConnection) TlsCertificateFlags {
        const cFn = @extern(*const fn (*DtlsClientConnection) callconv(.c) TlsCertificateFlags, .{ .name = "g_dtls_client_connection_get_validation_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setServerIdentity(self: *DtlsClientConnection, arg_identity: *SocketConnectable) void {
        const cFn = @extern(*const fn (*DtlsClientConnection, *SocketConnectable) callconv(.c) void, .{ .name = "g_dtls_client_connection_set_server_identity" });
        const ret = cFn(self, arg_identity);
        return ret;
    }
    pub fn setValidationFlags(self: *DtlsClientConnection, arg_flags: TlsCertificateFlags) void {
        const cFn = @extern(*const fn (*DtlsClientConnection, TlsCertificateFlags) callconv(.c) void, .{ .name = "g_dtls_client_connection_set_validation_flags" });
        const ret = cFn(self, arg_flags);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dtls_client_connection_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DtlsClientConnectionInterface = extern struct {
    g_iface: GObject.TypeInterface,
};
pub const DtlsConnection = struct {
    pub const Prerequistes = [_]type{DatagramBased};
    pub const Class = DtlsConnectionInterface;
    _props: struct {
        @"advertised-protocols": core.Property([*]?[*:0]const u8, "advertised-protocols") = .{},
        @"base-socket": core.Property(DatagramBased, "base-socket") = .{},
        certificate: core.Property(TlsCertificate, "certificate") = .{},
        @"ciphersuite-name": core.Property([*:0]const u8, "ciphersuite-name") = .{},
        database: core.Property(TlsDatabase, "database") = .{},
        interaction: core.Property(TlsInteraction, "interaction") = .{},
        @"negotiated-protocol": core.Property([*:0]const u8, "negotiated-protocol") = .{},
        @"peer-certificate": core.Property(TlsCertificate, "peer-certificate") = .{},
        @"peer-certificate-errors": core.Property(TlsCertificateFlags, "peer-certificate-errors") = .{},
        @"protocol-version": core.Property(TlsProtocolVersion, "protocol-version") = .{},
        @"rehandshake-mode": core.Property(TlsRehandshakeMode, "rehandshake-mode") = .{},
        @"require-close-notify": core.Property(bool, "require-close-notify") = .{},
    },
    _signals: struct {
        @"accept-certificate": core.Signal(fn (*DtlsConnection, *TlsCertificate, TlsCertificateFlags) bool, "accept-certificate") = .{},
    },
    pub fn close(self: *DtlsConnection, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DtlsConnection, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dtls_connection_close" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn closeAsync(self: *DtlsConnection, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*DtlsConnection, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dtls_connection_close_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn closeFinish(self: *DtlsConnection, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DtlsConnection, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dtls_connection_close_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn emitAcceptCertificate(self: *DtlsConnection, arg_peer_cert: *TlsCertificate, arg_errors: TlsCertificateFlags) bool {
        const cFn = @extern(*const fn (*DtlsConnection, *TlsCertificate, TlsCertificateFlags) callconv(.c) bool, .{ .name = "g_dtls_connection_emit_accept_certificate" });
        const ret = cFn(self, arg_peer_cert, arg_errors);
        return ret;
    }
    pub fn getCertificate(self: *DtlsConnection) ?*TlsCertificate {
        const cFn = @extern(*const fn (*DtlsConnection) callconv(.c) ?*TlsCertificate, .{ .name = "g_dtls_connection_get_certificate" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getChannelBindingData(self: *DtlsConnection, arg_type: TlsChannelBindingType, arg_error: *?*GLib.Error) error{GError}!?*GLib.ByteArray {
        var argO_data: ?*GLib.ByteArray = undefined;
        const arg_data: ?*GLib.ByteArray = &argO_data;
        const cFn = @extern(*const fn (*DtlsConnection, TlsChannelBindingType, ?*GLib.ByteArray, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dtls_connection_get_channel_binding_data" });
        const ret = cFn(self, arg_type, arg_data, arg_error);
        if (arg_error.* != null) return error.GError;
        if (!ret) return null;
        return argO_data;
    }
    pub fn getCiphersuiteName(self: *DtlsConnection) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DtlsConnection) callconv(.c) ?[*:0]u8, .{ .name = "g_dtls_connection_get_ciphersuite_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDatabase(self: *DtlsConnection) ?*TlsDatabase {
        const cFn = @extern(*const fn (*DtlsConnection) callconv(.c) ?*TlsDatabase, .{ .name = "g_dtls_connection_get_database" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInteraction(self: *DtlsConnection) ?*TlsInteraction {
        const cFn = @extern(*const fn (*DtlsConnection) callconv(.c) ?*TlsInteraction, .{ .name = "g_dtls_connection_get_interaction" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNegotiatedProtocol(self: *DtlsConnection) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DtlsConnection) callconv(.c) ?[*:0]u8, .{ .name = "g_dtls_connection_get_negotiated_protocol" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPeerCertificate(self: *DtlsConnection) ?*TlsCertificate {
        const cFn = @extern(*const fn (*DtlsConnection) callconv(.c) ?*TlsCertificate, .{ .name = "g_dtls_connection_get_peer_certificate" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPeerCertificateErrors(self: *DtlsConnection) TlsCertificateFlags {
        const cFn = @extern(*const fn (*DtlsConnection) callconv(.c) TlsCertificateFlags, .{ .name = "g_dtls_connection_get_peer_certificate_errors" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getProtocolVersion(self: *DtlsConnection) TlsProtocolVersion {
        const cFn = @extern(*const fn (*DtlsConnection) callconv(.c) TlsProtocolVersion, .{ .name = "g_dtls_connection_get_protocol_version" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRehandshakeMode(self: *DtlsConnection) TlsRehandshakeMode {
        const cFn = @extern(*const fn (*DtlsConnection) callconv(.c) TlsRehandshakeMode, .{ .name = "g_dtls_connection_get_rehandshake_mode" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRequireCloseNotify(self: *DtlsConnection) bool {
        const cFn = @extern(*const fn (*DtlsConnection) callconv(.c) bool, .{ .name = "g_dtls_connection_get_require_close_notify" });
        const ret = cFn(self);
        return ret;
    }
    pub fn handshake(self: *DtlsConnection, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DtlsConnection, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dtls_connection_handshake" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn handshakeAsync(self: *DtlsConnection, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*DtlsConnection, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dtls_connection_handshake_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn handshakeFinish(self: *DtlsConnection, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DtlsConnection, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dtls_connection_handshake_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setAdvertisedProtocols(self: *DtlsConnection, arg_protocols: ?[*]?[*:0]const u8) void {
        const cFn = @extern(*const fn (*DtlsConnection, ?[*]?[*:0]const u8) callconv(.c) void, .{ .name = "g_dtls_connection_set_advertised_protocols" });
        const ret = cFn(self, arg_protocols);
        return ret;
    }
    pub fn setCertificate(self: *DtlsConnection, arg_certificate: *TlsCertificate) void {
        const cFn = @extern(*const fn (*DtlsConnection, *TlsCertificate) callconv(.c) void, .{ .name = "g_dtls_connection_set_certificate" });
        const ret = cFn(self, arg_certificate);
        return ret;
    }
    pub fn setDatabase(self: *DtlsConnection, arg_database: ?*TlsDatabase) void {
        const cFn = @extern(*const fn (*DtlsConnection, ?*TlsDatabase) callconv(.c) void, .{ .name = "g_dtls_connection_set_database" });
        const ret = cFn(self, arg_database);
        return ret;
    }
    pub fn setInteraction(self: *DtlsConnection, arg_interaction: ?*TlsInteraction) void {
        const cFn = @extern(*const fn (*DtlsConnection, ?*TlsInteraction) callconv(.c) void, .{ .name = "g_dtls_connection_set_interaction" });
        const ret = cFn(self, arg_interaction);
        return ret;
    }
    pub fn setRehandshakeMode(self: *DtlsConnection, arg_mode: TlsRehandshakeMode) void {
        const cFn = @extern(*const fn (*DtlsConnection, TlsRehandshakeMode) callconv(.c) void, .{ .name = "g_dtls_connection_set_rehandshake_mode" });
        const ret = cFn(self, arg_mode);
        return ret;
    }
    pub fn setRequireCloseNotify(self: *DtlsConnection, arg_require_close_notify: bool) void {
        const cFn = @extern(*const fn (*DtlsConnection, bool) callconv(.c) void, .{ .name = "g_dtls_connection_set_require_close_notify" });
        const ret = cFn(self, arg_require_close_notify);
        return ret;
    }
    pub fn shutdown(self: *DtlsConnection, arg_shutdown_read: bool, arg_shutdown_write: bool, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DtlsConnection, bool, bool, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dtls_connection_shutdown" });
        const ret = cFn(self, arg_shutdown_read, arg_shutdown_write, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn shutdownAsync(self: *DtlsConnection, arg_shutdown_read: bool, arg_shutdown_write: bool, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*DtlsConnection, bool, bool, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dtls_connection_shutdown_async" });
        const ret = cFn(self, arg_shutdown_read, arg_shutdown_write, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn shutdownFinish(self: *DtlsConnection, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*DtlsConnection, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dtls_connection_shutdown_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dtls_connection_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DtlsConnectionInterface = extern struct {
    g_iface: GObject.TypeInterface,
    accept_certificate: ?*const fn (arg_connection: *DtlsConnection, arg_peer_cert: *TlsCertificate, arg_errors: TlsCertificateFlags) callconv(.c) bool,
    handshake: ?*const fn (arg_conn: *DtlsConnection, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    handshake_async: ?*const fn (arg_conn: *DtlsConnection, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    handshake_finish: ?*const fn (arg_conn: *DtlsConnection, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    shutdown: ?*const fn (arg_conn: *DtlsConnection, arg_shutdown_read: bool, arg_shutdown_write: bool, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    shutdown_async: ?*const fn (arg_conn: *DtlsConnection, arg_shutdown_read: bool, arg_shutdown_write: bool, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    shutdown_finish: ?*const fn (arg_conn: *DtlsConnection, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    set_advertised_protocols: ?*const fn (arg_conn: *DtlsConnection, arg_protocols: ?[*]?[*:0]const u8) callconv(.c) void,
    get_negotiated_protocol: ?*const fn (arg_conn: *DtlsConnection) callconv(.c) ?[*:0]u8,
    get_binding_data: ?*const fn (arg_conn: *DtlsConnection, arg_type: TlsChannelBindingType, arg_data: *GLib.ByteArray, arg_error: *?*GLib.Error) callconv(.c) bool,
};
pub const DtlsServerConnection = struct {
    pub const Prerequistes = [_]type{ DatagramBased, DtlsConnection };
    pub const Class = DtlsServerConnectionInterface;
    _props: struct {
        @"authentication-mode": core.Property(TlsAuthenticationMode, "authentication-mode") = .{},
    },
    pub fn new(arg_base_socket: *DatagramBased, arg_certificate: ?*TlsCertificate, arg_error: *?*GLib.Error) error{GError}!*DtlsServerConnection {
        const cFn = @extern(*const fn (*DatagramBased, ?*TlsCertificate, *?*GLib.Error) callconv(.c) *DtlsServerConnection, .{ .name = "g_dtls_server_connection_new" });
        const ret = cFn(arg_base_socket, arg_certificate, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dtls_server_connection_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const DtlsServerConnectionInterface = extern struct {
    g_iface: GObject.TypeInterface,
};
pub const Emblem = struct {
    pub const Interfaces = [_]type{Icon};
    pub const Parent = GObject.Object;
    pub const Class = EmblemClass;
    _props: struct {
        icon: core.Property(GObject.Object, "icon") = .{},
        origin: core.Property(EmblemOrigin, "origin") = .{},
    },
    pub fn new(arg_icon: *Icon) *Emblem {
        const cFn = @extern(*const fn (*Icon) callconv(.c) *Emblem, .{ .name = "g_emblem_new" });
        const ret = cFn(arg_icon);
        return ret;
    }
    pub fn newWithOrigin(arg_icon: *Icon, arg_origin: EmblemOrigin) *Emblem {
        const cFn = @extern(*const fn (*Icon, EmblemOrigin) callconv(.c) *Emblem, .{ .name = "g_emblem_new_with_origin" });
        const ret = cFn(arg_icon, arg_origin);
        return ret;
    }
    pub fn getIcon(self: *Emblem) *Icon {
        const cFn = @extern(*const fn (*Emblem) callconv(.c) *Icon, .{ .name = "g_emblem_get_icon" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOrigin(self: *Emblem) EmblemOrigin {
        const cFn = @extern(*const fn (*Emblem) callconv(.c) EmblemOrigin, .{ .name = "g_emblem_get_origin" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_emblem_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const EmblemClass = opaque {};
pub const EmblemOrigin = enum(u32) {
    unknown = 0,
    device = 1,
    livemetadata = 2,
    tag = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_emblem_origin_get_type" });
        return cFn();
    }
};
pub const EmblemedIcon = extern struct {
    pub const Interfaces = [_]type{Icon};
    pub const Parent = GObject.Object;
    pub const Class = EmblemedIconClass;
    _props: struct {
        gicon: core.Property(Icon, "gicon") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*EmblemedIconPrivate,
    pub fn new(arg_icon: *Icon, arg_emblem: ?*Emblem) *EmblemedIcon {
        const cFn = @extern(*const fn (*Icon, ?*Emblem) callconv(.c) *EmblemedIcon, .{ .name = "g_emblemed_icon_new" });
        const ret = cFn(arg_icon, arg_emblem);
        return ret;
    }
    pub fn addEmblem(self: *EmblemedIcon, arg_emblem: *Emblem) void {
        const cFn = @extern(*const fn (*EmblemedIcon, *Emblem) callconv(.c) void, .{ .name = "g_emblemed_icon_add_emblem" });
        const ret = cFn(self, arg_emblem);
        return ret;
    }
    pub fn clearEmblems(self: *EmblemedIcon) void {
        const cFn = @extern(*const fn (*EmblemedIcon) callconv(.c) void, .{ .name = "g_emblemed_icon_clear_emblems" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getEmblems(self: *EmblemedIcon) ?*GLib.List {
        const cFn = @extern(*const fn (*EmblemedIcon) callconv(.c) ?*GLib.List, .{ .name = "g_emblemed_icon_get_emblems" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIcon(self: *EmblemedIcon) *Icon {
        const cFn = @extern(*const fn (*EmblemedIcon) callconv(.c) *Icon, .{ .name = "g_emblemed_icon_get_icon" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_emblemed_icon_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const EmblemedIconClass = extern struct {
    parent_class: GObject.ObjectClass,
};
pub const EmblemedIconPrivate = opaque {};
pub const FILE_ATTRIBUTE_ACCESS_CAN_DELETE = "access::can-delete";
pub const FILE_ATTRIBUTE_ACCESS_CAN_EXECUTE = "access::can-execute";
pub const FILE_ATTRIBUTE_ACCESS_CAN_READ = "access::can-read";
pub const FILE_ATTRIBUTE_ACCESS_CAN_RENAME = "access::can-rename";
pub const FILE_ATTRIBUTE_ACCESS_CAN_TRASH = "access::can-trash";
pub const FILE_ATTRIBUTE_ACCESS_CAN_WRITE = "access::can-write";
pub const FILE_ATTRIBUTE_DOS_IS_ARCHIVE = "dos::is-archive";
pub const FILE_ATTRIBUTE_DOS_IS_MOUNTPOINT = "dos::is-mountpoint";
pub const FILE_ATTRIBUTE_DOS_IS_SYSTEM = "dos::is-system";
pub const FILE_ATTRIBUTE_DOS_REPARSE_POINT_TAG = "dos::reparse-point-tag";
pub const FILE_ATTRIBUTE_ETAG_VALUE = "etag::value";
pub const FILE_ATTRIBUTE_FILESYSTEM_FREE = "filesystem::free";
pub const FILE_ATTRIBUTE_FILESYSTEM_READONLY = "filesystem::readonly";
pub const FILE_ATTRIBUTE_FILESYSTEM_REMOTE = "filesystem::remote";
pub const FILE_ATTRIBUTE_FILESYSTEM_SIZE = "filesystem::size";
pub const FILE_ATTRIBUTE_FILESYSTEM_TYPE = "filesystem::type";
pub const FILE_ATTRIBUTE_FILESYSTEM_USED = "filesystem::used";
pub const FILE_ATTRIBUTE_FILESYSTEM_USE_PREVIEW = "filesystem::use-preview";
pub const FILE_ATTRIBUTE_GVFS_BACKEND = "gvfs::backend";
pub const FILE_ATTRIBUTE_ID_FILE = "id::file";
pub const FILE_ATTRIBUTE_ID_FILESYSTEM = "id::filesystem";
pub const FILE_ATTRIBUTE_MOUNTABLE_CAN_EJECT = "mountable::can-eject";
pub const FILE_ATTRIBUTE_MOUNTABLE_CAN_MOUNT = "mountable::can-mount";
pub const FILE_ATTRIBUTE_MOUNTABLE_CAN_POLL = "mountable::can-poll";
pub const FILE_ATTRIBUTE_MOUNTABLE_CAN_START = "mountable::can-start";
pub const FILE_ATTRIBUTE_MOUNTABLE_CAN_START_DEGRADED = "mountable::can-start-degraded";
pub const FILE_ATTRIBUTE_MOUNTABLE_CAN_STOP = "mountable::can-stop";
pub const FILE_ATTRIBUTE_MOUNTABLE_CAN_UNMOUNT = "mountable::can-unmount";
pub const FILE_ATTRIBUTE_MOUNTABLE_HAL_UDI = "mountable::hal-udi";
pub const FILE_ATTRIBUTE_MOUNTABLE_IS_MEDIA_CHECK_AUTOMATIC = "mountable::is-media-check-automatic";
pub const FILE_ATTRIBUTE_MOUNTABLE_START_STOP_TYPE = "mountable::start-stop-type";
pub const FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE = "mountable::unix-device";
pub const FILE_ATTRIBUTE_MOUNTABLE_UNIX_DEVICE_FILE = "mountable::unix-device-file";
pub const FILE_ATTRIBUTE_OWNER_GROUP = "owner::group";
pub const FILE_ATTRIBUTE_OWNER_USER = "owner::user";
pub const FILE_ATTRIBUTE_OWNER_USER_REAL = "owner::user-real";
pub const FILE_ATTRIBUTE_PREVIEW_ICON = "preview::icon";
pub const FILE_ATTRIBUTE_RECENT_MODIFIED = "recent::modified";
pub const FILE_ATTRIBUTE_SELINUX_CONTEXT = "selinux::context";
pub const FILE_ATTRIBUTE_STANDARD_ALLOCATED_SIZE = "standard::allocated-size";
pub const FILE_ATTRIBUTE_STANDARD_CONTENT_TYPE = "standard::content-type";
pub const FILE_ATTRIBUTE_STANDARD_COPY_NAME = "standard::copy-name";
pub const FILE_ATTRIBUTE_STANDARD_DESCRIPTION = "standard::description";
pub const FILE_ATTRIBUTE_STANDARD_DISPLAY_NAME = "standard::display-name";
pub const FILE_ATTRIBUTE_STANDARD_EDIT_NAME = "standard::edit-name";
pub const FILE_ATTRIBUTE_STANDARD_FAST_CONTENT_TYPE = "standard::fast-content-type";
pub const FILE_ATTRIBUTE_STANDARD_ICON = "standard::icon";
pub const FILE_ATTRIBUTE_STANDARD_IS_BACKUP = "standard::is-backup";
pub const FILE_ATTRIBUTE_STANDARD_IS_HIDDEN = "standard::is-hidden";
pub const FILE_ATTRIBUTE_STANDARD_IS_SYMLINK = "standard::is-symlink";
pub const FILE_ATTRIBUTE_STANDARD_IS_VIRTUAL = "standard::is-virtual";
pub const FILE_ATTRIBUTE_STANDARD_IS_VOLATILE = "standard::is-volatile";
pub const FILE_ATTRIBUTE_STANDARD_NAME = "standard::name";
pub const FILE_ATTRIBUTE_STANDARD_SIZE = "standard::size";
pub const FILE_ATTRIBUTE_STANDARD_SORT_ORDER = "standard::sort-order";
pub const FILE_ATTRIBUTE_STANDARD_SYMBOLIC_ICON = "standard::symbolic-icon";
pub const FILE_ATTRIBUTE_STANDARD_SYMLINK_TARGET = "standard::symlink-target";
pub const FILE_ATTRIBUTE_STANDARD_TARGET_URI = "standard::target-uri";
pub const FILE_ATTRIBUTE_STANDARD_TYPE = "standard::type";
pub const FILE_ATTRIBUTE_THUMBNAILING_FAILED = "thumbnail::failed";
pub const FILE_ATTRIBUTE_THUMBNAILING_FAILED_LARGE = "thumbnail::failed-large";
pub const FILE_ATTRIBUTE_THUMBNAILING_FAILED_NORMAL = "thumbnail::failed-normal";
pub const FILE_ATTRIBUTE_THUMBNAILING_FAILED_XLARGE = "thumbnail::failed-xlarge";
pub const FILE_ATTRIBUTE_THUMBNAILING_FAILED_XXLARGE = "thumbnail::failed-xxlarge";
pub const FILE_ATTRIBUTE_THUMBNAIL_IS_VALID = "thumbnail::is-valid";
pub const FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_LARGE = "thumbnail::is-valid-large";
pub const FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_NORMAL = "thumbnail::is-valid-normal";
pub const FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_XLARGE = "thumbnail::is-valid-xlarge";
pub const FILE_ATTRIBUTE_THUMBNAIL_IS_VALID_XXLARGE = "thumbnail::is-valid-xxlarge";
pub const FILE_ATTRIBUTE_THUMBNAIL_PATH = "thumbnail::path";
pub const FILE_ATTRIBUTE_THUMBNAIL_PATH_LARGE = "thumbnail::path-large";
pub const FILE_ATTRIBUTE_THUMBNAIL_PATH_NORMAL = "thumbnail::path-normal";
pub const FILE_ATTRIBUTE_THUMBNAIL_PATH_XLARGE = "thumbnail::path-xlarge";
pub const FILE_ATTRIBUTE_THUMBNAIL_PATH_XXLARGE = "thumbnail::path-xxlarge";
pub const FILE_ATTRIBUTE_TIME_ACCESS = "time::access";
pub const FILE_ATTRIBUTE_TIME_ACCESS_NSEC = "time::access-nsec";
pub const FILE_ATTRIBUTE_TIME_ACCESS_USEC = "time::access-usec";
pub const FILE_ATTRIBUTE_TIME_CHANGED = "time::changed";
pub const FILE_ATTRIBUTE_TIME_CHANGED_NSEC = "time::changed-nsec";
pub const FILE_ATTRIBUTE_TIME_CHANGED_USEC = "time::changed-usec";
pub const FILE_ATTRIBUTE_TIME_CREATED = "time::created";
pub const FILE_ATTRIBUTE_TIME_CREATED_NSEC = "time::created-nsec";
pub const FILE_ATTRIBUTE_TIME_CREATED_USEC = "time::created-usec";
pub const FILE_ATTRIBUTE_TIME_MODIFIED = "time::modified";
pub const FILE_ATTRIBUTE_TIME_MODIFIED_NSEC = "time::modified-nsec";
pub const FILE_ATTRIBUTE_TIME_MODIFIED_USEC = "time::modified-usec";
pub const FILE_ATTRIBUTE_TRASH_DELETION_DATE = "trash::deletion-date";
pub const FILE_ATTRIBUTE_TRASH_ITEM_COUNT = "trash::item-count";
pub const FILE_ATTRIBUTE_TRASH_ORIG_PATH = "trash::orig-path";
pub const FILE_ATTRIBUTE_UNIX_BLOCKS = "unix::blocks";
pub const FILE_ATTRIBUTE_UNIX_BLOCK_SIZE = "unix::block-size";
pub const FILE_ATTRIBUTE_UNIX_DEVICE = "unix::device";
pub const FILE_ATTRIBUTE_UNIX_GID = "unix::gid";
pub const FILE_ATTRIBUTE_UNIX_INODE = "unix::inode";
pub const FILE_ATTRIBUTE_UNIX_IS_MOUNTPOINT = "unix::is-mountpoint";
pub const FILE_ATTRIBUTE_UNIX_MODE = "unix::mode";
pub const FILE_ATTRIBUTE_UNIX_NLINK = "unix::nlink";
pub const FILE_ATTRIBUTE_UNIX_RDEV = "unix::rdev";
pub const FILE_ATTRIBUTE_UNIX_UID = "unix::uid";
pub const File = struct {
    pub const Class = FileIface;
    pub fn newBuildFilenamev(arg_args: [*]?[*:0]const u8) *File {
        const cFn = @extern(*const fn ([*]?[*:0]const u8) callconv(.c) *File, .{ .name = "g_file_new_build_filenamev" });
        const ret = cFn(arg_args);
        return ret;
    }
    pub fn newForCommandlineArg(arg_arg: [*:0]const u8) *File {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *File, .{ .name = "g_file_new_for_commandline_arg" });
        const ret = cFn(arg_arg);
        return ret;
    }
    pub fn newForCommandlineArgAndCwd(arg_arg: [*:0]const u8, arg_cwd: [*:0]const u8) *File {
        const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) *File, .{ .name = "g_file_new_for_commandline_arg_and_cwd" });
        const ret = cFn(arg_arg, arg_cwd);
        return ret;
    }
    pub fn newForPath(arg_path: [*:0]const u8) *File {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *File, .{ .name = "g_file_new_for_path" });
        const ret = cFn(arg_path);
        return ret;
    }
    pub fn newForUri(arg_uri: [*:0]const u8) *File {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *File, .{ .name = "g_file_new_for_uri" });
        const ret = cFn(arg_uri);
        return ret;
    }
    pub fn newTmp(arg_tmpl: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *File,
        iostream: *FileIOStream,
    } {
        var argO_iostream: *FileIOStream = undefined;
        const arg_iostream: **FileIOStream = &argO_iostream;
        const cFn = @extern(*const fn (?[*:0]const u8, **FileIOStream, *?*GLib.Error) callconv(.c) *File, .{ .name = "g_file_new_tmp" });
        const ret = cFn(arg_tmpl, arg_iostream, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .iostream = argO_iostream };
    }
    pub fn newTmpAsync(arg_tmpl: ?[*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (?[*:0]const u8, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_new_tmp_async" });
        const ret = cFn(arg_tmpl, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn newTmpDirAsync(arg_tmpl: ?[*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (?[*:0]const u8, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_new_tmp_dir_async" });
        const ret = cFn(arg_tmpl, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn newTmpDirFinish(arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*File {
        const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) *File, .{ .name = "g_file_new_tmp_dir_finish" });
        const ret = cFn(arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newTmpFinish(arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *File,
        iostream: *FileIOStream,
    } {
        var argO_iostream: *FileIOStream = undefined;
        const arg_iostream: **FileIOStream = &argO_iostream;
        const cFn = @extern(*const fn (*AsyncResult, **FileIOStream, *?*GLib.Error) callconv(.c) *File, .{ .name = "g_file_new_tmp_finish" });
        const ret = cFn(arg_result, arg_iostream, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .iostream = argO_iostream };
    }
    pub fn parseName(arg_parse_name: [*:0]const u8) *File {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *File, .{ .name = "g_file_parse_name" });
        const ret = cFn(arg_parse_name);
        return ret;
    }
    pub fn appendTo(self: *File, arg_flags: FileCreateFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileOutputStream {
        const cFn = @extern(*const fn (*File, FileCreateFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileOutputStream, .{ .name = "g_file_append_to" });
        const ret = cFn(self, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn appendToAsync(self: *File, arg_flags: FileCreateFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, FileCreateFlags, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_append_to_async" });
        const ret = cFn(self, arg_flags, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn appendToFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*FileOutputStream {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) *FileOutputStream, .{ .name = "g_file_append_to_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn buildAttributeListForCopy(self: *File, arg_flags: FileCopyFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
        const cFn = @extern(*const fn (*File, FileCopyFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_file_build_attribute_list_for_copy" });
        const ret = cFn(self, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn copy(self: *File, arg_destination: *File, arg_flags: FileCopyFlags, arg_cancellable: ?*Cancellable, argC_progress_callback: core.Closure(?FileProgressCallback), arg_error: *?*GLib.Error) error{GError}!bool {
        const arg_progress_callback: ?FileProgressCallback = @ptrCast(argC_progress_callback.callback());
        defer argC_progress_callback.deinit();
        const arg_progress_callback_data: ?*anyopaque = @ptrCast(argC_progress_callback.data());
        const cFn = @extern(*const fn (*File, *File, FileCopyFlags, ?*Cancellable, ?FileProgressCallback, ?*anyopaque, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_copy" });
        const ret = cFn(self, arg_destination, arg_flags, arg_cancellable, arg_progress_callback, @ptrCast(arg_progress_callback_data), arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn copyAsync(self: *File, arg_destination: *File, arg_flags: FileCopyFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_progress_callback_closure: ?*GObject.Closure, arg_ready_callback_closure: *GObject.Closure) void {
        const cFn = @extern(*const fn (*File, *File, FileCopyFlags, i32, ?*Cancellable, ?*GObject.Closure, *GObject.Closure) callconv(.c) void, .{ .name = "g_file_copy_async_with_closures" });
        const ret = cFn(self, arg_destination, arg_flags, arg_io_priority, arg_cancellable, arg_progress_callback_closure, arg_ready_callback_closure);
        return ret;
    }
    pub fn copyAttributes(self: *File, arg_destination: *File, arg_flags: FileCopyFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *File, FileCopyFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_copy_attributes" });
        const ret = cFn(self, arg_destination, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn copyFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_copy_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn create(self: *File, arg_flags: FileCreateFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileOutputStream {
        const cFn = @extern(*const fn (*File, FileCreateFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileOutputStream, .{ .name = "g_file_create" });
        const ret = cFn(self, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn createAsync(self: *File, arg_flags: FileCreateFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, FileCreateFlags, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_create_async" });
        const ret = cFn(self, arg_flags, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn createFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*FileOutputStream {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) *FileOutputStream, .{ .name = "g_file_create_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn createReadwrite(self: *File, arg_flags: FileCreateFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileIOStream {
        const cFn = @extern(*const fn (*File, FileCreateFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileIOStream, .{ .name = "g_file_create_readwrite" });
        const ret = cFn(self, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn createReadwriteAsync(self: *File, arg_flags: FileCreateFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, FileCreateFlags, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_create_readwrite_async" });
        const ret = cFn(self, arg_flags, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn createReadwriteFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*FileIOStream {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) *FileIOStream, .{ .name = "g_file_create_readwrite_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn delete(self: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_delete" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn deleteAsync(self: *File, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_delete_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn deleteFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_delete_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn dup(self: *File) *File {
        const cFn = @extern(*const fn (*File) callconv(.c) *File, .{ .name = "g_file_dup" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ejectMountable(self: *File, arg_flags: MountUnmountFlags, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, MountUnmountFlags, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_eject_mountable" });
        const ret = cFn(self, arg_flags, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn ejectMountableFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_eject_mountable_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn ejectMountableWithOperation(self: *File, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, MountUnmountFlags, ?*MountOperation, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_eject_mountable_with_operation" });
        const ret = cFn(self, arg_flags, arg_mount_operation, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn ejectMountableWithOperationFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_eject_mountable_with_operation_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn enumerateChildren(self: *File, arg_attributes: [*:0]const u8, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileEnumerator {
        const cFn = @extern(*const fn (*File, [*:0]const u8, FileQueryInfoFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileEnumerator, .{ .name = "g_file_enumerate_children" });
        const ret = cFn(self, arg_attributes, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn enumerateChildrenAsync(self: *File, arg_attributes: [*:0]const u8, arg_flags: FileQueryInfoFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, [*:0]const u8, FileQueryInfoFlags, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_enumerate_children_async" });
        const ret = cFn(self, arg_attributes, arg_flags, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn enumerateChildrenFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*FileEnumerator {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) *FileEnumerator, .{ .name = "g_file_enumerate_children_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn equal(self: *File, arg_file2: *File) bool {
        const cFn = @extern(*const fn (*File, *File) callconv(.c) bool, .{ .name = "g_file_equal" });
        const ret = cFn(self, arg_file2);
        return ret;
    }
    pub fn findEnclosingMount(self: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*Mount {
        const cFn = @extern(*const fn (*File, ?*Cancellable, *?*GLib.Error) callconv(.c) *Mount, .{ .name = "g_file_find_enclosing_mount" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn findEnclosingMountAsync(self: *File, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_find_enclosing_mount_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn findEnclosingMountFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*Mount {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) *Mount, .{ .name = "g_file_find_enclosing_mount_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getBasename(self: *File) ?[*:0]u8 {
        const cFn = @extern(*const fn (*File) callconv(.c) ?[*:0]u8, .{ .name = "g_file_get_basename" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getChild(self: *File, arg_name: [*:0]const u8) *File {
        const cFn = @extern(*const fn (*File, [*:0]const u8) callconv(.c) *File, .{ .name = "g_file_get_child" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn getChildForDisplayName(self: *File, arg_display_name: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*File {
        const cFn = @extern(*const fn (*File, [*:0]const u8, *?*GLib.Error) callconv(.c) *File, .{ .name = "g_file_get_child_for_display_name" });
        const ret = cFn(self, arg_display_name, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getParent(self: *File) ?*File {
        const cFn = @extern(*const fn (*File) callconv(.c) ?*File, .{ .name = "g_file_get_parent" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getParseName(self: *File) [*:0]u8 {
        const cFn = @extern(*const fn (*File) callconv(.c) [*:0]u8, .{ .name = "g_file_get_parse_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPath(self: *File) ?[*:0]u8 {
        const cFn = @extern(*const fn (*File) callconv(.c) ?[*:0]u8, .{ .name = "g_file_get_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRelativePath(self: *File, arg_descendant: *File) ?[*:0]u8 {
        const cFn = @extern(*const fn (*File, *File) callconv(.c) ?[*:0]u8, .{ .name = "g_file_get_relative_path" });
        const ret = cFn(self, arg_descendant);
        return ret;
    }
    pub fn getUri(self: *File) [*:0]u8 {
        const cFn = @extern(*const fn (*File) callconv(.c) [*:0]u8, .{ .name = "g_file_get_uri" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUriScheme(self: *File) ?[*:0]u8 {
        const cFn = @extern(*const fn (*File) callconv(.c) ?[*:0]u8, .{ .name = "g_file_get_uri_scheme" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hasParent(self: *File, arg_parent: ?*File) bool {
        const cFn = @extern(*const fn (*File, ?*File) callconv(.c) bool, .{ .name = "g_file_has_parent" });
        const ret = cFn(self, arg_parent);
        return ret;
    }
    pub fn hasPrefix(self: *File, arg_prefix: *File) bool {
        const cFn = @extern(*const fn (*File, *File) callconv(.c) bool, .{ .name = "g_file_has_prefix" });
        const ret = cFn(self, arg_prefix);
        return ret;
    }
    pub fn hasUriScheme(self: *File, arg_uri_scheme: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*File, [*:0]const u8) callconv(.c) bool, .{ .name = "g_file_has_uri_scheme" });
        const ret = cFn(self, arg_uri_scheme);
        return ret;
    }
    pub fn hash(self: *File) u32 {
        const cFn = @extern(*const fn (*File) callconv(.c) u32, .{ .name = "g_file_hash" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isNative(self: *File) bool {
        const cFn = @extern(*const fn (*File) callconv(.c) bool, .{ .name = "g_file_is_native" });
        const ret = cFn(self);
        return ret;
    }
    pub fn loadBytes(self: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *GLib.Bytes,
        etag_out: ?[*:0]u8,
    } {
        var argO_etag_out: ?[*:0]u8 = undefined;
        const arg_etag_out: ?*?[*:0]u8 = &argO_etag_out;
        const cFn = @extern(*const fn (*File, ?*Cancellable, ?*?[*:0]u8, *?*GLib.Error) callconv(.c) *GLib.Bytes, .{ .name = "g_file_load_bytes" });
        const ret = cFn(self, arg_cancellable, arg_etag_out, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .etag_out = argO_etag_out };
    }
    pub fn loadBytesAsync(self: *File, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_load_bytes_async" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn loadBytesFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *GLib.Bytes,
        etag_out: ?[*:0]u8,
    } {
        var argO_etag_out: ?[*:0]u8 = undefined;
        const arg_etag_out: ?*?[*:0]u8 = &argO_etag_out;
        const cFn = @extern(*const fn (*File, *AsyncResult, ?*?[*:0]u8, *?*GLib.Error) callconv(.c) *GLib.Bytes, .{ .name = "g_file_load_bytes_finish" });
        const ret = cFn(self, arg_result, arg_etag_out, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .etag_out = argO_etag_out };
    }
    pub fn loadContents(self: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        contents: []u8,
        etag_out: ?[*:0]u8,
    } {
        var argO_contents: [*]u8 = undefined;
        const arg_contents: *[*]u8 = &argO_contents;
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        var argO_etag_out: ?[*:0]u8 = undefined;
        const arg_etag_out: ?*?[*:0]u8 = &argO_etag_out;
        const cFn = @extern(*const fn (*File, ?*Cancellable, *[*]u8, ?*u64, ?*?[*:0]u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_load_contents" });
        const ret = cFn(self, arg_cancellable, arg_contents, arg_length, arg_etag_out, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .contents = argO_contents[0..@intCast(argO_length)], .etag_out = argO_etag_out };
    }
    pub fn loadContentsAsync(self: *File, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_load_contents_async" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn loadContentsFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        contents: []u8,
        etag_out: ?[*:0]u8,
    } {
        var argO_contents: [*]u8 = undefined;
        const arg_contents: *[*]u8 = &argO_contents;
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        var argO_etag_out: ?[*:0]u8 = undefined;
        const arg_etag_out: ?*?[*:0]u8 = &argO_etag_out;
        const cFn = @extern(*const fn (*File, *AsyncResult, *[*]u8, ?*u64, ?*?[*:0]u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_load_contents_finish" });
        const ret = cFn(self, arg_res, arg_contents, arg_length, arg_etag_out, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .contents = argO_contents[0..@intCast(argO_length)], .etag_out = argO_etag_out };
    }
    pub fn loadPartialContentsFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        contents: []u8,
        etag_out: ?[*:0]u8,
    } {
        var argO_contents: [*]u8 = undefined;
        const arg_contents: *[*]u8 = &argO_contents;
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        var argO_etag_out: ?[*:0]u8 = undefined;
        const arg_etag_out: ?*?[*:0]u8 = &argO_etag_out;
        const cFn = @extern(*const fn (*File, *AsyncResult, *[*]u8, ?*u64, ?*?[*:0]u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_load_partial_contents_finish" });
        const ret = cFn(self, arg_res, arg_contents, arg_length, arg_etag_out, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .contents = argO_contents[0..@intCast(argO_length)], .etag_out = argO_etag_out };
    }
    pub fn makeDirectory(self: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_make_directory" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn makeDirectoryAsync(self: *File, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_make_directory_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn makeDirectoryFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_make_directory_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn makeDirectoryWithParents(self: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_make_directory_with_parents" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn makeSymbolicLink(self: *File, arg_symlink_value: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, [*:0]const u8, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_make_symbolic_link" });
        const ret = cFn(self, arg_symlink_value, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn makeSymbolicLinkAsync(self: *File, arg_symlink_value: [*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, [*:0]const u8, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_make_symbolic_link_async" });
        const ret = cFn(self, arg_symlink_value, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn makeSymbolicLinkFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_make_symbolic_link_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn measureDiskUsage(self: *File, arg_flags: FileMeasureFlags, arg_cancellable: ?*Cancellable, argC_progress_callback: core.Closure(?FileMeasureProgressCallback), arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        disk_usage: u64,
        num_dirs: u64,
        num_files: u64,
    } {
        const arg_progress_callback: ?FileMeasureProgressCallback = @ptrCast(argC_progress_callback.callback());
        defer argC_progress_callback.deinit();
        const arg_progress_data: ?*anyopaque = @ptrCast(argC_progress_callback.data());
        var argO_disk_usage: u64 = undefined;
        const arg_disk_usage: ?*u64 = &argO_disk_usage;
        var argO_num_dirs: u64 = undefined;
        const arg_num_dirs: ?*u64 = &argO_num_dirs;
        var argO_num_files: u64 = undefined;
        const arg_num_files: ?*u64 = &argO_num_files;
        const cFn = @extern(*const fn (*File, FileMeasureFlags, ?*Cancellable, ?FileMeasureProgressCallback, ?*anyopaque, ?*u64, ?*u64, ?*u64, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_measure_disk_usage" });
        const ret = cFn(self, arg_flags, arg_cancellable, arg_progress_callback, @ptrCast(arg_progress_data), arg_disk_usage, arg_num_dirs, arg_num_files, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .disk_usage = argO_disk_usage, .num_dirs = argO_num_dirs, .num_files = argO_num_files };
    }
    pub fn measureDiskUsageFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        disk_usage: u64,
        num_dirs: u64,
        num_files: u64,
    } {
        var argO_disk_usage: u64 = undefined;
        const arg_disk_usage: ?*u64 = &argO_disk_usage;
        var argO_num_dirs: u64 = undefined;
        const arg_num_dirs: ?*u64 = &argO_num_dirs;
        var argO_num_files: u64 = undefined;
        const arg_num_files: ?*u64 = &argO_num_files;
        const cFn = @extern(*const fn (*File, *AsyncResult, ?*u64, ?*u64, ?*u64, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_measure_disk_usage_finish" });
        const ret = cFn(self, arg_result, arg_disk_usage, arg_num_dirs, arg_num_files, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .disk_usage = argO_disk_usage, .num_dirs = argO_num_dirs, .num_files = argO_num_files };
    }
    pub fn monitor(self: *File, arg_flags: FileMonitorFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileMonitor {
        const cFn = @extern(*const fn (*File, FileMonitorFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileMonitor, .{ .name = "g_file_monitor" });
        const ret = cFn(self, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn monitorDirectory(self: *File, arg_flags: FileMonitorFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileMonitor {
        const cFn = @extern(*const fn (*File, FileMonitorFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileMonitor, .{ .name = "g_file_monitor_directory" });
        const ret = cFn(self, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn monitorFile(self: *File, arg_flags: FileMonitorFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileMonitor {
        const cFn = @extern(*const fn (*File, FileMonitorFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileMonitor, .{ .name = "g_file_monitor_file" });
        const ret = cFn(self, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn mountEnclosingVolume(self: *File, arg_flags: MountMountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, MountMountFlags, ?*MountOperation, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_mount_enclosing_volume" });
        const ret = cFn(self, arg_flags, arg_mount_operation, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn mountEnclosingVolumeFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_mount_enclosing_volume_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn mountMountable(self: *File, arg_flags: MountMountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, MountMountFlags, ?*MountOperation, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_mount_mountable" });
        const ret = cFn(self, arg_flags, arg_mount_operation, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn mountMountableFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*File {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) *File, .{ .name = "g_file_mount_mountable_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn move(self: *File, arg_destination: *File, arg_flags: FileCopyFlags, arg_cancellable: ?*Cancellable, argC_progress_callback: core.Closure(?FileProgressCallback), arg_error: *?*GLib.Error) error{GError}!bool {
        const arg_progress_callback: ?FileProgressCallback = @ptrCast(argC_progress_callback.callback());
        defer argC_progress_callback.deinit();
        const arg_progress_callback_data: ?*anyopaque = @ptrCast(argC_progress_callback.data());
        const cFn = @extern(*const fn (*File, *File, FileCopyFlags, ?*Cancellable, ?FileProgressCallback, ?*anyopaque, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_move" });
        const ret = cFn(self, arg_destination, arg_flags, arg_cancellable, arg_progress_callback, @ptrCast(arg_progress_callback_data), arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn moveAsync(self: *File, arg_destination: *File, arg_flags: FileCopyFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_progress_callback_closure: ?*GObject.Closure, arg_ready_callback_closure: *GObject.Closure) void {
        const cFn = @extern(*const fn (*File, *File, FileCopyFlags, i32, ?*Cancellable, ?*GObject.Closure, *GObject.Closure) callconv(.c) void, .{ .name = "g_file_move_async_with_closures" });
        const ret = cFn(self, arg_destination, arg_flags, arg_io_priority, arg_cancellable, arg_progress_callback_closure, arg_ready_callback_closure);
        return ret;
    }
    pub fn moveFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_move_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn openReadwrite(self: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileIOStream {
        const cFn = @extern(*const fn (*File, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileIOStream, .{ .name = "g_file_open_readwrite" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn openReadwriteAsync(self: *File, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_open_readwrite_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn openReadwriteFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*FileIOStream {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) *FileIOStream, .{ .name = "g_file_open_readwrite_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn peekPath(self: *File) ?[*:0]u8 {
        const cFn = @extern(*const fn (*File) callconv(.c) ?[*:0]u8, .{ .name = "g_file_peek_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn pollMountable(self: *File, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_poll_mountable" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn pollMountableFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_poll_mountable_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn queryDefaultHandler(self: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*AppInfo {
        const cFn = @extern(*const fn (*File, ?*Cancellable, *?*GLib.Error) callconv(.c) *AppInfo, .{ .name = "g_file_query_default_handler" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn queryDefaultHandlerAsync(self: *File, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_query_default_handler_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn queryDefaultHandlerFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*AppInfo {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) *AppInfo, .{ .name = "g_file_query_default_handler_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn queryExists(self: *File, arg_cancellable: ?*Cancellable) bool {
        const cFn = @extern(*const fn (*File, ?*Cancellable) callconv(.c) bool, .{ .name = "g_file_query_exists" });
        const ret = cFn(self, arg_cancellable);
        return ret;
    }
    pub fn queryFileType(self: *File, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable) FileType {
        const cFn = @extern(*const fn (*File, FileQueryInfoFlags, ?*Cancellable) callconv(.c) FileType, .{ .name = "g_file_query_file_type" });
        const ret = cFn(self, arg_flags, arg_cancellable);
        return ret;
    }
    pub fn queryFilesystemInfo(self: *File, arg_attributes: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileInfo {
        const cFn = @extern(*const fn (*File, [*:0]const u8, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileInfo, .{ .name = "g_file_query_filesystem_info" });
        const ret = cFn(self, arg_attributes, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn queryFilesystemInfoAsync(self: *File, arg_attributes: [*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, [*:0]const u8, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_query_filesystem_info_async" });
        const ret = cFn(self, arg_attributes, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn queryFilesystemInfoFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*FileInfo {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) *FileInfo, .{ .name = "g_file_query_filesystem_info_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn queryInfo(self: *File, arg_attributes: [*:0]const u8, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileInfo {
        const cFn = @extern(*const fn (*File, [*:0]const u8, FileQueryInfoFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileInfo, .{ .name = "g_file_query_info" });
        const ret = cFn(self, arg_attributes, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn queryInfoAsync(self: *File, arg_attributes: [*:0]const u8, arg_flags: FileQueryInfoFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, [*:0]const u8, FileQueryInfoFlags, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_query_info_async" });
        const ret = cFn(self, arg_attributes, arg_flags, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn queryInfoFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*FileInfo {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) *FileInfo, .{ .name = "g_file_query_info_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn querySettableAttributes(self: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileAttributeInfoList {
        const cFn = @extern(*const fn (*File, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileAttributeInfoList, .{ .name = "g_file_query_settable_attributes" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn queryWritableNamespaces(self: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileAttributeInfoList {
        const cFn = @extern(*const fn (*File, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileAttributeInfoList, .{ .name = "g_file_query_writable_namespaces" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn read(self: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileInputStream {
        const cFn = @extern(*const fn (*File, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileInputStream, .{ .name = "g_file_read" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn readAsync(self: *File, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_read_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn readFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*FileInputStream {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) *FileInputStream, .{ .name = "g_file_read_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn replace(self: *File, arg_etag: ?[*:0]const u8, arg_make_backup: bool, arg_flags: FileCreateFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileOutputStream {
        const cFn = @extern(*const fn (*File, ?[*:0]const u8, bool, FileCreateFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileOutputStream, .{ .name = "g_file_replace" });
        const ret = cFn(self, arg_etag, arg_make_backup, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn replaceAsync(self: *File, arg_etag: ?[*:0]const u8, arg_make_backup: bool, arg_flags: FileCreateFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, ?[*:0]const u8, bool, FileCreateFlags, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_replace_async" });
        const ret = cFn(self, arg_etag, arg_make_backup, arg_flags, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn replaceContents(self: *File, argS_contents: []u8, arg_etag: ?[*:0]const u8, arg_make_backup: bool, arg_flags: FileCreateFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        new_etag: ?[*:0]u8,
    } {
        const arg_contents: [*]u8 = @ptrCast(argS_contents);
        const arg_length: u64 = @intCast((argS_contents).len);
        var argO_new_etag: ?[*:0]u8 = undefined;
        const arg_new_etag: ?*?[*:0]u8 = &argO_new_etag;
        const cFn = @extern(*const fn (*File, [*]u8, u64, ?[*:0]const u8, bool, FileCreateFlags, ?*?[*:0]u8, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_replace_contents" });
        const ret = cFn(self, arg_contents, arg_length, arg_etag, arg_make_backup, arg_flags, arg_new_etag, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .new_etag = argO_new_etag };
    }
    pub fn replaceContentsAsync(self: *File, argS_contents: []u8, arg_etag: ?[*:0]const u8, arg_make_backup: bool, arg_flags: FileCreateFlags, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_contents: [*]u8 = @ptrCast(argS_contents);
        const arg_length: u64 = @intCast((argS_contents).len);
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, [*]u8, u64, ?[*:0]const u8, bool, FileCreateFlags, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_replace_contents_async" });
        const ret = cFn(self, arg_contents, arg_length, arg_etag, arg_make_backup, arg_flags, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn replaceContentsBytesAsync(self: *File, arg_contents: *GLib.Bytes, arg_etag: ?[*:0]const u8, arg_make_backup: bool, arg_flags: FileCreateFlags, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, *GLib.Bytes, ?[*:0]const u8, bool, FileCreateFlags, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_replace_contents_bytes_async" });
        const ret = cFn(self, arg_contents, arg_etag, arg_make_backup, arg_flags, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn replaceContentsFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        new_etag: ?[*:0]u8,
    } {
        var argO_new_etag: ?[*:0]u8 = undefined;
        const arg_new_etag: ?*?[*:0]u8 = &argO_new_etag;
        const cFn = @extern(*const fn (*File, *AsyncResult, ?*?[*:0]u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_replace_contents_finish" });
        const ret = cFn(self, arg_res, arg_new_etag, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .new_etag = argO_new_etag };
    }
    pub fn replaceFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*FileOutputStream {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) *FileOutputStream, .{ .name = "g_file_replace_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn replaceReadwrite(self: *File, arg_etag: ?[*:0]const u8, arg_make_backup: bool, arg_flags: FileCreateFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileIOStream {
        const cFn = @extern(*const fn (*File, ?[*:0]const u8, bool, FileCreateFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileIOStream, .{ .name = "g_file_replace_readwrite" });
        const ret = cFn(self, arg_etag, arg_make_backup, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn replaceReadwriteAsync(self: *File, arg_etag: ?[*:0]const u8, arg_make_backup: bool, arg_flags: FileCreateFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, ?[*:0]const u8, bool, FileCreateFlags, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_replace_readwrite_async" });
        const ret = cFn(self, arg_etag, arg_make_backup, arg_flags, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn replaceReadwriteFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*FileIOStream {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) *FileIOStream, .{ .name = "g_file_replace_readwrite_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn resolveRelativePath(self: *File, arg_relative_path: [*:0]const u8) *File {
        const cFn = @extern(*const fn (*File, [*:0]const u8) callconv(.c) *File, .{ .name = "g_file_resolve_relative_path" });
        const ret = cFn(self, arg_relative_path);
        return ret;
    }
    pub fn setAttribute(self: *File, arg_attribute: [*:0]const u8, arg_type: FileAttributeType, arg_value_p: ?*anyopaque, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, [*:0]const u8, FileAttributeType, ?*anyopaque, FileQueryInfoFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_set_attribute" });
        const ret = cFn(self, arg_attribute, arg_type, @ptrCast(arg_value_p), arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setAttributeByteString(self: *File, arg_attribute: [*:0]const u8, arg_value: [*:0]const u8, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, [*:0]const u8, [*:0]const u8, FileQueryInfoFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_set_attribute_byte_string" });
        const ret = cFn(self, arg_attribute, arg_value, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setAttributeInt32(self: *File, arg_attribute: [*:0]const u8, arg_value: i32, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, [*:0]const u8, i32, FileQueryInfoFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_set_attribute_int32" });
        const ret = cFn(self, arg_attribute, arg_value, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setAttributeInt64(self: *File, arg_attribute: [*:0]const u8, arg_value: i64, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, [*:0]const u8, i64, FileQueryInfoFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_set_attribute_int64" });
        const ret = cFn(self, arg_attribute, arg_value, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setAttributeString(self: *File, arg_attribute: [*:0]const u8, arg_value: [*:0]const u8, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, [*:0]const u8, [*:0]const u8, FileQueryInfoFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_set_attribute_string" });
        const ret = cFn(self, arg_attribute, arg_value, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setAttributeUint32(self: *File, arg_attribute: [*:0]const u8, arg_value: u32, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, [*:0]const u8, u32, FileQueryInfoFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_set_attribute_uint32" });
        const ret = cFn(self, arg_attribute, arg_value, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setAttributeUint64(self: *File, arg_attribute: [*:0]const u8, arg_value: u64, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, [*:0]const u8, u64, FileQueryInfoFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_set_attribute_uint64" });
        const ret = cFn(self, arg_attribute, arg_value, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setAttributesAsync(self: *File, arg_info: *FileInfo, arg_flags: FileQueryInfoFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, *FileInfo, FileQueryInfoFlags, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_set_attributes_async" });
        const ret = cFn(self, arg_info, arg_flags, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn setAttributesFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        info: *FileInfo,
    } {
        var argO_info: *FileInfo = undefined;
        const arg_info: **FileInfo = &argO_info;
        const cFn = @extern(*const fn (*File, *AsyncResult, **FileInfo, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_set_attributes_finish" });
        const ret = cFn(self, arg_result, arg_info, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .info = argO_info };
    }
    pub fn setAttributesFromInfo(self: *File, arg_info: *FileInfo, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *FileInfo, FileQueryInfoFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_set_attributes_from_info" });
        const ret = cFn(self, arg_info, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setDisplayName(self: *File, arg_display_name: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*File {
        const cFn = @extern(*const fn (*File, [*:0]const u8, ?*Cancellable, *?*GLib.Error) callconv(.c) *File, .{ .name = "g_file_set_display_name" });
        const ret = cFn(self, arg_display_name, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setDisplayNameAsync(self: *File, arg_display_name: [*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, [*:0]const u8, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_set_display_name_async" });
        const ret = cFn(self, arg_display_name, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn setDisplayNameFinish(self: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*File {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) *File, .{ .name = "g_file_set_display_name_finish" });
        const ret = cFn(self, arg_res, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn startMountable(self: *File, arg_flags: DriveStartFlags, arg_start_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, DriveStartFlags, ?*MountOperation, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_start_mountable" });
        const ret = cFn(self, arg_flags, arg_start_operation, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn startMountableFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_start_mountable_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn stopMountable(self: *File, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, MountUnmountFlags, ?*MountOperation, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_stop_mountable" });
        const ret = cFn(self, arg_flags, arg_mount_operation, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn stopMountableFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_stop_mountable_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn supportsThreadContexts(self: *File) bool {
        const cFn = @extern(*const fn (*File) callconv(.c) bool, .{ .name = "g_file_supports_thread_contexts" });
        const ret = cFn(self);
        return ret;
    }
    pub fn trash(self: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_trash" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn trashAsync(self: *File, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_trash_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn trashFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_trash_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn unmountMountable(self: *File, arg_flags: MountUnmountFlags, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, MountUnmountFlags, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_unmount_mountable" });
        const ret = cFn(self, arg_flags, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn unmountMountableFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_unmount_mountable_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn unmountMountableWithOperation(self: *File, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*File, MountUnmountFlags, ?*MountOperation, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_unmount_mountable_with_operation" });
        const ret = cFn(self, arg_flags, arg_mount_operation, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn unmountMountableWithOperationFinish(self: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*File, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_unmount_mountable_with_operation_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FileAttributeInfo = extern struct {
    name: ?[*:0]const u8,
    type: FileAttributeType,
    flags: FileAttributeInfoFlags,
};
pub const FileAttributeInfoFlags = packed struct(u32) {
    copy_with_file: bool = false,
    copy_when_moved: bool = false,
    _: u30 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_attribute_info_flags_get_type" });
        return cFn();
    }
};
pub const FileAttributeInfoList = extern struct {
    infos: ?*FileAttributeInfo,
    n_infos: i32,
    pub fn new() *FileAttributeInfoList {
        const cFn = @extern(*const fn () callconv(.c) *FileAttributeInfoList, .{ .name = "g_file_attribute_info_list_new" });
        const ret = cFn();
        return ret;
    }
    pub fn add(self: *FileAttributeInfoList, arg_name: [*:0]const u8, arg_type: FileAttributeType, arg_flags: FileAttributeInfoFlags) void {
        const cFn = @extern(*const fn (*FileAttributeInfoList, [*:0]const u8, FileAttributeType, FileAttributeInfoFlags) callconv(.c) void, .{ .name = "g_file_attribute_info_list_add" });
        const ret = cFn(self, arg_name, arg_type, arg_flags);
        return ret;
    }
    pub fn dup(self: *FileAttributeInfoList) *FileAttributeInfoList {
        const cFn = @extern(*const fn (*FileAttributeInfoList) callconv(.c) *FileAttributeInfoList, .{ .name = "g_file_attribute_info_list_dup" });
        const ret = cFn(self);
        return ret;
    }
    pub fn lookup(self: *FileAttributeInfoList, arg_name: [*:0]const u8) *FileAttributeInfo {
        const cFn = @extern(*const fn (*FileAttributeInfoList, [*:0]const u8) callconv(.c) *FileAttributeInfo, .{ .name = "g_file_attribute_info_list_lookup" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn ref(self: *FileAttributeInfoList) *FileAttributeInfoList {
        const cFn = @extern(*const fn (*FileAttributeInfoList) callconv(.c) *FileAttributeInfoList, .{ .name = "g_file_attribute_info_list_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *FileAttributeInfoList) void {
        const cFn = @extern(*const fn (*FileAttributeInfoList) callconv(.c) void, .{ .name = "g_file_attribute_info_list_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_attribute_info_list_get_type" });
        return cFn();
    }
};
pub const FileAttributeMatcher = opaque {
    pub fn new(arg_attributes: [*:0]const u8) *FileAttributeMatcher {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *FileAttributeMatcher, .{ .name = "g_file_attribute_matcher_new" });
        const ret = cFn(arg_attributes);
        return ret;
    }
    pub fn enumerateNamespace(self: *FileAttributeMatcher, arg_ns: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*FileAttributeMatcher, [*:0]const u8) callconv(.c) bool, .{ .name = "g_file_attribute_matcher_enumerate_namespace" });
        const ret = cFn(self, arg_ns);
        return ret;
    }
    pub fn enumerateNext(self: *FileAttributeMatcher) ?[*:0]u8 {
        const cFn = @extern(*const fn (*FileAttributeMatcher) callconv(.c) ?[*:0]u8, .{ .name = "g_file_attribute_matcher_enumerate_next" });
        const ret = cFn(self);
        return ret;
    }
    pub fn matches(self: *FileAttributeMatcher, arg_attribute: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*FileAttributeMatcher, [*:0]const u8) callconv(.c) bool, .{ .name = "g_file_attribute_matcher_matches" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn matchesOnly(self: *FileAttributeMatcher, arg_attribute: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*FileAttributeMatcher, [*:0]const u8) callconv(.c) bool, .{ .name = "g_file_attribute_matcher_matches_only" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn ref(self: *FileAttributeMatcher) *FileAttributeMatcher {
        const cFn = @extern(*const fn (*FileAttributeMatcher) callconv(.c) *FileAttributeMatcher, .{ .name = "g_file_attribute_matcher_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn subtract(self: *FileAttributeMatcher, arg_subtract: ?*FileAttributeMatcher) ?*FileAttributeMatcher {
        const cFn = @extern(*const fn (*FileAttributeMatcher, ?*FileAttributeMatcher) callconv(.c) ?*FileAttributeMatcher, .{ .name = "g_file_attribute_matcher_subtract" });
        const ret = cFn(self, arg_subtract);
        return ret;
    }
    pub fn toString(self: *FileAttributeMatcher) [*:0]u8 {
        const cFn = @extern(*const fn (*FileAttributeMatcher) callconv(.c) [*:0]u8, .{ .name = "g_file_attribute_matcher_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *FileAttributeMatcher) void {
        const cFn = @extern(*const fn (*FileAttributeMatcher) callconv(.c) void, .{ .name = "g_file_attribute_matcher_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_attribute_matcher_get_type" });
        return cFn();
    }
};
pub const FileAttributeStatus = enum(u32) {
    unset = 0,
    set = 1,
    error_setting = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_attribute_status_get_type" });
        return cFn();
    }
};
pub const FileAttributeType = enum(u32) {
    invalid = 0,
    string = 1,
    byte_string = 2,
    boolean = 3,
    uint32 = 4,
    int32 = 5,
    uint64 = 6,
    int64 = 7,
    object = 8,
    stringv = 9,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_attribute_type_get_type" });
        return cFn();
    }
};
pub const FileCopyFlags = packed struct(u32) {
    overwrite: bool = false,
    backup: bool = false,
    nofollow_symlinks: bool = false,
    all_metadata: bool = false,
    no_fallback_for_move: bool = false,
    target_default_perms: bool = false,
    target_default_modified_time: bool = false,
    _: u25 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_copy_flags_get_type" });
        return cFn();
    }
};
pub const FileCreateFlags = packed struct(u32) {
    private: bool = false,
    replace_destination: bool = false,
    _: u30 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_create_flags_get_type" });
        return cFn();
    }
};
pub const FileDescriptorBased = struct {
    pub const Class = FileDescriptorBasedIface;
    pub fn getFd(self: *FileDescriptorBased) i32 {
        const cFn = @extern(*const fn (*FileDescriptorBased) callconv(.c) i32, .{ .name = "g_file_descriptor_based_get_fd" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_descriptor_based_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FileDescriptorBasedIface = extern struct {
    g_iface: GObject.TypeInterface,
    get_fd: ?*const fn (arg_fd_based: *FileDescriptorBased) callconv(.c) i32,
};
pub const FileEnumerator = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = FileEnumeratorClass;
    _props: struct {
        container: core.Property(File, "container") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*FileEnumeratorPrivate,
    pub fn close(self: *FileEnumerator, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*FileEnumerator, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_enumerator_close" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn closeAsync(self: *FileEnumerator, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*FileEnumerator, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_enumerator_close_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn closeFinish(self: *FileEnumerator, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*FileEnumerator, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_enumerator_close_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getChild(self: *FileEnumerator, arg_info: *FileInfo) *File {
        const cFn = @extern(*const fn (*FileEnumerator, *FileInfo) callconv(.c) *File, .{ .name = "g_file_enumerator_get_child" });
        const ret = cFn(self, arg_info);
        return ret;
    }
    pub fn getContainer(self: *FileEnumerator) *File {
        const cFn = @extern(*const fn (*FileEnumerator) callconv(.c) *File, .{ .name = "g_file_enumerator_get_container" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hasPending(self: *FileEnumerator) bool {
        const cFn = @extern(*const fn (*FileEnumerator) callconv(.c) bool, .{ .name = "g_file_enumerator_has_pending" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isClosed(self: *FileEnumerator) bool {
        const cFn = @extern(*const fn (*FileEnumerator) callconv(.c) bool, .{ .name = "g_file_enumerator_is_closed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn iterate(self: *FileEnumerator, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        out_info: *FileInfo,
        out_child: *File,
    } {
        var argO_out_info: ?*FileInfo = undefined;
        const arg_out_info: ?**FileInfo = &argO_out_info;
        var argO_out_child: ?*File = undefined;
        const arg_out_child: ?**File = &argO_out_child;
        const cFn = @extern(*const fn (*FileEnumerator, ?**FileInfo, ?**File, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_enumerator_iterate" });
        const ret = cFn(self, arg_out_info, arg_out_child, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .out_info = argO_out_info, .out_child = argO_out_child };
    }
    pub fn nextFile(self: *FileEnumerator, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!?*FileInfo {
        const cFn = @extern(*const fn (*FileEnumerator, ?*Cancellable, *?*GLib.Error) callconv(.c) ?*FileInfo, .{ .name = "g_file_enumerator_next_file" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn nextFilesAsync(self: *FileEnumerator, arg_num_files: i32, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*FileEnumerator, i32, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_enumerator_next_files_async" });
        const ret = cFn(self, arg_num_files, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn nextFilesFinish(self: *FileEnumerator, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!?*GLib.List {
        const cFn = @extern(*const fn (*FileEnumerator, *AsyncResult, *?*GLib.Error) callconv(.c) ?*GLib.List, .{ .name = "g_file_enumerator_next_files_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setPending(self: *FileEnumerator, arg_pending: bool) void {
        const cFn = @extern(*const fn (*FileEnumerator, bool) callconv(.c) void, .{ .name = "g_file_enumerator_set_pending" });
        const ret = cFn(self, arg_pending);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_enumerator_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FileEnumeratorClass = extern struct {
    parent_class: GObject.ObjectClass,
    next_file: ?*const fn (arg_enumerator: *FileEnumerator, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) ?*FileInfo,
    close_fn: ?*const fn (arg_enumerator: *FileEnumerator, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    next_files_async: ?*const fn (arg_enumerator: *FileEnumerator, arg_num_files: i32, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    next_files_finish: ?*const fn (arg_enumerator: *FileEnumerator, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) ?*GLib.List,
    close_async: ?*const fn (arg_enumerator: *FileEnumerator, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    close_finish: ?*const fn (arg_enumerator: *FileEnumerator, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
    _g_reserved6: ?*anyopaque,
    _g_reserved7: ?*anyopaque,
};
pub const FileEnumeratorPrivate = opaque {};
pub const FileIOStream = extern struct {
    pub const Interfaces = [_]type{Seekable};
    pub const Parent = IOStream;
    pub const Class = FileIOStreamClass;
    parent_instance: IOStream,
    priv: ?*FileIOStreamPrivate,
    pub fn getEtag(self: *FileIOStream) ?[*:0]u8 {
        const cFn = @extern(*const fn (*FileIOStream) callconv(.c) ?[*:0]u8, .{ .name = "g_file_io_stream_get_etag" });
        const ret = cFn(self);
        return ret;
    }
    pub fn queryInfo(self: *FileIOStream, arg_attributes: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileInfo {
        const cFn = @extern(*const fn (*FileIOStream, [*:0]const u8, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileInfo, .{ .name = "g_file_io_stream_query_info" });
        const ret = cFn(self, arg_attributes, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn queryInfoAsync(self: *FileIOStream, arg_attributes: [*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*FileIOStream, [*:0]const u8, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_io_stream_query_info_async" });
        const ret = cFn(self, arg_attributes, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn queryInfoFinish(self: *FileIOStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*FileInfo {
        const cFn = @extern(*const fn (*FileIOStream, *AsyncResult, *?*GLib.Error) callconv(.c) *FileInfo, .{ .name = "g_file_io_stream_query_info_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_io_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FileIOStreamClass = extern struct {
    parent_class: IOStreamClass,
    tell: ?*const fn (arg_stream: *FileIOStream) callconv(.c) i64,
    can_seek: ?*const fn (arg_stream: *FileIOStream) callconv(.c) bool,
    seek: ?*const fn (arg_stream: *FileIOStream, arg_offset: i64, arg_type: GLib.SeekType, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    can_truncate: ?*const fn (arg_stream: *FileIOStream) callconv(.c) bool,
    truncate_fn: ?*const fn (arg_stream: *FileIOStream, arg_size: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    query_info: ?*const fn (arg_stream: *FileIOStream, arg_attributes: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileInfo,
    query_info_async: ?*const fn (arg_stream: *FileIOStream, arg_attributes: [*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    query_info_finish: ?*const fn (arg_stream: *FileIOStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *FileInfo,
    get_etag: ?*const fn (arg_stream: *FileIOStream) callconv(.c) ?[*:0]u8,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const FileIOStreamPrivate = opaque {};
pub const FileIcon = struct {
    pub const Interfaces = [_]type{ Icon, LoadableIcon };
    pub const Parent = GObject.Object;
    pub const Class = FileIconClass;
    _props: struct {
        file: core.Property(File, "file") = .{},
    },
    pub fn new(arg_file: *File) *FileIcon {
        const cFn = @extern(*const fn (*File) callconv(.c) *FileIcon, .{ .name = "g_file_icon_new" });
        const ret = cFn(arg_file);
        return ret;
    }
    pub fn getFile(self: *FileIcon) *File {
        const cFn = @extern(*const fn (*FileIcon) callconv(.c) *File, .{ .name = "g_file_icon_get_file" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_icon_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FileIconClass = opaque {};
pub const FileIface = extern struct {
    g_iface: GObject.TypeInterface,
    dup: ?*const fn (arg_file: *File) callconv(.c) *File,
    hash: ?*const fn (arg_file: *File) callconv(.c) u32,
    equal: ?*const fn (arg_file1: *File, arg_file2: *File) callconv(.c) bool,
    is_native: ?*const fn (arg_file: *File) callconv(.c) bool,
    has_uri_scheme: ?*const fn (arg_file: *File, arg_uri_scheme: [*:0]const u8) callconv(.c) bool,
    get_uri_scheme: ?*const fn (arg_file: *File) callconv(.c) ?[*:0]u8,
    get_basename: ?*const fn (arg_file: *File) callconv(.c) ?[*:0]u8,
    get_path: ?*const fn (arg_file: *File) callconv(.c) ?[*:0]u8,
    get_uri: ?*const fn (arg_file: *File) callconv(.c) [*:0]u8,
    get_parse_name: ?*const fn (arg_file: *File) callconv(.c) [*:0]u8,
    get_parent: ?*const fn (arg_file: *File) callconv(.c) ?*File,
    prefix_matches: ?*const fn (arg_prefix: *File, arg_file: *File) callconv(.c) bool,
    get_relative_path: ?*const fn (arg_parent: *File, arg_descendant: *File) callconv(.c) ?[*:0]u8,
    resolve_relative_path: ?*const fn (arg_file: *File, arg_relative_path: [*:0]const u8) callconv(.c) *File,
    get_child_for_display_name: ?*const fn (arg_file: *File, arg_display_name: [*:0]const u8, arg_error: *?*GLib.Error) callconv(.c) *File,
    enumerate_children: ?*const fn (arg_file: *File, arg_attributes: [*:0]const u8, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileEnumerator,
    enumerate_children_async: ?*const fn (arg_file: *File, arg_attributes: [*:0]const u8, arg_flags: FileQueryInfoFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    enumerate_children_finish: ?*const fn (arg_file: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *FileEnumerator,
    query_info: ?*const fn (arg_file: *File, arg_attributes: [*:0]const u8, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileInfo,
    query_info_async: ?*const fn (arg_file: *File, arg_attributes: [*:0]const u8, arg_flags: FileQueryInfoFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    query_info_finish: ?*const fn (arg_file: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *FileInfo,
    query_filesystem_info: ?*const fn (arg_file: *File, arg_attributes: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileInfo,
    query_filesystem_info_async: ?*const fn (arg_file: *File, arg_attributes: [*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    query_filesystem_info_finish: ?*const fn (arg_file: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *FileInfo,
    find_enclosing_mount: ?*const fn (arg_file: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *Mount,
    find_enclosing_mount_async: ?*const fn (arg_file: *File, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    find_enclosing_mount_finish: ?*const fn (arg_file: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *Mount,
    set_display_name: ?*const fn (arg_file: *File, arg_display_name: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *File,
    set_display_name_async: ?*const fn (arg_file: *File, arg_display_name: [*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    set_display_name_finish: ?*const fn (arg_file: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *File,
    query_settable_attributes: ?*const fn (arg_file: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileAttributeInfoList,
    _query_settable_attributes_async: ?*anyopaque,
    _query_settable_attributes_finish: ?*anyopaque,
    query_writable_namespaces: ?*const fn (arg_file: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileAttributeInfoList,
    _query_writable_namespaces_async: ?*anyopaque,
    _query_writable_namespaces_finish: ?*anyopaque,
    set_attribute: ?*const fn (arg_file: *File, arg_attribute: [*:0]const u8, arg_type: FileAttributeType, arg_value_p: ?*anyopaque, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    set_attributes_from_info: ?*const fn (arg_file: *File, arg_info: *FileInfo, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    set_attributes_async: ?*const fn (arg_file: *File, arg_info: *FileInfo, arg_flags: FileQueryInfoFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    set_attributes_finish: ?*const fn (arg_file: *File, arg_result: *AsyncResult, arg_info: **FileInfo, arg_error: *?*GLib.Error) callconv(.c) bool,
    read_fn: ?*const fn (arg_file: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileInputStream,
    read_async: ?*const fn (arg_file: *File, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    read_finish: ?*const fn (arg_file: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *FileInputStream,
    append_to: ?*const fn (arg_file: *File, arg_flags: FileCreateFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileOutputStream,
    append_to_async: ?*const fn (arg_file: *File, arg_flags: FileCreateFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    append_to_finish: ?*const fn (arg_file: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *FileOutputStream,
    create: ?*const fn (arg_file: *File, arg_flags: FileCreateFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileOutputStream,
    create_async: ?*const fn (arg_file: *File, arg_flags: FileCreateFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    create_finish: ?*const fn (arg_file: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *FileOutputStream,
    replace: ?*const fn (arg_file: *File, arg_etag: ?[*:0]const u8, arg_make_backup: bool, arg_flags: FileCreateFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileOutputStream,
    replace_async: ?*const fn (arg_file: *File, arg_etag: ?[*:0]const u8, arg_make_backup: bool, arg_flags: FileCreateFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    replace_finish: ?*const fn (arg_file: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *FileOutputStream,
    delete_file: ?*const fn (arg_file: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    delete_file_async: ?*const fn (arg_file: *File, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    delete_file_finish: ?*const fn (arg_file: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    trash: ?*const fn (arg_file: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    trash_async: ?*const fn (arg_file: *File, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    trash_finish: ?*const fn (arg_file: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    make_directory: ?*const fn (arg_file: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    make_directory_async: ?*const fn (arg_file: *File, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    make_directory_finish: ?*const fn (arg_file: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    make_symbolic_link: ?*const fn (arg_file: *File, arg_symlink_value: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    make_symbolic_link_async: ?*const fn (arg_file: *File, arg_symlink_value: [*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    make_symbolic_link_finish: ?*const fn (arg_file: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    copy: ?*const fn (arg_source: *File, arg_destination: *File, arg_flags: FileCopyFlags, arg_cancellable: ?*Cancellable, arg_progress_callback: ?FileProgressCallback, arg_progress_callback_data: ?*anyopaque, arg_error: *?*GLib.Error) callconv(.c) bool,
    copy_async: ?*const fn (arg_source: *File, arg_destination: *File, arg_flags: FileCopyFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_progress_callback: ?FileProgressCallback, arg_progress_callback_data: ?*anyopaque, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    copy_finish: ?*const fn (arg_file: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    move: ?*const fn (arg_source: *File, arg_destination: *File, arg_flags: FileCopyFlags, arg_cancellable: ?*Cancellable, arg_progress_callback: ?FileProgressCallback, arg_progress_callback_data: ?*anyopaque, arg_error: *?*GLib.Error) callconv(.c) bool,
    move_async: ?*const fn (arg_source: *File, arg_destination: *File, arg_flags: FileCopyFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_progress_callback: ?FileProgressCallback, arg_progress_callback_data: ?*anyopaque, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    move_finish: ?*const fn (arg_file: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    mount_mountable: ?*const fn (arg_file: *File, arg_flags: MountMountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    mount_mountable_finish: ?*const fn (arg_file: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *File,
    unmount_mountable: ?*const fn (arg_file: *File, arg_flags: MountUnmountFlags, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    unmount_mountable_finish: ?*const fn (arg_file: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    eject_mountable: ?*const fn (arg_file: *File, arg_flags: MountUnmountFlags, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    eject_mountable_finish: ?*const fn (arg_file: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    mount_enclosing_volume: ?*const fn (arg_location: *File, arg_flags: MountMountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    mount_enclosing_volume_finish: ?*const fn (arg_location: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    monitor_dir: ?*const fn (arg_file: *File, arg_flags: FileMonitorFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileMonitor,
    monitor_file: ?*const fn (arg_file: *File, arg_flags: FileMonitorFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileMonitor,
    open_readwrite: ?*const fn (arg_file: *File, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileIOStream,
    open_readwrite_async: ?*const fn (arg_file: *File, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    open_readwrite_finish: ?*const fn (arg_file: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *FileIOStream,
    create_readwrite: ?*const fn (arg_file: *File, arg_flags: FileCreateFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileIOStream,
    create_readwrite_async: ?*const fn (arg_file: *File, arg_flags: FileCreateFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    create_readwrite_finish: ?*const fn (arg_file: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *FileIOStream,
    replace_readwrite: ?*const fn (arg_file: *File, arg_etag: ?[*:0]const u8, arg_make_backup: bool, arg_flags: FileCreateFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileIOStream,
    replace_readwrite_async: ?*const fn (arg_file: *File, arg_etag: ?[*:0]const u8, arg_make_backup: bool, arg_flags: FileCreateFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    replace_readwrite_finish: ?*const fn (arg_file: *File, arg_res: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *FileIOStream,
    start_mountable: ?*const fn (arg_file: *File, arg_flags: DriveStartFlags, arg_start_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    start_mountable_finish: ?*const fn (arg_file: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    stop_mountable: ?*const fn (arg_file: *File, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    stop_mountable_finish: ?*const fn (arg_file: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    supports_thread_contexts: bool,
    unmount_mountable_with_operation: ?*const fn (arg_file: *File, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    unmount_mountable_with_operation_finish: ?*const fn (arg_file: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    eject_mountable_with_operation: ?*const fn (arg_file: *File, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    eject_mountable_with_operation_finish: ?*const fn (arg_file: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    poll_mountable: ?*const fn (arg_file: *File, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    poll_mountable_finish: ?*const fn (arg_file: *File, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    measure_disk_usage: ?*const fn (arg_file: *File, arg_flags: FileMeasureFlags, arg_cancellable: ?*Cancellable, arg_progress_callback: ?FileMeasureProgressCallback, arg_progress_data: ?*anyopaque, arg_disk_usage: ?*u64, arg_num_dirs: ?*u64, arg_num_files: ?*u64, arg_error: *?*GLib.Error) callconv(.c) bool,
    measure_disk_usage_async: ?*anyopaque,
    measure_disk_usage_finish: ?*const fn (arg_file: *File, arg_result: *AsyncResult, arg_disk_usage: ?*u64, arg_num_dirs: ?*u64, arg_num_files: ?*u64, arg_error: *?*GLib.Error) callconv(.c) bool,
    query_exists: ?*const fn (arg_file: *File, arg_cancellable: ?*Cancellable) callconv(.c) bool,
};
pub const FileInfo = struct {
    pub const Parent = GObject.Object;
    pub const Class = FileInfoClass;
    pub fn new() *FileInfo {
        const cFn = @extern(*const fn () callconv(.c) *FileInfo, .{ .name = "g_file_info_new" });
        const ret = cFn();
        return ret;
    }
    pub fn clearStatus(self: *FileInfo) void {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) void, .{ .name = "g_file_info_clear_status" });
        const ret = cFn(self);
        return ret;
    }
    pub fn copyInto(self: *FileInfo, arg_dest_info: *FileInfo) void {
        const cFn = @extern(*const fn (*FileInfo, *FileInfo) callconv(.c) void, .{ .name = "g_file_info_copy_into" });
        const ret = cFn(self, arg_dest_info);
        return ret;
    }
    pub fn dup(self: *FileInfo) *FileInfo {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) *FileInfo, .{ .name = "g_file_info_dup" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getAccessDateTime(self: *FileInfo) ?*GLib.DateTime {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) ?*GLib.DateTime, .{ .name = "g_file_info_get_access_date_time" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getAttributeAsString(self: *FileInfo, arg_attribute: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_file_info_get_attribute_as_string" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn getAttributeBoolean(self: *FileInfo, arg_attribute: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) bool, .{ .name = "g_file_info_get_attribute_boolean" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn getAttributeByteString(self: *FileInfo, arg_attribute: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_file_info_get_attribute_byte_string" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn getAttributeData(self: *FileInfo, arg_attribute: [*:0]const u8) ?struct {
        type: FileAttributeType,
        value_pp: *anyopaque,
        status: FileAttributeStatus,
    } {
        var argO_type: FileAttributeType = undefined;
        const arg_type: ?*FileAttributeType = &argO_type;
        var argO_value_pp: ?*anyopaque = undefined;
        const arg_value_pp: ?*anyopaque = &argO_value_pp;
        var argO_status: FileAttributeStatus = undefined;
        const arg_status: ?*FileAttributeStatus = &argO_status;
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8, ?*FileAttributeType, ?*anyopaque, ?*FileAttributeStatus) callconv(.c) bool, .{ .name = "g_file_info_get_attribute_data" });
        const ret = cFn(self, arg_attribute, arg_type, @ptrCast(arg_value_pp), arg_status);
        if (!ret) return null;
        return .{ .type = argO_type, .value_pp = argO_value_pp, .status = argO_status };
    }
    pub fn getAttributeFilePath(self: *FileInfo, arg_attribute: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_file_info_get_attribute_file_path" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn getAttributeInt32(self: *FileInfo, arg_attribute: [*:0]const u8) i32 {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) i32, .{ .name = "g_file_info_get_attribute_int32" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn getAttributeInt64(self: *FileInfo, arg_attribute: [*:0]const u8) i64 {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) i64, .{ .name = "g_file_info_get_attribute_int64" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn getAttributeObject(self: *FileInfo, arg_attribute: [*:0]const u8) ?*GObject.Object {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) ?*GObject.Object, .{ .name = "g_file_info_get_attribute_object" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn getAttributeStatus(self: *FileInfo, arg_attribute: [*:0]const u8) FileAttributeStatus {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) FileAttributeStatus, .{ .name = "g_file_info_get_attribute_status" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn getAttributeString(self: *FileInfo, arg_attribute: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_file_info_get_attribute_string" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn getAttributeStringv(self: *FileInfo, arg_attribute: [*:0]const u8) ?[*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) ?[*]?[*:0]const u8, .{ .name = "g_file_info_get_attribute_stringv" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn getAttributeType(self: *FileInfo, arg_attribute: [*:0]const u8) FileAttributeType {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) FileAttributeType, .{ .name = "g_file_info_get_attribute_type" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn getAttributeUint32(self: *FileInfo, arg_attribute: [*:0]const u8) u32 {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) u32, .{ .name = "g_file_info_get_attribute_uint32" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn getAttributeUint64(self: *FileInfo, arg_attribute: [*:0]const u8) u64 {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) u64, .{ .name = "g_file_info_get_attribute_uint64" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn getContentType(self: *FileInfo) ?[*:0]u8 {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) ?[*:0]u8, .{ .name = "g_file_info_get_content_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCreationDateTime(self: *FileInfo) ?*GLib.DateTime {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) ?*GLib.DateTime, .{ .name = "g_file_info_get_creation_date_time" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDeletionDate(self: *FileInfo) ?*GLib.DateTime {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) ?*GLib.DateTime, .{ .name = "g_file_info_get_deletion_date" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDisplayName(self: *FileInfo) [*:0]u8 {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) [*:0]u8, .{ .name = "g_file_info_get_display_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getEditName(self: *FileInfo) [*:0]u8 {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) [*:0]u8, .{ .name = "g_file_info_get_edit_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getEtag(self: *FileInfo) ?[*:0]u8 {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) ?[*:0]u8, .{ .name = "g_file_info_get_etag" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFileType(self: *FileInfo) FileType {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) FileType, .{ .name = "g_file_info_get_file_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIcon(self: *FileInfo) ?*Icon {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) ?*Icon, .{ .name = "g_file_info_get_icon" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsBackup(self: *FileInfo) bool {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) bool, .{ .name = "g_file_info_get_is_backup" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsHidden(self: *FileInfo) bool {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) bool, .{ .name = "g_file_info_get_is_hidden" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsSymlink(self: *FileInfo) bool {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) bool, .{ .name = "g_file_info_get_is_symlink" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getModificationDateTime(self: *FileInfo) ?*GLib.DateTime {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) ?*GLib.DateTime, .{ .name = "g_file_info_get_modification_date_time" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getModificationTime(self: *FileInfo, arg_result: *GLib.TimeVal) void {
        const cFn = @extern(*const fn (*FileInfo, *GLib.TimeVal) callconv(.c) void, .{ .name = "g_file_info_get_modification_time" });
        const ret = cFn(self, arg_result);
        return ret;
    }
    pub fn getName(self: *FileInfo) [*:0]u8 {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) [*:0]u8, .{ .name = "g_file_info_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSize(self: *FileInfo) i64 {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) i64, .{ .name = "g_file_info_get_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSortOrder(self: *FileInfo) i32 {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) i32, .{ .name = "g_file_info_get_sort_order" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSymbolicIcon(self: *FileInfo) ?*Icon {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) ?*Icon, .{ .name = "g_file_info_get_symbolic_icon" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSymlinkTarget(self: *FileInfo) ?[*:0]u8 {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) ?[*:0]u8, .{ .name = "g_file_info_get_symlink_target" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hasAttribute(self: *FileInfo, arg_attribute: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) bool, .{ .name = "g_file_info_has_attribute" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn hasNamespace(self: *FileInfo, arg_name_space: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) bool, .{ .name = "g_file_info_has_namespace" });
        const ret = cFn(self, arg_name_space);
        return ret;
    }
    pub fn listAttributes(self: *FileInfo, arg_name_space: ?[*:0]const u8) ?[*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*FileInfo, ?[*:0]const u8) callconv(.c) ?[*]?[*:0]const u8, .{ .name = "g_file_info_list_attributes" });
        const ret = cFn(self, arg_name_space);
        return ret;
    }
    pub fn removeAttribute(self: *FileInfo, arg_attribute: [*:0]const u8) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) void, .{ .name = "g_file_info_remove_attribute" });
        const ret = cFn(self, arg_attribute);
        return ret;
    }
    pub fn setAccessDateTime(self: *FileInfo, arg_atime: *GLib.DateTime) void {
        const cFn = @extern(*const fn (*FileInfo, *GLib.DateTime) callconv(.c) void, .{ .name = "g_file_info_set_access_date_time" });
        const ret = cFn(self, arg_atime);
        return ret;
    }
    pub fn setAttribute(self: *FileInfo, arg_attribute: [*:0]const u8, arg_type: FileAttributeType, arg_value_p: *anyopaque) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8, FileAttributeType, *anyopaque) callconv(.c) void, .{ .name = "g_file_info_set_attribute" });
        const ret = cFn(self, arg_attribute, arg_type, @ptrCast(arg_value_p));
        return ret;
    }
    pub fn setAttributeBoolean(self: *FileInfo, arg_attribute: [*:0]const u8, arg_attr_value: bool) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8, bool) callconv(.c) void, .{ .name = "g_file_info_set_attribute_boolean" });
        const ret = cFn(self, arg_attribute, arg_attr_value);
        return ret;
    }
    pub fn setAttributeByteString(self: *FileInfo, arg_attribute: [*:0]const u8, arg_attr_value: [*:0]const u8) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_file_info_set_attribute_byte_string" });
        const ret = cFn(self, arg_attribute, arg_attr_value);
        return ret;
    }
    pub fn setAttributeFilePath(self: *FileInfo, arg_attribute: [*:0]const u8, arg_attr_value: [*:0]const u8) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_file_info_set_attribute_file_path" });
        const ret = cFn(self, arg_attribute, arg_attr_value);
        return ret;
    }
    pub fn setAttributeInt32(self: *FileInfo, arg_attribute: [*:0]const u8, arg_attr_value: i32) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8, i32) callconv(.c) void, .{ .name = "g_file_info_set_attribute_int32" });
        const ret = cFn(self, arg_attribute, arg_attr_value);
        return ret;
    }
    pub fn setAttributeInt64(self: *FileInfo, arg_attribute: [*:0]const u8, arg_attr_value: i64) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8, i64) callconv(.c) void, .{ .name = "g_file_info_set_attribute_int64" });
        const ret = cFn(self, arg_attribute, arg_attr_value);
        return ret;
    }
    pub fn setAttributeMask(self: *FileInfo, arg_mask: *FileAttributeMatcher) void {
        const cFn = @extern(*const fn (*FileInfo, *FileAttributeMatcher) callconv(.c) void, .{ .name = "g_file_info_set_attribute_mask" });
        const ret = cFn(self, arg_mask);
        return ret;
    }
    pub fn setAttributeObject(self: *FileInfo, arg_attribute: [*:0]const u8, arg_attr_value: *GObject.Object) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8, *GObject.Object) callconv(.c) void, .{ .name = "g_file_info_set_attribute_object" });
        const ret = cFn(self, arg_attribute, arg_attr_value);
        return ret;
    }
    pub fn setAttributeStatus(self: *FileInfo, arg_attribute: [*:0]const u8, arg_status: FileAttributeStatus) bool {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8, FileAttributeStatus) callconv(.c) bool, .{ .name = "g_file_info_set_attribute_status" });
        const ret = cFn(self, arg_attribute, arg_status);
        return ret;
    }
    pub fn setAttributeString(self: *FileInfo, arg_attribute: [*:0]const u8, arg_attr_value: [*:0]const u8) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_file_info_set_attribute_string" });
        const ret = cFn(self, arg_attribute, arg_attr_value);
        return ret;
    }
    pub fn setAttributeStringv(self: *FileInfo, arg_attribute: [*:0]const u8, arg_attr_value: [*]?[*:0]const u8) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8, [*]?[*:0]const u8) callconv(.c) void, .{ .name = "g_file_info_set_attribute_stringv" });
        const ret = cFn(self, arg_attribute, arg_attr_value);
        return ret;
    }
    pub fn setAttributeUint32(self: *FileInfo, arg_attribute: [*:0]const u8, arg_attr_value: u32) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8, u32) callconv(.c) void, .{ .name = "g_file_info_set_attribute_uint32" });
        const ret = cFn(self, arg_attribute, arg_attr_value);
        return ret;
    }
    pub fn setAttributeUint64(self: *FileInfo, arg_attribute: [*:0]const u8, arg_attr_value: u64) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8, u64) callconv(.c) void, .{ .name = "g_file_info_set_attribute_uint64" });
        const ret = cFn(self, arg_attribute, arg_attr_value);
        return ret;
    }
    pub fn setContentType(self: *FileInfo, arg_content_type: [*:0]const u8) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) void, .{ .name = "g_file_info_set_content_type" });
        const ret = cFn(self, arg_content_type);
        return ret;
    }
    pub fn setCreationDateTime(self: *FileInfo, arg_creation_time: *GLib.DateTime) void {
        const cFn = @extern(*const fn (*FileInfo, *GLib.DateTime) callconv(.c) void, .{ .name = "g_file_info_set_creation_date_time" });
        const ret = cFn(self, arg_creation_time);
        return ret;
    }
    pub fn setDisplayName(self: *FileInfo, arg_display_name: [*:0]const u8) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) void, .{ .name = "g_file_info_set_display_name" });
        const ret = cFn(self, arg_display_name);
        return ret;
    }
    pub fn setEditName(self: *FileInfo, arg_edit_name: [*:0]const u8) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) void, .{ .name = "g_file_info_set_edit_name" });
        const ret = cFn(self, arg_edit_name);
        return ret;
    }
    pub fn setFileType(self: *FileInfo, arg_type: FileType) void {
        const cFn = @extern(*const fn (*FileInfo, FileType) callconv(.c) void, .{ .name = "g_file_info_set_file_type" });
        const ret = cFn(self, arg_type);
        return ret;
    }
    pub fn setIcon(self: *FileInfo, arg_icon: *Icon) void {
        const cFn = @extern(*const fn (*FileInfo, *Icon) callconv(.c) void, .{ .name = "g_file_info_set_icon" });
        const ret = cFn(self, arg_icon);
        return ret;
    }
    pub fn setIsHidden(self: *FileInfo, arg_is_hidden: bool) void {
        const cFn = @extern(*const fn (*FileInfo, bool) callconv(.c) void, .{ .name = "g_file_info_set_is_hidden" });
        const ret = cFn(self, arg_is_hidden);
        return ret;
    }
    pub fn setIsSymlink(self: *FileInfo, arg_is_symlink: bool) void {
        const cFn = @extern(*const fn (*FileInfo, bool) callconv(.c) void, .{ .name = "g_file_info_set_is_symlink" });
        const ret = cFn(self, arg_is_symlink);
        return ret;
    }
    pub fn setModificationDateTime(self: *FileInfo, arg_mtime: *GLib.DateTime) void {
        const cFn = @extern(*const fn (*FileInfo, *GLib.DateTime) callconv(.c) void, .{ .name = "g_file_info_set_modification_date_time" });
        const ret = cFn(self, arg_mtime);
        return ret;
    }
    pub fn setModificationTime(self: *FileInfo, arg_mtime: *GLib.TimeVal) void {
        const cFn = @extern(*const fn (*FileInfo, *GLib.TimeVal) callconv(.c) void, .{ .name = "g_file_info_set_modification_time" });
        const ret = cFn(self, arg_mtime);
        return ret;
    }
    pub fn setName(self: *FileInfo, arg_name: [*:0]const u8) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) void, .{ .name = "g_file_info_set_name" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn setSize(self: *FileInfo, arg_size: i64) void {
        const cFn = @extern(*const fn (*FileInfo, i64) callconv(.c) void, .{ .name = "g_file_info_set_size" });
        const ret = cFn(self, arg_size);
        return ret;
    }
    pub fn setSortOrder(self: *FileInfo, arg_sort_order: i32) void {
        const cFn = @extern(*const fn (*FileInfo, i32) callconv(.c) void, .{ .name = "g_file_info_set_sort_order" });
        const ret = cFn(self, arg_sort_order);
        return ret;
    }
    pub fn setSymbolicIcon(self: *FileInfo, arg_icon: *Icon) void {
        const cFn = @extern(*const fn (*FileInfo, *Icon) callconv(.c) void, .{ .name = "g_file_info_set_symbolic_icon" });
        const ret = cFn(self, arg_icon);
        return ret;
    }
    pub fn setSymlinkTarget(self: *FileInfo, arg_symlink_target: [*:0]const u8) void {
        const cFn = @extern(*const fn (*FileInfo, [*:0]const u8) callconv(.c) void, .{ .name = "g_file_info_set_symlink_target" });
        const ret = cFn(self, arg_symlink_target);
        return ret;
    }
    pub fn unsetAttributeMask(self: *FileInfo) void {
        const cFn = @extern(*const fn (*FileInfo) callconv(.c) void, .{ .name = "g_file_info_unset_attribute_mask" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_info_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FileInfoClass = opaque {};
pub const FileInputStream = extern struct {
    pub const Interfaces = [_]type{Seekable};
    pub const Parent = InputStream;
    pub const Class = FileInputStreamClass;
    parent_instance: InputStream,
    priv: ?*FileInputStreamPrivate,
    pub fn queryInfo(self: *FileInputStream, arg_attributes: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileInfo {
        const cFn = @extern(*const fn (*FileInputStream, [*:0]const u8, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileInfo, .{ .name = "g_file_input_stream_query_info" });
        const ret = cFn(self, arg_attributes, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn queryInfoAsync(self: *FileInputStream, arg_attributes: [*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*FileInputStream, [*:0]const u8, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_input_stream_query_info_async" });
        const ret = cFn(self, arg_attributes, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn queryInfoFinish(self: *FileInputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*FileInfo {
        const cFn = @extern(*const fn (*FileInputStream, *AsyncResult, *?*GLib.Error) callconv(.c) *FileInfo, .{ .name = "g_file_input_stream_query_info_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_input_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FileInputStreamClass = extern struct {
    parent_class: InputStreamClass,
    tell: ?*const fn (arg_stream: *FileInputStream) callconv(.c) i64,
    can_seek: ?*const fn (arg_stream: *FileInputStream) callconv(.c) bool,
    seek: ?*const fn (arg_stream: *FileInputStream, arg_offset: i64, arg_type: GLib.SeekType, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    query_info: ?*const fn (arg_stream: *FileInputStream, arg_attributes: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileInfo,
    query_info_async: ?*const fn (arg_stream: *FileInputStream, arg_attributes: [*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    query_info_finish: ?*const fn (arg_stream: *FileInputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *FileInfo,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const FileInputStreamPrivate = opaque {};
pub const FileMeasureFlags = packed struct(u32) {
    _0: u1 = 0,
    report_any_error: bool = false,
    apparent_size: bool = false,
    no_xdev: bool = false,
    _: u28 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_measure_flags_get_type" });
        return cFn();
    }
};
pub const FileMeasureProgressCallback = *const fn (arg_reporting: bool, arg_current_size: u64, arg_num_dirs: u64, arg_num_files: u64, arg_data: ?*anyopaque) callconv(.c) void;
pub const FileMonitor = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = FileMonitorClass;
    _props: struct {
        cancelled: core.Property(bool, "cancelled") = .{},
        @"rate-limit": core.Property(i32, "rate-limit") = .{},
    },
    _signals: struct {
        changed: core.Signal(fn (*FileMonitor, *File, ?*File, FileMonitorEvent) void, "changed") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*FileMonitorPrivate,
    pub fn cancel(self: *FileMonitor) bool {
        const cFn = @extern(*const fn (*FileMonitor) callconv(.c) bool, .{ .name = "g_file_monitor_cancel" });
        const ret = cFn(self);
        return ret;
    }
    pub fn emitEvent(self: *FileMonitor, arg_child: *File, arg_other_file: *File, arg_event_type: FileMonitorEvent) void {
        const cFn = @extern(*const fn (*FileMonitor, *File, *File, FileMonitorEvent) callconv(.c) void, .{ .name = "g_file_monitor_emit_event" });
        const ret = cFn(self, arg_child, arg_other_file, arg_event_type);
        return ret;
    }
    pub fn isCancelled(self: *FileMonitor) bool {
        const cFn = @extern(*const fn (*FileMonitor) callconv(.c) bool, .{ .name = "g_file_monitor_is_cancelled" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setRateLimit(self: *FileMonitor, arg_limit_msecs: i32) void {
        const cFn = @extern(*const fn (*FileMonitor, i32) callconv(.c) void, .{ .name = "g_file_monitor_set_rate_limit" });
        const ret = cFn(self, arg_limit_msecs);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_monitor_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FileMonitorClass = extern struct {
    parent_class: GObject.ObjectClass,
    changed: ?*const fn (arg_monitor: *FileMonitor, arg_file: *File, arg_other_file: *File, arg_event_type: FileMonitorEvent) callconv(.c) void,
    cancel: ?*const fn (arg_monitor: *FileMonitor) callconv(.c) bool,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const FileMonitorEvent = enum(u32) {
    changed = 0,
    changes_done_hint = 1,
    deleted = 2,
    created = 3,
    attribute_changed = 4,
    pre_unmount = 5,
    unmounted = 6,
    moved = 7,
    renamed = 8,
    moved_in = 9,
    moved_out = 10,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_monitor_event_get_type" });
        return cFn();
    }
};
pub const FileMonitorFlags = packed struct(u32) {
    watch_mounts: bool = false,
    send_moved: bool = false,
    watch_hard_links: bool = false,
    watch_moves: bool = false,
    _: u28 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_monitor_flags_get_type" });
        return cFn();
    }
};
pub const FileMonitorPrivate = opaque {};
pub const FileOutputStream = extern struct {
    pub const Interfaces = [_]type{Seekable};
    pub const Parent = OutputStream;
    pub const Class = FileOutputStreamClass;
    parent_instance: OutputStream,
    priv: ?*FileOutputStreamPrivate,
    pub fn getEtag(self: *FileOutputStream) ?[*:0]u8 {
        const cFn = @extern(*const fn (*FileOutputStream) callconv(.c) ?[*:0]u8, .{ .name = "g_file_output_stream_get_etag" });
        const ret = cFn(self);
        return ret;
    }
    pub fn queryInfo(self: *FileOutputStream, arg_attributes: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*FileInfo {
        const cFn = @extern(*const fn (*FileOutputStream, [*:0]const u8, ?*Cancellable, *?*GLib.Error) callconv(.c) *FileInfo, .{ .name = "g_file_output_stream_query_info" });
        const ret = cFn(self, arg_attributes, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn queryInfoAsync(self: *FileOutputStream, arg_attributes: [*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*FileOutputStream, [*:0]const u8, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_output_stream_query_info_async" });
        const ret = cFn(self, arg_attributes, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn queryInfoFinish(self: *FileOutputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*FileInfo {
        const cFn = @extern(*const fn (*FileOutputStream, *AsyncResult, *?*GLib.Error) callconv(.c) *FileInfo, .{ .name = "g_file_output_stream_query_info_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_output_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FileOutputStreamClass = extern struct {
    parent_class: OutputStreamClass,
    tell: ?*const fn (arg_stream: *FileOutputStream) callconv(.c) i64,
    can_seek: ?*const fn (arg_stream: *FileOutputStream) callconv(.c) bool,
    seek: ?*const fn (arg_stream: *FileOutputStream, arg_offset: i64, arg_type: GLib.SeekType, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    can_truncate: ?*const fn (arg_stream: *FileOutputStream) callconv(.c) bool,
    truncate_fn: ?*const fn (arg_stream: *FileOutputStream, arg_size: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    query_info: ?*const fn (arg_stream: *FileOutputStream, arg_attributes: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *FileInfo,
    query_info_async: ?*const fn (arg_stream: *FileOutputStream, arg_attributes: [*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    query_info_finish: ?*const fn (arg_stream: *FileOutputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *FileInfo,
    get_etag: ?*const fn (arg_stream: *FileOutputStream) callconv(.c) ?[*:0]u8,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const FileOutputStreamPrivate = opaque {};
pub const FileProgressCallback = *const fn (arg_current_num_bytes: i64, arg_total_num_bytes: i64, arg_data: ?*anyopaque) callconv(.c) void;
pub const FileQueryInfoFlags = packed struct(u32) {
    nofollow_symlinks: bool = false,
    _: u31 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_query_info_flags_get_type" });
        return cFn();
    }
};
pub const FileReadMoreCallback = *const fn (arg_file_contents: [*:0]const u8, arg_file_size: i64, arg_callback_data: ?*anyopaque) callconv(.c) bool;
pub const FileType = enum(u32) {
    unknown = 0,
    regular = 1,
    directory = 2,
    symbolic_link = 3,
    special = 4,
    shortcut = 5,
    mountable = 6,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_file_type_get_type" });
        return cFn();
    }
};
pub const FilenameCompleter = struct {
    pub const Parent = GObject.Object;
    pub const Class = FilenameCompleterClass;
    _signals: struct {
        @"got-completion-data": core.Signal(fn (*FilenameCompleter) void, "got-completion-data") = .{},
    },
    pub fn new() *FilenameCompleter {
        const cFn = @extern(*const fn () callconv(.c) *FilenameCompleter, .{ .name = "g_filename_completer_new" });
        const ret = cFn();
        return ret;
    }
    pub fn getCompletionSuffix(self: *FilenameCompleter, arg_initial_text: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (*FilenameCompleter, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_filename_completer_get_completion_suffix" });
        const ret = cFn(self, arg_initial_text);
        return ret;
    }
    pub fn getCompletions(self: *FilenameCompleter, arg_initial_text: [*:0]const u8) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*FilenameCompleter, [*:0]const u8) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_filename_completer_get_completions" });
        const ret = cFn(self, arg_initial_text);
        return ret;
    }
    pub fn setDirsOnly(self: *FilenameCompleter, arg_dirs_only: bool) void {
        const cFn = @extern(*const fn (*FilenameCompleter, bool) callconv(.c) void, .{ .name = "g_filename_completer_set_dirs_only" });
        const ret = cFn(self, arg_dirs_only);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_filename_completer_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FilenameCompleterClass = extern struct {
    parent_class: GObject.ObjectClass,
    got_completion_data: ?*const fn (arg_filename_completer: *FilenameCompleter) callconv(.c) void,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
};
pub const FilesystemPreviewType = enum(u32) {
    if_always = 0,
    if_local = 1,
    never = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_filesystem_preview_type_get_type" });
        return cFn();
    }
};
pub const FilterInputStream = extern struct {
    pub const Parent = InputStream;
    pub const Class = FilterInputStreamClass;
    _props: struct {
        @"base-stream": core.Property(InputStream, "base-stream") = .{},
        @"close-base-stream": core.Property(bool, "close-base-stream") = .{},
    },
    parent_instance: InputStream,
    base_stream: ?*InputStream,
    pub fn getBaseStream(self: *FilterInputStream) *InputStream {
        const cFn = @extern(*const fn (*FilterInputStream) callconv(.c) *InputStream, .{ .name = "g_filter_input_stream_get_base_stream" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCloseBaseStream(self: *FilterInputStream) bool {
        const cFn = @extern(*const fn (*FilterInputStream) callconv(.c) bool, .{ .name = "g_filter_input_stream_get_close_base_stream" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setCloseBaseStream(self: *FilterInputStream, arg_close_base: bool) void {
        const cFn = @extern(*const fn (*FilterInputStream, bool) callconv(.c) void, .{ .name = "g_filter_input_stream_set_close_base_stream" });
        const ret = cFn(self, arg_close_base);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_filter_input_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FilterInputStreamClass = extern struct {
    parent_class: InputStreamClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
};
pub const FilterOutputStream = extern struct {
    pub const Parent = OutputStream;
    pub const Class = FilterOutputStreamClass;
    _props: struct {
        @"base-stream": core.Property(OutputStream, "base-stream") = .{},
        @"close-base-stream": core.Property(bool, "close-base-stream") = .{},
    },
    parent_instance: OutputStream,
    base_stream: ?*OutputStream,
    pub fn getBaseStream(self: *FilterOutputStream) *OutputStream {
        const cFn = @extern(*const fn (*FilterOutputStream) callconv(.c) *OutputStream, .{ .name = "g_filter_output_stream_get_base_stream" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCloseBaseStream(self: *FilterOutputStream) bool {
        const cFn = @extern(*const fn (*FilterOutputStream) callconv(.c) bool, .{ .name = "g_filter_output_stream_get_close_base_stream" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setCloseBaseStream(self: *FilterOutputStream, arg_close_base: bool) void {
        const cFn = @extern(*const fn (*FilterOutputStream, bool) callconv(.c) void, .{ .name = "g_filter_output_stream_set_close_base_stream" });
        const ret = cFn(self, arg_close_base);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_filter_output_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const FilterOutputStreamClass = extern struct {
    parent_class: OutputStreamClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
};
pub const IOErrorEnum = enum(u32) {
    failed = 0,
    not_found = 1,
    exists = 2,
    is_directory = 3,
    not_directory = 4,
    not_empty = 5,
    not_regular_file = 6,
    not_symbolic_link = 7,
    not_mountable_file = 8,
    filename_too_long = 9,
    invalid_filename = 10,
    too_many_links = 11,
    no_space = 12,
    invalid_argument = 13,
    permission_denied = 14,
    not_supported = 15,
    not_mounted = 16,
    already_mounted = 17,
    closed = 18,
    cancelled = 19,
    pending = 20,
    read_only = 21,
    cant_create_backup = 22,
    wrong_etag = 23,
    timed_out = 24,
    would_recurse = 25,
    busy = 26,
    would_block = 27,
    host_not_found = 28,
    would_merge = 29,
    failed_handled = 30,
    too_many_open_files = 31,
    not_initialized = 32,
    address_in_use = 33,
    partial_input = 34,
    invalid_data = 35,
    dbus_error = 36,
    host_unreachable = 37,
    network_unreachable = 38,
    connection_refused = 39,
    proxy_failed = 40,
    proxy_auth_failed = 41,
    proxy_need_auth = 42,
    proxy_not_allowed = 43,
    broken_pipe = 44,
    not_connected = 45,
    message_too_large = 46,
    no_such_device = 47,
    destination_unset = 48,
    pub const connection_closed: @This() = @enumFromInt(@as(u32, 44));
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_io_error_enum_get_type" });
        return cFn();
    }
};
pub const IOExtension = opaque {
    pub fn getName(self: *IOExtension) [*:0]u8 {
        const cFn = @extern(*const fn (*IOExtension) callconv(.c) [*:0]u8, .{ .name = "g_io_extension_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPriority(self: *IOExtension) i32 {
        const cFn = @extern(*const fn (*IOExtension) callconv(.c) i32, .{ .name = "g_io_extension_get_priority" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getType(self: *IOExtension) core.Type {
        const cFn = @extern(*const fn (*IOExtension) callconv(.c) core.Type, .{ .name = "g_io_extension_get_type" });
        const ret = cFn(self);
        return ret;
    }
};
pub const IOExtensionPoint = opaque {
    pub fn getExtensionByName(self: *IOExtensionPoint, arg_name: [*:0]const u8) *IOExtension {
        const cFn = @extern(*const fn (*IOExtensionPoint, [*:0]const u8) callconv(.c) *IOExtension, .{ .name = "g_io_extension_point_get_extension_by_name" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn getExtensions(self: *IOExtensionPoint) ?*GLib.List {
        const cFn = @extern(*const fn (*IOExtensionPoint) callconv(.c) ?*GLib.List, .{ .name = "g_io_extension_point_get_extensions" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRequiredType(self: *IOExtensionPoint) core.Type {
        const cFn = @extern(*const fn (*IOExtensionPoint) callconv(.c) core.Type, .{ .name = "g_io_extension_point_get_required_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setRequiredType(self: *IOExtensionPoint, arg_type: core.Type) void {
        const cFn = @extern(*const fn (*IOExtensionPoint, core.Type) callconv(.c) void, .{ .name = "g_io_extension_point_set_required_type" });
        const ret = cFn(self, arg_type);
        return ret;
    }
    pub fn implement(arg_extension_point_name: [*:0]const u8, arg_type: core.Type, arg_extension_name: [*:0]const u8, arg_priority: i32) *IOExtension {
        const cFn = @extern(*const fn ([*:0]const u8, core.Type, [*:0]const u8, i32) callconv(.c) *IOExtension, .{ .name = "g_io_extension_point_implement" });
        const ret = cFn(arg_extension_point_name, arg_type, arg_extension_name, arg_priority);
        return ret;
    }
    pub fn lookup(arg_name: [*:0]const u8) *IOExtensionPoint {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *IOExtensionPoint, .{ .name = "g_io_extension_point_lookup" });
        const ret = cFn(arg_name);
        return ret;
    }
    pub fn register(arg_name: [*:0]const u8) *IOExtensionPoint {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *IOExtensionPoint, .{ .name = "g_io_extension_point_register" });
        const ret = cFn(arg_name);
        return ret;
    }
};
pub const IOModule = struct {
    pub const Interfaces = [_]type{GObject.TypePlugin};
    pub const Parent = GObject.TypeModule;
    pub const Class = IOModuleClass;
    pub fn new(arg_filename: [*:0]const u8) *IOModule {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *IOModule, .{ .name = "g_io_module_new" });
        const ret = cFn(arg_filename);
        return ret;
    }
    pub fn query() [*]?[*:0]const u8 {
        const cFn = @extern(*const fn () callconv(.c) [*]?[*:0]const u8, .{ .name = "g_io_module_query" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_io_module_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const IOModuleClass = opaque {};
pub const IOModuleScope = opaque {
    pub fn block(self: *IOModuleScope, arg_basename: [*:0]const u8) void {
        const cFn = @extern(*const fn (*IOModuleScope, [*:0]const u8) callconv(.c) void, .{ .name = "g_io_module_scope_block" });
        const ret = cFn(self, arg_basename);
        return ret;
    }
    pub fn free(self: *IOModuleScope) void {
        const cFn = @extern(*const fn (*IOModuleScope) callconv(.c) void, .{ .name = "g_io_module_scope_free" });
        const ret = cFn(self);
        return ret;
    }
};
pub const IOModuleScopeFlags = enum(u32) {
    none = 0,
    block_duplicates = 1,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_io_module_scope_flags_get_type" });
        return cFn();
    }
};
pub const IOSchedulerJob = opaque {
    pub fn sendToMainloop(self: *IOSchedulerJob, argC_func: core.Closure(GLib.SourceFunc)) bool {
        const arg_func: GLib.SourceFunc = @ptrCast(argC_func.callback());
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const arg_notify: ?GLib.DestroyNotify = @ptrCast(argC_func.destroy());
        const cFn = @extern(*const fn (*IOSchedulerJob, GLib.SourceFunc, ?*anyopaque, ?GLib.DestroyNotify) callconv(.c) bool, .{ .name = "g_io_scheduler_job_send_to_mainloop" });
        const ret = cFn(self, arg_func, @ptrCast(arg_user_data), arg_notify);
        return ret;
    }
    pub fn sendToMainloopAsync(self: *IOSchedulerJob, argC_func: core.Closure(GLib.SourceFunc)) void {
        const arg_func: GLib.SourceFunc = @ptrCast(argC_func.callback());
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const arg_notify: ?GLib.DestroyNotify = @ptrCast(argC_func.destroy());
        const cFn = @extern(*const fn (*IOSchedulerJob, GLib.SourceFunc, ?*anyopaque, ?GLib.DestroyNotify) callconv(.c) void, .{ .name = "g_io_scheduler_job_send_to_mainloop_async" });
        const ret = cFn(self, arg_func, @ptrCast(arg_user_data), arg_notify);
        return ret;
    }
};
pub const IOSchedulerJobFunc = *const fn (arg_job: *IOSchedulerJob, arg_cancellable: ?*Cancellable, arg_data: ?*anyopaque) callconv(.c) bool;
pub const IOStream = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = IOStreamClass;
    _props: struct {
        closed: core.Property(bool, "closed") = .{},
        @"input-stream": core.Property(InputStream, "input-stream") = .{},
        @"output-stream": core.Property(OutputStream, "output-stream") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*IOStreamPrivate,
    pub fn spliceFinish(arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_io_stream_splice_finish" });
        const ret = cFn(arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn clearPending(self: *IOStream) void {
        const cFn = @extern(*const fn (*IOStream) callconv(.c) void, .{ .name = "g_io_stream_clear_pending" });
        const ret = cFn(self);
        return ret;
    }
    pub fn close(self: *IOStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*IOStream, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_io_stream_close" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn closeAsync(self: *IOStream, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*IOStream, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_io_stream_close_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn closeFinish(self: *IOStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*IOStream, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_io_stream_close_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getInputStream(self: *IOStream) *InputStream {
        const cFn = @extern(*const fn (*IOStream) callconv(.c) *InputStream, .{ .name = "g_io_stream_get_input_stream" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOutputStream(self: *IOStream) *OutputStream {
        const cFn = @extern(*const fn (*IOStream) callconv(.c) *OutputStream, .{ .name = "g_io_stream_get_output_stream" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hasPending(self: *IOStream) bool {
        const cFn = @extern(*const fn (*IOStream) callconv(.c) bool, .{ .name = "g_io_stream_has_pending" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isClosed(self: *IOStream) bool {
        const cFn = @extern(*const fn (*IOStream) callconv(.c) bool, .{ .name = "g_io_stream_is_closed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setPending(self: *IOStream, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*IOStream, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_io_stream_set_pending" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn spliceAsync(self: *IOStream, arg_stream2: *IOStream, arg_flags: IOStreamSpliceFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*IOStream, *IOStream, IOStreamSpliceFlags, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_io_stream_splice_async" });
        const ret = cFn(self, arg_stream2, arg_flags, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_io_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const IOStreamAdapter = opaque {};
pub const IOStreamClass = extern struct {
    parent_class: GObject.ObjectClass,
    get_input_stream: ?*const fn (arg_stream: *IOStream) callconv(.c) *InputStream,
    get_output_stream: ?*const fn (arg_stream: *IOStream) callconv(.c) *OutputStream,
    close_fn: ?*const fn (arg_stream: *IOStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    close_async: ?*const fn (arg_stream: *IOStream, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    close_finish: ?*const fn (arg_stream: *IOStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
    _g_reserved6: ?*anyopaque,
    _g_reserved7: ?*anyopaque,
    _g_reserved8: ?*anyopaque,
    _g_reserved9: ?*anyopaque,
    _g_reserved10: ?*anyopaque,
};
pub const IOStreamPrivate = opaque {};
pub const IOStreamSpliceFlags = packed struct(u32) {
    close_stream1: bool = false,
    close_stream2: bool = false,
    wait_for_both: bool = false,
    _: u29 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_io_stream_splice_flags_get_type" });
        return cFn();
    }
};
pub const Icon = struct {
    pub const Class = IconIface;
    pub fn deserialize(arg_value: *GLib.Variant) ?*Icon {
        const cFn = @extern(*const fn (*GLib.Variant) callconv(.c) ?*Icon, .{ .name = "g_icon_deserialize" });
        const ret = cFn(arg_value);
        return ret;
    }
    pub fn newForString(arg_str: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*Icon {
        const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) *Icon, .{ .name = "g_icon_new_for_string" });
        const ret = cFn(arg_str, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn equal(self: *Icon, arg_icon2: ?*Icon) bool {
        const cFn = @extern(*const fn (*Icon, ?*Icon) callconv(.c) bool, .{ .name = "g_icon_equal" });
        const ret = cFn(self, arg_icon2);
        return ret;
    }
    pub fn hash(self: *Icon) u32 {
        const cFn = @extern(*const fn (*Icon) callconv(.c) u32, .{ .name = "g_icon_hash" });
        const ret = cFn(self);
        return ret;
    }
    pub fn serialize(self: *Icon) ?*GLib.Variant {
        const cFn = @extern(*const fn (*Icon) callconv(.c) ?*GLib.Variant, .{ .name = "g_icon_serialize" });
        const ret = cFn(self);
        return ret;
    }
    pub fn toString(self: *Icon) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Icon) callconv(.c) ?[*:0]u8, .{ .name = "g_icon_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_icon_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const IconIface = extern struct {
    g_iface: GObject.TypeInterface,
    hash: ?*const fn (arg_icon: *Icon) callconv(.c) u32,
    equal: ?*const fn (arg_icon1: ?*Icon, arg_icon2: ?*Icon) callconv(.c) bool,
    to_tokens: ?*const fn (arg_icon: *Icon, arg_tokens: *GLib.PtrArray, arg_out_version: *i32) callconv(.c) bool,
    from_tokens: ?*anyopaque,
    serialize: ?*const fn (arg_icon: *Icon) callconv(.c) ?*GLib.Variant,
};
pub const InetAddress = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = InetAddressClass;
    _props: struct {
        bytes: core.Property(*anyopaque, "bytes") = .{},
        family: core.Property(SocketFamily, "family") = .{},
        @"is-any": core.Property(bool, "is-any") = .{},
        @"is-link-local": core.Property(bool, "is-link-local") = .{},
        @"is-loopback": core.Property(bool, "is-loopback") = .{},
        @"is-mc-global": core.Property(bool, "is-mc-global") = .{},
        @"is-mc-link-local": core.Property(bool, "is-mc-link-local") = .{},
        @"is-mc-node-local": core.Property(bool, "is-mc-node-local") = .{},
        @"is-mc-org-local": core.Property(bool, "is-mc-org-local") = .{},
        @"is-mc-site-local": core.Property(bool, "is-mc-site-local") = .{},
        @"is-multicast": core.Property(bool, "is-multicast") = .{},
        @"is-site-local": core.Property(bool, "is-site-local") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*InetAddressPrivate,
    pub fn newAny(arg_family: SocketFamily) *InetAddress {
        const cFn = @extern(*const fn (SocketFamily) callconv(.c) *InetAddress, .{ .name = "g_inet_address_new_any" });
        const ret = cFn(arg_family);
        return ret;
    }
    pub fn newFromBytes(arg_bytes: [*]u8, arg_family: SocketFamily) *InetAddress {
        const cFn = @extern(*const fn ([*]u8, SocketFamily) callconv(.c) *InetAddress, .{ .name = "g_inet_address_new_from_bytes" });
        const ret = cFn(arg_bytes, arg_family);
        return ret;
    }
    pub fn newFromString(arg_string: [*:0]const u8) ?*InetAddress {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*InetAddress, .{ .name = "g_inet_address_new_from_string" });
        const ret = cFn(arg_string);
        return ret;
    }
    pub fn newLoopback(arg_family: SocketFamily) *InetAddress {
        const cFn = @extern(*const fn (SocketFamily) callconv(.c) *InetAddress, .{ .name = "g_inet_address_new_loopback" });
        const ret = cFn(arg_family);
        return ret;
    }
    pub fn equal(self: *InetAddress, arg_other_address: *InetAddress) bool {
        const cFn = @extern(*const fn (*InetAddress, *InetAddress) callconv(.c) bool, .{ .name = "g_inet_address_equal" });
        const ret = cFn(self, arg_other_address);
        return ret;
    }
    pub fn getFamily(self: *InetAddress) SocketFamily {
        const cFn = @extern(*const fn (*InetAddress) callconv(.c) SocketFamily, .{ .name = "g_inet_address_get_family" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsAny(self: *InetAddress) bool {
        const cFn = @extern(*const fn (*InetAddress) callconv(.c) bool, .{ .name = "g_inet_address_get_is_any" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsLinkLocal(self: *InetAddress) bool {
        const cFn = @extern(*const fn (*InetAddress) callconv(.c) bool, .{ .name = "g_inet_address_get_is_link_local" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsLoopback(self: *InetAddress) bool {
        const cFn = @extern(*const fn (*InetAddress) callconv(.c) bool, .{ .name = "g_inet_address_get_is_loopback" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsMcGlobal(self: *InetAddress) bool {
        const cFn = @extern(*const fn (*InetAddress) callconv(.c) bool, .{ .name = "g_inet_address_get_is_mc_global" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsMcLinkLocal(self: *InetAddress) bool {
        const cFn = @extern(*const fn (*InetAddress) callconv(.c) bool, .{ .name = "g_inet_address_get_is_mc_link_local" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsMcNodeLocal(self: *InetAddress) bool {
        const cFn = @extern(*const fn (*InetAddress) callconv(.c) bool, .{ .name = "g_inet_address_get_is_mc_node_local" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsMcOrgLocal(self: *InetAddress) bool {
        const cFn = @extern(*const fn (*InetAddress) callconv(.c) bool, .{ .name = "g_inet_address_get_is_mc_org_local" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsMcSiteLocal(self: *InetAddress) bool {
        const cFn = @extern(*const fn (*InetAddress) callconv(.c) bool, .{ .name = "g_inet_address_get_is_mc_site_local" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsMulticast(self: *InetAddress) bool {
        const cFn = @extern(*const fn (*InetAddress) callconv(.c) bool, .{ .name = "g_inet_address_get_is_multicast" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsSiteLocal(self: *InetAddress) bool {
        const cFn = @extern(*const fn (*InetAddress) callconv(.c) bool, .{ .name = "g_inet_address_get_is_site_local" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNativeSize(self: *InetAddress) u64 {
        const cFn = @extern(*const fn (*InetAddress) callconv(.c) u64, .{ .name = "g_inet_address_get_native_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn toString(self: *InetAddress) [*:0]u8 {
        const cFn = @extern(*const fn (*InetAddress) callconv(.c) [*:0]u8, .{ .name = "g_inet_address_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_inet_address_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const InetAddressClass = extern struct {
    parent_class: GObject.ObjectClass,
    to_string: ?*const fn (arg_address: *InetAddress) callconv(.c) [*:0]u8,
    to_bytes: ?*const fn (arg_address: *InetAddress) callconv(.c) *u8,
};
pub const InetAddressMask = extern struct {
    pub const Interfaces = [_]type{Initable};
    pub const Parent = GObject.Object;
    pub const Class = InetAddressMaskClass;
    _props: struct {
        address: core.Property(InetAddress, "address") = .{},
        family: core.Property(SocketFamily, "family") = .{},
        length: core.Property(u32, "length") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*InetAddressMaskPrivate,
    pub fn new(arg_addr: *InetAddress, arg_length: u32, arg_error: *?*GLib.Error) error{GError}!*InetAddressMask {
        const cFn = @extern(*const fn (*InetAddress, u32, *?*GLib.Error) callconv(.c) *InetAddressMask, .{ .name = "g_inet_address_mask_new" });
        const ret = cFn(arg_addr, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromString(arg_mask_string: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*InetAddressMask {
        const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) *InetAddressMask, .{ .name = "g_inet_address_mask_new_from_string" });
        const ret = cFn(arg_mask_string, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn equal(self: *InetAddressMask, arg_mask2: *InetAddressMask) bool {
        const cFn = @extern(*const fn (*InetAddressMask, *InetAddressMask) callconv(.c) bool, .{ .name = "g_inet_address_mask_equal" });
        const ret = cFn(self, arg_mask2);
        return ret;
    }
    pub fn getAddress(self: *InetAddressMask) *InetAddress {
        const cFn = @extern(*const fn (*InetAddressMask) callconv(.c) *InetAddress, .{ .name = "g_inet_address_mask_get_address" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFamily(self: *InetAddressMask) SocketFamily {
        const cFn = @extern(*const fn (*InetAddressMask) callconv(.c) SocketFamily, .{ .name = "g_inet_address_mask_get_family" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLength(self: *InetAddressMask) u32 {
        const cFn = @extern(*const fn (*InetAddressMask) callconv(.c) u32, .{ .name = "g_inet_address_mask_get_length" });
        const ret = cFn(self);
        return ret;
    }
    pub fn matches(self: *InetAddressMask, arg_address: *InetAddress) bool {
        const cFn = @extern(*const fn (*InetAddressMask, *InetAddress) callconv(.c) bool, .{ .name = "g_inet_address_mask_matches" });
        const ret = cFn(self, arg_address);
        return ret;
    }
    pub fn toString(self: *InetAddressMask) [*:0]u8 {
        const cFn = @extern(*const fn (*InetAddressMask) callconv(.c) [*:0]u8, .{ .name = "g_inet_address_mask_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_inet_address_mask_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const InetAddressMaskClass = extern struct {
    parent_class: GObject.ObjectClass,
};
pub const InetAddressMaskPrivate = opaque {};
pub const InetAddressPrivate = opaque {};
pub const InetSocketAddress = extern struct {
    pub const Interfaces = [_]type{SocketConnectable};
    pub const Parent = SocketAddress;
    pub const Class = InetSocketAddressClass;
    _props: struct {
        address: core.Property(InetAddress, "address") = .{},
        flowinfo: core.Property(u32, "flowinfo") = .{},
        port: core.Property(u32, "port") = .{},
        @"scope-id": core.Property(u32, "scope-id") = .{},
    },
    parent_instance: SocketAddress,
    priv: ?*InetSocketAddressPrivate,
    pub fn new(arg_address: *InetAddress, arg_port: u16) *InetSocketAddress {
        const cFn = @extern(*const fn (*InetAddress, u16) callconv(.c) *InetSocketAddress, .{ .name = "g_inet_socket_address_new" });
        const ret = cFn(arg_address, arg_port);
        return ret;
    }
    pub fn newFromString(arg_address: [*:0]const u8, arg_port: u32) ?*InetSocketAddress {
        const cFn = @extern(*const fn ([*:0]const u8, u32) callconv(.c) ?*InetSocketAddress, .{ .name = "g_inet_socket_address_new_from_string" });
        const ret = cFn(arg_address, arg_port);
        return ret;
    }
    pub fn getAddress(self: *InetSocketAddress) *InetAddress {
        const cFn = @extern(*const fn (*InetSocketAddress) callconv(.c) *InetAddress, .{ .name = "g_inet_socket_address_get_address" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFlowinfo(self: *InetSocketAddress) u32 {
        const cFn = @extern(*const fn (*InetSocketAddress) callconv(.c) u32, .{ .name = "g_inet_socket_address_get_flowinfo" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPort(self: *InetSocketAddress) u16 {
        const cFn = @extern(*const fn (*InetSocketAddress) callconv(.c) u16, .{ .name = "g_inet_socket_address_get_port" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getScopeId(self: *InetSocketAddress) u32 {
        const cFn = @extern(*const fn (*InetSocketAddress) callconv(.c) u32, .{ .name = "g_inet_socket_address_get_scope_id" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_inet_socket_address_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const InetSocketAddressClass = extern struct {
    parent_class: SocketAddressClass,
};
pub const InetSocketAddressPrivate = opaque {};
pub const Initable = struct {
    pub const Class = InitableIface;
    pub fn newv(arg_object_type: core.Type, argS_parameters: []GObject.Parameter, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*GObject.Object {
        const arg_n_parameters: u32 = @intCast((argS_parameters).len);
        const arg_parameters: [*]GObject.Parameter = @ptrCast(argS_parameters);
        const cFn = @extern(*const fn (core.Type, u32, [*]GObject.Parameter, ?*Cancellable, *?*GLib.Error) callconv(.c) *GObject.Object, .{ .name = "g_initable_newv" });
        const ret = cFn(arg_object_type, arg_n_parameters, arg_parameters, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn init(self: *Initable, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Initable, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_initable_init" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_initable_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const InitableIface = extern struct {
    g_iface: GObject.TypeInterface,
    init: ?*const fn (arg_initable: *Initable, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
};
pub const InputMessage = extern struct {
    address: ?*SocketAddress,
    vectors: ?[*]InputVector,
    num_vectors: u32,
    bytes_received: u64,
    flags: i32,
    control_messages: ?[*]*SocketControlMessage,
    num_control_messages: ?*u32,
};
pub const InputStream = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = InputStreamClass;
    parent_instance: GObject.Object,
    priv: ?*InputStreamPrivate,
    pub fn clearPending(self: *InputStream) void {
        const cFn = @extern(*const fn (*InputStream) callconv(.c) void, .{ .name = "g_input_stream_clear_pending" });
        const ret = cFn(self);
        return ret;
    }
    pub fn close(self: *InputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*InputStream, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_input_stream_close" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn closeAsync(self: *InputStream, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*InputStream, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_input_stream_close_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn closeFinish(self: *InputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*InputStream, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_input_stream_close_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn hasPending(self: *InputStream) bool {
        const cFn = @extern(*const fn (*InputStream) callconv(.c) bool, .{ .name = "g_input_stream_has_pending" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isClosed(self: *InputStream) bool {
        const cFn = @extern(*const fn (*InputStream) callconv(.c) bool, .{ .name = "g_input_stream_is_closed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn read(self: *InputStream, argS_buffer: []u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_count: u64 = @intCast((argS_buffer).len);
        const cFn = @extern(*const fn (*InputStream, [*]u8, u64, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_input_stream_read" });
        const ret = cFn(self, arg_buffer, arg_count, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn readAll(self: *InputStream, argS_buffer: []u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        bytes_read: u64,
    } {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_count: u64 = @intCast((argS_buffer).len);
        var argO_bytes_read: u64 = undefined;
        const arg_bytes_read: *u64 = &argO_bytes_read;
        const cFn = @extern(*const fn (*InputStream, [*]u8, u64, *u64, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_input_stream_read_all" });
        const ret = cFn(self, arg_buffer, arg_count, arg_bytes_read, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .bytes_read = argO_bytes_read };
    }
    pub fn readAllAsync(self: *InputStream, argS_buffer: []u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_count: u64 = @intCast((argS_buffer).len);
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*InputStream, [*]u8, u64, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_input_stream_read_all_async" });
        const ret = cFn(self, arg_buffer, arg_count, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn readAllFinish(self: *InputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        bytes_read: u64,
    } {
        var argO_bytes_read: u64 = undefined;
        const arg_bytes_read: *u64 = &argO_bytes_read;
        const cFn = @extern(*const fn (*InputStream, *AsyncResult, *u64, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_input_stream_read_all_finish" });
        const ret = cFn(self, arg_result, arg_bytes_read, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .bytes_read = argO_bytes_read };
    }
    pub fn readAsync(self: *InputStream, argS_buffer: []u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_count: u64 = @intCast((argS_buffer).len);
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*InputStream, [*]u8, u64, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_input_stream_read_async" });
        const ret = cFn(self, arg_buffer, arg_count, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn readBytes(self: *InputStream, arg_count: u64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*GLib.Bytes {
        const cFn = @extern(*const fn (*InputStream, u64, ?*Cancellable, *?*GLib.Error) callconv(.c) *GLib.Bytes, .{ .name = "g_input_stream_read_bytes" });
        const ret = cFn(self, arg_count, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn readBytesAsync(self: *InputStream, arg_count: u64, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*InputStream, u64, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_input_stream_read_bytes_async" });
        const ret = cFn(self, arg_count, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn readBytesFinish(self: *InputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*GLib.Bytes {
        const cFn = @extern(*const fn (*InputStream, *AsyncResult, *?*GLib.Error) callconv(.c) *GLib.Bytes, .{ .name = "g_input_stream_read_bytes_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn readFinish(self: *InputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*InputStream, *AsyncResult, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_input_stream_read_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setPending(self: *InputStream, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*InputStream, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_input_stream_set_pending" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn skip(self: *InputStream, arg_count: u64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*InputStream, u64, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_input_stream_skip" });
        const ret = cFn(self, arg_count, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn skipAsync(self: *InputStream, arg_count: u64, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*InputStream, u64, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_input_stream_skip_async" });
        const ret = cFn(self, arg_count, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn skipFinish(self: *InputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*InputStream, *AsyncResult, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_input_stream_skip_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_input_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const InputStreamClass = extern struct {
    parent_class: GObject.ObjectClass,
    read_fn: ?*const fn (arg_stream: *InputStream, arg_buffer: ?*anyopaque, arg_count: u64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) i64,
    skip: ?*const fn (arg_stream: *InputStream, arg_count: u64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) i64,
    close_fn: ?*const fn (arg_stream: *InputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    read_async: ?*const fn (arg_stream: *InputStream, arg_buffer: ?[*]u8, arg_count: u64, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    read_finish: ?*const fn (arg_stream: *InputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) i64,
    skip_async: ?*const fn (arg_stream: *InputStream, arg_count: u64, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    skip_finish: ?*const fn (arg_stream: *InputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) i64,
    close_async: ?*const fn (arg_stream: *InputStream, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    close_finish: ?*const fn (arg_stream: *InputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const InputStreamPrivate = opaque {};
pub const InputVector = extern struct {
    buffer: ?*anyopaque,
    size: u64,
};
pub const ListModel = struct {
    pub const Class = ListModelInterface;
    _signals: struct {
        @"items-changed": core.Signal(fn (*ListModel, u32, u32, u32) void, "items-changed") = .{},
    },
    pub fn getItemType(self: *ListModel) core.Type {
        const cFn = @extern(*const fn (*ListModel) callconv(.c) core.Type, .{ .name = "g_list_model_get_item_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNItems(self: *ListModel) u32 {
        const cFn = @extern(*const fn (*ListModel) callconv(.c) u32, .{ .name = "g_list_model_get_n_items" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getItem(self: *ListModel, arg_position: u32) ?*GObject.Object {
        const cFn = @extern(*const fn (*ListModel, u32) callconv(.c) ?*GObject.Object, .{ .name = "g_list_model_get_object" });
        const ret = cFn(self, arg_position);
        return ret;
    }
    pub fn itemsChanged(self: *ListModel, arg_position: u32, arg_removed: u32, arg_added: u32) void {
        const cFn = @extern(*const fn (*ListModel, u32, u32, u32) callconv(.c) void, .{ .name = "g_list_model_items_changed" });
        const ret = cFn(self, arg_position, arg_removed, arg_added);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_list_model_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ListModelInterface = extern struct {
    g_iface: GObject.TypeInterface,
    get_item_type: ?*const fn (arg_list: *ListModel) callconv(.c) core.Type,
    get_n_items: ?*const fn (arg_list: *ListModel) callconv(.c) u32,
    get_item: ?*const fn (arg_list: *ListModel, arg_position: u32) callconv(.c) ?*GObject.Object,
};
pub const ListStore = struct {
    pub const Interfaces = [_]type{ListModel};
    pub const Parent = GObject.Object;
    pub const Class = ListStoreClass;
    _props: struct {
        @"item-type": core.Property(core.Type, "item-type") = .{},
        @"n-items": core.Property(u32, "n-items") = .{},
    },
    pub fn new(arg_item_type: core.Type) *ListStore {
        const cFn = @extern(*const fn (core.Type) callconv(.c) *ListStore, .{ .name = "g_list_store_new" });
        const ret = cFn(arg_item_type);
        return ret;
    }
    pub fn append(self: *ListStore, arg_item: *GObject.Object) void {
        const cFn = @extern(*const fn (*ListStore, *GObject.Object) callconv(.c) void, .{ .name = "g_list_store_append" });
        const ret = cFn(self, arg_item);
        return ret;
    }
    pub fn find(self: *ListStore, arg_item: *GObject.Object) struct {
        ret: bool,
        position: u32,
    } {
        var argO_position: u32 = undefined;
        const arg_position: ?*u32 = &argO_position;
        const cFn = @extern(*const fn (*ListStore, *GObject.Object, ?*u32) callconv(.c) bool, .{ .name = "g_list_store_find" });
        const ret = cFn(self, arg_item, arg_position);
        return .{ .ret = ret, .position = argO_position };
    }
    pub fn findWithEqualFunc(self: *ListStore, arg_item: ?*GObject.Object, arg_equal_func: GLib.EqualFunc) struct {
        ret: bool,
        position: u32,
    } {
        var argO_position: u32 = undefined;
        const arg_position: ?*u32 = &argO_position;
        const cFn = @extern(*const fn (*ListStore, ?*GObject.Object, GLib.EqualFunc, ?*u32) callconv(.c) bool, .{ .name = "g_list_store_find_with_equal_func" });
        const ret = cFn(self, arg_item, arg_equal_func, arg_position);
        return .{ .ret = ret, .position = argO_position };
    }
    pub fn findWithEqualFuncFull(self: *ListStore, arg_item: ?*GObject.Object, argC_equal_func: core.Closure(GLib.EqualFuncFull)) struct {
        ret: bool,
        position: u32,
    } {
        const arg_equal_func: GLib.EqualFuncFull = @ptrCast(argC_equal_func.callback());
        defer argC_equal_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_equal_func.data());
        var argO_position: u32 = undefined;
        const arg_position: ?*u32 = &argO_position;
        const cFn = @extern(*const fn (*ListStore, ?*GObject.Object, GLib.EqualFuncFull, ?*anyopaque, ?*u32) callconv(.c) bool, .{ .name = "g_list_store_find_with_equal_func_full" });
        const ret = cFn(self, arg_item, arg_equal_func, @ptrCast(arg_user_data), arg_position);
        return .{ .ret = ret, .position = argO_position };
    }
    pub fn insert(self: *ListStore, arg_position: u32, arg_item: *GObject.Object) void {
        const cFn = @extern(*const fn (*ListStore, u32, *GObject.Object) callconv(.c) void, .{ .name = "g_list_store_insert" });
        const ret = cFn(self, arg_position, arg_item);
        return ret;
    }
    pub fn insertSorted(self: *ListStore, arg_item: *GObject.Object, argC_compare_func: core.Closure(GLib.CompareDataFunc)) u32 {
        const arg_compare_func: GLib.CompareDataFunc = @ptrCast(argC_compare_func.callback());
        defer argC_compare_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_compare_func.data());
        const cFn = @extern(*const fn (*ListStore, *GObject.Object, GLib.CompareDataFunc, ?*anyopaque) callconv(.c) u32, .{ .name = "g_list_store_insert_sorted" });
        const ret = cFn(self, arg_item, arg_compare_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn remove(self: *ListStore, arg_position: u32) void {
        const cFn = @extern(*const fn (*ListStore, u32) callconv(.c) void, .{ .name = "g_list_store_remove" });
        const ret = cFn(self, arg_position);
        return ret;
    }
    pub fn removeAll(self: *ListStore) void {
        const cFn = @extern(*const fn (*ListStore) callconv(.c) void, .{ .name = "g_list_store_remove_all" });
        const ret = cFn(self);
        return ret;
    }
    pub fn sort(self: *ListStore, argC_compare_func: core.Closure(GLib.CompareDataFunc)) void {
        const arg_compare_func: GLib.CompareDataFunc = @ptrCast(argC_compare_func.callback());
        defer argC_compare_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_compare_func.data());
        const cFn = @extern(*const fn (*ListStore, GLib.CompareDataFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_list_store_sort" });
        const ret = cFn(self, arg_compare_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn splice(self: *ListStore, arg_position: u32, arg_n_removals: u32, argS_additions: []GObject.Object) void {
        const arg_additions: [*]GObject.Object = @ptrCast(argS_additions);
        const arg_n_additions: u32 = @intCast((argS_additions).len);
        const cFn = @extern(*const fn (*ListStore, u32, u32, [*]GObject.Object, u32) callconv(.c) void, .{ .name = "g_list_store_splice" });
        const ret = cFn(self, arg_position, arg_n_removals, arg_additions, arg_n_additions);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_list_store_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ListStoreClass = extern struct {
    parent_class: GObject.ObjectClass,
};
pub const LoadableIcon = struct {
    pub const Prerequistes = [_]type{Icon};
    pub const Class = LoadableIconIface;
    pub fn load(self: *LoadableIcon, arg_size: i32, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *InputStream,
        type: [*:0]u8,
    } {
        var argO_type: ?[*:0]u8 = undefined;
        const arg_type: ?*[*:0]u8 = &argO_type;
        const cFn = @extern(*const fn (*LoadableIcon, i32, ?*[*:0]u8, ?*Cancellable, *?*GLib.Error) callconv(.c) *InputStream, .{ .name = "g_loadable_icon_load" });
        const ret = cFn(self, arg_size, arg_type, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .type = argO_type };
    }
    pub fn loadAsync(self: *LoadableIcon, arg_size: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*LoadableIcon, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_loadable_icon_load_async" });
        const ret = cFn(self, arg_size, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn loadFinish(self: *LoadableIcon, arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *InputStream,
        type: [*:0]u8,
    } {
        var argO_type: ?[*:0]u8 = undefined;
        const arg_type: ?*[*:0]u8 = &argO_type;
        const cFn = @extern(*const fn (*LoadableIcon, *AsyncResult, ?*[*:0]u8, *?*GLib.Error) callconv(.c) *InputStream, .{ .name = "g_loadable_icon_load_finish" });
        const ret = cFn(self, arg_res, arg_type, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .type = argO_type };
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_loadable_icon_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const LoadableIconIface = extern struct {
    g_iface: GObject.TypeInterface,
    load: ?*const fn (arg_icon: *LoadableIcon, arg_size: i32, arg_type: ?*[*:0]u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *InputStream,
    load_async: ?*const fn (arg_icon: *LoadableIcon, arg_size: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    load_finish: ?*const fn (arg_icon: *LoadableIcon, arg_res: *AsyncResult, arg_type: ?*[*:0]u8, arg_error: *?*GLib.Error) callconv(.c) *InputStream,
};
pub const MEMORY_MONITOR_EXTENSION_POINT_NAME = "gio-memory-monitor";
pub const MENU_ATTRIBUTE_ACTION = "action";
pub const MENU_ATTRIBUTE_ACTION_NAMESPACE = "action-namespace";
pub const MENU_ATTRIBUTE_ICON = "icon";
pub const MENU_ATTRIBUTE_LABEL = "label";
pub const MENU_ATTRIBUTE_TARGET = "target";
pub const MENU_EXPORTER_MAX_SECTION_SIZE = 1000;
pub const MENU_LINK_SECTION = "section";
pub const MENU_LINK_SUBMENU = "submenu";
pub const MemoryInputStream = extern struct {
    pub const Interfaces = [_]type{ PollableInputStream, Seekable };
    pub const Parent = InputStream;
    pub const Class = MemoryInputStreamClass;
    parent_instance: InputStream,
    priv: ?*MemoryInputStreamPrivate,
    pub fn new() *MemoryInputStream {
        const cFn = @extern(*const fn () callconv(.c) *MemoryInputStream, .{ .name = "g_memory_input_stream_new" });
        const ret = cFn();
        return ret;
    }
    pub fn newFromBytes(arg_bytes: *GLib.Bytes) *MemoryInputStream {
        const cFn = @extern(*const fn (*GLib.Bytes) callconv(.c) *MemoryInputStream, .{ .name = "g_memory_input_stream_new_from_bytes" });
        const ret = cFn(arg_bytes);
        return ret;
    }
    pub fn newFromData(argS_data: []u8, arg_destroy: ?GLib.DestroyNotify) *MemoryInputStream {
        const arg_data: [*]u8 = @ptrCast(argS_data);
        const arg_len: i64 = @intCast((argS_data).len);
        const cFn = @extern(*const fn ([*]u8, i64, ?GLib.DestroyNotify) callconv(.c) *MemoryInputStream, .{ .name = "g_memory_input_stream_new_from_data" });
        const ret = cFn(arg_data, arg_len, arg_destroy);
        return ret;
    }
    pub fn addBytes(self: *MemoryInputStream, arg_bytes: *GLib.Bytes) void {
        const cFn = @extern(*const fn (*MemoryInputStream, *GLib.Bytes) callconv(.c) void, .{ .name = "g_memory_input_stream_add_bytes" });
        const ret = cFn(self, arg_bytes);
        return ret;
    }
    pub fn addData(self: *MemoryInputStream, argS_data: []u8, arg_destroy: ?GLib.DestroyNotify) void {
        const arg_data: [*]u8 = @ptrCast(argS_data);
        const arg_len: i64 = @intCast((argS_data).len);
        const cFn = @extern(*const fn (*MemoryInputStream, [*]u8, i64, ?GLib.DestroyNotify) callconv(.c) void, .{ .name = "g_memory_input_stream_add_data" });
        const ret = cFn(self, arg_data, arg_len, arg_destroy);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_memory_input_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const MemoryInputStreamClass = extern struct {
    parent_class: InputStreamClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const MemoryInputStreamPrivate = opaque {};
pub const MemoryMonitor = struct {
    pub const Prerequistes = [_]type{Initable};
    pub const Class = MemoryMonitorInterface;
    _signals: struct {
        @"low-memory-warning": core.Signal(fn (*MemoryMonitor, MemoryMonitorWarningLevel) void, "low-memory-warning") = .{},
    },
    pub fn dupDefault() *MemoryMonitor {
        const cFn = @extern(*const fn () callconv(.c) *MemoryMonitor, .{ .name = "g_memory_monitor_dup_default" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_memory_monitor_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const MemoryMonitorInterface = extern struct {
    g_iface: GObject.TypeInterface,
    low_memory_warning: ?*const fn (arg_monitor: *MemoryMonitor, arg_level: MemoryMonitorWarningLevel) callconv(.c) void,
};
pub const MemoryMonitorWarningLevel = enum(u32) {
    low = 50,
    medium = 100,
    critical = 255,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_memory_monitor_warning_level_get_type" });
        return cFn();
    }
};
pub const MemoryOutputStream = extern struct {
    pub const Interfaces = [_]type{ PollableOutputStream, Seekable };
    pub const Parent = OutputStream;
    pub const Class = MemoryOutputStreamClass;
    _props: struct {
        data: core.Property(*anyopaque, "data") = .{},
        @"data-size": core.Property(u64, "data-size") = .{},
        size: core.Property(u64, "size") = .{},
    },
    parent_instance: OutputStream,
    priv: ?*MemoryOutputStreamPrivate,
    pub fn newResizable() *MemoryOutputStream {
        const cFn = @extern(*const fn () callconv(.c) *MemoryOutputStream, .{ .name = "g_memory_output_stream_new_resizable" });
        const ret = cFn();
        return ret;
    }
    pub fn getData(self: *MemoryOutputStream) ?*anyopaque {
        const cFn = @extern(*const fn (*MemoryOutputStream) callconv(.c) ?*anyopaque, .{ .name = "g_memory_output_stream_get_data" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDataSize(self: *MemoryOutputStream) u64 {
        const cFn = @extern(*const fn (*MemoryOutputStream) callconv(.c) u64, .{ .name = "g_memory_output_stream_get_data_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSize(self: *MemoryOutputStream) u64 {
        const cFn = @extern(*const fn (*MemoryOutputStream) callconv(.c) u64, .{ .name = "g_memory_output_stream_get_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn stealAsBytes(self: *MemoryOutputStream) *GLib.Bytes {
        const cFn = @extern(*const fn (*MemoryOutputStream) callconv(.c) *GLib.Bytes, .{ .name = "g_memory_output_stream_steal_as_bytes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn stealData(self: *MemoryOutputStream) ?*anyopaque {
        const cFn = @extern(*const fn (*MemoryOutputStream) callconv(.c) ?*anyopaque, .{ .name = "g_memory_output_stream_steal_data" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_memory_output_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const MemoryOutputStreamClass = extern struct {
    parent_class: OutputStreamClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const MemoryOutputStreamPrivate = opaque {};
pub const Menu = struct {
    pub const Parent = MenuModel;
    pub fn new() *Menu {
        const cFn = @extern(*const fn () callconv(.c) *Menu, .{ .name = "g_menu_new" });
        const ret = cFn();
        return ret;
    }
    pub fn append(self: *Menu, arg_label: ?[*:0]const u8, arg_detailed_action: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Menu, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_menu_append" });
        const ret = cFn(self, arg_label, arg_detailed_action);
        return ret;
    }
    pub fn appendItem(self: *Menu, arg_item: *MenuItem) void {
        const cFn = @extern(*const fn (*Menu, *MenuItem) callconv(.c) void, .{ .name = "g_menu_append_item" });
        const ret = cFn(self, arg_item);
        return ret;
    }
    pub fn appendSection(self: *Menu, arg_label: ?[*:0]const u8, arg_section: *MenuModel) void {
        const cFn = @extern(*const fn (*Menu, ?[*:0]const u8, *MenuModel) callconv(.c) void, .{ .name = "g_menu_append_section" });
        const ret = cFn(self, arg_label, arg_section);
        return ret;
    }
    pub fn appendSubmenu(self: *Menu, arg_label: ?[*:0]const u8, arg_submenu: *MenuModel) void {
        const cFn = @extern(*const fn (*Menu, ?[*:0]const u8, *MenuModel) callconv(.c) void, .{ .name = "g_menu_append_submenu" });
        const ret = cFn(self, arg_label, arg_submenu);
        return ret;
    }
    pub fn freeze(self: *Menu) void {
        const cFn = @extern(*const fn (*Menu) callconv(.c) void, .{ .name = "g_menu_freeze" });
        const ret = cFn(self);
        return ret;
    }
    pub fn insert(self: *Menu, arg_position: i32, arg_label: ?[*:0]const u8, arg_detailed_action: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Menu, i32, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_menu_insert" });
        const ret = cFn(self, arg_position, arg_label, arg_detailed_action);
        return ret;
    }
    pub fn insertItem(self: *Menu, arg_position: i32, arg_item: *MenuItem) void {
        const cFn = @extern(*const fn (*Menu, i32, *MenuItem) callconv(.c) void, .{ .name = "g_menu_insert_item" });
        const ret = cFn(self, arg_position, arg_item);
        return ret;
    }
    pub fn insertSection(self: *Menu, arg_position: i32, arg_label: ?[*:0]const u8, arg_section: *MenuModel) void {
        const cFn = @extern(*const fn (*Menu, i32, ?[*:0]const u8, *MenuModel) callconv(.c) void, .{ .name = "g_menu_insert_section" });
        const ret = cFn(self, arg_position, arg_label, arg_section);
        return ret;
    }
    pub fn insertSubmenu(self: *Menu, arg_position: i32, arg_label: ?[*:0]const u8, arg_submenu: *MenuModel) void {
        const cFn = @extern(*const fn (*Menu, i32, ?[*:0]const u8, *MenuModel) callconv(.c) void, .{ .name = "g_menu_insert_submenu" });
        const ret = cFn(self, arg_position, arg_label, arg_submenu);
        return ret;
    }
    pub fn prepend(self: *Menu, arg_label: ?[*:0]const u8, arg_detailed_action: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Menu, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_menu_prepend" });
        const ret = cFn(self, arg_label, arg_detailed_action);
        return ret;
    }
    pub fn prependItem(self: *Menu, arg_item: *MenuItem) void {
        const cFn = @extern(*const fn (*Menu, *MenuItem) callconv(.c) void, .{ .name = "g_menu_prepend_item" });
        const ret = cFn(self, arg_item);
        return ret;
    }
    pub fn prependSection(self: *Menu, arg_label: ?[*:0]const u8, arg_section: *MenuModel) void {
        const cFn = @extern(*const fn (*Menu, ?[*:0]const u8, *MenuModel) callconv(.c) void, .{ .name = "g_menu_prepend_section" });
        const ret = cFn(self, arg_label, arg_section);
        return ret;
    }
    pub fn prependSubmenu(self: *Menu, arg_label: ?[*:0]const u8, arg_submenu: *MenuModel) void {
        const cFn = @extern(*const fn (*Menu, ?[*:0]const u8, *MenuModel) callconv(.c) void, .{ .name = "g_menu_prepend_submenu" });
        const ret = cFn(self, arg_label, arg_submenu);
        return ret;
    }
    pub fn remove(self: *Menu, arg_position: i32) void {
        const cFn = @extern(*const fn (*Menu, i32) callconv(.c) void, .{ .name = "g_menu_remove" });
        const ret = cFn(self, arg_position);
        return ret;
    }
    pub fn removeAll(self: *Menu) void {
        const cFn = @extern(*const fn (*Menu) callconv(.c) void, .{ .name = "g_menu_remove_all" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_menu_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const MenuAttributeIter = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = MenuAttributeIterClass;
    parent_instance: GObject.Object,
    priv: ?*MenuAttributeIterPrivate,
    pub fn getName(self: *MenuAttributeIter) [*:0]u8 {
        const cFn = @extern(*const fn (*MenuAttributeIter) callconv(.c) [*:0]u8, .{ .name = "g_menu_attribute_iter_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNext(self: *MenuAttributeIter) ?struct {
        out_name: [*:0]u8,
        value: *GLib.Variant,
    } {
        var argO_out_name: ?[*:0]u8 = undefined;
        const arg_out_name: ?*[*:0]u8 = &argO_out_name;
        var argO_value: ?*GLib.Variant = undefined;
        const arg_value: ?**GLib.Variant = &argO_value;
        const cFn = @extern(*const fn (*MenuAttributeIter, ?*[*:0]u8, ?**GLib.Variant) callconv(.c) bool, .{ .name = "g_menu_attribute_iter_get_next" });
        const ret = cFn(self, arg_out_name, arg_value);
        if (!ret) return null;
        return .{ .out_name = argO_out_name, .value = argO_value };
    }
    pub fn getValue(self: *MenuAttributeIter) *GLib.Variant {
        const cFn = @extern(*const fn (*MenuAttributeIter) callconv(.c) *GLib.Variant, .{ .name = "g_menu_attribute_iter_get_value" });
        const ret = cFn(self);
        return ret;
    }
    pub fn next(self: *MenuAttributeIter) bool {
        const cFn = @extern(*const fn (*MenuAttributeIter) callconv(.c) bool, .{ .name = "g_menu_attribute_iter_next" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_menu_attribute_iter_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const MenuAttributeIterClass = extern struct {
    parent_class: GObject.ObjectClass,
    get_next: ?*const fn (arg_iter: *MenuAttributeIter, arg_out_name: ?*[*:0]u8, arg_value: ?**GLib.Variant) callconv(.c) bool,
};
pub const MenuAttributeIterPrivate = opaque {};
pub const MenuItem = struct {
    pub const Parent = GObject.Object;
    pub fn new(arg_label: ?[*:0]const u8, arg_detailed_action: ?[*:0]const u8) *MenuItem {
        const cFn = @extern(*const fn (?[*:0]const u8, ?[*:0]const u8) callconv(.c) *MenuItem, .{ .name = "g_menu_item_new" });
        const ret = cFn(arg_label, arg_detailed_action);
        return ret;
    }
    pub fn newFromModel(arg_model: *MenuModel, arg_item_index: i32) *MenuItem {
        const cFn = @extern(*const fn (*MenuModel, i32) callconv(.c) *MenuItem, .{ .name = "g_menu_item_new_from_model" });
        const ret = cFn(arg_model, arg_item_index);
        return ret;
    }
    pub fn newSection(arg_label: ?[*:0]const u8, arg_section: *MenuModel) *MenuItem {
        const cFn = @extern(*const fn (?[*:0]const u8, *MenuModel) callconv(.c) *MenuItem, .{ .name = "g_menu_item_new_section" });
        const ret = cFn(arg_label, arg_section);
        return ret;
    }
    pub fn newSubmenu(arg_label: ?[*:0]const u8, arg_submenu: *MenuModel) *MenuItem {
        const cFn = @extern(*const fn (?[*:0]const u8, *MenuModel) callconv(.c) *MenuItem, .{ .name = "g_menu_item_new_submenu" });
        const ret = cFn(arg_label, arg_submenu);
        return ret;
    }
    pub fn getAttributeValue(self: *MenuItem, arg_attribute: [*:0]const u8, arg_expected_type: ?*GLib.VariantType) ?*GLib.Variant {
        const cFn = @extern(*const fn (*MenuItem, [*:0]const u8, ?*GLib.VariantType) callconv(.c) ?*GLib.Variant, .{ .name = "g_menu_item_get_attribute_value" });
        const ret = cFn(self, arg_attribute, arg_expected_type);
        return ret;
    }
    pub fn getLink(self: *MenuItem, arg_link: [*:0]const u8) ?*MenuModel {
        const cFn = @extern(*const fn (*MenuItem, [*:0]const u8) callconv(.c) ?*MenuModel, .{ .name = "g_menu_item_get_link" });
        const ret = cFn(self, arg_link);
        return ret;
    }
    pub fn setActionAndTargetValue(self: *MenuItem, arg_action: ?[*:0]const u8, arg_target_value: ?*GLib.Variant) void {
        const cFn = @extern(*const fn (*MenuItem, ?[*:0]const u8, ?*GLib.Variant) callconv(.c) void, .{ .name = "g_menu_item_set_action_and_target_value" });
        const ret = cFn(self, arg_action, arg_target_value);
        return ret;
    }
    pub fn setAttributeValue(self: *MenuItem, arg_attribute: [*:0]const u8, arg_value: ?*GLib.Variant) void {
        const cFn = @extern(*const fn (*MenuItem, [*:0]const u8, ?*GLib.Variant) callconv(.c) void, .{ .name = "g_menu_item_set_attribute_value" });
        const ret = cFn(self, arg_attribute, arg_value);
        return ret;
    }
    pub fn setDetailedAction(self: *MenuItem, arg_detailed_action: [*:0]const u8) void {
        const cFn = @extern(*const fn (*MenuItem, [*:0]const u8) callconv(.c) void, .{ .name = "g_menu_item_set_detailed_action" });
        const ret = cFn(self, arg_detailed_action);
        return ret;
    }
    pub fn setIcon(self: *MenuItem, arg_icon: *Icon) void {
        const cFn = @extern(*const fn (*MenuItem, *Icon) callconv(.c) void, .{ .name = "g_menu_item_set_icon" });
        const ret = cFn(self, arg_icon);
        return ret;
    }
    pub fn setLabel(self: *MenuItem, arg_label: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*MenuItem, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_menu_item_set_label" });
        const ret = cFn(self, arg_label);
        return ret;
    }
    pub fn setLink(self: *MenuItem, arg_link: [*:0]const u8, arg_model: ?*MenuModel) void {
        const cFn = @extern(*const fn (*MenuItem, [*:0]const u8, ?*MenuModel) callconv(.c) void, .{ .name = "g_menu_item_set_link" });
        const ret = cFn(self, arg_link, arg_model);
        return ret;
    }
    pub fn setSection(self: *MenuItem, arg_section: ?*MenuModel) void {
        const cFn = @extern(*const fn (*MenuItem, ?*MenuModel) callconv(.c) void, .{ .name = "g_menu_item_set_section" });
        const ret = cFn(self, arg_section);
        return ret;
    }
    pub fn setSubmenu(self: *MenuItem, arg_submenu: ?*MenuModel) void {
        const cFn = @extern(*const fn (*MenuItem, ?*MenuModel) callconv(.c) void, .{ .name = "g_menu_item_set_submenu" });
        const ret = cFn(self, arg_submenu);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_menu_item_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const MenuLinkIter = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = MenuLinkIterClass;
    parent_instance: GObject.Object,
    priv: ?*MenuLinkIterPrivate,
    pub fn getName(self: *MenuLinkIter) [*:0]u8 {
        const cFn = @extern(*const fn (*MenuLinkIter) callconv(.c) [*:0]u8, .{ .name = "g_menu_link_iter_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNext(self: *MenuLinkIter) ?struct {
        out_link: [*:0]u8,
        value: *MenuModel,
    } {
        var argO_out_link: ?[*:0]u8 = undefined;
        const arg_out_link: ?*[*:0]u8 = &argO_out_link;
        var argO_value: ?*MenuModel = undefined;
        const arg_value: ?**MenuModel = &argO_value;
        const cFn = @extern(*const fn (*MenuLinkIter, ?*[*:0]u8, ?**MenuModel) callconv(.c) bool, .{ .name = "g_menu_link_iter_get_next" });
        const ret = cFn(self, arg_out_link, arg_value);
        if (!ret) return null;
        return .{ .out_link = argO_out_link, .value = argO_value };
    }
    pub fn getValue(self: *MenuLinkIter) *MenuModel {
        const cFn = @extern(*const fn (*MenuLinkIter) callconv(.c) *MenuModel, .{ .name = "g_menu_link_iter_get_value" });
        const ret = cFn(self);
        return ret;
    }
    pub fn next(self: *MenuLinkIter) bool {
        const cFn = @extern(*const fn (*MenuLinkIter) callconv(.c) bool, .{ .name = "g_menu_link_iter_next" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_menu_link_iter_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const MenuLinkIterClass = extern struct {
    parent_class: GObject.ObjectClass,
    get_next: ?*const fn (arg_iter: *MenuLinkIter, arg_out_link: ?*[*:0]u8, arg_value: ?**MenuModel) callconv(.c) bool,
};
pub const MenuLinkIterPrivate = opaque {};
pub const MenuModel = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = MenuModelClass;
    _signals: struct {
        @"items-changed": core.Signal(fn (*MenuModel, i32, i32, i32) void, "items-changed") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*MenuModelPrivate,
    pub fn getItemAttributeValue(self: *MenuModel, arg_item_index: i32, arg_attribute: [*:0]const u8, arg_expected_type: ?*GLib.VariantType) ?*GLib.Variant {
        const cFn = @extern(*const fn (*MenuModel, i32, [*:0]const u8, ?*GLib.VariantType) callconv(.c) ?*GLib.Variant, .{ .name = "g_menu_model_get_item_attribute_value" });
        const ret = cFn(self, arg_item_index, arg_attribute, arg_expected_type);
        return ret;
    }
    pub fn getItemLink(self: *MenuModel, arg_item_index: i32, arg_link: [*:0]const u8) ?*MenuModel {
        const cFn = @extern(*const fn (*MenuModel, i32, [*:0]const u8) callconv(.c) ?*MenuModel, .{ .name = "g_menu_model_get_item_link" });
        const ret = cFn(self, arg_item_index, arg_link);
        return ret;
    }
    pub fn getNItems(self: *MenuModel) i32 {
        const cFn = @extern(*const fn (*MenuModel) callconv(.c) i32, .{ .name = "g_menu_model_get_n_items" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isMutable(self: *MenuModel) bool {
        const cFn = @extern(*const fn (*MenuModel) callconv(.c) bool, .{ .name = "g_menu_model_is_mutable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn itemsChanged(self: *MenuModel, arg_position: i32, arg_removed: i32, arg_added: i32) void {
        const cFn = @extern(*const fn (*MenuModel, i32, i32, i32) callconv(.c) void, .{ .name = "g_menu_model_items_changed" });
        const ret = cFn(self, arg_position, arg_removed, arg_added);
        return ret;
    }
    pub fn iterateItemAttributes(self: *MenuModel, arg_item_index: i32) *MenuAttributeIter {
        const cFn = @extern(*const fn (*MenuModel, i32) callconv(.c) *MenuAttributeIter, .{ .name = "g_menu_model_iterate_item_attributes" });
        const ret = cFn(self, arg_item_index);
        return ret;
    }
    pub fn iterateItemLinks(self: *MenuModel, arg_item_index: i32) *MenuLinkIter {
        const cFn = @extern(*const fn (*MenuModel, i32) callconv(.c) *MenuLinkIter, .{ .name = "g_menu_model_iterate_item_links" });
        const ret = cFn(self, arg_item_index);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_menu_model_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const MenuModelClass = extern struct {
    parent_class: GObject.ObjectClass,
    is_mutable: ?*const fn (arg_model: *MenuModel) callconv(.c) bool,
    get_n_items: ?*const fn (arg_model: *MenuModel) callconv(.c) i32,
    get_item_attributes: ?*const fn (arg_model: *MenuModel, arg_item_index: i32, arg_attributes: **GLib.HashTable) callconv(.c) void,
    iterate_item_attributes: ?*const fn (arg_model: *MenuModel, arg_item_index: i32) callconv(.c) *MenuAttributeIter,
    get_item_attribute_value: ?*const fn (arg_model: *MenuModel, arg_item_index: i32, arg_attribute: [*:0]const u8, arg_expected_type: ?*GLib.VariantType) callconv(.c) ?*GLib.Variant,
    get_item_links: ?*const fn (arg_model: *MenuModel, arg_item_index: i32, arg_links: **GLib.HashTable) callconv(.c) void,
    iterate_item_links: ?*const fn (arg_model: *MenuModel, arg_item_index: i32) callconv(.c) *MenuLinkIter,
    get_item_link: ?*const fn (arg_model: *MenuModel, arg_item_index: i32, arg_link: [*:0]const u8) callconv(.c) ?*MenuModel,
};
pub const MenuModelPrivate = opaque {};
pub const Mount = struct {
    pub const Class = MountIface;
    _signals: struct {
        changed: core.Signal(fn (*Mount) void, "changed") = .{},
        @"pre-unmount": core.Signal(fn (*Mount) void, "pre-unmount") = .{},
        unmounted: core.Signal(fn (*Mount) void, "unmounted") = .{},
    },
    pub fn canEject(self: *Mount) bool {
        const cFn = @extern(*const fn (*Mount) callconv(.c) bool, .{ .name = "g_mount_can_eject" });
        const ret = cFn(self);
        return ret;
    }
    pub fn canUnmount(self: *Mount) bool {
        const cFn = @extern(*const fn (*Mount) callconv(.c) bool, .{ .name = "g_mount_can_unmount" });
        const ret = cFn(self);
        return ret;
    }
    pub fn eject(self: *Mount, arg_flags: MountUnmountFlags, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Mount, MountUnmountFlags, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_mount_eject" });
        const ret = cFn(self, arg_flags, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn ejectFinish(self: *Mount, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Mount, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_mount_eject_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn ejectWithOperation(self: *Mount, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Mount, MountUnmountFlags, ?*MountOperation, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_mount_eject_with_operation" });
        const ret = cFn(self, arg_flags, arg_mount_operation, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn ejectWithOperationFinish(self: *Mount, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Mount, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_mount_eject_with_operation_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getDefaultLocation(self: *Mount) *File {
        const cFn = @extern(*const fn (*Mount) callconv(.c) *File, .{ .name = "g_mount_get_default_location" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDrive(self: *Mount) ?*Drive {
        const cFn = @extern(*const fn (*Mount) callconv(.c) ?*Drive, .{ .name = "g_mount_get_drive" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIcon(self: *Mount) *Icon {
        const cFn = @extern(*const fn (*Mount) callconv(.c) *Icon, .{ .name = "g_mount_get_icon" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getName(self: *Mount) [*:0]u8 {
        const cFn = @extern(*const fn (*Mount) callconv(.c) [*:0]u8, .{ .name = "g_mount_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRoot(self: *Mount) *File {
        const cFn = @extern(*const fn (*Mount) callconv(.c) *File, .{ .name = "g_mount_get_root" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSortKey(self: *Mount) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Mount) callconv(.c) ?[*:0]u8, .{ .name = "g_mount_get_sort_key" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSymbolicIcon(self: *Mount) *Icon {
        const cFn = @extern(*const fn (*Mount) callconv(.c) *Icon, .{ .name = "g_mount_get_symbolic_icon" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUuid(self: *Mount) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Mount) callconv(.c) ?[*:0]u8, .{ .name = "g_mount_get_uuid" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getVolume(self: *Mount) ?*Volume {
        const cFn = @extern(*const fn (*Mount) callconv(.c) ?*Volume, .{ .name = "g_mount_get_volume" });
        const ret = cFn(self);
        return ret;
    }
    pub fn guessContentType(self: *Mount, arg_force_rescan: bool, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Mount, bool, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_mount_guess_content_type" });
        const ret = cFn(self, arg_force_rescan, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn guessContentTypeFinish(self: *Mount, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}![*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*Mount, *AsyncResult, *?*GLib.Error) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_mount_guess_content_type_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn guessContentTypeSync(self: *Mount, arg_force_rescan: bool, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}![*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*Mount, bool, ?*Cancellable, *?*GLib.Error) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_mount_guess_content_type_sync" });
        const ret = cFn(self, arg_force_rescan, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn isShadowed(self: *Mount) bool {
        const cFn = @extern(*const fn (*Mount) callconv(.c) bool, .{ .name = "g_mount_is_shadowed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn remount(self: *Mount, arg_flags: MountMountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Mount, MountMountFlags, ?*MountOperation, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_mount_remount" });
        const ret = cFn(self, arg_flags, arg_mount_operation, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn remountFinish(self: *Mount, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Mount, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_mount_remount_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn shadow(self: *Mount) void {
        const cFn = @extern(*const fn (*Mount) callconv(.c) void, .{ .name = "g_mount_shadow" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unmount(self: *Mount, arg_flags: MountUnmountFlags, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Mount, MountUnmountFlags, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_mount_unmount" });
        const ret = cFn(self, arg_flags, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn unmountFinish(self: *Mount, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Mount, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_mount_unmount_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn unmountWithOperation(self: *Mount, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Mount, MountUnmountFlags, ?*MountOperation, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_mount_unmount_with_operation" });
        const ret = cFn(self, arg_flags, arg_mount_operation, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn unmountWithOperationFinish(self: *Mount, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Mount, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_mount_unmount_with_operation_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn unshadow(self: *Mount) void {
        const cFn = @extern(*const fn (*Mount) callconv(.c) void, .{ .name = "g_mount_unshadow" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_mount_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const MountIface = extern struct {
    g_iface: GObject.TypeInterface,
    changed: ?*const fn (arg_mount: *Mount) callconv(.c) void,
    unmounted: ?*const fn (arg_mount: *Mount) callconv(.c) void,
    get_root: ?*const fn (arg_mount: *Mount) callconv(.c) *File,
    get_name: ?*const fn (arg_mount: *Mount) callconv(.c) [*:0]u8,
    get_icon: ?*const fn (arg_mount: *Mount) callconv(.c) *Icon,
    get_uuid: ?*const fn (arg_mount: *Mount) callconv(.c) ?[*:0]u8,
    get_volume: ?*const fn (arg_mount: *Mount) callconv(.c) ?*Volume,
    get_drive: ?*const fn (arg_mount: *Mount) callconv(.c) ?*Drive,
    can_unmount: ?*const fn (arg_mount: *Mount) callconv(.c) bool,
    can_eject: ?*const fn (arg_mount: *Mount) callconv(.c) bool,
    unmount: ?*const fn (arg_mount: *Mount, arg_flags: MountUnmountFlags, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    unmount_finish: ?*const fn (arg_mount: *Mount, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    eject: ?*const fn (arg_mount: *Mount, arg_flags: MountUnmountFlags, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    eject_finish: ?*const fn (arg_mount: *Mount, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    remount: ?*const fn (arg_mount: *Mount, arg_flags: MountMountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    remount_finish: ?*const fn (arg_mount: *Mount, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    guess_content_type: ?*const fn (arg_mount: *Mount, arg_force_rescan: bool, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    guess_content_type_finish: ?*const fn (arg_mount: *Mount, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) [*]?[*:0]const u8,
    guess_content_type_sync: ?*const fn (arg_mount: *Mount, arg_force_rescan: bool, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) [*]?[*:0]const u8,
    pre_unmount: ?*const fn (arg_mount: *Mount) callconv(.c) void,
    unmount_with_operation: ?*const fn (arg_mount: *Mount, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    unmount_with_operation_finish: ?*const fn (arg_mount: *Mount, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    eject_with_operation: ?*const fn (arg_mount: *Mount, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    eject_with_operation_finish: ?*const fn (arg_mount: *Mount, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    get_default_location: ?*const fn (arg_mount: *Mount) callconv(.c) *File,
    get_sort_key: ?*const fn (arg_mount: *Mount) callconv(.c) ?[*:0]u8,
    get_symbolic_icon: ?*const fn (arg_mount: *Mount) callconv(.c) *Icon,
};
pub const MountMountFlags = packed struct(u32) {
    _: u32 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_mount_mount_flags_get_type" });
        return cFn();
    }
};
pub const MountOperation = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = MountOperationClass;
    _props: struct {
        anonymous: core.Property(bool, "anonymous") = .{},
        choice: core.Property(i32, "choice") = .{},
        domain: core.Property([*:0]const u8, "domain") = .{},
        @"is-tcrypt-hidden-volume": core.Property(bool, "is-tcrypt-hidden-volume") = .{},
        @"is-tcrypt-system-volume": core.Property(bool, "is-tcrypt-system-volume") = .{},
        password: core.Property([*:0]const u8, "password") = .{},
        @"password-save": core.Property(PasswordSave, "password-save") = .{},
        pim: core.Property(u32, "pim") = .{},
        username: core.Property([*:0]const u8, "username") = .{},
    },
    _signals: struct {
        aborted: core.Signal(fn (*MountOperation) void, "aborted") = .{},
        @"ask-password": core.Signal(fn (*MountOperation, [*:0]const u8, [*:0]const u8, [*:0]const u8, AskPasswordFlags) void, "ask-password") = .{},
        @"ask-question": core.Signal(fn (*MountOperation, [*:0]const u8, [*]?[*:0]const u8) void, "ask-question") = .{},
        reply: core.Signal(fn (*MountOperation, MountOperationResult) void, "reply") = .{},
        @"show-processes": core.Signal(fn (*MountOperation, [*:0]const u8, *GLib.Array, [*]?[*:0]const u8) void, "show-processes") = .{},
        @"show-unmount-progress": core.Signal(fn (*MountOperation, [*:0]const u8, i64, i64) void, "show-unmount-progress") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*MountOperationPrivate,
    pub fn new() *MountOperation {
        const cFn = @extern(*const fn () callconv(.c) *MountOperation, .{ .name = "g_mount_operation_new" });
        const ret = cFn();
        return ret;
    }
    pub fn getAnonymous(self: *MountOperation) bool {
        const cFn = @extern(*const fn (*MountOperation) callconv(.c) bool, .{ .name = "g_mount_operation_get_anonymous" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getChoice(self: *MountOperation) i32 {
        const cFn = @extern(*const fn (*MountOperation) callconv(.c) i32, .{ .name = "g_mount_operation_get_choice" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDomain(self: *MountOperation) ?[*:0]u8 {
        const cFn = @extern(*const fn (*MountOperation) callconv(.c) ?[*:0]u8, .{ .name = "g_mount_operation_get_domain" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsTcryptHiddenVolume(self: *MountOperation) bool {
        const cFn = @extern(*const fn (*MountOperation) callconv(.c) bool, .{ .name = "g_mount_operation_get_is_tcrypt_hidden_volume" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsTcryptSystemVolume(self: *MountOperation) bool {
        const cFn = @extern(*const fn (*MountOperation) callconv(.c) bool, .{ .name = "g_mount_operation_get_is_tcrypt_system_volume" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPassword(self: *MountOperation) ?[*:0]u8 {
        const cFn = @extern(*const fn (*MountOperation) callconv(.c) ?[*:0]u8, .{ .name = "g_mount_operation_get_password" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPasswordSave(self: *MountOperation) PasswordSave {
        const cFn = @extern(*const fn (*MountOperation) callconv(.c) PasswordSave, .{ .name = "g_mount_operation_get_password_save" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPim(self: *MountOperation) u32 {
        const cFn = @extern(*const fn (*MountOperation) callconv(.c) u32, .{ .name = "g_mount_operation_get_pim" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUsername(self: *MountOperation) ?[*:0]u8 {
        const cFn = @extern(*const fn (*MountOperation) callconv(.c) ?[*:0]u8, .{ .name = "g_mount_operation_get_username" });
        const ret = cFn(self);
        return ret;
    }
    pub fn reply(self: *MountOperation, arg_result: MountOperationResult) void {
        const cFn = @extern(*const fn (*MountOperation, MountOperationResult) callconv(.c) void, .{ .name = "g_mount_operation_reply" });
        const ret = cFn(self, arg_result);
        return ret;
    }
    pub fn setAnonymous(self: *MountOperation, arg_anonymous: bool) void {
        const cFn = @extern(*const fn (*MountOperation, bool) callconv(.c) void, .{ .name = "g_mount_operation_set_anonymous" });
        const ret = cFn(self, arg_anonymous);
        return ret;
    }
    pub fn setChoice(self: *MountOperation, arg_choice: i32) void {
        const cFn = @extern(*const fn (*MountOperation, i32) callconv(.c) void, .{ .name = "g_mount_operation_set_choice" });
        const ret = cFn(self, arg_choice);
        return ret;
    }
    pub fn setDomain(self: *MountOperation, arg_domain: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*MountOperation, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_mount_operation_set_domain" });
        const ret = cFn(self, arg_domain);
        return ret;
    }
    pub fn setIsTcryptHiddenVolume(self: *MountOperation, arg_hidden_volume: bool) void {
        const cFn = @extern(*const fn (*MountOperation, bool) callconv(.c) void, .{ .name = "g_mount_operation_set_is_tcrypt_hidden_volume" });
        const ret = cFn(self, arg_hidden_volume);
        return ret;
    }
    pub fn setIsTcryptSystemVolume(self: *MountOperation, arg_system_volume: bool) void {
        const cFn = @extern(*const fn (*MountOperation, bool) callconv(.c) void, .{ .name = "g_mount_operation_set_is_tcrypt_system_volume" });
        const ret = cFn(self, arg_system_volume);
        return ret;
    }
    pub fn setPassword(self: *MountOperation, arg_password: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*MountOperation, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_mount_operation_set_password" });
        const ret = cFn(self, arg_password);
        return ret;
    }
    pub fn setPasswordSave(self: *MountOperation, arg_save: PasswordSave) void {
        const cFn = @extern(*const fn (*MountOperation, PasswordSave) callconv(.c) void, .{ .name = "g_mount_operation_set_password_save" });
        const ret = cFn(self, arg_save);
        return ret;
    }
    pub fn setPim(self: *MountOperation, arg_pim: u32) void {
        const cFn = @extern(*const fn (*MountOperation, u32) callconv(.c) void, .{ .name = "g_mount_operation_set_pim" });
        const ret = cFn(self, arg_pim);
        return ret;
    }
    pub fn setUsername(self: *MountOperation, arg_username: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*MountOperation, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_mount_operation_set_username" });
        const ret = cFn(self, arg_username);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_mount_operation_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const MountOperationClass = extern struct {
    parent_class: GObject.ObjectClass,
    ask_password: ?*const fn (arg_op: *MountOperation, arg_message: [*:0]const u8, arg_default_user: [*:0]const u8, arg_default_domain: [*:0]const u8, arg_flags: AskPasswordFlags) callconv(.c) void,
    ask_question: ?*const fn (arg_op: *MountOperation, arg_message: [*:0]const u8, arg_choices: [*]?[*:0]const u8) callconv(.c) void,
    reply: ?*const fn (arg_op: *MountOperation, arg_result: MountOperationResult) callconv(.c) void,
    aborted: ?*const fn (arg_op: *MountOperation) callconv(.c) void,
    show_processes: ?*const fn (arg_op: *MountOperation, arg_message: [*:0]const u8, arg_processes: *GLib.Array, arg_choices: [*]?[*:0]const u8) callconv(.c) void,
    show_unmount_progress: ?*const fn (arg_op: *MountOperation, arg_message: [*:0]const u8, arg_time_left: i64, arg_bytes_left: i64) callconv(.c) void,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
    _g_reserved6: ?*anyopaque,
    _g_reserved7: ?*anyopaque,
    _g_reserved8: ?*anyopaque,
    _g_reserved9: ?*anyopaque,
};
pub const MountOperationPrivate = opaque {};
pub const MountOperationResult = enum(u32) {
    handled = 0,
    aborted = 1,
    unhandled = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_mount_operation_result_get_type" });
        return cFn();
    }
};
pub const MountUnmountFlags = packed struct(u32) {
    force: bool = false,
    _: u31 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_mount_unmount_flags_get_type" });
        return cFn();
    }
};
pub const NATIVE_VOLUME_MONITOR_EXTENSION_POINT_NAME = "gio-native-volume-monitor";
pub const NETWORK_MONITOR_EXTENSION_POINT_NAME = "gio-network-monitor";
pub const NativeSocketAddress = extern struct {
    pub const Interfaces = [_]type{SocketConnectable};
    pub const Parent = SocketAddress;
    pub const Class = NativeSocketAddressClass;
    parent_instance: SocketAddress,
    priv: ?*NativeSocketAddressPrivate,
    pub fn new(arg_native: ?*anyopaque, arg_len: u64) *NativeSocketAddress {
        const cFn = @extern(*const fn (?*anyopaque, u64) callconv(.c) *NativeSocketAddress, .{ .name = "g_native_socket_address_new" });
        const ret = cFn(@ptrCast(arg_native), arg_len);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_native_socket_address_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const NativeSocketAddressClass = extern struct {
    parent_class: SocketAddressClass,
};
pub const NativeSocketAddressPrivate = opaque {};
pub const NativeVolumeMonitor = extern struct {
    pub const Parent = VolumeMonitor;
    pub const Class = NativeVolumeMonitorClass;
    parent_instance: VolumeMonitor,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_native_volume_monitor_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const NativeVolumeMonitorClass = extern struct {
    parent_class: VolumeMonitorClass,
    get_mount_for_mount_path: ?*anyopaque,
};
pub const NetworkAddress = extern struct {
    pub const Interfaces = [_]type{SocketConnectable};
    pub const Parent = GObject.Object;
    pub const Class = NetworkAddressClass;
    _props: struct {
        hostname: core.Property([*:0]const u8, "hostname") = .{},
        port: core.Property(u32, "port") = .{},
        scheme: core.Property([*:0]const u8, "scheme") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*NetworkAddressPrivate,
    pub fn new(arg_hostname: [*:0]const u8, arg_port: u16) *NetworkAddress {
        const cFn = @extern(*const fn ([*:0]const u8, u16) callconv(.c) *NetworkAddress, .{ .name = "g_network_address_new" });
        const ret = cFn(arg_hostname, arg_port);
        return ret;
    }
    pub fn newLoopback(arg_port: u16) *NetworkAddress {
        const cFn = @extern(*const fn (u16) callconv(.c) *NetworkAddress, .{ .name = "g_network_address_new_loopback" });
        const ret = cFn(arg_port);
        return ret;
    }
    pub fn parse(arg_host_and_port: [*:0]const u8, arg_default_port: u16, arg_error: *?*GLib.Error) error{GError}!*NetworkAddress {
        const cFn = @extern(*const fn ([*:0]const u8, u16, *?*GLib.Error) callconv(.c) *NetworkAddress, .{ .name = "g_network_address_parse" });
        const ret = cFn(arg_host_and_port, arg_default_port, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn parseUri(arg_uri: [*:0]const u8, arg_default_port: u16, arg_error: *?*GLib.Error) error{GError}!*NetworkAddress {
        const cFn = @extern(*const fn ([*:0]const u8, u16, *?*GLib.Error) callconv(.c) *NetworkAddress, .{ .name = "g_network_address_parse_uri" });
        const ret = cFn(arg_uri, arg_default_port, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getHostname(self: *NetworkAddress) [*:0]u8 {
        const cFn = @extern(*const fn (*NetworkAddress) callconv(.c) [*:0]u8, .{ .name = "g_network_address_get_hostname" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPort(self: *NetworkAddress) u16 {
        const cFn = @extern(*const fn (*NetworkAddress) callconv(.c) u16, .{ .name = "g_network_address_get_port" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getScheme(self: *NetworkAddress) ?[*:0]u8 {
        const cFn = @extern(*const fn (*NetworkAddress) callconv(.c) ?[*:0]u8, .{ .name = "g_network_address_get_scheme" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_network_address_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const NetworkAddressClass = extern struct {
    parent_class: GObject.ObjectClass,
};
pub const NetworkAddressPrivate = opaque {};
pub const NetworkConnectivity = enum(u32) {
    local = 1,
    limited = 2,
    portal = 3,
    full = 4,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_network_connectivity_get_type" });
        return cFn();
    }
};
pub const NetworkMonitor = struct {
    pub const Prerequistes = [_]type{Initable};
    pub const Class = NetworkMonitorInterface;
    _props: struct {
        connectivity: core.Property(NetworkConnectivity, "connectivity") = .{},
        @"network-available": core.Property(bool, "network-available") = .{},
        @"network-metered": core.Property(bool, "network-metered") = .{},
    },
    _signals: struct {
        @"network-changed": core.Signal(fn (*NetworkMonitor, bool) void, "network-changed") = .{},
    },
    pub fn getDefault() *NetworkMonitor {
        const cFn = @extern(*const fn () callconv(.c) *NetworkMonitor, .{ .name = "g_network_monitor_get_default" });
        const ret = cFn();
        return ret;
    }
    pub fn canReach(self: *NetworkMonitor, arg_connectable: *SocketConnectable, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*NetworkMonitor, *SocketConnectable, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_network_monitor_can_reach" });
        const ret = cFn(self, arg_connectable, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn canReachAsync(self: *NetworkMonitor, arg_connectable: *SocketConnectable, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*NetworkMonitor, *SocketConnectable, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_network_monitor_can_reach_async" });
        const ret = cFn(self, arg_connectable, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn canReachFinish(self: *NetworkMonitor, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*NetworkMonitor, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_network_monitor_can_reach_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getConnectivity(self: *NetworkMonitor) NetworkConnectivity {
        const cFn = @extern(*const fn (*NetworkMonitor) callconv(.c) NetworkConnectivity, .{ .name = "g_network_monitor_get_connectivity" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNetworkAvailable(self: *NetworkMonitor) bool {
        const cFn = @extern(*const fn (*NetworkMonitor) callconv(.c) bool, .{ .name = "g_network_monitor_get_network_available" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNetworkMetered(self: *NetworkMonitor) bool {
        const cFn = @extern(*const fn (*NetworkMonitor) callconv(.c) bool, .{ .name = "g_network_monitor_get_network_metered" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_network_monitor_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const NetworkMonitorInterface = extern struct {
    g_iface: GObject.TypeInterface,
    network_changed: ?*const fn (arg_monitor: *NetworkMonitor, arg_network_available: bool) callconv(.c) void,
    can_reach: ?*const fn (arg_monitor: *NetworkMonitor, arg_connectable: *SocketConnectable, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    can_reach_async: ?*const fn (arg_monitor: *NetworkMonitor, arg_connectable: *SocketConnectable, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    can_reach_finish: ?*const fn (arg_monitor: *NetworkMonitor, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
};
pub const NetworkService = extern struct {
    pub const Interfaces = [_]type{SocketConnectable};
    pub const Parent = GObject.Object;
    pub const Class = NetworkServiceClass;
    _props: struct {
        domain: core.Property([*:0]const u8, "domain") = .{},
        protocol: core.Property([*:0]const u8, "protocol") = .{},
        scheme: core.Property([*:0]const u8, "scheme") = .{},
        service: core.Property([*:0]const u8, "service") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*NetworkServicePrivate,
    pub fn new(arg_service: [*:0]const u8, arg_protocol: [*:0]const u8, arg_domain: [*:0]const u8) *NetworkService {
        const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, [*:0]const u8) callconv(.c) *NetworkService, .{ .name = "g_network_service_new" });
        const ret = cFn(arg_service, arg_protocol, arg_domain);
        return ret;
    }
    pub fn getDomain(self: *NetworkService) [*:0]u8 {
        const cFn = @extern(*const fn (*NetworkService) callconv(.c) [*:0]u8, .{ .name = "g_network_service_get_domain" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getProtocol(self: *NetworkService) [*:0]u8 {
        const cFn = @extern(*const fn (*NetworkService) callconv(.c) [*:0]u8, .{ .name = "g_network_service_get_protocol" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getScheme(self: *NetworkService) [*:0]u8 {
        const cFn = @extern(*const fn (*NetworkService) callconv(.c) [*:0]u8, .{ .name = "g_network_service_get_scheme" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getService(self: *NetworkService) [*:0]u8 {
        const cFn = @extern(*const fn (*NetworkService) callconv(.c) [*:0]u8, .{ .name = "g_network_service_get_service" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setScheme(self: *NetworkService, arg_scheme: [*:0]const u8) void {
        const cFn = @extern(*const fn (*NetworkService, [*:0]const u8) callconv(.c) void, .{ .name = "g_network_service_set_scheme" });
        const ret = cFn(self, arg_scheme);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_network_service_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const NetworkServiceClass = extern struct {
    parent_class: GObject.ObjectClass,
};
pub const NetworkServicePrivate = opaque {};
pub const Notification = struct {
    pub const Parent = GObject.Object;
    pub fn new(arg_title: [*:0]const u8) *Notification {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *Notification, .{ .name = "g_notification_new" });
        const ret = cFn(arg_title);
        return ret;
    }
    pub fn addButton(self: *Notification, arg_label: [*:0]const u8, arg_detailed_action: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Notification, [*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_notification_add_button" });
        const ret = cFn(self, arg_label, arg_detailed_action);
        return ret;
    }
    pub fn addButtonWithTarget(self: *Notification, arg_label: [*:0]const u8, arg_action: [*:0]const u8, arg_target: ?*GLib.Variant) void {
        const cFn = @extern(*const fn (*Notification, [*:0]const u8, [*:0]const u8, ?*GLib.Variant) callconv(.c) void, .{ .name = "g_notification_add_button_with_target_value" });
        const ret = cFn(self, arg_label, arg_action, arg_target);
        return ret;
    }
    pub fn setBody(self: *Notification, arg_body: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Notification, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_notification_set_body" });
        const ret = cFn(self, arg_body);
        return ret;
    }
    pub fn setCategory(self: *Notification, arg_category: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Notification, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_notification_set_category" });
        const ret = cFn(self, arg_category);
        return ret;
    }
    pub fn setDefaultAction(self: *Notification, arg_detailed_action: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Notification, [*:0]const u8) callconv(.c) void, .{ .name = "g_notification_set_default_action" });
        const ret = cFn(self, arg_detailed_action);
        return ret;
    }
    pub fn setDefaultActionAndTarget(self: *Notification, arg_action: [*:0]const u8, arg_target: ?*GLib.Variant) void {
        const cFn = @extern(*const fn (*Notification, [*:0]const u8, ?*GLib.Variant) callconv(.c) void, .{ .name = "g_notification_set_default_action_and_target_value" });
        const ret = cFn(self, arg_action, arg_target);
        return ret;
    }
    pub fn setIcon(self: *Notification, arg_icon: *Icon) void {
        const cFn = @extern(*const fn (*Notification, *Icon) callconv(.c) void, .{ .name = "g_notification_set_icon" });
        const ret = cFn(self, arg_icon);
        return ret;
    }
    pub fn setPriority(self: *Notification, arg_priority: NotificationPriority) void {
        const cFn = @extern(*const fn (*Notification, NotificationPriority) callconv(.c) void, .{ .name = "g_notification_set_priority" });
        const ret = cFn(self, arg_priority);
        return ret;
    }
    pub fn setTitle(self: *Notification, arg_title: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Notification, [*:0]const u8) callconv(.c) void, .{ .name = "g_notification_set_title" });
        const ret = cFn(self, arg_title);
        return ret;
    }
    pub fn setUrgent(self: *Notification, arg_urgent: bool) void {
        const cFn = @extern(*const fn (*Notification, bool) callconv(.c) void, .{ .name = "g_notification_set_urgent" });
        const ret = cFn(self, arg_urgent);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_notification_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const NotificationPriority = enum(u32) {
    normal = 0,
    low = 1,
    high = 2,
    urgent = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_notification_priority_get_type" });
        return cFn();
    }
};
pub const OutputMessage = extern struct {
    address: ?*SocketAddress,
    vectors: ?*OutputVector,
    num_vectors: u32,
    bytes_sent: u32,
    control_messages: ?[*]*SocketControlMessage,
    num_control_messages: u32,
};
pub const OutputStream = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = OutputStreamClass;
    parent_instance: GObject.Object,
    priv: ?*OutputStreamPrivate,
    pub fn clearPending(self: *OutputStream) void {
        const cFn = @extern(*const fn (*OutputStream) callconv(.c) void, .{ .name = "g_output_stream_clear_pending" });
        const ret = cFn(self);
        return ret;
    }
    pub fn close(self: *OutputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*OutputStream, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_output_stream_close" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn closeAsync(self: *OutputStream, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*OutputStream, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_output_stream_close_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn closeFinish(self: *OutputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*OutputStream, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_output_stream_close_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn flush(self: *OutputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*OutputStream, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_output_stream_flush" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn flushAsync(self: *OutputStream, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*OutputStream, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_output_stream_flush_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn flushFinish(self: *OutputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*OutputStream, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_output_stream_flush_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn hasPending(self: *OutputStream) bool {
        const cFn = @extern(*const fn (*OutputStream) callconv(.c) bool, .{ .name = "g_output_stream_has_pending" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isClosed(self: *OutputStream) bool {
        const cFn = @extern(*const fn (*OutputStream) callconv(.c) bool, .{ .name = "g_output_stream_is_closed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isClosing(self: *OutputStream) bool {
        const cFn = @extern(*const fn (*OutputStream) callconv(.c) bool, .{ .name = "g_output_stream_is_closing" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setPending(self: *OutputStream, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*OutputStream, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_output_stream_set_pending" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn splice(self: *OutputStream, arg_source: *InputStream, arg_flags: OutputStreamSpliceFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*OutputStream, *InputStream, OutputStreamSpliceFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_output_stream_splice" });
        const ret = cFn(self, arg_source, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn spliceAsync(self: *OutputStream, arg_source: *InputStream, arg_flags: OutputStreamSpliceFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*OutputStream, *InputStream, OutputStreamSpliceFlags, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_output_stream_splice_async" });
        const ret = cFn(self, arg_source, arg_flags, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn spliceFinish(self: *OutputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*OutputStream, *AsyncResult, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_output_stream_splice_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn write(self: *OutputStream, argS_buffer: []u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_count: u64 = @intCast((argS_buffer).len);
        const cFn = @extern(*const fn (*OutputStream, [*]u8, u64, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_output_stream_write" });
        const ret = cFn(self, arg_buffer, arg_count, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn writeAll(self: *OutputStream, argS_buffer: []u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        bytes_written: u64,
    } {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_count: u64 = @intCast((argS_buffer).len);
        var argO_bytes_written: u64 = undefined;
        const arg_bytes_written: ?*u64 = &argO_bytes_written;
        const cFn = @extern(*const fn (*OutputStream, [*]u8, u64, ?*u64, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_output_stream_write_all" });
        const ret = cFn(self, arg_buffer, arg_count, arg_bytes_written, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .bytes_written = argO_bytes_written };
    }
    pub fn writeAllAsync(self: *OutputStream, argS_buffer: []u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_count: u64 = @intCast((argS_buffer).len);
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*OutputStream, [*]u8, u64, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_output_stream_write_all_async" });
        const ret = cFn(self, arg_buffer, arg_count, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn writeAllFinish(self: *OutputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        bytes_written: u64,
    } {
        var argO_bytes_written: u64 = undefined;
        const arg_bytes_written: ?*u64 = &argO_bytes_written;
        const cFn = @extern(*const fn (*OutputStream, *AsyncResult, ?*u64, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_output_stream_write_all_finish" });
        const ret = cFn(self, arg_result, arg_bytes_written, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .bytes_written = argO_bytes_written };
    }
    pub fn writeAsync(self: *OutputStream, argS_buffer: []u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_count: u64 = @intCast((argS_buffer).len);
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*OutputStream, [*]u8, u64, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_output_stream_write_async" });
        const ret = cFn(self, arg_buffer, arg_count, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn writeBytes(self: *OutputStream, arg_bytes: *GLib.Bytes, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*OutputStream, *GLib.Bytes, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_output_stream_write_bytes" });
        const ret = cFn(self, arg_bytes, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn writeBytesAsync(self: *OutputStream, arg_bytes: *GLib.Bytes, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*OutputStream, *GLib.Bytes, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_output_stream_write_bytes_async" });
        const ret = cFn(self, arg_bytes, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn writeBytesFinish(self: *OutputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*OutputStream, *AsyncResult, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_output_stream_write_bytes_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn writeFinish(self: *OutputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*OutputStream, *AsyncResult, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_output_stream_write_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn writev(self: *OutputStream, argS_vectors: []OutputVector, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        bytes_written: u64,
    } {
        const arg_vectors: [*]OutputVector = @ptrCast(argS_vectors);
        const arg_n_vectors: u64 = @intCast((argS_vectors).len);
        var argO_bytes_written: u64 = undefined;
        const arg_bytes_written: ?*u64 = &argO_bytes_written;
        const cFn = @extern(*const fn (*OutputStream, [*]OutputVector, u64, ?*u64, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_output_stream_writev" });
        const ret = cFn(self, arg_vectors, arg_n_vectors, arg_bytes_written, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .bytes_written = argO_bytes_written };
    }
    pub fn writevAll(self: *OutputStream, argS_vectors: []OutputVector, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        bytes_written: u64,
    } {
        const arg_vectors: [*]OutputVector = @ptrCast(argS_vectors);
        const arg_n_vectors: u64 = @intCast((argS_vectors).len);
        var argO_bytes_written: u64 = undefined;
        const arg_bytes_written: ?*u64 = &argO_bytes_written;
        const cFn = @extern(*const fn (*OutputStream, [*]OutputVector, u64, ?*u64, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_output_stream_writev_all" });
        const ret = cFn(self, arg_vectors, arg_n_vectors, arg_bytes_written, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .bytes_written = argO_bytes_written };
    }
    pub fn writevAllAsync(self: *OutputStream, argS_vectors: []OutputVector, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_vectors: [*]OutputVector = @ptrCast(argS_vectors);
        const arg_n_vectors: u64 = @intCast((argS_vectors).len);
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*OutputStream, [*]OutputVector, u64, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_output_stream_writev_all_async" });
        const ret = cFn(self, arg_vectors, arg_n_vectors, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn writevAllFinish(self: *OutputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        bytes_written: u64,
    } {
        var argO_bytes_written: u64 = undefined;
        const arg_bytes_written: ?*u64 = &argO_bytes_written;
        const cFn = @extern(*const fn (*OutputStream, *AsyncResult, ?*u64, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_output_stream_writev_all_finish" });
        const ret = cFn(self, arg_result, arg_bytes_written, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .bytes_written = argO_bytes_written };
    }
    pub fn writevAsync(self: *OutputStream, argS_vectors: []OutputVector, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_vectors: [*]OutputVector = @ptrCast(argS_vectors);
        const arg_n_vectors: u64 = @intCast((argS_vectors).len);
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*OutputStream, [*]OutputVector, u64, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_output_stream_writev_async" });
        const ret = cFn(self, arg_vectors, arg_n_vectors, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn writevFinish(self: *OutputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        bytes_written: u64,
    } {
        var argO_bytes_written: u64 = undefined;
        const arg_bytes_written: ?*u64 = &argO_bytes_written;
        const cFn = @extern(*const fn (*OutputStream, *AsyncResult, ?*u64, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_output_stream_writev_finish" });
        const ret = cFn(self, arg_result, arg_bytes_written, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .bytes_written = argO_bytes_written };
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_output_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const OutputStreamClass = extern struct {
    parent_class: GObject.ObjectClass,
    write_fn: ?*const fn (arg_stream: *OutputStream, arg_buffer: ?[*]u8, arg_count: u64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) i64,
    splice: ?*const fn (arg_stream: *OutputStream, arg_source: *InputStream, arg_flags: OutputStreamSpliceFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) i64,
    flush: ?*const fn (arg_stream: *OutputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    close_fn: ?*const fn (arg_stream: *OutputStream, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    write_async: ?*const fn (arg_stream: *OutputStream, arg_buffer: ?[*]u8, arg_count: u64, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    write_finish: ?*const fn (arg_stream: *OutputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) i64,
    splice_async: ?*const fn (arg_stream: *OutputStream, arg_source: *InputStream, arg_flags: OutputStreamSpliceFlags, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    splice_finish: ?*const fn (arg_stream: *OutputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) i64,
    flush_async: ?*const fn (arg_stream: *OutputStream, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    flush_finish: ?*const fn (arg_stream: *OutputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    close_async: ?*const fn (arg_stream: *OutputStream, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    close_finish: ?*const fn (arg_stream: *OutputStream, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    writev_fn: ?*const fn (arg_stream: *OutputStream, arg_vectors: [*]OutputVector, arg_n_vectors: u64, arg_bytes_written: ?*u64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    writev_async: ?*const fn (arg_stream: *OutputStream, arg_vectors: [*]OutputVector, arg_n_vectors: u64, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    writev_finish: ?*const fn (arg_stream: *OutputStream, arg_result: *AsyncResult, arg_bytes_written: ?*u64, arg_error: *?*GLib.Error) callconv(.c) bool,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
    _g_reserved6: ?*anyopaque,
    _g_reserved7: ?*anyopaque,
    _g_reserved8: ?*anyopaque,
};
pub const OutputStreamPrivate = opaque {};
pub const OutputStreamSpliceFlags = packed struct(u32) {
    close_source: bool = false,
    close_target: bool = false,
    _: u30 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_output_stream_splice_flags_get_type" });
        return cFn();
    }
};
pub const OutputVector = extern struct {
    buffer: ?*anyopaque,
    size: u64,
};
pub const POWER_PROFILE_MONITOR_EXTENSION_POINT_NAME = "gio-power-profile-monitor";
pub const PROXY_EXTENSION_POINT_NAME = "gio-proxy";
pub const PROXY_RESOLVER_EXTENSION_POINT_NAME = "gio-proxy-resolver";
pub const PasswordSave = enum(u32) {
    never = 0,
    for_session = 1,
    permanently = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_password_save_get_type" });
        return cFn();
    }
};
pub const Permission = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = PermissionClass;
    _props: struct {
        allowed: core.Property(bool, "allowed") = .{},
        @"can-acquire": core.Property(bool, "can-acquire") = .{},
        @"can-release": core.Property(bool, "can-release") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*PermissionPrivate,
    pub fn acquire(self: *Permission, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Permission, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_permission_acquire" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn acquireAsync(self: *Permission, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Permission, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_permission_acquire_async" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn acquireFinish(self: *Permission, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Permission, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_permission_acquire_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getAllowed(self: *Permission) bool {
        const cFn = @extern(*const fn (*Permission) callconv(.c) bool, .{ .name = "g_permission_get_allowed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCanAcquire(self: *Permission) bool {
        const cFn = @extern(*const fn (*Permission) callconv(.c) bool, .{ .name = "g_permission_get_can_acquire" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCanRelease(self: *Permission) bool {
        const cFn = @extern(*const fn (*Permission) callconv(.c) bool, .{ .name = "g_permission_get_can_release" });
        const ret = cFn(self);
        return ret;
    }
    pub fn implUpdate(self: *Permission, arg_allowed: bool, arg_can_acquire: bool, arg_can_release: bool) void {
        const cFn = @extern(*const fn (*Permission, bool, bool, bool) callconv(.c) void, .{ .name = "g_permission_impl_update" });
        const ret = cFn(self, arg_allowed, arg_can_acquire, arg_can_release);
        return ret;
    }
    pub fn release(self: *Permission, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Permission, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_permission_release" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn releaseAsync(self: *Permission, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Permission, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_permission_release_async" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn releaseFinish(self: *Permission, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Permission, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_permission_release_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_permission_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const PermissionClass = extern struct {
    parent_class: GObject.ObjectClass,
    acquire: ?*const fn (arg_permission: *Permission, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    acquire_async: ?*const fn (arg_permission: *Permission, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    acquire_finish: ?*const fn (arg_permission: *Permission, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    release: ?*const fn (arg_permission: *Permission, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    release_async: ?*const fn (arg_permission: *Permission, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    release_finish: ?*const fn (arg_permission: *Permission, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    reserved: [16]?*anyopaque,
};
pub const PermissionPrivate = opaque {};
pub const PollableInputStream = struct {
    pub const Prerequistes = [_]type{InputStream};
    pub const Class = PollableInputStreamInterface;
    pub fn canPoll(self: *PollableInputStream) bool {
        const cFn = @extern(*const fn (*PollableInputStream) callconv(.c) bool, .{ .name = "g_pollable_input_stream_can_poll" });
        const ret = cFn(self);
        return ret;
    }
    pub fn createSource(self: *PollableInputStream, arg_cancellable: ?*Cancellable) *GLib.Source {
        const cFn = @extern(*const fn (*PollableInputStream, ?*Cancellable) callconv(.c) *GLib.Source, .{ .name = "g_pollable_input_stream_create_source" });
        const ret = cFn(self, arg_cancellable);
        return ret;
    }
    pub fn isReadable(self: *PollableInputStream) bool {
        const cFn = @extern(*const fn (*PollableInputStream) callconv(.c) bool, .{ .name = "g_pollable_input_stream_is_readable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn readNonblocking(self: *PollableInputStream, argS_buffer: []u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_count: u64 = @intCast((argS_buffer).len);
        const cFn = @extern(*const fn (*PollableInputStream, [*]u8, u64, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_pollable_input_stream_read_nonblocking" });
        const ret = cFn(self, arg_buffer, arg_count, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_pollable_input_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const PollableInputStreamInterface = extern struct {
    g_iface: GObject.TypeInterface,
    can_poll: ?*const fn (arg_stream: *PollableInputStream) callconv(.c) bool,
    is_readable: ?*const fn (arg_stream: *PollableInputStream) callconv(.c) bool,
    create_source: ?*const fn (arg_stream: *PollableInputStream, arg_cancellable: ?*Cancellable) callconv(.c) *GLib.Source,
    read_nonblocking: ?*const fn (arg_stream: *PollableInputStream, arg_buffer: ?[*]u8, arg_count: u64, arg_error: *?*GLib.Error) callconv(.c) i64,
};
pub const PollableOutputStream = struct {
    pub const Prerequistes = [_]type{OutputStream};
    pub const Class = PollableOutputStreamInterface;
    pub fn canPoll(self: *PollableOutputStream) bool {
        const cFn = @extern(*const fn (*PollableOutputStream) callconv(.c) bool, .{ .name = "g_pollable_output_stream_can_poll" });
        const ret = cFn(self);
        return ret;
    }
    pub fn createSource(self: *PollableOutputStream, arg_cancellable: ?*Cancellable) *GLib.Source {
        const cFn = @extern(*const fn (*PollableOutputStream, ?*Cancellable) callconv(.c) *GLib.Source, .{ .name = "g_pollable_output_stream_create_source" });
        const ret = cFn(self, arg_cancellable);
        return ret;
    }
    pub fn isWritable(self: *PollableOutputStream) bool {
        const cFn = @extern(*const fn (*PollableOutputStream) callconv(.c) bool, .{ .name = "g_pollable_output_stream_is_writable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn writeNonblocking(self: *PollableOutputStream, argS_buffer: []u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_count: u64 = @intCast((argS_buffer).len);
        const cFn = @extern(*const fn (*PollableOutputStream, [*]u8, u64, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_pollable_output_stream_write_nonblocking" });
        const ret = cFn(self, arg_buffer, arg_count, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn writevNonblocking(self: *PollableOutputStream, argS_vectors: []OutputVector, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: PollableReturn,
        bytes_written: u64,
    } {
        const arg_vectors: [*]OutputVector = @ptrCast(argS_vectors);
        const arg_n_vectors: u64 = @intCast((argS_vectors).len);
        var argO_bytes_written: u64 = undefined;
        const arg_bytes_written: ?*u64 = &argO_bytes_written;
        const cFn = @extern(*const fn (*PollableOutputStream, [*]OutputVector, u64, ?*u64, ?*Cancellable, *?*GLib.Error) callconv(.c) PollableReturn, .{ .name = "g_pollable_output_stream_writev_nonblocking" });
        const ret = cFn(self, arg_vectors, arg_n_vectors, arg_bytes_written, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .bytes_written = argO_bytes_written };
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_pollable_output_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const PollableOutputStreamInterface = extern struct {
    g_iface: GObject.TypeInterface,
    can_poll: ?*const fn (arg_stream: *PollableOutputStream) callconv(.c) bool,
    is_writable: ?*const fn (arg_stream: *PollableOutputStream) callconv(.c) bool,
    create_source: ?*const fn (arg_stream: *PollableOutputStream, arg_cancellable: ?*Cancellable) callconv(.c) *GLib.Source,
    write_nonblocking: ?*const fn (arg_stream: *PollableOutputStream, arg_buffer: ?[*]u8, arg_count: u64, arg_error: *?*GLib.Error) callconv(.c) i64,
    writev_nonblocking: ?*const fn (arg_stream: *PollableOutputStream, arg_vectors: [*]OutputVector, arg_n_vectors: u64, arg_bytes_written: ?*u64, arg_error: *?*GLib.Error) callconv(.c) PollableReturn,
};
pub const PollableReturn = enum(i32) {
    failed = 0,
    ok = 1,
    would_block = -27,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_pollable_return_get_type" });
        return cFn();
    }
};
pub const PollableSourceFunc = *const fn (arg_pollable_stream: *GObject.Object, arg_data: ?*anyopaque) callconv(.c) bool;
pub const PowerProfileMonitor = struct {
    pub const Prerequistes = [_]type{Initable};
    pub const Class = PowerProfileMonitorInterface;
    _props: struct {
        @"power-saver-enabled": core.Property(bool, "power-saver-enabled") = .{},
    },
    pub fn dupDefault() *PowerProfileMonitor {
        const cFn = @extern(*const fn () callconv(.c) *PowerProfileMonitor, .{ .name = "g_power_profile_monitor_dup_default" });
        const ret = cFn();
        return ret;
    }
    pub fn getPowerSaverEnabled(self: *PowerProfileMonitor) bool {
        const cFn = @extern(*const fn (*PowerProfileMonitor) callconv(.c) bool, .{ .name = "g_power_profile_monitor_get_power_saver_enabled" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_power_profile_monitor_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const PowerProfileMonitorInterface = extern struct {
    g_iface: GObject.TypeInterface,
};
pub const PropertyAction = struct {
    pub const Interfaces = [_]type{Action};
    pub const Parent = GObject.Object;
    _props: struct {
        enabled: core.Property(bool, "enabled") = .{},
        @"invert-boolean": core.Property(bool, "invert-boolean") = .{},
        name: core.Property([*:0]const u8, "name") = .{},
        object: core.Property(GObject.Object, "object") = .{},
        @"parameter-type": core.Property(GLib.VariantType, "parameter-type") = .{},
        @"property-name": core.Property([*:0]const u8, "property-name") = .{},
        state: core.Property(GLib.Variant, "state") = .{},
        @"state-type": core.Property(GLib.VariantType, "state-type") = .{},
    },
    pub fn new(arg_name: [*:0]const u8, arg_object: *GObject.Object, arg_property_name: [*:0]const u8) *PropertyAction {
        const cFn = @extern(*const fn ([*:0]const u8, *GObject.Object, [*:0]const u8) callconv(.c) *PropertyAction, .{ .name = "g_property_action_new" });
        const ret = cFn(arg_name, arg_object, arg_property_name);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_property_action_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const Proxy = struct {
    pub const Class = ProxyInterface;
    pub fn getDefaultForProtocol(arg_protocol: [*:0]const u8) ?*Proxy {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*Proxy, .{ .name = "g_proxy_get_default_for_protocol" });
        const ret = cFn(arg_protocol);
        return ret;
    }
    pub fn connect(self: *Proxy, arg_connection: *IOStream, arg_proxy_address: *ProxyAddress, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*IOStream {
        const cFn = @extern(*const fn (*Proxy, *IOStream, *ProxyAddress, ?*Cancellable, *?*GLib.Error) callconv(.c) *IOStream, .{ .name = "g_proxy_connect" });
        const ret = cFn(self, arg_connection, arg_proxy_address, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn connectAsync(self: *Proxy, arg_connection: *IOStream, arg_proxy_address: *ProxyAddress, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Proxy, *IOStream, *ProxyAddress, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_proxy_connect_async" });
        const ret = cFn(self, arg_connection, arg_proxy_address, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn connectFinish(self: *Proxy, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*IOStream {
        const cFn = @extern(*const fn (*Proxy, *AsyncResult, *?*GLib.Error) callconv(.c) *IOStream, .{ .name = "g_proxy_connect_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn supportsHostname(self: *Proxy) bool {
        const cFn = @extern(*const fn (*Proxy) callconv(.c) bool, .{ .name = "g_proxy_supports_hostname" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_proxy_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ProxyAddress = extern struct {
    pub const Interfaces = [_]type{SocketConnectable};
    pub const Parent = InetSocketAddress;
    pub const Class = ProxyAddressClass;
    _props: struct {
        @"destination-hostname": core.Property([*:0]const u8, "destination-hostname") = .{},
        @"destination-port": core.Property(u32, "destination-port") = .{},
        @"destination-protocol": core.Property([*:0]const u8, "destination-protocol") = .{},
        password: core.Property([*:0]const u8, "password") = .{},
        protocol: core.Property([*:0]const u8, "protocol") = .{},
        uri: core.Property([*:0]const u8, "uri") = .{},
        username: core.Property([*:0]const u8, "username") = .{},
    },
    parent_instance: InetSocketAddress,
    priv: ?*ProxyAddressPrivate,
    pub fn new(arg_inetaddr: *InetAddress, arg_port: u16, arg_protocol: [*:0]const u8, arg_dest_hostname: [*:0]const u8, arg_dest_port: u16, arg_username: ?[*:0]const u8, arg_password: ?[*:0]const u8) *ProxyAddress {
        const cFn = @extern(*const fn (*InetAddress, u16, [*:0]const u8, [*:0]const u8, u16, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) *ProxyAddress, .{ .name = "g_proxy_address_new" });
        const ret = cFn(arg_inetaddr, arg_port, arg_protocol, arg_dest_hostname, arg_dest_port, arg_username, arg_password);
        return ret;
    }
    pub fn getDestinationHostname(self: *ProxyAddress) [*:0]u8 {
        const cFn = @extern(*const fn (*ProxyAddress) callconv(.c) [*:0]u8, .{ .name = "g_proxy_address_get_destination_hostname" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDestinationPort(self: *ProxyAddress) u16 {
        const cFn = @extern(*const fn (*ProxyAddress) callconv(.c) u16, .{ .name = "g_proxy_address_get_destination_port" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDestinationProtocol(self: *ProxyAddress) [*:0]u8 {
        const cFn = @extern(*const fn (*ProxyAddress) callconv(.c) [*:0]u8, .{ .name = "g_proxy_address_get_destination_protocol" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPassword(self: *ProxyAddress) ?[*:0]u8 {
        const cFn = @extern(*const fn (*ProxyAddress) callconv(.c) ?[*:0]u8, .{ .name = "g_proxy_address_get_password" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getProtocol(self: *ProxyAddress) [*:0]u8 {
        const cFn = @extern(*const fn (*ProxyAddress) callconv(.c) [*:0]u8, .{ .name = "g_proxy_address_get_protocol" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUri(self: *ProxyAddress) ?[*:0]u8 {
        const cFn = @extern(*const fn (*ProxyAddress) callconv(.c) ?[*:0]u8, .{ .name = "g_proxy_address_get_uri" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUsername(self: *ProxyAddress) ?[*:0]u8 {
        const cFn = @extern(*const fn (*ProxyAddress) callconv(.c) ?[*:0]u8, .{ .name = "g_proxy_address_get_username" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_proxy_address_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ProxyAddressClass = extern struct {
    parent_class: InetSocketAddressClass,
};
pub const ProxyAddressEnumerator = extern struct {
    pub const Parent = SocketAddressEnumerator;
    pub const Class = ProxyAddressEnumeratorClass;
    _props: struct {
        connectable: core.Property(SocketConnectable, "connectable") = .{},
        @"default-port": core.Property(u32, "default-port") = .{},
        @"proxy-resolver": core.Property(ProxyResolver, "proxy-resolver") = .{},
        uri: core.Property([*:0]const u8, "uri") = .{},
    },
    parent_instance: SocketAddressEnumerator,
    priv: ?*ProxyAddressEnumeratorPrivate,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_proxy_address_enumerator_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ProxyAddressEnumeratorClass = extern struct {
    parent_class: SocketAddressEnumeratorClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
    _g_reserved6: ?*anyopaque,
    _g_reserved7: ?*anyopaque,
};
pub const ProxyAddressEnumeratorPrivate = opaque {};
pub const ProxyAddressPrivate = opaque {};
pub const ProxyInterface = extern struct {
    g_iface: GObject.TypeInterface,
    connect: ?*const fn (arg_proxy: *Proxy, arg_connection: *IOStream, arg_proxy_address: *ProxyAddress, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *IOStream,
    connect_async: ?*const fn (arg_proxy: *Proxy, arg_connection: *IOStream, arg_proxy_address: *ProxyAddress, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    connect_finish: ?*const fn (arg_proxy: *Proxy, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *IOStream,
    supports_hostname: ?*const fn (arg_proxy: *Proxy) callconv(.c) bool,
};
pub const ProxyResolver = struct {
    pub const Class = ProxyResolverInterface;
    pub fn getDefault() *ProxyResolver {
        const cFn = @extern(*const fn () callconv(.c) *ProxyResolver, .{ .name = "g_proxy_resolver_get_default" });
        const ret = cFn();
        return ret;
    }
    pub fn isSupported(self: *ProxyResolver) bool {
        const cFn = @extern(*const fn (*ProxyResolver) callconv(.c) bool, .{ .name = "g_proxy_resolver_is_supported" });
        const ret = cFn(self);
        return ret;
    }
    pub fn lookup(self: *ProxyResolver, arg_uri: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}![*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*ProxyResolver, [*:0]const u8, ?*Cancellable, *?*GLib.Error) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_proxy_resolver_lookup" });
        const ret = cFn(self, arg_uri, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn lookupAsync(self: *ProxyResolver, arg_uri: [*:0]const u8, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*ProxyResolver, [*:0]const u8, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_proxy_resolver_lookup_async" });
        const ret = cFn(self, arg_uri, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn lookupFinish(self: *ProxyResolver, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}![*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*ProxyResolver, *AsyncResult, *?*GLib.Error) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_proxy_resolver_lookup_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_proxy_resolver_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ProxyResolverInterface = extern struct {
    g_iface: GObject.TypeInterface,
    is_supported: ?*const fn (arg_resolver: *ProxyResolver) callconv(.c) bool,
    lookup: ?*const fn (arg_resolver: *ProxyResolver, arg_uri: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) [*]?[*:0]const u8,
    lookup_async: ?*const fn (arg_resolver: *ProxyResolver, arg_uri: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    lookup_finish: ?*const fn (arg_resolver: *ProxyResolver, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) [*]?[*:0]const u8,
};
pub const ReallocFunc = *const fn (arg_data: ?*anyopaque, arg_size: u64) callconv(.c) ?*anyopaque;
pub const RemoteActionGroup = struct {
    pub const Prerequistes = [_]type{ActionGroup};
    pub const Class = RemoteActionGroupInterface;
    pub fn activateActionFull(self: *RemoteActionGroup, arg_action_name: [*:0]const u8, arg_parameter: ?*GLib.Variant, arg_platform_data: *GLib.Variant) void {
        const cFn = @extern(*const fn (*RemoteActionGroup, [*:0]const u8, ?*GLib.Variant, *GLib.Variant) callconv(.c) void, .{ .name = "g_remote_action_group_activate_action_full" });
        const ret = cFn(self, arg_action_name, arg_parameter, arg_platform_data);
        return ret;
    }
    pub fn changeActionStateFull(self: *RemoteActionGroup, arg_action_name: [*:0]const u8, arg_value: *GLib.Variant, arg_platform_data: *GLib.Variant) void {
        const cFn = @extern(*const fn (*RemoteActionGroup, [*:0]const u8, *GLib.Variant, *GLib.Variant) callconv(.c) void, .{ .name = "g_remote_action_group_change_action_state_full" });
        const ret = cFn(self, arg_action_name, arg_value, arg_platform_data);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_remote_action_group_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const RemoteActionGroupInterface = extern struct {
    g_iface: GObject.TypeInterface,
    activate_action_full: ?*const fn (arg_remote: *RemoteActionGroup, arg_action_name: [*:0]const u8, arg_parameter: ?*GLib.Variant, arg_platform_data: *GLib.Variant) callconv(.c) void,
    change_action_state_full: ?*const fn (arg_remote: *RemoteActionGroup, arg_action_name: [*:0]const u8, arg_value: *GLib.Variant, arg_platform_data: *GLib.Variant) callconv(.c) void,
};
pub const Resolver = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = ResolverClass;
    _props: struct {
        timeout: core.Property(u32, "timeout") = .{},
    },
    _signals: struct {
        reload: core.Signal(fn (*Resolver) void, "reload") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*ResolverPrivate,
    pub fn getDefault() *Resolver {
        const cFn = @extern(*const fn () callconv(.c) *Resolver, .{ .name = "g_resolver_get_default" });
        const ret = cFn();
        return ret;
    }
    pub fn getTimeout(self: *Resolver) u32 {
        const cFn = @extern(*const fn (*Resolver) callconv(.c) u32, .{ .name = "g_resolver_get_timeout" });
        const ret = cFn(self);
        return ret;
    }
    pub fn lookupByAddress(self: *Resolver, arg_address: *InetAddress, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
        const cFn = @extern(*const fn (*Resolver, *InetAddress, ?*Cancellable, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_resolver_lookup_by_address" });
        const ret = cFn(self, arg_address, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn lookupByAddressAsync(self: *Resolver, arg_address: *InetAddress, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Resolver, *InetAddress, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_resolver_lookup_by_address_async" });
        const ret = cFn(self, arg_address, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn lookupByAddressFinish(self: *Resolver, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
        const cFn = @extern(*const fn (*Resolver, *AsyncResult, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_resolver_lookup_by_address_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn lookupByName(self: *Resolver, arg_hostname: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!?*GLib.List {
        const cFn = @extern(*const fn (*Resolver, [*:0]const u8, ?*Cancellable, *?*GLib.Error) callconv(.c) ?*GLib.List, .{ .name = "g_resolver_lookup_by_name" });
        const ret = cFn(self, arg_hostname, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn lookupByNameAsync(self: *Resolver, arg_hostname: [*:0]const u8, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Resolver, [*:0]const u8, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_resolver_lookup_by_name_async" });
        const ret = cFn(self, arg_hostname, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn lookupByNameFinish(self: *Resolver, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!?*GLib.List {
        const cFn = @extern(*const fn (*Resolver, *AsyncResult, *?*GLib.Error) callconv(.c) ?*GLib.List, .{ .name = "g_resolver_lookup_by_name_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn lookupByNameWithFlags(self: *Resolver, arg_hostname: [*:0]const u8, arg_flags: ResolverNameLookupFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!?*GLib.List {
        const cFn = @extern(*const fn (*Resolver, [*:0]const u8, ResolverNameLookupFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) ?*GLib.List, .{ .name = "g_resolver_lookup_by_name_with_flags" });
        const ret = cFn(self, arg_hostname, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn lookupByNameWithFlagsAsync(self: *Resolver, arg_hostname: [*:0]const u8, arg_flags: ResolverNameLookupFlags, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Resolver, [*:0]const u8, ResolverNameLookupFlags, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_resolver_lookup_by_name_with_flags_async" });
        const ret = cFn(self, arg_hostname, arg_flags, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn lookupByNameWithFlagsFinish(self: *Resolver, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!?*GLib.List {
        const cFn = @extern(*const fn (*Resolver, *AsyncResult, *?*GLib.Error) callconv(.c) ?*GLib.List, .{ .name = "g_resolver_lookup_by_name_with_flags_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn lookupRecords(self: *Resolver, arg_rrname: [*:0]const u8, arg_record_type: ResolverRecordType, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!?*GLib.List {
        const cFn = @extern(*const fn (*Resolver, [*:0]const u8, ResolverRecordType, ?*Cancellable, *?*GLib.Error) callconv(.c) ?*GLib.List, .{ .name = "g_resolver_lookup_records" });
        const ret = cFn(self, arg_rrname, arg_record_type, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn lookupRecordsAsync(self: *Resolver, arg_rrname: [*:0]const u8, arg_record_type: ResolverRecordType, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Resolver, [*:0]const u8, ResolverRecordType, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_resolver_lookup_records_async" });
        const ret = cFn(self, arg_rrname, arg_record_type, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn lookupRecordsFinish(self: *Resolver, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!?*GLib.List {
        const cFn = @extern(*const fn (*Resolver, *AsyncResult, *?*GLib.Error) callconv(.c) ?*GLib.List, .{ .name = "g_resolver_lookup_records_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn lookupService(self: *Resolver, arg_service: [*:0]const u8, arg_protocol: [*:0]const u8, arg_domain: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!?*GLib.List {
        const cFn = @extern(*const fn (*Resolver, [*:0]const u8, [*:0]const u8, [*:0]const u8, ?*Cancellable, *?*GLib.Error) callconv(.c) ?*GLib.List, .{ .name = "g_resolver_lookup_service" });
        const ret = cFn(self, arg_service, arg_protocol, arg_domain, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn lookupServiceAsync(self: *Resolver, arg_service: [*:0]const u8, arg_protocol: [*:0]const u8, arg_domain: [*:0]const u8, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Resolver, [*:0]const u8, [*:0]const u8, [*:0]const u8, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_resolver_lookup_service_async" });
        const ret = cFn(self, arg_service, arg_protocol, arg_domain, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn lookupServiceFinish(self: *Resolver, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!?*GLib.List {
        const cFn = @extern(*const fn (*Resolver, *AsyncResult, *?*GLib.Error) callconv(.c) ?*GLib.List, .{ .name = "g_resolver_lookup_service_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setDefault(self: *Resolver) void {
        const cFn = @extern(*const fn (*Resolver) callconv(.c) void, .{ .name = "g_resolver_set_default" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setTimeout(self: *Resolver, arg_timeout_ms: u32) void {
        const cFn = @extern(*const fn (*Resolver, u32) callconv(.c) void, .{ .name = "g_resolver_set_timeout" });
        const ret = cFn(self, arg_timeout_ms);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_resolver_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ResolverClass = extern struct {
    parent_class: GObject.ObjectClass,
    reload: ?*const fn (arg_resolver: *Resolver) callconv(.c) void,
    lookup_by_name: ?*const fn (arg_resolver: *Resolver, arg_hostname: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) ?*GLib.List,
    lookup_by_name_async: ?*const fn (arg_resolver: *Resolver, arg_hostname: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    lookup_by_name_finish: ?*const fn (arg_resolver: *Resolver, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) ?*GLib.List,
    lookup_by_address: ?*const fn (arg_resolver: *Resolver, arg_address: *InetAddress, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) [*:0]u8,
    lookup_by_address_async: ?*const fn (arg_resolver: *Resolver, arg_address: *InetAddress, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    lookup_by_address_finish: ?*const fn (arg_resolver: *Resolver, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) [*:0]u8,
    lookup_service: ?*anyopaque,
    lookup_service_async: ?*const fn (arg_resolver: *Resolver, arg_rrname: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    lookup_service_finish: ?*const fn (arg_resolver: *Resolver, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) ?*GLib.List,
    lookup_records: ?*const fn (arg_resolver: *Resolver, arg_rrname: [*:0]const u8, arg_record_type: ResolverRecordType, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) ?*GLib.List,
    lookup_records_async: ?*const fn (arg_resolver: *Resolver, arg_rrname: [*:0]const u8, arg_record_type: ResolverRecordType, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    lookup_records_finish: ?*const fn (arg_resolver: *Resolver, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) ?*GLib.List,
    lookup_by_name_with_flags_async: ?*const fn (arg_resolver: *Resolver, arg_hostname: [*:0]const u8, arg_flags: ResolverNameLookupFlags, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    lookup_by_name_with_flags_finish: ?*const fn (arg_resolver: *Resolver, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) ?*GLib.List,
    lookup_by_name_with_flags: ?*const fn (arg_resolver: *Resolver, arg_hostname: [*:0]const u8, arg_flags: ResolverNameLookupFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) ?*GLib.List,
};
pub const ResolverError = enum(u32) {
    not_found = 0,
    temporary_failure = 1,
    internal = 2,
    pub fn quark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_resolver_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_resolver_error_get_type" });
        return cFn();
    }
};
pub const ResolverNameLookupFlags = packed struct(u32) {
    ipv4_only: bool = false,
    ipv6_only: bool = false,
    _: u30 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_resolver_name_lookup_flags_get_type" });
        return cFn();
    }
};
pub const ResolverPrivate = opaque {};
pub const ResolverRecordType = enum(u32) {
    srv = 1,
    mx = 2,
    txt = 3,
    soa = 4,
    ns = 5,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_resolver_record_type_get_type" });
        return cFn();
    }
};
pub const Resource = opaque {
    pub fn newFromData(arg_data: *GLib.Bytes, arg_error: *?*GLib.Error) error{GError}!*Resource {
        const cFn = @extern(*const fn (*GLib.Bytes, *?*GLib.Error) callconv(.c) *Resource, .{ .name = "g_resource_new_from_data" });
        const ret = cFn(arg_data, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn _register(self: *Resource) void {
        const cFn = @extern(*const fn (*Resource) callconv(.c) void, .{ .name = "g_resources_register" });
        const ret = cFn(self);
        return ret;
    }
    pub fn _unregister(self: *Resource) void {
        const cFn = @extern(*const fn (*Resource) callconv(.c) void, .{ .name = "g_resources_unregister" });
        const ret = cFn(self);
        return ret;
    }
    pub fn enumerateChildren(self: *Resource, arg_path: [*:0]const u8, arg_lookup_flags: ResourceLookupFlags, arg_error: *?*GLib.Error) error{GError}![*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*Resource, [*:0]const u8, ResourceLookupFlags, *?*GLib.Error) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_resource_enumerate_children" });
        const ret = cFn(self, arg_path, arg_lookup_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getInfo(self: *Resource, arg_path: [*:0]const u8, arg_lookup_flags: ResourceLookupFlags, arg_error: *?*GLib.Error) error{GError}!?struct {
        size: u64,
        flags: u32,
    } {
        var argO_size: u64 = undefined;
        const arg_size: ?*u64 = &argO_size;
        var argO_flags: u32 = undefined;
        const arg_flags: ?*u32 = &argO_flags;
        const cFn = @extern(*const fn (*Resource, [*:0]const u8, ResourceLookupFlags, ?*u64, ?*u32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_resource_get_info" });
        const ret = cFn(self, arg_path, arg_lookup_flags, arg_size, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        if (!ret) return null;
        return .{ .size = argO_size, .flags = argO_flags };
    }
    pub fn hasChildren(self: *Resource, arg_path: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*Resource, [*:0]const u8) callconv(.c) bool, .{ .name = "g_resource_has_children" });
        const ret = cFn(self, arg_path);
        return ret;
    }
    pub fn lookupData(self: *Resource, arg_path: [*:0]const u8, arg_lookup_flags: ResourceLookupFlags, arg_error: *?*GLib.Error) error{GError}!*GLib.Bytes {
        const cFn = @extern(*const fn (*Resource, [*:0]const u8, ResourceLookupFlags, *?*GLib.Error) callconv(.c) *GLib.Bytes, .{ .name = "g_resource_lookup_data" });
        const ret = cFn(self, arg_path, arg_lookup_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn openStream(self: *Resource, arg_path: [*:0]const u8, arg_lookup_flags: ResourceLookupFlags, arg_error: *?*GLib.Error) error{GError}!*InputStream {
        const cFn = @extern(*const fn (*Resource, [*:0]const u8, ResourceLookupFlags, *?*GLib.Error) callconv(.c) *InputStream, .{ .name = "g_resource_open_stream" });
        const ret = cFn(self, arg_path, arg_lookup_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn ref(self: *Resource) *Resource {
        const cFn = @extern(*const fn (*Resource) callconv(.c) *Resource, .{ .name = "g_resource_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *Resource) void {
        const cFn = @extern(*const fn (*Resource) callconv(.c) void, .{ .name = "g_resource_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn load(arg_filename: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*Resource {
        const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) *Resource, .{ .name = "g_resource_load" });
        const ret = cFn(arg_filename, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_resource_get_type" });
        return cFn();
    }
};
pub const ResourceError = enum(u32) {
    not_found = 0,
    internal = 1,
    pub fn quark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_resource_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_resource_error_get_type" });
        return cFn();
    }
};
pub const ResourceFlags = packed struct(u32) {
    compressed: bool = false,
    _: u31 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_resource_flags_get_type" });
        return cFn();
    }
};
pub const ResourceLookupFlags = packed struct(u32) {
    _: u32 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_resource_lookup_flags_get_type" });
        return cFn();
    }
};
pub const SETTINGS_BACKEND_EXTENSION_POINT_NAME = "gsettings-backend";
pub const Seekable = struct {
    pub const Class = SeekableIface;
    pub fn canSeek(self: *Seekable) bool {
        const cFn = @extern(*const fn (*Seekable) callconv(.c) bool, .{ .name = "g_seekable_can_seek" });
        const ret = cFn(self);
        return ret;
    }
    pub fn canTruncate(self: *Seekable) bool {
        const cFn = @extern(*const fn (*Seekable) callconv(.c) bool, .{ .name = "g_seekable_can_truncate" });
        const ret = cFn(self);
        return ret;
    }
    pub fn seek(self: *Seekable, arg_offset: i64, arg_type: GLib.SeekType, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Seekable, i64, GLib.SeekType, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_seekable_seek" });
        const ret = cFn(self, arg_offset, arg_type, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn tell(self: *Seekable) i64 {
        const cFn = @extern(*const fn (*Seekable) callconv(.c) i64, .{ .name = "g_seekable_tell" });
        const ret = cFn(self);
        return ret;
    }
    pub fn truncate(self: *Seekable, arg_offset: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Seekable, i64, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_seekable_truncate" });
        const ret = cFn(self, arg_offset, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_seekable_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SeekableIface = extern struct {
    g_iface: GObject.TypeInterface,
    tell: ?*const fn (arg_seekable: *Seekable) callconv(.c) i64,
    can_seek: ?*const fn (arg_seekable: *Seekable) callconv(.c) bool,
    seek: ?*const fn (arg_seekable: *Seekable, arg_offset: i64, arg_type: GLib.SeekType, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    can_truncate: ?*const fn (arg_seekable: *Seekable) callconv(.c) bool,
    truncate_fn: ?*const fn (arg_seekable: *Seekable, arg_offset: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
};
pub const Settings = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = SettingsClass;
    _props: struct {
        backend: core.Property(SettingsBackend, "backend") = .{},
        @"delay-apply": core.Property(bool, "delay-apply") = .{},
        @"has-unapplied": core.Property(bool, "has-unapplied") = .{},
        path: core.Property([*:0]const u8, "path") = .{},
        schema: core.Property([*:0]const u8, "schema") = .{},
        @"schema-id": core.Property([*:0]const u8, "schema-id") = .{},
        @"settings-schema": core.Property(SettingsSchema, "settings-schema") = .{},
    },
    _signals: struct {
        @"change-event": core.Signal(fn (*Settings, ?[*]u32, i32) bool, "change-event") = .{},
        changed: core.Signal(fn (*Settings, [*:0]const u8) void, "changed") = .{},
        @"writable-change-event": core.Signal(fn (*Settings, u32) bool, "writable-change-event") = .{},
        @"writable-changed": core.Signal(fn (*Settings, [*:0]const u8) void, "writable-changed") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*SettingsPrivate,
    pub fn new(arg_schema_id: [*:0]const u8) *Settings {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *Settings, .{ .name = "g_settings_new" });
        const ret = cFn(arg_schema_id);
        return ret;
    }
    pub fn newFull(arg_schema: *SettingsSchema, arg_backend: ?*SettingsBackend, arg_path: ?[*:0]const u8) *Settings {
        const cFn = @extern(*const fn (*SettingsSchema, ?*SettingsBackend, ?[*:0]const u8) callconv(.c) *Settings, .{ .name = "g_settings_new_full" });
        const ret = cFn(arg_schema, arg_backend, arg_path);
        return ret;
    }
    pub fn newWithBackend(arg_schema_id: [*:0]const u8, arg_backend: *SettingsBackend) *Settings {
        const cFn = @extern(*const fn ([*:0]const u8, *SettingsBackend) callconv(.c) *Settings, .{ .name = "g_settings_new_with_backend" });
        const ret = cFn(arg_schema_id, arg_backend);
        return ret;
    }
    pub fn newWithBackendAndPath(arg_schema_id: [*:0]const u8, arg_backend: *SettingsBackend, arg_path: [*:0]const u8) *Settings {
        const cFn = @extern(*const fn ([*:0]const u8, *SettingsBackend, [*:0]const u8) callconv(.c) *Settings, .{ .name = "g_settings_new_with_backend_and_path" });
        const ret = cFn(arg_schema_id, arg_backend, arg_path);
        return ret;
    }
    pub fn newWithPath(arg_schema_id: [*:0]const u8, arg_path: [*:0]const u8) *Settings {
        const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) *Settings, .{ .name = "g_settings_new_with_path" });
        const ret = cFn(arg_schema_id, arg_path);
        return ret;
    }
    pub fn listRelocatableSchemas() [*]?[*:0]const u8 {
        const cFn = @extern(*const fn () callconv(.c) [*]?[*:0]const u8, .{ .name = "g_settings_list_relocatable_schemas" });
        const ret = cFn();
        return ret;
    }
    pub fn listSchemas() [*]?[*:0]const u8 {
        const cFn = @extern(*const fn () callconv(.c) [*]?[*:0]const u8, .{ .name = "g_settings_list_schemas" });
        const ret = cFn();
        return ret;
    }
    pub fn sync() void {
        const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_settings_sync" });
        const ret = cFn();
        return ret;
    }
    pub fn unbind(arg_object: *GObject.Object, arg_property: [*:0]const u8) void {
        const cFn = @extern(*const fn (*GObject.Object, [*:0]const u8) callconv(.c) void, .{ .name = "g_settings_unbind" });
        const ret = cFn(arg_object, arg_property);
        return ret;
    }
    pub fn apply(self: *Settings) void {
        const cFn = @extern(*const fn (*Settings) callconv(.c) void, .{ .name = "g_settings_apply" });
        const ret = cFn(self);
        return ret;
    }
    pub fn bind(self: *Settings, arg_key: [*:0]const u8, arg_object: *GObject.Object, arg_property: [*:0]const u8, arg_flags: SettingsBindFlags) void {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, *GObject.Object, [*:0]const u8, SettingsBindFlags) callconv(.c) void, .{ .name = "g_settings_bind" });
        const ret = cFn(self, arg_key, arg_object, arg_property, arg_flags);
        return ret;
    }
    pub fn bindWithMapping(self: *Settings, arg_key: [*:0]const u8, arg_object: *GObject.Object, arg_property: [*:0]const u8, arg_flags: SettingsBindFlags, arg_get_mapping: ?*GObject.Closure, arg_set_mapping: ?*GObject.Closure) void {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, *GObject.Object, [*:0]const u8, SettingsBindFlags, ?*GObject.Closure, ?*GObject.Closure) callconv(.c) void, .{ .name = "g_settings_bind_with_mapping_closures" });
        const ret = cFn(self, arg_key, arg_object, arg_property, arg_flags, arg_get_mapping, arg_set_mapping);
        return ret;
    }
    pub fn bindWritable(self: *Settings, arg_key: [*:0]const u8, arg_object: *GObject.Object, arg_property: [*:0]const u8, arg_inverted: bool) void {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, *GObject.Object, [*:0]const u8, bool) callconv(.c) void, .{ .name = "g_settings_bind_writable" });
        const ret = cFn(self, arg_key, arg_object, arg_property, arg_inverted);
        return ret;
    }
    pub fn createAction(self: *Settings, arg_key: [*:0]const u8) *Action {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) *Action, .{ .name = "g_settings_create_action" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn delay(self: *Settings) void {
        const cFn = @extern(*const fn (*Settings) callconv(.c) void, .{ .name = "g_settings_delay" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBoolean(self: *Settings, arg_key: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) bool, .{ .name = "g_settings_get_boolean" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getChild(self: *Settings, arg_name: [*:0]const u8) *Settings {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) *Settings, .{ .name = "g_settings_get_child" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn getDefaultValue(self: *Settings, arg_key: [*:0]const u8) ?*GLib.Variant {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) ?*GLib.Variant, .{ .name = "g_settings_get_default_value" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getDouble(self: *Settings, arg_key: [*:0]const u8) f64 {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) f64, .{ .name = "g_settings_get_double" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getEnum(self: *Settings, arg_key: [*:0]const u8) i32 {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) i32, .{ .name = "g_settings_get_enum" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getFlags(self: *Settings, arg_key: [*:0]const u8) u32 {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) u32, .{ .name = "g_settings_get_flags" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getHasUnapplied(self: *Settings) bool {
        const cFn = @extern(*const fn (*Settings) callconv(.c) bool, .{ .name = "g_settings_get_has_unapplied" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInt(self: *Settings, arg_key: [*:0]const u8) i32 {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) i32, .{ .name = "g_settings_get_int" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getInt64(self: *Settings, arg_key: [*:0]const u8) i64 {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) i64, .{ .name = "g_settings_get_int64" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getMapped(self: *Settings, arg_key: [*:0]const u8, argC_mapping: core.Closure(SettingsGetMapping)) ?*anyopaque {
        const arg_mapping: SettingsGetMapping = @ptrCast(argC_mapping.callback());
        defer argC_mapping.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_mapping.data());
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, SettingsGetMapping, ?*anyopaque) callconv(.c) ?*anyopaque, .{ .name = "g_settings_get_mapped" });
        const ret = cFn(self, arg_key, arg_mapping, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn getRange(self: *Settings, arg_key: [*:0]const u8) *GLib.Variant {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) *GLib.Variant, .{ .name = "g_settings_get_range" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getString(self: *Settings, arg_key: [*:0]const u8) [*:0]u8 {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_settings_get_string" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getStrv(self: *Settings, arg_key: [*:0]const u8) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_settings_get_strv" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getUint(self: *Settings, arg_key: [*:0]const u8) u32 {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) u32, .{ .name = "g_settings_get_uint" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getUint64(self: *Settings, arg_key: [*:0]const u8) u64 {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) u64, .{ .name = "g_settings_get_uint64" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getUserValue(self: *Settings, arg_key: [*:0]const u8) ?*GLib.Variant {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) ?*GLib.Variant, .{ .name = "g_settings_get_user_value" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn getValue(self: *Settings, arg_key: [*:0]const u8) *GLib.Variant {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) *GLib.Variant, .{ .name = "g_settings_get_value" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn isWritable(self: *Settings, arg_name: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) bool, .{ .name = "g_settings_is_writable" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn listChildren(self: *Settings) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*Settings) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_settings_list_children" });
        const ret = cFn(self);
        return ret;
    }
    pub fn listKeys(self: *Settings) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*Settings) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_settings_list_keys" });
        const ret = cFn(self);
        return ret;
    }
    pub fn rangeCheck(self: *Settings, arg_key: [*:0]const u8, arg_value: *GLib.Variant) bool {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, *GLib.Variant) callconv(.c) bool, .{ .name = "g_settings_range_check" });
        const ret = cFn(self, arg_key, arg_value);
        return ret;
    }
    pub fn reset(self: *Settings, arg_key: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8) callconv(.c) void, .{ .name = "g_settings_reset" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn revert(self: *Settings) void {
        const cFn = @extern(*const fn (*Settings) callconv(.c) void, .{ .name = "g_settings_revert" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setBoolean(self: *Settings, arg_key: [*:0]const u8, arg_value: bool) bool {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, bool) callconv(.c) bool, .{ .name = "g_settings_set_boolean" });
        const ret = cFn(self, arg_key, arg_value);
        return ret;
    }
    pub fn setDouble(self: *Settings, arg_key: [*:0]const u8, arg_value: f64) bool {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, f64) callconv(.c) bool, .{ .name = "g_settings_set_double" });
        const ret = cFn(self, arg_key, arg_value);
        return ret;
    }
    pub fn setEnum(self: *Settings, arg_key: [*:0]const u8, arg_value: i32) bool {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, i32) callconv(.c) bool, .{ .name = "g_settings_set_enum" });
        const ret = cFn(self, arg_key, arg_value);
        return ret;
    }
    pub fn setFlags(self: *Settings, arg_key: [*:0]const u8, arg_value: u32) bool {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, u32) callconv(.c) bool, .{ .name = "g_settings_set_flags" });
        const ret = cFn(self, arg_key, arg_value);
        return ret;
    }
    pub fn setInt(self: *Settings, arg_key: [*:0]const u8, arg_value: i32) bool {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, i32) callconv(.c) bool, .{ .name = "g_settings_set_int" });
        const ret = cFn(self, arg_key, arg_value);
        return ret;
    }
    pub fn setInt64(self: *Settings, arg_key: [*:0]const u8, arg_value: i64) bool {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, i64) callconv(.c) bool, .{ .name = "g_settings_set_int64" });
        const ret = cFn(self, arg_key, arg_value);
        return ret;
    }
    pub fn setString(self: *Settings, arg_key: [*:0]const u8, arg_value: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, [*:0]const u8) callconv(.c) bool, .{ .name = "g_settings_set_string" });
        const ret = cFn(self, arg_key, arg_value);
        return ret;
    }
    pub fn setStrv(self: *Settings, arg_key: [*:0]const u8, arg_value: ?[*]?[*:0]const u8) bool {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, ?[*]?[*:0]const u8) callconv(.c) bool, .{ .name = "g_settings_set_strv" });
        const ret = cFn(self, arg_key, arg_value);
        return ret;
    }
    pub fn setUint(self: *Settings, arg_key: [*:0]const u8, arg_value: u32) bool {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, u32) callconv(.c) bool, .{ .name = "g_settings_set_uint" });
        const ret = cFn(self, arg_key, arg_value);
        return ret;
    }
    pub fn setUint64(self: *Settings, arg_key: [*:0]const u8, arg_value: u64) bool {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, u64) callconv(.c) bool, .{ .name = "g_settings_set_uint64" });
        const ret = cFn(self, arg_key, arg_value);
        return ret;
    }
    pub fn setValue(self: *Settings, arg_key: [*:0]const u8, arg_value: *GLib.Variant) bool {
        const cFn = @extern(*const fn (*Settings, [*:0]const u8, *GLib.Variant) callconv(.c) bool, .{ .name = "g_settings_set_value" });
        const ret = cFn(self, arg_key, arg_value);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_settings_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SettingsBackend = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = SettingsBackendClass;
    parent_instance: GObject.Object,
    priv: ?*SettingsBackendPrivate,
    pub fn flattenTree(arg_tree: *GLib.Tree) struct {
        path: [*:0]u8,
        keys: [*]?[*:0]const u8,
        values: [*:null]?*GLib.Variant,
    } {
        var argO_path: [*:0]u8 = undefined;
        const arg_path: *[*:0]u8 = &argO_path;
        var argO_keys: [*]?[*:0]const u8 = undefined;
        const arg_keys: *[*]?[*:0]const u8 = &argO_keys;
        var argO_values: ?[*:null]?*GLib.Variant = undefined;
        const arg_values: ?*[*:null]?*GLib.Variant = &argO_values;
        const cFn = @extern(*const fn (*GLib.Tree, *[*:0]u8, *[*]?[*:0]const u8, ?*[*:null]?*GLib.Variant) callconv(.c) void, .{ .name = "g_settings_backend_flatten_tree" });
        const ret = cFn(arg_tree, arg_path, arg_keys, arg_values);
        _ = ret;
        return .{ .path = argO_path, .keys = argO_keys, .values = argO_values };
    }
    pub fn getDefault() *SettingsBackend {
        const cFn = @extern(*const fn () callconv(.c) *SettingsBackend, .{ .name = "g_settings_backend_get_default" });
        const ret = cFn();
        return ret;
    }
    pub fn changed(self: *SettingsBackend, arg_key: [*:0]const u8, arg_origin_tag: ?*anyopaque) void {
        const cFn = @extern(*const fn (*SettingsBackend, [*:0]const u8, ?*anyopaque) callconv(.c) void, .{ .name = "g_settings_backend_changed" });
        const ret = cFn(self, arg_key, @ptrCast(arg_origin_tag));
        return ret;
    }
    pub fn changedTree(self: *SettingsBackend, arg_tree: *GLib.Tree, arg_origin_tag: ?*anyopaque) void {
        const cFn = @extern(*const fn (*SettingsBackend, *GLib.Tree, ?*anyopaque) callconv(.c) void, .{ .name = "g_settings_backend_changed_tree" });
        const ret = cFn(self, arg_tree, @ptrCast(arg_origin_tag));
        return ret;
    }
    pub fn keysChanged(self: *SettingsBackend, arg_path: [*:0]const u8, arg_items: [*]?[*:0]const u8, arg_origin_tag: ?*anyopaque) void {
        const cFn = @extern(*const fn (*SettingsBackend, [*:0]const u8, [*]?[*:0]const u8, ?*anyopaque) callconv(.c) void, .{ .name = "g_settings_backend_keys_changed" });
        const ret = cFn(self, arg_path, arg_items, @ptrCast(arg_origin_tag));
        return ret;
    }
    pub fn pathChanged(self: *SettingsBackend, arg_path: [*:0]const u8, arg_origin_tag: ?*anyopaque) void {
        const cFn = @extern(*const fn (*SettingsBackend, [*:0]const u8, ?*anyopaque) callconv(.c) void, .{ .name = "g_settings_backend_path_changed" });
        const ret = cFn(self, arg_path, @ptrCast(arg_origin_tag));
        return ret;
    }
    pub fn pathWritableChanged(self: *SettingsBackend, arg_path: [*:0]const u8) void {
        const cFn = @extern(*const fn (*SettingsBackend, [*:0]const u8) callconv(.c) void, .{ .name = "g_settings_backend_path_writable_changed" });
        const ret = cFn(self, arg_path);
        return ret;
    }
    pub fn writableChanged(self: *SettingsBackend, arg_key: [*:0]const u8) void {
        const cFn = @extern(*const fn (*SettingsBackend, [*:0]const u8) callconv(.c) void, .{ .name = "g_settings_backend_writable_changed" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_settings_backend_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SettingsBackendClass = extern struct {
    parent_class: GObject.ObjectClass,
    read: ?*const fn (arg_backend: *SettingsBackend, arg_key: [*:0]const u8, arg_expected_type: *GLib.VariantType, arg_default_value: bool) callconv(.c) *GLib.Variant,
    get_writable: ?*const fn (arg_backend: *SettingsBackend, arg_key: [*:0]const u8) callconv(.c) bool,
    write: ?*const fn (arg_backend: *SettingsBackend, arg_key: [*:0]const u8, arg_value: *GLib.Variant, arg_origin_tag: ?*anyopaque) callconv(.c) bool,
    write_tree: ?*const fn (arg_backend: *SettingsBackend, arg_tree: *GLib.Tree, arg_origin_tag: ?*anyopaque) callconv(.c) bool,
    reset: ?*const fn (arg_backend: *SettingsBackend, arg_key: [*:0]const u8, arg_origin_tag: ?*anyopaque) callconv(.c) void,
    subscribe: ?*const fn (arg_backend: *SettingsBackend, arg_name: [*:0]const u8) callconv(.c) void,
    unsubscribe: ?*const fn (arg_backend: *SettingsBackend, arg_name: [*:0]const u8) callconv(.c) void,
    sync: ?*const fn (arg_backend: *SettingsBackend) callconv(.c) void,
    get_permission: ?*anyopaque,
    read_user_value: ?*const fn (arg_backend: *SettingsBackend, arg_key: [*:0]const u8, arg_expected_type: *GLib.VariantType) callconv(.c) *GLib.Variant,
    padding: [23]?*anyopaque,
};
pub const SettingsBackendPrivate = opaque {};
pub const SettingsBindFlags = packed struct(u32) {
    get: bool = false,
    set: bool = false,
    no_sensitivity: bool = false,
    get_no_changes: bool = false,
    invert_boolean: bool = false,
    _: u27 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_settings_bind_flags_get_type" });
        return cFn();
    }
};
pub const SettingsBindGetMapping = *const fn (arg_value: *GObject.Value, arg_variant: *GLib.Variant, arg_user_data: ?*anyopaque) callconv(.c) bool;
pub const SettingsBindSetMapping = *const fn (arg_value: *GObject.Value, arg_expected_type: *GLib.VariantType, arg_user_data: ?*anyopaque) callconv(.c) ?*GLib.Variant;
pub const SettingsClass = extern struct {
    parent_class: GObject.ObjectClass,
    writable_changed: ?*const fn (arg_settings: *Settings, arg_key: [*:0]const u8) callconv(.c) void,
    changed: ?*const fn (arg_settings: *Settings, arg_key: [*:0]const u8) callconv(.c) void,
    writable_change_event: ?*const fn (arg_settings: *Settings, arg_key: u32) callconv(.c) bool,
    change_event: ?*const fn (arg_settings: *Settings, arg_keys: *u32, arg_n_keys: i32) callconv(.c) bool,
    padding: [20]?*anyopaque,
};
pub const SettingsGetMapping = *const fn (arg_value: ?*GLib.Variant, arg_result: *anyopaque, arg_user_data: ?*anyopaque) callconv(.c) bool;
pub const SettingsPrivate = opaque {};
pub const SettingsSchema = opaque {
    pub fn getId(self: *SettingsSchema) [*:0]u8 {
        const cFn = @extern(*const fn (*SettingsSchema) callconv(.c) [*:0]u8, .{ .name = "g_settings_schema_get_id" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getKey(self: *SettingsSchema, arg_name: [*:0]const u8) *SettingsSchemaKey {
        const cFn = @extern(*const fn (*SettingsSchema, [*:0]const u8) callconv(.c) *SettingsSchemaKey, .{ .name = "g_settings_schema_get_key" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn getPath(self: *SettingsSchema) ?[*:0]u8 {
        const cFn = @extern(*const fn (*SettingsSchema) callconv(.c) ?[*:0]u8, .{ .name = "g_settings_schema_get_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hasKey(self: *SettingsSchema, arg_name: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*SettingsSchema, [*:0]const u8) callconv(.c) bool, .{ .name = "g_settings_schema_has_key" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn listChildren(self: *SettingsSchema) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*SettingsSchema) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_settings_schema_list_children" });
        const ret = cFn(self);
        return ret;
    }
    pub fn listKeys(self: *SettingsSchema) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*SettingsSchema) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_settings_schema_list_keys" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *SettingsSchema) *SettingsSchema {
        const cFn = @extern(*const fn (*SettingsSchema) callconv(.c) *SettingsSchema, .{ .name = "g_settings_schema_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *SettingsSchema) void {
        const cFn = @extern(*const fn (*SettingsSchema) callconv(.c) void, .{ .name = "g_settings_schema_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_settings_schema_get_type" });
        return cFn();
    }
};
pub const SettingsSchemaKey = opaque {
    pub fn getDefaultValue(self: *SettingsSchemaKey) *GLib.Variant {
        const cFn = @extern(*const fn (*SettingsSchemaKey) callconv(.c) *GLib.Variant, .{ .name = "g_settings_schema_key_get_default_value" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDescription(self: *SettingsSchemaKey) ?[*:0]u8 {
        const cFn = @extern(*const fn (*SettingsSchemaKey) callconv(.c) ?[*:0]u8, .{ .name = "g_settings_schema_key_get_description" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getName(self: *SettingsSchemaKey) [*:0]u8 {
        const cFn = @extern(*const fn (*SettingsSchemaKey) callconv(.c) [*:0]u8, .{ .name = "g_settings_schema_key_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRange(self: *SettingsSchemaKey) *GLib.Variant {
        const cFn = @extern(*const fn (*SettingsSchemaKey) callconv(.c) *GLib.Variant, .{ .name = "g_settings_schema_key_get_range" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSummary(self: *SettingsSchemaKey) ?[*:0]u8 {
        const cFn = @extern(*const fn (*SettingsSchemaKey) callconv(.c) ?[*:0]u8, .{ .name = "g_settings_schema_key_get_summary" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getValueType(self: *SettingsSchemaKey) *GLib.VariantType {
        const cFn = @extern(*const fn (*SettingsSchemaKey) callconv(.c) *GLib.VariantType, .{ .name = "g_settings_schema_key_get_value_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn rangeCheck(self: *SettingsSchemaKey, arg_value: *GLib.Variant) bool {
        const cFn = @extern(*const fn (*SettingsSchemaKey, *GLib.Variant) callconv(.c) bool, .{ .name = "g_settings_schema_key_range_check" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn ref(self: *SettingsSchemaKey) *SettingsSchemaKey {
        const cFn = @extern(*const fn (*SettingsSchemaKey) callconv(.c) *SettingsSchemaKey, .{ .name = "g_settings_schema_key_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *SettingsSchemaKey) void {
        const cFn = @extern(*const fn (*SettingsSchemaKey) callconv(.c) void, .{ .name = "g_settings_schema_key_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_settings_schema_key_get_type" });
        return cFn();
    }
};
pub const SettingsSchemaSource = opaque {
    pub fn newFromDirectory(arg_directory: [*:0]const u8, arg_parent: ?*SettingsSchemaSource, arg_trusted: bool, arg_error: *?*GLib.Error) error{GError}!*SettingsSchemaSource {
        const cFn = @extern(*const fn ([*:0]const u8, ?*SettingsSchemaSource, bool, *?*GLib.Error) callconv(.c) *SettingsSchemaSource, .{ .name = "g_settings_schema_source_new_from_directory" });
        const ret = cFn(arg_directory, arg_parent, arg_trusted, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn listSchemas(self: *SettingsSchemaSource, arg_recursive: bool) struct {
        non_relocatable: [*]?[*:0]const u8,
        relocatable: [*]?[*:0]const u8,
    } {
        var argO_non_relocatable: [*]?[*:0]const u8 = undefined;
        const arg_non_relocatable: *[*]?[*:0]const u8 = &argO_non_relocatable;
        var argO_relocatable: [*]?[*:0]const u8 = undefined;
        const arg_relocatable: *[*]?[*:0]const u8 = &argO_relocatable;
        const cFn = @extern(*const fn (*SettingsSchemaSource, bool, *[*]?[*:0]const u8, *[*]?[*:0]const u8) callconv(.c) void, .{ .name = "g_settings_schema_source_list_schemas" });
        const ret = cFn(self, arg_recursive, arg_non_relocatable, arg_relocatable);
        _ = ret;
        return .{ .non_relocatable = argO_non_relocatable, .relocatable = argO_relocatable };
    }
    pub fn lookup(self: *SettingsSchemaSource, arg_schema_id: [*:0]const u8, arg_recursive: bool) ?*SettingsSchema {
        const cFn = @extern(*const fn (*SettingsSchemaSource, [*:0]const u8, bool) callconv(.c) ?*SettingsSchema, .{ .name = "g_settings_schema_source_lookup" });
        const ret = cFn(self, arg_schema_id, arg_recursive);
        return ret;
    }
    pub fn ref(self: *SettingsSchemaSource) *SettingsSchemaSource {
        const cFn = @extern(*const fn (*SettingsSchemaSource) callconv(.c) *SettingsSchemaSource, .{ .name = "g_settings_schema_source_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *SettingsSchemaSource) void {
        const cFn = @extern(*const fn (*SettingsSchemaSource) callconv(.c) void, .{ .name = "g_settings_schema_source_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDefault() ?*SettingsSchemaSource {
        const cFn = @extern(*const fn () callconv(.c) ?*SettingsSchemaSource, .{ .name = "g_settings_schema_source_get_default" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_settings_schema_source_get_type" });
        return cFn();
    }
};
pub const SimpleAction = struct {
    pub const Interfaces = [_]type{Action};
    pub const Parent = GObject.Object;
    _props: struct {
        enabled: core.Property(bool, "enabled") = .{},
        name: core.Property([*:0]const u8, "name") = .{},
        @"parameter-type": core.Property(GLib.VariantType, "parameter-type") = .{},
        state: core.Property(GLib.Variant, "state") = .{},
        @"state-type": core.Property(GLib.VariantType, "state-type") = .{},
    },
    _signals: struct {
        activate: core.Signal(fn (*SimpleAction, ?*GLib.Variant) void, "activate") = .{},
        @"change-state": core.Signal(fn (*SimpleAction, ?*GLib.Variant) void, "change-state") = .{},
    },
    pub fn new(arg_name: [*:0]const u8, arg_parameter_type: ?*GLib.VariantType) *SimpleAction {
        const cFn = @extern(*const fn ([*:0]const u8, ?*GLib.VariantType) callconv(.c) *SimpleAction, .{ .name = "g_simple_action_new" });
        const ret = cFn(arg_name, arg_parameter_type);
        return ret;
    }
    pub fn newStateful(arg_name: [*:0]const u8, arg_parameter_type: ?*GLib.VariantType, arg_state: *GLib.Variant) *SimpleAction {
        const cFn = @extern(*const fn ([*:0]const u8, ?*GLib.VariantType, *GLib.Variant) callconv(.c) *SimpleAction, .{ .name = "g_simple_action_new_stateful" });
        const ret = cFn(arg_name, arg_parameter_type, arg_state);
        return ret;
    }
    pub fn setEnabled(self: *SimpleAction, arg_enabled: bool) void {
        const cFn = @extern(*const fn (*SimpleAction, bool) callconv(.c) void, .{ .name = "g_simple_action_set_enabled" });
        const ret = cFn(self, arg_enabled);
        return ret;
    }
    pub fn setState(self: *SimpleAction, arg_value: *GLib.Variant) void {
        const cFn = @extern(*const fn (*SimpleAction, *GLib.Variant) callconv(.c) void, .{ .name = "g_simple_action_set_state" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn setStateHint(self: *SimpleAction, arg_state_hint: ?*GLib.Variant) void {
        const cFn = @extern(*const fn (*SimpleAction, ?*GLib.Variant) callconv(.c) void, .{ .name = "g_simple_action_set_state_hint" });
        const ret = cFn(self, arg_state_hint);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_simple_action_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SimpleActionGroup = extern struct {
    pub const Interfaces = [_]type{ ActionGroup, ActionMap };
    pub const Parent = GObject.Object;
    pub const Class = SimpleActionGroupClass;
    parent_instance: GObject.Object,
    priv: ?*SimpleActionGroupPrivate,
    pub fn new() *SimpleActionGroup {
        const cFn = @extern(*const fn () callconv(.c) *SimpleActionGroup, .{ .name = "g_simple_action_group_new" });
        const ret = cFn();
        return ret;
    }
    pub fn addEntries(self: *SimpleActionGroup, argS_entries: []ActionEntry, arg_user_data: ?*anyopaque) void {
        const arg_entries: [*]ActionEntry = @ptrCast(argS_entries);
        const arg_n_entries: i32 = @intCast((argS_entries).len);
        const cFn = @extern(*const fn (*SimpleActionGroup, [*]ActionEntry, i32, ?*anyopaque) callconv(.c) void, .{ .name = "g_simple_action_group_add_entries" });
        const ret = cFn(self, arg_entries, arg_n_entries, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn insert(self: *SimpleActionGroup, arg_action: *Action) void {
        const cFn = @extern(*const fn (*SimpleActionGroup, *Action) callconv(.c) void, .{ .name = "g_simple_action_group_insert" });
        const ret = cFn(self, arg_action);
        return ret;
    }
    pub fn lookup(self: *SimpleActionGroup, arg_action_name: [*:0]const u8) *Action {
        const cFn = @extern(*const fn (*SimpleActionGroup, [*:0]const u8) callconv(.c) *Action, .{ .name = "g_simple_action_group_lookup" });
        const ret = cFn(self, arg_action_name);
        return ret;
    }
    pub fn remove(self: *SimpleActionGroup, arg_action_name: [*:0]const u8) void {
        const cFn = @extern(*const fn (*SimpleActionGroup, [*:0]const u8) callconv(.c) void, .{ .name = "g_simple_action_group_remove" });
        const ret = cFn(self, arg_action_name);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_simple_action_group_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SimpleActionGroupClass = extern struct {
    parent_class: GObject.ObjectClass,
    padding: [12]?*anyopaque,
};
pub const SimpleActionGroupPrivate = opaque {};
pub const SimpleAsyncResult = struct {
    pub const Interfaces = [_]type{AsyncResult};
    pub const Parent = GObject.Object;
    pub const Class = SimpleAsyncResultClass;
    pub fn new(arg_source_object: ?*GObject.Object, argC_callback: core.Closure(?AsyncReadyCallback), arg_source_tag: ?*anyopaque) *SimpleAsyncResult {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (?*GObject.Object, ?AsyncReadyCallback, ?*anyopaque, ?*anyopaque) callconv(.c) *SimpleAsyncResult, .{ .name = "g_simple_async_result_new" });
        const ret = cFn(arg_source_object, arg_callback, @ptrCast(arg_user_data), @ptrCast(arg_source_tag));
        return ret;
    }
    pub fn newFromError(arg_source_object: ?*GObject.Object, argC_callback: core.Closure(?AsyncReadyCallback), arg_error: *GLib.Error) *SimpleAsyncResult {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (?*GObject.Object, ?AsyncReadyCallback, ?*anyopaque, *GLib.Error) callconv(.c) *SimpleAsyncResult, .{ .name = "g_simple_async_result_new_from_error" });
        const ret = cFn(arg_source_object, arg_callback, @ptrCast(arg_user_data), arg_error);
        return ret;
    }
    pub fn isValid(arg_result: *AsyncResult, arg_source: ?*GObject.Object, arg_source_tag: ?*anyopaque) bool {
        const cFn = @extern(*const fn (*AsyncResult, ?*GObject.Object, ?*anyopaque) callconv(.c) bool, .{ .name = "g_simple_async_result_is_valid" });
        const ret = cFn(arg_result, arg_source, @ptrCast(arg_source_tag));
        return ret;
    }
    pub fn complete(self: *SimpleAsyncResult) void {
        const cFn = @extern(*const fn (*SimpleAsyncResult) callconv(.c) void, .{ .name = "g_simple_async_result_complete" });
        const ret = cFn(self);
        return ret;
    }
    pub fn completeInIdle(self: *SimpleAsyncResult) void {
        const cFn = @extern(*const fn (*SimpleAsyncResult) callconv(.c) void, .{ .name = "g_simple_async_result_complete_in_idle" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOpResGboolean(self: *SimpleAsyncResult) bool {
        const cFn = @extern(*const fn (*SimpleAsyncResult) callconv(.c) bool, .{ .name = "g_simple_async_result_get_op_res_gboolean" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOpResGssize(self: *SimpleAsyncResult) i64 {
        const cFn = @extern(*const fn (*SimpleAsyncResult) callconv(.c) i64, .{ .name = "g_simple_async_result_get_op_res_gssize" });
        const ret = cFn(self);
        return ret;
    }
    pub fn propagateError(self: *SimpleAsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*SimpleAsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_simple_async_result_propagate_error" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setCheckCancellable(self: *SimpleAsyncResult, arg_check_cancellable: ?*Cancellable) void {
        const cFn = @extern(*const fn (*SimpleAsyncResult, ?*Cancellable) callconv(.c) void, .{ .name = "g_simple_async_result_set_check_cancellable" });
        const ret = cFn(self, arg_check_cancellable);
        return ret;
    }
    pub fn setFromError(self: *SimpleAsyncResult, arg_error: *GLib.Error) void {
        const cFn = @extern(*const fn (*SimpleAsyncResult, *GLib.Error) callconv(.c) void, .{ .name = "g_simple_async_result_set_from_error" });
        const ret = cFn(self, arg_error);
        return ret;
    }
    pub fn setHandleCancellation(self: *SimpleAsyncResult, arg_handle_cancellation: bool) void {
        const cFn = @extern(*const fn (*SimpleAsyncResult, bool) callconv(.c) void, .{ .name = "g_simple_async_result_set_handle_cancellation" });
        const ret = cFn(self, arg_handle_cancellation);
        return ret;
    }
    pub fn setOpResGboolean(self: *SimpleAsyncResult, arg_op_res: bool) void {
        const cFn = @extern(*const fn (*SimpleAsyncResult, bool) callconv(.c) void, .{ .name = "g_simple_async_result_set_op_res_gboolean" });
        const ret = cFn(self, arg_op_res);
        return ret;
    }
    pub fn setOpResGssize(self: *SimpleAsyncResult, arg_op_res: i64) void {
        const cFn = @extern(*const fn (*SimpleAsyncResult, i64) callconv(.c) void, .{ .name = "g_simple_async_result_set_op_res_gssize" });
        const ret = cFn(self, arg_op_res);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_simple_async_result_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SimpleAsyncResultClass = opaque {};
pub const SimpleAsyncThreadFunc = *const fn (arg_res: *SimpleAsyncResult, arg_object: *GObject.Object, arg_cancellable: ?*Cancellable) callconv(.c) void;
pub const SimpleIOStream = struct {
    pub const Parent = IOStream;
    _props: struct {
        @"input-stream": core.Property(InputStream, "input-stream") = .{},
        @"output-stream": core.Property(OutputStream, "output-stream") = .{},
    },
    pub fn new(arg_input_stream: *InputStream, arg_output_stream: *OutputStream) *SimpleIOStream {
        const cFn = @extern(*const fn (*InputStream, *OutputStream) callconv(.c) *SimpleIOStream, .{ .name = "g_simple_io_stream_new" });
        const ret = cFn(arg_input_stream, arg_output_stream);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_simple_io_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SimplePermission = struct {
    pub const Parent = Permission;
    pub fn new(arg_allowed: bool) *SimplePermission {
        const cFn = @extern(*const fn (bool) callconv(.c) *SimplePermission, .{ .name = "g_simple_permission_new" });
        const ret = cFn(arg_allowed);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_simple_permission_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SimpleProxyResolver = extern struct {
    pub const Interfaces = [_]type{ProxyResolver};
    pub const Parent = GObject.Object;
    pub const Class = SimpleProxyResolverClass;
    _props: struct {
        @"default-proxy": core.Property([*:0]const u8, "default-proxy") = .{},
        @"ignore-hosts": core.Property([*]?[*:0]const u8, "ignore-hosts") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*SimpleProxyResolverPrivate,
    pub fn new(arg_default_proxy: ?[*:0]const u8, arg_ignore_hosts: ?[*]?[*:0]const u8) *ProxyResolver {
        const cFn = @extern(*const fn (?[*:0]const u8, ?[*]?[*:0]const u8) callconv(.c) *ProxyResolver, .{ .name = "g_simple_proxy_resolver_new" });
        const ret = cFn(arg_default_proxy, arg_ignore_hosts);
        return ret;
    }
    pub fn setDefaultProxy(self: *SimpleProxyResolver, arg_default_proxy: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*SimpleProxyResolver, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_simple_proxy_resolver_set_default_proxy" });
        const ret = cFn(self, arg_default_proxy);
        return ret;
    }
    pub fn setIgnoreHosts(self: *SimpleProxyResolver, arg_ignore_hosts: [*]?[*:0]const u8) void {
        const cFn = @extern(*const fn (*SimpleProxyResolver, [*]?[*:0]const u8) callconv(.c) void, .{ .name = "g_simple_proxy_resolver_set_ignore_hosts" });
        const ret = cFn(self, arg_ignore_hosts);
        return ret;
    }
    pub fn setUriProxy(self: *SimpleProxyResolver, arg_uri_scheme: [*:0]const u8, arg_proxy: [*:0]const u8) void {
        const cFn = @extern(*const fn (*SimpleProxyResolver, [*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_simple_proxy_resolver_set_uri_proxy" });
        const ret = cFn(self, arg_uri_scheme, arg_proxy);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_simple_proxy_resolver_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SimpleProxyResolverClass = extern struct {
    parent_class: GObject.ObjectClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const SimpleProxyResolverPrivate = opaque {};
pub const Socket = extern struct {
    pub const Interfaces = [_]type{ DatagramBased, Initable };
    pub const Parent = GObject.Object;
    pub const Class = SocketClass;
    _props: struct {
        blocking: core.Property(bool, "blocking") = .{},
        broadcast: core.Property(bool, "broadcast") = .{},
        family: core.Property(SocketFamily, "family") = .{},
        fd: core.Property(i32, "fd") = .{},
        keepalive: core.Property(bool, "keepalive") = .{},
        @"listen-backlog": core.Property(i32, "listen-backlog") = .{},
        @"local-address": core.Property(SocketAddress, "local-address") = .{},
        @"multicast-loopback": core.Property(bool, "multicast-loopback") = .{},
        @"multicast-ttl": core.Property(u32, "multicast-ttl") = .{},
        protocol: core.Property(SocketProtocol, "protocol") = .{},
        @"remote-address": core.Property(SocketAddress, "remote-address") = .{},
        timeout: core.Property(u32, "timeout") = .{},
        ttl: core.Property(u32, "ttl") = .{},
        type: core.Property(SocketType, "type") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*SocketPrivate,
    pub fn new(arg_family: SocketFamily, arg_type: SocketType, arg_protocol: SocketProtocol, arg_error: *?*GLib.Error) error{GError}!*Socket {
        const cFn = @extern(*const fn (SocketFamily, SocketType, SocketProtocol, *?*GLib.Error) callconv(.c) *Socket, .{ .name = "g_socket_new" });
        const ret = cFn(arg_family, arg_type, arg_protocol, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromFd(arg_fd: i32, arg_error: *?*GLib.Error) error{GError}!*Socket {
        const cFn = @extern(*const fn (i32, *?*GLib.Error) callconv(.c) *Socket, .{ .name = "g_socket_new_from_fd" });
        const ret = cFn(arg_fd, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn accept(self: *Socket, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*Socket {
        const cFn = @extern(*const fn (*Socket, ?*Cancellable, *?*GLib.Error) callconv(.c) *Socket, .{ .name = "g_socket_accept" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn bind(self: *Socket, arg_address: *SocketAddress, arg_allow_reuse: bool, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Socket, *SocketAddress, bool, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_bind" });
        const ret = cFn(self, arg_address, arg_allow_reuse, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn checkConnectResult(self: *Socket, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Socket, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_check_connect_result" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn close(self: *Socket, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Socket, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_close" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn conditionCheck(self: *Socket, arg_condition: GLib.IOCondition) GLib.IOCondition {
        const cFn = @extern(*const fn (*Socket, GLib.IOCondition) callconv(.c) GLib.IOCondition, .{ .name = "g_socket_condition_check" });
        const ret = cFn(self, arg_condition);
        return ret;
    }
    pub fn conditionTimedWait(self: *Socket, arg_condition: GLib.IOCondition, arg_timeout_us: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Socket, GLib.IOCondition, i64, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_condition_timed_wait" });
        const ret = cFn(self, arg_condition, arg_timeout_us, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn conditionWait(self: *Socket, arg_condition: GLib.IOCondition, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Socket, GLib.IOCondition, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_condition_wait" });
        const ret = cFn(self, arg_condition, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn connect(self: *Socket, arg_address: *SocketAddress, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Socket, *SocketAddress, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_connect" });
        const ret = cFn(self, arg_address, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn connectionFactoryCreateConnection(self: *Socket) *SocketConnection {
        const cFn = @extern(*const fn (*Socket) callconv(.c) *SocketConnection, .{ .name = "g_socket_connection_factory_create_connection" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getAvailableBytes(self: *Socket) i64 {
        const cFn = @extern(*const fn (*Socket) callconv(.c) i64, .{ .name = "g_socket_get_available_bytes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBlocking(self: *Socket) bool {
        const cFn = @extern(*const fn (*Socket) callconv(.c) bool, .{ .name = "g_socket_get_blocking" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBroadcast(self: *Socket) bool {
        const cFn = @extern(*const fn (*Socket) callconv(.c) bool, .{ .name = "g_socket_get_broadcast" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCredentials(self: *Socket, arg_error: *?*GLib.Error) error{GError}!*Credentials {
        const cFn = @extern(*const fn (*Socket, *?*GLib.Error) callconv(.c) *Credentials, .{ .name = "g_socket_get_credentials" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getFamily(self: *Socket) SocketFamily {
        const cFn = @extern(*const fn (*Socket) callconv(.c) SocketFamily, .{ .name = "g_socket_get_family" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFd(self: *Socket) i32 {
        const cFn = @extern(*const fn (*Socket) callconv(.c) i32, .{ .name = "g_socket_get_fd" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getKeepalive(self: *Socket) bool {
        const cFn = @extern(*const fn (*Socket) callconv(.c) bool, .{ .name = "g_socket_get_keepalive" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getListenBacklog(self: *Socket) i32 {
        const cFn = @extern(*const fn (*Socket) callconv(.c) i32, .{ .name = "g_socket_get_listen_backlog" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLocalAddress(self: *Socket, arg_error: *?*GLib.Error) error{GError}!*SocketAddress {
        const cFn = @extern(*const fn (*Socket, *?*GLib.Error) callconv(.c) *SocketAddress, .{ .name = "g_socket_get_local_address" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getMulticastLoopback(self: *Socket) bool {
        const cFn = @extern(*const fn (*Socket) callconv(.c) bool, .{ .name = "g_socket_get_multicast_loopback" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMulticastTtl(self: *Socket) u32 {
        const cFn = @extern(*const fn (*Socket) callconv(.c) u32, .{ .name = "g_socket_get_multicast_ttl" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOption(self: *Socket, arg_level: i32, arg_optname: i32, arg_error: *?*GLib.Error) error{GError}!?i32 {
        var argO_value: i32 = undefined;
        const arg_value: *i32 = &argO_value;
        const cFn = @extern(*const fn (*Socket, i32, i32, *i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_get_option" });
        const ret = cFn(self, arg_level, arg_optname, arg_value, arg_error);
        if (arg_error.* != null) return error.GError;
        if (!ret) return null;
        return argO_value;
    }
    pub fn getProtocol(self: *Socket) SocketProtocol {
        const cFn = @extern(*const fn (*Socket) callconv(.c) SocketProtocol, .{ .name = "g_socket_get_protocol" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRemoteAddress(self: *Socket, arg_error: *?*GLib.Error) error{GError}!*SocketAddress {
        const cFn = @extern(*const fn (*Socket, *?*GLib.Error) callconv(.c) *SocketAddress, .{ .name = "g_socket_get_remote_address" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getSocketType(self: *Socket) SocketType {
        const cFn = @extern(*const fn (*Socket) callconv(.c) SocketType, .{ .name = "g_socket_get_socket_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTimeout(self: *Socket) u32 {
        const cFn = @extern(*const fn (*Socket) callconv(.c) u32, .{ .name = "g_socket_get_timeout" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTtl(self: *Socket) u32 {
        const cFn = @extern(*const fn (*Socket) callconv(.c) u32, .{ .name = "g_socket_get_ttl" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isClosed(self: *Socket) bool {
        const cFn = @extern(*const fn (*Socket) callconv(.c) bool, .{ .name = "g_socket_is_closed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isConnected(self: *Socket) bool {
        const cFn = @extern(*const fn (*Socket) callconv(.c) bool, .{ .name = "g_socket_is_connected" });
        const ret = cFn(self);
        return ret;
    }
    pub fn joinMulticastGroup(self: *Socket, arg_group: *InetAddress, arg_source_specific: bool, arg_iface: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Socket, *InetAddress, bool, ?[*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_join_multicast_group" });
        const ret = cFn(self, arg_group, arg_source_specific, arg_iface, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn joinMulticastGroupSsm(self: *Socket, arg_group: *InetAddress, arg_source_specific: ?*InetAddress, arg_iface: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Socket, *InetAddress, ?*InetAddress, ?[*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_join_multicast_group_ssm" });
        const ret = cFn(self, arg_group, arg_source_specific, arg_iface, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn leaveMulticastGroup(self: *Socket, arg_group: *InetAddress, arg_source_specific: bool, arg_iface: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Socket, *InetAddress, bool, ?[*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_leave_multicast_group" });
        const ret = cFn(self, arg_group, arg_source_specific, arg_iface, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn leaveMulticastGroupSsm(self: *Socket, arg_group: *InetAddress, arg_source_specific: ?*InetAddress, arg_iface: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Socket, *InetAddress, ?*InetAddress, ?[*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_leave_multicast_group_ssm" });
        const ret = cFn(self, arg_group, arg_source_specific, arg_iface, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn listen(self: *Socket, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Socket, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_listen" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn receive(self: *Socket, argS_buffer: []u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_size: u64 = @intCast((argS_buffer).len);
        const cFn = @extern(*const fn (*Socket, [*]u8, u64, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_socket_receive" });
        const ret = cFn(self, arg_buffer, arg_size, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn receiveBytes(self: *Socket, arg_size: u64, arg_timeout_us: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*GLib.Bytes {
        const cFn = @extern(*const fn (*Socket, u64, i64, ?*Cancellable, *?*GLib.Error) callconv(.c) *GLib.Bytes, .{ .name = "g_socket_receive_bytes" });
        const ret = cFn(self, arg_size, arg_timeout_us, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn receiveBytesFrom(self: *Socket, arg_size: u64, arg_timeout_us: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *GLib.Bytes,
        address: *SocketAddress,
    } {
        var argO_address: ?*SocketAddress = undefined;
        const arg_address: ?**SocketAddress = &argO_address;
        const cFn = @extern(*const fn (*Socket, ?**SocketAddress, u64, i64, ?*Cancellable, *?*GLib.Error) callconv(.c) *GLib.Bytes, .{ .name = "g_socket_receive_bytes_from" });
        const ret = cFn(self, arg_address, arg_size, arg_timeout_us, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .address = argO_address };
    }
    pub fn receiveFrom(self: *Socket, argS_buffer: []u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: i64,
        address: *SocketAddress,
    } {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_size: u64 = @intCast((argS_buffer).len);
        var argO_address: ?*SocketAddress = undefined;
        const arg_address: ?**SocketAddress = &argO_address;
        const cFn = @extern(*const fn (*Socket, ?**SocketAddress, [*]u8, u64, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_socket_receive_from" });
        const ret = cFn(self, arg_address, arg_buffer, arg_size, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .address = argO_address };
    }
    pub fn receiveMessage(self: *Socket, argS_vectors: []InputVector, arg_flags: *i32, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: i64,
        address: *SocketAddress,
        messages: ?[]*SocketControlMessage,
    } {
        const arg_vectors: [*]InputVector = @ptrCast(argS_vectors);
        const arg_num_vectors: i32 = @intCast((argS_vectors).len);
        var argO_address: ?*SocketAddress = undefined;
        const arg_address: ?**SocketAddress = &argO_address;
        var argO_messages: ?[*]*SocketControlMessage = undefined;
        const arg_messages: ?*?[*]*SocketControlMessage = &argO_messages;
        var argO_num_messages: i32 = undefined;
        const arg_num_messages: *i32 = &argO_num_messages;
        const cFn = @extern(*const fn (*Socket, ?**SocketAddress, [*]InputVector, i32, ?*?[*]*SocketControlMessage, *i32, *i32, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_socket_receive_message" });
        const ret = cFn(self, arg_address, arg_vectors, arg_num_vectors, arg_messages, arg_num_messages, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .address = argO_address, .messages = argO_messages[0..@intCast(argO_num_messages)] };
    }
    pub fn receiveMessages(self: *Socket, argS_messages: []InputMessage, arg_flags: i32, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i32 {
        const arg_messages: [*]InputMessage = @ptrCast(argS_messages);
        const arg_num_messages: u32 = @intCast((argS_messages).len);
        const cFn = @extern(*const fn (*Socket, [*]InputMessage, u32, i32, ?*Cancellable, *?*GLib.Error) callconv(.c) i32, .{ .name = "g_socket_receive_messages" });
        const ret = cFn(self, arg_messages, arg_num_messages, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn receiveWithBlocking(self: *Socket, argS_buffer: []u8, arg_blocking: bool, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_size: u64 = @intCast((argS_buffer).len);
        const cFn = @extern(*const fn (*Socket, [*]u8, u64, bool, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_socket_receive_with_blocking" });
        const ret = cFn(self, arg_buffer, arg_size, arg_blocking, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn send(self: *Socket, argS_buffer: []u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_size: u64 = @intCast((argS_buffer).len);
        const cFn = @extern(*const fn (*Socket, [*]u8, u64, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_socket_send" });
        const ret = cFn(self, arg_buffer, arg_size, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn sendMessage(self: *Socket, arg_address: ?*SocketAddress, argS_vectors: []OutputVector, argS_messages: []*SocketControlMessage, arg_flags: i32, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
        const arg_vectors: [*]OutputVector = @ptrCast(argS_vectors);
        const arg_num_vectors: i32 = @intCast((argS_vectors).len);
        const arg_messages: ?[*]*SocketControlMessage = @ptrCast(argS_messages);
        const arg_num_messages: i32 = @intCast((argS_messages).len);
        const cFn = @extern(*const fn (*Socket, ?*SocketAddress, [*]OutputVector, i32, ?[*]*SocketControlMessage, i32, i32, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_socket_send_message" });
        const ret = cFn(self, arg_address, arg_vectors, arg_num_vectors, arg_messages, arg_num_messages, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn sendMessageWithTimeout(self: *Socket, arg_address: ?*SocketAddress, argS_vectors: []OutputVector, argS_messages: []*SocketControlMessage, arg_flags: i32, arg_timeout_us: i64, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: PollableReturn,
        bytes_written: u64,
    } {
        const arg_vectors: [*]OutputVector = @ptrCast(argS_vectors);
        const arg_num_vectors: i32 = @intCast((argS_vectors).len);
        const arg_messages: ?[*]*SocketControlMessage = @ptrCast(argS_messages);
        const arg_num_messages: i32 = @intCast((argS_messages).len);
        var argO_bytes_written: u64 = undefined;
        const arg_bytes_written: ?*u64 = &argO_bytes_written;
        const cFn = @extern(*const fn (*Socket, ?*SocketAddress, [*]OutputVector, i32, ?[*]*SocketControlMessage, i32, i32, i64, ?*u64, ?*Cancellable, *?*GLib.Error) callconv(.c) PollableReturn, .{ .name = "g_socket_send_message_with_timeout" });
        const ret = cFn(self, arg_address, arg_vectors, arg_num_vectors, arg_messages, arg_num_messages, arg_flags, arg_timeout_us, arg_bytes_written, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .bytes_written = argO_bytes_written };
    }
    pub fn sendMessages(self: *Socket, argS_messages: []OutputMessage, arg_flags: i32, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i32 {
        const arg_messages: [*]OutputMessage = @ptrCast(argS_messages);
        const arg_num_messages: u32 = @intCast((argS_messages).len);
        const cFn = @extern(*const fn (*Socket, [*]OutputMessage, u32, i32, ?*Cancellable, *?*GLib.Error) callconv(.c) i32, .{ .name = "g_socket_send_messages" });
        const ret = cFn(self, arg_messages, arg_num_messages, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn sendTo(self: *Socket, arg_address: ?*SocketAddress, argS_buffer: []u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_size: u64 = @intCast((argS_buffer).len);
        const cFn = @extern(*const fn (*Socket, ?*SocketAddress, [*]u8, u64, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_socket_send_to" });
        const ret = cFn(self, arg_address, arg_buffer, arg_size, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn sendWithBlocking(self: *Socket, argS_buffer: []u8, arg_blocking: bool, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        const arg_size: u64 = @intCast((argS_buffer).len);
        const cFn = @extern(*const fn (*Socket, [*]u8, u64, bool, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_socket_send_with_blocking" });
        const ret = cFn(self, arg_buffer, arg_size, arg_blocking, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setBlocking(self: *Socket, arg_blocking: bool) void {
        const cFn = @extern(*const fn (*Socket, bool) callconv(.c) void, .{ .name = "g_socket_set_blocking" });
        const ret = cFn(self, arg_blocking);
        return ret;
    }
    pub fn setBroadcast(self: *Socket, arg_broadcast: bool) void {
        const cFn = @extern(*const fn (*Socket, bool) callconv(.c) void, .{ .name = "g_socket_set_broadcast" });
        const ret = cFn(self, arg_broadcast);
        return ret;
    }
    pub fn setKeepalive(self: *Socket, arg_keepalive: bool) void {
        const cFn = @extern(*const fn (*Socket, bool) callconv(.c) void, .{ .name = "g_socket_set_keepalive" });
        const ret = cFn(self, arg_keepalive);
        return ret;
    }
    pub fn setListenBacklog(self: *Socket, arg_backlog: i32) void {
        const cFn = @extern(*const fn (*Socket, i32) callconv(.c) void, .{ .name = "g_socket_set_listen_backlog" });
        const ret = cFn(self, arg_backlog);
        return ret;
    }
    pub fn setMulticastLoopback(self: *Socket, arg_loopback: bool) void {
        const cFn = @extern(*const fn (*Socket, bool) callconv(.c) void, .{ .name = "g_socket_set_multicast_loopback" });
        const ret = cFn(self, arg_loopback);
        return ret;
    }
    pub fn setMulticastTtl(self: *Socket, arg_ttl: u32) void {
        const cFn = @extern(*const fn (*Socket, u32) callconv(.c) void, .{ .name = "g_socket_set_multicast_ttl" });
        const ret = cFn(self, arg_ttl);
        return ret;
    }
    pub fn setOption(self: *Socket, arg_level: i32, arg_optname: i32, arg_value: i32, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Socket, i32, i32, i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_set_option" });
        const ret = cFn(self, arg_level, arg_optname, arg_value, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setTimeout(self: *Socket, arg_timeout: u32) void {
        const cFn = @extern(*const fn (*Socket, u32) callconv(.c) void, .{ .name = "g_socket_set_timeout" });
        const ret = cFn(self, arg_timeout);
        return ret;
    }
    pub fn setTtl(self: *Socket, arg_ttl: u32) void {
        const cFn = @extern(*const fn (*Socket, u32) callconv(.c) void, .{ .name = "g_socket_set_ttl" });
        const ret = cFn(self, arg_ttl);
        return ret;
    }
    pub fn shutdown(self: *Socket, arg_shutdown_read: bool, arg_shutdown_write: bool, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Socket, bool, bool, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_shutdown" });
        const ret = cFn(self, arg_shutdown_read, arg_shutdown_write, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn speaksIpv4(self: *Socket) bool {
        const cFn = @extern(*const fn (*Socket) callconv(.c) bool, .{ .name = "g_socket_speaks_ipv4" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_socket_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SocketAddress = extern struct {
    pub const Interfaces = [_]type{SocketConnectable};
    pub const Parent = GObject.Object;
    pub const Class = SocketAddressClass;
    _props: struct {
        family: core.Property(SocketFamily, "family") = .{},
    },
    parent_instance: GObject.Object,
    pub fn newFromNative(arg_native: *anyopaque, arg_len: u64) *SocketAddress {
        const cFn = @extern(*const fn (*anyopaque, u64) callconv(.c) *SocketAddress, .{ .name = "g_socket_address_new_from_native" });
        const ret = cFn(@ptrCast(arg_native), arg_len);
        return ret;
    }
    pub fn getFamily(self: *SocketAddress) SocketFamily {
        const cFn = @extern(*const fn (*SocketAddress) callconv(.c) SocketFamily, .{ .name = "g_socket_address_get_family" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNativeSize(self: *SocketAddress) i64 {
        const cFn = @extern(*const fn (*SocketAddress) callconv(.c) i64, .{ .name = "g_socket_address_get_native_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn toNative(self: *SocketAddress, arg_dest: ?*anyopaque, arg_destlen: u64, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*SocketAddress, ?*anyopaque, u64, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_address_to_native" });
        const ret = cFn(self, @ptrCast(arg_dest), arg_destlen, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_socket_address_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SocketAddressClass = extern struct {
    parent_class: GObject.ObjectClass,
    get_family: ?*const fn (arg_address: *SocketAddress) callconv(.c) SocketFamily,
    get_native_size: ?*const fn (arg_address: *SocketAddress) callconv(.c) i64,
    to_native: ?*const fn (arg_address: *SocketAddress, arg_dest: ?*anyopaque, arg_destlen: u64, arg_error: *?*GLib.Error) callconv(.c) bool,
};
pub const SocketAddressEnumerator = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = SocketAddressEnumeratorClass;
    parent_instance: GObject.Object,
    pub fn next(self: *SocketAddressEnumerator, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!?*SocketAddress {
        const cFn = @extern(*const fn (*SocketAddressEnumerator, ?*Cancellable, *?*GLib.Error) callconv(.c) ?*SocketAddress, .{ .name = "g_socket_address_enumerator_next" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn nextAsync(self: *SocketAddressEnumerator, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*SocketAddressEnumerator, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_socket_address_enumerator_next_async" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn nextFinish(self: *SocketAddressEnumerator, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!?*SocketAddress {
        const cFn = @extern(*const fn (*SocketAddressEnumerator, *AsyncResult, *?*GLib.Error) callconv(.c) ?*SocketAddress, .{ .name = "g_socket_address_enumerator_next_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_socket_address_enumerator_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SocketAddressEnumeratorClass = extern struct {
    parent_class: GObject.ObjectClass,
    next: ?*const fn (arg_enumerator: *SocketAddressEnumerator, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) ?*SocketAddress,
    next_async: ?*const fn (arg_enumerator: *SocketAddressEnumerator, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    next_finish: ?*const fn (arg_enumerator: *SocketAddressEnumerator, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) ?*SocketAddress,
};
pub const SocketClass = extern struct {
    parent_class: GObject.ObjectClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
    _g_reserved6: ?*anyopaque,
    _g_reserved7: ?*anyopaque,
    _g_reserved8: ?*anyopaque,
    _g_reserved9: ?*anyopaque,
    _g_reserved10: ?*anyopaque,
};
pub const SocketClient = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = SocketClientClass;
    _props: struct {
        @"enable-proxy": core.Property(bool, "enable-proxy") = .{},
        family: core.Property(SocketFamily, "family") = .{},
        @"local-address": core.Property(SocketAddress, "local-address") = .{},
        protocol: core.Property(SocketProtocol, "protocol") = .{},
        @"proxy-resolver": core.Property(ProxyResolver, "proxy-resolver") = .{},
        timeout: core.Property(u32, "timeout") = .{},
        tls: core.Property(bool, "tls") = .{},
        @"tls-validation-flags": core.Property(TlsCertificateFlags, "tls-validation-flags") = .{},
        type: core.Property(SocketType, "type") = .{},
    },
    _signals: struct {
        event: core.Signal(fn (*SocketClient, SocketClientEvent, *SocketConnectable, ?*IOStream) void, "event") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*SocketClientPrivate,
    pub fn new() *SocketClient {
        const cFn = @extern(*const fn () callconv(.c) *SocketClient, .{ .name = "g_socket_client_new" });
        const ret = cFn();
        return ret;
    }
    pub fn addApplicationProxy(self: *SocketClient, arg_protocol: [*:0]const u8) void {
        const cFn = @extern(*const fn (*SocketClient, [*:0]const u8) callconv(.c) void, .{ .name = "g_socket_client_add_application_proxy" });
        const ret = cFn(self, arg_protocol);
        return ret;
    }
    pub fn connect(self: *SocketClient, arg_connectable: *SocketConnectable, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*SocketConnection {
        const cFn = @extern(*const fn (*SocketClient, *SocketConnectable, ?*Cancellable, *?*GLib.Error) callconv(.c) *SocketConnection, .{ .name = "g_socket_client_connect" });
        const ret = cFn(self, arg_connectable, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn connectAsync(self: *SocketClient, arg_connectable: *SocketConnectable, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*SocketClient, *SocketConnectable, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_socket_client_connect_async" });
        const ret = cFn(self, arg_connectable, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn connectFinish(self: *SocketClient, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*SocketConnection {
        const cFn = @extern(*const fn (*SocketClient, *AsyncResult, *?*GLib.Error) callconv(.c) *SocketConnection, .{ .name = "g_socket_client_connect_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn connectToHost(self: *SocketClient, arg_host_and_port: [*:0]const u8, arg_default_port: u16, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*SocketConnection {
        const cFn = @extern(*const fn (*SocketClient, [*:0]const u8, u16, ?*Cancellable, *?*GLib.Error) callconv(.c) *SocketConnection, .{ .name = "g_socket_client_connect_to_host" });
        const ret = cFn(self, arg_host_and_port, arg_default_port, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn connectToHostAsync(self: *SocketClient, arg_host_and_port: [*:0]const u8, arg_default_port: u16, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*SocketClient, [*:0]const u8, u16, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_socket_client_connect_to_host_async" });
        const ret = cFn(self, arg_host_and_port, arg_default_port, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn connectToHostFinish(self: *SocketClient, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*SocketConnection {
        const cFn = @extern(*const fn (*SocketClient, *AsyncResult, *?*GLib.Error) callconv(.c) *SocketConnection, .{ .name = "g_socket_client_connect_to_host_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn connectToService(self: *SocketClient, arg_domain: [*:0]const u8, arg_service: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*SocketConnection {
        const cFn = @extern(*const fn (*SocketClient, [*:0]const u8, [*:0]const u8, ?*Cancellable, *?*GLib.Error) callconv(.c) *SocketConnection, .{ .name = "g_socket_client_connect_to_service" });
        const ret = cFn(self, arg_domain, arg_service, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn connectToServiceAsync(self: *SocketClient, arg_domain: [*:0]const u8, arg_service: [*:0]const u8, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*SocketClient, [*:0]const u8, [*:0]const u8, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_socket_client_connect_to_service_async" });
        const ret = cFn(self, arg_domain, arg_service, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn connectToServiceFinish(self: *SocketClient, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*SocketConnection {
        const cFn = @extern(*const fn (*SocketClient, *AsyncResult, *?*GLib.Error) callconv(.c) *SocketConnection, .{ .name = "g_socket_client_connect_to_service_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn connectToUri(self: *SocketClient, arg_uri: [*:0]const u8, arg_default_port: u16, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*SocketConnection {
        const cFn = @extern(*const fn (*SocketClient, [*:0]const u8, u16, ?*Cancellable, *?*GLib.Error) callconv(.c) *SocketConnection, .{ .name = "g_socket_client_connect_to_uri" });
        const ret = cFn(self, arg_uri, arg_default_port, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn connectToUriAsync(self: *SocketClient, arg_uri: [*:0]const u8, arg_default_port: u16, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*SocketClient, [*:0]const u8, u16, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_socket_client_connect_to_uri_async" });
        const ret = cFn(self, arg_uri, arg_default_port, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn connectToUriFinish(self: *SocketClient, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*SocketConnection {
        const cFn = @extern(*const fn (*SocketClient, *AsyncResult, *?*GLib.Error) callconv(.c) *SocketConnection, .{ .name = "g_socket_client_connect_to_uri_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getEnableProxy(self: *SocketClient) bool {
        const cFn = @extern(*const fn (*SocketClient) callconv(.c) bool, .{ .name = "g_socket_client_get_enable_proxy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFamily(self: *SocketClient) SocketFamily {
        const cFn = @extern(*const fn (*SocketClient) callconv(.c) SocketFamily, .{ .name = "g_socket_client_get_family" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLocalAddress(self: *SocketClient) ?*SocketAddress {
        const cFn = @extern(*const fn (*SocketClient) callconv(.c) ?*SocketAddress, .{ .name = "g_socket_client_get_local_address" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getProtocol(self: *SocketClient) SocketProtocol {
        const cFn = @extern(*const fn (*SocketClient) callconv(.c) SocketProtocol, .{ .name = "g_socket_client_get_protocol" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getProxyResolver(self: *SocketClient) *ProxyResolver {
        const cFn = @extern(*const fn (*SocketClient) callconv(.c) *ProxyResolver, .{ .name = "g_socket_client_get_proxy_resolver" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSocketType(self: *SocketClient) SocketType {
        const cFn = @extern(*const fn (*SocketClient) callconv(.c) SocketType, .{ .name = "g_socket_client_get_socket_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTimeout(self: *SocketClient) u32 {
        const cFn = @extern(*const fn (*SocketClient) callconv(.c) u32, .{ .name = "g_socket_client_get_timeout" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTls(self: *SocketClient) bool {
        const cFn = @extern(*const fn (*SocketClient) callconv(.c) bool, .{ .name = "g_socket_client_get_tls" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTlsValidationFlags(self: *SocketClient) TlsCertificateFlags {
        const cFn = @extern(*const fn (*SocketClient) callconv(.c) TlsCertificateFlags, .{ .name = "g_socket_client_get_tls_validation_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setEnableProxy(self: *SocketClient, arg_enable: bool) void {
        const cFn = @extern(*const fn (*SocketClient, bool) callconv(.c) void, .{ .name = "g_socket_client_set_enable_proxy" });
        const ret = cFn(self, arg_enable);
        return ret;
    }
    pub fn setFamily(self: *SocketClient, arg_family: SocketFamily) void {
        const cFn = @extern(*const fn (*SocketClient, SocketFamily) callconv(.c) void, .{ .name = "g_socket_client_set_family" });
        const ret = cFn(self, arg_family);
        return ret;
    }
    pub fn setLocalAddress(self: *SocketClient, arg_address: ?*SocketAddress) void {
        const cFn = @extern(*const fn (*SocketClient, ?*SocketAddress) callconv(.c) void, .{ .name = "g_socket_client_set_local_address" });
        const ret = cFn(self, arg_address);
        return ret;
    }
    pub fn setProtocol(self: *SocketClient, arg_protocol: SocketProtocol) void {
        const cFn = @extern(*const fn (*SocketClient, SocketProtocol) callconv(.c) void, .{ .name = "g_socket_client_set_protocol" });
        const ret = cFn(self, arg_protocol);
        return ret;
    }
    pub fn setProxyResolver(self: *SocketClient, arg_proxy_resolver: ?*ProxyResolver) void {
        const cFn = @extern(*const fn (*SocketClient, ?*ProxyResolver) callconv(.c) void, .{ .name = "g_socket_client_set_proxy_resolver" });
        const ret = cFn(self, arg_proxy_resolver);
        return ret;
    }
    pub fn setSocketType(self: *SocketClient, arg_type: SocketType) void {
        const cFn = @extern(*const fn (*SocketClient, SocketType) callconv(.c) void, .{ .name = "g_socket_client_set_socket_type" });
        const ret = cFn(self, arg_type);
        return ret;
    }
    pub fn setTimeout(self: *SocketClient, arg_timeout: u32) void {
        const cFn = @extern(*const fn (*SocketClient, u32) callconv(.c) void, .{ .name = "g_socket_client_set_timeout" });
        const ret = cFn(self, arg_timeout);
        return ret;
    }
    pub fn setTls(self: *SocketClient, arg_tls: bool) void {
        const cFn = @extern(*const fn (*SocketClient, bool) callconv(.c) void, .{ .name = "g_socket_client_set_tls" });
        const ret = cFn(self, arg_tls);
        return ret;
    }
    pub fn setTlsValidationFlags(self: *SocketClient, arg_flags: TlsCertificateFlags) void {
        const cFn = @extern(*const fn (*SocketClient, TlsCertificateFlags) callconv(.c) void, .{ .name = "g_socket_client_set_tls_validation_flags" });
        const ret = cFn(self, arg_flags);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_socket_client_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SocketClientClass = extern struct {
    parent_class: GObject.ObjectClass,
    event: ?*const fn (arg_client: *SocketClient, arg_event: SocketClientEvent, arg_connectable: *SocketConnectable, arg_connection: *IOStream) callconv(.c) void,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
};
pub const SocketClientEvent = enum(u32) {
    resolving = 0,
    resolved = 1,
    connecting = 2,
    connected = 3,
    proxy_negotiating = 4,
    proxy_negotiated = 5,
    tls_handshaking = 6,
    tls_handshaked = 7,
    complete = 8,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_socket_client_event_get_type" });
        return cFn();
    }
};
pub const SocketClientPrivate = opaque {};
pub const SocketConnectable = struct {
    pub const Class = SocketConnectableIface;
    pub fn enumerate(self: *SocketConnectable) *SocketAddressEnumerator {
        const cFn = @extern(*const fn (*SocketConnectable) callconv(.c) *SocketAddressEnumerator, .{ .name = "g_socket_connectable_enumerate" });
        const ret = cFn(self);
        return ret;
    }
    pub fn proxyEnumerate(self: *SocketConnectable) *SocketAddressEnumerator {
        const cFn = @extern(*const fn (*SocketConnectable) callconv(.c) *SocketAddressEnumerator, .{ .name = "g_socket_connectable_proxy_enumerate" });
        const ret = cFn(self);
        return ret;
    }
    pub fn toString(self: *SocketConnectable) [*:0]u8 {
        const cFn = @extern(*const fn (*SocketConnectable) callconv(.c) [*:0]u8, .{ .name = "g_socket_connectable_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_socket_connectable_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SocketConnectableIface = extern struct {
    g_iface: GObject.TypeInterface,
    enumerate: ?*const fn (arg_connectable: *SocketConnectable) callconv(.c) *SocketAddressEnumerator,
    proxy_enumerate: ?*const fn (arg_connectable: *SocketConnectable) callconv(.c) *SocketAddressEnumerator,
    to_string: ?*const fn (arg_connectable: *SocketConnectable) callconv(.c) [*:0]u8,
};
pub const SocketConnection = extern struct {
    pub const Parent = IOStream;
    pub const Class = SocketConnectionClass;
    _props: struct {
        socket: core.Property(Socket, "socket") = .{},
    },
    parent_instance: IOStream,
    priv: ?*SocketConnectionPrivate,
    pub fn factoryLookupType(arg_family: SocketFamily, arg_type: SocketType, arg_protocol_id: i32) core.Type {
        const cFn = @extern(*const fn (SocketFamily, SocketType, i32) callconv(.c) core.Type, .{ .name = "g_socket_connection_factory_lookup_type" });
        const ret = cFn(arg_family, arg_type, arg_protocol_id);
        return ret;
    }
    pub fn factoryRegisterType(arg_g_type: core.Type, arg_family: SocketFamily, arg_type: SocketType, arg_protocol: i32) void {
        const cFn = @extern(*const fn (core.Type, SocketFamily, SocketType, i32) callconv(.c) void, .{ .name = "g_socket_connection_factory_register_type" });
        const ret = cFn(arg_g_type, arg_family, arg_type, arg_protocol);
        return ret;
    }
    pub fn connect(self: *SocketConnection, arg_address: *SocketAddress, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*SocketConnection, *SocketAddress, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_connection_connect" });
        const ret = cFn(self, arg_address, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn connectAsync(self: *SocketConnection, arg_address: *SocketAddress, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*SocketConnection, *SocketAddress, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_socket_connection_connect_async" });
        const ret = cFn(self, arg_address, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn connectFinish(self: *SocketConnection, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*SocketConnection, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_connection_connect_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getLocalAddress(self: *SocketConnection, arg_error: *?*GLib.Error) error{GError}!*SocketAddress {
        const cFn = @extern(*const fn (*SocketConnection, *?*GLib.Error) callconv(.c) *SocketAddress, .{ .name = "g_socket_connection_get_local_address" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getRemoteAddress(self: *SocketConnection, arg_error: *?*GLib.Error) error{GError}!*SocketAddress {
        const cFn = @extern(*const fn (*SocketConnection, *?*GLib.Error) callconv(.c) *SocketAddress, .{ .name = "g_socket_connection_get_remote_address" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getSocket(self: *SocketConnection) *Socket {
        const cFn = @extern(*const fn (*SocketConnection) callconv(.c) *Socket, .{ .name = "g_socket_connection_get_socket" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isConnected(self: *SocketConnection) bool {
        const cFn = @extern(*const fn (*SocketConnection) callconv(.c) bool, .{ .name = "g_socket_connection_is_connected" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_socket_connection_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SocketConnectionClass = extern struct {
    parent_class: IOStreamClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
    _g_reserved6: ?*anyopaque,
};
pub const SocketConnectionPrivate = opaque {};
pub const SocketControlMessage = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = SocketControlMessageClass;
    parent_instance: GObject.Object,
    priv: ?*SocketControlMessagePrivate,
    pub fn deserialize(arg_level: i32, arg_type: i32, argS_data: []u8) ?*SocketControlMessage {
        const arg_size: u64 = @intCast((argS_data).len);
        const arg_data: [*]u8 = @ptrCast(argS_data);
        const cFn = @extern(*const fn (i32, i32, u64, [*]u8) callconv(.c) ?*SocketControlMessage, .{ .name = "g_socket_control_message_deserialize" });
        const ret = cFn(arg_level, arg_type, arg_size, arg_data);
        return ret;
    }
    pub fn getLevel(self: *SocketControlMessage) i32 {
        const cFn = @extern(*const fn (*SocketControlMessage) callconv(.c) i32, .{ .name = "g_socket_control_message_get_level" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMsgType(self: *SocketControlMessage) i32 {
        const cFn = @extern(*const fn (*SocketControlMessage) callconv(.c) i32, .{ .name = "g_socket_control_message_get_msg_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSize(self: *SocketControlMessage) u64 {
        const cFn = @extern(*const fn (*SocketControlMessage) callconv(.c) u64, .{ .name = "g_socket_control_message_get_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn serialize(self: *SocketControlMessage, arg_data: *anyopaque) void {
        const cFn = @extern(*const fn (*SocketControlMessage, *anyopaque) callconv(.c) void, .{ .name = "g_socket_control_message_serialize" });
        const ret = cFn(self, @ptrCast(arg_data));
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_socket_control_message_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SocketControlMessageClass = extern struct {
    parent_class: GObject.ObjectClass,
    get_size: ?*const fn (arg_message: *SocketControlMessage) callconv(.c) u64,
    get_level: ?*const fn (arg_message: *SocketControlMessage) callconv(.c) i32,
    get_type: ?*const fn (arg_message: *SocketControlMessage) callconv(.c) i32,
    serialize: ?*const fn (arg_message: *SocketControlMessage, arg_data: *anyopaque) callconv(.c) void,
    deserialize: ?*anyopaque,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const SocketControlMessagePrivate = opaque {};
pub const SocketFamily = enum(u32) {
    invalid = 0,
    unix = 1,
    ipv4 = 2,
    ipv6 = 10,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_socket_family_get_type" });
        return cFn();
    }
};
pub const SocketListener = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = SocketListenerClass;
    _props: struct {
        @"listen-backlog": core.Property(i32, "listen-backlog") = .{},
    },
    _signals: struct {
        event: core.Signal(fn (*SocketListener, SocketListenerEvent, *Socket) void, "event") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*SocketListenerPrivate,
    pub fn new() *SocketListener {
        const cFn = @extern(*const fn () callconv(.c) *SocketListener, .{ .name = "g_socket_listener_new" });
        const ret = cFn();
        return ret;
    }
    pub fn accept(self: *SocketListener, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *SocketConnection,
        source_object: ?*GObject.Object,
    } {
        var argO_source_object: ?*GObject.Object = undefined;
        const arg_source_object: ?*?*GObject.Object = &argO_source_object;
        const cFn = @extern(*const fn (*SocketListener, ?*?*GObject.Object, ?*Cancellable, *?*GLib.Error) callconv(.c) *SocketConnection, .{ .name = "g_socket_listener_accept" });
        const ret = cFn(self, arg_source_object, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .source_object = argO_source_object };
    }
    pub fn acceptAsync(self: *SocketListener, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*SocketListener, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_socket_listener_accept_async" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn acceptFinish(self: *SocketListener, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *SocketConnection,
        source_object: ?*GObject.Object,
    } {
        var argO_source_object: ?*GObject.Object = undefined;
        const arg_source_object: ?*?*GObject.Object = &argO_source_object;
        const cFn = @extern(*const fn (*SocketListener, *AsyncResult, ?*?*GObject.Object, *?*GLib.Error) callconv(.c) *SocketConnection, .{ .name = "g_socket_listener_accept_finish" });
        const ret = cFn(self, arg_result, arg_source_object, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .source_object = argO_source_object };
    }
    pub fn acceptSocket(self: *SocketListener, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *Socket,
        source_object: ?*GObject.Object,
    } {
        var argO_source_object: ?*GObject.Object = undefined;
        const arg_source_object: ?*?*GObject.Object = &argO_source_object;
        const cFn = @extern(*const fn (*SocketListener, ?*?*GObject.Object, ?*Cancellable, *?*GLib.Error) callconv(.c) *Socket, .{ .name = "g_socket_listener_accept_socket" });
        const ret = cFn(self, arg_source_object, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .source_object = argO_source_object };
    }
    pub fn acceptSocketAsync(self: *SocketListener, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*SocketListener, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_socket_listener_accept_socket_async" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn acceptSocketFinish(self: *SocketListener, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: *Socket,
        source_object: ?*GObject.Object,
    } {
        var argO_source_object: ?*GObject.Object = undefined;
        const arg_source_object: ?*?*GObject.Object = &argO_source_object;
        const cFn = @extern(*const fn (*SocketListener, *AsyncResult, ?*?*GObject.Object, *?*GLib.Error) callconv(.c) *Socket, .{ .name = "g_socket_listener_accept_socket_finish" });
        const ret = cFn(self, arg_result, arg_source_object, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .source_object = argO_source_object };
    }
    pub fn addAddress(self: *SocketListener, arg_address: *SocketAddress, arg_type: SocketType, arg_protocol: SocketProtocol, arg_source_object: ?*GObject.Object, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        effective_address: *SocketAddress,
    } {
        var argO_effective_address: ?*SocketAddress = undefined;
        const arg_effective_address: ?**SocketAddress = &argO_effective_address;
        const cFn = @extern(*const fn (*SocketListener, *SocketAddress, SocketType, SocketProtocol, ?*GObject.Object, ?**SocketAddress, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_listener_add_address" });
        const ret = cFn(self, arg_address, arg_type, arg_protocol, arg_source_object, arg_effective_address, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .effective_address = argO_effective_address };
    }
    pub fn addAnyInetPort(self: *SocketListener, arg_source_object: ?*GObject.Object, arg_error: *?*GLib.Error) error{GError}!u16 {
        const cFn = @extern(*const fn (*SocketListener, ?*GObject.Object, *?*GLib.Error) callconv(.c) u16, .{ .name = "g_socket_listener_add_any_inet_port" });
        const ret = cFn(self, arg_source_object, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn addInetPort(self: *SocketListener, arg_port: u16, arg_source_object: ?*GObject.Object, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*SocketListener, u16, ?*GObject.Object, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_listener_add_inet_port" });
        const ret = cFn(self, arg_port, arg_source_object, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn addSocket(self: *SocketListener, arg_socket: *Socket, arg_source_object: ?*GObject.Object, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*SocketListener, *Socket, ?*GObject.Object, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_socket_listener_add_socket" });
        const ret = cFn(self, arg_socket, arg_source_object, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn close(self: *SocketListener) void {
        const cFn = @extern(*const fn (*SocketListener) callconv(.c) void, .{ .name = "g_socket_listener_close" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setBacklog(self: *SocketListener, arg_listen_backlog: i32) void {
        const cFn = @extern(*const fn (*SocketListener, i32) callconv(.c) void, .{ .name = "g_socket_listener_set_backlog" });
        const ret = cFn(self, arg_listen_backlog);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_socket_listener_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SocketListenerClass = extern struct {
    parent_class: GObject.ObjectClass,
    changed: ?*const fn (arg_listener: *SocketListener) callconv(.c) void,
    event: ?*const fn (arg_listener: *SocketListener, arg_event: SocketListenerEvent, arg_socket: *Socket) callconv(.c) void,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
    _g_reserved6: ?*anyopaque,
};
pub const SocketListenerEvent = enum(u32) {
    binding = 0,
    bound = 1,
    listening = 2,
    listened = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_socket_listener_event_get_type" });
        return cFn();
    }
};
pub const SocketListenerPrivate = opaque {};
pub const SocketMsgFlags = packed struct(u32) {
    oob: bool = false,
    peek: bool = false,
    dontroute: bool = false,
    _: u29 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_socket_msg_flags_get_type" });
        return cFn();
    }
};
pub const SocketPrivate = opaque {};
pub const SocketProtocol = enum(i32) {
    unknown = -1,
    default = 0,
    tcp = 6,
    udp = 17,
    sctp = 132,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_socket_protocol_get_type" });
        return cFn();
    }
};
pub const SocketService = extern struct {
    pub const Parent = SocketListener;
    pub const Class = SocketServiceClass;
    _props: struct {
        active: core.Property(bool, "active") = .{},
    },
    _signals: struct {
        incoming: core.Signal(fn (*SocketService, *SocketConnection, ?*GObject.Object) bool, "incoming") = .{},
    },
    parent_instance: SocketListener,
    priv: ?*SocketServicePrivate,
    pub fn new() *SocketService {
        const cFn = @extern(*const fn () callconv(.c) *SocketService, .{ .name = "g_socket_service_new" });
        const ret = cFn();
        return ret;
    }
    pub fn isActive(self: *SocketService) bool {
        const cFn = @extern(*const fn (*SocketService) callconv(.c) bool, .{ .name = "g_socket_service_is_active" });
        const ret = cFn(self);
        return ret;
    }
    pub fn start(self: *SocketService) void {
        const cFn = @extern(*const fn (*SocketService) callconv(.c) void, .{ .name = "g_socket_service_start" });
        const ret = cFn(self);
        return ret;
    }
    pub fn stop(self: *SocketService) void {
        const cFn = @extern(*const fn (*SocketService) callconv(.c) void, .{ .name = "g_socket_service_stop" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_socket_service_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SocketServiceClass = extern struct {
    parent_class: SocketListenerClass,
    incoming: ?*const fn (arg_service: *SocketService, arg_connection: *SocketConnection, arg_source_object: *GObject.Object) callconv(.c) bool,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
    _g_reserved6: ?*anyopaque,
};
pub const SocketServicePrivate = opaque {};
pub const SocketSourceFunc = *const fn (arg_socket: *Socket, arg_condition: GLib.IOCondition, arg_data: ?*anyopaque) callconv(.c) bool;
pub const SocketType = enum(u32) {
    invalid = 0,
    stream = 1,
    datagram = 2,
    seqpacket = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_socket_type_get_type" });
        return cFn();
    }
};
pub const SrvTarget = opaque {
    pub fn new(arg_hostname: [*:0]const u8, arg_port: u16, arg_priority: u16, arg_weight: u16) *SrvTarget {
        const cFn = @extern(*const fn ([*:0]const u8, u16, u16, u16) callconv(.c) *SrvTarget, .{ .name = "g_srv_target_new" });
        const ret = cFn(arg_hostname, arg_port, arg_priority, arg_weight);
        return ret;
    }
    pub fn copy(self: *SrvTarget) *SrvTarget {
        const cFn = @extern(*const fn (*SrvTarget) callconv(.c) *SrvTarget, .{ .name = "g_srv_target_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *SrvTarget) void {
        const cFn = @extern(*const fn (*SrvTarget) callconv(.c) void, .{ .name = "g_srv_target_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHostname(self: *SrvTarget) [*:0]u8 {
        const cFn = @extern(*const fn (*SrvTarget) callconv(.c) [*:0]u8, .{ .name = "g_srv_target_get_hostname" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPort(self: *SrvTarget) u16 {
        const cFn = @extern(*const fn (*SrvTarget) callconv(.c) u16, .{ .name = "g_srv_target_get_port" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPriority(self: *SrvTarget) u16 {
        const cFn = @extern(*const fn (*SrvTarget) callconv(.c) u16, .{ .name = "g_srv_target_get_priority" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWeight(self: *SrvTarget) u16 {
        const cFn = @extern(*const fn (*SrvTarget) callconv(.c) u16, .{ .name = "g_srv_target_get_weight" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_srv_target_get_type" });
        return cFn();
    }
};
pub const StaticResource = extern struct {
    data: ?*u8,
    data_len: u64,
    resource: ?*Resource,
    next: ?*StaticResource,
    padding: ?*anyopaque,
    pub fn fini(self: *StaticResource) void {
        const cFn = @extern(*const fn (*StaticResource) callconv(.c) void, .{ .name = "g_static_resource_fini" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getResource(self: *StaticResource) *Resource {
        const cFn = @extern(*const fn (*StaticResource) callconv(.c) *Resource, .{ .name = "g_static_resource_get_resource" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *StaticResource) void {
        const cFn = @extern(*const fn (*StaticResource) callconv(.c) void, .{ .name = "g_static_resource_init" });
        const ret = cFn(self);
        return ret;
    }
};
pub const Subprocess = struct {
    pub const Interfaces = [_]type{Initable};
    pub const Parent = GObject.Object;
    _props: struct {
        argv: core.Property([*]?[*:0]const u8, "argv") = .{},
        flags: core.Property(SubprocessFlags, "flags") = .{},
    },
    pub fn new(arg_argv: [*]?[*:0]const u8, arg_flags: SubprocessFlags, arg_error: *?*GLib.Error) error{GError}!*Subprocess {
        const cFn = @extern(*const fn ([*]?[*:0]const u8, SubprocessFlags, *?*GLib.Error) callconv(.c) *Subprocess, .{ .name = "g_subprocess_newv" });
        const ret = cFn(arg_argv, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn communicate(self: *Subprocess, arg_stdin_buf: ?*GLib.Bytes, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        stdout_buf: ?*GLib.Bytes,
        stderr_buf: ?*GLib.Bytes,
    } {
        var argO_stdout_buf: ?*GLib.Bytes = undefined;
        const arg_stdout_buf: ?*?*GLib.Bytes = &argO_stdout_buf;
        var argO_stderr_buf: ?*GLib.Bytes = undefined;
        const arg_stderr_buf: ?*?*GLib.Bytes = &argO_stderr_buf;
        const cFn = @extern(*const fn (*Subprocess, ?*GLib.Bytes, ?*Cancellable, ?*?*GLib.Bytes, ?*?*GLib.Bytes, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_subprocess_communicate" });
        const ret = cFn(self, arg_stdin_buf, arg_cancellable, arg_stdout_buf, arg_stderr_buf, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .stdout_buf = argO_stdout_buf, .stderr_buf = argO_stderr_buf };
    }
    pub fn communicateAsync(self: *Subprocess, arg_stdin_buf: ?*GLib.Bytes, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Subprocess, ?*GLib.Bytes, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_subprocess_communicate_async" });
        const ret = cFn(self, arg_stdin_buf, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn communicateFinish(self: *Subprocess, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        stdout_buf: ?*GLib.Bytes,
        stderr_buf: ?*GLib.Bytes,
    } {
        var argO_stdout_buf: ?*GLib.Bytes = undefined;
        const arg_stdout_buf: ?*?*GLib.Bytes = &argO_stdout_buf;
        var argO_stderr_buf: ?*GLib.Bytes = undefined;
        const arg_stderr_buf: ?*?*GLib.Bytes = &argO_stderr_buf;
        const cFn = @extern(*const fn (*Subprocess, *AsyncResult, ?*?*GLib.Bytes, ?*?*GLib.Bytes, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_subprocess_communicate_finish" });
        const ret = cFn(self, arg_result, arg_stdout_buf, arg_stderr_buf, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .stdout_buf = argO_stdout_buf, .stderr_buf = argO_stderr_buf };
    }
    pub fn communicateUtf8(self: *Subprocess, arg_stdin_buf: ?[*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        stdout_buf: ?[*:0]u8,
        stderr_buf: ?[*:0]u8,
    } {
        var argO_stdout_buf: ?[*:0]u8 = undefined;
        const arg_stdout_buf: ?*?[*:0]u8 = &argO_stdout_buf;
        var argO_stderr_buf: ?[*:0]u8 = undefined;
        const arg_stderr_buf: ?*?[*:0]u8 = &argO_stderr_buf;
        const cFn = @extern(*const fn (*Subprocess, ?[*:0]const u8, ?*Cancellable, ?*?[*:0]u8, ?*?[*:0]u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_subprocess_communicate_utf8" });
        const ret = cFn(self, arg_stdin_buf, arg_cancellable, arg_stdout_buf, arg_stderr_buf, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .stdout_buf = argO_stdout_buf, .stderr_buf = argO_stderr_buf };
    }
    pub fn communicateUtf8Async(self: *Subprocess, arg_stdin_buf: ?[*:0]const u8, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Subprocess, ?[*:0]const u8, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_subprocess_communicate_utf8_async" });
        const ret = cFn(self, arg_stdin_buf, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn communicateUtf8Finish(self: *Subprocess, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        stdout_buf: ?[*:0]u8,
        stderr_buf: ?[*:0]u8,
    } {
        var argO_stdout_buf: ?[*:0]u8 = undefined;
        const arg_stdout_buf: ?*?[*:0]u8 = &argO_stdout_buf;
        var argO_stderr_buf: ?[*:0]u8 = undefined;
        const arg_stderr_buf: ?*?[*:0]u8 = &argO_stderr_buf;
        const cFn = @extern(*const fn (*Subprocess, *AsyncResult, ?*?[*:0]u8, ?*?[*:0]u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_subprocess_communicate_utf8_finish" });
        const ret = cFn(self, arg_result, arg_stdout_buf, arg_stderr_buf, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .stdout_buf = argO_stdout_buf, .stderr_buf = argO_stderr_buf };
    }
    pub fn forceExit(self: *Subprocess) void {
        const cFn = @extern(*const fn (*Subprocess) callconv(.c) void, .{ .name = "g_subprocess_force_exit" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getExitStatus(self: *Subprocess) i32 {
        const cFn = @extern(*const fn (*Subprocess) callconv(.c) i32, .{ .name = "g_subprocess_get_exit_status" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIdentifier(self: *Subprocess) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Subprocess) callconv(.c) ?[*:0]u8, .{ .name = "g_subprocess_get_identifier" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIfExited(self: *Subprocess) bool {
        const cFn = @extern(*const fn (*Subprocess) callconv(.c) bool, .{ .name = "g_subprocess_get_if_exited" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIfSignaled(self: *Subprocess) bool {
        const cFn = @extern(*const fn (*Subprocess) callconv(.c) bool, .{ .name = "g_subprocess_get_if_signaled" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStatus(self: *Subprocess) i32 {
        const cFn = @extern(*const fn (*Subprocess) callconv(.c) i32, .{ .name = "g_subprocess_get_status" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStderrPipe(self: *Subprocess) ?*InputStream {
        const cFn = @extern(*const fn (*Subprocess) callconv(.c) ?*InputStream, .{ .name = "g_subprocess_get_stderr_pipe" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStdinPipe(self: *Subprocess) ?*OutputStream {
        const cFn = @extern(*const fn (*Subprocess) callconv(.c) ?*OutputStream, .{ .name = "g_subprocess_get_stdin_pipe" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStdoutPipe(self: *Subprocess) ?*InputStream {
        const cFn = @extern(*const fn (*Subprocess) callconv(.c) ?*InputStream, .{ .name = "g_subprocess_get_stdout_pipe" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSuccessful(self: *Subprocess) bool {
        const cFn = @extern(*const fn (*Subprocess) callconv(.c) bool, .{ .name = "g_subprocess_get_successful" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTermSig(self: *Subprocess) i32 {
        const cFn = @extern(*const fn (*Subprocess) callconv(.c) i32, .{ .name = "g_subprocess_get_term_sig" });
        const ret = cFn(self);
        return ret;
    }
    pub fn sendSignal(self: *Subprocess, arg_signal_num: i32) void {
        const cFn = @extern(*const fn (*Subprocess, i32) callconv(.c) void, .{ .name = "g_subprocess_send_signal" });
        const ret = cFn(self, arg_signal_num);
        return ret;
    }
    pub fn wait(self: *Subprocess, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Subprocess, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_subprocess_wait" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn waitAsync(self: *Subprocess, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Subprocess, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_subprocess_wait_async" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn waitCheck(self: *Subprocess, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Subprocess, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_subprocess_wait_check" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn waitCheckAsync(self: *Subprocess, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Subprocess, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_subprocess_wait_check_async" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn waitCheckFinish(self: *Subprocess, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Subprocess, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_subprocess_wait_check_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn waitFinish(self: *Subprocess, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Subprocess, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_subprocess_wait_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_subprocess_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const SubprocessFlags = packed struct(u32) {
    stdin_pipe: bool = false,
    stdin_inherit: bool = false,
    stdout_pipe: bool = false,
    stdout_silence: bool = false,
    stderr_pipe: bool = false,
    stderr_silence: bool = false,
    stderr_merge: bool = false,
    inherit_fds: bool = false,
    search_path_from_envp: bool = false,
    _: u23 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_subprocess_flags_get_type" });
        return cFn();
    }
};
pub const SubprocessLauncher = struct {
    pub const Parent = GObject.Object;
    _props: struct {
        flags: core.Property(SubprocessFlags, "flags") = .{},
    },
    pub fn new(arg_flags: SubprocessFlags) *SubprocessLauncher {
        const cFn = @extern(*const fn (SubprocessFlags) callconv(.c) *SubprocessLauncher, .{ .name = "g_subprocess_launcher_new" });
        const ret = cFn(arg_flags);
        return ret;
    }
    pub fn close(self: *SubprocessLauncher) void {
        const cFn = @extern(*const fn (*SubprocessLauncher) callconv(.c) void, .{ .name = "g_subprocess_launcher_close" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getenv(self: *SubprocessLauncher, arg_variable: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (*SubprocessLauncher, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_subprocess_launcher_getenv" });
        const ret = cFn(self, arg_variable);
        return ret;
    }
    pub fn setCwd(self: *SubprocessLauncher, arg_cwd: [*:0]const u8) void {
        const cFn = @extern(*const fn (*SubprocessLauncher, [*:0]const u8) callconv(.c) void, .{ .name = "g_subprocess_launcher_set_cwd" });
        const ret = cFn(self, arg_cwd);
        return ret;
    }
    pub fn setEnviron(self: *SubprocessLauncher, arg_env: [*]?[*:0]const u8) void {
        const cFn = @extern(*const fn (*SubprocessLauncher, [*]?[*:0]const u8) callconv(.c) void, .{ .name = "g_subprocess_launcher_set_environ" });
        const ret = cFn(self, arg_env);
        return ret;
    }
    pub fn setFlags(self: *SubprocessLauncher, arg_flags: SubprocessFlags) void {
        const cFn = @extern(*const fn (*SubprocessLauncher, SubprocessFlags) callconv(.c) void, .{ .name = "g_subprocess_launcher_set_flags" });
        const ret = cFn(self, arg_flags);
        return ret;
    }
    pub fn setStderrFilePath(self: *SubprocessLauncher, arg_path: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*SubprocessLauncher, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_subprocess_launcher_set_stderr_file_path" });
        const ret = cFn(self, arg_path);
        return ret;
    }
    pub fn setStdinFilePath(self: *SubprocessLauncher, arg_path: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*SubprocessLauncher, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_subprocess_launcher_set_stdin_file_path" });
        const ret = cFn(self, arg_path);
        return ret;
    }
    pub fn setStdoutFilePath(self: *SubprocessLauncher, arg_path: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*SubprocessLauncher, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_subprocess_launcher_set_stdout_file_path" });
        const ret = cFn(self, arg_path);
        return ret;
    }
    pub fn setenv(self: *SubprocessLauncher, arg_variable: [*:0]const u8, arg_value: [*:0]const u8, arg_overwrite: bool) void {
        const cFn = @extern(*const fn (*SubprocessLauncher, [*:0]const u8, [*:0]const u8, bool) callconv(.c) void, .{ .name = "g_subprocess_launcher_setenv" });
        const ret = cFn(self, arg_variable, arg_value, arg_overwrite);
        return ret;
    }
    pub fn spawnv(self: *SubprocessLauncher, arg_argv: [*]?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*Subprocess {
        const cFn = @extern(*const fn (*SubprocessLauncher, [*]?[*:0]const u8, *?*GLib.Error) callconv(.c) *Subprocess, .{ .name = "g_subprocess_launcher_spawnv" });
        const ret = cFn(self, arg_argv, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn takeFd(self: *SubprocessLauncher, arg_source_fd: i32, arg_target_fd: i32) void {
        const cFn = @extern(*const fn (*SubprocessLauncher, i32, i32) callconv(.c) void, .{ .name = "g_subprocess_launcher_take_fd" });
        const ret = cFn(self, arg_source_fd, arg_target_fd);
        return ret;
    }
    pub fn takeStderrFd(self: *SubprocessLauncher, arg_fd: i32) void {
        const cFn = @extern(*const fn (*SubprocessLauncher, i32) callconv(.c) void, .{ .name = "g_subprocess_launcher_take_stderr_fd" });
        const ret = cFn(self, arg_fd);
        return ret;
    }
    pub fn takeStdinFd(self: *SubprocessLauncher, arg_fd: i32) void {
        const cFn = @extern(*const fn (*SubprocessLauncher, i32) callconv(.c) void, .{ .name = "g_subprocess_launcher_take_stdin_fd" });
        const ret = cFn(self, arg_fd);
        return ret;
    }
    pub fn takeStdoutFd(self: *SubprocessLauncher, arg_fd: i32) void {
        const cFn = @extern(*const fn (*SubprocessLauncher, i32) callconv(.c) void, .{ .name = "g_subprocess_launcher_take_stdout_fd" });
        const ret = cFn(self, arg_fd);
        return ret;
    }
    pub fn unsetenv(self: *SubprocessLauncher, arg_variable: [*:0]const u8) void {
        const cFn = @extern(*const fn (*SubprocessLauncher, [*:0]const u8) callconv(.c) void, .{ .name = "g_subprocess_launcher_unsetenv" });
        const ret = cFn(self, arg_variable);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_subprocess_launcher_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TLS_BACKEND_EXTENSION_POINT_NAME = "gio-tls-backend";
pub const TLS_DATABASE_PURPOSE_AUTHENTICATE_CLIENT = "1.3.6.1.5.5.7.3.2";
pub const TLS_DATABASE_PURPOSE_AUTHENTICATE_SERVER = "1.3.6.1.5.5.7.3.1";
pub const Task = struct {
    pub const Interfaces = [_]type{AsyncResult};
    pub const Parent = GObject.Object;
    pub const Class = TaskClass;
    _props: struct {
        completed: core.Property(bool, "completed") = .{},
    },
    pub fn new(arg_source_object: ?*GObject.Object, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) *Task {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_callback_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (?*GObject.Object, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) *Task, .{ .name = "g_task_new" });
        const ret = cFn(arg_source_object, arg_cancellable, arg_callback, @ptrCast(arg_callback_data));
        return ret;
    }
    pub fn isValid(arg_result: *AsyncResult, arg_source_object: ?*GObject.Object) bool {
        const cFn = @extern(*const fn (*AsyncResult, ?*GObject.Object) callconv(.c) bool, .{ .name = "g_task_is_valid" });
        const ret = cFn(arg_result, arg_source_object);
        return ret;
    }
    pub fn reportError(arg_source_object: ?*GObject.Object, argC_callback: core.Closure(?AsyncReadyCallback), arg_source_tag: ?*anyopaque, arg_error: *GLib.Error) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_callback_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (?*GObject.Object, ?AsyncReadyCallback, ?*anyopaque, ?*anyopaque, *GLib.Error) callconv(.c) void, .{ .name = "g_task_report_error" });
        const ret = cFn(arg_source_object, arg_callback, @ptrCast(arg_callback_data), @ptrCast(arg_source_tag), arg_error);
        return ret;
    }
    pub fn getCancellable(self: *Task) ?*Cancellable {
        const cFn = @extern(*const fn (*Task) callconv(.c) ?*Cancellable, .{ .name = "g_task_get_cancellable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCheckCancellable(self: *Task) bool {
        const cFn = @extern(*const fn (*Task) callconv(.c) bool, .{ .name = "g_task_get_check_cancellable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCompleted(self: *Task) bool {
        const cFn = @extern(*const fn (*Task) callconv(.c) bool, .{ .name = "g_task_get_completed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getContext(self: *Task) *GLib.MainContext {
        const cFn = @extern(*const fn (*Task) callconv(.c) *GLib.MainContext, .{ .name = "g_task_get_context" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getName(self: *Task) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Task) callconv(.c) ?[*:0]u8, .{ .name = "g_task_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPriority(self: *Task) i32 {
        const cFn = @extern(*const fn (*Task) callconv(.c) i32, .{ .name = "g_task_get_priority" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getReturnOnCancel(self: *Task) bool {
        const cFn = @extern(*const fn (*Task) callconv(.c) bool, .{ .name = "g_task_get_return_on_cancel" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSourceObject(self: *Task) ?*GObject.Object {
        const cFn = @extern(*const fn (*Task) callconv(.c) ?*GObject.Object, .{ .name = "g_task_get_source_object" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSourceTag(self: *Task) ?*anyopaque {
        const cFn = @extern(*const fn (*Task) callconv(.c) ?*anyopaque, .{ .name = "g_task_get_source_tag" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTaskData(self: *Task) ?*anyopaque {
        const cFn = @extern(*const fn (*Task) callconv(.c) ?*anyopaque, .{ .name = "g_task_get_task_data" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hadError(self: *Task) bool {
        const cFn = @extern(*const fn (*Task) callconv(.c) bool, .{ .name = "g_task_had_error" });
        const ret = cFn(self);
        return ret;
    }
    pub fn propagateBoolean(self: *Task, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Task, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_task_propagate_boolean" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn propagateInt(self: *Task, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*Task, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_task_propagate_int" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn propagatePointer(self: *Task, arg_error: *?*GLib.Error) error{GError}!?*anyopaque {
        const cFn = @extern(*const fn (*Task, *?*GLib.Error) callconv(.c) ?*anyopaque, .{ .name = "g_task_propagate_pointer" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn propagateValue(self: *Task, arg_value: *GObject.Value, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Task, *GObject.Value, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_task_propagate_value" });
        const ret = cFn(self, arg_value, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn returnBoolean(self: *Task, arg_result: bool) void {
        const cFn = @extern(*const fn (*Task, bool) callconv(.c) void, .{ .name = "g_task_return_boolean" });
        const ret = cFn(self, arg_result);
        return ret;
    }
    pub fn returnError(self: *Task, arg_error: *GLib.Error) void {
        const cFn = @extern(*const fn (*Task, *GLib.Error) callconv(.c) void, .{ .name = "g_task_return_error" });
        const ret = cFn(self, arg_error);
        return ret;
    }
    pub fn returnErrorIfCancelled(self: *Task) bool {
        const cFn = @extern(*const fn (*Task) callconv(.c) bool, .{ .name = "g_task_return_error_if_cancelled" });
        const ret = cFn(self);
        return ret;
    }
    pub fn returnInt(self: *Task, arg_result: i64) void {
        const cFn = @extern(*const fn (*Task, i64) callconv(.c) void, .{ .name = "g_task_return_int" });
        const ret = cFn(self, arg_result);
        return ret;
    }
    pub fn returnNewErrorLiteral(self: *Task, arg_domain: u32, arg_code: i32, arg_message: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Task, u32, i32, [*:0]const u8) callconv(.c) void, .{ .name = "g_task_return_new_error_literal" });
        const ret = cFn(self, arg_domain, arg_code, arg_message);
        return ret;
    }
    pub fn returnPointer(self: *Task, arg_result: ?*anyopaque, arg_result_destroy: ?GLib.DestroyNotify) void {
        const cFn = @extern(*const fn (*Task, ?*anyopaque, ?GLib.DestroyNotify) callconv(.c) void, .{ .name = "g_task_return_pointer" });
        const ret = cFn(self, @ptrCast(arg_result), arg_result_destroy);
        return ret;
    }
    pub fn returnValue(self: *Task, arg_result: ?*GObject.Value) void {
        const cFn = @extern(*const fn (*Task, ?*GObject.Value) callconv(.c) void, .{ .name = "g_task_return_value" });
        const ret = cFn(self, arg_result);
        return ret;
    }
    pub fn runInThread(self: *Task, arg_task_func: TaskThreadFunc) void {
        const cFn = @extern(*const fn (*Task, TaskThreadFunc) callconv(.c) void, .{ .name = "g_task_run_in_thread" });
        const ret = cFn(self, arg_task_func);
        return ret;
    }
    pub fn runInThreadSync(self: *Task, arg_task_func: TaskThreadFunc) void {
        const cFn = @extern(*const fn (*Task, TaskThreadFunc) callconv(.c) void, .{ .name = "g_task_run_in_thread_sync" });
        const ret = cFn(self, arg_task_func);
        return ret;
    }
    pub fn setCheckCancellable(self: *Task, arg_check_cancellable: bool) void {
        const cFn = @extern(*const fn (*Task, bool) callconv(.c) void, .{ .name = "g_task_set_check_cancellable" });
        const ret = cFn(self, arg_check_cancellable);
        return ret;
    }
    pub fn setName(self: *Task, arg_name: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Task, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_task_set_name" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn setPriority(self: *Task, arg_priority: i32) void {
        const cFn = @extern(*const fn (*Task, i32) callconv(.c) void, .{ .name = "g_task_set_priority" });
        const ret = cFn(self, arg_priority);
        return ret;
    }
    pub fn setReturnOnCancel(self: *Task, arg_return_on_cancel: bool) bool {
        const cFn = @extern(*const fn (*Task, bool) callconv(.c) bool, .{ .name = "g_task_set_return_on_cancel" });
        const ret = cFn(self, arg_return_on_cancel);
        return ret;
    }
    pub fn setSourceTag(self: *Task, arg_source_tag: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Task, ?*anyopaque) callconv(.c) void, .{ .name = "g_task_set_source_tag" });
        const ret = cFn(self, @ptrCast(arg_source_tag));
        return ret;
    }
    pub fn setStaticName(self: *Task, arg_name: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*Task, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_task_set_static_name" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn setTaskData(self: *Task, arg_task_data: ?*anyopaque, arg_task_data_destroy: ?GLib.DestroyNotify) void {
        const cFn = @extern(*const fn (*Task, ?*anyopaque, ?GLib.DestroyNotify) callconv(.c) void, .{ .name = "g_task_set_task_data" });
        const ret = cFn(self, @ptrCast(arg_task_data), arg_task_data_destroy);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_task_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TaskClass = opaque {};
pub const TaskThreadFunc = *const fn (arg_task: *Task, arg_source_object: *GObject.Object, arg_task_data: ?*anyopaque, arg_cancellable: ?*Cancellable) callconv(.c) void;
pub const TcpConnection = extern struct {
    pub const Parent = SocketConnection;
    pub const Class = TcpConnectionClass;
    _props: struct {
        @"graceful-disconnect": core.Property(bool, "graceful-disconnect") = .{},
    },
    parent_instance: SocketConnection,
    priv: ?*TcpConnectionPrivate,
    pub fn getGracefulDisconnect(self: *TcpConnection) bool {
        const cFn = @extern(*const fn (*TcpConnection) callconv(.c) bool, .{ .name = "g_tcp_connection_get_graceful_disconnect" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setGracefulDisconnect(self: *TcpConnection, arg_graceful_disconnect: bool) void {
        const cFn = @extern(*const fn (*TcpConnection, bool) callconv(.c) void, .{ .name = "g_tcp_connection_set_graceful_disconnect" });
        const ret = cFn(self, arg_graceful_disconnect);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tcp_connection_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TcpConnectionClass = extern struct {
    parent_class: SocketConnectionClass,
};
pub const TcpConnectionPrivate = opaque {};
pub const TcpWrapperConnection = extern struct {
    pub const Parent = TcpConnection;
    pub const Class = TcpWrapperConnectionClass;
    _props: struct {
        @"base-io-stream": core.Property(IOStream, "base-io-stream") = .{},
    },
    parent_instance: TcpConnection,
    priv: ?*TcpWrapperConnectionPrivate,
    pub fn new(arg_base_io_stream: *IOStream, arg_socket: *Socket) *TcpWrapperConnection {
        const cFn = @extern(*const fn (*IOStream, *Socket) callconv(.c) *TcpWrapperConnection, .{ .name = "g_tcp_wrapper_connection_new" });
        const ret = cFn(arg_base_io_stream, arg_socket);
        return ret;
    }
    pub fn getBaseIoStream(self: *TcpWrapperConnection) *IOStream {
        const cFn = @extern(*const fn (*TcpWrapperConnection) callconv(.c) *IOStream, .{ .name = "g_tcp_wrapper_connection_get_base_io_stream" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tcp_wrapper_connection_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TcpWrapperConnectionClass = extern struct {
    parent_class: TcpConnectionClass,
};
pub const TcpWrapperConnectionPrivate = opaque {};
pub const TestDBus = struct {
    pub const Parent = GObject.Object;
    _props: struct {
        flags: core.Property(TestDBusFlags, "flags") = .{},
    },
    pub fn new(arg_flags: TestDBusFlags) *TestDBus {
        const cFn = @extern(*const fn (TestDBusFlags) callconv(.c) *TestDBus, .{ .name = "g_test_dbus_new" });
        const ret = cFn(arg_flags);
        return ret;
    }
    pub fn unset() void {
        const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_test_dbus_unset" });
        const ret = cFn();
        return ret;
    }
    pub fn addServiceDir(self: *TestDBus, arg_path: [*:0]const u8) void {
        const cFn = @extern(*const fn (*TestDBus, [*:0]const u8) callconv(.c) void, .{ .name = "g_test_dbus_add_service_dir" });
        const ret = cFn(self, arg_path);
        return ret;
    }
    pub fn down(self: *TestDBus) void {
        const cFn = @extern(*const fn (*TestDBus) callconv(.c) void, .{ .name = "g_test_dbus_down" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBusAddress(self: *TestDBus) ?[*:0]u8 {
        const cFn = @extern(*const fn (*TestDBus) callconv(.c) ?[*:0]u8, .{ .name = "g_test_dbus_get_bus_address" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFlags(self: *TestDBus) TestDBusFlags {
        const cFn = @extern(*const fn (*TestDBus) callconv(.c) TestDBusFlags, .{ .name = "g_test_dbus_get_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn stop(self: *TestDBus) void {
        const cFn = @extern(*const fn (*TestDBus) callconv(.c) void, .{ .name = "g_test_dbus_stop" });
        const ret = cFn(self);
        return ret;
    }
    pub fn up(self: *TestDBus) void {
        const cFn = @extern(*const fn (*TestDBus) callconv(.c) void, .{ .name = "g_test_dbus_up" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_test_dbus_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TestDBusFlags = packed struct(u32) {
    _: u32 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_test_dbus_flags_get_type" });
        return cFn();
    }
};
pub const ThemedIcon = struct {
    pub const Interfaces = [_]type{Icon};
    pub const Parent = GObject.Object;
    pub const Class = ThemedIconClass;
    _props: struct {
        name: core.Property([*:0]const u8, "name") = .{},
        names: core.Property([*]?[*:0]const u8, "names") = .{},
        @"use-default-fallbacks": core.Property(bool, "use-default-fallbacks") = .{},
    },
    pub fn new(arg_iconname: [*:0]const u8) *ThemedIcon {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *ThemedIcon, .{ .name = "g_themed_icon_new" });
        const ret = cFn(arg_iconname);
        return ret;
    }
    pub fn newFromNames(argS_iconnames: [][*:0]const u8) *ThemedIcon {
        const arg_iconnames: [*][*:0]const u8 = @ptrCast(argS_iconnames);
        const arg_len: i32 = @intCast((argS_iconnames).len);
        const cFn = @extern(*const fn ([*][*:0]const u8, i32) callconv(.c) *ThemedIcon, .{ .name = "g_themed_icon_new_from_names" });
        const ret = cFn(arg_iconnames, arg_len);
        return ret;
    }
    pub fn newWithDefaultFallbacks(arg_iconname: [*:0]const u8) *ThemedIcon {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *ThemedIcon, .{ .name = "g_themed_icon_new_with_default_fallbacks" });
        const ret = cFn(arg_iconname);
        return ret;
    }
    pub fn appendName(self: *ThemedIcon, arg_iconname: [*:0]const u8) void {
        const cFn = @extern(*const fn (*ThemedIcon, [*:0]const u8) callconv(.c) void, .{ .name = "g_themed_icon_append_name" });
        const ret = cFn(self, arg_iconname);
        return ret;
    }
    pub fn getNames(self: *ThemedIcon) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*ThemedIcon) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_themed_icon_get_names" });
        const ret = cFn(self);
        return ret;
    }
    pub fn prependName(self: *ThemedIcon, arg_iconname: [*:0]const u8) void {
        const cFn = @extern(*const fn (*ThemedIcon, [*:0]const u8) callconv(.c) void, .{ .name = "g_themed_icon_prepend_name" });
        const ret = cFn(self, arg_iconname);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_themed_icon_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ThemedIconClass = opaque {};
pub const ThreadedResolver = struct {
    pub const Parent = Resolver;
    pub const Class = ThreadedResolverClass;
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_threaded_resolver_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ThreadedResolverClass = extern struct {
    parent_class: ResolverClass,
};
pub const ThreadedSocketService = extern struct {
    pub const Parent = SocketService;
    pub const Class = ThreadedSocketServiceClass;
    _props: struct {
        @"max-threads": core.Property(i32, "max-threads") = .{},
    },
    _signals: struct {
        run: core.Signal(fn (*ThreadedSocketService, *SocketConnection, ?*GObject.Object) bool, "run") = .{},
    },
    parent_instance: SocketService,
    priv: ?*ThreadedSocketServicePrivate,
    pub fn new(arg_max_threads: i32) *ThreadedSocketService {
        const cFn = @extern(*const fn (i32) callconv(.c) *ThreadedSocketService, .{ .name = "g_threaded_socket_service_new" });
        const ret = cFn(arg_max_threads);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_threaded_socket_service_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ThreadedSocketServiceClass = extern struct {
    parent_class: SocketServiceClass,
    run: ?*const fn (arg_service: *ThreadedSocketService, arg_connection: *SocketConnection, arg_source_object: *GObject.Object) callconv(.c) bool,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const ThreadedSocketServicePrivate = opaque {};
pub const TlsAuthenticationMode = enum(u32) {
    none = 0,
    requested = 1,
    required = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_authentication_mode_get_type" });
        return cFn();
    }
};
pub const TlsBackend = struct {
    pub const Class = TlsBackendInterface;
    pub fn getDefault() *TlsBackend {
        const cFn = @extern(*const fn () callconv(.c) *TlsBackend, .{ .name = "g_tls_backend_get_default" });
        const ret = cFn();
        return ret;
    }
    pub fn getCertificateType(self: *TlsBackend) core.Type {
        const cFn = @extern(*const fn (*TlsBackend) callconv(.c) core.Type, .{ .name = "g_tls_backend_get_certificate_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getClientConnectionType(self: *TlsBackend) core.Type {
        const cFn = @extern(*const fn (*TlsBackend) callconv(.c) core.Type, .{ .name = "g_tls_backend_get_client_connection_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDefaultDatabase(self: *TlsBackend) *TlsDatabase {
        const cFn = @extern(*const fn (*TlsBackend) callconv(.c) *TlsDatabase, .{ .name = "g_tls_backend_get_default_database" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDtlsClientConnectionType(self: *TlsBackend) core.Type {
        const cFn = @extern(*const fn (*TlsBackend) callconv(.c) core.Type, .{ .name = "g_tls_backend_get_dtls_client_connection_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDtlsServerConnectionType(self: *TlsBackend) core.Type {
        const cFn = @extern(*const fn (*TlsBackend) callconv(.c) core.Type, .{ .name = "g_tls_backend_get_dtls_server_connection_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFileDatabaseType(self: *TlsBackend) core.Type {
        const cFn = @extern(*const fn (*TlsBackend) callconv(.c) core.Type, .{ .name = "g_tls_backend_get_file_database_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getServerConnectionType(self: *TlsBackend) core.Type {
        const cFn = @extern(*const fn (*TlsBackend) callconv(.c) core.Type, .{ .name = "g_tls_backend_get_server_connection_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setDefaultDatabase(self: *TlsBackend, arg_database: ?*TlsDatabase) void {
        const cFn = @extern(*const fn (*TlsBackend, ?*TlsDatabase) callconv(.c) void, .{ .name = "g_tls_backend_set_default_database" });
        const ret = cFn(self, arg_database);
        return ret;
    }
    pub fn supportsDtls(self: *TlsBackend) bool {
        const cFn = @extern(*const fn (*TlsBackend) callconv(.c) bool, .{ .name = "g_tls_backend_supports_dtls" });
        const ret = cFn(self);
        return ret;
    }
    pub fn supportsTls(self: *TlsBackend) bool {
        const cFn = @extern(*const fn (*TlsBackend) callconv(.c) bool, .{ .name = "g_tls_backend_supports_tls" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_backend_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TlsBackendInterface = extern struct {
    g_iface: GObject.TypeInterface,
    supports_tls: ?*const fn (arg_backend: *TlsBackend) callconv(.c) bool,
    get_certificate_type: ?*const fn () callconv(.c) core.Type,
    get_client_connection_type: ?*const fn () callconv(.c) core.Type,
    get_server_connection_type: ?*const fn () callconv(.c) core.Type,
    get_file_database_type: ?*const fn () callconv(.c) core.Type,
    get_default_database: ?*const fn (arg_backend: *TlsBackend) callconv(.c) *TlsDatabase,
    supports_dtls: ?*const fn (arg_backend: *TlsBackend) callconv(.c) bool,
    get_dtls_client_connection_type: ?*const fn () callconv(.c) core.Type,
    get_dtls_server_connection_type: ?*const fn () callconv(.c) core.Type,
};
pub const TlsCertificate = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = TlsCertificateClass;
    _props: struct {
        certificate: core.Property(*GLib.ByteArray, "certificate") = .{},
        @"certificate-pem": core.Property([*:0]const u8, "certificate-pem") = .{},
        @"dns-names": core.Property(*GLib.PtrArray, "dns-names") = .{},
        @"ip-addresses": core.Property(*GLib.PtrArray, "ip-addresses") = .{},
        issuer: core.Property(TlsCertificate, "issuer") = .{},
        @"issuer-name": core.Property([*:0]const u8, "issuer-name") = .{},
        @"not-valid-after": core.Property(GLib.DateTime, "not-valid-after") = .{},
        @"not-valid-before": core.Property(GLib.DateTime, "not-valid-before") = .{},
        password: core.Property([*:0]const u8, "password") = .{},
        @"pkcs11-uri": core.Property([*:0]const u8, "pkcs11-uri") = .{},
        @"pkcs12-data": core.Property(*GLib.ByteArray, "pkcs12-data") = .{},
        @"private-key": core.Property(*GLib.ByteArray, "private-key") = .{},
        @"private-key-pem": core.Property([*:0]const u8, "private-key-pem") = .{},
        @"private-key-pkcs11-uri": core.Property([*:0]const u8, "private-key-pkcs11-uri") = .{},
        @"subject-name": core.Property([*:0]const u8, "subject-name") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*TlsCertificatePrivate,
    pub fn newFromFile(arg_file: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*TlsCertificate {
        const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) *TlsCertificate, .{ .name = "g_tls_certificate_new_from_file" });
        const ret = cFn(arg_file, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromFileWithPassword(arg_file: [*:0]const u8, arg_password: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*TlsCertificate {
        const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) *TlsCertificate, .{ .name = "g_tls_certificate_new_from_file_with_password" });
        const ret = cFn(arg_file, arg_password, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromFiles(arg_cert_file: [*:0]const u8, arg_key_file: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*TlsCertificate {
        const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) *TlsCertificate, .{ .name = "g_tls_certificate_new_from_files" });
        const ret = cFn(arg_cert_file, arg_key_file, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromPem(arg_data: [*:0]const u8, arg_length: i64, arg_error: *?*GLib.Error) error{GError}!*TlsCertificate {
        const cFn = @extern(*const fn ([*:0]const u8, i64, *?*GLib.Error) callconv(.c) *TlsCertificate, .{ .name = "g_tls_certificate_new_from_pem" });
        const ret = cFn(arg_data, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromPkcs11Uris(arg_pkcs11_uri: [*:0]const u8, arg_private_key_pkcs11_uri: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*TlsCertificate {
        const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, *?*GLib.Error) callconv(.c) *TlsCertificate, .{ .name = "g_tls_certificate_new_from_pkcs11_uris" });
        const ret = cFn(arg_pkcs11_uri, arg_private_key_pkcs11_uri, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromPkcs12(argS_data: []u8, arg_password: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*TlsCertificate {
        const arg_data: [*]u8 = @ptrCast(argS_data);
        const arg_length: u64 = @intCast((argS_data).len);
        const cFn = @extern(*const fn ([*]u8, u64, ?[*:0]const u8, *?*GLib.Error) callconv(.c) *TlsCertificate, .{ .name = "g_tls_certificate_new_from_pkcs12" });
        const ret = cFn(arg_data, arg_length, arg_password, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn listNewFromFile(arg_file: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!?*GLib.List {
        const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) ?*GLib.List, .{ .name = "g_tls_certificate_list_new_from_file" });
        const ret = cFn(arg_file, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getDnsNames(self: *TlsCertificate) ?*GLib.PtrArray {
        const cFn = @extern(*const fn (*TlsCertificate) callconv(.c) ?*GLib.PtrArray, .{ .name = "g_tls_certificate_get_dns_names" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIpAddresses(self: *TlsCertificate) ?*GLib.PtrArray {
        const cFn = @extern(*const fn (*TlsCertificate) callconv(.c) ?*GLib.PtrArray, .{ .name = "g_tls_certificate_get_ip_addresses" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIssuer(self: *TlsCertificate) ?*TlsCertificate {
        const cFn = @extern(*const fn (*TlsCertificate) callconv(.c) ?*TlsCertificate, .{ .name = "g_tls_certificate_get_issuer" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIssuerName(self: *TlsCertificate) ?[*:0]u8 {
        const cFn = @extern(*const fn (*TlsCertificate) callconv(.c) ?[*:0]u8, .{ .name = "g_tls_certificate_get_issuer_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNotValidAfter(self: *TlsCertificate) ?*GLib.DateTime {
        const cFn = @extern(*const fn (*TlsCertificate) callconv(.c) ?*GLib.DateTime, .{ .name = "g_tls_certificate_get_not_valid_after" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNotValidBefore(self: *TlsCertificate) ?*GLib.DateTime {
        const cFn = @extern(*const fn (*TlsCertificate) callconv(.c) ?*GLib.DateTime, .{ .name = "g_tls_certificate_get_not_valid_before" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSubjectName(self: *TlsCertificate) ?[*:0]u8 {
        const cFn = @extern(*const fn (*TlsCertificate) callconv(.c) ?[*:0]u8, .{ .name = "g_tls_certificate_get_subject_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isSame(self: *TlsCertificate, arg_cert_two: *TlsCertificate) bool {
        const cFn = @extern(*const fn (*TlsCertificate, *TlsCertificate) callconv(.c) bool, .{ .name = "g_tls_certificate_is_same" });
        const ret = cFn(self, arg_cert_two);
        return ret;
    }
    pub fn verify(self: *TlsCertificate, arg_identity: ?*SocketConnectable, arg_trusted_ca: ?*TlsCertificate) TlsCertificateFlags {
        const cFn = @extern(*const fn (*TlsCertificate, ?*SocketConnectable, ?*TlsCertificate) callconv(.c) TlsCertificateFlags, .{ .name = "g_tls_certificate_verify" });
        const ret = cFn(self, arg_identity, arg_trusted_ca);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_certificate_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TlsCertificateClass = extern struct {
    parent_class: GObject.ObjectClass,
    verify: ?*const fn (arg_cert: *TlsCertificate, arg_identity: ?*SocketConnectable, arg_trusted_ca: ?*TlsCertificate) callconv(.c) TlsCertificateFlags,
    padding: [8]?*anyopaque,
};
pub const TlsCertificateFlags = packed struct(u32) {
    unknown_ca: bool = false,
    bad_identity: bool = false,
    not_activated: bool = false,
    expired: bool = false,
    revoked: bool = false,
    insecure: bool = false,
    generic_error: bool = false,
    _: u25 = 0,
    pub const validate_all: @This() = @bitCast(@as(u32, 127));
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_certificate_flags_get_type" });
        return cFn();
    }
};
pub const TlsCertificatePrivate = opaque {};
pub const TlsCertificateRequestFlags = enum(u32) {
    none = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_certificate_request_flags_get_type" });
        return cFn();
    }
};
pub const TlsChannelBindingError = enum(u32) {
    not_implemented = 0,
    invalid_state = 1,
    not_available = 2,
    not_supported = 3,
    general_error = 4,
    pub fn quark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_tls_channel_binding_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_channel_binding_error_get_type" });
        return cFn();
    }
};
pub const TlsChannelBindingType = enum(u32) {
    unique = 0,
    server_end_point = 1,
    exporter = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_channel_binding_type_get_type" });
        return cFn();
    }
};
pub const TlsClientConnection = struct {
    pub const Prerequistes = [_]type{TlsConnection};
    pub const Class = TlsClientConnectionInterface;
    _props: struct {
        @"accepted-cas": core.Property(*GLib.List, "accepted-cas") = .{},
        @"server-identity": core.Property(SocketConnectable, "server-identity") = .{},
        @"use-ssl3": core.Property(bool, "use-ssl3") = .{},
        @"validation-flags": core.Property(TlsCertificateFlags, "validation-flags") = .{},
    },
    pub fn new(arg_base_io_stream: *IOStream, arg_server_identity: ?*SocketConnectable, arg_error: *?*GLib.Error) error{GError}!*TlsClientConnection {
        const cFn = @extern(*const fn (*IOStream, ?*SocketConnectable, *?*GLib.Error) callconv(.c) *TlsClientConnection, .{ .name = "g_tls_client_connection_new" });
        const ret = cFn(arg_base_io_stream, arg_server_identity, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn copySessionState(self: *TlsClientConnection, arg_source: *TlsClientConnection) void {
        const cFn = @extern(*const fn (*TlsClientConnection, *TlsClientConnection) callconv(.c) void, .{ .name = "g_tls_client_connection_copy_session_state" });
        const ret = cFn(self, arg_source);
        return ret;
    }
    pub fn getAcceptedCas(self: *TlsClientConnection) ?*GLib.List {
        const cFn = @extern(*const fn (*TlsClientConnection) callconv(.c) ?*GLib.List, .{ .name = "g_tls_client_connection_get_accepted_cas" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getServerIdentity(self: *TlsClientConnection) ?*SocketConnectable {
        const cFn = @extern(*const fn (*TlsClientConnection) callconv(.c) ?*SocketConnectable, .{ .name = "g_tls_client_connection_get_server_identity" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUseSsl3(self: *TlsClientConnection) bool {
        const cFn = @extern(*const fn (*TlsClientConnection) callconv(.c) bool, .{ .name = "g_tls_client_connection_get_use_ssl3" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getValidationFlags(self: *TlsClientConnection) TlsCertificateFlags {
        const cFn = @extern(*const fn (*TlsClientConnection) callconv(.c) TlsCertificateFlags, .{ .name = "g_tls_client_connection_get_validation_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setServerIdentity(self: *TlsClientConnection, arg_identity: *SocketConnectable) void {
        const cFn = @extern(*const fn (*TlsClientConnection, *SocketConnectable) callconv(.c) void, .{ .name = "g_tls_client_connection_set_server_identity" });
        const ret = cFn(self, arg_identity);
        return ret;
    }
    pub fn setUseSsl3(self: *TlsClientConnection, arg_use_ssl3: bool) void {
        const cFn = @extern(*const fn (*TlsClientConnection, bool) callconv(.c) void, .{ .name = "g_tls_client_connection_set_use_ssl3" });
        const ret = cFn(self, arg_use_ssl3);
        return ret;
    }
    pub fn setValidationFlags(self: *TlsClientConnection, arg_flags: TlsCertificateFlags) void {
        const cFn = @extern(*const fn (*TlsClientConnection, TlsCertificateFlags) callconv(.c) void, .{ .name = "g_tls_client_connection_set_validation_flags" });
        const ret = cFn(self, arg_flags);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_client_connection_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TlsClientConnectionInterface = extern struct {
    g_iface: GObject.TypeInterface,
    copy_session_state: ?*const fn (arg_conn: *TlsClientConnection, arg_source: *TlsClientConnection) callconv(.c) void,
};
pub const TlsConnection = extern struct {
    pub const Parent = IOStream;
    pub const Class = TlsConnectionClass;
    _props: struct {
        @"advertised-protocols": core.Property([*]?[*:0]const u8, "advertised-protocols") = .{},
        @"base-io-stream": core.Property(IOStream, "base-io-stream") = .{},
        certificate: core.Property(TlsCertificate, "certificate") = .{},
        @"ciphersuite-name": core.Property([*:0]const u8, "ciphersuite-name") = .{},
        database: core.Property(TlsDatabase, "database") = .{},
        interaction: core.Property(TlsInteraction, "interaction") = .{},
        @"negotiated-protocol": core.Property([*:0]const u8, "negotiated-protocol") = .{},
        @"peer-certificate": core.Property(TlsCertificate, "peer-certificate") = .{},
        @"peer-certificate-errors": core.Property(TlsCertificateFlags, "peer-certificate-errors") = .{},
        @"protocol-version": core.Property(TlsProtocolVersion, "protocol-version") = .{},
        @"rehandshake-mode": core.Property(TlsRehandshakeMode, "rehandshake-mode") = .{},
        @"require-close-notify": core.Property(bool, "require-close-notify") = .{},
        @"use-system-certdb": core.Property(bool, "use-system-certdb") = .{},
    },
    _signals: struct {
        @"accept-certificate": core.Signal(fn (*TlsConnection, *TlsCertificate, TlsCertificateFlags) bool, "accept-certificate") = .{},
    },
    parent_instance: IOStream,
    priv: ?*TlsConnectionPrivate,
    pub fn emitAcceptCertificate(self: *TlsConnection, arg_peer_cert: *TlsCertificate, arg_errors: TlsCertificateFlags) bool {
        const cFn = @extern(*const fn (*TlsConnection, *TlsCertificate, TlsCertificateFlags) callconv(.c) bool, .{ .name = "g_tls_connection_emit_accept_certificate" });
        const ret = cFn(self, arg_peer_cert, arg_errors);
        return ret;
    }
    pub fn getCertificate(self: *TlsConnection) ?*TlsCertificate {
        const cFn = @extern(*const fn (*TlsConnection) callconv(.c) ?*TlsCertificate, .{ .name = "g_tls_connection_get_certificate" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getChannelBindingData(self: *TlsConnection, arg_type: TlsChannelBindingType, arg_error: *?*GLib.Error) error{GError}!?*GLib.ByteArray {
        var argO_data: ?*GLib.ByteArray = undefined;
        const arg_data: ?*GLib.ByteArray = &argO_data;
        const cFn = @extern(*const fn (*TlsConnection, TlsChannelBindingType, ?*GLib.ByteArray, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_tls_connection_get_channel_binding_data" });
        const ret = cFn(self, arg_type, arg_data, arg_error);
        if (arg_error.* != null) return error.GError;
        if (!ret) return null;
        return argO_data;
    }
    pub fn getCiphersuiteName(self: *TlsConnection) ?[*:0]u8 {
        const cFn = @extern(*const fn (*TlsConnection) callconv(.c) ?[*:0]u8, .{ .name = "g_tls_connection_get_ciphersuite_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDatabase(self: *TlsConnection) ?*TlsDatabase {
        const cFn = @extern(*const fn (*TlsConnection) callconv(.c) ?*TlsDatabase, .{ .name = "g_tls_connection_get_database" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInteraction(self: *TlsConnection) ?*TlsInteraction {
        const cFn = @extern(*const fn (*TlsConnection) callconv(.c) ?*TlsInteraction, .{ .name = "g_tls_connection_get_interaction" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNegotiatedProtocol(self: *TlsConnection) ?[*:0]u8 {
        const cFn = @extern(*const fn (*TlsConnection) callconv(.c) ?[*:0]u8, .{ .name = "g_tls_connection_get_negotiated_protocol" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPeerCertificate(self: *TlsConnection) ?*TlsCertificate {
        const cFn = @extern(*const fn (*TlsConnection) callconv(.c) ?*TlsCertificate, .{ .name = "g_tls_connection_get_peer_certificate" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPeerCertificateErrors(self: *TlsConnection) TlsCertificateFlags {
        const cFn = @extern(*const fn (*TlsConnection) callconv(.c) TlsCertificateFlags, .{ .name = "g_tls_connection_get_peer_certificate_errors" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getProtocolVersion(self: *TlsConnection) TlsProtocolVersion {
        const cFn = @extern(*const fn (*TlsConnection) callconv(.c) TlsProtocolVersion, .{ .name = "g_tls_connection_get_protocol_version" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRehandshakeMode(self: *TlsConnection) TlsRehandshakeMode {
        const cFn = @extern(*const fn (*TlsConnection) callconv(.c) TlsRehandshakeMode, .{ .name = "g_tls_connection_get_rehandshake_mode" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRequireCloseNotify(self: *TlsConnection) bool {
        const cFn = @extern(*const fn (*TlsConnection) callconv(.c) bool, .{ .name = "g_tls_connection_get_require_close_notify" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUseSystemCertdb(self: *TlsConnection) bool {
        const cFn = @extern(*const fn (*TlsConnection) callconv(.c) bool, .{ .name = "g_tls_connection_get_use_system_certdb" });
        const ret = cFn(self);
        return ret;
    }
    pub fn handshake(self: *TlsConnection, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*TlsConnection, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_tls_connection_handshake" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn handshakeAsync(self: *TlsConnection, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*TlsConnection, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_tls_connection_handshake_async" });
        const ret = cFn(self, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn handshakeFinish(self: *TlsConnection, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*TlsConnection, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_tls_connection_handshake_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setAdvertisedProtocols(self: *TlsConnection, arg_protocols: ?[*]?[*:0]const u8) void {
        const cFn = @extern(*const fn (*TlsConnection, ?[*]?[*:0]const u8) callconv(.c) void, .{ .name = "g_tls_connection_set_advertised_protocols" });
        const ret = cFn(self, arg_protocols);
        return ret;
    }
    pub fn setCertificate(self: *TlsConnection, arg_certificate: *TlsCertificate) void {
        const cFn = @extern(*const fn (*TlsConnection, *TlsCertificate) callconv(.c) void, .{ .name = "g_tls_connection_set_certificate" });
        const ret = cFn(self, arg_certificate);
        return ret;
    }
    pub fn setDatabase(self: *TlsConnection, arg_database: ?*TlsDatabase) void {
        const cFn = @extern(*const fn (*TlsConnection, ?*TlsDatabase) callconv(.c) void, .{ .name = "g_tls_connection_set_database" });
        const ret = cFn(self, arg_database);
        return ret;
    }
    pub fn setInteraction(self: *TlsConnection, arg_interaction: ?*TlsInteraction) void {
        const cFn = @extern(*const fn (*TlsConnection, ?*TlsInteraction) callconv(.c) void, .{ .name = "g_tls_connection_set_interaction" });
        const ret = cFn(self, arg_interaction);
        return ret;
    }
    pub fn setRehandshakeMode(self: *TlsConnection, arg_mode: TlsRehandshakeMode) void {
        const cFn = @extern(*const fn (*TlsConnection, TlsRehandshakeMode) callconv(.c) void, .{ .name = "g_tls_connection_set_rehandshake_mode" });
        const ret = cFn(self, arg_mode);
        return ret;
    }
    pub fn setRequireCloseNotify(self: *TlsConnection, arg_require_close_notify: bool) void {
        const cFn = @extern(*const fn (*TlsConnection, bool) callconv(.c) void, .{ .name = "g_tls_connection_set_require_close_notify" });
        const ret = cFn(self, arg_require_close_notify);
        return ret;
    }
    pub fn setUseSystemCertdb(self: *TlsConnection, arg_use_system_certdb: bool) void {
        const cFn = @extern(*const fn (*TlsConnection, bool) callconv(.c) void, .{ .name = "g_tls_connection_set_use_system_certdb" });
        const ret = cFn(self, arg_use_system_certdb);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_connection_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TlsConnectionClass = extern struct {
    parent_class: IOStreamClass,
    accept_certificate: ?*const fn (arg_connection: *TlsConnection, arg_peer_cert: *TlsCertificate, arg_errors: TlsCertificateFlags) callconv(.c) bool,
    handshake: ?*const fn (arg_conn: *TlsConnection, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    handshake_async: ?*const fn (arg_conn: *TlsConnection, arg_io_priority: i32, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    handshake_finish: ?*const fn (arg_conn: *TlsConnection, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    get_binding_data: ?*const fn (arg_conn: *TlsConnection, arg_type: TlsChannelBindingType, arg_data: *GLib.ByteArray, arg_error: *?*GLib.Error) callconv(.c) bool,
    get_negotiated_protocol: ?*const fn (arg_conn: *TlsConnection) callconv(.c) ?[*:0]u8,
    padding: [6]?*anyopaque,
};
pub const TlsConnectionPrivate = opaque {};
pub const TlsDatabase = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = TlsDatabaseClass;
    parent_instance: GObject.Object,
    priv: ?*TlsDatabasePrivate,
    pub fn createCertificateHandle(self: *TlsDatabase, arg_certificate: *TlsCertificate) ?[*:0]u8 {
        const cFn = @extern(*const fn (*TlsDatabase, *TlsCertificate) callconv(.c) ?[*:0]u8, .{ .name = "g_tls_database_create_certificate_handle" });
        const ret = cFn(self, arg_certificate);
        return ret;
    }
    pub fn lookupCertificateForHandle(self: *TlsDatabase, arg_handle: [*:0]const u8, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseLookupFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!?*TlsCertificate {
        const cFn = @extern(*const fn (*TlsDatabase, [*:0]const u8, ?*TlsInteraction, TlsDatabaseLookupFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) ?*TlsCertificate, .{ .name = "g_tls_database_lookup_certificate_for_handle" });
        const ret = cFn(self, arg_handle, arg_interaction, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn lookupCertificateForHandleAsync(self: *TlsDatabase, arg_handle: [*:0]const u8, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseLookupFlags, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*TlsDatabase, [*:0]const u8, ?*TlsInteraction, TlsDatabaseLookupFlags, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_tls_database_lookup_certificate_for_handle_async" });
        const ret = cFn(self, arg_handle, arg_interaction, arg_flags, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn lookupCertificateForHandleFinish(self: *TlsDatabase, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*TlsCertificate {
        const cFn = @extern(*const fn (*TlsDatabase, *AsyncResult, *?*GLib.Error) callconv(.c) *TlsCertificate, .{ .name = "g_tls_database_lookup_certificate_for_handle_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn lookupCertificateIssuer(self: *TlsDatabase, arg_certificate: *TlsCertificate, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseLookupFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*TlsCertificate {
        const cFn = @extern(*const fn (*TlsDatabase, *TlsCertificate, ?*TlsInteraction, TlsDatabaseLookupFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) *TlsCertificate, .{ .name = "g_tls_database_lookup_certificate_issuer" });
        const ret = cFn(self, arg_certificate, arg_interaction, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn lookupCertificateIssuerAsync(self: *TlsDatabase, arg_certificate: *TlsCertificate, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseLookupFlags, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*TlsDatabase, *TlsCertificate, ?*TlsInteraction, TlsDatabaseLookupFlags, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_tls_database_lookup_certificate_issuer_async" });
        const ret = cFn(self, arg_certificate, arg_interaction, arg_flags, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn lookupCertificateIssuerFinish(self: *TlsDatabase, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*TlsCertificate {
        const cFn = @extern(*const fn (*TlsDatabase, *AsyncResult, *?*GLib.Error) callconv(.c) *TlsCertificate, .{ .name = "g_tls_database_lookup_certificate_issuer_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn lookupCertificatesIssuedBy(self: *TlsDatabase, arg_issuer_raw_dn: *GLib.ByteArray, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseLookupFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!?*GLib.List {
        const cFn = @extern(*const fn (*TlsDatabase, *GLib.ByteArray, ?*TlsInteraction, TlsDatabaseLookupFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) ?*GLib.List, .{ .name = "g_tls_database_lookup_certificates_issued_by" });
        const ret = cFn(self, arg_issuer_raw_dn, arg_interaction, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn lookupCertificatesIssuedByAsync(self: *TlsDatabase, arg_issuer_raw_dn: *GLib.ByteArray, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseLookupFlags, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*TlsDatabase, *GLib.ByteArray, ?*TlsInteraction, TlsDatabaseLookupFlags, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_tls_database_lookup_certificates_issued_by_async" });
        const ret = cFn(self, arg_issuer_raw_dn, arg_interaction, arg_flags, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn lookupCertificatesIssuedByFinish(self: *TlsDatabase, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!?*GLib.List {
        const cFn = @extern(*const fn (*TlsDatabase, *AsyncResult, *?*GLib.Error) callconv(.c) ?*GLib.List, .{ .name = "g_tls_database_lookup_certificates_issued_by_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn verifyChain(self: *TlsDatabase, arg_chain: *TlsCertificate, arg_purpose: [*:0]const u8, arg_identity: ?*SocketConnectable, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseVerifyFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!TlsCertificateFlags {
        const cFn = @extern(*const fn (*TlsDatabase, *TlsCertificate, [*:0]const u8, ?*SocketConnectable, ?*TlsInteraction, TlsDatabaseVerifyFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) TlsCertificateFlags, .{ .name = "g_tls_database_verify_chain" });
        const ret = cFn(self, arg_chain, arg_purpose, arg_identity, arg_interaction, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn verifyChainAsync(self: *TlsDatabase, arg_chain: *TlsCertificate, arg_purpose: [*:0]const u8, arg_identity: ?*SocketConnectable, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseVerifyFlags, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*TlsDatabase, *TlsCertificate, [*:0]const u8, ?*SocketConnectable, ?*TlsInteraction, TlsDatabaseVerifyFlags, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_tls_database_verify_chain_async" });
        const ret = cFn(self, arg_chain, arg_purpose, arg_identity, arg_interaction, arg_flags, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn verifyChainFinish(self: *TlsDatabase, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!TlsCertificateFlags {
        const cFn = @extern(*const fn (*TlsDatabase, *AsyncResult, *?*GLib.Error) callconv(.c) TlsCertificateFlags, .{ .name = "g_tls_database_verify_chain_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_database_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TlsDatabaseClass = extern struct {
    parent_class: GObject.ObjectClass,
    verify_chain: ?*const fn (arg_self: *TlsDatabase, arg_chain: *TlsCertificate, arg_purpose: [*:0]const u8, arg_identity: ?*SocketConnectable, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseVerifyFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) TlsCertificateFlags,
    verify_chain_async: ?*const fn (arg_self: *TlsDatabase, arg_chain: *TlsCertificate, arg_purpose: [*:0]const u8, arg_identity: ?*SocketConnectable, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseVerifyFlags, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    verify_chain_finish: ?*const fn (arg_self: *TlsDatabase, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) TlsCertificateFlags,
    create_certificate_handle: ?*const fn (arg_self: *TlsDatabase, arg_certificate: *TlsCertificate) callconv(.c) ?[*:0]u8,
    lookup_certificate_for_handle: ?*const fn (arg_self: *TlsDatabase, arg_handle: [*:0]const u8, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseLookupFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) ?*TlsCertificate,
    lookup_certificate_for_handle_async: ?*const fn (arg_self: *TlsDatabase, arg_handle: [*:0]const u8, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseLookupFlags, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    lookup_certificate_for_handle_finish: ?*const fn (arg_self: *TlsDatabase, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *TlsCertificate,
    lookup_certificate_issuer: ?*const fn (arg_self: *TlsDatabase, arg_certificate: *TlsCertificate, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseLookupFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) *TlsCertificate,
    lookup_certificate_issuer_async: ?*const fn (arg_self: *TlsDatabase, arg_certificate: *TlsCertificate, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseLookupFlags, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    lookup_certificate_issuer_finish: ?*const fn (arg_self: *TlsDatabase, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) *TlsCertificate,
    lookup_certificates_issued_by: ?*const fn (arg_self: *TlsDatabase, arg_issuer_raw_dn: *GLib.ByteArray, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseLookupFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) ?*GLib.List,
    lookup_certificates_issued_by_async: ?*const fn (arg_self: *TlsDatabase, arg_issuer_raw_dn: *GLib.ByteArray, arg_interaction: ?*TlsInteraction, arg_flags: TlsDatabaseLookupFlags, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    lookup_certificates_issued_by_finish: ?*const fn (arg_self: *TlsDatabase, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) ?*GLib.List,
    padding: [16]?*anyopaque,
};
pub const TlsDatabaseLookupFlags = enum(u32) {
    none = 0,
    keypair = 1,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_database_lookup_flags_get_type" });
        return cFn();
    }
};
pub const TlsDatabasePrivate = opaque {};
pub const TlsDatabaseVerifyFlags = packed struct(u32) {
    _: u32 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_database_verify_flags_get_type" });
        return cFn();
    }
};
pub const TlsError = enum(u32) {
    unavailable = 0,
    misc = 1,
    bad_certificate = 2,
    not_tls = 3,
    handshake = 4,
    certificate_required = 5,
    eof = 6,
    inappropriate_fallback = 7,
    bad_certificate_password = 8,
    pub fn quark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_tls_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_error_get_type" });
        return cFn();
    }
};
pub const TlsFileDatabase = struct {
    pub const Prerequistes = [_]type{TlsDatabase};
    pub const Class = TlsFileDatabaseInterface;
    _props: struct {
        anchors: core.Property([*:0]const u8, "anchors") = .{},
    },
    pub fn new(arg_anchors: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*TlsFileDatabase {
        const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) *TlsFileDatabase, .{ .name = "g_tls_file_database_new" });
        const ret = cFn(arg_anchors, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_file_database_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TlsFileDatabaseInterface = extern struct {
    g_iface: GObject.TypeInterface,
    padding: [8]?*anyopaque,
};
pub const TlsInteraction = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = TlsInteractionClass;
    parent_instance: GObject.Object,
    priv: ?*TlsInteractionPrivate,
    pub fn askPassword(self: *TlsInteraction, arg_password: *TlsPassword, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!TlsInteractionResult {
        const cFn = @extern(*const fn (*TlsInteraction, *TlsPassword, ?*Cancellable, *?*GLib.Error) callconv(.c) TlsInteractionResult, .{ .name = "g_tls_interaction_ask_password" });
        const ret = cFn(self, arg_password, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn askPasswordAsync(self: *TlsInteraction, arg_password: *TlsPassword, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*TlsInteraction, *TlsPassword, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_tls_interaction_ask_password_async" });
        const ret = cFn(self, arg_password, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn askPasswordFinish(self: *TlsInteraction, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!TlsInteractionResult {
        const cFn = @extern(*const fn (*TlsInteraction, *AsyncResult, *?*GLib.Error) callconv(.c) TlsInteractionResult, .{ .name = "g_tls_interaction_ask_password_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn invokeAskPassword(self: *TlsInteraction, arg_password: *TlsPassword, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!TlsInteractionResult {
        const cFn = @extern(*const fn (*TlsInteraction, *TlsPassword, ?*Cancellable, *?*GLib.Error) callconv(.c) TlsInteractionResult, .{ .name = "g_tls_interaction_invoke_ask_password" });
        const ret = cFn(self, arg_password, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn invokeRequestCertificate(self: *TlsInteraction, arg_connection: *TlsConnection, arg_flags: TlsCertificateRequestFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!TlsInteractionResult {
        const cFn = @extern(*const fn (*TlsInteraction, *TlsConnection, TlsCertificateRequestFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) TlsInteractionResult, .{ .name = "g_tls_interaction_invoke_request_certificate" });
        const ret = cFn(self, arg_connection, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn requestCertificate(self: *TlsInteraction, arg_connection: *TlsConnection, arg_flags: TlsCertificateRequestFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!TlsInteractionResult {
        const cFn = @extern(*const fn (*TlsInteraction, *TlsConnection, TlsCertificateRequestFlags, ?*Cancellable, *?*GLib.Error) callconv(.c) TlsInteractionResult, .{ .name = "g_tls_interaction_request_certificate" });
        const ret = cFn(self, arg_connection, arg_flags, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn requestCertificateAsync(self: *TlsInteraction, arg_connection: *TlsConnection, arg_flags: TlsCertificateRequestFlags, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*TlsInteraction, *TlsConnection, TlsCertificateRequestFlags, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_tls_interaction_request_certificate_async" });
        const ret = cFn(self, arg_connection, arg_flags, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn requestCertificateFinish(self: *TlsInteraction, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!TlsInteractionResult {
        const cFn = @extern(*const fn (*TlsInteraction, *AsyncResult, *?*GLib.Error) callconv(.c) TlsInteractionResult, .{ .name = "g_tls_interaction_request_certificate_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_interaction_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TlsInteractionClass = extern struct {
    parent_class: GObject.ObjectClass,
    ask_password: ?*const fn (arg_interaction: *TlsInteraction, arg_password: *TlsPassword, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) TlsInteractionResult,
    ask_password_async: ?*const fn (arg_interaction: *TlsInteraction, arg_password: *TlsPassword, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    ask_password_finish: ?*const fn (arg_interaction: *TlsInteraction, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) TlsInteractionResult,
    request_certificate: ?*const fn (arg_interaction: *TlsInteraction, arg_connection: *TlsConnection, arg_flags: TlsCertificateRequestFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) TlsInteractionResult,
    request_certificate_async: ?*const fn (arg_interaction: *TlsInteraction, arg_connection: *TlsConnection, arg_flags: TlsCertificateRequestFlags, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    request_certificate_finish: ?*const fn (arg_interaction: *TlsInteraction, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) TlsInteractionResult,
    padding: [21]?*anyopaque,
};
pub const TlsInteractionPrivate = opaque {};
pub const TlsInteractionResult = enum(u32) {
    unhandled = 0,
    handled = 1,
    failed = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_interaction_result_get_type" });
        return cFn();
    }
};
pub const TlsPassword = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = TlsPasswordClass;
    _props: struct {
        description: core.Property([*:0]const u8, "description") = .{},
        flags: core.Property(TlsPasswordFlags, "flags") = .{},
        warning: core.Property([*:0]const u8, "warning") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*TlsPasswordPrivate,
    pub fn new(arg_flags: TlsPasswordFlags, arg_description: [*:0]const u8) *TlsPassword {
        const cFn = @extern(*const fn (TlsPasswordFlags, [*:0]const u8) callconv(.c) *TlsPassword, .{ .name = "g_tls_password_new" });
        const ret = cFn(arg_flags, arg_description);
        return ret;
    }
    pub fn getDescription(self: *TlsPassword) [*:0]u8 {
        const cFn = @extern(*const fn (*TlsPassword) callconv(.c) [*:0]u8, .{ .name = "g_tls_password_get_description" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFlags(self: *TlsPassword) TlsPasswordFlags {
        const cFn = @extern(*const fn (*TlsPassword) callconv(.c) TlsPasswordFlags, .{ .name = "g_tls_password_get_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getValue(self: *TlsPassword, arg_length: ?*u64) []u8 {
        const cFn = @extern(*const fn (*TlsPassword, ?*u64) callconv(.c) [*]u8, .{ .name = "g_tls_password_get_value" });
        const ret = cFn(self, arg_length);
        return ret[0..@intCast(arg_length)];
    }
    pub fn getWarning(self: *TlsPassword) [*:0]u8 {
        const cFn = @extern(*const fn (*TlsPassword) callconv(.c) [*:0]u8, .{ .name = "g_tls_password_get_warning" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setDescription(self: *TlsPassword, arg_description: [*:0]const u8) void {
        const cFn = @extern(*const fn (*TlsPassword, [*:0]const u8) callconv(.c) void, .{ .name = "g_tls_password_set_description" });
        const ret = cFn(self, arg_description);
        return ret;
    }
    pub fn setFlags(self: *TlsPassword, arg_flags: TlsPasswordFlags) void {
        const cFn = @extern(*const fn (*TlsPassword, TlsPasswordFlags) callconv(.c) void, .{ .name = "g_tls_password_set_flags" });
        const ret = cFn(self, arg_flags);
        return ret;
    }
    pub fn setValue(self: *TlsPassword, argS_value: []u8) void {
        const arg_value: [*]u8 = @ptrCast(argS_value);
        const arg_length: i64 = @intCast((argS_value).len);
        const cFn = @extern(*const fn (*TlsPassword, [*]u8, i64) callconv(.c) void, .{ .name = "g_tls_password_set_value" });
        const ret = cFn(self, arg_value, arg_length);
        return ret;
    }
    pub fn setValueFull(self: *TlsPassword, argS_value: []u8, arg_destroy: ?GLib.DestroyNotify) void {
        const arg_value: [*]u8 = @ptrCast(argS_value);
        const arg_length: i64 = @intCast((argS_value).len);
        const cFn = @extern(*const fn (*TlsPassword, [*]u8, i64, ?GLib.DestroyNotify) callconv(.c) void, .{ .name = "g_tls_password_set_value_full" });
        const ret = cFn(self, arg_value, arg_length, arg_destroy);
        return ret;
    }
    pub fn setWarning(self: *TlsPassword, arg_warning: [*:0]const u8) void {
        const cFn = @extern(*const fn (*TlsPassword, [*:0]const u8) callconv(.c) void, .{ .name = "g_tls_password_set_warning" });
        const ret = cFn(self, arg_warning);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_password_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TlsPasswordClass = extern struct {
    parent_class: GObject.ObjectClass,
    get_value: ?*const fn (arg_password: *TlsPassword, arg_length: ?*u64) callconv(.c) [*]u8,
    set_value: ?*const fn (arg_password: *TlsPassword, arg_value: [*]u8, arg_length: i64, arg_destroy: ?GLib.DestroyNotify) callconv(.c) void,
    get_default_warning: ?*const fn (arg_password: *TlsPassword) callconv(.c) [*:0]u8,
    padding: [4]?*anyopaque,
};
pub const TlsPasswordFlags = packed struct(u32) {
    _0: u1 = 0,
    retry: bool = false,
    many_tries: bool = false,
    final_try: bool = false,
    pkcs11_user: bool = false,
    pkcs11_security_officer: bool = false,
    pkcs11_context_specific: bool = false,
    _: u25 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_password_flags_get_type" });
        return cFn();
    }
};
pub const TlsPasswordPrivate = opaque {};
pub const TlsProtocolVersion = enum(u32) {
    unknown = 0,
    ssl_3_0 = 1,
    tls_1_0 = 2,
    tls_1_1 = 3,
    tls_1_2 = 4,
    tls_1_3 = 5,
    dtls_1_0 = 201,
    dtls_1_2 = 202,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_protocol_version_get_type" });
        return cFn();
    }
};
pub const TlsRehandshakeMode = enum(u32) {
    never = 0,
    safely = 1,
    unsafely = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_rehandshake_mode_get_type" });
        return cFn();
    }
};
pub const TlsServerConnection = struct {
    pub const Prerequistes = [_]type{TlsConnection};
    pub const Class = TlsServerConnectionInterface;
    _props: struct {
        @"authentication-mode": core.Property(TlsAuthenticationMode, "authentication-mode") = .{},
    },
    pub fn new(arg_base_io_stream: *IOStream, arg_certificate: ?*TlsCertificate, arg_error: *?*GLib.Error) error{GError}!*TlsServerConnection {
        const cFn = @extern(*const fn (*IOStream, ?*TlsCertificate, *?*GLib.Error) callconv(.c) *TlsServerConnection, .{ .name = "g_tls_server_connection_new" });
        const ret = cFn(arg_base_io_stream, arg_certificate, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tls_server_connection_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const TlsServerConnectionInterface = extern struct {
    g_iface: GObject.TypeInterface,
};
pub const UnixConnection = extern struct {
    pub const Parent = SocketConnection;
    pub const Class = UnixConnectionClass;
    parent_instance: SocketConnection,
    priv: ?*UnixConnectionPrivate,
    pub fn receiveCredentials(self: *UnixConnection, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*Credentials {
        const cFn = @extern(*const fn (*UnixConnection, ?*Cancellable, *?*GLib.Error) callconv(.c) *Credentials, .{ .name = "g_unix_connection_receive_credentials" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn receiveCredentialsAsync(self: *UnixConnection, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*UnixConnection, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_unix_connection_receive_credentials_async" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn receiveCredentialsFinish(self: *UnixConnection, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*Credentials {
        const cFn = @extern(*const fn (*UnixConnection, *AsyncResult, *?*GLib.Error) callconv(.c) *Credentials, .{ .name = "g_unix_connection_receive_credentials_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn receiveFd(self: *UnixConnection, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i32 {
        const cFn = @extern(*const fn (*UnixConnection, ?*Cancellable, *?*GLib.Error) callconv(.c) i32, .{ .name = "g_unix_connection_receive_fd" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn sendCredentials(self: *UnixConnection, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*UnixConnection, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_unix_connection_send_credentials" });
        const ret = cFn(self, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn sendCredentialsAsync(self: *UnixConnection, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*UnixConnection, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_unix_connection_send_credentials_async" });
        const ret = cFn(self, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn sendCredentialsFinish(self: *UnixConnection, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*UnixConnection, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_unix_connection_send_credentials_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn sendFd(self: *UnixConnection, arg_fd: i32, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*UnixConnection, i32, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_unix_connection_send_fd" });
        const ret = cFn(self, arg_fd, arg_cancellable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_unix_connection_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const UnixConnectionClass = extern struct {
    parent_class: SocketConnectionClass,
};
pub const UnixConnectionPrivate = opaque {};
pub const UnixCredentialsMessage = extern struct {
    pub const Parent = SocketControlMessage;
    pub const Class = UnixCredentialsMessageClass;
    _props: struct {
        credentials: core.Property(Credentials, "credentials") = .{},
    },
    parent_instance: SocketControlMessage,
    priv: ?*UnixCredentialsMessagePrivate,
    pub fn new() *UnixCredentialsMessage {
        const cFn = @extern(*const fn () callconv(.c) *UnixCredentialsMessage, .{ .name = "g_unix_credentials_message_new" });
        const ret = cFn();
        return ret;
    }
    pub fn newWithCredentials(arg_credentials: *Credentials) *UnixCredentialsMessage {
        const cFn = @extern(*const fn (*Credentials) callconv(.c) *UnixCredentialsMessage, .{ .name = "g_unix_credentials_message_new_with_credentials" });
        const ret = cFn(arg_credentials);
        return ret;
    }
    pub fn isSupported() bool {
        const cFn = @extern(*const fn () callconv(.c) bool, .{ .name = "g_unix_credentials_message_is_supported" });
        const ret = cFn();
        return ret;
    }
    pub fn getCredentials(self: *UnixCredentialsMessage) *Credentials {
        const cFn = @extern(*const fn (*UnixCredentialsMessage) callconv(.c) *Credentials, .{ .name = "g_unix_credentials_message_get_credentials" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_unix_credentials_message_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const UnixCredentialsMessageClass = extern struct {
    parent_class: SocketControlMessageClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
};
pub const UnixCredentialsMessagePrivate = opaque {};
pub const UnixFDList = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = UnixFDListClass;
    parent_instance: GObject.Object,
    priv: ?*UnixFDListPrivate,
    pub fn new() *UnixFDList {
        const cFn = @extern(*const fn () callconv(.c) *UnixFDList, .{ .name = "g_unix_fd_list_new" });
        const ret = cFn();
        return ret;
    }
    pub fn newFromArray(argS_fds: []i32) *UnixFDList {
        const arg_fds: [*]i32 = @ptrCast(argS_fds);
        const arg_n_fds: i32 = @intCast((argS_fds).len);
        const cFn = @extern(*const fn ([*]i32, i32) callconv(.c) *UnixFDList, .{ .name = "g_unix_fd_list_new_from_array" });
        const ret = cFn(arg_fds, arg_n_fds);
        return ret;
    }
    pub fn append(self: *UnixFDList, arg_fd: i32, arg_error: *?*GLib.Error) error{GError}!i32 {
        const cFn = @extern(*const fn (*UnixFDList, i32, *?*GLib.Error) callconv(.c) i32, .{ .name = "g_unix_fd_list_append" });
        const ret = cFn(self, arg_fd, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn get(self: *UnixFDList, arg_index_: i32, arg_error: *?*GLib.Error) error{GError}!i32 {
        const cFn = @extern(*const fn (*UnixFDList, i32, *?*GLib.Error) callconv(.c) i32, .{ .name = "g_unix_fd_list_get" });
        const ret = cFn(self, arg_index_, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getLength(self: *UnixFDList) i32 {
        const cFn = @extern(*const fn (*UnixFDList) callconv(.c) i32, .{ .name = "g_unix_fd_list_get_length" });
        const ret = cFn(self);
        return ret;
    }
    pub fn peekFds(self: *UnixFDList) []i32 {
        var argO_length: i32 = undefined;
        const arg_length: ?*i32 = &argO_length;
        const cFn = @extern(*const fn (*UnixFDList, ?*i32) callconv(.c) [*]i32, .{ .name = "g_unix_fd_list_peek_fds" });
        const ret = cFn(self, arg_length);
        return ret[0..@intCast(argO_length)];
    }
    pub fn stealFds(self: *UnixFDList) []i32 {
        var argO_length: i32 = undefined;
        const arg_length: ?*i32 = &argO_length;
        const cFn = @extern(*const fn (*UnixFDList, ?*i32) callconv(.c) [*]i32, .{ .name = "g_unix_fd_list_steal_fds" });
        const ret = cFn(self, arg_length);
        return ret[0..@intCast(argO_length)];
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_unix_fd_list_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const UnixFDListClass = extern struct {
    parent_class: GObject.ObjectClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const UnixFDListPrivate = opaque {};
pub const UnixFDMessage = extern struct {
    pub const Parent = SocketControlMessage;
    pub const Class = UnixFDMessageClass;
    _props: struct {
        @"fd-list": core.Property(UnixFDList, "fd-list") = .{},
    },
    parent_instance: SocketControlMessage,
    priv: ?*UnixFDMessagePrivate,
    pub fn new() *UnixFDMessage {
        const cFn = @extern(*const fn () callconv(.c) *UnixFDMessage, .{ .name = "g_unix_fd_message_new" });
        const ret = cFn();
        return ret;
    }
    pub fn newWithFdList(arg_fd_list: *UnixFDList) *UnixFDMessage {
        const cFn = @extern(*const fn (*UnixFDList) callconv(.c) *UnixFDMessage, .{ .name = "g_unix_fd_message_new_with_fd_list" });
        const ret = cFn(arg_fd_list);
        return ret;
    }
    pub fn appendFd(self: *UnixFDMessage, arg_fd: i32, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*UnixFDMessage, i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_unix_fd_message_append_fd" });
        const ret = cFn(self, arg_fd, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getFdList(self: *UnixFDMessage) *UnixFDList {
        const cFn = @extern(*const fn (*UnixFDMessage) callconv(.c) *UnixFDList, .{ .name = "g_unix_fd_message_get_fd_list" });
        const ret = cFn(self);
        return ret;
    }
    pub fn stealFds(self: *UnixFDMessage) []i32 {
        var argO_length: i32 = undefined;
        const arg_length: ?*i32 = &argO_length;
        const cFn = @extern(*const fn (*UnixFDMessage, ?*i32) callconv(.c) [*]i32, .{ .name = "g_unix_fd_message_steal_fds" });
        const ret = cFn(self, arg_length);
        return ret[0..@intCast(argO_length)];
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_unix_fd_message_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const UnixFDMessageClass = extern struct {
    parent_class: SocketControlMessageClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
};
pub const UnixFDMessagePrivate = opaque {};
pub const UnixInputStream = extern struct {
    pub const Interfaces = [_]type{ FileDescriptorBased, PollableInputStream };
    pub const Parent = InputStream;
    pub const Class = UnixInputStreamClass;
    _props: struct {
        @"close-fd": core.Property(bool, "close-fd") = .{},
        fd: core.Property(i32, "fd") = .{},
    },
    parent_instance: InputStream,
    priv: ?*UnixInputStreamPrivate,
    pub fn new(arg_fd: i32, arg_close_fd: bool) *UnixInputStream {
        const cFn = @extern(*const fn (i32, bool) callconv(.c) *UnixInputStream, .{ .name = "g_unix_input_stream_new" });
        const ret = cFn(arg_fd, arg_close_fd);
        return ret;
    }
    pub fn getCloseFd(self: *UnixInputStream) bool {
        const cFn = @extern(*const fn (*UnixInputStream) callconv(.c) bool, .{ .name = "g_unix_input_stream_get_close_fd" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFd(self: *UnixInputStream) i32 {
        const cFn = @extern(*const fn (*UnixInputStream) callconv(.c) i32, .{ .name = "g_unix_input_stream_get_fd" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setCloseFd(self: *UnixInputStream, arg_close_fd: bool) void {
        const cFn = @extern(*const fn (*UnixInputStream, bool) callconv(.c) void, .{ .name = "g_unix_input_stream_set_close_fd" });
        const ret = cFn(self, arg_close_fd);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_unix_input_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const UnixInputStreamClass = extern struct {
    parent_class: InputStreamClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const UnixInputStreamPrivate = opaque {};
pub const UnixMountEntry = opaque {
    pub fn compare(self: *UnixMountEntry, arg_mount2: *UnixMountEntry) i32 {
        const cFn = @extern(*const fn (*UnixMountEntry, *UnixMountEntry) callconv(.c) i32, .{ .name = "g_unix_mount_entry_compare" });
        const ret = cFn(self, arg_mount2);
        return ret;
    }
    pub fn copy(self: *UnixMountEntry) *UnixMountEntry {
        const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) *UnixMountEntry, .{ .name = "g_unix_mount_entry_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *UnixMountEntry) void {
        const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) void, .{ .name = "g_unix_mount_entry_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDevicePath(self: *UnixMountEntry) [*:0]u8 {
        const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) [*:0]u8, .{ .name = "g_unix_mount_entry_get_device_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFsType(self: *UnixMountEntry) [*:0]u8 {
        const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) [*:0]u8, .{ .name = "g_unix_mount_entry_get_fs_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMountPath(self: *UnixMountEntry) [*:0]u8 {
        const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) [*:0]u8, .{ .name = "g_unix_mount_entry_get_mount_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOptions(self: *UnixMountEntry) ?[*:0]u8 {
        const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) ?[*:0]u8, .{ .name = "g_unix_mount_entry_get_options" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRootPath(self: *UnixMountEntry) ?[*:0]u8 {
        const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) ?[*:0]u8, .{ .name = "g_unix_mount_entry_get_root_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn guessCanEject(self: *UnixMountEntry) bool {
        const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) bool, .{ .name = "g_unix_mount_entry_guess_can_eject" });
        const ret = cFn(self);
        return ret;
    }
    pub fn guessIcon(self: *UnixMountEntry) *Icon {
        const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) *Icon, .{ .name = "g_unix_mount_entry_guess_icon" });
        const ret = cFn(self);
        return ret;
    }
    pub fn guessName(self: *UnixMountEntry) [*:0]u8 {
        const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) [*:0]u8, .{ .name = "g_unix_mount_entry_guess_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn guessShouldDisplay(self: *UnixMountEntry) bool {
        const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) bool, .{ .name = "g_unix_mount_entry_guess_should_display" });
        const ret = cFn(self);
        return ret;
    }
    pub fn guessSymbolicIcon(self: *UnixMountEntry) *Icon {
        const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) *Icon, .{ .name = "g_unix_mount_entry_guess_symbolic_icon" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isReadonly(self: *UnixMountEntry) bool {
        const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) bool, .{ .name = "g_unix_mount_entry_is_readonly" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isSystemInternal(self: *UnixMountEntry) bool {
        const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) bool, .{ .name = "g_unix_mount_entry_is_system_internal" });
        const ret = cFn(self);
        return ret;
    }
    pub fn at(arg_mount_path: [*:0]const u8) struct {
        ret: ?*UnixMountEntry,
        time_read: u64,
    } {
        var argO_time_read: u64 = undefined;
        const arg_time_read: ?*u64 = &argO_time_read;
        const cFn = @extern(*const fn ([*:0]const u8, ?*u64) callconv(.c) ?*UnixMountEntry, .{ .name = "g_unix_mount_entry_at" });
        const ret = cFn(arg_mount_path, arg_time_read);
        return .{ .ret = ret, .time_read = argO_time_read };
    }
    pub fn @"for"(arg_file_path: [*:0]const u8) struct {
        ret: ?*UnixMountEntry,
        time_read: u64,
    } {
        var argO_time_read: u64 = undefined;
        const arg_time_read: ?*u64 = &argO_time_read;
        const cFn = @extern(*const fn ([*:0]const u8, ?*u64) callconv(.c) ?*UnixMountEntry, .{ .name = "g_unix_mount_entry_for" });
        const ret = cFn(arg_file_path, arg_time_read);
        return .{ .ret = ret, .time_read = argO_time_read };
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_unix_mount_entry_get_type" });
        return cFn();
    }
};
pub const UnixMountMonitor = struct {
    pub const Parent = GObject.Object;
    pub const Class = UnixMountMonitorClass;
    _signals: struct {
        @"mountpoints-changed": core.Signal(fn (*UnixMountMonitor) void, "mountpoints-changed") = .{},
        @"mounts-changed": core.Signal(fn (*UnixMountMonitor) void, "mounts-changed") = .{},
    },
    pub fn new() *UnixMountMonitor {
        const cFn = @extern(*const fn () callconv(.c) *UnixMountMonitor, .{ .name = "g_unix_mount_monitor_new" });
        const ret = cFn();
        return ret;
    }
    pub fn get() *UnixMountMonitor {
        const cFn = @extern(*const fn () callconv(.c) *UnixMountMonitor, .{ .name = "g_unix_mount_monitor_get" });
        const ret = cFn();
        return ret;
    }
    pub fn setRateLimit(self: *UnixMountMonitor, arg_limit_msec: i32) void {
        const cFn = @extern(*const fn (*UnixMountMonitor, i32) callconv(.c) void, .{ .name = "g_unix_mount_monitor_set_rate_limit" });
        const ret = cFn(self, arg_limit_msec);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_unix_mount_monitor_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const UnixMountMonitorClass = opaque {};
pub const UnixMountPoint = opaque {
    pub fn compare(self: *UnixMountPoint, arg_mount2: *UnixMountPoint) i32 {
        const cFn = @extern(*const fn (*UnixMountPoint, *UnixMountPoint) callconv(.c) i32, .{ .name = "g_unix_mount_point_compare" });
        const ret = cFn(self, arg_mount2);
        return ret;
    }
    pub fn copy(self: *UnixMountPoint) *UnixMountPoint {
        const cFn = @extern(*const fn (*UnixMountPoint) callconv(.c) *UnixMountPoint, .{ .name = "g_unix_mount_point_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *UnixMountPoint) void {
        const cFn = @extern(*const fn (*UnixMountPoint) callconv(.c) void, .{ .name = "g_unix_mount_point_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDevicePath(self: *UnixMountPoint) [*:0]u8 {
        const cFn = @extern(*const fn (*UnixMountPoint) callconv(.c) [*:0]u8, .{ .name = "g_unix_mount_point_get_device_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFsType(self: *UnixMountPoint) [*:0]u8 {
        const cFn = @extern(*const fn (*UnixMountPoint) callconv(.c) [*:0]u8, .{ .name = "g_unix_mount_point_get_fs_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMountPath(self: *UnixMountPoint) [*:0]u8 {
        const cFn = @extern(*const fn (*UnixMountPoint) callconv(.c) [*:0]u8, .{ .name = "g_unix_mount_point_get_mount_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOptions(self: *UnixMountPoint) ?[*:0]u8 {
        const cFn = @extern(*const fn (*UnixMountPoint) callconv(.c) ?[*:0]u8, .{ .name = "g_unix_mount_point_get_options" });
        const ret = cFn(self);
        return ret;
    }
    pub fn guessCanEject(self: *UnixMountPoint) bool {
        const cFn = @extern(*const fn (*UnixMountPoint) callconv(.c) bool, .{ .name = "g_unix_mount_point_guess_can_eject" });
        const ret = cFn(self);
        return ret;
    }
    pub fn guessIcon(self: *UnixMountPoint) *Icon {
        const cFn = @extern(*const fn (*UnixMountPoint) callconv(.c) *Icon, .{ .name = "g_unix_mount_point_guess_icon" });
        const ret = cFn(self);
        return ret;
    }
    pub fn guessName(self: *UnixMountPoint) [*:0]u8 {
        const cFn = @extern(*const fn (*UnixMountPoint) callconv(.c) [*:0]u8, .{ .name = "g_unix_mount_point_guess_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn guessSymbolicIcon(self: *UnixMountPoint) *Icon {
        const cFn = @extern(*const fn (*UnixMountPoint) callconv(.c) *Icon, .{ .name = "g_unix_mount_point_guess_symbolic_icon" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isLoopback(self: *UnixMountPoint) bool {
        const cFn = @extern(*const fn (*UnixMountPoint) callconv(.c) bool, .{ .name = "g_unix_mount_point_is_loopback" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isReadonly(self: *UnixMountPoint) bool {
        const cFn = @extern(*const fn (*UnixMountPoint) callconv(.c) bool, .{ .name = "g_unix_mount_point_is_readonly" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isUserMountable(self: *UnixMountPoint) bool {
        const cFn = @extern(*const fn (*UnixMountPoint) callconv(.c) bool, .{ .name = "g_unix_mount_point_is_user_mountable" });
        const ret = cFn(self);
        return ret;
    }
    pub fn at(arg_mount_path: [*:0]const u8) struct {
        ret: ?*UnixMountPoint,
        time_read: u64,
    } {
        var argO_time_read: u64 = undefined;
        const arg_time_read: ?*u64 = &argO_time_read;
        const cFn = @extern(*const fn ([*:0]const u8, ?*u64) callconv(.c) ?*UnixMountPoint, .{ .name = "g_unix_mount_point_at" });
        const ret = cFn(arg_mount_path, arg_time_read);
        return .{ .ret = ret, .time_read = argO_time_read };
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_unix_mount_point_get_type" });
        return cFn();
    }
};
pub const UnixOutputStream = extern struct {
    pub const Interfaces = [_]type{ FileDescriptorBased, PollableOutputStream };
    pub const Parent = OutputStream;
    pub const Class = UnixOutputStreamClass;
    _props: struct {
        @"close-fd": core.Property(bool, "close-fd") = .{},
        fd: core.Property(i32, "fd") = .{},
    },
    parent_instance: OutputStream,
    priv: ?*UnixOutputStreamPrivate,
    pub fn new(arg_fd: i32, arg_close_fd: bool) *UnixOutputStream {
        const cFn = @extern(*const fn (i32, bool) callconv(.c) *UnixOutputStream, .{ .name = "g_unix_output_stream_new" });
        const ret = cFn(arg_fd, arg_close_fd);
        return ret;
    }
    pub fn getCloseFd(self: *UnixOutputStream) bool {
        const cFn = @extern(*const fn (*UnixOutputStream) callconv(.c) bool, .{ .name = "g_unix_output_stream_get_close_fd" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFd(self: *UnixOutputStream) i32 {
        const cFn = @extern(*const fn (*UnixOutputStream) callconv(.c) i32, .{ .name = "g_unix_output_stream_get_fd" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setCloseFd(self: *UnixOutputStream, arg_close_fd: bool) void {
        const cFn = @extern(*const fn (*UnixOutputStream, bool) callconv(.c) void, .{ .name = "g_unix_output_stream_set_close_fd" });
        const ret = cFn(self, arg_close_fd);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_unix_output_stream_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const UnixOutputStreamClass = extern struct {
    parent_class: OutputStreamClass,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
};
pub const UnixOutputStreamPrivate = opaque {};
pub const UnixSocketAddress = extern struct {
    pub const Interfaces = [_]type{SocketConnectable};
    pub const Parent = SocketAddress;
    pub const Class = UnixSocketAddressClass;
    _props: struct {
        abstract: core.Property(bool, "abstract") = .{},
        @"address-type": core.Property(UnixSocketAddressType, "address-type") = .{},
        path: core.Property([*:0]const u8, "path") = .{},
        @"path-as-array": core.Property(*GLib.ByteArray, "path-as-array") = .{},
    },
    parent_instance: SocketAddress,
    priv: ?*UnixSocketAddressPrivate,
    pub fn new(arg_path: [*:0]const u8) *UnixSocketAddress {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *UnixSocketAddress, .{ .name = "g_unix_socket_address_new" });
        const ret = cFn(arg_path);
        return ret;
    }
    pub fn newAbstract(argS_path: []i8) *UnixSocketAddress {
        const arg_path: [*]i8 = @ptrCast(argS_path);
        const arg_path_len: i32 = @intCast((argS_path).len);
        const cFn = @extern(*const fn ([*]i8, i32) callconv(.c) *UnixSocketAddress, .{ .name = "g_unix_socket_address_new_abstract" });
        const ret = cFn(arg_path, arg_path_len);
        return ret;
    }
    pub fn newWithType(argS_path: []i8, arg_type: UnixSocketAddressType) *UnixSocketAddress {
        const arg_path: [*]i8 = @ptrCast(argS_path);
        const arg_path_len: i32 = @intCast((argS_path).len);
        const cFn = @extern(*const fn ([*]i8, i32, UnixSocketAddressType) callconv(.c) *UnixSocketAddress, .{ .name = "g_unix_socket_address_new_with_type" });
        const ret = cFn(arg_path, arg_path_len, arg_type);
        return ret;
    }
    pub fn abstractNamesSupported() bool {
        const cFn = @extern(*const fn () callconv(.c) bool, .{ .name = "g_unix_socket_address_abstract_names_supported" });
        const ret = cFn();
        return ret;
    }
    pub fn getAddressType(self: *UnixSocketAddress) UnixSocketAddressType {
        const cFn = @extern(*const fn (*UnixSocketAddress) callconv(.c) UnixSocketAddressType, .{ .name = "g_unix_socket_address_get_address_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIsAbstract(self: *UnixSocketAddress) bool {
        const cFn = @extern(*const fn (*UnixSocketAddress) callconv(.c) bool, .{ .name = "g_unix_socket_address_get_is_abstract" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPath(self: *UnixSocketAddress) [*:0]u8 {
        const cFn = @extern(*const fn (*UnixSocketAddress) callconv(.c) [*:0]u8, .{ .name = "g_unix_socket_address_get_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPathLen(self: *UnixSocketAddress) u64 {
        const cFn = @extern(*const fn (*UnixSocketAddress) callconv(.c) u64, .{ .name = "g_unix_socket_address_get_path_len" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_unix_socket_address_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const UnixSocketAddressClass = extern struct {
    parent_class: SocketAddressClass,
};
pub const UnixSocketAddressPrivate = opaque {};
pub const UnixSocketAddressType = enum(u32) {
    invalid = 0,
    anonymous = 1,
    path = 2,
    abstract = 3,
    abstract_padded = 4,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_unix_socket_address_type_get_type" });
        return cFn();
    }
};
pub const VFS_EXTENSION_POINT_NAME = "gio-vfs";
pub const VOLUME_IDENTIFIER_KIND_CLASS = "class";
pub const VOLUME_IDENTIFIER_KIND_HAL_UDI = "hal-udi";
pub const VOLUME_IDENTIFIER_KIND_LABEL = "label";
pub const VOLUME_IDENTIFIER_KIND_NFS_MOUNT = "nfs-mount";
pub const VOLUME_IDENTIFIER_KIND_UNIX_DEVICE = "unix-device";
pub const VOLUME_IDENTIFIER_KIND_UUID = "uuid";
pub const VOLUME_MONITOR_EXTENSION_POINT_NAME = "gio-volume-monitor";
pub const Vfs = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = VfsClass;
    parent_instance: GObject.Object,
    pub fn getDefault() *Vfs {
        const cFn = @extern(*const fn () callconv(.c) *Vfs, .{ .name = "g_vfs_get_default" });
        const ret = cFn();
        return ret;
    }
    pub fn getLocal() *Vfs {
        const cFn = @extern(*const fn () callconv(.c) *Vfs, .{ .name = "g_vfs_get_local" });
        const ret = cFn();
        return ret;
    }
    pub fn getFileForPath(self: *Vfs, arg_path: [*:0]const u8) *File {
        const cFn = @extern(*const fn (*Vfs, [*:0]const u8) callconv(.c) *File, .{ .name = "g_vfs_get_file_for_path" });
        const ret = cFn(self, arg_path);
        return ret;
    }
    pub fn getFileForUri(self: *Vfs, arg_uri: [*:0]const u8) *File {
        const cFn = @extern(*const fn (*Vfs, [*:0]const u8) callconv(.c) *File, .{ .name = "g_vfs_get_file_for_uri" });
        const ret = cFn(self, arg_uri);
        return ret;
    }
    pub fn getSupportedUriSchemes(self: *Vfs) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*Vfs) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_vfs_get_supported_uri_schemes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isActive(self: *Vfs) bool {
        const cFn = @extern(*const fn (*Vfs) callconv(.c) bool, .{ .name = "g_vfs_is_active" });
        const ret = cFn(self);
        return ret;
    }
    pub fn parseName(self: *Vfs, arg_parse_name: [*:0]const u8) *File {
        const cFn = @extern(*const fn (*Vfs, [*:0]const u8) callconv(.c) *File, .{ .name = "g_vfs_parse_name" });
        const ret = cFn(self, arg_parse_name);
        return ret;
    }
    pub fn registerUriScheme(self: *Vfs, arg_scheme: [*:0]const u8, argC_uri_func: core.Closure(?VfsFileLookupFunc), argC_parse_name_func: core.Closure(?VfsFileLookupFunc)) bool {
        const arg_uri_func: ?VfsFileLookupFunc = @ptrCast(argC_uri_func.callback());
        const arg_uri_data: ?*anyopaque = @ptrCast(argC_uri_func.data());
        const arg_uri_destroy: ?GLib.DestroyNotify = @ptrCast(argC_uri_func.destroy());
        const arg_parse_name_func: ?VfsFileLookupFunc = @ptrCast(argC_parse_name_func.callback());
        const arg_parse_name_data: ?*anyopaque = @ptrCast(argC_parse_name_func.data());
        const arg_parse_name_destroy: ?GLib.DestroyNotify = @ptrCast(argC_parse_name_func.destroy());
        const cFn = @extern(*const fn (*Vfs, [*:0]const u8, ?VfsFileLookupFunc, ?*anyopaque, ?GLib.DestroyNotify, ?VfsFileLookupFunc, ?*anyopaque, ?GLib.DestroyNotify) callconv(.c) bool, .{ .name = "g_vfs_register_uri_scheme" });
        const ret = cFn(self, arg_scheme, arg_uri_func, @ptrCast(arg_uri_data), arg_uri_destroy, arg_parse_name_func, @ptrCast(arg_parse_name_data), arg_parse_name_destroy);
        return ret;
    }
    pub fn unregisterUriScheme(self: *Vfs, arg_scheme: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*Vfs, [*:0]const u8) callconv(.c) bool, .{ .name = "g_vfs_unregister_uri_scheme" });
        const ret = cFn(self, arg_scheme);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_vfs_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const VfsClass = extern struct {
    parent_class: GObject.ObjectClass,
    is_active: ?*const fn (arg_vfs: *Vfs) callconv(.c) bool,
    get_file_for_path: ?*const fn (arg_vfs: *Vfs, arg_path: [*:0]const u8) callconv(.c) *File,
    get_file_for_uri: ?*const fn (arg_vfs: *Vfs, arg_uri: [*:0]const u8) callconv(.c) *File,
    get_supported_uri_schemes: ?*const fn (arg_vfs: *Vfs) callconv(.c) [*]?[*:0]const u8,
    parse_name: ?*const fn (arg_vfs: *Vfs, arg_parse_name: [*:0]const u8) callconv(.c) *File,
    local_file_add_info: ?*const fn (arg_vfs: *Vfs, arg_filename: [*:0]const u8, arg_device: u64, arg_attribute_matcher: *FileAttributeMatcher, arg_info: *FileInfo, arg_cancellable: ?*Cancellable, arg_extra_data: ?*anyopaque, arg_free_extra_data: GLib.DestroyNotify) callconv(.c) void,
    add_writable_namespaces: ?*const fn (arg_vfs: *Vfs, arg_list: *FileAttributeInfoList) callconv(.c) void,
    local_file_set_attributes: ?*const fn (arg_vfs: *Vfs, arg_filename: [*:0]const u8, arg_info: *FileInfo, arg_flags: FileQueryInfoFlags, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) callconv(.c) bool,
    local_file_removed: ?*const fn (arg_vfs: *Vfs, arg_filename: [*:0]const u8) callconv(.c) void,
    local_file_moved: ?*const fn (arg_vfs: *Vfs, arg_source: [*:0]const u8, arg_dest: [*:0]const u8) callconv(.c) void,
    deserialize_icon: ?*anyopaque,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
    _g_reserved6: ?*anyopaque,
};
pub const VfsFileLookupFunc = *const fn (arg_vfs: *Vfs, arg_identifier: [*:0]const u8, arg_user_data: ?*anyopaque) callconv(.c) ?*File;
pub const Volume = struct {
    pub const Class = VolumeIface;
    _signals: struct {
        changed: core.Signal(fn (*Volume) void, "changed") = .{},
        removed: core.Signal(fn (*Volume) void, "removed") = .{},
    },
    pub fn canEject(self: *Volume) bool {
        const cFn = @extern(*const fn (*Volume) callconv(.c) bool, .{ .name = "g_volume_can_eject" });
        const ret = cFn(self);
        return ret;
    }
    pub fn canMount(self: *Volume) bool {
        const cFn = @extern(*const fn (*Volume) callconv(.c) bool, .{ .name = "g_volume_can_mount" });
        const ret = cFn(self);
        return ret;
    }
    pub fn eject(self: *Volume, arg_flags: MountUnmountFlags, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Volume, MountUnmountFlags, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_volume_eject" });
        const ret = cFn(self, arg_flags, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn ejectFinish(self: *Volume, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Volume, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_volume_eject_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn ejectWithOperation(self: *Volume, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Volume, MountUnmountFlags, ?*MountOperation, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_volume_eject_with_operation" });
        const ret = cFn(self, arg_flags, arg_mount_operation, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn ejectWithOperationFinish(self: *Volume, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Volume, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_volume_eject_with_operation_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn enumerateIdentifiers(self: *Volume) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*Volume) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_volume_enumerate_identifiers" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getActivationRoot(self: *Volume) ?*File {
        const cFn = @extern(*const fn (*Volume) callconv(.c) ?*File, .{ .name = "g_volume_get_activation_root" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDrive(self: *Volume) ?*Drive {
        const cFn = @extern(*const fn (*Volume) callconv(.c) ?*Drive, .{ .name = "g_volume_get_drive" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIcon(self: *Volume) *Icon {
        const cFn = @extern(*const fn (*Volume) callconv(.c) *Icon, .{ .name = "g_volume_get_icon" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIdentifier(self: *Volume, arg_kind: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Volume, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_volume_get_identifier" });
        const ret = cFn(self, arg_kind);
        return ret;
    }
    pub fn getMount(self: *Volume) ?*Mount {
        const cFn = @extern(*const fn (*Volume) callconv(.c) ?*Mount, .{ .name = "g_volume_get_mount" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getName(self: *Volume) [*:0]u8 {
        const cFn = @extern(*const fn (*Volume) callconv(.c) [*:0]u8, .{ .name = "g_volume_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSortKey(self: *Volume) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Volume) callconv(.c) ?[*:0]u8, .{ .name = "g_volume_get_sort_key" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSymbolicIcon(self: *Volume) *Icon {
        const cFn = @extern(*const fn (*Volume) callconv(.c) *Icon, .{ .name = "g_volume_get_symbolic_icon" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUuid(self: *Volume) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Volume) callconv(.c) ?[*:0]u8, .{ .name = "g_volume_get_uuid" });
        const ret = cFn(self);
        return ret;
    }
    pub fn mount(self: *Volume, arg_flags: MountMountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
        const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
        argC_callback.closure.once = true;
        const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
        const cFn = @extern(*const fn (*Volume, MountMountFlags, ?*MountOperation, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_volume_mount" });
        const ret = cFn(self, arg_flags, arg_mount_operation, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn mountFinish(self: *Volume, arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*Volume, *AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_volume_mount_finish" });
        const ret = cFn(self, arg_result, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn shouldAutomount(self: *Volume) bool {
        const cFn = @extern(*const fn (*Volume) callconv(.c) bool, .{ .name = "g_volume_should_automount" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_volume_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const VolumeIface = extern struct {
    g_iface: GObject.TypeInterface,
    changed: ?*const fn (arg_volume: *Volume) callconv(.c) void,
    removed: ?*const fn (arg_volume: *Volume) callconv(.c) void,
    get_name: ?*const fn (arg_volume: *Volume) callconv(.c) [*:0]u8,
    get_icon: ?*const fn (arg_volume: *Volume) callconv(.c) *Icon,
    get_uuid: ?*const fn (arg_volume: *Volume) callconv(.c) ?[*:0]u8,
    get_drive: ?*const fn (arg_volume: *Volume) callconv(.c) ?*Drive,
    get_mount: ?*const fn (arg_volume: *Volume) callconv(.c) ?*Mount,
    can_mount: ?*const fn (arg_volume: *Volume) callconv(.c) bool,
    can_eject: ?*const fn (arg_volume: *Volume) callconv(.c) bool,
    mount_fn: ?*const fn (arg_volume: *Volume, arg_flags: MountMountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    mount_finish: ?*const fn (arg_volume: *Volume, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    eject: ?*const fn (arg_volume: *Volume, arg_flags: MountUnmountFlags, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    eject_finish: ?*const fn (arg_volume: *Volume, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    get_identifier: ?*const fn (arg_volume: *Volume, arg_kind: [*:0]const u8) callconv(.c) ?[*:0]u8,
    enumerate_identifiers: ?*const fn (arg_volume: *Volume) callconv(.c) [*]?[*:0]const u8,
    should_automount: ?*const fn (arg_volume: *Volume) callconv(.c) bool,
    get_activation_root: ?*const fn (arg_volume: *Volume) callconv(.c) ?*File,
    eject_with_operation: ?*const fn (arg_volume: *Volume, arg_flags: MountUnmountFlags, arg_mount_operation: ?*MountOperation, arg_cancellable: ?*Cancellable, arg_callback: ?AsyncReadyCallback, arg_user_data: ?*anyopaque) callconv(.c) void,
    eject_with_operation_finish: ?*const fn (arg_volume: *Volume, arg_result: *AsyncResult, arg_error: *?*GLib.Error) callconv(.c) bool,
    get_sort_key: ?*const fn (arg_volume: *Volume) callconv(.c) ?[*:0]u8,
    get_symbolic_icon: ?*const fn (arg_volume: *Volume) callconv(.c) *Icon,
};
pub const VolumeMonitor = extern struct {
    pub const Parent = GObject.Object;
    pub const Class = VolumeMonitorClass;
    _signals: struct {
        @"drive-changed": core.Signal(fn (*VolumeMonitor, *Drive) void, "drive-changed") = .{},
        @"drive-connected": core.Signal(fn (*VolumeMonitor, *Drive) void, "drive-connected") = .{},
        @"drive-disconnected": core.Signal(fn (*VolumeMonitor, *Drive) void, "drive-disconnected") = .{},
        @"drive-eject-button": core.Signal(fn (*VolumeMonitor, *Drive) void, "drive-eject-button") = .{},
        @"drive-stop-button": core.Signal(fn (*VolumeMonitor, *Drive) void, "drive-stop-button") = .{},
        @"mount-added": core.Signal(fn (*VolumeMonitor, *Mount) void, "mount-added") = .{},
        @"mount-changed": core.Signal(fn (*VolumeMonitor, *Mount) void, "mount-changed") = .{},
        @"mount-pre-unmount": core.Signal(fn (*VolumeMonitor, *Mount) void, "mount-pre-unmount") = .{},
        @"mount-removed": core.Signal(fn (*VolumeMonitor, *Mount) void, "mount-removed") = .{},
        @"volume-added": core.Signal(fn (*VolumeMonitor, *Volume) void, "volume-added") = .{},
        @"volume-changed": core.Signal(fn (*VolumeMonitor, *Volume) void, "volume-changed") = .{},
        @"volume-removed": core.Signal(fn (*VolumeMonitor, *Volume) void, "volume-removed") = .{},
    },
    parent_instance: GObject.Object,
    priv: ?*anyopaque,
    pub fn adoptOrphanMount(arg_mount: *Mount) *Volume {
        const cFn = @extern(*const fn (*Mount) callconv(.c) *Volume, .{ .name = "g_volume_monitor_adopt_orphan_mount" });
        const ret = cFn(arg_mount);
        return ret;
    }
    pub fn get() *VolumeMonitor {
        const cFn = @extern(*const fn () callconv(.c) *VolumeMonitor, .{ .name = "g_volume_monitor_get" });
        const ret = cFn();
        return ret;
    }
    pub fn getConnectedDrives(self: *VolumeMonitor) ?*GLib.List {
        const cFn = @extern(*const fn (*VolumeMonitor) callconv(.c) ?*GLib.List, .{ .name = "g_volume_monitor_get_connected_drives" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMountForUuid(self: *VolumeMonitor, arg_uuid: [*:0]const u8) ?*Mount {
        const cFn = @extern(*const fn (*VolumeMonitor, [*:0]const u8) callconv(.c) ?*Mount, .{ .name = "g_volume_monitor_get_mount_for_uuid" });
        const ret = cFn(self, arg_uuid);
        return ret;
    }
    pub fn getMounts(self: *VolumeMonitor) ?*GLib.List {
        const cFn = @extern(*const fn (*VolumeMonitor) callconv(.c) ?*GLib.List, .{ .name = "g_volume_monitor_get_mounts" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getVolumeForUuid(self: *VolumeMonitor, arg_uuid: [*:0]const u8) ?*Volume {
        const cFn = @extern(*const fn (*VolumeMonitor, [*:0]const u8) callconv(.c) ?*Volume, .{ .name = "g_volume_monitor_get_volume_for_uuid" });
        const ret = cFn(self, arg_uuid);
        return ret;
    }
    pub fn getVolumes(self: *VolumeMonitor) ?*GLib.List {
        const cFn = @extern(*const fn (*VolumeMonitor) callconv(.c) ?*GLib.List, .{ .name = "g_volume_monitor_get_volumes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_volume_monitor_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const VolumeMonitorClass = extern struct {
    parent_class: GObject.ObjectClass,
    volume_added: ?*const fn (arg_volume_monitor: *VolumeMonitor, arg_volume: *Volume) callconv(.c) void,
    volume_removed: ?*const fn (arg_volume_monitor: *VolumeMonitor, arg_volume: *Volume) callconv(.c) void,
    volume_changed: ?*const fn (arg_volume_monitor: *VolumeMonitor, arg_volume: *Volume) callconv(.c) void,
    mount_added: ?*const fn (arg_volume_monitor: *VolumeMonitor, arg_mount: *Mount) callconv(.c) void,
    mount_removed: ?*const fn (arg_volume_monitor: *VolumeMonitor, arg_mount: *Mount) callconv(.c) void,
    mount_pre_unmount: ?*const fn (arg_volume_monitor: *VolumeMonitor, arg_mount: *Mount) callconv(.c) void,
    mount_changed: ?*const fn (arg_volume_monitor: *VolumeMonitor, arg_mount: *Mount) callconv(.c) void,
    drive_connected: ?*const fn (arg_volume_monitor: *VolumeMonitor, arg_drive: *Drive) callconv(.c) void,
    drive_disconnected: ?*const fn (arg_volume_monitor: *VolumeMonitor, arg_drive: *Drive) callconv(.c) void,
    drive_changed: ?*const fn (arg_volume_monitor: *VolumeMonitor, arg_drive: *Drive) callconv(.c) void,
    is_supported: ?*const fn () callconv(.c) bool,
    get_connected_drives: ?*const fn (arg_volume_monitor: *VolumeMonitor) callconv(.c) ?*GLib.List,
    get_volumes: ?*const fn (arg_volume_monitor: *VolumeMonitor) callconv(.c) ?*GLib.List,
    get_mounts: ?*const fn (arg_volume_monitor: *VolumeMonitor) callconv(.c) ?*GLib.List,
    get_volume_for_uuid: ?*const fn (arg_volume_monitor: *VolumeMonitor, arg_uuid: [*:0]const u8) callconv(.c) ?*Volume,
    get_mount_for_uuid: ?*const fn (arg_volume_monitor: *VolumeMonitor, arg_uuid: [*:0]const u8) callconv(.c) ?*Mount,
    adopt_orphan_mount: ?*anyopaque,
    drive_eject_button: ?*const fn (arg_volume_monitor: *VolumeMonitor, arg_drive: *Drive) callconv(.c) void,
    drive_stop_button: ?*const fn (arg_volume_monitor: *VolumeMonitor, arg_drive: *Drive) callconv(.c) void,
    _g_reserved1: ?*anyopaque,
    _g_reserved2: ?*anyopaque,
    _g_reserved3: ?*anyopaque,
    _g_reserved4: ?*anyopaque,
    _g_reserved5: ?*anyopaque,
    _g_reserved6: ?*anyopaque,
};
pub const ZlibCompressor = struct {
    pub const Interfaces = [_]type{Converter};
    pub const Parent = GObject.Object;
    pub const Class = ZlibCompressorClass;
    _props: struct {
        @"file-info": core.Property(FileInfo, "file-info") = .{},
        format: core.Property(ZlibCompressorFormat, "format") = .{},
        level: core.Property(i32, "level") = .{},
    },
    pub fn new(arg_format: ZlibCompressorFormat, arg_level: i32) *ZlibCompressor {
        const cFn = @extern(*const fn (ZlibCompressorFormat, i32) callconv(.c) *ZlibCompressor, .{ .name = "g_zlib_compressor_new" });
        const ret = cFn(arg_format, arg_level);
        return ret;
    }
    pub fn getFileInfo(self: *ZlibCompressor) ?*FileInfo {
        const cFn = @extern(*const fn (*ZlibCompressor) callconv(.c) ?*FileInfo, .{ .name = "g_zlib_compressor_get_file_info" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setFileInfo(self: *ZlibCompressor, arg_file_info: ?*FileInfo) void {
        const cFn = @extern(*const fn (*ZlibCompressor, ?*FileInfo) callconv(.c) void, .{ .name = "g_zlib_compressor_set_file_info" });
        const ret = cFn(self, arg_file_info);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_zlib_compressor_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ZlibCompressorClass = extern struct {
    parent_class: GObject.ObjectClass,
};
pub const ZlibCompressorFormat = enum(u32) {
    zlib = 0,
    gzip = 1,
    raw = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_zlib_compressor_format_get_type" });
        return cFn();
    }
};
pub const ZlibDecompressor = struct {
    pub const Interfaces = [_]type{Converter};
    pub const Parent = GObject.Object;
    pub const Class = ZlibDecompressorClass;
    _props: struct {
        @"file-info": core.Property(FileInfo, "file-info") = .{},
        format: core.Property(ZlibCompressorFormat, "format") = .{},
    },
    pub fn new(arg_format: ZlibCompressorFormat) *ZlibDecompressor {
        const cFn = @extern(*const fn (ZlibCompressorFormat) callconv(.c) *ZlibDecompressor, .{ .name = "g_zlib_decompressor_new" });
        const ret = cFn(arg_format);
        return ret;
    }
    pub fn getFileInfo(self: *ZlibDecompressor) ?*FileInfo {
        const cFn = @extern(*const fn (*ZlibDecompressor) callconv(.c) ?*FileInfo, .{ .name = "g_zlib_decompressor_get_file_info" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_zlib_decompressor_get_type" });
        return cFn();
    }
    const Ext = core.Extend(@This());
    pub const into = Ext.into;
    pub const tryInto = Ext.tryInto;
};
pub const ZlibDecompressorClass = extern struct {
    parent_class: GObject.ObjectClass,
};
pub fn actionNameIsValid(arg_action_name: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_action_name_is_valid" });
    const ret = cFn(arg_action_name);
    return ret;
}
pub fn actionParseDetailedName(arg_detailed_name: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    action_name: [*:0]u8,
    target_value: ?*GLib.Variant,
} {
    var argO_action_name: ?[*:0]u8 = undefined;
    const arg_action_name: ?*[*:0]u8 = &argO_action_name;
    var argO_target_value: ?*GLib.Variant = undefined;
    const arg_target_value: ?*?*GLib.Variant = &argO_target_value;
    const cFn = @extern(*const fn ([*:0]const u8, ?*[*:0]u8, ?*?*GLib.Variant, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_action_parse_detailed_name" });
    const ret = cFn(arg_detailed_name, arg_action_name, arg_target_value, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .action_name = argO_action_name, .target_value = argO_target_value };
}
pub fn actionPrintDetailedName(arg_action_name: [*:0]const u8, arg_target_value: ?*GLib.Variant) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, ?*GLib.Variant) callconv(.c) [*:0]u8, .{ .name = "g_action_print_detailed_name" });
    const ret = cFn(arg_action_name, arg_target_value);
    return ret;
}
pub fn appInfoCreateFromCommandline(arg_commandline: [*:0]const u8, arg_application_name: ?[*:0]const u8, arg_flags: AppInfoCreateFlags, arg_error: *?*GLib.Error) error{GError}!*AppInfo {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, AppInfoCreateFlags, *?*GLib.Error) callconv(.c) *AppInfo, .{ .name = "g_app_info_create_from_commandline" });
    const ret = cFn(arg_commandline, arg_application_name, arg_flags, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn appInfoGetAll() ?*GLib.List {
    const cFn = @extern(*const fn () callconv(.c) ?*GLib.List, .{ .name = "g_app_info_get_all" });
    const ret = cFn();
    return ret;
}
pub fn appInfoGetAllForType(arg_content_type: [*:0]const u8) ?*GLib.List {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*GLib.List, .{ .name = "g_app_info_get_all_for_type" });
    const ret = cFn(arg_content_type);
    return ret;
}
pub fn appInfoGetDefaultForType(arg_content_type: [*:0]const u8, arg_must_support_uris: bool) ?*AppInfo {
    const cFn = @extern(*const fn ([*:0]const u8, bool) callconv(.c) ?*AppInfo, .{ .name = "g_app_info_get_default_for_type" });
    const ret = cFn(arg_content_type, arg_must_support_uris);
    return ret;
}
pub fn appInfoGetDefaultForTypeAsync(arg_content_type: [*:0]const u8, arg_must_support_uris: bool, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
    const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
    argC_callback.closure.once = true;
    const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
    const cFn = @extern(*const fn ([*:0]const u8, bool, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_app_info_get_default_for_type_async" });
    const ret = cFn(arg_content_type, arg_must_support_uris, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
    return ret;
}
pub fn appInfoGetDefaultForTypeFinish(arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*AppInfo {
    const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) *AppInfo, .{ .name = "g_app_info_get_default_for_type_finish" });
    const ret = cFn(arg_result, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn appInfoGetDefaultForUriScheme(arg_uri_scheme: [*:0]const u8) ?*AppInfo {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*AppInfo, .{ .name = "g_app_info_get_default_for_uri_scheme" });
    const ret = cFn(arg_uri_scheme);
    return ret;
}
pub fn appInfoGetDefaultForUriSchemeAsync(arg_uri_scheme: [*:0]const u8, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
    const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
    argC_callback.closure.once = true;
    const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
    const cFn = @extern(*const fn ([*:0]const u8, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_app_info_get_default_for_uri_scheme_async" });
    const ret = cFn(arg_uri_scheme, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
    return ret;
}
pub fn appInfoGetDefaultForUriSchemeFinish(arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*AppInfo {
    const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) *AppInfo, .{ .name = "g_app_info_get_default_for_uri_scheme_finish" });
    const ret = cFn(arg_result, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn appInfoGetFallbackForType(arg_content_type: [*:0]const u8) ?*GLib.List {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*GLib.List, .{ .name = "g_app_info_get_fallback_for_type" });
    const ret = cFn(arg_content_type);
    return ret;
}
pub fn appInfoGetRecommendedForType(arg_content_type: [*:0]const u8) ?*GLib.List {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*GLib.List, .{ .name = "g_app_info_get_recommended_for_type" });
    const ret = cFn(arg_content_type);
    return ret;
}
pub fn appInfoLaunchDefaultForUri(arg_uri: [*:0]const u8, arg_context: ?*AppLaunchContext, arg_error: *?*GLib.Error) error{GError}!bool {
    const cFn = @extern(*const fn ([*:0]const u8, ?*AppLaunchContext, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_app_info_launch_default_for_uri" });
    const ret = cFn(arg_uri, arg_context, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn appInfoLaunchDefaultForUriAsync(arg_uri: [*:0]const u8, arg_context: ?*AppLaunchContext, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
    const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
    argC_callback.closure.once = true;
    const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
    const cFn = @extern(*const fn ([*:0]const u8, ?*AppLaunchContext, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_app_info_launch_default_for_uri_async" });
    const ret = cFn(arg_uri, arg_context, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
    return ret;
}
pub fn appInfoLaunchDefaultForUriFinish(arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!bool {
    const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_app_info_launch_default_for_uri_finish" });
    const ret = cFn(arg_result, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn appInfoResetTypeAssociations(arg_content_type: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) void, .{ .name = "g_app_info_reset_type_associations" });
    const ret = cFn(arg_content_type);
    return ret;
}
pub fn asyncInitableNewvAsync(arg_object_type: core.Type, arg_n_parameters: u32, arg_parameters: *GObject.Parameter, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
    const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
    argC_callback.closure.once = true;
    const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
    const cFn = @extern(*const fn (core.Type, u32, *GObject.Parameter, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_async_initable_newv_async" });
    const ret = cFn(arg_object_type, arg_n_parameters, arg_parameters, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
    return ret;
}
pub fn busGet(arg_bus_type: BusType, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
    const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
    argC_callback.closure.once = true;
    const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
    const cFn = @extern(*const fn (BusType, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_bus_get" });
    const ret = cFn(arg_bus_type, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
    return ret;
}
pub fn busGetFinish(arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*DBusConnection {
    const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) *DBusConnection, .{ .name = "g_bus_get_finish" });
    const ret = cFn(arg_res, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn busGetSync(arg_bus_type: BusType, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*DBusConnection {
    const cFn = @extern(*const fn (BusType, ?*Cancellable, *?*GLib.Error) callconv(.c) *DBusConnection, .{ .name = "g_bus_get_sync" });
    const ret = cFn(arg_bus_type, arg_cancellable, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn busOwnNameOnConnection(arg_connection: *DBusConnection, arg_name: [*:0]const u8, arg_flags: BusNameOwnerFlags, arg_name_acquired_closure: ?*GObject.Closure, arg_name_lost_closure: ?*GObject.Closure) u32 {
    const cFn = @extern(*const fn (*DBusConnection, [*:0]const u8, BusNameOwnerFlags, ?*GObject.Closure, ?*GObject.Closure) callconv(.c) u32, .{ .name = "g_bus_own_name_on_connection_with_closures" });
    const ret = cFn(arg_connection, arg_name, arg_flags, arg_name_acquired_closure, arg_name_lost_closure);
    return ret;
}
pub fn busOwnName(arg_bus_type: BusType, arg_name: [*:0]const u8, arg_flags: BusNameOwnerFlags, arg_bus_acquired_closure: ?*GObject.Closure, arg_name_acquired_closure: ?*GObject.Closure, arg_name_lost_closure: ?*GObject.Closure) u32 {
    const cFn = @extern(*const fn (BusType, [*:0]const u8, BusNameOwnerFlags, ?*GObject.Closure, ?*GObject.Closure, ?*GObject.Closure) callconv(.c) u32, .{ .name = "g_bus_own_name_with_closures" });
    const ret = cFn(arg_bus_type, arg_name, arg_flags, arg_bus_acquired_closure, arg_name_acquired_closure, arg_name_lost_closure);
    return ret;
}
pub fn busUnownName(arg_owner_id: u32) void {
    const cFn = @extern(*const fn (u32) callconv(.c) void, .{ .name = "g_bus_unown_name" });
    const ret = cFn(arg_owner_id);
    return ret;
}
pub fn busUnwatchName(arg_watcher_id: u32) void {
    const cFn = @extern(*const fn (u32) callconv(.c) void, .{ .name = "g_bus_unwatch_name" });
    const ret = cFn(arg_watcher_id);
    return ret;
}
pub fn busWatchNameOnConnection(arg_connection: *DBusConnection, arg_name: [*:0]const u8, arg_flags: BusNameWatcherFlags, arg_name_appeared_closure: ?*GObject.Closure, arg_name_vanished_closure: ?*GObject.Closure) u32 {
    const cFn = @extern(*const fn (*DBusConnection, [*:0]const u8, BusNameWatcherFlags, ?*GObject.Closure, ?*GObject.Closure) callconv(.c) u32, .{ .name = "g_bus_watch_name_on_connection_with_closures" });
    const ret = cFn(arg_connection, arg_name, arg_flags, arg_name_appeared_closure, arg_name_vanished_closure);
    return ret;
}
pub fn busWatchName(arg_bus_type: BusType, arg_name: [*:0]const u8, arg_flags: BusNameWatcherFlags, arg_name_appeared_closure: ?*GObject.Closure, arg_name_vanished_closure: ?*GObject.Closure) u32 {
    const cFn = @extern(*const fn (BusType, [*:0]const u8, BusNameWatcherFlags, ?*GObject.Closure, ?*GObject.Closure) callconv(.c) u32, .{ .name = "g_bus_watch_name_with_closures" });
    const ret = cFn(arg_bus_type, arg_name, arg_flags, arg_name_appeared_closure, arg_name_vanished_closure);
    return ret;
}
pub fn contentTypeCanBeExecutable(arg_type: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_content_type_can_be_executable" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn contentTypeEquals(arg_type1: [*:0]const u8, arg_type2: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) bool, .{ .name = "g_content_type_equals" });
    const ret = cFn(arg_type1, arg_type2);
    return ret;
}
pub fn contentTypeFromMimeType(arg_mime_type: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_content_type_from_mime_type" });
    const ret = cFn(arg_mime_type);
    return ret;
}
pub fn contentTypeGetDescription(arg_type: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_content_type_get_description" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn contentTypeGetGenericIconName(arg_type: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_content_type_get_generic_icon_name" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn contentTypeGetIcon(arg_type: [*:0]const u8) *Icon {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *Icon, .{ .name = "g_content_type_get_icon" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn contentTypeGetMimeDirs() [*]?[*:0]const u8 {
    const cFn = @extern(*const fn () callconv(.c) [*]?[*:0]const u8, .{ .name = "g_content_type_get_mime_dirs" });
    const ret = cFn();
    return ret;
}
pub fn contentTypeGetMimeType(arg_type: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_content_type_get_mime_type" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn contentTypeGetSymbolicIcon(arg_type: [*:0]const u8) *Icon {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *Icon, .{ .name = "g_content_type_get_symbolic_icon" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn contentTypeGuess(arg_filename: ?[*:0]const u8, argS_data: []u8) struct {
    ret: [*:0]u8,
    result_uncertain: bool,
} {
    const arg_data: ?[*]u8 = @ptrCast(argS_data);
    const arg_data_size: u64 = @intCast((argS_data).len);
    var argO_result_uncertain: bool = undefined;
    const arg_result_uncertain: ?*bool = &argO_result_uncertain;
    const cFn = @extern(*const fn (?[*:0]const u8, ?[*]u8, u64, ?*bool) callconv(.c) [*:0]u8, .{ .name = "g_content_type_guess" });
    const ret = cFn(arg_filename, arg_data, arg_data_size, arg_result_uncertain);
    return .{ .ret = ret, .result_uncertain = argO_result_uncertain };
}
pub fn contentTypeGuessForTree(arg_root: *File) [*]?[*:0]const u8 {
    const cFn = @extern(*const fn (*File) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_content_type_guess_for_tree" });
    const ret = cFn(arg_root);
    return ret;
}
pub fn contentTypeIsA(arg_type: [*:0]const u8, arg_supertype: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) bool, .{ .name = "g_content_type_is_a" });
    const ret = cFn(arg_type, arg_supertype);
    return ret;
}
pub fn contentTypeIsMimeType(arg_type: [*:0]const u8, arg_mime_type: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) bool, .{ .name = "g_content_type_is_mime_type" });
    const ret = cFn(arg_type, arg_mime_type);
    return ret;
}
pub fn contentTypeIsUnknown(arg_type: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_content_type_is_unknown" });
    const ret = cFn(arg_type);
    return ret;
}
pub fn contentTypeSetMimeDirs(arg_dirs: ?[*]?[*:0]const u8) void {
    const cFn = @extern(*const fn (?[*]?[*:0]const u8) callconv(.c) void, .{ .name = "g_content_type_set_mime_dirs" });
    const ret = cFn(arg_dirs);
    return ret;
}
pub fn contentTypesGetRegistered() ?*GLib.List {
    const cFn = @extern(*const fn () callconv(.c) ?*GLib.List, .{ .name = "g_content_types_get_registered" });
    const ret = cFn();
    return ret;
}
pub fn dbusAddressEscapeValue(arg_string: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_dbus_address_escape_value" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn dbusAddressGetForBusSync(arg_bus_type: BusType, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
    const cFn = @extern(*const fn (BusType, ?*Cancellable, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_dbus_address_get_for_bus_sync" });
    const ret = cFn(arg_bus_type, arg_cancellable, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn dbusAddressGetStream(arg_address: [*:0]const u8, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
    const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
    argC_callback.closure.once = true;
    const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
    const cFn = @extern(*const fn ([*:0]const u8, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_dbus_address_get_stream" });
    const ret = cFn(arg_address, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
    return ret;
}
pub fn dbusAddressGetStreamFinish(arg_res: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: *IOStream,
    out_guid: ?[*:0]u8,
} {
    var argO_out_guid: ?[*:0]u8 = undefined;
    const arg_out_guid: ?*?[*:0]u8 = &argO_out_guid;
    const cFn = @extern(*const fn (*AsyncResult, ?*?[*:0]u8, *?*GLib.Error) callconv(.c) *IOStream, .{ .name = "g_dbus_address_get_stream_finish" });
    const ret = cFn(arg_res, arg_out_guid, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .out_guid = argO_out_guid };
}
pub fn dbusAddressGetStreamSync(arg_address: [*:0]const u8, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: *IOStream,
    out_guid: ?[*:0]u8,
} {
    var argO_out_guid: ?[*:0]u8 = undefined;
    const arg_out_guid: ?*?[*:0]u8 = &argO_out_guid;
    const cFn = @extern(*const fn ([*:0]const u8, ?*?[*:0]u8, ?*Cancellable, *?*GLib.Error) callconv(.c) *IOStream, .{ .name = "g_dbus_address_get_stream_sync" });
    const ret = cFn(arg_address, arg_out_guid, arg_cancellable, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .out_guid = argO_out_guid };
}
pub fn dbusAnnotationInfoLookup(arg_annotations: ?[*:null]?*DBusAnnotationInfo, arg_name: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn (?[*:null]?*DBusAnnotationInfo, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_annotation_info_lookup" });
    const ret = cFn(arg_annotations, arg_name);
    return ret;
}
pub fn dbusErrorEncodeGerror(arg_error: *GLib.Error) [*:0]u8 {
    const cFn = @extern(*const fn (*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_dbus_error_encode_gerror" });
    const ret = cFn(arg_error);
    return ret;
}
pub fn dbusErrorGetRemoteError(arg_error: *GLib.Error) ?[*:0]u8 {
    const cFn = @extern(*const fn (*GLib.Error) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_error_get_remote_error" });
    const ret = cFn(arg_error);
    return ret;
}
pub fn dbusErrorIsRemoteError(arg_error: *GLib.Error) bool {
    const cFn = @extern(*const fn (*GLib.Error) callconv(.c) bool, .{ .name = "g_dbus_error_is_remote_error" });
    const ret = cFn(arg_error);
    return ret;
}
pub fn dbusErrorNewForDbusError(arg_dbus_error_name: [*:0]const u8, arg_dbus_error_message: [*:0]const u8) *GLib.Error {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) *GLib.Error, .{ .name = "g_dbus_error_new_for_dbus_error" });
    const ret = cFn(arg_dbus_error_name, arg_dbus_error_message);
    return ret;
}
pub fn dbusErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_dbus_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn dbusErrorRegisterError(arg_error_domain: u32, arg_error_code: i32, arg_dbus_error_name: [*:0]const u8) bool {
    const cFn = @extern(*const fn (u32, i32, [*:0]const u8) callconv(.c) bool, .{ .name = "g_dbus_error_register_error" });
    const ret = cFn(arg_error_domain, arg_error_code, arg_dbus_error_name);
    return ret;
}
pub fn dbusErrorRegisterErrorDomain(arg_error_domain_quark_name: [*:0]const u8, arg_quark_volatile: *u64, argS_entries: []DBusErrorEntry) void {
    const arg_entries: [*]DBusErrorEntry = @ptrCast(argS_entries);
    const arg_num_entries: u32 = @intCast((argS_entries).len);
    const cFn = @extern(*const fn ([*:0]const u8, *u64, [*]DBusErrorEntry, u32) callconv(.c) void, .{ .name = "g_dbus_error_register_error_domain" });
    const ret = cFn(arg_error_domain_quark_name, arg_quark_volatile, arg_entries, arg_num_entries);
    return ret;
}
pub fn dbusErrorStripRemoteError(arg_error: *GLib.Error) bool {
    const cFn = @extern(*const fn (*GLib.Error) callconv(.c) bool, .{ .name = "g_dbus_error_strip_remote_error" });
    const ret = cFn(arg_error);
    return ret;
}
pub fn dbusErrorUnregisterError(arg_error_domain: u32, arg_error_code: i32, arg_dbus_error_name: [*:0]const u8) bool {
    const cFn = @extern(*const fn (u32, i32, [*:0]const u8) callconv(.c) bool, .{ .name = "g_dbus_error_unregister_error" });
    const ret = cFn(arg_error_domain, arg_error_code, arg_dbus_error_name);
    return ret;
}
pub fn dbusEscapeObjectPath(arg_s: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_dbus_escape_object_path" });
    const ret = cFn(arg_s);
    return ret;
}
pub fn dbusEscapeObjectPathBytestring(arg_bytes: [*:0]u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]u8) callconv(.c) [*:0]u8, .{ .name = "g_dbus_escape_object_path_bytestring" });
    const ret = cFn(arg_bytes);
    return ret;
}
pub fn dbusGenerateGuid() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_dbus_generate_guid" });
    const ret = cFn();
    return ret;
}
pub fn dbusGvalueToGvariant(arg_gvalue: *GObject.Value, arg_type: *GLib.VariantType) *GLib.Variant {
    const cFn = @extern(*const fn (*GObject.Value, *GLib.VariantType) callconv(.c) *GLib.Variant, .{ .name = "g_dbus_gvalue_to_gvariant" });
    const ret = cFn(arg_gvalue, arg_type);
    return ret;
}
pub fn dbusGvariantToGvalue(arg_value: *GLib.Variant, arg_out_gvalue: *GObject.Value) void {
    const cFn = @extern(*const fn (*GLib.Variant, *GObject.Value) callconv(.c) void, .{ .name = "g_dbus_gvariant_to_gvalue" });
    const ret = cFn(arg_value, arg_out_gvalue);
    return ret;
}
pub fn dbusIsAddress(arg_string: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_dbus_is_address" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn dbusIsErrorName(arg_string: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_dbus_is_error_name" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn dbusIsGuid(arg_string: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_dbus_is_guid" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn dbusIsInterfaceName(arg_string: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_dbus_is_interface_name" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn dbusIsMemberName(arg_string: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_dbus_is_member_name" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn dbusIsName(arg_string: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_dbus_is_name" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn dbusIsSupportedAddress(arg_string: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
    const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_dbus_is_supported_address" });
    const ret = cFn(arg_string, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn dbusIsUniqueName(arg_string: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_dbus_is_unique_name" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn dbusUnescapeObjectPath(arg_s: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_dbus_unescape_object_path" });
    const ret = cFn(arg_s);
    return ret;
}
pub fn dtlsClientConnectionNew(arg_base_socket: *DatagramBased, arg_server_identity: ?*SocketConnectable, arg_error: *?*GLib.Error) error{GError}!*DtlsClientConnection {
    const cFn = @extern(*const fn (*DatagramBased, ?*SocketConnectable, *?*GLib.Error) callconv(.c) *DtlsClientConnection, .{ .name = "g_dtls_client_connection_new" });
    const ret = cFn(arg_base_socket, arg_server_identity, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn dtlsServerConnectionNew(arg_base_socket: *DatagramBased, arg_certificate: ?*TlsCertificate, arg_error: *?*GLib.Error) error{GError}!*DtlsServerConnection {
    const cFn = @extern(*const fn (*DatagramBased, ?*TlsCertificate, *?*GLib.Error) callconv(.c) *DtlsServerConnection, .{ .name = "g_dtls_server_connection_new" });
    const ret = cFn(arg_base_socket, arg_certificate, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn fileNewBuildFilenamev(arg_args: [*]?[*:0]const u8) *File {
    const cFn = @extern(*const fn ([*]?[*:0]const u8) callconv(.c) *File, .{ .name = "g_file_new_build_filenamev" });
    const ret = cFn(arg_args);
    return ret;
}
pub fn fileNewForCommandlineArg(arg_arg: [*:0]const u8) *File {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *File, .{ .name = "g_file_new_for_commandline_arg" });
    const ret = cFn(arg_arg);
    return ret;
}
pub fn fileNewForCommandlineArgAndCwd(arg_arg: [*:0]const u8, arg_cwd: [*:0]const u8) *File {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) *File, .{ .name = "g_file_new_for_commandline_arg_and_cwd" });
    const ret = cFn(arg_arg, arg_cwd);
    return ret;
}
pub fn fileNewForPath(arg_path: [*:0]const u8) *File {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *File, .{ .name = "g_file_new_for_path" });
    const ret = cFn(arg_path);
    return ret;
}
pub fn fileNewForUri(arg_uri: [*:0]const u8) *File {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *File, .{ .name = "g_file_new_for_uri" });
    const ret = cFn(arg_uri);
    return ret;
}
pub fn fileNewTmp(arg_tmpl: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: *File,
    iostream: *FileIOStream,
} {
    var argO_iostream: *FileIOStream = undefined;
    const arg_iostream: **FileIOStream = &argO_iostream;
    const cFn = @extern(*const fn (?[*:0]const u8, **FileIOStream, *?*GLib.Error) callconv(.c) *File, .{ .name = "g_file_new_tmp" });
    const ret = cFn(arg_tmpl, arg_iostream, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .iostream = argO_iostream };
}
pub fn fileNewTmpAsync(arg_tmpl: ?[*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
    const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
    argC_callback.closure.once = true;
    const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
    const cFn = @extern(*const fn (?[*:0]const u8, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_new_tmp_async" });
    const ret = cFn(arg_tmpl, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
    return ret;
}
pub fn fileNewTmpDirAsync(arg_tmpl: ?[*:0]const u8, arg_io_priority: i32, arg_cancellable: ?*Cancellable, argC_callback: core.Closure(?AsyncReadyCallback)) void {
    const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
    argC_callback.closure.once = true;
    const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
    const cFn = @extern(*const fn (?[*:0]const u8, i32, ?*Cancellable, ?AsyncReadyCallback, ?*anyopaque) callconv(.c) void, .{ .name = "g_file_new_tmp_dir_async" });
    const ret = cFn(arg_tmpl, arg_io_priority, arg_cancellable, arg_callback, @ptrCast(arg_user_data));
    return ret;
}
pub fn fileNewTmpDirFinish(arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!*File {
    const cFn = @extern(*const fn (*AsyncResult, *?*GLib.Error) callconv(.c) *File, .{ .name = "g_file_new_tmp_dir_finish" });
    const ret = cFn(arg_result, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn fileNewTmpFinish(arg_result: *AsyncResult, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: *File,
    iostream: *FileIOStream,
} {
    var argO_iostream: *FileIOStream = undefined;
    const arg_iostream: **FileIOStream = &argO_iostream;
    const cFn = @extern(*const fn (*AsyncResult, **FileIOStream, *?*GLib.Error) callconv(.c) *File, .{ .name = "g_file_new_tmp_finish" });
    const ret = cFn(arg_result, arg_iostream, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .iostream = argO_iostream };
}
pub fn fileParseName(arg_parse_name: [*:0]const u8) *File {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *File, .{ .name = "g_file_parse_name" });
    const ret = cFn(arg_parse_name);
    return ret;
}
pub fn iconDeserialize(arg_value: *GLib.Variant) ?*Icon {
    const cFn = @extern(*const fn (*GLib.Variant) callconv(.c) ?*Icon, .{ .name = "g_icon_deserialize" });
    const ret = cFn(arg_value);
    return ret;
}
pub fn iconNewForString(arg_str: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*Icon {
    const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) *Icon, .{ .name = "g_icon_new_for_string" });
    const ret = cFn(arg_str, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn initableNewv(arg_object_type: core.Type, argS_parameters: []GObject.Parameter, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!*GObject.Object {
    const arg_n_parameters: u32 = @intCast((argS_parameters).len);
    const arg_parameters: [*]GObject.Parameter = @ptrCast(argS_parameters);
    const cFn = @extern(*const fn (core.Type, u32, [*]GObject.Parameter, ?*Cancellable, *?*GLib.Error) callconv(.c) *GObject.Object, .{ .name = "g_initable_newv" });
    const ret = cFn(arg_object_type, arg_n_parameters, arg_parameters, arg_cancellable, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn ioErrorFromErrno(arg_err_no: i32) IOErrorEnum {
    const cFn = @extern(*const fn (i32) callconv(.c) IOErrorEnum, .{ .name = "g_io_error_from_errno" });
    const ret = cFn(arg_err_no);
    return ret;
}
pub fn ioErrorFromFileError(arg_file_error: GLib.FileError) IOErrorEnum {
    const cFn = @extern(*const fn (GLib.FileError) callconv(.c) IOErrorEnum, .{ .name = "g_io_error_from_file_error" });
    const ret = cFn(arg_file_error);
    return ret;
}
pub fn ioErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_io_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn ioExtensionPointImplement(arg_extension_point_name: [*:0]const u8, arg_type: core.Type, arg_extension_name: [*:0]const u8, arg_priority: i32) *IOExtension {
    const cFn = @extern(*const fn ([*:0]const u8, core.Type, [*:0]const u8, i32) callconv(.c) *IOExtension, .{ .name = "g_io_extension_point_implement" });
    const ret = cFn(arg_extension_point_name, arg_type, arg_extension_name, arg_priority);
    return ret;
}
pub fn ioExtensionPointLookup(arg_name: [*:0]const u8) *IOExtensionPoint {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *IOExtensionPoint, .{ .name = "g_io_extension_point_lookup" });
    const ret = cFn(arg_name);
    return ret;
}
pub fn ioExtensionPointRegister(arg_name: [*:0]const u8) *IOExtensionPoint {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *IOExtensionPoint, .{ .name = "g_io_extension_point_register" });
    const ret = cFn(arg_name);
    return ret;
}
pub fn ioModulesLoadAllInDirectory(arg_dirname: [*:0]const u8) ?*GLib.List {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*GLib.List, .{ .name = "g_io_modules_load_all_in_directory" });
    const ret = cFn(arg_dirname);
    return ret;
}
pub fn ioModulesLoadAllInDirectoryWithScope(arg_dirname: [*:0]const u8, arg_scope: *IOModuleScope) ?*GLib.List {
    const cFn = @extern(*const fn ([*:0]const u8, *IOModuleScope) callconv(.c) ?*GLib.List, .{ .name = "g_io_modules_load_all_in_directory_with_scope" });
    const ret = cFn(arg_dirname, arg_scope);
    return ret;
}
pub fn ioModulesScanAllInDirectory(arg_dirname: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) void, .{ .name = "g_io_modules_scan_all_in_directory" });
    const ret = cFn(arg_dirname);
    return ret;
}
pub fn ioModulesScanAllInDirectoryWithScope(arg_dirname: [*:0]const u8, arg_scope: *IOModuleScope) void {
    const cFn = @extern(*const fn ([*:0]const u8, *IOModuleScope) callconv(.c) void, .{ .name = "g_io_modules_scan_all_in_directory_with_scope" });
    const ret = cFn(arg_dirname, arg_scope);
    return ret;
}
pub fn ioSchedulerCancelAllJobs() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_io_scheduler_cancel_all_jobs" });
    const ret = cFn();
    return ret;
}
pub fn ioSchedulerPushJob(argC_job_func: core.Closure(IOSchedulerJobFunc), arg_io_priority: i32, arg_cancellable: ?*Cancellable) void {
    const arg_job_func: IOSchedulerJobFunc = @ptrCast(argC_job_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_job_func.data());
    const arg_notify: ?GLib.DestroyNotify = @ptrCast(argC_job_func.destroy());
    const cFn = @extern(*const fn (IOSchedulerJobFunc, ?*anyopaque, ?GLib.DestroyNotify, i32, ?*Cancellable) callconv(.c) void, .{ .name = "g_io_scheduler_push_job" });
    const ret = cFn(arg_job_func, @ptrCast(arg_user_data), arg_notify, arg_io_priority, arg_cancellable);
    return ret;
}
pub fn keyfileSettingsBackendNew(arg_filename: [*:0]const u8, arg_root_path: [*:0]const u8, arg_root_group: ?[*:0]const u8) *SettingsBackend {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, ?[*:0]const u8) callconv(.c) *SettingsBackend, .{ .name = "g_keyfile_settings_backend_new" });
    const ret = cFn(arg_filename, arg_root_path, arg_root_group);
    return ret;
}
pub fn memoryMonitorDupDefault() *MemoryMonitor {
    const cFn = @extern(*const fn () callconv(.c) *MemoryMonitor, .{ .name = "g_memory_monitor_dup_default" });
    const ret = cFn();
    return ret;
}
pub fn memorySettingsBackendNew() *SettingsBackend {
    const cFn = @extern(*const fn () callconv(.c) *SettingsBackend, .{ .name = "g_memory_settings_backend_new" });
    const ret = cFn();
    return ret;
}
pub fn networkMonitorGetDefault() *NetworkMonitor {
    const cFn = @extern(*const fn () callconv(.c) *NetworkMonitor, .{ .name = "g_network_monitor_get_default" });
    const ret = cFn();
    return ret;
}
pub fn networkingInit() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_networking_init" });
    const ret = cFn();
    return ret;
}
pub fn nullSettingsBackendNew() *SettingsBackend {
    const cFn = @extern(*const fn () callconv(.c) *SettingsBackend, .{ .name = "g_null_settings_backend_new" });
    const ret = cFn();
    return ret;
}
pub fn pollableSourceNew(arg_pollable_stream: *GObject.Object) *GLib.Source {
    const cFn = @extern(*const fn (*GObject.Object) callconv(.c) *GLib.Source, .{ .name = "g_pollable_source_new" });
    const ret = cFn(arg_pollable_stream);
    return ret;
}
pub fn pollableSourceNewFull(arg_pollable_stream: *GObject.Object, arg_child_source: ?*GLib.Source, arg_cancellable: ?*Cancellable) *GLib.Source {
    const cFn = @extern(*const fn (*GObject.Object, ?*GLib.Source, ?*Cancellable) callconv(.c) *GLib.Source, .{ .name = "g_pollable_source_new_full" });
    const ret = cFn(arg_pollable_stream, arg_child_source, arg_cancellable);
    return ret;
}
pub fn pollableStreamRead(arg_stream: *InputStream, argS_buffer: []u8, arg_blocking: bool, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
    const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
    const arg_count: u64 = @intCast((argS_buffer).len);
    const cFn = @extern(*const fn (*InputStream, [*]u8, u64, bool, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_pollable_stream_read" });
    const ret = cFn(arg_stream, arg_buffer, arg_count, arg_blocking, arg_cancellable, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn pollableStreamWrite(arg_stream: *OutputStream, argS_buffer: []u8, arg_blocking: bool, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!i64 {
    const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
    const arg_count: u64 = @intCast((argS_buffer).len);
    const cFn = @extern(*const fn (*OutputStream, [*]u8, u64, bool, ?*Cancellable, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_pollable_stream_write" });
    const ret = cFn(arg_stream, arg_buffer, arg_count, arg_blocking, arg_cancellable, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn pollableStreamWriteAll(arg_stream: *OutputStream, argS_buffer: []u8, arg_blocking: bool, arg_cancellable: ?*Cancellable, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    bytes_written: u64,
} {
    const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
    const arg_count: u64 = @intCast((argS_buffer).len);
    var argO_bytes_written: u64 = undefined;
    const arg_bytes_written: *u64 = &argO_bytes_written;
    const cFn = @extern(*const fn (*OutputStream, [*]u8, u64, bool, *u64, ?*Cancellable, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_pollable_stream_write_all" });
    const ret = cFn(arg_stream, arg_buffer, arg_count, arg_blocking, arg_bytes_written, arg_cancellable, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .bytes_written = argO_bytes_written };
}
pub fn powerProfileMonitorDupDefault() *PowerProfileMonitor {
    const cFn = @extern(*const fn () callconv(.c) *PowerProfileMonitor, .{ .name = "g_power_profile_monitor_dup_default" });
    const ret = cFn();
    return ret;
}
pub fn proxyGetDefaultForProtocol(arg_protocol: [*:0]const u8) ?*Proxy {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?*Proxy, .{ .name = "g_proxy_get_default_for_protocol" });
    const ret = cFn(arg_protocol);
    return ret;
}
pub fn proxyResolverGetDefault() *ProxyResolver {
    const cFn = @extern(*const fn () callconv(.c) *ProxyResolver, .{ .name = "g_proxy_resolver_get_default" });
    const ret = cFn();
    return ret;
}
pub fn resolverErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_resolver_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn resourceErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_resource_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn resourceLoad(arg_filename: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*Resource {
    const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) *Resource, .{ .name = "g_resource_load" });
    const ret = cFn(arg_filename, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn resourcesEnumerateChildren(arg_path: [*:0]const u8, arg_lookup_flags: ResourceLookupFlags, arg_error: *?*GLib.Error) error{GError}![*]?[*:0]const u8 {
    const cFn = @extern(*const fn ([*:0]const u8, ResourceLookupFlags, *?*GLib.Error) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_resources_enumerate_children" });
    const ret = cFn(arg_path, arg_lookup_flags, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn resourcesGetInfo(arg_path: [*:0]const u8, arg_lookup_flags: ResourceLookupFlags, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    size: u64,
    flags: u32,
} {
    var argO_size: u64 = undefined;
    const arg_size: ?*u64 = &argO_size;
    var argO_flags: u32 = undefined;
    const arg_flags: ?*u32 = &argO_flags;
    const cFn = @extern(*const fn ([*:0]const u8, ResourceLookupFlags, ?*u64, ?*u32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_resources_get_info" });
    const ret = cFn(arg_path, arg_lookup_flags, arg_size, arg_flags, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .size = argO_size, .flags = argO_flags };
}
pub fn resourcesHasChildren(arg_path: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_resources_has_children" });
    const ret = cFn(arg_path);
    return ret;
}
pub fn resourcesLookupData(arg_path: [*:0]const u8, arg_lookup_flags: ResourceLookupFlags, arg_error: *?*GLib.Error) error{GError}!*GLib.Bytes {
    const cFn = @extern(*const fn ([*:0]const u8, ResourceLookupFlags, *?*GLib.Error) callconv(.c) *GLib.Bytes, .{ .name = "g_resources_lookup_data" });
    const ret = cFn(arg_path, arg_lookup_flags, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn resourcesOpenStream(arg_path: [*:0]const u8, arg_lookup_flags: ResourceLookupFlags, arg_error: *?*GLib.Error) error{GError}!*InputStream {
    const cFn = @extern(*const fn ([*:0]const u8, ResourceLookupFlags, *?*GLib.Error) callconv(.c) *InputStream, .{ .name = "g_resources_open_stream" });
    const ret = cFn(arg_path, arg_lookup_flags, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn resourcesRegister(arg_resource: *Resource) void {
    const cFn = @extern(*const fn (*Resource) callconv(.c) void, .{ .name = "g_resources_register" });
    const ret = cFn(arg_resource);
    return ret;
}
pub fn resourcesUnregister(arg_resource: *Resource) void {
    const cFn = @extern(*const fn (*Resource) callconv(.c) void, .{ .name = "g_resources_unregister" });
    const ret = cFn(arg_resource);
    return ret;
}
pub fn settingsSchemaSourceGetDefault() ?*SettingsSchemaSource {
    const cFn = @extern(*const fn () callconv(.c) ?*SettingsSchemaSource, .{ .name = "g_settings_schema_source_get_default" });
    const ret = cFn();
    return ret;
}
pub fn simpleAsyncReportGerrorInIdle(arg_object: ?*GObject.Object, argC_callback: core.Closure(?AsyncReadyCallback), arg_error: *GLib.Error) void {
    const arg_callback: ?AsyncReadyCallback = @ptrCast(argC_callback.callback());
    argC_callback.closure.once = true;
    const arg_user_data: ?*anyopaque = @ptrCast(argC_callback.data());
    const cFn = @extern(*const fn (?*GObject.Object, ?AsyncReadyCallback, ?*anyopaque, *GLib.Error) callconv(.c) void, .{ .name = "g_simple_async_report_gerror_in_idle" });
    const ret = cFn(arg_object, arg_callback, @ptrCast(arg_user_data), arg_error);
    return ret;
}
pub fn tlsBackendGetDefault() *TlsBackend {
    const cFn = @extern(*const fn () callconv(.c) *TlsBackend, .{ .name = "g_tls_backend_get_default" });
    const ret = cFn();
    return ret;
}
pub fn tlsChannelBindingErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_tls_channel_binding_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn tlsClientConnectionNew(arg_base_io_stream: *IOStream, arg_server_identity: ?*SocketConnectable, arg_error: *?*GLib.Error) error{GError}!*TlsClientConnection {
    const cFn = @extern(*const fn (*IOStream, ?*SocketConnectable, *?*GLib.Error) callconv(.c) *TlsClientConnection, .{ .name = "g_tls_client_connection_new" });
    const ret = cFn(arg_base_io_stream, arg_server_identity, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn tlsErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_tls_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn tlsFileDatabaseNew(arg_anchors: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*TlsFileDatabase {
    const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) *TlsFileDatabase, .{ .name = "g_tls_file_database_new" });
    const ret = cFn(arg_anchors, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn tlsServerConnectionNew(arg_base_io_stream: *IOStream, arg_certificate: ?*TlsCertificate, arg_error: *?*GLib.Error) error{GError}!*TlsServerConnection {
    const cFn = @extern(*const fn (*IOStream, ?*TlsCertificate, *?*GLib.Error) callconv(.c) *TlsServerConnection, .{ .name = "g_tls_server_connection_new" });
    const ret = cFn(arg_base_io_stream, arg_certificate, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn unixIsMountPathSystemInternal(arg_mount_path: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_unix_is_mount_path_system_internal" });
    const ret = cFn(arg_mount_path);
    return ret;
}
pub fn unixIsSystemDevicePath(arg_device_path: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_unix_is_system_device_path" });
    const ret = cFn(arg_device_path);
    return ret;
}
pub fn unixIsSystemFsType(arg_fs_type: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_unix_is_system_fs_type" });
    const ret = cFn(arg_fs_type);
    return ret;
}
pub fn unixMountAt(arg_mount_path: [*:0]const u8) struct {
    ret: ?*UnixMountEntry,
    time_read: u64,
} {
    var argO_time_read: u64 = undefined;
    const arg_time_read: ?*u64 = &argO_time_read;
    const cFn = @extern(*const fn ([*:0]const u8, ?*u64) callconv(.c) ?*UnixMountEntry, .{ .name = "g_unix_mount_at" });
    const ret = cFn(arg_mount_path, arg_time_read);
    return .{ .ret = ret, .time_read = argO_time_read };
}
pub fn unixMountCompare(arg_mount1: *UnixMountEntry, arg_mount2: *UnixMountEntry) i32 {
    const cFn = @extern(*const fn (*UnixMountEntry, *UnixMountEntry) callconv(.c) i32, .{ .name = "g_unix_mount_compare" });
    const ret = cFn(arg_mount1, arg_mount2);
    return ret;
}
pub fn unixMountCopy(arg_mount_entry: *UnixMountEntry) *UnixMountEntry {
    const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) *UnixMountEntry, .{ .name = "g_unix_mount_copy" });
    const ret = cFn(arg_mount_entry);
    return ret;
}
pub fn unixMountEntriesChangedSince(arg_time: u64) bool {
    const cFn = @extern(*const fn (u64) callconv(.c) bool, .{ .name = "g_unix_mount_entries_changed_since" });
    const ret = cFn(arg_time);
    return ret;
}
pub fn unixMountEntriesGet() struct {
    ret: ?*GLib.List,
    time_read: u64,
} {
    var argO_time_read: u64 = undefined;
    const arg_time_read: ?*u64 = &argO_time_read;
    const cFn = @extern(*const fn (?*u64) callconv(.c) ?*GLib.List, .{ .name = "g_unix_mount_entries_get" });
    const ret = cFn(arg_time_read);
    return .{ .ret = ret, .time_read = argO_time_read };
}
pub fn unixMountEntriesGetFromFile(arg_table_path: [*:0]const u8, arg_time_read_out: ?*u64, arg_n_entries_out: ?*u64) []*UnixMountEntry {
    const cFn = @extern(*const fn ([*:0]const u8, ?*u64, ?*u64) callconv(.c) ?[*]*UnixMountEntry, .{ .name = "g_unix_mount_entries_get_from_file" });
    const ret = cFn(arg_table_path, arg_time_read_out, arg_n_entries_out);
    return ret[0..@intCast(arg_n_entries_out)];
}
pub fn unixMountEntryAt(arg_mount_path: [*:0]const u8) struct {
    ret: ?*UnixMountEntry,
    time_read: u64,
} {
    var argO_time_read: u64 = undefined;
    const arg_time_read: ?*u64 = &argO_time_read;
    const cFn = @extern(*const fn ([*:0]const u8, ?*u64) callconv(.c) ?*UnixMountEntry, .{ .name = "g_unix_mount_entry_at" });
    const ret = cFn(arg_mount_path, arg_time_read);
    return .{ .ret = ret, .time_read = argO_time_read };
}
pub fn unixMountEntryFor(arg_file_path: [*:0]const u8) struct {
    ret: ?*UnixMountEntry,
    time_read: u64,
} {
    var argO_time_read: u64 = undefined;
    const arg_time_read: ?*u64 = &argO_time_read;
    const cFn = @extern(*const fn ([*:0]const u8, ?*u64) callconv(.c) ?*UnixMountEntry, .{ .name = "g_unix_mount_entry_for" });
    const ret = cFn(arg_file_path, arg_time_read);
    return .{ .ret = ret, .time_read = argO_time_read };
}
pub fn unixMountFor(arg_file_path: [*:0]const u8) struct {
    ret: ?*UnixMountEntry,
    time_read: u64,
} {
    var argO_time_read: u64 = undefined;
    const arg_time_read: ?*u64 = &argO_time_read;
    const cFn = @extern(*const fn ([*:0]const u8, ?*u64) callconv(.c) ?*UnixMountEntry, .{ .name = "g_unix_mount_for" });
    const ret = cFn(arg_file_path, arg_time_read);
    return .{ .ret = ret, .time_read = argO_time_read };
}
pub fn unixMountFree(arg_mount_entry: *UnixMountEntry) void {
    const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) void, .{ .name = "g_unix_mount_free" });
    const ret = cFn(arg_mount_entry);
    return ret;
}
pub fn unixMountGetDevicePath(arg_mount_entry: *UnixMountEntry) [*:0]u8 {
    const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) [*:0]u8, .{ .name = "g_unix_mount_get_device_path" });
    const ret = cFn(arg_mount_entry);
    return ret;
}
pub fn unixMountGetFsType(arg_mount_entry: *UnixMountEntry) [*:0]u8 {
    const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) [*:0]u8, .{ .name = "g_unix_mount_get_fs_type" });
    const ret = cFn(arg_mount_entry);
    return ret;
}
pub fn unixMountGetMountPath(arg_mount_entry: *UnixMountEntry) [*:0]u8 {
    const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) [*:0]u8, .{ .name = "g_unix_mount_get_mount_path" });
    const ret = cFn(arg_mount_entry);
    return ret;
}
pub fn unixMountGetOptions(arg_mount_entry: *UnixMountEntry) ?[*:0]u8 {
    const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) ?[*:0]u8, .{ .name = "g_unix_mount_get_options" });
    const ret = cFn(arg_mount_entry);
    return ret;
}
pub fn unixMountGetRootPath(arg_mount_entry: *UnixMountEntry) ?[*:0]u8 {
    const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) ?[*:0]u8, .{ .name = "g_unix_mount_get_root_path" });
    const ret = cFn(arg_mount_entry);
    return ret;
}
pub fn unixMountGuessCanEject(arg_mount_entry: *UnixMountEntry) bool {
    const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) bool, .{ .name = "g_unix_mount_guess_can_eject" });
    const ret = cFn(arg_mount_entry);
    return ret;
}
pub fn unixMountGuessIcon(arg_mount_entry: *UnixMountEntry) *Icon {
    const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) *Icon, .{ .name = "g_unix_mount_guess_icon" });
    const ret = cFn(arg_mount_entry);
    return ret;
}
pub fn unixMountGuessName(arg_mount_entry: *UnixMountEntry) [*:0]u8 {
    const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) [*:0]u8, .{ .name = "g_unix_mount_guess_name" });
    const ret = cFn(arg_mount_entry);
    return ret;
}
pub fn unixMountGuessShouldDisplay(arg_mount_entry: *UnixMountEntry) bool {
    const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) bool, .{ .name = "g_unix_mount_guess_should_display" });
    const ret = cFn(arg_mount_entry);
    return ret;
}
pub fn unixMountGuessSymbolicIcon(arg_mount_entry: *UnixMountEntry) *Icon {
    const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) *Icon, .{ .name = "g_unix_mount_guess_symbolic_icon" });
    const ret = cFn(arg_mount_entry);
    return ret;
}
pub fn unixMountIsReadonly(arg_mount_entry: *UnixMountEntry) bool {
    const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) bool, .{ .name = "g_unix_mount_is_readonly" });
    const ret = cFn(arg_mount_entry);
    return ret;
}
pub fn unixMountIsSystemInternal(arg_mount_entry: *UnixMountEntry) bool {
    const cFn = @extern(*const fn (*UnixMountEntry) callconv(.c) bool, .{ .name = "g_unix_mount_is_system_internal" });
    const ret = cFn(arg_mount_entry);
    return ret;
}
pub fn unixMountPointAt(arg_mount_path: [*:0]const u8) struct {
    ret: ?*UnixMountPoint,
    time_read: u64,
} {
    var argO_time_read: u64 = undefined;
    const arg_time_read: ?*u64 = &argO_time_read;
    const cFn = @extern(*const fn ([*:0]const u8, ?*u64) callconv(.c) ?*UnixMountPoint, .{ .name = "g_unix_mount_point_at" });
    const ret = cFn(arg_mount_path, arg_time_read);
    return .{ .ret = ret, .time_read = argO_time_read };
}
pub fn unixMountPointsChangedSince(arg_time: u64) bool {
    const cFn = @extern(*const fn (u64) callconv(.c) bool, .{ .name = "g_unix_mount_points_changed_since" });
    const ret = cFn(arg_time);
    return ret;
}
pub fn unixMountPointsGet() struct {
    ret: ?*GLib.List,
    time_read: u64,
} {
    var argO_time_read: u64 = undefined;
    const arg_time_read: ?*u64 = &argO_time_read;
    const cFn = @extern(*const fn (?*u64) callconv(.c) ?*GLib.List, .{ .name = "g_unix_mount_points_get" });
    const ret = cFn(arg_time_read);
    return .{ .ret = ret, .time_read = argO_time_read };
}
pub fn unixMountPointsGetFromFile(arg_table_path: [*:0]const u8, arg_time_read_out: ?*u64, arg_n_points_out: ?*u64) []*UnixMountPoint {
    const cFn = @extern(*const fn ([*:0]const u8, ?*u64, ?*u64) callconv(.c) ?[*]*UnixMountPoint, .{ .name = "g_unix_mount_points_get_from_file" });
    const ret = cFn(arg_table_path, arg_time_read_out, arg_n_points_out);
    return ret[0..@intCast(arg_n_points_out)];
}
pub fn unixMountsChangedSince(arg_time: u64) bool {
    const cFn = @extern(*const fn (u64) callconv(.c) bool, .{ .name = "g_unix_mounts_changed_since" });
    const ret = cFn(arg_time);
    return ret;
}
pub fn unixMountsGet() struct {
    ret: ?*GLib.List,
    time_read: u64,
} {
    var argO_time_read: u64 = undefined;
    const arg_time_read: ?*u64 = &argO_time_read;
    const cFn = @extern(*const fn (?*u64) callconv(.c) ?*GLib.List, .{ .name = "g_unix_mounts_get" });
    const ret = cFn(arg_time_read);
    return .{ .ret = ret, .time_read = argO_time_read };
}
pub fn unixMountsGetFromFile(arg_table_path: [*:0]const u8, arg_time_read_out: ?*u64, arg_n_entries_out: ?*u64) []*UnixMountEntry {
    const cFn = @extern(*const fn ([*:0]const u8, ?*u64, ?*u64) callconv(.c) ?[*]*UnixMountEntry, .{ .name = "g_unix_mounts_get_from_file" });
    const ret = cFn(arg_table_path, arg_time_read_out, arg_n_entries_out);
    return ret[0..@intCast(arg_n_entries_out)];
}

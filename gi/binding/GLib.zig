const core = @import("core.zig");
const GLib = @This();
pub const ALLOCATOR_LIST = 1;
pub const ALLOCATOR_NODE = 3;
pub const ALLOCATOR_SLIST = 2;
pub const ALLOC_AND_FREE = 2;
pub const ALLOC_ONLY = 1;
pub const ANALYZER_ANALYZING = 1;
pub const ASCII_DTOSTR_BUF_SIZE = 39;
pub const ATOMIC_REF_COUNT_INIT = 1;
pub const Allocator = opaque {
    pub fn free(self: *Allocator) void {
        const cFn = @extern(*const fn (*Allocator) callconv(.c) void, .{ .name = "g_allocator_free" });
        const ret = cFn(self);
        return ret;
    }
};
pub const Array = extern struct {
    data: ?[*:0]const u8,
    len: u32,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_array_get_type" });
        return cFn();
    }
};
pub const AsciiType = packed struct(u32) {
    alnum: bool = false,
    alpha: bool = false,
    cntrl: bool = false,
    digit: bool = false,
    graph: bool = false,
    lower: bool = false,
    print: bool = false,
    punct: bool = false,
    space: bool = false,
    upper: bool = false,
    xdigit: bool = false,
    _: u21 = 0,
};
pub const AsyncQueue = opaque {
    pub fn length(self: *AsyncQueue) i32 {
        const cFn = @extern(*const fn (*AsyncQueue) callconv(.c) i32, .{ .name = "g_async_queue_length" });
        const ret = cFn(self);
        return ret;
    }
    pub fn lengthUnlocked(self: *AsyncQueue) i32 {
        const cFn = @extern(*const fn (*AsyncQueue) callconv(.c) i32, .{ .name = "g_async_queue_length_unlocked" });
        const ret = cFn(self);
        return ret;
    }
    pub fn lock(self: *AsyncQueue) void {
        const cFn = @extern(*const fn (*AsyncQueue) callconv(.c) void, .{ .name = "g_async_queue_lock" });
        const ret = cFn(self);
        return ret;
    }
    pub fn pop(self: *AsyncQueue) *anyopaque {
        const cFn = @extern(*const fn (*AsyncQueue) callconv(.c) *anyopaque, .{ .name = "g_async_queue_pop" });
        const ret = cFn(self);
        return ret;
    }
    pub fn popUnlocked(self: *AsyncQueue) *anyopaque {
        const cFn = @extern(*const fn (*AsyncQueue) callconv(.c) *anyopaque, .{ .name = "g_async_queue_pop_unlocked" });
        const ret = cFn(self);
        return ret;
    }
    pub fn push(self: *AsyncQueue, arg_data: *anyopaque) void {
        const cFn = @extern(*const fn (*AsyncQueue, *anyopaque) callconv(.c) void, .{ .name = "g_async_queue_push" });
        const ret = cFn(self, @ptrCast(arg_data));
        return ret;
    }
    pub fn pushFront(self: *AsyncQueue, arg_item: *anyopaque) void {
        const cFn = @extern(*const fn (*AsyncQueue, *anyopaque) callconv(.c) void, .{ .name = "g_async_queue_push_front" });
        const ret = cFn(self, @ptrCast(arg_item));
        return ret;
    }
    pub fn pushFrontUnlocked(self: *AsyncQueue, arg_item: *anyopaque) void {
        const cFn = @extern(*const fn (*AsyncQueue, *anyopaque) callconv(.c) void, .{ .name = "g_async_queue_push_front_unlocked" });
        const ret = cFn(self, @ptrCast(arg_item));
        return ret;
    }
    pub fn pushSorted(self: *AsyncQueue, arg_data: *anyopaque, argC_func: core.Closure(CompareDataFunc)) void {
        const arg_func: CompareDataFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*AsyncQueue, *anyopaque, CompareDataFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_async_queue_push_sorted" });
        const ret = cFn(self, @ptrCast(arg_data), arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn pushSortedUnlocked(self: *AsyncQueue, arg_data: *anyopaque, argC_func: core.Closure(CompareDataFunc)) void {
        const arg_func: CompareDataFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*AsyncQueue, *anyopaque, CompareDataFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_async_queue_push_sorted_unlocked" });
        const ret = cFn(self, @ptrCast(arg_data), arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn pushUnlocked(self: *AsyncQueue, arg_data: *anyopaque) void {
        const cFn = @extern(*const fn (*AsyncQueue, *anyopaque) callconv(.c) void, .{ .name = "g_async_queue_push_unlocked" });
        const ret = cFn(self, @ptrCast(arg_data));
        return ret;
    }
    pub fn ref(self: *AsyncQueue) *AsyncQueue {
        const cFn = @extern(*const fn (*AsyncQueue) callconv(.c) *AsyncQueue, .{ .name = "g_async_queue_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn refUnlocked(self: *AsyncQueue) void {
        const cFn = @extern(*const fn (*AsyncQueue) callconv(.c) void, .{ .name = "g_async_queue_ref_unlocked" });
        const ret = cFn(self);
        return ret;
    }
    pub fn remove(self: *AsyncQueue, arg_item: *anyopaque) bool {
        const cFn = @extern(*const fn (*AsyncQueue, *anyopaque) callconv(.c) bool, .{ .name = "g_async_queue_remove" });
        const ret = cFn(self, @ptrCast(arg_item));
        return ret;
    }
    pub fn removeUnlocked(self: *AsyncQueue, arg_item: *anyopaque) bool {
        const cFn = @extern(*const fn (*AsyncQueue, *anyopaque) callconv(.c) bool, .{ .name = "g_async_queue_remove_unlocked" });
        const ret = cFn(self, @ptrCast(arg_item));
        return ret;
    }
    pub fn sort(self: *AsyncQueue, argC_func: core.Closure(CompareDataFunc)) void {
        const arg_func: CompareDataFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*AsyncQueue, CompareDataFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_async_queue_sort" });
        const ret = cFn(self, arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn sortUnlocked(self: *AsyncQueue, argC_func: core.Closure(CompareDataFunc)) void {
        const arg_func: CompareDataFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*AsyncQueue, CompareDataFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_async_queue_sort_unlocked" });
        const ret = cFn(self, arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn timedPop(self: *AsyncQueue, arg_end_time: *TimeVal) ?*anyopaque {
        const cFn = @extern(*const fn (*AsyncQueue, *TimeVal) callconv(.c) ?*anyopaque, .{ .name = "g_async_queue_timed_pop" });
        const ret = cFn(self, arg_end_time);
        return ret;
    }
    pub fn timedPopUnlocked(self: *AsyncQueue, arg_end_time: *TimeVal) ?*anyopaque {
        const cFn = @extern(*const fn (*AsyncQueue, *TimeVal) callconv(.c) ?*anyopaque, .{ .name = "g_async_queue_timed_pop_unlocked" });
        const ret = cFn(self, arg_end_time);
        return ret;
    }
    pub fn timeoutPop(self: *AsyncQueue, arg_timeout: u64) ?*anyopaque {
        const cFn = @extern(*const fn (*AsyncQueue, u64) callconv(.c) ?*anyopaque, .{ .name = "g_async_queue_timeout_pop" });
        const ret = cFn(self, arg_timeout);
        return ret;
    }
    pub fn timeoutPopUnlocked(self: *AsyncQueue, arg_timeout: u64) ?*anyopaque {
        const cFn = @extern(*const fn (*AsyncQueue, u64) callconv(.c) ?*anyopaque, .{ .name = "g_async_queue_timeout_pop_unlocked" });
        const ret = cFn(self, arg_timeout);
        return ret;
    }
    pub fn tryPop(self: *AsyncQueue) ?*anyopaque {
        const cFn = @extern(*const fn (*AsyncQueue) callconv(.c) ?*anyopaque, .{ .name = "g_async_queue_try_pop" });
        const ret = cFn(self);
        return ret;
    }
    pub fn tryPopUnlocked(self: *AsyncQueue) ?*anyopaque {
        const cFn = @extern(*const fn (*AsyncQueue) callconv(.c) ?*anyopaque, .{ .name = "g_async_queue_try_pop_unlocked" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unlock(self: *AsyncQueue) void {
        const cFn = @extern(*const fn (*AsyncQueue) callconv(.c) void, .{ .name = "g_async_queue_unlock" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *AsyncQueue) void {
        const cFn = @extern(*const fn (*AsyncQueue) callconv(.c) void, .{ .name = "g_async_queue_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unrefAndUnlock(self: *AsyncQueue) void {
        const cFn = @extern(*const fn (*AsyncQueue) callconv(.c) void, .{ .name = "g_async_queue_unref_and_unlock" });
        const ret = cFn(self);
        return ret;
    }
    pub fn new() *AsyncQueue {
        const cFn = @extern(*const fn () callconv(.c) *AsyncQueue, .{ .name = "g_async_queue_new" });
        const ret = cFn();
        return ret;
    }
    pub fn newFull(arg_item_free_func: ?DestroyNotify) *AsyncQueue {
        const cFn = @extern(*const fn (?DestroyNotify) callconv(.c) *AsyncQueue, .{ .name = "g_async_queue_new_full" });
        const ret = cFn(arg_item_free_func);
        return ret;
    }
};
pub const BIG_ENDIAN = 4321;
pub const BookmarkFile = opaque {
    pub fn new() *BookmarkFile {
        const cFn = @extern(*const fn () callconv(.c) *BookmarkFile, .{ .name = "g_bookmark_file_new" });
        const ret = cFn();
        return ret;
    }
    pub fn addApplication(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_name: ?[*:0]const u8, arg_exec: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_bookmark_file_add_application" });
        const ret = cFn(self, arg_uri, arg_name, arg_exec);
        return ret;
    }
    pub fn addGroup(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_group: [*:0]const u8) void {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_bookmark_file_add_group" });
        const ret = cFn(self, arg_uri, arg_group);
        return ret;
    }
    pub fn copy(self: *BookmarkFile) *BookmarkFile {
        const cFn = @extern(*const fn (*BookmarkFile) callconv(.c) *BookmarkFile, .{ .name = "g_bookmark_file_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *BookmarkFile) void {
        const cFn = @extern(*const fn (*BookmarkFile) callconv(.c) void, .{ .name = "g_bookmark_file_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getAdded(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_bookmark_file_get_added" });
        const ret = cFn(self, arg_uri, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getAddedDateTime(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*DateTime {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, *?*GLib.Error) callconv(.c) *DateTime, .{ .name = "g_bookmark_file_get_added_date_time" });
        const ret = cFn(self, arg_uri, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getAppInfo(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_name: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!?struct {
        exec: [*:0]u8,
        count: u32,
        stamp: i64,
    } {
        var argO_exec: ?[*:0]u8 = undefined;
        const arg_exec: ?*[*:0]u8 = &argO_exec;
        var argO_count: u32 = undefined;
        const arg_count: ?*u32 = &argO_count;
        var argO_stamp: i64 = undefined;
        const arg_stamp: ?*i64 = &argO_stamp;
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, [*:0]const u8, ?*[*:0]u8, ?*u32, ?*i64, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_get_app_info" });
        const ret = cFn(self, arg_uri, arg_name, arg_exec, arg_count, arg_stamp, arg_error);
        if (arg_error.* != null) return error.GError;
        if (!ret) return null;
        return .{ .exec = argO_exec, .count = argO_count, .stamp = argO_stamp };
    }
    pub fn getApplicationInfo(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_name: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!?struct {
        exec: [*:0]u8,
        count: u32,
        stamp: *DateTime,
    } {
        var argO_exec: ?[*:0]u8 = undefined;
        const arg_exec: ?*[*:0]u8 = &argO_exec;
        var argO_count: u32 = undefined;
        const arg_count: ?*u32 = &argO_count;
        var argO_stamp: ?*DateTime = undefined;
        const arg_stamp: ?**DateTime = &argO_stamp;
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, [*:0]const u8, ?*[*:0]u8, ?*u32, ?**DateTime, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_get_application_info" });
        const ret = cFn(self, arg_uri, arg_name, arg_exec, arg_count, arg_stamp, arg_error);
        if (arg_error.* != null) return error.GError;
        if (!ret) return null;
        return .{ .exec = argO_exec, .count = argO_count, .stamp = argO_stamp };
    }
    pub fn getApplications(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}![][*:0]const u8 {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, ?*u64, *?*GLib.Error) callconv(.c) [*][*:0]const u8, .{ .name = "g_bookmark_file_get_applications" });
        const ret = cFn(self, arg_uri, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret[0..@intCast(argO_length)];
    }
    pub fn getDescription(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_bookmark_file_get_description" });
        const ret = cFn(self, arg_uri, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getGroups(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}![][*:0]const u8 {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, ?*u64, *?*GLib.Error) callconv(.c) [*][*:0]const u8, .{ .name = "g_bookmark_file_get_groups" });
        const ret = cFn(self, arg_uri, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret[0..@intCast(argO_length)];
    }
    pub fn getIcon(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!?struct {
        href: [*:0]u8,
        mime_type: [*:0]u8,
    } {
        var argO_href: ?[*:0]u8 = undefined;
        const arg_href: ?*[*:0]u8 = &argO_href;
        var argO_mime_type: ?[*:0]u8 = undefined;
        const arg_mime_type: ?*[*:0]u8 = &argO_mime_type;
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, ?*[*:0]u8, ?*[*:0]u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_get_icon" });
        const ret = cFn(self, arg_uri, arg_href, arg_mime_type, arg_error);
        if (arg_error.* != null) return error.GError;
        if (!ret) return null;
        return .{ .href = argO_href, .mime_type = argO_mime_type };
    }
    pub fn getIsPrivate(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_get_is_private" });
        const ret = cFn(self, arg_uri, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getMimeType(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_bookmark_file_get_mime_type" });
        const ret = cFn(self, arg_uri, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getModified(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_bookmark_file_get_modified" });
        const ret = cFn(self, arg_uri, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getModifiedDateTime(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*DateTime {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, *?*GLib.Error) callconv(.c) *DateTime, .{ .name = "g_bookmark_file_get_modified_date_time" });
        const ret = cFn(self, arg_uri, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getSize(self: *BookmarkFile) i32 {
        const cFn = @extern(*const fn (*BookmarkFile) callconv(.c) i32, .{ .name = "g_bookmark_file_get_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTitle(self: *BookmarkFile, arg_uri: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
        const cFn = @extern(*const fn (*BookmarkFile, ?[*:0]const u8, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_bookmark_file_get_title" });
        const ret = cFn(self, arg_uri, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getUris(self: *BookmarkFile) [][*:0]const u8 {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*BookmarkFile, ?*u64) callconv(.c) [*][*:0]const u8, .{ .name = "g_bookmark_file_get_uris" });
        const ret = cFn(self, arg_length);
        return ret[0..@intCast(argO_length)];
    }
    pub fn getVisited(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_bookmark_file_get_visited" });
        const ret = cFn(self, arg_uri, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getVisitedDateTime(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*DateTime {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, *?*GLib.Error) callconv(.c) *DateTime, .{ .name = "g_bookmark_file_get_visited_date_time" });
        const ret = cFn(self, arg_uri, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn hasApplication(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_name: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_has_application" });
        const ret = cFn(self, arg_uri, arg_name, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn hasGroup(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_group: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_has_group" });
        const ret = cFn(self, arg_uri, arg_group, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn hasItem(self: *BookmarkFile, arg_uri: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8) callconv(.c) bool, .{ .name = "g_bookmark_file_has_item" });
        const ret = cFn(self, arg_uri);
        return ret;
    }
    pub fn loadFromData(self: *BookmarkFile, argS_data: []u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const arg_data: [*]u8 = @ptrCast(argS_data);
        const arg_length: u64 = @intCast((argS_data).len);
        const cFn = @extern(*const fn (*BookmarkFile, [*]u8, u64, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_load_from_data" });
        const ret = cFn(self, arg_data, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn loadFromDataDirs(self: *BookmarkFile, arg_file: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        full_path: [*:0]u8,
    } {
        var argO_full_path: ?[*:0]u8 = undefined;
        const arg_full_path: ?*[*:0]u8 = &argO_full_path;
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, ?*[*:0]u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_load_from_data_dirs" });
        const ret = cFn(self, arg_file, arg_full_path, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .full_path = argO_full_path };
    }
    pub fn loadFromFile(self: *BookmarkFile, arg_filename: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_load_from_file" });
        const ret = cFn(self, arg_filename, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn moveItem(self: *BookmarkFile, arg_old_uri: [*:0]const u8, arg_new_uri: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, ?[*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_move_item" });
        const ret = cFn(self, arg_old_uri, arg_new_uri, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn removeApplication(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_name: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_remove_application" });
        const ret = cFn(self, arg_uri, arg_name, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn removeGroup(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_group: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_remove_group" });
        const ret = cFn(self, arg_uri, arg_group, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn removeItem(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_remove_item" });
        const ret = cFn(self, arg_uri, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setAdded(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_added: i64) void {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, i64) callconv(.c) void, .{ .name = "g_bookmark_file_set_added" });
        const ret = cFn(self, arg_uri, arg_added);
        return ret;
    }
    pub fn setAddedDateTime(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_added: *DateTime) void {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, *DateTime) callconv(.c) void, .{ .name = "g_bookmark_file_set_added_date_time" });
        const ret = cFn(self, arg_uri, arg_added);
        return ret;
    }
    pub fn setAppInfo(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_name: [*:0]const u8, arg_exec: [*:0]const u8, arg_count: i32, arg_stamp: i64, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, [*:0]const u8, [*:0]const u8, i32, i64, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_set_app_info" });
        const ret = cFn(self, arg_uri, arg_name, arg_exec, arg_count, arg_stamp, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setApplicationInfo(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_name: [*:0]const u8, arg_exec: [*:0]const u8, arg_count: i32, arg_stamp: ?*DateTime, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, [*:0]const u8, [*:0]const u8, i32, ?*DateTime, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_set_application_info" });
        const ret = cFn(self, arg_uri, arg_name, arg_exec, arg_count, arg_stamp, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setDescription(self: *BookmarkFile, arg_uri: ?[*:0]const u8, arg_description: [*:0]const u8) void {
        const cFn = @extern(*const fn (*BookmarkFile, ?[*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_bookmark_file_set_description" });
        const ret = cFn(self, arg_uri, arg_description);
        return ret;
    }
    pub fn setGroups(self: *BookmarkFile, arg_uri: [*:0]const u8, argS_groups: [][*:0]const u8) void {
        const arg_groups: ?[*][*:0]const u8 = @ptrCast(argS_groups);
        const arg_length: u64 = @intCast((argS_groups).len);
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, ?[*][*:0]const u8, u64) callconv(.c) void, .{ .name = "g_bookmark_file_set_groups" });
        const ret = cFn(self, arg_uri, arg_groups, arg_length);
        return ret;
    }
    pub fn setIcon(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_href: ?[*:0]const u8, arg_mime_type: [*:0]const u8) void {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, ?[*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_bookmark_file_set_icon" });
        const ret = cFn(self, arg_uri, arg_href, arg_mime_type);
        return ret;
    }
    pub fn setIsPrivate(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_is_private: bool) void {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, bool) callconv(.c) void, .{ .name = "g_bookmark_file_set_is_private" });
        const ret = cFn(self, arg_uri, arg_is_private);
        return ret;
    }
    pub fn setMimeType(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_mime_type: [*:0]const u8) void {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_bookmark_file_set_mime_type" });
        const ret = cFn(self, arg_uri, arg_mime_type);
        return ret;
    }
    pub fn setModified(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_modified: i64) void {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, i64) callconv(.c) void, .{ .name = "g_bookmark_file_set_modified" });
        const ret = cFn(self, arg_uri, arg_modified);
        return ret;
    }
    pub fn setModifiedDateTime(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_modified: *DateTime) void {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, *DateTime) callconv(.c) void, .{ .name = "g_bookmark_file_set_modified_date_time" });
        const ret = cFn(self, arg_uri, arg_modified);
        return ret;
    }
    pub fn setTitle(self: *BookmarkFile, arg_uri: ?[*:0]const u8, arg_title: [*:0]const u8) void {
        const cFn = @extern(*const fn (*BookmarkFile, ?[*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_bookmark_file_set_title" });
        const ret = cFn(self, arg_uri, arg_title);
        return ret;
    }
    pub fn setVisited(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_visited: i64) void {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, i64) callconv(.c) void, .{ .name = "g_bookmark_file_set_visited" });
        const ret = cFn(self, arg_uri, arg_visited);
        return ret;
    }
    pub fn setVisitedDateTime(self: *BookmarkFile, arg_uri: [*:0]const u8, arg_visited: *DateTime) void {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, *DateTime) callconv(.c) void, .{ .name = "g_bookmark_file_set_visited_date_time" });
        const ret = cFn(self, arg_uri, arg_visited);
        return ret;
    }
    pub fn toData(self: *BookmarkFile, arg_error: *?*GLib.Error) error{GError}![]u8 {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*BookmarkFile, ?*u64, *?*GLib.Error) callconv(.c) [*]u8, .{ .name = "g_bookmark_file_to_data" });
        const ret = cFn(self, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret[0..@intCast(argO_length)];
    }
    pub fn toFile(self: *BookmarkFile, arg_filename: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*BookmarkFile, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_bookmark_file_to_file" });
        const ret = cFn(self, arg_filename, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn errorQuark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_bookmark_file_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_bookmark_file_get_type" });
        return cFn();
    }
};
pub const BookmarkFileError = enum(u32) {
    invalid_uri = 0,
    invalid_value = 1,
    app_not_registered = 2,
    uri_not_found = 3,
    read = 4,
    unknown_encoding = 5,
    write = 6,
    file_not_found = 7,
};
pub const ByteArray = extern struct {
    data: ?*u8,
    len: u32,
    pub fn append(arg_array: *GLib.ByteArray, argS_data: []u8) *GLib.ByteArray {
        const arg_data: [*]u8 = @ptrCast(argS_data);
        const arg_len: u32 = @intCast((argS_data).len);
        const cFn = @extern(*const fn (*GLib.ByteArray, [*]u8, u32) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_append" });
        const ret = cFn(arg_array, arg_data, arg_len);
        return ret;
    }
    pub fn free(arg_array: *GLib.ByteArray, arg_free_segment: bool) ?[*]u8 {
        const cFn = @extern(*const fn (*GLib.ByteArray, bool) callconv(.c) ?[*]u8, .{ .name = "g_byte_array_free" });
        const ret = cFn(arg_array, arg_free_segment);
        return ret;
    }
    pub fn freeToBytes(arg_array: *GLib.ByteArray) *Bytes {
        const cFn = @extern(*const fn (*GLib.ByteArray) callconv(.c) *Bytes, .{ .name = "g_byte_array_free_to_bytes" });
        const ret = cFn(arg_array);
        return ret;
    }
    pub fn new() *GLib.ByteArray {
        const cFn = @extern(*const fn () callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_new" });
        const ret = cFn();
        return ret;
    }
    pub fn newTake(argS_data: []u8) *GLib.ByteArray {
        const arg_data: [*]u8 = @ptrCast(argS_data);
        const arg_len: u64 = @intCast((argS_data).len);
        const cFn = @extern(*const fn ([*]u8, u64) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_new_take" });
        const ret = cFn(arg_data, arg_len);
        return ret;
    }
    pub fn prepend(arg_array: *GLib.ByteArray, argS_data: []u8) *GLib.ByteArray {
        const arg_data: [*]u8 = @ptrCast(argS_data);
        const arg_len: u32 = @intCast((argS_data).len);
        const cFn = @extern(*const fn (*GLib.ByteArray, [*]u8, u32) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_prepend" });
        const ret = cFn(arg_array, arg_data, arg_len);
        return ret;
    }
    pub fn ref(arg_array: *GLib.ByteArray) *GLib.ByteArray {
        const cFn = @extern(*const fn (*GLib.ByteArray) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_ref" });
        const ret = cFn(arg_array);
        return ret;
    }
    pub fn removeIndex(arg_array: *GLib.ByteArray, arg_index_: u32) *GLib.ByteArray {
        const cFn = @extern(*const fn (*GLib.ByteArray, u32) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_remove_index" });
        const ret = cFn(arg_array, arg_index_);
        return ret;
    }
    pub fn removeIndexFast(arg_array: *GLib.ByteArray, arg_index_: u32) *GLib.ByteArray {
        const cFn = @extern(*const fn (*GLib.ByteArray, u32) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_remove_index_fast" });
        const ret = cFn(arg_array, arg_index_);
        return ret;
    }
    pub fn removeRange(arg_array: *GLib.ByteArray, arg_index_: u32, arg_length: u32) *GLib.ByteArray {
        const cFn = @extern(*const fn (*GLib.ByteArray, u32, u32) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_remove_range" });
        const ret = cFn(arg_array, arg_index_, arg_length);
        return ret;
    }
    pub fn setSize(arg_array: *GLib.ByteArray, arg_length: u32) *GLib.ByteArray {
        const cFn = @extern(*const fn (*GLib.ByteArray, u32) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_set_size" });
        const ret = cFn(arg_array, arg_length);
        return ret;
    }
    pub fn sizedNew(arg_reserved_size: u32) *GLib.ByteArray {
        const cFn = @extern(*const fn (u32) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_sized_new" });
        const ret = cFn(arg_reserved_size);
        return ret;
    }
    pub fn sort(arg_array: *GLib.ByteArray, arg_compare_func: CompareFunc) void {
        const cFn = @extern(*const fn (*GLib.ByteArray, CompareFunc) callconv(.c) void, .{ .name = "g_byte_array_sort" });
        const ret = cFn(arg_array, arg_compare_func);
        return ret;
    }
    pub fn sortWithData(arg_array: *GLib.ByteArray, argC_compare_func: core.Closure(CompareDataFunc)) void {
        const arg_compare_func: CompareDataFunc = @ptrCast(argC_compare_func.callback());
        defer argC_compare_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_compare_func.data());
        const cFn = @extern(*const fn (*GLib.ByteArray, CompareDataFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_byte_array_sort_with_data" });
        const ret = cFn(arg_array, arg_compare_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn steal(arg_array: *GLib.ByteArray) []u8 {
        var argO_len: u64 = undefined;
        const arg_len: ?*u64 = &argO_len;
        const cFn = @extern(*const fn (*GLib.ByteArray, ?*u64) callconv(.c) [*]u8, .{ .name = "g_byte_array_steal" });
        const ret = cFn(arg_array, arg_len);
        return ret[0..@intCast(argO_len)];
    }
    pub fn unref(arg_array: *GLib.ByteArray) void {
        const cFn = @extern(*const fn (*GLib.ByteArray) callconv(.c) void, .{ .name = "g_byte_array_unref" });
        const ret = cFn(arg_array);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_byte_array_get_type" });
        return cFn();
    }
};
pub const Bytes = opaque {
    pub fn new(argS_data: []u8) *Bytes {
        const arg_data: ?[*]u8 = @ptrCast(argS_data);
        const arg_size: u64 = @intCast((argS_data).len);
        const cFn = @extern(*const fn (?[*]u8, u64) callconv(.c) *Bytes, .{ .name = "g_bytes_new" });
        const ret = cFn(arg_data, arg_size);
        return ret;
    }
    pub fn newTake(argS_data: []u8) *Bytes {
        const arg_data: ?[*]u8 = @ptrCast(argS_data);
        const arg_size: u64 = @intCast((argS_data).len);
        const cFn = @extern(*const fn (?[*]u8, u64) callconv(.c) *Bytes, .{ .name = "g_bytes_new_take" });
        const ret = cFn(arg_data, arg_size);
        return ret;
    }
    pub fn compare(self: *Bytes, arg_bytes2: *Bytes) i32 {
        const cFn = @extern(*const fn (*Bytes, *Bytes) callconv(.c) i32, .{ .name = "g_bytes_compare" });
        const ret = cFn(self, arg_bytes2);
        return ret;
    }
    pub fn equal(self: *Bytes, arg_bytes2: *Bytes) bool {
        const cFn = @extern(*const fn (*Bytes, *Bytes) callconv(.c) bool, .{ .name = "g_bytes_equal" });
        const ret = cFn(self, arg_bytes2);
        return ret;
    }
    pub fn getData(self: *Bytes) []u8 {
        var argO_size: u64 = undefined;
        const arg_size: ?*u64 = &argO_size;
        const cFn = @extern(*const fn (*Bytes, ?*u64) callconv(.c) ?[*]u8, .{ .name = "g_bytes_get_data" });
        const ret = cFn(self, arg_size);
        return ret[0..@intCast(argO_size)];
    }
    pub fn getRegion(self: *Bytes, arg_element_size: u64, arg_offset: u64, arg_n_elements: u64) ?*anyopaque {
        const cFn = @extern(*const fn (*Bytes, u64, u64, u64) callconv(.c) ?*anyopaque, .{ .name = "g_bytes_get_region" });
        const ret = cFn(self, arg_element_size, arg_offset, arg_n_elements);
        return ret;
    }
    pub fn getSize(self: *Bytes) u64 {
        const cFn = @extern(*const fn (*Bytes) callconv(.c) u64, .{ .name = "g_bytes_get_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hash(self: *Bytes) u32 {
        const cFn = @extern(*const fn (*Bytes) callconv(.c) u32, .{ .name = "g_bytes_hash" });
        const ret = cFn(self);
        return ret;
    }
    pub fn newFromBytes(self: *Bytes, arg_offset: u64, arg_length: u64) *Bytes {
        const cFn = @extern(*const fn (*Bytes, u64, u64) callconv(.c) *Bytes, .{ .name = "g_bytes_new_from_bytes" });
        const ret = cFn(self, arg_offset, arg_length);
        return ret;
    }
    pub fn ref(self: *Bytes) *Bytes {
        const cFn = @extern(*const fn (*Bytes) callconv(.c) *Bytes, .{ .name = "g_bytes_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *Bytes) void {
        const cFn = @extern(*const fn (*Bytes) callconv(.c) void, .{ .name = "g_bytes_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unrefToArray(self: *Bytes) *GLib.ByteArray {
        const cFn = @extern(*const fn (*Bytes) callconv(.c) *GLib.ByteArray, .{ .name = "g_bytes_unref_to_array" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unrefToData(self: *Bytes) []u8 {
        var argO_size: u64 = undefined;
        const arg_size: *u64 = &argO_size;
        const cFn = @extern(*const fn (*Bytes, *u64) callconv(.c) [*]u8, .{ .name = "g_bytes_unref_to_data" });
        const ret = cFn(self, arg_size);
        return ret[0..@intCast(argO_size)];
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_bytes_get_type" });
        return cFn();
    }
};
pub const CSET_A_2_Z = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
pub const CSET_DIGITS = "0123456789";
pub const CSET_a_2_z = "abcdefghijklmnopqrstuvwxyz";
pub const C_STD_VERSION = 199000;
pub const Cache = opaque {
    pub fn destroy(self: *Cache) void {
        const cFn = @extern(*const fn (*Cache) callconv(.c) void, .{ .name = "g_cache_destroy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn insert(self: *Cache, arg_key: ?*anyopaque) ?*anyopaque {
        const cFn = @extern(*const fn (*Cache, ?*anyopaque) callconv(.c) ?*anyopaque, .{ .name = "g_cache_insert" });
        const ret = cFn(self, @ptrCast(arg_key));
        return ret;
    }
    pub fn keyForeach(self: *Cache, argC_func: core.Closure(HFunc)) void {
        const arg_func: HFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*Cache, HFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_cache_key_foreach" });
        const ret = cFn(self, arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn remove(self: *Cache, arg_value: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Cache, ?*anyopaque) callconv(.c) void, .{ .name = "g_cache_remove" });
        const ret = cFn(self, @ptrCast(arg_value));
        return ret;
    }
    pub fn valueForeach(self: *Cache, argC_func: core.Closure(HFunc)) void {
        const arg_func: HFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*Cache, HFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_cache_value_foreach" });
        const ret = cFn(self, arg_func, @ptrCast(arg_user_data));
        return ret;
    }
};
pub const CacheDestroyFunc = *const fn (arg_value: ?*anyopaque) callconv(.c) void;
pub const CacheDupFunc = *const fn (arg_value: ?*anyopaque) callconv(.c) ?*anyopaque;
pub const CacheNewFunc = *const fn (arg_key: ?*anyopaque) callconv(.c) ?*anyopaque;
pub const Checksum = opaque {
    pub fn new(arg_checksum_type: ChecksumType) ?*Checksum {
        const cFn = @extern(*const fn (ChecksumType) callconv(.c) ?*Checksum, .{ .name = "g_checksum_new" });
        const ret = cFn(arg_checksum_type);
        return ret;
    }
    pub fn copy(self: *Checksum) *Checksum {
        const cFn = @extern(*const fn (*Checksum) callconv(.c) *Checksum, .{ .name = "g_checksum_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *Checksum) void {
        const cFn = @extern(*const fn (*Checksum) callconv(.c) void, .{ .name = "g_checksum_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getString(self: *Checksum) [*:0]u8 {
        const cFn = @extern(*const fn (*Checksum) callconv(.c) [*:0]u8, .{ .name = "g_checksum_get_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn reset(self: *Checksum) void {
        const cFn = @extern(*const fn (*Checksum) callconv(.c) void, .{ .name = "g_checksum_reset" });
        const ret = cFn(self);
        return ret;
    }
    pub fn update(self: *Checksum, argS_data: []u8) void {
        const arg_data: [*]u8 = @ptrCast(argS_data);
        const arg_length: i64 = @intCast((argS_data).len);
        const cFn = @extern(*const fn (*Checksum, [*]u8, i64) callconv(.c) void, .{ .name = "g_checksum_update" });
        const ret = cFn(self, arg_data, arg_length);
        return ret;
    }
    pub fn typeGetLength(arg_checksum_type: ChecksumType) i64 {
        const cFn = @extern(*const fn (ChecksumType) callconv(.c) i64, .{ .name = "g_checksum_type_get_length" });
        const ret = cFn(arg_checksum_type);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_checksum_get_type" });
        return cFn();
    }
};
pub const ChecksumType = enum(u32) {
    md5 = 0,
    sha1 = 1,
    sha256 = 2,
    sha512 = 3,
    sha384 = 4,
};
pub const ChildWatchFunc = *const fn (arg_pid: i32, arg_wait_status: i32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const ClearHandleFunc = *const fn (arg_handle_id: u32) callconv(.c) void;
pub const CompareDataFunc = *const fn (arg_a: ?*anyopaque, arg_b: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub const CompareFunc = *const fn (arg_a: ?*anyopaque, arg_b: ?*anyopaque) callconv(.c) i32;
pub const Completion = extern struct {
    items: ?*GLib.List,
    func: ?CompletionFunc,
    prefix: ?[*:0]const u8,
    cache: ?*GLib.List,
    strncmp_func: ?CompletionStrncmpFunc,
    pub fn clearItems(self: *Completion) void {
        const cFn = @extern(*const fn (*Completion) callconv(.c) void, .{ .name = "g_completion_clear_items" });
        const ret = cFn(self);
        return ret;
    }
    pub fn completeUtf8(self: *Completion, arg_prefix: [*:0]const u8, arg_new_prefix: [*:0]const u8) ?*GLib.List {
        const cFn = @extern(*const fn (*Completion, [*:0]const u8, [*:0]const u8) callconv(.c) ?*GLib.List, .{ .name = "g_completion_complete_utf8" });
        const ret = cFn(self, arg_prefix, arg_new_prefix);
        return ret;
    }
    pub fn free(self: *Completion) void {
        const cFn = @extern(*const fn (*Completion) callconv(.c) void, .{ .name = "g_completion_free" });
        const ret = cFn(self);
        return ret;
    }
};
pub const CompletionFunc = *const fn (arg_item: ?*anyopaque) callconv(.c) [*:0]u8;
pub const CompletionStrncmpFunc = *const fn (arg_s1: [*:0]const u8, arg_s2: [*:0]const u8, arg_n: u64) callconv(.c) i32;
pub const Cond = extern struct {
    p: ?*anyopaque,
    i: [2]u32,
    pub fn broadcast(self: *Cond) void {
        const cFn = @extern(*const fn (*Cond) callconv(.c) void, .{ .name = "g_cond_broadcast" });
        const ret = cFn(self);
        return ret;
    }
    pub fn clear(self: *Cond) void {
        const cFn = @extern(*const fn (*Cond) callconv(.c) void, .{ .name = "g_cond_clear" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *Cond) void {
        const cFn = @extern(*const fn (*Cond) callconv(.c) void, .{ .name = "g_cond_init" });
        const ret = cFn(self);
        return ret;
    }
    pub fn signal(self: *Cond) void {
        const cFn = @extern(*const fn (*Cond) callconv(.c) void, .{ .name = "g_cond_signal" });
        const ret = cFn(self);
        return ret;
    }
    pub fn wait(self: *Cond, arg_mutex: *Mutex) void {
        const cFn = @extern(*const fn (*Cond, *Mutex) callconv(.c) void, .{ .name = "g_cond_wait" });
        const ret = cFn(self, arg_mutex);
        return ret;
    }
    pub fn waitUntil(self: *Cond, arg_mutex: *Mutex, arg_end_time: i64) bool {
        const cFn = @extern(*const fn (*Cond, *Mutex, i64) callconv(.c) bool, .{ .name = "g_cond_wait_until" });
        const ret = cFn(self, arg_mutex, arg_end_time);
        return ret;
    }
};
pub const ConvertError = enum(u32) {
    no_conversion = 0,
    illegal_sequence = 1,
    failed = 2,
    partial_input = 3,
    bad_uri = 4,
    not_absolute_path = 5,
    no_memory = 6,
    embedded_nul = 7,
};
pub const CopyFunc = *const fn (arg_src: *anyopaque, arg_data: ?*anyopaque) callconv(.c) *anyopaque;
pub const DATALIST_FLAGS_MASK = 3;
pub const DATE_BAD_DAY = 0;
pub const DATE_BAD_JULIAN = 0;
pub const DATE_BAD_YEAR = 0;
pub const DIR_SEPARATOR = 47;
pub const DIR_SEPARATOR_S = "/";
pub const Data = opaque {};
pub const DataForeachFunc = *const fn (arg_key_id: u32, arg_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const Date = extern struct {
    _0: packed struct(u32) {
        julian_days: u32,
    },
    _4: packed struct(u32) {
        julian: bool,
        dmy: bool,
        day: u6,
        month: u4,
        year: u16,
        _: u4,
    },
    pub fn new() *Date {
        const cFn = @extern(*const fn () callconv(.c) *Date, .{ .name = "g_date_new" });
        const ret = cFn();
        return ret;
    }
    pub fn newDmy(arg_day: u8, arg_month: DateMonth, arg_year: u16) *Date {
        const cFn = @extern(*const fn (u8, DateMonth, u16) callconv(.c) *Date, .{ .name = "g_date_new_dmy" });
        const ret = cFn(arg_day, arg_month, arg_year);
        return ret;
    }
    pub fn newJulian(arg_julian_day: u32) *Date {
        const cFn = @extern(*const fn (u32) callconv(.c) *Date, .{ .name = "g_date_new_julian" });
        const ret = cFn(arg_julian_day);
        return ret;
    }
    pub fn addDays(self: *Date, arg_n_days: u32) void {
        const cFn = @extern(*const fn (*Date, u32) callconv(.c) void, .{ .name = "g_date_add_days" });
        const ret = cFn(self, arg_n_days);
        return ret;
    }
    pub fn addMonths(self: *Date, arg_n_months: u32) void {
        const cFn = @extern(*const fn (*Date, u32) callconv(.c) void, .{ .name = "g_date_add_months" });
        const ret = cFn(self, arg_n_months);
        return ret;
    }
    pub fn addYears(self: *Date, arg_n_years: u32) void {
        const cFn = @extern(*const fn (*Date, u32) callconv(.c) void, .{ .name = "g_date_add_years" });
        const ret = cFn(self, arg_n_years);
        return ret;
    }
    pub fn clamp(self: *Date, arg_min_date: *Date, arg_max_date: *Date) void {
        const cFn = @extern(*const fn (*Date, *Date, *Date) callconv(.c) void, .{ .name = "g_date_clamp" });
        const ret = cFn(self, arg_min_date, arg_max_date);
        return ret;
    }
    pub fn clear(self: *Date, arg_n_dates: u32) void {
        const cFn = @extern(*const fn (*Date, u32) callconv(.c) void, .{ .name = "g_date_clear" });
        const ret = cFn(self, arg_n_dates);
        return ret;
    }
    pub fn compare(self: *Date, arg_rhs: *Date) i32 {
        const cFn = @extern(*const fn (*Date, *Date) callconv(.c) i32, .{ .name = "g_date_compare" });
        const ret = cFn(self, arg_rhs);
        return ret;
    }
    pub fn copy(self: *Date) *Date {
        const cFn = @extern(*const fn (*Date) callconv(.c) *Date, .{ .name = "g_date_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn daysBetween(self: *Date, arg_date2: *Date) i32 {
        const cFn = @extern(*const fn (*Date, *Date) callconv(.c) i32, .{ .name = "g_date_days_between" });
        const ret = cFn(self, arg_date2);
        return ret;
    }
    pub fn free(self: *Date) void {
        const cFn = @extern(*const fn (*Date) callconv(.c) void, .{ .name = "g_date_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDay(self: *Date) u8 {
        const cFn = @extern(*const fn (*Date) callconv(.c) u8, .{ .name = "g_date_get_day" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDayOfYear(self: *Date) u32 {
        const cFn = @extern(*const fn (*Date) callconv(.c) u32, .{ .name = "g_date_get_day_of_year" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIso8601WeekOfYear(self: *Date) u32 {
        const cFn = @extern(*const fn (*Date) callconv(.c) u32, .{ .name = "g_date_get_iso8601_week_of_year" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getJulian(self: *Date) u32 {
        const cFn = @extern(*const fn (*Date) callconv(.c) u32, .{ .name = "g_date_get_julian" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMondayWeekOfYear(self: *Date) u32 {
        const cFn = @extern(*const fn (*Date) callconv(.c) u32, .{ .name = "g_date_get_monday_week_of_year" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMonth(self: *Date) DateMonth {
        const cFn = @extern(*const fn (*Date) callconv(.c) DateMonth, .{ .name = "g_date_get_month" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSundayWeekOfYear(self: *Date) u32 {
        const cFn = @extern(*const fn (*Date) callconv(.c) u32, .{ .name = "g_date_get_sunday_week_of_year" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWeekOfYear(self: *Date, arg_first_day_of_week: DateWeekday) u32 {
        const cFn = @extern(*const fn (*Date, DateWeekday) callconv(.c) u32, .{ .name = "g_date_get_week_of_year" });
        const ret = cFn(self, arg_first_day_of_week);
        return ret;
    }
    pub fn getWeekday(self: *Date) DateWeekday {
        const cFn = @extern(*const fn (*Date) callconv(.c) DateWeekday, .{ .name = "g_date_get_weekday" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getYear(self: *Date) u16 {
        const cFn = @extern(*const fn (*Date) callconv(.c) u16, .{ .name = "g_date_get_year" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isFirstOfMonth(self: *Date) bool {
        const cFn = @extern(*const fn (*Date) callconv(.c) bool, .{ .name = "g_date_is_first_of_month" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isLastOfMonth(self: *Date) bool {
        const cFn = @extern(*const fn (*Date) callconv(.c) bool, .{ .name = "g_date_is_last_of_month" });
        const ret = cFn(self);
        return ret;
    }
    pub fn order(self: *Date, arg_date2: *Date) void {
        const cFn = @extern(*const fn (*Date, *Date) callconv(.c) void, .{ .name = "g_date_order" });
        const ret = cFn(self, arg_date2);
        return ret;
    }
    pub fn setDay(self: *Date, arg_day: u8) void {
        const cFn = @extern(*const fn (*Date, u8) callconv(.c) void, .{ .name = "g_date_set_day" });
        const ret = cFn(self, arg_day);
        return ret;
    }
    pub fn setDmy(self: *Date, arg_day: u8, arg_month: DateMonth, arg_y: u16) void {
        const cFn = @extern(*const fn (*Date, u8, DateMonth, u16) callconv(.c) void, .{ .name = "g_date_set_dmy" });
        const ret = cFn(self, arg_day, arg_month, arg_y);
        return ret;
    }
    pub fn setJulian(self: *Date, arg_julian_date: u32) void {
        const cFn = @extern(*const fn (*Date, u32) callconv(.c) void, .{ .name = "g_date_set_julian" });
        const ret = cFn(self, arg_julian_date);
        return ret;
    }
    pub fn setMonth(self: *Date, arg_month: DateMonth) void {
        const cFn = @extern(*const fn (*Date, DateMonth) callconv(.c) void, .{ .name = "g_date_set_month" });
        const ret = cFn(self, arg_month);
        return ret;
    }
    pub fn setParse(self: *Date, arg_str: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Date, [*:0]const u8) callconv(.c) void, .{ .name = "g_date_set_parse" });
        const ret = cFn(self, arg_str);
        return ret;
    }
    pub fn setTime(self: *Date, arg_time_: i32) void {
        const cFn = @extern(*const fn (*Date, i32) callconv(.c) void, .{ .name = "g_date_set_time" });
        const ret = cFn(self, arg_time_);
        return ret;
    }
    pub fn setTimeT(self: *Date, arg_timet: i64) void {
        const cFn = @extern(*const fn (*Date, i64) callconv(.c) void, .{ .name = "g_date_set_time_t" });
        const ret = cFn(self, arg_timet);
        return ret;
    }
    pub fn setTimeVal(self: *Date, arg_timeval: *TimeVal) void {
        const cFn = @extern(*const fn (*Date, *TimeVal) callconv(.c) void, .{ .name = "g_date_set_time_val" });
        const ret = cFn(self, arg_timeval);
        return ret;
    }
    pub fn setYear(self: *Date, arg_year: u16) void {
        const cFn = @extern(*const fn (*Date, u16) callconv(.c) void, .{ .name = "g_date_set_year" });
        const ret = cFn(self, arg_year);
        return ret;
    }
    pub fn subtractDays(self: *Date, arg_n_days: u32) void {
        const cFn = @extern(*const fn (*Date, u32) callconv(.c) void, .{ .name = "g_date_subtract_days" });
        const ret = cFn(self, arg_n_days);
        return ret;
    }
    pub fn subtractMonths(self: *Date, arg_n_months: u32) void {
        const cFn = @extern(*const fn (*Date, u32) callconv(.c) void, .{ .name = "g_date_subtract_months" });
        const ret = cFn(self, arg_n_months);
        return ret;
    }
    pub fn subtractYears(self: *Date, arg_n_years: u32) void {
        const cFn = @extern(*const fn (*Date, u32) callconv(.c) void, .{ .name = "g_date_subtract_years" });
        const ret = cFn(self, arg_n_years);
        return ret;
    }
    pub fn toStructTm(self: *Date, arg_tm: *anyopaque) void {
        const cFn = @extern(*const fn (*Date, *anyopaque) callconv(.c) void, .{ .name = "g_date_to_struct_tm" });
        const ret = cFn(self, @ptrCast(arg_tm));
        return ret;
    }
    pub fn valid(self: *Date) bool {
        const cFn = @extern(*const fn (*Date) callconv(.c) bool, .{ .name = "g_date_valid" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDaysInMonth(arg_month: DateMonth, arg_year: u16) u8 {
        const cFn = @extern(*const fn (DateMonth, u16) callconv(.c) u8, .{ .name = "g_date_get_days_in_month" });
        const ret = cFn(arg_month, arg_year);
        return ret;
    }
    pub fn getMondayWeeksInYear(arg_year: u16) u8 {
        const cFn = @extern(*const fn (u16) callconv(.c) u8, .{ .name = "g_date_get_monday_weeks_in_year" });
        const ret = cFn(arg_year);
        return ret;
    }
    pub fn getSundayWeeksInYear(arg_year: u16) u8 {
        const cFn = @extern(*const fn (u16) callconv(.c) u8, .{ .name = "g_date_get_sunday_weeks_in_year" });
        const ret = cFn(arg_year);
        return ret;
    }
    pub fn getWeeksInYear(arg_year: u16, arg_first_day_of_week: DateWeekday) u8 {
        const cFn = @extern(*const fn (u16, DateWeekday) callconv(.c) u8, .{ .name = "g_date_get_weeks_in_year" });
        const ret = cFn(arg_year, arg_first_day_of_week);
        return ret;
    }
    pub fn isLeapYear(arg_year: u16) bool {
        const cFn = @extern(*const fn (u16) callconv(.c) bool, .{ .name = "g_date_is_leap_year" });
        const ret = cFn(arg_year);
        return ret;
    }
    pub fn strftime(arg_s: [*:0]const u8, arg_slen: u64, arg_format: [*:0]const u8, arg_date: *Date) u64 {
        const cFn = @extern(*const fn ([*:0]const u8, u64, [*:0]const u8, *Date) callconv(.c) u64, .{ .name = "g_date_strftime" });
        const ret = cFn(arg_s, arg_slen, arg_format, arg_date);
        return ret;
    }
    pub fn validDay(arg_day: u8) bool {
        const cFn = @extern(*const fn (u8) callconv(.c) bool, .{ .name = "g_date_valid_day" });
        const ret = cFn(arg_day);
        return ret;
    }
    pub fn validDmy(arg_day: u8, arg_month: DateMonth, arg_year: u16) bool {
        const cFn = @extern(*const fn (u8, DateMonth, u16) callconv(.c) bool, .{ .name = "g_date_valid_dmy" });
        const ret = cFn(arg_day, arg_month, arg_year);
        return ret;
    }
    pub fn validJulian(arg_julian_date: u32) bool {
        const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_date_valid_julian" });
        const ret = cFn(arg_julian_date);
        return ret;
    }
    pub fn validMonth(arg_month: DateMonth) bool {
        const cFn = @extern(*const fn (DateMonth) callconv(.c) bool, .{ .name = "g_date_valid_month" });
        const ret = cFn(arg_month);
        return ret;
    }
    pub fn validWeekday(arg_weekday: DateWeekday) bool {
        const cFn = @extern(*const fn (DateWeekday) callconv(.c) bool, .{ .name = "g_date_valid_weekday" });
        const ret = cFn(arg_weekday);
        return ret;
    }
    pub fn validYear(arg_year: u16) bool {
        const cFn = @extern(*const fn (u16) callconv(.c) bool, .{ .name = "g_date_valid_year" });
        const ret = cFn(arg_year);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_date_get_type" });
        return cFn();
    }
};
pub const DateDMY = enum(u32) {
    day = 0,
    month = 1,
    year = 2,
};
pub const DateMonth = enum(u32) {
    bad_month = 0,
    january = 1,
    february = 2,
    march = 3,
    april = 4,
    may = 5,
    june = 6,
    july = 7,
    august = 8,
    september = 9,
    october = 10,
    november = 11,
    december = 12,
};
pub const DateTime = opaque {
    pub fn new(arg_tz: *TimeZone, arg_year: i32, arg_month: i32, arg_day: i32, arg_hour: i32, arg_minute: i32, arg_seconds: f64) ?*DateTime {
        const cFn = @extern(*const fn (*TimeZone, i32, i32, i32, i32, i32, f64) callconv(.c) ?*DateTime, .{ .name = "g_date_time_new" });
        const ret = cFn(arg_tz, arg_year, arg_month, arg_day, arg_hour, arg_minute, arg_seconds);
        return ret;
    }
    pub fn newFromIso8601(arg_text: [*:0]const u8, arg_default_tz: ?*TimeZone) ?*DateTime {
        const cFn = @extern(*const fn ([*:0]const u8, ?*TimeZone) callconv(.c) ?*DateTime, .{ .name = "g_date_time_new_from_iso8601" });
        const ret = cFn(arg_text, arg_default_tz);
        return ret;
    }
    pub fn newFromTimevalLocal(arg_tv: *TimeVal) ?*DateTime {
        const cFn = @extern(*const fn (*TimeVal) callconv(.c) ?*DateTime, .{ .name = "g_date_time_new_from_timeval_local" });
        const ret = cFn(arg_tv);
        return ret;
    }
    pub fn newFromTimevalUtc(arg_tv: *TimeVal) ?*DateTime {
        const cFn = @extern(*const fn (*TimeVal) callconv(.c) ?*DateTime, .{ .name = "g_date_time_new_from_timeval_utc" });
        const ret = cFn(arg_tv);
        return ret;
    }
    pub fn newFromUnixLocal(arg_t: i64) ?*DateTime {
        const cFn = @extern(*const fn (i64) callconv(.c) ?*DateTime, .{ .name = "g_date_time_new_from_unix_local" });
        const ret = cFn(arg_t);
        return ret;
    }
    pub fn newFromUnixLocalUsec(arg_usecs: i64) ?*DateTime {
        const cFn = @extern(*const fn (i64) callconv(.c) ?*DateTime, .{ .name = "g_date_time_new_from_unix_local_usec" });
        const ret = cFn(arg_usecs);
        return ret;
    }
    pub fn newFromUnixUtc(arg_t: i64) ?*DateTime {
        const cFn = @extern(*const fn (i64) callconv(.c) ?*DateTime, .{ .name = "g_date_time_new_from_unix_utc" });
        const ret = cFn(arg_t);
        return ret;
    }
    pub fn newFromUnixUtcUsec(arg_usecs: i64) ?*DateTime {
        const cFn = @extern(*const fn (i64) callconv(.c) ?*DateTime, .{ .name = "g_date_time_new_from_unix_utc_usec" });
        const ret = cFn(arg_usecs);
        return ret;
    }
    pub fn newLocal(arg_year: i32, arg_month: i32, arg_day: i32, arg_hour: i32, arg_minute: i32, arg_seconds: f64) ?*DateTime {
        const cFn = @extern(*const fn (i32, i32, i32, i32, i32, f64) callconv(.c) ?*DateTime, .{ .name = "g_date_time_new_local" });
        const ret = cFn(arg_year, arg_month, arg_day, arg_hour, arg_minute, arg_seconds);
        return ret;
    }
    pub fn newNow(arg_tz: *TimeZone) ?*DateTime {
        const cFn = @extern(*const fn (*TimeZone) callconv(.c) ?*DateTime, .{ .name = "g_date_time_new_now" });
        const ret = cFn(arg_tz);
        return ret;
    }
    pub fn newNowLocal() ?*DateTime {
        const cFn = @extern(*const fn () callconv(.c) ?*DateTime, .{ .name = "g_date_time_new_now_local" });
        const ret = cFn();
        return ret;
    }
    pub fn newNowUtc() ?*DateTime {
        const cFn = @extern(*const fn () callconv(.c) ?*DateTime, .{ .name = "g_date_time_new_now_utc" });
        const ret = cFn();
        return ret;
    }
    pub fn newUtc(arg_year: i32, arg_month: i32, arg_day: i32, arg_hour: i32, arg_minute: i32, arg_seconds: f64) ?*DateTime {
        const cFn = @extern(*const fn (i32, i32, i32, i32, i32, f64) callconv(.c) ?*DateTime, .{ .name = "g_date_time_new_utc" });
        const ret = cFn(arg_year, arg_month, arg_day, arg_hour, arg_minute, arg_seconds);
        return ret;
    }
    pub fn add(self: *DateTime, arg_timespan: i64) ?*DateTime {
        const cFn = @extern(*const fn (*DateTime, i64) callconv(.c) ?*DateTime, .{ .name = "g_date_time_add" });
        const ret = cFn(self, arg_timespan);
        return ret;
    }
    pub fn addDays(self: *DateTime, arg_days: i32) ?*DateTime {
        const cFn = @extern(*const fn (*DateTime, i32) callconv(.c) ?*DateTime, .{ .name = "g_date_time_add_days" });
        const ret = cFn(self, arg_days);
        return ret;
    }
    pub fn addFull(self: *DateTime, arg_years: i32, arg_months: i32, arg_days: i32, arg_hours: i32, arg_minutes: i32, arg_seconds: f64) ?*DateTime {
        const cFn = @extern(*const fn (*DateTime, i32, i32, i32, i32, i32, f64) callconv(.c) ?*DateTime, .{ .name = "g_date_time_add_full" });
        const ret = cFn(self, arg_years, arg_months, arg_days, arg_hours, arg_minutes, arg_seconds);
        return ret;
    }
    pub fn addHours(self: *DateTime, arg_hours: i32) ?*DateTime {
        const cFn = @extern(*const fn (*DateTime, i32) callconv(.c) ?*DateTime, .{ .name = "g_date_time_add_hours" });
        const ret = cFn(self, arg_hours);
        return ret;
    }
    pub fn addMinutes(self: *DateTime, arg_minutes: i32) ?*DateTime {
        const cFn = @extern(*const fn (*DateTime, i32) callconv(.c) ?*DateTime, .{ .name = "g_date_time_add_minutes" });
        const ret = cFn(self, arg_minutes);
        return ret;
    }
    pub fn addMonths(self: *DateTime, arg_months: i32) ?*DateTime {
        const cFn = @extern(*const fn (*DateTime, i32) callconv(.c) ?*DateTime, .{ .name = "g_date_time_add_months" });
        const ret = cFn(self, arg_months);
        return ret;
    }
    pub fn addSeconds(self: *DateTime, arg_seconds: f64) ?*DateTime {
        const cFn = @extern(*const fn (*DateTime, f64) callconv(.c) ?*DateTime, .{ .name = "g_date_time_add_seconds" });
        const ret = cFn(self, arg_seconds);
        return ret;
    }
    pub fn addWeeks(self: *DateTime, arg_weeks: i32) ?*DateTime {
        const cFn = @extern(*const fn (*DateTime, i32) callconv(.c) ?*DateTime, .{ .name = "g_date_time_add_weeks" });
        const ret = cFn(self, arg_weeks);
        return ret;
    }
    pub fn addYears(self: *DateTime, arg_years: i32) ?*DateTime {
        const cFn = @extern(*const fn (*DateTime, i32) callconv(.c) ?*DateTime, .{ .name = "g_date_time_add_years" });
        const ret = cFn(self, arg_years);
        return ret;
    }
    pub fn compare(self: *DateTime, arg_dt2: *DateTime) i32 {
        const cFn = @extern(*const fn (*DateTime, *DateTime) callconv(.c) i32, .{ .name = "g_date_time_compare" });
        const ret = cFn(self, arg_dt2);
        return ret;
    }
    pub fn difference(self: *DateTime, arg_begin: *DateTime) i64 {
        const cFn = @extern(*const fn (*DateTime, *DateTime) callconv(.c) i64, .{ .name = "g_date_time_difference" });
        const ret = cFn(self, arg_begin);
        return ret;
    }
    pub fn equal(self: *DateTime, arg_dt2: *DateTime) bool {
        const cFn = @extern(*const fn (*DateTime, *DateTime) callconv(.c) bool, .{ .name = "g_date_time_equal" });
        const ret = cFn(self, arg_dt2);
        return ret;
    }
    pub fn format(self: *DateTime, arg_format: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DateTime, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_date_time_format" });
        const ret = cFn(self, arg_format);
        return ret;
    }
    pub fn formatIso8601(self: *DateTime) ?[*:0]u8 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) ?[*:0]u8, .{ .name = "g_date_time_format_iso8601" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDayOfMonth(self: *DateTime) i32 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) i32, .{ .name = "g_date_time_get_day_of_month" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDayOfWeek(self: *DateTime) i32 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) i32, .{ .name = "g_date_time_get_day_of_week" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDayOfYear(self: *DateTime) i32 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) i32, .{ .name = "g_date_time_get_day_of_year" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHour(self: *DateTime) i32 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) i32, .{ .name = "g_date_time_get_hour" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMicrosecond(self: *DateTime) i32 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) i32, .{ .name = "g_date_time_get_microsecond" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMinute(self: *DateTime) i32 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) i32, .{ .name = "g_date_time_get_minute" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMonth(self: *DateTime) i32 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) i32, .{ .name = "g_date_time_get_month" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSecond(self: *DateTime) i32 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) i32, .{ .name = "g_date_time_get_second" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSeconds(self: *DateTime) f64 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) f64, .{ .name = "g_date_time_get_seconds" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTimezone(self: *DateTime) *TimeZone {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) *TimeZone, .{ .name = "g_date_time_get_timezone" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTimezoneAbbreviation(self: *DateTime) [*:0]u8 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) [*:0]u8, .{ .name = "g_date_time_get_timezone_abbreviation" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUtcOffset(self: *DateTime) i64 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) i64, .{ .name = "g_date_time_get_utc_offset" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWeekNumberingYear(self: *DateTime) i32 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) i32, .{ .name = "g_date_time_get_week_numbering_year" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getWeekOfYear(self: *DateTime) i32 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) i32, .{ .name = "g_date_time_get_week_of_year" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getYear(self: *DateTime) i32 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) i32, .{ .name = "g_date_time_get_year" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getYmd(self: *DateTime) struct {
        year: i32,
        month: i32,
        day: i32,
    } {
        var argO_year: i32 = undefined;
        const arg_year: ?*i32 = &argO_year;
        var argO_month: i32 = undefined;
        const arg_month: ?*i32 = &argO_month;
        var argO_day: i32 = undefined;
        const arg_day: ?*i32 = &argO_day;
        const cFn = @extern(*const fn (*DateTime, ?*i32, ?*i32, ?*i32) callconv(.c) void, .{ .name = "g_date_time_get_ymd" });
        const ret = cFn(self, arg_year, arg_month, arg_day);
        _ = ret;
        return .{ .year = argO_year, .month = argO_month, .day = argO_day };
    }
    pub fn hash(self: *DateTime) u32 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) u32, .{ .name = "g_date_time_hash" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isDaylightSavings(self: *DateTime) bool {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) bool, .{ .name = "g_date_time_is_daylight_savings" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *DateTime) *DateTime {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) *DateTime, .{ .name = "g_date_time_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn toLocal(self: *DateTime) ?*DateTime {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) ?*DateTime, .{ .name = "g_date_time_to_local" });
        const ret = cFn(self);
        return ret;
    }
    pub fn toTimeval(self: *DateTime, arg_tv: *TimeVal) bool {
        const cFn = @extern(*const fn (*DateTime, *TimeVal) callconv(.c) bool, .{ .name = "g_date_time_to_timeval" });
        const ret = cFn(self, arg_tv);
        return ret;
    }
    pub fn toTimezone(self: *DateTime, arg_tz: *TimeZone) ?*DateTime {
        const cFn = @extern(*const fn (*DateTime, *TimeZone) callconv(.c) ?*DateTime, .{ .name = "g_date_time_to_timezone" });
        const ret = cFn(self, arg_tz);
        return ret;
    }
    pub fn toUnix(self: *DateTime) i64 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) i64, .{ .name = "g_date_time_to_unix" });
        const ret = cFn(self);
        return ret;
    }
    pub fn toUnixUsec(self: *DateTime) i64 {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) i64, .{ .name = "g_date_time_to_unix_usec" });
        const ret = cFn(self);
        return ret;
    }
    pub fn toUtc(self: *DateTime) ?*DateTime {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) ?*DateTime, .{ .name = "g_date_time_to_utc" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *DateTime) void {
        const cFn = @extern(*const fn (*DateTime) callconv(.c) void, .{ .name = "g_date_time_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_date_time_get_type" });
        return cFn();
    }
};
pub const DateWeekday = enum(u32) {
    bad_weekday = 0,
    monday = 1,
    tuesday = 2,
    wednesday = 3,
    thursday = 4,
    friday = 5,
    saturday = 6,
    sunday = 7,
};
pub const DebugKey = extern struct {
    key: ?[*:0]const u8,
    value: u32,
};
pub const DestroyNotify = *const fn (arg_data: ?*anyopaque) callconv(.c) void;
pub const Dir = opaque {
    pub fn open(arg_path: [*:0]const u8, arg_flags: u32, arg_error: *?*GLib.Error) error{GError}!*Dir {
        const cFn = @extern(*const fn ([*:0]const u8, u32, *?*GLib.Error) callconv(.c) *Dir, .{ .name = "g_dir_open" });
        const ret = cFn(arg_path, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn close(self: *Dir) void {
        const cFn = @extern(*const fn (*Dir) callconv(.c) void, .{ .name = "g_dir_close" });
        const ret = cFn(self);
        return ret;
    }
    pub fn readName(self: *Dir) [*:0]u8 {
        const cFn = @extern(*const fn (*Dir) callconv(.c) [*:0]u8, .{ .name = "g_dir_read_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *Dir) *Dir {
        const cFn = @extern(*const fn (*Dir) callconv(.c) *Dir, .{ .name = "g_dir_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn rewind(self: *Dir) void {
        const cFn = @extern(*const fn (*Dir) callconv(.c) void, .{ .name = "g_dir_rewind" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *Dir) void {
        const cFn = @extern(*const fn (*Dir) callconv(.c) void, .{ .name = "g_dir_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn makeTmp(arg_tmpl: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
        const cFn = @extern(*const fn (?[*:0]const u8, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_dir_make_tmp" });
        const ret = cFn(arg_tmpl, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_dir_get_type" });
        return cFn();
    }
};
pub const DoubleIEEE754 = extern union {
    v_double: f64,
};
pub const DuplicateFunc = *const fn (arg_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) ?*anyopaque;
pub const E = 2.718282;
pub const EqualFunc = *const fn (arg_a: ?*anyopaque, arg_b: ?*anyopaque) callconv(.c) bool;
pub const EqualFuncFull = *const fn (arg_a: ?*anyopaque, arg_b: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) bool;
pub const Error = extern struct {
    domain: u32,
    code: i32,
    message: ?[*:0]const u8,
    pub fn newLiteral(arg_domain: u32, arg_code: i32, arg_message: [*:0]const u8) *Error {
        const cFn = @extern(*const fn (u32, i32, [*:0]const u8) callconv(.c) *Error, .{ .name = "g_error_new_literal" });
        const ret = cFn(arg_domain, arg_code, arg_message);
        return ret;
    }
    pub fn copy(self: *Error) *GLib.Error {
        const cFn = @extern(*const fn (*Error) callconv(.c) *GLib.Error, .{ .name = "g_error_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *Error) void {
        const cFn = @extern(*const fn (*Error) callconv(.c) void, .{ .name = "g_error_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn matches(self: *Error, arg_domain: u32, arg_code: i32) bool {
        const cFn = @extern(*const fn (*Error, u32, i32) callconv(.c) bool, .{ .name = "g_error_matches" });
        const ret = cFn(self, arg_domain, arg_code);
        return ret;
    }
    pub fn domainRegister(arg_error_type_name: [*:0]const u8, arg_error_type_private_size: u64, arg_error_type_init: ErrorInitFunc, arg_error_type_copy: ErrorCopyFunc, arg_error_type_clear: ErrorClearFunc) u32 {
        const cFn = @extern(*const fn ([*:0]const u8, u64, ErrorInitFunc, ErrorCopyFunc, ErrorClearFunc) callconv(.c) u32, .{ .name = "g_error_domain_register" });
        const ret = cFn(arg_error_type_name, arg_error_type_private_size, arg_error_type_init, arg_error_type_copy, arg_error_type_clear);
        return ret;
    }
    pub fn domainRegisterStatic(arg_error_type_name: [*:0]const u8, arg_error_type_private_size: u64, arg_error_type_init: ErrorInitFunc, arg_error_type_copy: ErrorCopyFunc, arg_error_type_clear: ErrorClearFunc) u32 {
        const cFn = @extern(*const fn ([*:0]const u8, u64, ErrorInitFunc, ErrorCopyFunc, ErrorClearFunc) callconv(.c) u32, .{ .name = "g_error_domain_register_static" });
        const ret = cFn(arg_error_type_name, arg_error_type_private_size, arg_error_type_init, arg_error_type_copy, arg_error_type_clear);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_error_get_type" });
        return cFn();
    }
};
pub const ErrorClearFunc = *const fn (arg_error: *GLib.Error) callconv(.c) void;
pub const ErrorCopyFunc = *const fn (arg_src_error: *GLib.Error, arg_dest_error: *GLib.Error) callconv(.c) void;
pub const ErrorInitFunc = *const fn (arg_error: *GLib.Error) callconv(.c) void;
pub const ErrorType = enum(u32) {
    unknown = 0,
    unexp_eof = 1,
    unexp_eof_in_string = 2,
    unexp_eof_in_comment = 3,
    non_digit_in_const = 4,
    digit_radix = 5,
    float_radix = 6,
    float_malformed = 7,
};
pub const FileError = enum(u32) {
    exist = 0,
    isdir = 1,
    acces = 2,
    nametoolong = 3,
    noent = 4,
    notdir = 5,
    nxio = 6,
    nodev = 7,
    rofs = 8,
    txtbsy = 9,
    fault = 10,
    loop = 11,
    nospc = 12,
    nomem = 13,
    mfile = 14,
    nfile = 15,
    badf = 16,
    inval = 17,
    pipe = 18,
    again = 19,
    intr = 20,
    io = 21,
    perm = 22,
    nosys = 23,
    failed = 24,
};
pub const FileSetContentsFlags = packed struct(u32) {
    consistent: bool = false,
    durable: bool = false,
    only_existing: bool = false,
    _: u29 = 0,
};
pub const FileTest = packed struct(u32) {
    is_regular: bool = false,
    is_symlink: bool = false,
    is_dir: bool = false,
    is_executable: bool = false,
    exists: bool = false,
    _: u27 = 0,
};
pub const FloatIEEE754 = extern union {
    v_float: f32,
};
pub const FormatSizeFlags = packed struct(u32) {
    long_format: bool = false,
    iec_units: bool = false,
    bits: bool = false,
    only_value: bool = false,
    only_unit: bool = false,
    _: u27 = 0,
};
pub const FreeFunc = *const fn (arg_data: ?*anyopaque) callconv(.c) void;
pub const Func = *const fn (arg_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const GINT16_FORMAT = "hi";
pub const GINT16_MODIFIER = "h";
pub const GINT32_FORMAT = "i";
pub const GINT32_MODIFIER = "";
pub const GINT64_FORMAT = "li";
pub const GINT64_MODIFIER = "l";
pub const GINTPTR_FORMAT = "li";
pub const GINTPTR_MODIFIER = "l";
pub const GNUC_FUNCTION = "";
pub const GNUC_PRETTY_FUNCTION = "";
pub const GSIZE_FORMAT = "lu";
pub const GSIZE_MODIFIER = "l";
pub const GSSIZE_FORMAT = "li";
pub const GSSIZE_MODIFIER = "l";
pub const GUINT16_FORMAT = "hu";
pub const GUINT32_FORMAT = "u";
pub const GUINT64_FORMAT = "lu";
pub const GUINTPTR_FORMAT = "lu";
pub const HAVE_GINT64 = 1;
pub const HAVE_GNUC_VARARGS = 1;
pub const HAVE_GNUC_VISIBILITY = 1;
pub const HAVE_GROWING_STACK = 0;
pub const HAVE_ISO_VARARGS = 1;
pub const HFunc = *const fn (arg_key: ?*anyopaque, arg_value: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const HOOK_FLAG_USER_SHIFT = 4;
pub const HRFunc = *const fn (arg_key: ?*anyopaque, arg_value: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) bool;
pub const HashFunc = *const fn (arg_key: ?*anyopaque) callconv(.c) u32;
pub const HashTable = opaque {
    pub fn add(arg_hash_table: *GLib.HashTable, arg_key: ?*anyopaque) bool {
        const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_add" });
        const ret = cFn(arg_hash_table, @ptrCast(arg_key));
        return ret;
    }
    pub fn contains(arg_hash_table: *GLib.HashTable, arg_key: ?*anyopaque) bool {
        const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_contains" });
        const ret = cFn(arg_hash_table, @ptrCast(arg_key));
        return ret;
    }
    pub fn destroy(arg_hash_table: *GLib.HashTable) void {
        const cFn = @extern(*const fn (*GLib.HashTable) callconv(.c) void, .{ .name = "g_hash_table_destroy" });
        const ret = cFn(arg_hash_table);
        return ret;
    }
    pub fn find(arg_hash_table: *GLib.HashTable, argC_predicate: core.Closure(HRFunc)) ?*anyopaque {
        const arg_predicate: HRFunc = @ptrCast(argC_predicate.callback());
        defer argC_predicate.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_predicate.data());
        const cFn = @extern(*const fn (*GLib.HashTable, HRFunc, ?*anyopaque) callconv(.c) ?*anyopaque, .{ .name = "g_hash_table_find" });
        const ret = cFn(arg_hash_table, arg_predicate, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn foreach(arg_hash_table: *GLib.HashTable, argC_func: core.Closure(HFunc)) void {
        const arg_func: HFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*GLib.HashTable, HFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_hash_table_foreach" });
        const ret = cFn(arg_hash_table, arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn foreachRemove(arg_hash_table: *GLib.HashTable, argC_func: core.Closure(HRFunc)) u32 {
        const arg_func: HRFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*GLib.HashTable, HRFunc, ?*anyopaque) callconv(.c) u32, .{ .name = "g_hash_table_foreach_remove" });
        const ret = cFn(arg_hash_table, arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn foreachSteal(arg_hash_table: *GLib.HashTable, argC_func: core.Closure(HRFunc)) u32 {
        const arg_func: HRFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*GLib.HashTable, HRFunc, ?*anyopaque) callconv(.c) u32, .{ .name = "g_hash_table_foreach_steal" });
        const ret = cFn(arg_hash_table, arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn insert(arg_hash_table: *GLib.HashTable, arg_key: ?*anyopaque, arg_value: ?*anyopaque) bool {
        const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_insert" });
        const ret = cFn(arg_hash_table, @ptrCast(arg_key), @ptrCast(arg_value));
        return ret;
    }
    pub fn lookup(arg_hash_table: *GLib.HashTable, arg_key: ?*anyopaque) ?*anyopaque {
        const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque) callconv(.c) ?*anyopaque, .{ .name = "g_hash_table_lookup" });
        const ret = cFn(arg_hash_table, @ptrCast(arg_key));
        return ret;
    }
    pub fn lookupExtended(arg_hash_table: *GLib.HashTable, arg_lookup_key: ?*anyopaque) struct {
        ret: bool,
        orig_key: ?*anyopaque,
        value: ?*anyopaque,
    } {
        var argO_orig_key: ?*anyopaque = undefined;
        const arg_orig_key: ?*anyopaque = &argO_orig_key;
        var argO_value: ?*anyopaque = undefined;
        const arg_value: ?*anyopaque = &argO_value;
        const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque, ?*anyopaque, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_lookup_extended" });
        const ret = cFn(arg_hash_table, @ptrCast(arg_lookup_key), @ptrCast(arg_orig_key), @ptrCast(arg_value));
        return .{ .ret = ret, .orig_key = argO_orig_key, .value = argO_value };
    }
    pub fn newSimilar(arg_other_hash_table: *GLib.HashTable) *GLib.HashTable {
        const cFn = @extern(*const fn (*GLib.HashTable) callconv(.c) *GLib.HashTable, .{ .name = "g_hash_table_new_similar" });
        const ret = cFn(arg_other_hash_table);
        return ret;
    }
    pub fn ref(arg_hash_table: *GLib.HashTable) *GLib.HashTable {
        const cFn = @extern(*const fn (*GLib.HashTable) callconv(.c) *GLib.HashTable, .{ .name = "g_hash_table_ref" });
        const ret = cFn(arg_hash_table);
        return ret;
    }
    pub fn remove(arg_hash_table: *GLib.HashTable, arg_key: ?*anyopaque) bool {
        const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_remove" });
        const ret = cFn(arg_hash_table, @ptrCast(arg_key));
        return ret;
    }
    pub fn removeAll(arg_hash_table: *GLib.HashTable) void {
        const cFn = @extern(*const fn (*GLib.HashTable) callconv(.c) void, .{ .name = "g_hash_table_remove_all" });
        const ret = cFn(arg_hash_table);
        return ret;
    }
    pub fn replace(arg_hash_table: *GLib.HashTable, arg_key: ?*anyopaque, arg_value: ?*anyopaque) bool {
        const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_replace" });
        const ret = cFn(arg_hash_table, @ptrCast(arg_key), @ptrCast(arg_value));
        return ret;
    }
    pub fn size(arg_hash_table: *GLib.HashTable) u32 {
        const cFn = @extern(*const fn (*GLib.HashTable) callconv(.c) u32, .{ .name = "g_hash_table_size" });
        const ret = cFn(arg_hash_table);
        return ret;
    }
    pub fn steal(arg_hash_table: *GLib.HashTable, arg_key: ?*anyopaque) bool {
        const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_steal" });
        const ret = cFn(arg_hash_table, @ptrCast(arg_key));
        return ret;
    }
    pub fn stealAll(arg_hash_table: *GLib.HashTable) void {
        const cFn = @extern(*const fn (*GLib.HashTable) callconv(.c) void, .{ .name = "g_hash_table_steal_all" });
        const ret = cFn(arg_hash_table);
        return ret;
    }
    pub fn stealExtended(arg_hash_table: *GLib.HashTable, arg_lookup_key: ?*anyopaque) struct {
        ret: bool,
        stolen_key: ?*anyopaque,
        stolen_value: ?*anyopaque,
    } {
        var argO_stolen_key: ?*anyopaque = undefined;
        const arg_stolen_key: ?*anyopaque = &argO_stolen_key;
        var argO_stolen_value: ?*anyopaque = undefined;
        const arg_stolen_value: ?*anyopaque = &argO_stolen_value;
        const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque, ?*anyopaque, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_steal_extended" });
        const ret = cFn(arg_hash_table, @ptrCast(arg_lookup_key), @ptrCast(arg_stolen_key), @ptrCast(arg_stolen_value));
        return .{ .ret = ret, .stolen_key = argO_stolen_key, .stolen_value = argO_stolen_value };
    }
    pub fn unref(arg_hash_table: *GLib.HashTable) void {
        const cFn = @extern(*const fn (*GLib.HashTable) callconv(.c) void, .{ .name = "g_hash_table_unref" });
        const ret = cFn(arg_hash_table);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_hash_table_get_type" });
        return cFn();
    }
};
pub const HashTableIter = extern struct {
    dummy1: ?*anyopaque,
    dummy2: ?*anyopaque,
    dummy3: ?*anyopaque,
    dummy4: i32,
    dummy5: bool,
    dummy6: ?*anyopaque,
    pub fn getHashTable(self: *HashTableIter) *GLib.HashTable {
        const cFn = @extern(*const fn (*HashTableIter) callconv(.c) *GLib.HashTable, .{ .name = "g_hash_table_iter_get_hash_table" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *HashTableIter, arg_hash_table: *GLib.HashTable) void {
        const cFn = @extern(*const fn (*HashTableIter, *GLib.HashTable) callconv(.c) void, .{ .name = "g_hash_table_iter_init" });
        const ret = cFn(self, arg_hash_table);
        return ret;
    }
    pub fn next(self: *HashTableIter) struct {
        ret: bool,
        key: ?*anyopaque,
        value: ?*anyopaque,
    } {
        var argO_key: ?*anyopaque = undefined;
        const arg_key: ?*anyopaque = &argO_key;
        var argO_value: ?*anyopaque = undefined;
        const arg_value: ?*anyopaque = &argO_value;
        const cFn = @extern(*const fn (*HashTableIter, ?*anyopaque, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_iter_next" });
        const ret = cFn(self, @ptrCast(arg_key), @ptrCast(arg_value));
        return .{ .ret = ret, .key = argO_key, .value = argO_value };
    }
    pub fn remove(self: *HashTableIter) void {
        const cFn = @extern(*const fn (*HashTableIter) callconv(.c) void, .{ .name = "g_hash_table_iter_remove" });
        const ret = cFn(self);
        return ret;
    }
    pub fn replace(self: *HashTableIter, arg_value: ?*anyopaque) void {
        const cFn = @extern(*const fn (*HashTableIter, ?*anyopaque) callconv(.c) void, .{ .name = "g_hash_table_iter_replace" });
        const ret = cFn(self, @ptrCast(arg_value));
        return ret;
    }
    pub fn steal(self: *HashTableIter) void {
        const cFn = @extern(*const fn (*HashTableIter) callconv(.c) void, .{ .name = "g_hash_table_iter_steal" });
        const ret = cFn(self);
        return ret;
    }
};
pub const Hmac = opaque {
    pub fn new(arg_digest_type: ChecksumType, argS_key: []u8) ?*Hmac {
        const arg_key: [*]u8 = @ptrCast(argS_key);
        const arg_key_len: u64 = @intCast((argS_key).len);
        const cFn = @extern(*const fn (ChecksumType, [*]u8, u64) callconv(.c) ?*Hmac, .{ .name = "g_hmac_new" });
        const ret = cFn(arg_digest_type, arg_key, arg_key_len);
        return ret;
    }
    pub fn copy(self: *Hmac) *Hmac {
        const cFn = @extern(*const fn (*Hmac) callconv(.c) *Hmac, .{ .name = "g_hmac_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDigest(self: *Hmac, argS_buffer: []u8) []u8 {
        const arg_buffer: [*]u8 = @ptrCast(argS_buffer);
        var argO_digest_len: u64 = @intCast((argS_buffer).len);
        const arg_digest_len: *u64 = &argO_digest_len;
        const cFn = @extern(*const fn (*Hmac, [*]u8, *u64) callconv(.c) void, .{ .name = "g_hmac_get_digest" });
        const ret = cFn(self, arg_buffer, arg_digest_len);
        _ = ret;
        return arg_buffer[0..@intCast(arg_digest_len)];
    }
    pub fn getString(self: *Hmac) [*:0]u8 {
        const cFn = @extern(*const fn (*Hmac) callconv(.c) [*:0]u8, .{ .name = "g_hmac_get_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *Hmac) *Hmac {
        const cFn = @extern(*const fn (*Hmac) callconv(.c) *Hmac, .{ .name = "g_hmac_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *Hmac) void {
        const cFn = @extern(*const fn (*Hmac) callconv(.c) void, .{ .name = "g_hmac_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn update(self: *Hmac, argS_data: []u8) void {
        const arg_data: [*]u8 = @ptrCast(argS_data);
        const arg_length: i64 = @intCast((argS_data).len);
        const cFn = @extern(*const fn (*Hmac, [*]u8, i64) callconv(.c) void, .{ .name = "g_hmac_update" });
        const ret = cFn(self, arg_data, arg_length);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_hmac_get_type" });
        return cFn();
    }
};
pub const Hook = extern struct {
    data: ?*anyopaque,
    next: ?*Hook,
    prev: ?*Hook,
    ref_count: u32,
    hook_id: u64,
    flags: u32,
    func: ?*anyopaque,
    _destroy: ?DestroyNotify,
    pub fn compareIds(self: *Hook, arg_sibling: *Hook) i32 {
        const cFn = @extern(*const fn (*Hook, *Hook) callconv(.c) i32, .{ .name = "g_hook_compare_ids" });
        const ret = cFn(self, arg_sibling);
        return ret;
    }
    pub fn destroy(arg_hook_list: *HookList, arg_hook_id: u64) bool {
        const cFn = @extern(*const fn (*HookList, u64) callconv(.c) bool, .{ .name = "g_hook_destroy" });
        const ret = cFn(arg_hook_list, arg_hook_id);
        return ret;
    }
    pub fn destroyLink(arg_hook_list: *HookList, arg_hook: *Hook) void {
        const cFn = @extern(*const fn (*HookList, *Hook) callconv(.c) void, .{ .name = "g_hook_destroy_link" });
        const ret = cFn(arg_hook_list, arg_hook);
        return ret;
    }
    pub fn free(arg_hook_list: *HookList, arg_hook: *Hook) void {
        const cFn = @extern(*const fn (*HookList, *Hook) callconv(.c) void, .{ .name = "g_hook_free" });
        const ret = cFn(arg_hook_list, arg_hook);
        return ret;
    }
    pub fn insertBefore(arg_hook_list: *HookList, arg_sibling: ?*Hook, arg_hook: *Hook) void {
        const cFn = @extern(*const fn (*HookList, ?*Hook, *Hook) callconv(.c) void, .{ .name = "g_hook_insert_before" });
        const ret = cFn(arg_hook_list, arg_sibling, arg_hook);
        return ret;
    }
    pub fn insertSorted(arg_hook_list: *HookList, arg_hook: *Hook, arg_func: HookCompareFunc) void {
        const cFn = @extern(*const fn (*HookList, *Hook, HookCompareFunc) callconv(.c) void, .{ .name = "g_hook_insert_sorted" });
        const ret = cFn(arg_hook_list, arg_hook, arg_func);
        return ret;
    }
    pub fn prepend(arg_hook_list: *HookList, arg_hook: *Hook) void {
        const cFn = @extern(*const fn (*HookList, *Hook) callconv(.c) void, .{ .name = "g_hook_prepend" });
        const ret = cFn(arg_hook_list, arg_hook);
        return ret;
    }
    pub fn unref(arg_hook_list: *HookList, arg_hook: *Hook) void {
        const cFn = @extern(*const fn (*HookList, *Hook) callconv(.c) void, .{ .name = "g_hook_unref" });
        const ret = cFn(arg_hook_list, arg_hook);
        return ret;
    }
};
pub const HookCheckFunc = *const fn (arg_data: ?*anyopaque) callconv(.c) bool;
pub const HookCheckMarshaller = *const fn (arg_hook: *Hook, arg_marshal_data: ?*anyopaque) callconv(.c) bool;
pub const HookCompareFunc = *const fn (arg_new_hook: *Hook, arg_sibling: *Hook) callconv(.c) i32;
pub const HookFinalizeFunc = *const fn (arg_hook_list: *HookList, arg_hook: *Hook) callconv(.c) void;
pub const HookFindFunc = *const fn (arg_hook: *Hook, arg_data: ?*anyopaque) callconv(.c) bool;
pub const HookFlagMask = packed struct(u32) {
    active: bool = false,
    in_call: bool = false,
    _: u30 = 0,
    pub const mask: @This() = @bitCast(@as(u32, 15));
};
pub const HookFunc = *const fn (arg_data: ?*anyopaque) callconv(.c) void;
pub const HookList = extern struct {
    seq_id: u64,
    _8: packed struct(u32) {
        hook_size: u16,
        is_setup: bool,
        _: u15,
    },
    hooks: ?*Hook,
    dummy3: ?*anyopaque,
    finalize_hook: ?HookFinalizeFunc,
    dummy: [2]?*anyopaque,
    pub fn clear(self: *HookList) void {
        const cFn = @extern(*const fn (*HookList) callconv(.c) void, .{ .name = "g_hook_list_clear" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *HookList, arg_hook_size: u32) void {
        const cFn = @extern(*const fn (*HookList, u32) callconv(.c) void, .{ .name = "g_hook_list_init" });
        const ret = cFn(self, arg_hook_size);
        return ret;
    }
    pub fn invoke(self: *HookList, arg_may_recurse: bool) void {
        const cFn = @extern(*const fn (*HookList, bool) callconv(.c) void, .{ .name = "g_hook_list_invoke" });
        const ret = cFn(self, arg_may_recurse);
        return ret;
    }
    pub fn invokeCheck(self: *HookList, arg_may_recurse: bool) void {
        const cFn = @extern(*const fn (*HookList, bool) callconv(.c) void, .{ .name = "g_hook_list_invoke_check" });
        const ret = cFn(self, arg_may_recurse);
        return ret;
    }
    pub fn marshal(self: *HookList, arg_may_recurse: bool, argC_marshaller: core.Closure(HookMarshaller)) void {
        const arg_marshaller: HookMarshaller = @ptrCast(argC_marshaller.callback());
        defer argC_marshaller.deinit();
        const arg_marshal_data: ?*anyopaque = @ptrCast(argC_marshaller.data());
        const cFn = @extern(*const fn (*HookList, bool, HookMarshaller, ?*anyopaque) callconv(.c) void, .{ .name = "g_hook_list_marshal" });
        const ret = cFn(self, arg_may_recurse, arg_marshaller, @ptrCast(arg_marshal_data));
        return ret;
    }
    pub fn marshalCheck(self: *HookList, arg_may_recurse: bool, argC_marshaller: core.Closure(HookCheckMarshaller)) void {
        const arg_marshaller: HookCheckMarshaller = @ptrCast(argC_marshaller.callback());
        defer argC_marshaller.deinit();
        const arg_marshal_data: ?*anyopaque = @ptrCast(argC_marshaller.data());
        const cFn = @extern(*const fn (*HookList, bool, HookCheckMarshaller, ?*anyopaque) callconv(.c) void, .{ .name = "g_hook_list_marshal_check" });
        const ret = cFn(self, arg_may_recurse, arg_marshaller, @ptrCast(arg_marshal_data));
        return ret;
    }
};
pub const HookMarshaller = *const fn (arg_hook: *Hook, arg_marshal_data: ?*anyopaque) callconv(.c) void;
pub const IEEE754_DOUBLE_BIAS = 1023;
pub const IEEE754_FLOAT_BIAS = 127;
pub const IOChannel = extern struct {
    ref_count: i32,
    funcs: ?*IOFuncs,
    encoding: ?[*:0]const u8,
    read_cd: ?*anyopaque,
    write_cd: ?*anyopaque,
    line_term: ?[*:0]const u8,
    line_term_len: u32,
    buf_size: u64,
    read_buf: ?*String,
    encoded_read_buf: ?*String,
    write_buf: ?*String,
    partial_write_buf: [6]i8,
    _96: packed struct(u32) {
        use_buffer: bool,
        do_encode: bool,
        close_on_unref: bool,
        is_readable: bool,
        is_writeable: bool,
        is_seekable: bool,
        _: u26,
    },
    reserved1: ?*anyopaque,
    reserved2: ?*anyopaque,
    pub fn newFile(arg_filename: [*:0]const u8, arg_mode: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*IOChannel {
        const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) *IOChannel, .{ .name = "g_io_channel_new_file" });
        const ret = cFn(arg_filename, arg_mode, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn unixNew(arg_fd: i32) *IOChannel {
        const cFn = @extern(*const fn (i32) callconv(.c) *IOChannel, .{ .name = "g_io_channel_unix_new" });
        const ret = cFn(arg_fd);
        return ret;
    }
    pub fn close(self: *IOChannel) void {
        const cFn = @extern(*const fn (*IOChannel) callconv(.c) void, .{ .name = "g_io_channel_close" });
        const ret = cFn(self);
        return ret;
    }
    pub fn flush(self: *IOChannel, arg_error: *?*GLib.Error) error{GError}!IOStatus {
        const cFn = @extern(*const fn (*IOChannel, *?*GLib.Error) callconv(.c) IOStatus, .{ .name = "g_io_channel_flush" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getBufferCondition(self: *IOChannel) IOCondition {
        const cFn = @extern(*const fn (*IOChannel) callconv(.c) IOCondition, .{ .name = "g_io_channel_get_buffer_condition" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBufferSize(self: *IOChannel) u64 {
        const cFn = @extern(*const fn (*IOChannel) callconv(.c) u64, .{ .name = "g_io_channel_get_buffer_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBuffered(self: *IOChannel) bool {
        const cFn = @extern(*const fn (*IOChannel) callconv(.c) bool, .{ .name = "g_io_channel_get_buffered" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCloseOnUnref(self: *IOChannel) bool {
        const cFn = @extern(*const fn (*IOChannel) callconv(.c) bool, .{ .name = "g_io_channel_get_close_on_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getEncoding(self: *IOChannel) [*:0]u8 {
        const cFn = @extern(*const fn (*IOChannel) callconv(.c) [*:0]u8, .{ .name = "g_io_channel_get_encoding" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFlags(self: *IOChannel) IOFlags {
        const cFn = @extern(*const fn (*IOChannel) callconv(.c) IOFlags, .{ .name = "g_io_channel_get_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLineTerm(self: *IOChannel) struct {
        ret: [*:0]u8,
        length: i32,
    } {
        var argO_length: i32 = undefined;
        const arg_length: ?*i32 = &argO_length;
        const cFn = @extern(*const fn (*IOChannel, ?*i32) callconv(.c) [*:0]u8, .{ .name = "g_io_channel_get_line_term" });
        const ret = cFn(self, arg_length);
        return .{ .ret = ret, .length = argO_length };
    }
    pub fn init(self: *IOChannel) void {
        const cFn = @extern(*const fn (*IOChannel) callconv(.c) void, .{ .name = "g_io_channel_init" });
        const ret = cFn(self);
        return ret;
    }
    pub fn read(self: *IOChannel, arg_buf: [*:0]const u8, arg_count: u64, arg_bytes_read: *u64) IOError {
        const cFn = @extern(*const fn (*IOChannel, [*:0]const u8, u64, *u64) callconv(.c) IOError, .{ .name = "g_io_channel_read" });
        const ret = cFn(self, arg_buf, arg_count, arg_bytes_read);
        return ret;
    }
    pub fn readChars(self: *IOChannel, argS_buf: []u8, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: IOStatus,
        bytes_read: u64,
    } {
        const arg_buf: [*]u8 = @ptrCast(argS_buf);
        const arg_count: u64 = @intCast((argS_buf).len);
        var argO_bytes_read: u64 = undefined;
        const arg_bytes_read: ?*u64 = &argO_bytes_read;
        const cFn = @extern(*const fn (*IOChannel, [*]u8, u64, ?*u64, *?*GLib.Error) callconv(.c) IOStatus, .{ .name = "g_io_channel_read_chars" });
        const ret = cFn(self, arg_buf, arg_count, arg_bytes_read, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .bytes_read = argO_bytes_read };
    }
    pub fn readLine(self: *IOChannel, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: IOStatus,
        str_return: [*:0]u8,
        length: u64,
        terminator_pos: u64,
    } {
        var argO_str_return: [*:0]u8 = undefined;
        const arg_str_return: *[*:0]u8 = &argO_str_return;
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        var argO_terminator_pos: u64 = undefined;
        const arg_terminator_pos: ?*u64 = &argO_terminator_pos;
        const cFn = @extern(*const fn (*IOChannel, *[*:0]u8, ?*u64, ?*u64, *?*GLib.Error) callconv(.c) IOStatus, .{ .name = "g_io_channel_read_line" });
        const ret = cFn(self, arg_str_return, arg_length, arg_terminator_pos, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .str_return = argO_str_return, .length = argO_length, .terminator_pos = argO_terminator_pos };
    }
    pub fn readLineString(self: *IOChannel, arg_buffer: *String, arg_terminator_pos: ?*u64, arg_error: *?*GLib.Error) error{GError}!IOStatus {
        const cFn = @extern(*const fn (*IOChannel, *String, ?*u64, *?*GLib.Error) callconv(.c) IOStatus, .{ .name = "g_io_channel_read_line_string" });
        const ret = cFn(self, arg_buffer, arg_terminator_pos, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn readToEnd(self: *IOChannel, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: IOStatus,
        str_return: []u8,
    } {
        var argO_str_return: [*]u8 = undefined;
        const arg_str_return: *[*]u8 = &argO_str_return;
        var argO_length: u64 = undefined;
        const arg_length: *u64 = &argO_length;
        const cFn = @extern(*const fn (*IOChannel, *[*]u8, *u64, *?*GLib.Error) callconv(.c) IOStatus, .{ .name = "g_io_channel_read_to_end" });
        const ret = cFn(self, arg_str_return, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .str_return = argO_str_return[0..@intCast(argO_length)] };
    }
    pub fn readUnichar(self: *IOChannel, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: IOStatus,
        thechar: u32,
    } {
        var argO_thechar: u32 = undefined;
        const arg_thechar: *u32 = &argO_thechar;
        const cFn = @extern(*const fn (*IOChannel, *u32, *?*GLib.Error) callconv(.c) IOStatus, .{ .name = "g_io_channel_read_unichar" });
        const ret = cFn(self, arg_thechar, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .thechar = argO_thechar };
    }
    pub fn ref(self: *IOChannel) *IOChannel {
        const cFn = @extern(*const fn (*IOChannel) callconv(.c) *IOChannel, .{ .name = "g_io_channel_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn seek(self: *IOChannel, arg_offset: i64, arg_type: SeekType) IOError {
        const cFn = @extern(*const fn (*IOChannel, i64, SeekType) callconv(.c) IOError, .{ .name = "g_io_channel_seek" });
        const ret = cFn(self, arg_offset, arg_type);
        return ret;
    }
    pub fn seekPosition(self: *IOChannel, arg_offset: i64, arg_type: SeekType, arg_error: *?*GLib.Error) error{GError}!IOStatus {
        const cFn = @extern(*const fn (*IOChannel, i64, SeekType, *?*GLib.Error) callconv(.c) IOStatus, .{ .name = "g_io_channel_seek_position" });
        const ret = cFn(self, arg_offset, arg_type, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setBufferSize(self: *IOChannel, arg_size: u64) void {
        const cFn = @extern(*const fn (*IOChannel, u64) callconv(.c) void, .{ .name = "g_io_channel_set_buffer_size" });
        const ret = cFn(self, arg_size);
        return ret;
    }
    pub fn setBuffered(self: *IOChannel, arg_buffered: bool) void {
        const cFn = @extern(*const fn (*IOChannel, bool) callconv(.c) void, .{ .name = "g_io_channel_set_buffered" });
        const ret = cFn(self, arg_buffered);
        return ret;
    }
    pub fn setCloseOnUnref(self: *IOChannel, arg_do_close: bool) void {
        const cFn = @extern(*const fn (*IOChannel, bool) callconv(.c) void, .{ .name = "g_io_channel_set_close_on_unref" });
        const ret = cFn(self, arg_do_close);
        return ret;
    }
    pub fn setEncoding(self: *IOChannel, arg_encoding: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!IOStatus {
        const cFn = @extern(*const fn (*IOChannel, ?[*:0]const u8, *?*GLib.Error) callconv(.c) IOStatus, .{ .name = "g_io_channel_set_encoding" });
        const ret = cFn(self, arg_encoding, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setFlags(self: *IOChannel, arg_flags: IOFlags, arg_error: *?*GLib.Error) error{GError}!IOStatus {
        const cFn = @extern(*const fn (*IOChannel, IOFlags, *?*GLib.Error) callconv(.c) IOStatus, .{ .name = "g_io_channel_set_flags" });
        const ret = cFn(self, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setLineTerm(self: *IOChannel, arg_line_term: ?[*:0]const u8, arg_length: i32) void {
        const cFn = @extern(*const fn (*IOChannel, ?[*:0]const u8, i32) callconv(.c) void, .{ .name = "g_io_channel_set_line_term" });
        const ret = cFn(self, arg_line_term, arg_length);
        return ret;
    }
    pub fn shutdown(self: *IOChannel, arg_flush: bool, arg_error: *?*GLib.Error) error{GError}!IOStatus {
        const cFn = @extern(*const fn (*IOChannel, bool, *?*GLib.Error) callconv(.c) IOStatus, .{ .name = "g_io_channel_shutdown" });
        const ret = cFn(self, arg_flush, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn unixGetFd(self: *IOChannel) i32 {
        const cFn = @extern(*const fn (*IOChannel) callconv(.c) i32, .{ .name = "g_io_channel_unix_get_fd" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *IOChannel) void {
        const cFn = @extern(*const fn (*IOChannel) callconv(.c) void, .{ .name = "g_io_channel_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn write(self: *IOChannel, arg_buf: [*:0]const u8, arg_count: u64, arg_bytes_written: *u64) IOError {
        const cFn = @extern(*const fn (*IOChannel, [*:0]const u8, u64, *u64) callconv(.c) IOError, .{ .name = "g_io_channel_write" });
        const ret = cFn(self, arg_buf, arg_count, arg_bytes_written);
        return ret;
    }
    pub fn writeChars(self: *IOChannel, arg_buf: [*]u8, arg_count: i64, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: IOStatus,
        bytes_written: u64,
    } {
        var argO_bytes_written: u64 = undefined;
        const arg_bytes_written: *u64 = &argO_bytes_written;
        const cFn = @extern(*const fn (*IOChannel, [*]u8, i64, *u64, *?*GLib.Error) callconv(.c) IOStatus, .{ .name = "g_io_channel_write_chars" });
        const ret = cFn(self, arg_buf, arg_count, arg_bytes_written, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .bytes_written = argO_bytes_written };
    }
    pub fn writeUnichar(self: *IOChannel, arg_thechar: u32, arg_error: *?*GLib.Error) error{GError}!IOStatus {
        const cFn = @extern(*const fn (*IOChannel, u32, *?*GLib.Error) callconv(.c) IOStatus, .{ .name = "g_io_channel_write_unichar" });
        const ret = cFn(self, arg_thechar, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn errorFromErrno(arg_en: i32) IOChannelError {
        const cFn = @extern(*const fn (i32) callconv(.c) IOChannelError, .{ .name = "g_io_channel_error_from_errno" });
        const ret = cFn(arg_en);
        return ret;
    }
    pub fn errorQuark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_io_channel_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_io_channel_get_type" });
        return cFn();
    }
};
pub const IOChannelError = enum(u32) {
    fbig = 0,
    inval = 1,
    io = 2,
    isdir = 3,
    nospc = 4,
    nxio = 5,
    overflow = 6,
    pipe = 7,
    failed = 8,
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
pub const IOError = enum(u32) {
    none = 0,
    again = 1,
    inval = 2,
    unknown = 3,
};
pub const IOFlags = packed struct(u32) {
    append: bool = false,
    nonblock: bool = false,
    is_readable: bool = false,
    is_writable: bool = false,
    is_seekable: bool = false,
    _: u27 = 0,
    pub const mask: @This() = @bitCast(@as(u32, 31));
    pub const get_mask: @This() = @bitCast(@as(u32, 31));
    pub const set_mask: @This() = @bitCast(@as(u32, 3));
};
pub const IOFunc = *const fn (arg_source: *IOChannel, arg_condition: IOCondition, arg_data: ?*anyopaque) callconv(.c) bool;
pub const IOFuncs = extern struct {
    io_read: ?*const fn (arg_channel: *IOChannel, arg_buf: [*:0]const u8, arg_count: u64, arg_bytes_read: *u64, arg_error: *?*GLib.Error) callconv(.c) IOStatus,
    io_write: ?*const fn (arg_channel: *IOChannel, arg_buf: [*:0]const u8, arg_count: u64, arg_bytes_written: *u64, arg_error: *?*GLib.Error) callconv(.c) IOStatus,
    io_seek: ?*const fn (arg_channel: *IOChannel, arg_offset: i64, arg_type: SeekType, arg_error: *?*GLib.Error) callconv(.c) IOStatus,
    io_close: ?*const fn (arg_channel: *IOChannel, arg_error: *?*GLib.Error) callconv(.c) IOStatus,
    io_create_watch: ?*const fn (arg_channel: *IOChannel, arg_condition: IOCondition) callconv(.c) *Source,
    io_free: ?*const fn (arg_channel: *IOChannel) callconv(.c) void,
    io_set_flags: ?*const fn (arg_channel: *IOChannel, arg_flags: IOFlags, arg_error: *?*GLib.Error) callconv(.c) IOStatus,
    io_get_flags: ?*const fn (arg_channel: *IOChannel) callconv(.c) IOFlags,
};
pub const IOStatus = enum(u32) {
    @"error" = 0,
    normal = 1,
    eof = 2,
    again = 3,
};
pub const KEY_FILE_DESKTOP_GROUP = "Desktop Entry";
pub const KEY_FILE_DESKTOP_KEY_ACTIONS = "Actions";
pub const KEY_FILE_DESKTOP_KEY_CATEGORIES = "Categories";
pub const KEY_FILE_DESKTOP_KEY_COMMENT = "Comment";
pub const KEY_FILE_DESKTOP_KEY_DBUS_ACTIVATABLE = "DBusActivatable";
pub const KEY_FILE_DESKTOP_KEY_EXEC = "Exec";
pub const KEY_FILE_DESKTOP_KEY_GENERIC_NAME = "GenericName";
pub const KEY_FILE_DESKTOP_KEY_HIDDEN = "Hidden";
pub const KEY_FILE_DESKTOP_KEY_ICON = "Icon";
pub const KEY_FILE_DESKTOP_KEY_MIME_TYPE = "MimeType";
pub const KEY_FILE_DESKTOP_KEY_NAME = "Name";
pub const KEY_FILE_DESKTOP_KEY_NOT_SHOW_IN = "NotShowIn";
pub const KEY_FILE_DESKTOP_KEY_NO_DISPLAY = "NoDisplay";
pub const KEY_FILE_DESKTOP_KEY_ONLY_SHOW_IN = "OnlyShowIn";
pub const KEY_FILE_DESKTOP_KEY_PATH = "Path";
pub const KEY_FILE_DESKTOP_KEY_STARTUP_NOTIFY = "StartupNotify";
pub const KEY_FILE_DESKTOP_KEY_STARTUP_WM_CLASS = "StartupWMClass";
pub const KEY_FILE_DESKTOP_KEY_TERMINAL = "Terminal";
pub const KEY_FILE_DESKTOP_KEY_TRY_EXEC = "TryExec";
pub const KEY_FILE_DESKTOP_KEY_TYPE = "Type";
pub const KEY_FILE_DESKTOP_KEY_URL = "URL";
pub const KEY_FILE_DESKTOP_KEY_VERSION = "Version";
pub const KEY_FILE_DESKTOP_TYPE_APPLICATION = "Application";
pub const KEY_FILE_DESKTOP_TYPE_DIRECTORY = "Directory";
pub const KEY_FILE_DESKTOP_TYPE_LINK = "Link";
pub const KeyFile = opaque {
    pub fn new() *KeyFile {
        const cFn = @extern(*const fn () callconv(.c) *KeyFile, .{ .name = "g_key_file_new" });
        const ret = cFn();
        return ret;
    }
    pub fn getBoolean(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_key_file_get_boolean" });
        const ret = cFn(self, arg_group_name, arg_key, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getBooleanList(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}![]bool {
        var argO_length: u64 = undefined;
        const arg_length: *u64 = &argO_length;
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, *u64, *?*GLib.Error) callconv(.c) [*]bool, .{ .name = "g_key_file_get_boolean_list" });
        const ret = cFn(self, arg_group_name, arg_key, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret[0..@intCast(argO_length)];
    }
    pub fn getComment(self: *KeyFile, arg_group_name: ?[*:0]const u8, arg_key: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
        const cFn = @extern(*const fn (*KeyFile, ?[*:0]const u8, ?[*:0]const u8, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_key_file_get_comment" });
        const ret = cFn(self, arg_group_name, arg_key, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getDouble(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!f64 {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) f64, .{ .name = "g_key_file_get_double" });
        const ret = cFn(self, arg_group_name, arg_key, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getDoubleList(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}![]f64 {
        var argO_length: u64 = undefined;
        const arg_length: *u64 = &argO_length;
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, *u64, *?*GLib.Error) callconv(.c) [*]f64, .{ .name = "g_key_file_get_double_list" });
        const ret = cFn(self, arg_group_name, arg_key, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret[0..@intCast(argO_length)];
    }
    pub fn getGroups(self: *KeyFile) struct {
        ret: [*]?[*:0]const u8,
        length: u64,
    } {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*KeyFile, ?*u64) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_key_file_get_groups" });
        const ret = cFn(self, arg_length);
        return .{ .ret = ret, .length = argO_length };
    }
    pub fn getInt64(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!i64 {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) i64, .{ .name = "g_key_file_get_int64" });
        const ret = cFn(self, arg_group_name, arg_key, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getInteger(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!i32 {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) i32, .{ .name = "g_key_file_get_integer" });
        const ret = cFn(self, arg_group_name, arg_key, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getIntegerList(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}![]i32 {
        var argO_length: u64 = undefined;
        const arg_length: *u64 = &argO_length;
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, *u64, *?*GLib.Error) callconv(.c) [*]i32, .{ .name = "g_key_file_get_integer_list" });
        const ret = cFn(self, arg_group_name, arg_key, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret[0..@intCast(argO_length)];
    }
    pub fn getKeys(self: *KeyFile, arg_group_name: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: [*]?[*:0]const u8,
        length: u64,
    } {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, ?*u64, *?*GLib.Error) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_key_file_get_keys" });
        const ret = cFn(self, arg_group_name, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .length = argO_length };
    }
    pub fn getLocaleForKey(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_locale: ?[*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, ?[*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_key_file_get_locale_for_key" });
        const ret = cFn(self, arg_group_name, arg_key, arg_locale);
        return ret;
    }
    pub fn getLocaleString(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_locale: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, ?[*:0]const u8, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_key_file_get_locale_string" });
        const ret = cFn(self, arg_group_name, arg_key, arg_locale, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getLocaleStringList(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_locale: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}![][*:0]const u8 {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, ?[*:0]const u8, ?*u64, *?*GLib.Error) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_key_file_get_locale_string_list" });
        const ret = cFn(self, arg_group_name, arg_key, arg_locale, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret[0..@intCast(argO_length)];
    }
    pub fn getStartGroup(self: *KeyFile) ?[*:0]u8 {
        const cFn = @extern(*const fn (*KeyFile) callconv(.c) ?[*:0]u8, .{ .name = "g_key_file_get_start_group" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getString(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_key_file_get_string" });
        const ret = cFn(self, arg_group_name, arg_key, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getStringList(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}![][*:0]const u8 {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, ?*u64, *?*GLib.Error) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_key_file_get_string_list" });
        const ret = cFn(self, arg_group_name, arg_key, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret[0..@intCast(argO_length)];
    }
    pub fn getUint64(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!u64 {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) u64, .{ .name = "g_key_file_get_uint64" });
        const ret = cFn(self, arg_group_name, arg_key, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getValue(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_key_file_get_value" });
        const ret = cFn(self, arg_group_name, arg_key, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn hasGroup(self: *KeyFile, arg_group_name: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8) callconv(.c) bool, .{ .name = "g_key_file_has_group" });
        const ret = cFn(self, arg_group_name);
        return ret;
    }
    pub fn loadFromBytes(self: *KeyFile, arg_bytes: *Bytes, arg_flags: KeyFileFlags, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*KeyFile, *Bytes, KeyFileFlags, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_key_file_load_from_bytes" });
        const ret = cFn(self, arg_bytes, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn loadFromData(self: *KeyFile, arg_data: [*:0]const u8, arg_length: u64, arg_flags: KeyFileFlags, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, u64, KeyFileFlags, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_key_file_load_from_data" });
        const ret = cFn(self, arg_data, arg_length, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn loadFromDataDirs(self: *KeyFile, arg_file: [*:0]const u8, arg_flags: KeyFileFlags, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        full_path: [*:0]u8,
    } {
        var argO_full_path: ?[*:0]u8 = undefined;
        const arg_full_path: ?*[*:0]u8 = &argO_full_path;
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, ?*[*:0]u8, KeyFileFlags, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_key_file_load_from_data_dirs" });
        const ret = cFn(self, arg_file, arg_full_path, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .full_path = argO_full_path };
    }
    pub fn loadFromDirs(self: *KeyFile, arg_file: [*:0]const u8, arg_search_dirs: [*]?[*:0]const u8, arg_flags: KeyFileFlags, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        full_path: [*:0]u8,
    } {
        var argO_full_path: ?[*:0]u8 = undefined;
        const arg_full_path: ?*[*:0]u8 = &argO_full_path;
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*]?[*:0]const u8, ?*[*:0]u8, KeyFileFlags, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_key_file_load_from_dirs" });
        const ret = cFn(self, arg_file, arg_search_dirs, arg_full_path, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .full_path = argO_full_path };
    }
    pub fn loadFromFile(self: *KeyFile, arg_file: [*:0]const u8, arg_flags: KeyFileFlags, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, KeyFileFlags, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_key_file_load_from_file" });
        const ret = cFn(self, arg_file, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn removeComment(self: *KeyFile, arg_group_name: ?[*:0]const u8, arg_key: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*KeyFile, ?[*:0]const u8, ?[*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_key_file_remove_comment" });
        const ret = cFn(self, arg_group_name, arg_key, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn removeGroup(self: *KeyFile, arg_group_name: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_key_file_remove_group" });
        const ret = cFn(self, arg_group_name, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn removeKey(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_key_file_remove_key" });
        const ret = cFn(self, arg_group_name, arg_key, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn saveToFile(self: *KeyFile, arg_filename: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_key_file_save_to_file" });
        const ret = cFn(self, arg_filename, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setBoolean(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_value: bool) void {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, bool) callconv(.c) void, .{ .name = "g_key_file_set_boolean" });
        const ret = cFn(self, arg_group_name, arg_key, arg_value);
        return ret;
    }
    pub fn setBooleanList(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, argS_list: []bool) void {
        const arg_list: [*]bool = @ptrCast(argS_list);
        const arg_length: u64 = @intCast((argS_list).len);
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, [*]bool, u64) callconv(.c) void, .{ .name = "g_key_file_set_boolean_list" });
        const ret = cFn(self, arg_group_name, arg_key, arg_list, arg_length);
        return ret;
    }
    pub fn setComment(self: *KeyFile, arg_group_name: ?[*:0]const u8, arg_key: ?[*:0]const u8, arg_comment: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*KeyFile, ?[*:0]const u8, ?[*:0]const u8, [*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_key_file_set_comment" });
        const ret = cFn(self, arg_group_name, arg_key, arg_comment, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setDouble(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_value: f64) void {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, f64) callconv(.c) void, .{ .name = "g_key_file_set_double" });
        const ret = cFn(self, arg_group_name, arg_key, arg_value);
        return ret;
    }
    pub fn setDoubleList(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, argS_list: []f64) void {
        const arg_list: [*]f64 = @ptrCast(argS_list);
        const arg_length: u64 = @intCast((argS_list).len);
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, [*]f64, u64) callconv(.c) void, .{ .name = "g_key_file_set_double_list" });
        const ret = cFn(self, arg_group_name, arg_key, arg_list, arg_length);
        return ret;
    }
    pub fn setInt64(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_value: i64) void {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, i64) callconv(.c) void, .{ .name = "g_key_file_set_int64" });
        const ret = cFn(self, arg_group_name, arg_key, arg_value);
        return ret;
    }
    pub fn setInteger(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_value: i32) void {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, i32) callconv(.c) void, .{ .name = "g_key_file_set_integer" });
        const ret = cFn(self, arg_group_name, arg_key, arg_value);
        return ret;
    }
    pub fn setIntegerList(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, argS_list: []i32) void {
        const arg_list: [*]i32 = @ptrCast(argS_list);
        const arg_length: u64 = @intCast((argS_list).len);
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, [*]i32, u64) callconv(.c) void, .{ .name = "g_key_file_set_integer_list" });
        const ret = cFn(self, arg_group_name, arg_key, arg_list, arg_length);
        return ret;
    }
    pub fn setListSeparator(self: *KeyFile, arg_separator: i8) void {
        const cFn = @extern(*const fn (*KeyFile, i8) callconv(.c) void, .{ .name = "g_key_file_set_list_separator" });
        const ret = cFn(self, arg_separator);
        return ret;
    }
    pub fn setLocaleString(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_locale: [*:0]const u8, arg_string: [*:0]const u8) void {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, [*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_key_file_set_locale_string" });
        const ret = cFn(self, arg_group_name, arg_key, arg_locale, arg_string);
        return ret;
    }
    pub fn setLocaleStringList(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_locale: [*:0]const u8, argS_list: []?[*:0]const u8) void {
        const arg_list: [*]?[*:0]const u8 = @ptrCast(argS_list);
        const arg_length: u64 = @intCast((argS_list).len);
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, [*:0]const u8, [*]?[*:0]const u8, u64) callconv(.c) void, .{ .name = "g_key_file_set_locale_string_list" });
        const ret = cFn(self, arg_group_name, arg_key, arg_locale, arg_list, arg_length);
        return ret;
    }
    pub fn setString(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_string: [*:0]const u8) void {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_key_file_set_string" });
        const ret = cFn(self, arg_group_name, arg_key, arg_string);
        return ret;
    }
    pub fn setStringList(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, argS_list: []?[*:0]const u8) void {
        const arg_list: [*]?[*:0]const u8 = @ptrCast(argS_list);
        const arg_length: u64 = @intCast((argS_list).len);
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, [*]?[*:0]const u8, u64) callconv(.c) void, .{ .name = "g_key_file_set_string_list" });
        const ret = cFn(self, arg_group_name, arg_key, arg_list, arg_length);
        return ret;
    }
    pub fn setUint64(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_value: u64) void {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, u64) callconv(.c) void, .{ .name = "g_key_file_set_uint64" });
        const ret = cFn(self, arg_group_name, arg_key, arg_value);
        return ret;
    }
    pub fn setValue(self: *KeyFile, arg_group_name: [*:0]const u8, arg_key: [*:0]const u8, arg_value: [*:0]const u8) void {
        const cFn = @extern(*const fn (*KeyFile, [*:0]const u8, [*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_key_file_set_value" });
        const ret = cFn(self, arg_group_name, arg_key, arg_value);
        return ret;
    }
    pub fn toData(self: *KeyFile, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: [*:0]u8,
        length: u64,
    } {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*KeyFile, ?*u64, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_key_file_to_data" });
        const ret = cFn(self, arg_length, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .length = argO_length };
    }
    pub fn unref(self: *KeyFile) void {
        const cFn = @extern(*const fn (*KeyFile) callconv(.c) void, .{ .name = "g_key_file_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn errorQuark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_key_file_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_key_file_get_type" });
        return cFn();
    }
};
pub const KeyFileError = enum(u32) {
    unknown_encoding = 0,
    parse = 1,
    not_found = 2,
    key_not_found = 3,
    group_not_found = 4,
    invalid_value = 5,
};
pub const KeyFileFlags = packed struct(u32) {
    keep_comments: bool = false,
    keep_translations: bool = false,
    _: u30 = 0,
};
pub const LITTLE_ENDIAN = 1234;
pub const LN10 = 2.302585;
pub const LN2 = 0.693147;
pub const LOG_2_BASE_10 = 0.30103;
pub const LOG_DOMAIN = 0;
pub const LOG_FATAL_MASK = 5;
pub const LOG_LEVEL_USER_SHIFT = 8;
pub const List = extern struct {
    data: ?*anyopaque,
    next: ?*GLib.List,
    prev: ?*GLib.List,
    pub fn popAllocator() void {
        const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_list_pop_allocator" });
        const ret = cFn();
        return ret;
    }
    pub fn pushAllocator(arg_allocator: *Allocator) void {
        const cFn = @extern(*const fn (*Allocator) callconv(.c) void, .{ .name = "g_list_push_allocator" });
        const ret = cFn(arg_allocator);
        return ret;
    }
};
pub const LogField = extern struct {
    key: ?[*:0]const u8,
    value: ?*anyopaque,
    length: i64,
};
pub const LogFunc = *const fn (arg_log_domain: ?[*:0]const u8, arg_log_level: LogLevelFlags, arg_message: [*:0]const u8, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const LogLevelFlags = packed struct(i32) {
    flag_recursion: bool = false,
    flag_fatal: bool = false,
    level_error: bool = false,
    level_critical: bool = false,
    level_warning: bool = false,
    level_message: bool = false,
    level_info: bool = false,
    level_debug: bool = false,
    _: u24 = 0,
    pub const level_mask: @This() = @bitCast(@as(i32, -4));
};
pub const LogWriterFunc = *const fn (arg_log_level: LogLevelFlags, arg_fields: [*]LogField, arg_n_fields: u64, arg_user_data: ?*anyopaque) callconv(.c) LogWriterOutput;
pub const LogWriterOutput = enum(u32) {
    handled = 1,
    unhandled = 0,
};
pub const MAJOR_VERSION = 2;
pub const MAXINT16 = 32767;
pub const MAXINT32 = 2147483647;
pub const MAXINT64 = 9223372036854775807;
pub const MAXINT8 = 127;
pub const MAXUINT16 = 65535;
pub const MAXUINT32 = 4294967295;
pub const MAXUINT64 = 18446744073709551615;
pub const MAXUINT8 = 255;
pub const MICRO_VERSION = 1;
pub const MININT16 = -32768;
pub const MININT32 = -2147483648;
pub const MININT64 = -9223372036854775808;
pub const MININT8 = -128;
pub const MINOR_VERSION = 85;
pub const MODULE_SUFFIX = "so";
pub const MainContext = opaque {
    pub fn new() *MainContext {
        const cFn = @extern(*const fn () callconv(.c) *MainContext, .{ .name = "g_main_context_new" });
        const ret = cFn();
        return ret;
    }
    pub fn newWithFlags(arg_flags: MainContextFlags) *MainContext {
        const cFn = @extern(*const fn (MainContextFlags) callconv(.c) *MainContext, .{ .name = "g_main_context_new_with_flags" });
        const ret = cFn(arg_flags);
        return ret;
    }
    pub fn acquire(self: *MainContext) bool {
        const cFn = @extern(*const fn (*MainContext) callconv(.c) bool, .{ .name = "g_main_context_acquire" });
        const ret = cFn(self);
        return ret;
    }
    pub fn addPoll(self: *MainContext, arg_fd: *PollFD, arg_priority: i32) void {
        const cFn = @extern(*const fn (*MainContext, *PollFD, i32) callconv(.c) void, .{ .name = "g_main_context_add_poll" });
        const ret = cFn(self, arg_fd, arg_priority);
        return ret;
    }
    pub fn check(self: *MainContext, arg_max_priority: i32, argS_fds: []PollFD) bool {
        const arg_fds: [*]PollFD = @ptrCast(argS_fds);
        const arg_n_fds: i32 = @intCast((argS_fds).len);
        const cFn = @extern(*const fn (*MainContext, i32, [*]PollFD, i32) callconv(.c) bool, .{ .name = "g_main_context_check" });
        const ret = cFn(self, arg_max_priority, arg_fds, arg_n_fds);
        return ret;
    }
    pub fn dispatch(self: *MainContext) void {
        const cFn = @extern(*const fn (*MainContext) callconv(.c) void, .{ .name = "g_main_context_dispatch" });
        const ret = cFn(self);
        return ret;
    }
    pub fn findSourceByFuncsUserData(self: *MainContext, arg_funcs: *SourceFuncs, arg_user_data: ?*anyopaque) *Source {
        const cFn = @extern(*const fn (*MainContext, *SourceFuncs, ?*anyopaque) callconv(.c) *Source, .{ .name = "g_main_context_find_source_by_funcs_user_data" });
        const ret = cFn(self, arg_funcs, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn findSourceById(self: *MainContext, arg_source_id: u32) *Source {
        const cFn = @extern(*const fn (*MainContext, u32) callconv(.c) *Source, .{ .name = "g_main_context_find_source_by_id" });
        const ret = cFn(self, arg_source_id);
        return ret;
    }
    pub fn findSourceByUserData(self: *MainContext, arg_user_data: ?*anyopaque) *Source {
        const cFn = @extern(*const fn (*MainContext, ?*anyopaque) callconv(.c) *Source, .{ .name = "g_main_context_find_source_by_user_data" });
        const ret = cFn(self, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn invokeFull(self: *MainContext, arg_priority: i32, argC_function: core.Closure(SourceFunc)) void {
        const arg_function: SourceFunc = @ptrCast(argC_function.callback());
        const arg_data: ?*anyopaque = @ptrCast(argC_function.data());
        const arg_notify: ?DestroyNotify = @ptrCast(argC_function.destroy());
        const cFn = @extern(*const fn (*MainContext, i32, SourceFunc, ?*anyopaque, ?DestroyNotify) callconv(.c) void, .{ .name = "g_main_context_invoke_full" });
        const ret = cFn(self, arg_priority, arg_function, @ptrCast(arg_data), arg_notify);
        return ret;
    }
    pub fn isOwner(self: *MainContext) bool {
        const cFn = @extern(*const fn (*MainContext) callconv(.c) bool, .{ .name = "g_main_context_is_owner" });
        const ret = cFn(self);
        return ret;
    }
    pub fn iteration(self: *MainContext, arg_may_block: bool) bool {
        const cFn = @extern(*const fn (*MainContext, bool) callconv(.c) bool, .{ .name = "g_main_context_iteration" });
        const ret = cFn(self, arg_may_block);
        return ret;
    }
    pub fn pending(self: *MainContext) bool {
        const cFn = @extern(*const fn (*MainContext) callconv(.c) bool, .{ .name = "g_main_context_pending" });
        const ret = cFn(self);
        return ret;
    }
    pub fn popThreadDefault(self: *MainContext) void {
        const cFn = @extern(*const fn (*MainContext) callconv(.c) void, .{ .name = "g_main_context_pop_thread_default" });
        const ret = cFn(self);
        return ret;
    }
    pub fn prepare(self: *MainContext) struct {
        ret: bool,
        priority: i32,
    } {
        var argO_priority: i32 = undefined;
        const arg_priority: ?*i32 = &argO_priority;
        const cFn = @extern(*const fn (*MainContext, ?*i32) callconv(.c) bool, .{ .name = "g_main_context_prepare" });
        const ret = cFn(self, arg_priority);
        return .{ .ret = ret, .priority = argO_priority };
    }
    pub fn pushThreadDefault(self: *MainContext) void {
        const cFn = @extern(*const fn (*MainContext) callconv(.c) void, .{ .name = "g_main_context_push_thread_default" });
        const ret = cFn(self);
        return ret;
    }
    pub fn pusherNew(self: *MainContext) *anyopaque {
        const cFn = @extern(*const fn (*MainContext) callconv(.c) *anyopaque, .{ .name = "g_main_context_pusher_new" });
        const ret = cFn(self);
        return ret;
    }
    pub fn query(self: *MainContext, arg_max_priority: i32, argS_fds: []PollFD) struct {
        ret: i32,
        timeout_: i32,
    } {
        const arg_fds: [*]PollFD = @ptrCast(argS_fds);
        const arg_n_fds: i32 = @intCast((argS_fds).len);
        var argO_timeout_: i32 = undefined;
        const arg_timeout_: *i32 = &argO_timeout_;
        const cFn = @extern(*const fn (*MainContext, i32, *i32, [*]PollFD, i32) callconv(.c) i32, .{ .name = "g_main_context_query" });
        const ret = cFn(self, arg_max_priority, arg_timeout_, arg_fds, arg_n_fds);
        return .{ .ret = ret, .timeout_ = argO_timeout_ };
    }
    pub fn ref(self: *MainContext) *MainContext {
        const cFn = @extern(*const fn (*MainContext) callconv(.c) *MainContext, .{ .name = "g_main_context_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn release(self: *MainContext) void {
        const cFn = @extern(*const fn (*MainContext) callconv(.c) void, .{ .name = "g_main_context_release" });
        const ret = cFn(self);
        return ret;
    }
    pub fn removePoll(self: *MainContext, arg_fd: *PollFD) void {
        const cFn = @extern(*const fn (*MainContext, *PollFD) callconv(.c) void, .{ .name = "g_main_context_remove_poll" });
        const ret = cFn(self, arg_fd);
        return ret;
    }
    pub fn unref(self: *MainContext) void {
        const cFn = @extern(*const fn (*MainContext) callconv(.c) void, .{ .name = "g_main_context_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn wait(self: *MainContext, arg_cond: *Cond, arg_mutex: *Mutex) bool {
        const cFn = @extern(*const fn (*MainContext, *Cond, *Mutex) callconv(.c) bool, .{ .name = "g_main_context_wait" });
        const ret = cFn(self, arg_cond, arg_mutex);
        return ret;
    }
    pub fn wakeup(self: *MainContext) void {
        const cFn = @extern(*const fn (*MainContext) callconv(.c) void, .{ .name = "g_main_context_wakeup" });
        const ret = cFn(self);
        return ret;
    }
    pub fn default() *MainContext {
        const cFn = @extern(*const fn () callconv(.c) *MainContext, .{ .name = "g_main_context_default" });
        const ret = cFn();
        return ret;
    }
    pub fn getThreadDefault() ?*MainContext {
        const cFn = @extern(*const fn () callconv(.c) ?*MainContext, .{ .name = "g_main_context_get_thread_default" });
        const ret = cFn();
        return ret;
    }
    pub fn refThreadDefault() *MainContext {
        const cFn = @extern(*const fn () callconv(.c) *MainContext, .{ .name = "g_main_context_ref_thread_default" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_main_context_get_type" });
        return cFn();
    }
};
pub const MainContextFlags = packed struct(u32) {
    ownerless_polling: bool = false,
    _: u31 = 0,
};
pub const MainLoop = opaque {
    pub fn new(arg_context: ?*MainContext, arg_is_running: bool) *MainLoop {
        const cFn = @extern(*const fn (?*MainContext, bool) callconv(.c) *MainLoop, .{ .name = "g_main_loop_new" });
        const ret = cFn(arg_context, arg_is_running);
        return ret;
    }
    pub fn getContext(self: *MainLoop) *MainContext {
        const cFn = @extern(*const fn (*MainLoop) callconv(.c) *MainContext, .{ .name = "g_main_loop_get_context" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isRunning(self: *MainLoop) bool {
        const cFn = @extern(*const fn (*MainLoop) callconv(.c) bool, .{ .name = "g_main_loop_is_running" });
        const ret = cFn(self);
        return ret;
    }
    pub fn quit(self: *MainLoop) void {
        const cFn = @extern(*const fn (*MainLoop) callconv(.c) void, .{ .name = "g_main_loop_quit" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *MainLoop) *MainLoop {
        const cFn = @extern(*const fn (*MainLoop) callconv(.c) *MainLoop, .{ .name = "g_main_loop_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn run(self: *MainLoop) void {
        const cFn = @extern(*const fn (*MainLoop) callconv(.c) void, .{ .name = "g_main_loop_run" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *MainLoop) void {
        const cFn = @extern(*const fn (*MainLoop) callconv(.c) void, .{ .name = "g_main_loop_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_main_loop_get_type" });
        return cFn();
    }
};
pub const MappedFile = opaque {
    pub fn new(arg_filename: [*:0]const u8, arg_writable: bool, arg_error: *?*GLib.Error) error{GError}!*MappedFile {
        const cFn = @extern(*const fn ([*:0]const u8, bool, *?*GLib.Error) callconv(.c) *MappedFile, .{ .name = "g_mapped_file_new" });
        const ret = cFn(arg_filename, arg_writable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn newFromFd(arg_fd: i32, arg_writable: bool, arg_error: *?*GLib.Error) error{GError}!*MappedFile {
        const cFn = @extern(*const fn (i32, bool, *?*GLib.Error) callconv(.c) *MappedFile, .{ .name = "g_mapped_file_new_from_fd" });
        const ret = cFn(arg_fd, arg_writable, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn free(self: *MappedFile) void {
        const cFn = @extern(*const fn (*MappedFile) callconv(.c) void, .{ .name = "g_mapped_file_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBytes(self: *MappedFile) *Bytes {
        const cFn = @extern(*const fn (*MappedFile) callconv(.c) *Bytes, .{ .name = "g_mapped_file_get_bytes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getContents(self: *MappedFile) ?[*:0]u8 {
        const cFn = @extern(*const fn (*MappedFile) callconv(.c) ?[*:0]u8, .{ .name = "g_mapped_file_get_contents" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getLength(self: *MappedFile) u64 {
        const cFn = @extern(*const fn (*MappedFile) callconv(.c) u64, .{ .name = "g_mapped_file_get_length" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *MappedFile) *MappedFile {
        const cFn = @extern(*const fn (*MappedFile) callconv(.c) *MappedFile, .{ .name = "g_mapped_file_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *MappedFile) void {
        const cFn = @extern(*const fn (*MappedFile) callconv(.c) void, .{ .name = "g_mapped_file_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_mapped_file_get_type" });
        return cFn();
    }
};
pub const MarkupCollectType = packed struct(u32) {
    string: bool = false,
    strdup: bool = false,
    tristate: bool = false,
    _3: u13 = 0,
    optional: bool = false,
    _: u15 = 0,
    pub const boolean: @This() = @bitCast(@as(u32, 3));
};
pub const MarkupError = enum(u32) {
    bad_utf8 = 0,
    empty = 1,
    parse = 2,
    unknown_element = 3,
    unknown_attribute = 4,
    invalid_content = 5,
    missing_attribute = 6,
};
pub const MarkupParseContext = opaque {
    pub fn new(arg_parser: *MarkupParser, arg_flags: MarkupParseFlags, arg_user_data: ?*anyopaque, arg_user_data_dnotify: DestroyNotify) *MarkupParseContext {
        const cFn = @extern(*const fn (*MarkupParser, MarkupParseFlags, ?*anyopaque, DestroyNotify) callconv(.c) *MarkupParseContext, .{ .name = "g_markup_parse_context_new" });
        const ret = cFn(arg_parser, arg_flags, @ptrCast(arg_user_data), arg_user_data_dnotify);
        return ret;
    }
    pub fn endParse(self: *MarkupParseContext, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*MarkupParseContext, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_markup_parse_context_end_parse" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn free(self: *MarkupParseContext) void {
        const cFn = @extern(*const fn (*MarkupParseContext) callconv(.c) void, .{ .name = "g_markup_parse_context_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getElement(self: *MarkupParseContext) [*:0]u8 {
        const cFn = @extern(*const fn (*MarkupParseContext) callconv(.c) [*:0]u8, .{ .name = "g_markup_parse_context_get_element" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getElementStack(self: *MarkupParseContext) ?*GLib.SList {
        const cFn = @extern(*const fn (*MarkupParseContext) callconv(.c) ?*GLib.SList, .{ .name = "g_markup_parse_context_get_element_stack" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPosition(self: *MarkupParseContext) struct {
        line_number: i32,
        char_number: i32,
    } {
        var argO_line_number: i32 = undefined;
        const arg_line_number: ?*i32 = &argO_line_number;
        var argO_char_number: i32 = undefined;
        const arg_char_number: ?*i32 = &argO_char_number;
        const cFn = @extern(*const fn (*MarkupParseContext, ?*i32, ?*i32) callconv(.c) void, .{ .name = "g_markup_parse_context_get_position" });
        const ret = cFn(self, arg_line_number, arg_char_number);
        _ = ret;
        return .{ .line_number = argO_line_number, .char_number = argO_char_number };
    }
    pub fn getUserData(self: *MarkupParseContext) ?*anyopaque {
        const cFn = @extern(*const fn (*MarkupParseContext) callconv(.c) ?*anyopaque, .{ .name = "g_markup_parse_context_get_user_data" });
        const ret = cFn(self);
        return ret;
    }
    pub fn parse(self: *MarkupParseContext, arg_text: [*:0]const u8, arg_text_len: i64, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*MarkupParseContext, [*:0]const u8, i64, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_markup_parse_context_parse" });
        const ret = cFn(self, arg_text, arg_text_len, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn pop(self: *MarkupParseContext) ?*anyopaque {
        const cFn = @extern(*const fn (*MarkupParseContext) callconv(.c) ?*anyopaque, .{ .name = "g_markup_parse_context_pop" });
        const ret = cFn(self);
        return ret;
    }
    pub fn push(self: *MarkupParseContext, arg_parser: *MarkupParser, arg_user_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*MarkupParseContext, *MarkupParser, ?*anyopaque) callconv(.c) void, .{ .name = "g_markup_parse_context_push" });
        const ret = cFn(self, arg_parser, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn ref(self: *MarkupParseContext) *MarkupParseContext {
        const cFn = @extern(*const fn (*MarkupParseContext) callconv(.c) *MarkupParseContext, .{ .name = "g_markup_parse_context_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *MarkupParseContext) void {
        const cFn = @extern(*const fn (*MarkupParseContext) callconv(.c) void, .{ .name = "g_markup_parse_context_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_markup_parse_context_get_type" });
        return cFn();
    }
};
pub const MarkupParseFlags = packed struct(u32) {
    do_not_use_this_unsupported_flag: bool = false,
    treat_cdata_as_text: bool = false,
    prefix_error_position: bool = false,
    ignore_qualified: bool = false,
    _: u28 = 0,
};
pub const MarkupParser = extern struct {
    start_element: ?*const fn (arg_context: *MarkupParseContext, arg_element_name: [*:0]const u8, arg_attribute_names: [*:0]const u8, arg_attribute_values: [*:0]const u8, arg_user_data: ?*anyopaque, arg_error: *?*GLib.Error) callconv(.c) void,
    end_element: ?*const fn (arg_context: *MarkupParseContext, arg_element_name: [*:0]const u8, arg_user_data: ?*anyopaque, arg_error: *?*GLib.Error) callconv(.c) void,
    text: ?*const fn (arg_context: *MarkupParseContext, arg_text: [*:0]const u8, arg_text_len: u64, arg_user_data: ?*anyopaque, arg_error: *?*GLib.Error) callconv(.c) void,
    passthrough: ?*const fn (arg_context: *MarkupParseContext, arg_passthrough_text: [*:0]const u8, arg_text_len: u64, arg_user_data: ?*anyopaque, arg_error: *?*GLib.Error) callconv(.c) void,
    @"error": ?*const fn (arg_context: *MarkupParseContext, arg_error: *GLib.Error, arg_user_data: ?*anyopaque) callconv(.c) void,
};
pub const MatchInfo = opaque {
    pub fn expandReferences(self: *MatchInfo, arg_string_to_expand: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!?[*:0]u8 {
        const cFn = @extern(*const fn (*MatchInfo, [*:0]const u8, *?*GLib.Error) callconv(.c) ?[*:0]u8, .{ .name = "g_match_info_expand_references" });
        const ret = cFn(self, arg_string_to_expand, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn fetch(self: *MatchInfo, arg_match_num: i32) ?[*:0]u8 {
        const cFn = @extern(*const fn (*MatchInfo, i32) callconv(.c) ?[*:0]u8, .{ .name = "g_match_info_fetch" });
        const ret = cFn(self, arg_match_num);
        return ret;
    }
    pub fn fetchAll(self: *MatchInfo) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*MatchInfo) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_match_info_fetch_all" });
        const ret = cFn(self);
        return ret;
    }
    pub fn fetchNamed(self: *MatchInfo, arg_name: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (*MatchInfo, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_match_info_fetch_named" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn fetchNamedPos(self: *MatchInfo, arg_name: [*:0]const u8) struct {
        ret: bool,
        start_pos: i32,
        end_pos: i32,
    } {
        var argO_start_pos: i32 = undefined;
        const arg_start_pos: ?*i32 = &argO_start_pos;
        var argO_end_pos: i32 = undefined;
        const arg_end_pos: ?*i32 = &argO_end_pos;
        const cFn = @extern(*const fn (*MatchInfo, [*:0]const u8, ?*i32, ?*i32) callconv(.c) bool, .{ .name = "g_match_info_fetch_named_pos" });
        const ret = cFn(self, arg_name, arg_start_pos, arg_end_pos);
        return .{ .ret = ret, .start_pos = argO_start_pos, .end_pos = argO_end_pos };
    }
    pub fn fetchPos(self: *MatchInfo, arg_match_num: i32) struct {
        ret: bool,
        start_pos: i32,
        end_pos: i32,
    } {
        var argO_start_pos: i32 = undefined;
        const arg_start_pos: ?*i32 = &argO_start_pos;
        var argO_end_pos: i32 = undefined;
        const arg_end_pos: ?*i32 = &argO_end_pos;
        const cFn = @extern(*const fn (*MatchInfo, i32, ?*i32, ?*i32) callconv(.c) bool, .{ .name = "g_match_info_fetch_pos" });
        const ret = cFn(self, arg_match_num, arg_start_pos, arg_end_pos);
        return .{ .ret = ret, .start_pos = argO_start_pos, .end_pos = argO_end_pos };
    }
    pub fn free(self: *MatchInfo) void {
        const cFn = @extern(*const fn (*MatchInfo) callconv(.c) void, .{ .name = "g_match_info_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMatchCount(self: *MatchInfo) i32 {
        const cFn = @extern(*const fn (*MatchInfo) callconv(.c) i32, .{ .name = "g_match_info_get_match_count" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRegex(self: *MatchInfo) *Regex {
        const cFn = @extern(*const fn (*MatchInfo) callconv(.c) *Regex, .{ .name = "g_match_info_get_regex" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getString(self: *MatchInfo) [*:0]u8 {
        const cFn = @extern(*const fn (*MatchInfo) callconv(.c) [*:0]u8, .{ .name = "g_match_info_get_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isPartialMatch(self: *MatchInfo) bool {
        const cFn = @extern(*const fn (*MatchInfo) callconv(.c) bool, .{ .name = "g_match_info_is_partial_match" });
        const ret = cFn(self);
        return ret;
    }
    pub fn matches(self: *MatchInfo) bool {
        const cFn = @extern(*const fn (*MatchInfo) callconv(.c) bool, .{ .name = "g_match_info_matches" });
        const ret = cFn(self);
        return ret;
    }
    pub fn next(self: *MatchInfo, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*MatchInfo, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_match_info_next" });
        const ret = cFn(self, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn ref(self: *MatchInfo) *MatchInfo {
        const cFn = @extern(*const fn (*MatchInfo) callconv(.c) *MatchInfo, .{ .name = "g_match_info_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *MatchInfo) void {
        const cFn = @extern(*const fn (*MatchInfo) callconv(.c) void, .{ .name = "g_match_info_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_match_info_get_type" });
        return cFn();
    }
};
pub const MemChunk = opaque {
    pub fn alloc(self: *MemChunk) ?*anyopaque {
        const cFn = @extern(*const fn (*MemChunk) callconv(.c) ?*anyopaque, .{ .name = "g_mem_chunk_alloc" });
        const ret = cFn(self);
        return ret;
    }
    pub fn alloc0(self: *MemChunk) ?*anyopaque {
        const cFn = @extern(*const fn (*MemChunk) callconv(.c) ?*anyopaque, .{ .name = "g_mem_chunk_alloc0" });
        const ret = cFn(self);
        return ret;
    }
    pub fn clean(self: *MemChunk) void {
        const cFn = @extern(*const fn (*MemChunk) callconv(.c) void, .{ .name = "g_mem_chunk_clean" });
        const ret = cFn(self);
        return ret;
    }
    pub fn destroy(self: *MemChunk) void {
        const cFn = @extern(*const fn (*MemChunk) callconv(.c) void, .{ .name = "g_mem_chunk_destroy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *MemChunk, arg_mem: ?*anyopaque) void {
        const cFn = @extern(*const fn (*MemChunk, ?*anyopaque) callconv(.c) void, .{ .name = "g_mem_chunk_free" });
        const ret = cFn(self, @ptrCast(arg_mem));
        return ret;
    }
    pub fn print(self: *MemChunk) void {
        const cFn = @extern(*const fn (*MemChunk) callconv(.c) void, .{ .name = "g_mem_chunk_print" });
        const ret = cFn(self);
        return ret;
    }
    pub fn reset(self: *MemChunk) void {
        const cFn = @extern(*const fn (*MemChunk) callconv(.c) void, .{ .name = "g_mem_chunk_reset" });
        const ret = cFn(self);
        return ret;
    }
    pub fn info() void {
        const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_mem_chunk_info" });
        const ret = cFn();
        return ret;
    }
};
pub const MemVTable = extern struct {
    malloc: ?*const fn (arg_n_bytes: u64) callconv(.c) *anyopaque,
    realloc: ?*const fn (arg_mem: *anyopaque, arg_n_bytes: u64) callconv(.c) *anyopaque,
    free: ?*const fn (arg_mem: *anyopaque) callconv(.c) void,
    calloc: ?*const fn (arg_n_blocks: u64, arg_n_block_bytes: u64) callconv(.c) *anyopaque,
    try_malloc: ?*const fn (arg_n_bytes: u64) callconv(.c) *anyopaque,
    try_realloc: ?*const fn (arg_mem: *anyopaque, arg_n_bytes: u64) callconv(.c) *anyopaque,
};
pub const Mutex = extern union {
    p: ?*anyopaque,
    i: [2]u32,
    pub fn clear(self: *Mutex) void {
        const cFn = @extern(*const fn (*Mutex) callconv(.c) void, .{ .name = "g_mutex_clear" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *Mutex) void {
        const cFn = @extern(*const fn (*Mutex) callconv(.c) void, .{ .name = "g_mutex_init" });
        const ret = cFn(self);
        return ret;
    }
    pub fn lock(self: *Mutex) void {
        const cFn = @extern(*const fn (*Mutex) callconv(.c) void, .{ .name = "g_mutex_lock" });
        const ret = cFn(self);
        return ret;
    }
    pub fn trylock(self: *Mutex) bool {
        const cFn = @extern(*const fn (*Mutex) callconv(.c) bool, .{ .name = "g_mutex_trylock" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unlock(self: *Mutex) void {
        const cFn = @extern(*const fn (*Mutex) callconv(.c) void, .{ .name = "g_mutex_unlock" });
        const ret = cFn(self);
        return ret;
    }
};
pub const Node = extern struct {
    data: ?*anyopaque,
    next: ?*Node,
    prev: ?*Node,
    parent: ?*Node,
    children: ?*Node,
    pub fn childIndex(self: *Node, arg_data: ?*anyopaque) i32 {
        const cFn = @extern(*const fn (*Node, ?*anyopaque) callconv(.c) i32, .{ .name = "g_node_child_index" });
        const ret = cFn(self, @ptrCast(arg_data));
        return ret;
    }
    pub fn childPosition(self: *Node, arg_child: *Node) i32 {
        const cFn = @extern(*const fn (*Node, *Node) callconv(.c) i32, .{ .name = "g_node_child_position" });
        const ret = cFn(self, arg_child);
        return ret;
    }
    pub fn childrenForeach(self: *Node, arg_flags: TraverseFlags, argC_func: core.Closure(NodeForeachFunc)) void {
        const arg_func: NodeForeachFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*Node, TraverseFlags, NodeForeachFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_node_children_foreach" });
        const ret = cFn(self, arg_flags, arg_func, @ptrCast(arg_data));
        return ret;
    }
    pub fn depth(self: *Node) u32 {
        const cFn = @extern(*const fn (*Node) callconv(.c) u32, .{ .name = "g_node_depth" });
        const ret = cFn(self);
        return ret;
    }
    pub fn destroy(self: *Node) void {
        const cFn = @extern(*const fn (*Node) callconv(.c) void, .{ .name = "g_node_destroy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isAncestor(self: *Node, arg_descendant: *Node) bool {
        const cFn = @extern(*const fn (*Node, *Node) callconv(.c) bool, .{ .name = "g_node_is_ancestor" });
        const ret = cFn(self, arg_descendant);
        return ret;
    }
    pub fn maxHeight(self: *Node) u32 {
        const cFn = @extern(*const fn (*Node) callconv(.c) u32, .{ .name = "g_node_max_height" });
        const ret = cFn(self);
        return ret;
    }
    pub fn nChildren(self: *Node) u32 {
        const cFn = @extern(*const fn (*Node) callconv(.c) u32, .{ .name = "g_node_n_children" });
        const ret = cFn(self);
        return ret;
    }
    pub fn nNodes(self: *Node, arg_flags: TraverseFlags) u32 {
        const cFn = @extern(*const fn (*Node, TraverseFlags) callconv(.c) u32, .{ .name = "g_node_n_nodes" });
        const ret = cFn(self, arg_flags);
        return ret;
    }
    pub fn reverseChildren(self: *Node) void {
        const cFn = @extern(*const fn (*Node) callconv(.c) void, .{ .name = "g_node_reverse_children" });
        const ret = cFn(self);
        return ret;
    }
    pub fn traverse(self: *Node, arg_order: TraverseType, arg_flags: TraverseFlags, arg_max_depth: i32, argC_func: core.Closure(NodeTraverseFunc)) void {
        const arg_func: NodeTraverseFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*Node, TraverseType, TraverseFlags, i32, NodeTraverseFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_node_traverse" });
        const ret = cFn(self, arg_order, arg_flags, arg_max_depth, arg_func, @ptrCast(arg_data));
        return ret;
    }
    pub fn unlink(self: *Node) void {
        const cFn = @extern(*const fn (*Node) callconv(.c) void, .{ .name = "g_node_unlink" });
        const ret = cFn(self);
        return ret;
    }
    pub fn popAllocator() void {
        const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_node_pop_allocator" });
        const ret = cFn();
        return ret;
    }
    pub fn pushAllocator(arg_allocator: *Allocator) void {
        const cFn = @extern(*const fn (*Allocator) callconv(.c) void, .{ .name = "g_node_push_allocator" });
        const ret = cFn(arg_allocator);
        return ret;
    }
};
pub const NodeForeachFunc = *const fn (arg_node: *Node, arg_data: ?*anyopaque) callconv(.c) void;
pub const NodeTraverseFunc = *const fn (arg_node: *Node, arg_data: ?*anyopaque) callconv(.c) bool;
pub const NormalizeMode = enum(u32) {
    default = 0,
    default_compose = 1,
    all = 2,
    all_compose = 3,
    pub const nfd: @This() = @enumFromInt(@as(u32, 0));
    pub const nfc: @This() = @enumFromInt(@as(u32, 1));
    pub const nfkd: @This() = @enumFromInt(@as(u32, 2));
    pub const nfkc: @This() = @enumFromInt(@as(u32, 3));
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_normalize_mode_get_type" });
        return cFn();
    }
};
pub const NumberParserError = enum(u32) {
    invalid = 0,
    out_of_bounds = 1,
};
pub const OPTION_REMAINING = "";
pub const Once = extern struct {
    status: OnceStatus,
    retval: ?*anyopaque,
    pub fn initEnter(arg_location: *anyopaque) bool {
        const cFn = @extern(*const fn (*anyopaque) callconv(.c) bool, .{ .name = "g_once_init_enter" });
        const ret = cFn(@ptrCast(arg_location));
        return ret;
    }
    pub fn initEnterImpl(arg_location: *u64) bool {
        const cFn = @extern(*const fn (*u64) callconv(.c) bool, .{ .name = "g_once_init_enter_impl" });
        const ret = cFn(arg_location);
        return ret;
    }
    pub fn initEnterPointer(arg_location: *anyopaque) bool {
        const cFn = @extern(*const fn (*anyopaque) callconv(.c) bool, .{ .name = "g_once_init_enter_pointer" });
        const ret = cFn(@ptrCast(arg_location));
        return ret;
    }
    pub fn initLeave(arg_location: *anyopaque, arg_result: u64) void {
        const cFn = @extern(*const fn (*anyopaque, u64) callconv(.c) void, .{ .name = "g_once_init_leave" });
        const ret = cFn(@ptrCast(arg_location), arg_result);
        return ret;
    }
    pub fn initLeavePointer(arg_location: *anyopaque, arg_result: ?*anyopaque) void {
        const cFn = @extern(*const fn (*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_once_init_leave_pointer" });
        const ret = cFn(@ptrCast(arg_location), @ptrCast(arg_result));
        return ret;
    }
};
pub const OnceStatus = enum(u32) {
    notcalled = 0,
    progress = 1,
    ready = 2,
};
pub const OptionArg = enum(u32) {
    none = 0,
    string = 1,
    int = 2,
    callback = 3,
    filename = 4,
    string_array = 5,
    filename_array = 6,
    double = 7,
    int64 = 8,
};
pub const OptionArgFunc = *const fn (arg_option_name: [*:0]const u8, arg_value: [*:0]const u8, arg_data: ?*anyopaque, arg_error: *?*GLib.Error) callconv(.c) bool;
pub const OptionContext = opaque {
    pub fn addGroup(self: *OptionContext, arg_group: *OptionGroup) void {
        const cFn = @extern(*const fn (*OptionContext, *OptionGroup) callconv(.c) void, .{ .name = "g_option_context_add_group" });
        const ret = cFn(self, arg_group);
        return ret;
    }
    pub fn addMainEntries(self: *OptionContext, arg_entries: [*]OptionEntry, arg_translation_domain: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*OptionContext, [*]OptionEntry, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_option_context_add_main_entries" });
        const ret = cFn(self, arg_entries, arg_translation_domain);
        return ret;
    }
    pub fn free(self: *OptionContext) void {
        const cFn = @extern(*const fn (*OptionContext) callconv(.c) void, .{ .name = "g_option_context_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDescription(self: *OptionContext) [*:0]u8 {
        const cFn = @extern(*const fn (*OptionContext) callconv(.c) [*:0]u8, .{ .name = "g_option_context_get_description" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHelp(self: *OptionContext, arg_main_help: bool, arg_group: ?*OptionGroup) [*:0]u8 {
        const cFn = @extern(*const fn (*OptionContext, bool, ?*OptionGroup) callconv(.c) [*:0]u8, .{ .name = "g_option_context_get_help" });
        const ret = cFn(self, arg_main_help, arg_group);
        return ret;
    }
    pub fn getHelpEnabled(self: *OptionContext) bool {
        const cFn = @extern(*const fn (*OptionContext) callconv(.c) bool, .{ .name = "g_option_context_get_help_enabled" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIgnoreUnknownOptions(self: *OptionContext) bool {
        const cFn = @extern(*const fn (*OptionContext) callconv(.c) bool, .{ .name = "g_option_context_get_ignore_unknown_options" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMainGroup(self: *OptionContext) *OptionGroup {
        const cFn = @extern(*const fn (*OptionContext) callconv(.c) *OptionGroup, .{ .name = "g_option_context_get_main_group" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStrictPosix(self: *OptionContext) bool {
        const cFn = @extern(*const fn (*OptionContext) callconv(.c) bool, .{ .name = "g_option_context_get_strict_posix" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSummary(self: *OptionContext) [*:0]u8 {
        const cFn = @extern(*const fn (*OptionContext) callconv(.c) [*:0]u8, .{ .name = "g_option_context_get_summary" });
        const ret = cFn(self);
        return ret;
    }
    pub fn parse(self: *OptionContext, argS_argv: ?[][*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        argv: ?[][*:0]const u8,
    } {
        var argO_argc: i32 = @intCast((argS_argv orelse &.{}).len);
        const arg_argc: ?*i32 = &argO_argc;
        const arg_argv: ?*[*][*:0]const u8 = @ptrCast(argS_argv);
        const cFn = @extern(*const fn (*OptionContext, ?*i32, ?*[*][*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_option_context_parse" });
        const ret = cFn(self, arg_argc, arg_argv, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .argv = arg_argv[0..@intCast(arg_argc)] };
    }
    pub fn parseStrv(self: *OptionContext, arg_arguments: ?*[*]?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*OptionContext, ?*[*]?[*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_option_context_parse_strv" });
        const ret = cFn(self, arg_arguments, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setDescription(self: *OptionContext, arg_description: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*OptionContext, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_option_context_set_description" });
        const ret = cFn(self, arg_description);
        return ret;
    }
    pub fn setHelpEnabled(self: *OptionContext, arg_help_enabled: bool) void {
        const cFn = @extern(*const fn (*OptionContext, bool) callconv(.c) void, .{ .name = "g_option_context_set_help_enabled" });
        const ret = cFn(self, arg_help_enabled);
        return ret;
    }
    pub fn setIgnoreUnknownOptions(self: *OptionContext, arg_ignore_unknown: bool) void {
        const cFn = @extern(*const fn (*OptionContext, bool) callconv(.c) void, .{ .name = "g_option_context_set_ignore_unknown_options" });
        const ret = cFn(self, arg_ignore_unknown);
        return ret;
    }
    pub fn setMainGroup(self: *OptionContext, arg_group: *OptionGroup) void {
        const cFn = @extern(*const fn (*OptionContext, *OptionGroup) callconv(.c) void, .{ .name = "g_option_context_set_main_group" });
        const ret = cFn(self, arg_group);
        return ret;
    }
    pub fn setStrictPosix(self: *OptionContext, arg_strict_posix: bool) void {
        const cFn = @extern(*const fn (*OptionContext, bool) callconv(.c) void, .{ .name = "g_option_context_set_strict_posix" });
        const ret = cFn(self, arg_strict_posix);
        return ret;
    }
    pub fn setSummary(self: *OptionContext, arg_summary: ?[*:0]const u8) void {
        const cFn = @extern(*const fn (*OptionContext, ?[*:0]const u8) callconv(.c) void, .{ .name = "g_option_context_set_summary" });
        const ret = cFn(self, arg_summary);
        return ret;
    }
    pub fn setTranslateFunc(self: *OptionContext, argC_func: core.Closure(?TranslateFunc)) void {
        const arg_func: ?TranslateFunc = @ptrCast(argC_func.callback());
        const arg_data: ?*anyopaque = @ptrCast(argC_func.data());
        const arg_destroy_notify: ?DestroyNotify = @ptrCast(argC_func.destroy());
        const cFn = @extern(*const fn (*OptionContext, ?TranslateFunc, ?*anyopaque, ?DestroyNotify) callconv(.c) void, .{ .name = "g_option_context_set_translate_func" });
        const ret = cFn(self, arg_func, @ptrCast(arg_data), arg_destroy_notify);
        return ret;
    }
    pub fn setTranslationDomain(self: *OptionContext, arg_domain: [*:0]const u8) void {
        const cFn = @extern(*const fn (*OptionContext, [*:0]const u8) callconv(.c) void, .{ .name = "g_option_context_set_translation_domain" });
        const ret = cFn(self, arg_domain);
        return ret;
    }
};
pub const OptionEntry = extern struct {
    long_name: ?[*:0]const u8,
    short_name: i8,
    flags: i32,
    arg: OptionArg,
    arg_data: ?*anyopaque,
    description: ?[*:0]const u8,
    arg_description: ?[*:0]const u8,
};
pub const OptionError = enum(u32) {
    unknown_option = 0,
    bad_value = 1,
    failed = 2,
};
pub const OptionErrorFunc = *const fn (arg_context: *OptionContext, arg_group: *OptionGroup, arg_data: ?*anyopaque, arg_error: *?*GLib.Error) callconv(.c) void;
pub const OptionFlags = packed struct(u32) {
    hidden: bool = false,
    in_main: bool = false,
    reverse: bool = false,
    no_arg: bool = false,
    filename: bool = false,
    optional_arg: bool = false,
    @"noalias": bool = false,
    deprecated: bool = false,
    _: u24 = 0,
};
pub const OptionGroup = opaque {
    pub fn new(arg_name: [*:0]const u8, arg_description: [*:0]const u8, arg_help_description: [*:0]const u8, arg_user_data: ?*anyopaque, arg_destroy: ?DestroyNotify) *OptionGroup {
        const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, [*:0]const u8, ?*anyopaque, ?DestroyNotify) callconv(.c) *OptionGroup, .{ .name = "g_option_group_new" });
        const ret = cFn(arg_name, arg_description, arg_help_description, @ptrCast(arg_user_data), arg_destroy);
        return ret;
    }
    pub fn addEntries(self: *OptionGroup, arg_entries: [*]OptionEntry) void {
        const cFn = @extern(*const fn (*OptionGroup, [*]OptionEntry) callconv(.c) void, .{ .name = "g_option_group_add_entries" });
        const ret = cFn(self, arg_entries);
        return ret;
    }
    pub fn free(self: *OptionGroup) void {
        const cFn = @extern(*const fn (*OptionGroup) callconv(.c) void, .{ .name = "g_option_group_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *OptionGroup) *OptionGroup {
        const cFn = @extern(*const fn (*OptionGroup) callconv(.c) *OptionGroup, .{ .name = "g_option_group_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn setTranslateFunc(self: *OptionGroup, argC_func: core.Closure(?TranslateFunc)) void {
        const arg_func: ?TranslateFunc = @ptrCast(argC_func.callback());
        const arg_data: ?*anyopaque = @ptrCast(argC_func.data());
        const arg_destroy_notify: ?DestroyNotify = @ptrCast(argC_func.destroy());
        const cFn = @extern(*const fn (*OptionGroup, ?TranslateFunc, ?*anyopaque, ?DestroyNotify) callconv(.c) void, .{ .name = "g_option_group_set_translate_func" });
        const ret = cFn(self, arg_func, @ptrCast(arg_data), arg_destroy_notify);
        return ret;
    }
    pub fn setTranslationDomain(self: *OptionGroup, arg_domain: [*:0]const u8) void {
        const cFn = @extern(*const fn (*OptionGroup, [*:0]const u8) callconv(.c) void, .{ .name = "g_option_group_set_translation_domain" });
        const ret = cFn(self, arg_domain);
        return ret;
    }
    pub fn unref(self: *OptionGroup) void {
        const cFn = @extern(*const fn (*OptionGroup) callconv(.c) void, .{ .name = "g_option_group_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_option_group_get_type" });
        return cFn();
    }
};
pub const OptionParseFunc = *const fn (arg_context: *OptionContext, arg_group: *OptionGroup, arg_data: ?*anyopaque, arg_error: *?*GLib.Error) callconv(.c) bool;
pub const PDP_ENDIAN = 3412;
pub const PI = 3.141593;
pub const PID_FORMAT = "i";
pub const PI_2 = 1.570796;
pub const PI_4 = 0.785398;
pub const POLLFD_FORMAT = "%d";
pub const PRIORITY_DEFAULT = 0;
pub const PRIORITY_DEFAULT_IDLE = 200;
pub const PRIORITY_HIGH = -100;
pub const PRIORITY_HIGH_IDLE = 100;
pub const PRIORITY_LOW = 300;
pub const PathBuf = extern struct {
    dummy: [8]?*anyopaque,
    pub fn clear(self: *PathBuf) void {
        const cFn = @extern(*const fn (*PathBuf) callconv(.c) void, .{ .name = "g_path_buf_clear" });
        const ret = cFn(self);
        return ret;
    }
    pub fn clearToPath(self: *PathBuf) ?[*:0]u8 {
        const cFn = @extern(*const fn (*PathBuf) callconv(.c) ?[*:0]u8, .{ .name = "g_path_buf_clear_to_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *PathBuf) void {
        const cFn = @extern(*const fn (*PathBuf) callconv(.c) void, .{ .name = "g_path_buf_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn freeToPath(self: *PathBuf) ?[*:0]u8 {
        const cFn = @extern(*const fn (*PathBuf) callconv(.c) ?[*:0]u8, .{ .name = "g_path_buf_free_to_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *PathBuf) *PathBuf {
        const cFn = @extern(*const fn (*PathBuf) callconv(.c) *PathBuf, .{ .name = "g_path_buf_init" });
        const ret = cFn(self);
        return ret;
    }
    pub fn initFromPath(self: *PathBuf, arg_path: ?[*:0]const u8) *PathBuf {
        const cFn = @extern(*const fn (*PathBuf, ?[*:0]const u8) callconv(.c) *PathBuf, .{ .name = "g_path_buf_init_from_path" });
        const ret = cFn(self, arg_path);
        return ret;
    }
    pub fn pop(self: *PathBuf) bool {
        const cFn = @extern(*const fn (*PathBuf) callconv(.c) bool, .{ .name = "g_path_buf_pop" });
        const ret = cFn(self);
        return ret;
    }
    pub fn push(self: *PathBuf, arg_path: [*:0]const u8) *PathBuf {
        const cFn = @extern(*const fn (*PathBuf, [*:0]const u8) callconv(.c) *PathBuf, .{ .name = "g_path_buf_push" });
        const ret = cFn(self, arg_path);
        return ret;
    }
    pub fn setExtension(self: *PathBuf, arg_extension: ?[*:0]const u8) bool {
        const cFn = @extern(*const fn (*PathBuf, ?[*:0]const u8) callconv(.c) bool, .{ .name = "g_path_buf_set_extension" });
        const ret = cFn(self, arg_extension);
        return ret;
    }
    pub fn setFilename(self: *PathBuf, arg_file_name: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*PathBuf, [*:0]const u8) callconv(.c) bool, .{ .name = "g_path_buf_set_filename" });
        const ret = cFn(self, arg_file_name);
        return ret;
    }
    pub fn toPath(self: *PathBuf) ?[*:0]u8 {
        const cFn = @extern(*const fn (*PathBuf) callconv(.c) ?[*:0]u8, .{ .name = "g_path_buf_to_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn equal(arg_v1: *anyopaque, arg_v2: *anyopaque) bool {
        const cFn = @extern(*const fn (*anyopaque, *anyopaque) callconv(.c) bool, .{ .name = "g_path_buf_equal" });
        const ret = cFn(@ptrCast(arg_v1), @ptrCast(arg_v2));
        return ret;
    }
};
pub const PatternSpec = opaque {
    pub fn new(arg_pattern: [*:0]const u8) *PatternSpec {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *PatternSpec, .{ .name = "g_pattern_spec_new" });
        const ret = cFn(arg_pattern);
        return ret;
    }
    pub fn copy(self: *PatternSpec) *PatternSpec {
        const cFn = @extern(*const fn (*PatternSpec) callconv(.c) *PatternSpec, .{ .name = "g_pattern_spec_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn equal(self: *PatternSpec, arg_pspec2: *PatternSpec) bool {
        const cFn = @extern(*const fn (*PatternSpec, *PatternSpec) callconv(.c) bool, .{ .name = "g_pattern_spec_equal" });
        const ret = cFn(self, arg_pspec2);
        return ret;
    }
    pub fn free(self: *PatternSpec) void {
        const cFn = @extern(*const fn (*PatternSpec) callconv(.c) void, .{ .name = "g_pattern_spec_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn match(self: *PatternSpec, arg_string_length: u64, arg_string: [*:0]const u8, arg_string_reversed: ?[*:0]const u8) bool {
        const cFn = @extern(*const fn (*PatternSpec, u64, [*:0]const u8, ?[*:0]const u8) callconv(.c) bool, .{ .name = "g_pattern_spec_match" });
        const ret = cFn(self, arg_string_length, arg_string, arg_string_reversed);
        return ret;
    }
    pub fn matchString(self: *PatternSpec, arg_string: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*PatternSpec, [*:0]const u8) callconv(.c) bool, .{ .name = "g_pattern_spec_match_string" });
        const ret = cFn(self, arg_string);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_pattern_spec_get_type" });
        return cFn();
    }
};
pub const PollFD = extern struct {
    fd: i32,
    events: u16,
    revents: u16,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_pollfd_get_type" });
        return cFn();
    }
};
pub const PollFunc = *const fn (arg_ufds: *PollFD, arg_nfsd: u32, arg_timeout_: i32) callconv(.c) i32;
pub const PrintFunc = *const fn (arg_string: [*:0]const u8) callconv(.c) void;
pub const Private = extern struct {
    p: ?*anyopaque,
    notify: ?DestroyNotify,
    future: [2]?*anyopaque,
    pub fn get(self: *Private) ?*anyopaque {
        const cFn = @extern(*const fn (*Private) callconv(.c) ?*anyopaque, .{ .name = "g_private_get" });
        const ret = cFn(self);
        return ret;
    }
    pub fn replace(self: *Private, arg_value: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Private, ?*anyopaque) callconv(.c) void, .{ .name = "g_private_replace" });
        const ret = cFn(self, @ptrCast(arg_value));
        return ret;
    }
    pub fn set(self: *Private, arg_value: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Private, ?*anyopaque) callconv(.c) void, .{ .name = "g_private_set" });
        const ret = cFn(self, @ptrCast(arg_value));
        return ret;
    }
};
pub const PtrArray = extern struct {
    pdata: ?*anyopaque,
    len: u32,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_ptr_array_get_type" });
        return cFn();
    }
};
pub const Queue = extern struct {
    head: ?*GLib.List,
    tail: ?*GLib.List,
    length: u32,
    pub fn clear(self: *Queue) void {
        const cFn = @extern(*const fn (*Queue) callconv(.c) void, .{ .name = "g_queue_clear" });
        const ret = cFn(self);
        return ret;
    }
    pub fn clearFull(self: *Queue, arg_free_func: ?DestroyNotify) void {
        const cFn = @extern(*const fn (*Queue, ?DestroyNotify) callconv(.c) void, .{ .name = "g_queue_clear_full" });
        const ret = cFn(self, arg_free_func);
        return ret;
    }
    pub fn foreach(self: *Queue, argC_func: core.Closure(Func)) void {
        const arg_func: Func = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*Queue, Func, ?*anyopaque) callconv(.c) void, .{ .name = "g_queue_foreach" });
        const ret = cFn(self, arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn free(self: *Queue) void {
        const cFn = @extern(*const fn (*Queue) callconv(.c) void, .{ .name = "g_queue_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn freeFull(self: *Queue, arg_free_func: DestroyNotify) void {
        const cFn = @extern(*const fn (*Queue, DestroyNotify) callconv(.c) void, .{ .name = "g_queue_free_full" });
        const ret = cFn(self, arg_free_func);
        return ret;
    }
    pub fn getLength(self: *Queue) u32 {
        const cFn = @extern(*const fn (*Queue) callconv(.c) u32, .{ .name = "g_queue_get_length" });
        const ret = cFn(self);
        return ret;
    }
    pub fn index(self: *Queue, arg_data: ?*anyopaque) i32 {
        const cFn = @extern(*const fn (*Queue, ?*anyopaque) callconv(.c) i32, .{ .name = "g_queue_index" });
        const ret = cFn(self, @ptrCast(arg_data));
        return ret;
    }
    pub fn init(self: *Queue) void {
        const cFn = @extern(*const fn (*Queue) callconv(.c) void, .{ .name = "g_queue_init" });
        const ret = cFn(self);
        return ret;
    }
    pub fn insertSorted(self: *Queue, arg_data: ?*anyopaque, argC_func: core.Closure(CompareDataFunc)) void {
        const arg_func: CompareDataFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*Queue, ?*anyopaque, CompareDataFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_queue_insert_sorted" });
        const ret = cFn(self, @ptrCast(arg_data), arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn isEmpty(self: *Queue) bool {
        const cFn = @extern(*const fn (*Queue) callconv(.c) bool, .{ .name = "g_queue_is_empty" });
        const ret = cFn(self);
        return ret;
    }
    pub fn peekHead(self: *Queue) ?*anyopaque {
        const cFn = @extern(*const fn (*Queue) callconv(.c) ?*anyopaque, .{ .name = "g_queue_peek_head" });
        const ret = cFn(self);
        return ret;
    }
    pub fn peekNth(self: *Queue, arg_n: u32) ?*anyopaque {
        const cFn = @extern(*const fn (*Queue, u32) callconv(.c) ?*anyopaque, .{ .name = "g_queue_peek_nth" });
        const ret = cFn(self, arg_n);
        return ret;
    }
    pub fn peekTail(self: *Queue) ?*anyopaque {
        const cFn = @extern(*const fn (*Queue) callconv(.c) ?*anyopaque, .{ .name = "g_queue_peek_tail" });
        const ret = cFn(self);
        return ret;
    }
    pub fn popHead(self: *Queue) ?*anyopaque {
        const cFn = @extern(*const fn (*Queue) callconv(.c) ?*anyopaque, .{ .name = "g_queue_pop_head" });
        const ret = cFn(self);
        return ret;
    }
    pub fn popNth(self: *Queue, arg_n: u32) ?*anyopaque {
        const cFn = @extern(*const fn (*Queue, u32) callconv(.c) ?*anyopaque, .{ .name = "g_queue_pop_nth" });
        const ret = cFn(self, arg_n);
        return ret;
    }
    pub fn popTail(self: *Queue) ?*anyopaque {
        const cFn = @extern(*const fn (*Queue) callconv(.c) ?*anyopaque, .{ .name = "g_queue_pop_tail" });
        const ret = cFn(self);
        return ret;
    }
    pub fn pushHead(self: *Queue, arg_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Queue, ?*anyopaque) callconv(.c) void, .{ .name = "g_queue_push_head" });
        const ret = cFn(self, @ptrCast(arg_data));
        return ret;
    }
    pub fn pushNth(self: *Queue, arg_data: ?*anyopaque, arg_n: i32) void {
        const cFn = @extern(*const fn (*Queue, ?*anyopaque, i32) callconv(.c) void, .{ .name = "g_queue_push_nth" });
        const ret = cFn(self, @ptrCast(arg_data), arg_n);
        return ret;
    }
    pub fn pushTail(self: *Queue, arg_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Queue, ?*anyopaque) callconv(.c) void, .{ .name = "g_queue_push_tail" });
        const ret = cFn(self, @ptrCast(arg_data));
        return ret;
    }
    pub fn remove(self: *Queue, arg_data: ?*anyopaque) bool {
        const cFn = @extern(*const fn (*Queue, ?*anyopaque) callconv(.c) bool, .{ .name = "g_queue_remove" });
        const ret = cFn(self, @ptrCast(arg_data));
        return ret;
    }
    pub fn removeAll(self: *Queue, arg_data: ?*anyopaque) u32 {
        const cFn = @extern(*const fn (*Queue, ?*anyopaque) callconv(.c) u32, .{ .name = "g_queue_remove_all" });
        const ret = cFn(self, @ptrCast(arg_data));
        return ret;
    }
    pub fn reverse(self: *Queue) void {
        const cFn = @extern(*const fn (*Queue) callconv(.c) void, .{ .name = "g_queue_reverse" });
        const ret = cFn(self);
        return ret;
    }
    pub fn sort(self: *Queue, argC_compare_func: core.Closure(CompareDataFunc)) void {
        const arg_compare_func: CompareDataFunc = @ptrCast(argC_compare_func.callback());
        defer argC_compare_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_compare_func.data());
        const cFn = @extern(*const fn (*Queue, CompareDataFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_queue_sort" });
        const ret = cFn(self, arg_compare_func, @ptrCast(arg_user_data));
        return ret;
    }
};
pub const REF_COUNT_INIT = -1;
pub const RWLock = extern struct {
    p: ?*anyopaque,
    i: [2]u32,
    pub fn clear(self: *RWLock) void {
        const cFn = @extern(*const fn (*RWLock) callconv(.c) void, .{ .name = "g_rw_lock_clear" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *RWLock) void {
        const cFn = @extern(*const fn (*RWLock) callconv(.c) void, .{ .name = "g_rw_lock_init" });
        const ret = cFn(self);
        return ret;
    }
    pub fn readerLock(self: *RWLock) void {
        const cFn = @extern(*const fn (*RWLock) callconv(.c) void, .{ .name = "g_rw_lock_reader_lock" });
        const ret = cFn(self);
        return ret;
    }
    pub fn readerTrylock(self: *RWLock) bool {
        const cFn = @extern(*const fn (*RWLock) callconv(.c) bool, .{ .name = "g_rw_lock_reader_trylock" });
        const ret = cFn(self);
        return ret;
    }
    pub fn readerUnlock(self: *RWLock) void {
        const cFn = @extern(*const fn (*RWLock) callconv(.c) void, .{ .name = "g_rw_lock_reader_unlock" });
        const ret = cFn(self);
        return ret;
    }
    pub fn writerLock(self: *RWLock) void {
        const cFn = @extern(*const fn (*RWLock) callconv(.c) void, .{ .name = "g_rw_lock_writer_lock" });
        const ret = cFn(self);
        return ret;
    }
    pub fn writerTrylock(self: *RWLock) bool {
        const cFn = @extern(*const fn (*RWLock) callconv(.c) bool, .{ .name = "g_rw_lock_writer_trylock" });
        const ret = cFn(self);
        return ret;
    }
    pub fn writerUnlock(self: *RWLock) void {
        const cFn = @extern(*const fn (*RWLock) callconv(.c) void, .{ .name = "g_rw_lock_writer_unlock" });
        const ret = cFn(self);
        return ret;
    }
};
pub const Rand = opaque {
    pub fn new() *Rand {
        const cFn = @extern(*const fn () callconv(.c) *Rand, .{ .name = "g_rand_new" });
        const ret = cFn();
        return ret;
    }
    pub fn newWithSeed(arg_seed: u32) *Rand {
        const cFn = @extern(*const fn (u32) callconv(.c) *Rand, .{ .name = "g_rand_new_with_seed" });
        const ret = cFn(arg_seed);
        return ret;
    }
    pub fn newWithSeedArray(arg_seed: *u32, arg_seed_length: u32) *Rand {
        const cFn = @extern(*const fn (*u32, u32) callconv(.c) *Rand, .{ .name = "g_rand_new_with_seed_array" });
        const ret = cFn(arg_seed, arg_seed_length);
        return ret;
    }
    pub fn copy(self: *Rand) *Rand {
        const cFn = @extern(*const fn (*Rand) callconv(.c) *Rand, .{ .name = "g_rand_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn double(self: *Rand) f64 {
        const cFn = @extern(*const fn (*Rand) callconv(.c) f64, .{ .name = "g_rand_double" });
        const ret = cFn(self);
        return ret;
    }
    pub fn doubleRange(self: *Rand, arg_begin: f64, arg_end: f64) f64 {
        const cFn = @extern(*const fn (*Rand, f64, f64) callconv(.c) f64, .{ .name = "g_rand_double_range" });
        const ret = cFn(self, arg_begin, arg_end);
        return ret;
    }
    pub fn free(self: *Rand) void {
        const cFn = @extern(*const fn (*Rand) callconv(.c) void, .{ .name = "g_rand_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn int(self: *Rand) u32 {
        const cFn = @extern(*const fn (*Rand) callconv(.c) u32, .{ .name = "g_rand_int" });
        const ret = cFn(self);
        return ret;
    }
    pub fn intRange(self: *Rand, arg_begin: i32, arg_end: i32) i32 {
        const cFn = @extern(*const fn (*Rand, i32, i32) callconv(.c) i32, .{ .name = "g_rand_int_range" });
        const ret = cFn(self, arg_begin, arg_end);
        return ret;
    }
    pub fn setSeed(self: *Rand, arg_seed: u32) void {
        const cFn = @extern(*const fn (*Rand, u32) callconv(.c) void, .{ .name = "g_rand_set_seed" });
        const ret = cFn(self, arg_seed);
        return ret;
    }
    pub fn setSeedArray(self: *Rand, arg_seed: *u32, arg_seed_length: u32) void {
        const cFn = @extern(*const fn (*Rand, *u32, u32) callconv(.c) void, .{ .name = "g_rand_set_seed_array" });
        const ret = cFn(self, arg_seed, arg_seed_length);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_rand_get_type" });
        return cFn();
    }
};
pub const RecMutex = extern struct {
    p: ?*anyopaque,
    i: [2]u32,
    pub fn clear(self: *RecMutex) void {
        const cFn = @extern(*const fn (*RecMutex) callconv(.c) void, .{ .name = "g_rec_mutex_clear" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *RecMutex) void {
        const cFn = @extern(*const fn (*RecMutex) callconv(.c) void, .{ .name = "g_rec_mutex_init" });
        const ret = cFn(self);
        return ret;
    }
    pub fn lock(self: *RecMutex) void {
        const cFn = @extern(*const fn (*RecMutex) callconv(.c) void, .{ .name = "g_rec_mutex_lock" });
        const ret = cFn(self);
        return ret;
    }
    pub fn trylock(self: *RecMutex) bool {
        const cFn = @extern(*const fn (*RecMutex) callconv(.c) bool, .{ .name = "g_rec_mutex_trylock" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unlock(self: *RecMutex) void {
        const cFn = @extern(*const fn (*RecMutex) callconv(.c) void, .{ .name = "g_rec_mutex_unlock" });
        const ret = cFn(self);
        return ret;
    }
};
pub const Regex = opaque {
    pub fn new(arg_pattern: [*:0]const u8, arg_compile_options: RegexCompileFlags, arg_match_options: RegexMatchFlags, arg_error: *?*GLib.Error) error{GError}!?*Regex {
        const cFn = @extern(*const fn ([*:0]const u8, RegexCompileFlags, RegexMatchFlags, *?*GLib.Error) callconv(.c) ?*Regex, .{ .name = "g_regex_new" });
        const ret = cFn(arg_pattern, arg_compile_options, arg_match_options, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getCaptureCount(self: *Regex) i32 {
        const cFn = @extern(*const fn (*Regex) callconv(.c) i32, .{ .name = "g_regex_get_capture_count" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCompileFlags(self: *Regex) RegexCompileFlags {
        const cFn = @extern(*const fn (*Regex) callconv(.c) RegexCompileFlags, .{ .name = "g_regex_get_compile_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHasCrOrLf(self: *Regex) bool {
        const cFn = @extern(*const fn (*Regex) callconv(.c) bool, .{ .name = "g_regex_get_has_cr_or_lf" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMatchFlags(self: *Regex) RegexMatchFlags {
        const cFn = @extern(*const fn (*Regex) callconv(.c) RegexMatchFlags, .{ .name = "g_regex_get_match_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMaxBackref(self: *Regex) i32 {
        const cFn = @extern(*const fn (*Regex) callconv(.c) i32, .{ .name = "g_regex_get_max_backref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMaxLookbehind(self: *Regex) i32 {
        const cFn = @extern(*const fn (*Regex) callconv(.c) i32, .{ .name = "g_regex_get_max_lookbehind" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPattern(self: *Regex) [*:0]u8 {
        const cFn = @extern(*const fn (*Regex) callconv(.c) [*:0]u8, .{ .name = "g_regex_get_pattern" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStringNumber(self: *Regex, arg_name: [*:0]const u8) i32 {
        const cFn = @extern(*const fn (*Regex, [*:0]const u8) callconv(.c) i32, .{ .name = "g_regex_get_string_number" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn match(self: *Regex, arg_string: [*:0]const u8, arg_match_options: RegexMatchFlags) struct {
        ret: bool,
        match_info: *MatchInfo,
    } {
        var argO_match_info: ?*MatchInfo = undefined;
        const arg_match_info: ?**MatchInfo = &argO_match_info;
        const cFn = @extern(*const fn (*Regex, [*:0]const u8, RegexMatchFlags, ?**MatchInfo) callconv(.c) bool, .{ .name = "g_regex_match" });
        const ret = cFn(self, arg_string, arg_match_options, arg_match_info);
        return .{ .ret = ret, .match_info = argO_match_info };
    }
    pub fn matchAll(self: *Regex, arg_string: [*:0]const u8, arg_match_options: RegexMatchFlags) struct {
        ret: bool,
        match_info: *MatchInfo,
    } {
        var argO_match_info: ?*MatchInfo = undefined;
        const arg_match_info: ?**MatchInfo = &argO_match_info;
        const cFn = @extern(*const fn (*Regex, [*:0]const u8, RegexMatchFlags, ?**MatchInfo) callconv(.c) bool, .{ .name = "g_regex_match_all" });
        const ret = cFn(self, arg_string, arg_match_options, arg_match_info);
        return .{ .ret = ret, .match_info = argO_match_info };
    }
    pub fn matchAllFull(self: *Regex, argS_string: []i8, arg_start_position: i32, arg_match_options: RegexMatchFlags, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        match_info: *MatchInfo,
    } {
        const arg_string: [*]i8 = @ptrCast(argS_string);
        const arg_string_len: i64 = @intCast((argS_string).len);
        var argO_match_info: ?*MatchInfo = undefined;
        const arg_match_info: ?**MatchInfo = &argO_match_info;
        const cFn = @extern(*const fn (*Regex, [*]i8, i64, i32, RegexMatchFlags, ?**MatchInfo, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_regex_match_all_full" });
        const ret = cFn(self, arg_string, arg_string_len, arg_start_position, arg_match_options, arg_match_info, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .match_info = argO_match_info };
    }
    pub fn matchFull(self: *Regex, argS_string: []i8, arg_start_position: i32, arg_match_options: RegexMatchFlags, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        match_info: *MatchInfo,
    } {
        const arg_string: [*]i8 = @ptrCast(argS_string);
        const arg_string_len: i64 = @intCast((argS_string).len);
        var argO_match_info: ?*MatchInfo = undefined;
        const arg_match_info: ?**MatchInfo = &argO_match_info;
        const cFn = @extern(*const fn (*Regex, [*]i8, i64, i32, RegexMatchFlags, ?**MatchInfo, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_regex_match_full" });
        const ret = cFn(self, arg_string, arg_string_len, arg_start_position, arg_match_options, arg_match_info, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .match_info = argO_match_info };
    }
    pub fn ref(self: *Regex) *Regex {
        const cFn = @extern(*const fn (*Regex) callconv(.c) *Regex, .{ .name = "g_regex_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn replace(self: *Regex, argS_string: []i8, arg_start_position: i32, arg_replacement: [*:0]const u8, arg_match_options: RegexMatchFlags, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
        const arg_string: [*]i8 = @ptrCast(argS_string);
        const arg_string_len: i64 = @intCast((argS_string).len);
        const cFn = @extern(*const fn (*Regex, [*]i8, i64, i32, [*:0]const u8, RegexMatchFlags, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_regex_replace" });
        const ret = cFn(self, arg_string, arg_string_len, arg_start_position, arg_replacement, arg_match_options, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn replaceEval(self: *Regex, argS_string: []i8, arg_start_position: i32, arg_match_options: RegexMatchFlags, argC_eval: core.Closure(RegexEvalCallback), arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
        const arg_string: [*]i8 = @ptrCast(argS_string);
        const arg_string_len: i64 = @intCast((argS_string).len);
        const arg_eval: RegexEvalCallback = @ptrCast(argC_eval.callback());
        defer argC_eval.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_eval.data());
        const cFn = @extern(*const fn (*Regex, [*]i8, i64, i32, RegexMatchFlags, RegexEvalCallback, ?*anyopaque, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_regex_replace_eval" });
        const ret = cFn(self, arg_string, arg_string_len, arg_start_position, arg_match_options, arg_eval, @ptrCast(arg_user_data), arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn replaceLiteral(self: *Regex, argS_string: []i8, arg_start_position: i32, arg_replacement: [*:0]const u8, arg_match_options: RegexMatchFlags, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
        const arg_string: [*]i8 = @ptrCast(argS_string);
        const arg_string_len: i64 = @intCast((argS_string).len);
        const cFn = @extern(*const fn (*Regex, [*]i8, i64, i32, [*:0]const u8, RegexMatchFlags, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_regex_replace_literal" });
        const ret = cFn(self, arg_string, arg_string_len, arg_start_position, arg_replacement, arg_match_options, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn split(self: *Regex, arg_string: [*:0]const u8, arg_match_options: RegexMatchFlags) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*Regex, [*:0]const u8, RegexMatchFlags) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_regex_split" });
        const ret = cFn(self, arg_string, arg_match_options);
        return ret;
    }
    pub fn splitFull(self: *Regex, argS_string: []i8, arg_start_position: i32, arg_match_options: RegexMatchFlags, arg_max_tokens: i32, arg_error: *?*GLib.Error) error{GError}![*]?[*:0]const u8 {
        const arg_string: [*]i8 = @ptrCast(argS_string);
        const arg_string_len: i64 = @intCast((argS_string).len);
        const cFn = @extern(*const fn (*Regex, [*]i8, i64, i32, RegexMatchFlags, i32, *?*GLib.Error) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_regex_split_full" });
        const ret = cFn(self, arg_string, arg_string_len, arg_start_position, arg_match_options, arg_max_tokens, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn unref(self: *Regex) void {
        const cFn = @extern(*const fn (*Regex) callconv(.c) void, .{ .name = "g_regex_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn checkReplacement(arg_replacement: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        has_references: bool,
    } {
        var argO_has_references: bool = undefined;
        const arg_has_references: ?*bool = &argO_has_references;
        const cFn = @extern(*const fn ([*:0]const u8, ?*bool, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_regex_check_replacement" });
        const ret = cFn(arg_replacement, arg_has_references, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .has_references = argO_has_references };
    }
    pub fn errorQuark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_regex_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn escapeNul(arg_string: [*:0]const u8, arg_length: i32) [*:0]u8 {
        const cFn = @extern(*const fn ([*:0]const u8, i32) callconv(.c) [*:0]u8, .{ .name = "g_regex_escape_nul" });
        const ret = cFn(arg_string, arg_length);
        return ret;
    }
    pub fn escapeString(arg_string: [*:0]const u8, arg_length: i32) [*:0]u8 {
        const cFn = @extern(*const fn ([*:0]const u8, i32) callconv(.c) [*:0]u8, .{ .name = "g_regex_escape_string" });
        const ret = cFn(arg_string, arg_length);
        return ret;
    }
    pub fn matchSimple(arg_pattern: [*:0]const u8, arg_string: [*:0]const u8, arg_compile_options: RegexCompileFlags, arg_match_options: RegexMatchFlags) bool {
        const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, RegexCompileFlags, RegexMatchFlags) callconv(.c) bool, .{ .name = "g_regex_match_simple" });
        const ret = cFn(arg_pattern, arg_string, arg_compile_options, arg_match_options);
        return ret;
    }
    pub fn splitSimple(arg_pattern: [*:0]const u8, arg_string: [*:0]const u8, arg_compile_options: RegexCompileFlags, arg_match_options: RegexMatchFlags) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, RegexCompileFlags, RegexMatchFlags) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_regex_split_simple" });
        const ret = cFn(arg_pattern, arg_string, arg_compile_options, arg_match_options);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_regex_get_type" });
        return cFn();
    }
};
pub const RegexCompileFlags = packed struct(u32) {
    caseless: bool = false,
    multiline: bool = false,
    dotall: bool = false,
    extended: bool = false,
    anchored: bool = false,
    dollar_endonly: bool = false,
    _6: u3 = 0,
    ungreedy: bool = false,
    _10: u1 = 0,
    raw: bool = false,
    no_auto_capture: bool = false,
    optimize: bool = false,
    _14: u4 = 0,
    firstline: bool = false,
    dupnames: bool = false,
    newline_cr: bool = false,
    newline_lf: bool = false,
    _22: u1 = 0,
    bsr_anycrlf: bool = false,
    _24: u1 = 0,
    javascript_compat: bool = false,
    _: u6 = 0,
    pub const newline_crlf: @This() = @bitCast(@as(u32, 3145728));
    pub const newline_anycrlf: @This() = @bitCast(@as(u32, 5242880));
};
pub const RegexError = enum(u32) {
    compile = 0,
    optimize = 1,
    replace = 2,
    match = 3,
    internal = 4,
    stray_backslash = 101,
    missing_control_char = 102,
    unrecognized_escape = 103,
    quantifiers_out_of_order = 104,
    quantifier_too_big = 105,
    unterminated_character_class = 106,
    invalid_escape_in_character_class = 107,
    range_out_of_order = 108,
    nothing_to_repeat = 109,
    unrecognized_character = 112,
    posix_named_class_outside_class = 113,
    unmatched_parenthesis = 114,
    inexistent_subpattern_reference = 115,
    unterminated_comment = 118,
    expression_too_large = 120,
    memory_error = 121,
    variable_length_lookbehind = 125,
    malformed_condition = 126,
    too_many_conditional_branches = 127,
    assertion_expected = 128,
    unknown_posix_class_name = 130,
    posix_collating_elements_not_supported = 131,
    hex_code_too_large = 134,
    invalid_condition = 135,
    single_byte_match_in_lookbehind = 136,
    infinite_loop = 140,
    missing_subpattern_name_terminator = 142,
    duplicate_subpattern_name = 143,
    malformed_property = 146,
    unknown_property = 147,
    subpattern_name_too_long = 148,
    too_many_subpatterns = 149,
    invalid_octal_value = 151,
    too_many_branches_in_define = 154,
    define_repetion = 155,
    inconsistent_newline_options = 156,
    missing_back_reference = 157,
    invalid_relative_reference = 158,
    backtracking_control_verb_argument_forbidden = 159,
    unknown_backtracking_control_verb = 160,
    number_too_big = 161,
    missing_subpattern_name = 162,
    missing_digit = 163,
    invalid_data_character = 164,
    extra_subpattern_name = 165,
    backtracking_control_verb_argument_required = 166,
    invalid_control_char = 168,
    missing_name = 169,
    not_supported_in_class = 171,
    too_many_forward_references = 172,
    name_too_long = 175,
    character_value_too_large = 176,
};
pub const RegexEvalCallback = *const fn (arg_match_info: *MatchInfo, arg_result: *String, arg_user_data: ?*anyopaque) callconv(.c) bool;
pub const RegexMatchFlags = packed struct(u32) {
    _0: u4 = 0,
    anchored: bool = false,
    _5: u2 = 0,
    notbol: bool = false,
    noteol: bool = false,
    _9: u1 = 0,
    notempty: bool = false,
    _11: u4 = 0,
    partial: bool = false,
    _16: u4 = 0,
    newline_cr: bool = false,
    newline_lf: bool = false,
    newline_any: bool = false,
    bsr_anycrlf: bool = false,
    bsr_any: bool = false,
    _25: u2 = 0,
    partial_hard: bool = false,
    notempty_atstart: bool = false,
    _: u3 = 0,
    pub const newline_crlf: @This() = @bitCast(@as(u32, 3145728));
    pub const newline_anycrlf: @This() = @bitCast(@as(u32, 5242880));
};
pub const Relation = opaque {
    pub fn count(self: *Relation, arg_key: ?*anyopaque, arg_field: i32) i32 {
        const cFn = @extern(*const fn (*Relation, ?*anyopaque, i32) callconv(.c) i32, .{ .name = "g_relation_count" });
        const ret = cFn(self, @ptrCast(arg_key), arg_field);
        return ret;
    }
    pub fn delete(self: *Relation, arg_key: ?*anyopaque, arg_field: i32) i32 {
        const cFn = @extern(*const fn (*Relation, ?*anyopaque, i32) callconv(.c) i32, .{ .name = "g_relation_delete" });
        const ret = cFn(self, @ptrCast(arg_key), arg_field);
        return ret;
    }
    pub fn destroy(self: *Relation) void {
        const cFn = @extern(*const fn (*Relation) callconv(.c) void, .{ .name = "g_relation_destroy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn print(self: *Relation) void {
        const cFn = @extern(*const fn (*Relation) callconv(.c) void, .{ .name = "g_relation_print" });
        const ret = cFn(self);
        return ret;
    }
};
pub const SEARCHPATH_SEPARATOR = 58;
pub const SEARCHPATH_SEPARATOR_S = ":";
pub const SIZEOF_LONG = 8;
pub const SIZEOF_SIZE_T = 8;
pub const SIZEOF_SSIZE_T = 8;
pub const SIZEOF_VOID_P = 8;
pub const SList = extern struct {
    data: ?*anyopaque,
    next: ?*GLib.SList,
    pub fn popAllocator() void {
        const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_slist_pop_allocator" });
        const ret = cFn();
        return ret;
    }
    pub fn pushAllocator(arg_allocator: *Allocator) void {
        const cFn = @extern(*const fn (*Allocator) callconv(.c) void, .{ .name = "g_slist_push_allocator" });
        const ret = cFn(arg_allocator);
        return ret;
    }
};
pub const SOURCE_CONTINUE = true;
pub const SOURCE_REMOVE = false;
pub const SQRT2 = 1.414214;
pub const STR_DELIMITERS = "_-|> <.";
pub const SYSDEF_AF_INET = 2;
pub const SYSDEF_AF_INET6 = 10;
pub const SYSDEF_AF_UNIX = 1;
pub const SYSDEF_MSG_DONTROUTE = 4;
pub const SYSDEF_MSG_OOB = 1;
pub const SYSDEF_MSG_PEEK = 2;
pub const Scanner = extern struct {
    user_data: ?*anyopaque,
    max_parse_errors: u32,
    parse_errors: u32,
    input_name: ?[*:0]const u8,
    qdata: ?*Data,
    config: ?*ScannerConfig,
    token: TokenType,
    value: TokenValue,
    line: u32,
    position: u32,
    next_token: TokenType,
    next_value: TokenValue,
    next_line: u32,
    next_position: u32,
    symbol_table: ?*GLib.HashTable,
    input_fd: i32,
    text: ?[*:0]const u8,
    text_end: ?[*:0]const u8,
    buffer: ?[*:0]const u8,
    scope_id: u32,
    msg_handler: ?ScannerMsgFunc,
    pub fn curLine(self: *Scanner) u32 {
        const cFn = @extern(*const fn (*Scanner) callconv(.c) u32, .{ .name = "g_scanner_cur_line" });
        const ret = cFn(self);
        return ret;
    }
    pub fn curPosition(self: *Scanner) u32 {
        const cFn = @extern(*const fn (*Scanner) callconv(.c) u32, .{ .name = "g_scanner_cur_position" });
        const ret = cFn(self);
        return ret;
    }
    pub fn curToken(self: *Scanner) TokenType {
        const cFn = @extern(*const fn (*Scanner) callconv(.c) TokenType, .{ .name = "g_scanner_cur_token" });
        const ret = cFn(self);
        return ret;
    }
    pub fn destroy(self: *Scanner) void {
        const cFn = @extern(*const fn (*Scanner) callconv(.c) void, .{ .name = "g_scanner_destroy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn eof(self: *Scanner) bool {
        const cFn = @extern(*const fn (*Scanner) callconv(.c) bool, .{ .name = "g_scanner_eof" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNextToken(self: *Scanner) TokenType {
        const cFn = @extern(*const fn (*Scanner) callconv(.c) TokenType, .{ .name = "g_scanner_get_next_token" });
        const ret = cFn(self);
        return ret;
    }
    pub fn inputFile(self: *Scanner, arg_input_fd: i32) void {
        const cFn = @extern(*const fn (*Scanner, i32) callconv(.c) void, .{ .name = "g_scanner_input_file" });
        const ret = cFn(self, arg_input_fd);
        return ret;
    }
    pub fn inputText(self: *Scanner, arg_text: [*:0]const u8, arg_text_len: u32) void {
        const cFn = @extern(*const fn (*Scanner, [*:0]const u8, u32) callconv(.c) void, .{ .name = "g_scanner_input_text" });
        const ret = cFn(self, arg_text, arg_text_len);
        return ret;
    }
    pub fn lookupSymbol(self: *Scanner, arg_symbol: [*:0]const u8) ?*anyopaque {
        const cFn = @extern(*const fn (*Scanner, [*:0]const u8) callconv(.c) ?*anyopaque, .{ .name = "g_scanner_lookup_symbol" });
        const ret = cFn(self, arg_symbol);
        return ret;
    }
    pub fn peekNextToken(self: *Scanner) TokenType {
        const cFn = @extern(*const fn (*Scanner) callconv(.c) TokenType, .{ .name = "g_scanner_peek_next_token" });
        const ret = cFn(self);
        return ret;
    }
    pub fn scopeAddSymbol(self: *Scanner, arg_scope_id: u32, arg_symbol: [*:0]const u8, arg_value: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Scanner, u32, [*:0]const u8, ?*anyopaque) callconv(.c) void, .{ .name = "g_scanner_scope_add_symbol" });
        const ret = cFn(self, arg_scope_id, arg_symbol, @ptrCast(arg_value));
        return ret;
    }
    pub fn scopeForeachSymbol(self: *Scanner, arg_scope_id: u32, argC_func: core.Closure(HFunc)) void {
        const arg_func: HFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*Scanner, u32, HFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_scanner_scope_foreach_symbol" });
        const ret = cFn(self, arg_scope_id, arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn scopeLookupSymbol(self: *Scanner, arg_scope_id: u32, arg_symbol: [*:0]const u8) ?*anyopaque {
        const cFn = @extern(*const fn (*Scanner, u32, [*:0]const u8) callconv(.c) ?*anyopaque, .{ .name = "g_scanner_scope_lookup_symbol" });
        const ret = cFn(self, arg_scope_id, arg_symbol);
        return ret;
    }
    pub fn scopeRemoveSymbol(self: *Scanner, arg_scope_id: u32, arg_symbol: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Scanner, u32, [*:0]const u8) callconv(.c) void, .{ .name = "g_scanner_scope_remove_symbol" });
        const ret = cFn(self, arg_scope_id, arg_symbol);
        return ret;
    }
    pub fn setScope(self: *Scanner, arg_scope_id: u32) u32 {
        const cFn = @extern(*const fn (*Scanner, u32) callconv(.c) u32, .{ .name = "g_scanner_set_scope" });
        const ret = cFn(self, arg_scope_id);
        return ret;
    }
    pub fn syncFileOffset(self: *Scanner) void {
        const cFn = @extern(*const fn (*Scanner) callconv(.c) void, .{ .name = "g_scanner_sync_file_offset" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unexpToken(self: *Scanner, arg_expected_token: TokenType, arg_identifier_spec: [*:0]const u8, arg_symbol_spec: [*:0]const u8, arg_symbol_name: [*:0]const u8, arg_message: [*:0]const u8, arg_is_error: i32) void {
        const cFn = @extern(*const fn (*Scanner, TokenType, [*:0]const u8, [*:0]const u8, [*:0]const u8, [*:0]const u8, i32) callconv(.c) void, .{ .name = "g_scanner_unexp_token" });
        const ret = cFn(self, arg_expected_token, arg_identifier_spec, arg_symbol_spec, arg_symbol_name, arg_message, arg_is_error);
        return ret;
    }
};
pub const ScannerConfig = extern struct {
    cset_skip_characters: ?[*:0]const u8,
    cset_identifier_first: ?[*:0]const u8,
    cset_identifier_nth: ?[*:0]const u8,
    cpair_comment_single: ?[*:0]const u8,
    _32: packed struct(u32) {
        case_sensitive: bool,
        skip_comment_multi: bool,
        skip_comment_single: bool,
        scan_comment_multi: bool,
        scan_identifier: bool,
        scan_identifier_1char: bool,
        scan_identifier_NULL: bool,
        scan_symbols: bool,
        scan_binary: bool,
        scan_octal: bool,
        scan_float: bool,
        scan_hex: bool,
        scan_hex_dollar: bool,
        scan_string_sq: bool,
        scan_string_dq: bool,
        numbers_2_int: bool,
        int_2_float: bool,
        identifier_2_string: bool,
        char_2_token: bool,
        symbol_2_token: bool,
        scope_0_fallback: bool,
        store_int64: bool,
        _: u10,
    },
    padding_dummy: u32,
};
pub const ScannerMsgFunc = *const fn (arg_scanner: *Scanner, arg_message: [*:0]const u8, arg_error: bool) callconv(.c) void;
pub const SeekType = enum(u32) {
    cur = 0,
    set = 1,
    end = 2,
};
pub const Sequence = opaque {
    pub fn append(self: *Sequence, arg_data: ?*anyopaque) *SequenceIter {
        const cFn = @extern(*const fn (*Sequence, ?*anyopaque) callconv(.c) *SequenceIter, .{ .name = "g_sequence_append" });
        const ret = cFn(self, @ptrCast(arg_data));
        return ret;
    }
    pub fn foreach(self: *Sequence, argC_func: core.Closure(Func)) void {
        const arg_func: Func = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*Sequence, Func, ?*anyopaque) callconv(.c) void, .{ .name = "g_sequence_foreach" });
        const ret = cFn(self, arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn free(self: *Sequence) void {
        const cFn = @extern(*const fn (*Sequence) callconv(.c) void, .{ .name = "g_sequence_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBeginIter(self: *Sequence) *SequenceIter {
        const cFn = @extern(*const fn (*Sequence) callconv(.c) *SequenceIter, .{ .name = "g_sequence_get_begin_iter" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getEndIter(self: *Sequence) *SequenceIter {
        const cFn = @extern(*const fn (*Sequence) callconv(.c) *SequenceIter, .{ .name = "g_sequence_get_end_iter" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getIterAtPos(self: *Sequence, arg_pos: i32) *SequenceIter {
        const cFn = @extern(*const fn (*Sequence, i32) callconv(.c) *SequenceIter, .{ .name = "g_sequence_get_iter_at_pos" });
        const ret = cFn(self, arg_pos);
        return ret;
    }
    pub fn getLength(self: *Sequence) i32 {
        const cFn = @extern(*const fn (*Sequence) callconv(.c) i32, .{ .name = "g_sequence_get_length" });
        const ret = cFn(self);
        return ret;
    }
    pub fn insertSorted(self: *Sequence, arg_data: ?*anyopaque, argC_cmp_func: core.Closure(CompareDataFunc)) *SequenceIter {
        const arg_cmp_func: CompareDataFunc = @ptrCast(argC_cmp_func.callback());
        defer argC_cmp_func.deinit();
        const arg_cmp_data: ?*anyopaque = @ptrCast(argC_cmp_func.data());
        const cFn = @extern(*const fn (*Sequence, ?*anyopaque, CompareDataFunc, ?*anyopaque) callconv(.c) *SequenceIter, .{ .name = "g_sequence_insert_sorted" });
        const ret = cFn(self, @ptrCast(arg_data), arg_cmp_func, @ptrCast(arg_cmp_data));
        return ret;
    }
    pub fn insertSortedIter(self: *Sequence, arg_data: ?*anyopaque, argC_iter_cmp: core.Closure(SequenceIterCompareFunc)) *SequenceIter {
        const arg_iter_cmp: SequenceIterCompareFunc = @ptrCast(argC_iter_cmp.callback());
        defer argC_iter_cmp.deinit();
        const arg_cmp_data: ?*anyopaque = @ptrCast(argC_iter_cmp.data());
        const cFn = @extern(*const fn (*Sequence, ?*anyopaque, SequenceIterCompareFunc, ?*anyopaque) callconv(.c) *SequenceIter, .{ .name = "g_sequence_insert_sorted_iter" });
        const ret = cFn(self, @ptrCast(arg_data), arg_iter_cmp, @ptrCast(arg_cmp_data));
        return ret;
    }
    pub fn isEmpty(self: *Sequence) bool {
        const cFn = @extern(*const fn (*Sequence) callconv(.c) bool, .{ .name = "g_sequence_is_empty" });
        const ret = cFn(self);
        return ret;
    }
    pub fn lookup(self: *Sequence, arg_data: ?*anyopaque, argC_cmp_func: core.Closure(CompareDataFunc)) ?*SequenceIter {
        const arg_cmp_func: CompareDataFunc = @ptrCast(argC_cmp_func.callback());
        defer argC_cmp_func.deinit();
        const arg_cmp_data: ?*anyopaque = @ptrCast(argC_cmp_func.data());
        const cFn = @extern(*const fn (*Sequence, ?*anyopaque, CompareDataFunc, ?*anyopaque) callconv(.c) ?*SequenceIter, .{ .name = "g_sequence_lookup" });
        const ret = cFn(self, @ptrCast(arg_data), arg_cmp_func, @ptrCast(arg_cmp_data));
        return ret;
    }
    pub fn lookupIter(self: *Sequence, arg_data: ?*anyopaque, argC_iter_cmp: core.Closure(SequenceIterCompareFunc)) ?*SequenceIter {
        const arg_iter_cmp: SequenceIterCompareFunc = @ptrCast(argC_iter_cmp.callback());
        defer argC_iter_cmp.deinit();
        const arg_cmp_data: ?*anyopaque = @ptrCast(argC_iter_cmp.data());
        const cFn = @extern(*const fn (*Sequence, ?*anyopaque, SequenceIterCompareFunc, ?*anyopaque) callconv(.c) ?*SequenceIter, .{ .name = "g_sequence_lookup_iter" });
        const ret = cFn(self, @ptrCast(arg_data), arg_iter_cmp, @ptrCast(arg_cmp_data));
        return ret;
    }
    pub fn prepend(self: *Sequence, arg_data: ?*anyopaque) *SequenceIter {
        const cFn = @extern(*const fn (*Sequence, ?*anyopaque) callconv(.c) *SequenceIter, .{ .name = "g_sequence_prepend" });
        const ret = cFn(self, @ptrCast(arg_data));
        return ret;
    }
    pub fn search(self: *Sequence, arg_data: ?*anyopaque, argC_cmp_func: core.Closure(CompareDataFunc)) *SequenceIter {
        const arg_cmp_func: CompareDataFunc = @ptrCast(argC_cmp_func.callback());
        defer argC_cmp_func.deinit();
        const arg_cmp_data: ?*anyopaque = @ptrCast(argC_cmp_func.data());
        const cFn = @extern(*const fn (*Sequence, ?*anyopaque, CompareDataFunc, ?*anyopaque) callconv(.c) *SequenceIter, .{ .name = "g_sequence_search" });
        const ret = cFn(self, @ptrCast(arg_data), arg_cmp_func, @ptrCast(arg_cmp_data));
        return ret;
    }
    pub fn searchIter(self: *Sequence, arg_data: ?*anyopaque, argC_iter_cmp: core.Closure(SequenceIterCompareFunc)) *SequenceIter {
        const arg_iter_cmp: SequenceIterCompareFunc = @ptrCast(argC_iter_cmp.callback());
        defer argC_iter_cmp.deinit();
        const arg_cmp_data: ?*anyopaque = @ptrCast(argC_iter_cmp.data());
        const cFn = @extern(*const fn (*Sequence, ?*anyopaque, SequenceIterCompareFunc, ?*anyopaque) callconv(.c) *SequenceIter, .{ .name = "g_sequence_search_iter" });
        const ret = cFn(self, @ptrCast(arg_data), arg_iter_cmp, @ptrCast(arg_cmp_data));
        return ret;
    }
    pub fn sort(self: *Sequence, argC_cmp_func: core.Closure(CompareDataFunc)) void {
        const arg_cmp_func: CompareDataFunc = @ptrCast(argC_cmp_func.callback());
        defer argC_cmp_func.deinit();
        const arg_cmp_data: ?*anyopaque = @ptrCast(argC_cmp_func.data());
        const cFn = @extern(*const fn (*Sequence, CompareDataFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_sequence_sort" });
        const ret = cFn(self, arg_cmp_func, @ptrCast(arg_cmp_data));
        return ret;
    }
    pub fn sortIter(self: *Sequence, argC_cmp_func: core.Closure(SequenceIterCompareFunc)) void {
        const arg_cmp_func: SequenceIterCompareFunc = @ptrCast(argC_cmp_func.callback());
        defer argC_cmp_func.deinit();
        const arg_cmp_data: ?*anyopaque = @ptrCast(argC_cmp_func.data());
        const cFn = @extern(*const fn (*Sequence, SequenceIterCompareFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_sequence_sort_iter" });
        const ret = cFn(self, arg_cmp_func, @ptrCast(arg_cmp_data));
        return ret;
    }
    pub fn foreachRange(arg_begin: *SequenceIter, arg_end: *SequenceIter, argC_func: core.Closure(Func)) void {
        const arg_func: Func = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*SequenceIter, *SequenceIter, Func, ?*anyopaque) callconv(.c) void, .{ .name = "g_sequence_foreach_range" });
        const ret = cFn(arg_begin, arg_end, arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn get(arg_iter: *SequenceIter) ?*anyopaque {
        const cFn = @extern(*const fn (*SequenceIter) callconv(.c) ?*anyopaque, .{ .name = "g_sequence_get" });
        const ret = cFn(arg_iter);
        return ret;
    }
    pub fn insertBefore(arg_iter: *SequenceIter, arg_data: ?*anyopaque) *SequenceIter {
        const cFn = @extern(*const fn (*SequenceIter, ?*anyopaque) callconv(.c) *SequenceIter, .{ .name = "g_sequence_insert_before" });
        const ret = cFn(arg_iter, @ptrCast(arg_data));
        return ret;
    }
    pub fn move(arg_src: *SequenceIter, arg_dest: *SequenceIter) void {
        const cFn = @extern(*const fn (*SequenceIter, *SequenceIter) callconv(.c) void, .{ .name = "g_sequence_move" });
        const ret = cFn(arg_src, arg_dest);
        return ret;
    }
    pub fn moveRange(arg_dest: *SequenceIter, arg_begin: *SequenceIter, arg_end: *SequenceIter) void {
        const cFn = @extern(*const fn (*SequenceIter, *SequenceIter, *SequenceIter) callconv(.c) void, .{ .name = "g_sequence_move_range" });
        const ret = cFn(arg_dest, arg_begin, arg_end);
        return ret;
    }
    pub fn rangeGetMidpoint(arg_begin: *SequenceIter, arg_end: *SequenceIter) *SequenceIter {
        const cFn = @extern(*const fn (*SequenceIter, *SequenceIter) callconv(.c) *SequenceIter, .{ .name = "g_sequence_range_get_midpoint" });
        const ret = cFn(arg_begin, arg_end);
        return ret;
    }
    pub fn remove(arg_iter: *SequenceIter) void {
        const cFn = @extern(*const fn (*SequenceIter) callconv(.c) void, .{ .name = "g_sequence_remove" });
        const ret = cFn(arg_iter);
        return ret;
    }
    pub fn removeRange(arg_begin: *SequenceIter, arg_end: *SequenceIter) void {
        const cFn = @extern(*const fn (*SequenceIter, *SequenceIter) callconv(.c) void, .{ .name = "g_sequence_remove_range" });
        const ret = cFn(arg_begin, arg_end);
        return ret;
    }
    pub fn set(arg_iter: *SequenceIter, arg_data: ?*anyopaque) void {
        const cFn = @extern(*const fn (*SequenceIter, ?*anyopaque) callconv(.c) void, .{ .name = "g_sequence_set" });
        const ret = cFn(arg_iter, @ptrCast(arg_data));
        return ret;
    }
    pub fn sortChanged(arg_iter: *SequenceIter, argC_cmp_func: core.Closure(CompareDataFunc)) void {
        const arg_cmp_func: CompareDataFunc = @ptrCast(argC_cmp_func.callback());
        defer argC_cmp_func.deinit();
        const arg_cmp_data: ?*anyopaque = @ptrCast(argC_cmp_func.data());
        const cFn = @extern(*const fn (*SequenceIter, CompareDataFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_sequence_sort_changed" });
        const ret = cFn(arg_iter, arg_cmp_func, @ptrCast(arg_cmp_data));
        return ret;
    }
    pub fn sortChangedIter(arg_iter: *SequenceIter, argC_iter_cmp: core.Closure(SequenceIterCompareFunc)) void {
        const arg_iter_cmp: SequenceIterCompareFunc = @ptrCast(argC_iter_cmp.callback());
        defer argC_iter_cmp.deinit();
        const arg_cmp_data: ?*anyopaque = @ptrCast(argC_iter_cmp.data());
        const cFn = @extern(*const fn (*SequenceIter, SequenceIterCompareFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_sequence_sort_changed_iter" });
        const ret = cFn(arg_iter, arg_iter_cmp, @ptrCast(arg_cmp_data));
        return ret;
    }
    pub fn swap(arg_a: *SequenceIter, arg_b: *SequenceIter) void {
        const cFn = @extern(*const fn (*SequenceIter, *SequenceIter) callconv(.c) void, .{ .name = "g_sequence_swap" });
        const ret = cFn(arg_a, arg_b);
        return ret;
    }
};
pub const SequenceIter = opaque {
    pub fn compare(self: *SequenceIter, arg_b: *SequenceIter) i32 {
        const cFn = @extern(*const fn (*SequenceIter, *SequenceIter) callconv(.c) i32, .{ .name = "g_sequence_iter_compare" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn getPosition(self: *SequenceIter) i32 {
        const cFn = @extern(*const fn (*SequenceIter) callconv(.c) i32, .{ .name = "g_sequence_iter_get_position" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getSequence(self: *SequenceIter) *Sequence {
        const cFn = @extern(*const fn (*SequenceIter) callconv(.c) *Sequence, .{ .name = "g_sequence_iter_get_sequence" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isBegin(self: *SequenceIter) bool {
        const cFn = @extern(*const fn (*SequenceIter) callconv(.c) bool, .{ .name = "g_sequence_iter_is_begin" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isEnd(self: *SequenceIter) bool {
        const cFn = @extern(*const fn (*SequenceIter) callconv(.c) bool, .{ .name = "g_sequence_iter_is_end" });
        const ret = cFn(self);
        return ret;
    }
    pub fn move(self: *SequenceIter, arg_delta: i32) *SequenceIter {
        const cFn = @extern(*const fn (*SequenceIter, i32) callconv(.c) *SequenceIter, .{ .name = "g_sequence_iter_move" });
        const ret = cFn(self, arg_delta);
        return ret;
    }
    pub fn next(self: *SequenceIter) *SequenceIter {
        const cFn = @extern(*const fn (*SequenceIter) callconv(.c) *SequenceIter, .{ .name = "g_sequence_iter_next" });
        const ret = cFn(self);
        return ret;
    }
    pub fn prev(self: *SequenceIter) *SequenceIter {
        const cFn = @extern(*const fn (*SequenceIter) callconv(.c) *SequenceIter, .{ .name = "g_sequence_iter_prev" });
        const ret = cFn(self);
        return ret;
    }
};
pub const SequenceIterCompareFunc = *const fn (arg_a: *SequenceIter, arg_b: *SequenceIter, arg_data: ?*anyopaque) callconv(.c) i32;
pub const ShellError = enum(u32) {
    bad_quoting = 0,
    empty_string = 1,
    failed = 2,
};
pub const SliceConfig = enum(u32) {
    always_malloc = 1,
    bypass_magazines = 2,
    working_set_msecs = 3,
    color_increment = 4,
    chunk_sizes = 5,
    contention_counter = 6,
};
pub const Source = extern struct {
    callback_data: ?*anyopaque,
    callback_funcs: ?*SourceCallbackFuncs,
    source_funcs: ?*SourceFuncs,
    ref_count: u32,
    context: ?*MainContext,
    priority: i32,
    flags: u32,
    source_id: u32,
    poll_fds: ?*GLib.SList,
    prev: ?*Source,
    next: ?*Source,
    name: ?[*:0]const u8,
    priv: ?*SourcePrivate,
    pub fn new(arg_source_funcs: *SourceFuncs, arg_struct_size: u32) *Source {
        const cFn = @extern(*const fn (*SourceFuncs, u32) callconv(.c) *Source, .{ .name = "g_source_new" });
        const ret = cFn(arg_source_funcs, arg_struct_size);
        return ret;
    }
    pub fn addChildSource(self: *Source, arg_child_source: *Source) void {
        const cFn = @extern(*const fn (*Source, *Source) callconv(.c) void, .{ .name = "g_source_add_child_source" });
        const ret = cFn(self, arg_child_source);
        return ret;
    }
    pub fn addPoll(self: *Source, arg_fd: *PollFD) void {
        const cFn = @extern(*const fn (*Source, *PollFD) callconv(.c) void, .{ .name = "g_source_add_poll" });
        const ret = cFn(self, arg_fd);
        return ret;
    }
    pub fn addUnixFd(self: *Source, arg_fd: i32, arg_events: IOCondition) *anyopaque {
        const cFn = @extern(*const fn (*Source, i32, IOCondition) callconv(.c) *anyopaque, .{ .name = "g_source_add_unix_fd" });
        const ret = cFn(self, arg_fd, arg_events);
        return ret;
    }
    pub fn attach(self: *Source, arg_context: ?*MainContext) u32 {
        const cFn = @extern(*const fn (*Source, ?*MainContext) callconv(.c) u32, .{ .name = "g_source_attach" });
        const ret = cFn(self, arg_context);
        return ret;
    }
    pub fn destroy(self: *Source) void {
        const cFn = @extern(*const fn (*Source) callconv(.c) void, .{ .name = "g_source_destroy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn dupContext(self: *Source) ?*MainContext {
        const cFn = @extern(*const fn (*Source) callconv(.c) ?*MainContext, .{ .name = "g_source_dup_context" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCanRecurse(self: *Source) bool {
        const cFn = @extern(*const fn (*Source) callconv(.c) bool, .{ .name = "g_source_get_can_recurse" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getContext(self: *Source) ?*MainContext {
        const cFn = @extern(*const fn (*Source) callconv(.c) ?*MainContext, .{ .name = "g_source_get_context" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getCurrentTime(self: *Source, arg_timeval: *TimeVal) void {
        const cFn = @extern(*const fn (*Source, *TimeVal) callconv(.c) void, .{ .name = "g_source_get_current_time" });
        const ret = cFn(self, arg_timeval);
        return ret;
    }
    pub fn getId(self: *Source) u32 {
        const cFn = @extern(*const fn (*Source) callconv(.c) u32, .{ .name = "g_source_get_id" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getName(self: *Source) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Source) callconv(.c) ?[*:0]u8, .{ .name = "g_source_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPriority(self: *Source) i32 {
        const cFn = @extern(*const fn (*Source) callconv(.c) i32, .{ .name = "g_source_get_priority" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getReadyTime(self: *Source) i64 {
        const cFn = @extern(*const fn (*Source) callconv(.c) i64, .{ .name = "g_source_get_ready_time" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTime(self: *Source) i64 {
        const cFn = @extern(*const fn (*Source) callconv(.c) i64, .{ .name = "g_source_get_time" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isDestroyed(self: *Source) bool {
        const cFn = @extern(*const fn (*Source) callconv(.c) bool, .{ .name = "g_source_is_destroyed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn modifyUnixFd(self: *Source, arg_tag: *anyopaque, arg_new_events: IOCondition) void {
        const cFn = @extern(*const fn (*Source, *anyopaque, IOCondition) callconv(.c) void, .{ .name = "g_source_modify_unix_fd" });
        const ret = cFn(self, @ptrCast(arg_tag), arg_new_events);
        return ret;
    }
    pub fn queryUnixFd(self: *Source, arg_tag: *anyopaque) IOCondition {
        const cFn = @extern(*const fn (*Source, *anyopaque) callconv(.c) IOCondition, .{ .name = "g_source_query_unix_fd" });
        const ret = cFn(self, @ptrCast(arg_tag));
        return ret;
    }
    pub fn ref(self: *Source) *Source {
        const cFn = @extern(*const fn (*Source) callconv(.c) *Source, .{ .name = "g_source_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn removeChildSource(self: *Source, arg_child_source: *Source) void {
        const cFn = @extern(*const fn (*Source, *Source) callconv(.c) void, .{ .name = "g_source_remove_child_source" });
        const ret = cFn(self, arg_child_source);
        return ret;
    }
    pub fn removePoll(self: *Source, arg_fd: *PollFD) void {
        const cFn = @extern(*const fn (*Source, *PollFD) callconv(.c) void, .{ .name = "g_source_remove_poll" });
        const ret = cFn(self, arg_fd);
        return ret;
    }
    pub fn removeUnixFd(self: *Source, arg_tag: *anyopaque) void {
        const cFn = @extern(*const fn (*Source, *anyopaque) callconv(.c) void, .{ .name = "g_source_remove_unix_fd" });
        const ret = cFn(self, @ptrCast(arg_tag));
        return ret;
    }
    pub fn setCallback(self: *Source, argC_func: core.Closure(SourceFunc)) void {
        const arg_func: SourceFunc = @ptrCast(argC_func.callback());
        const arg_data: ?*anyopaque = @ptrCast(argC_func.data());
        const arg_notify: ?DestroyNotify = @ptrCast(argC_func.destroy());
        const cFn = @extern(*const fn (*Source, SourceFunc, ?*anyopaque, ?DestroyNotify) callconv(.c) void, .{ .name = "g_source_set_callback" });
        const ret = cFn(self, arg_func, @ptrCast(arg_data), arg_notify);
        return ret;
    }
    pub fn setCallbackIndirect(self: *Source, arg_callback_data: ?*anyopaque, arg_callback_funcs: *SourceCallbackFuncs) void {
        const cFn = @extern(*const fn (*Source, ?*anyopaque, *SourceCallbackFuncs) callconv(.c) void, .{ .name = "g_source_set_callback_indirect" });
        const ret = cFn(self, @ptrCast(arg_callback_data), arg_callback_funcs);
        return ret;
    }
    pub fn setCanRecurse(self: *Source, arg_can_recurse: bool) void {
        const cFn = @extern(*const fn (*Source, bool) callconv(.c) void, .{ .name = "g_source_set_can_recurse" });
        const ret = cFn(self, arg_can_recurse);
        return ret;
    }
    pub fn setFuncs(self: *Source, arg_funcs: *SourceFuncs) void {
        const cFn = @extern(*const fn (*Source, *SourceFuncs) callconv(.c) void, .{ .name = "g_source_set_funcs" });
        const ret = cFn(self, arg_funcs);
        return ret;
    }
    pub fn setName(self: *Source, arg_name: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Source, [*:0]const u8) callconv(.c) void, .{ .name = "g_source_set_name" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn setPriority(self: *Source, arg_priority: i32) void {
        const cFn = @extern(*const fn (*Source, i32) callconv(.c) void, .{ .name = "g_source_set_priority" });
        const ret = cFn(self, arg_priority);
        return ret;
    }
    pub fn setReadyTime(self: *Source, arg_ready_time: i64) void {
        const cFn = @extern(*const fn (*Source, i64) callconv(.c) void, .{ .name = "g_source_set_ready_time" });
        const ret = cFn(self, arg_ready_time);
        return ret;
    }
    pub fn setStaticName(self: *Source, arg_name: [*:0]const u8) void {
        const cFn = @extern(*const fn (*Source, [*:0]const u8) callconv(.c) void, .{ .name = "g_source_set_static_name" });
        const ret = cFn(self, arg_name);
        return ret;
    }
    pub fn unref(self: *Source) void {
        const cFn = @extern(*const fn (*Source) callconv(.c) void, .{ .name = "g_source_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn remove(arg_tag: u32) bool {
        const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_source_remove" });
        const ret = cFn(arg_tag);
        return ret;
    }
    pub fn removeByFuncsUserData(arg_funcs: *SourceFuncs, arg_user_data: ?*anyopaque) bool {
        const cFn = @extern(*const fn (*SourceFuncs, ?*anyopaque) callconv(.c) bool, .{ .name = "g_source_remove_by_funcs_user_data" });
        const ret = cFn(arg_funcs, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn removeByUserData(arg_user_data: ?*anyopaque) bool {
        const cFn = @extern(*const fn (?*anyopaque) callconv(.c) bool, .{ .name = "g_source_remove_by_user_data" });
        const ret = cFn(@ptrCast(arg_user_data));
        return ret;
    }
    pub fn setNameById(arg_tag: u32, arg_name: [*:0]const u8) void {
        const cFn = @extern(*const fn (u32, [*:0]const u8) callconv(.c) void, .{ .name = "g_source_set_name_by_id" });
        const ret = cFn(arg_tag, arg_name);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_source_get_type" });
        return cFn();
    }
};
pub const SourceCallbackFuncs = extern struct {
    ref: ?*const fn (arg_cb_data: *anyopaque) callconv(.c) void,
    unref: ?*const fn (arg_cb_data: *anyopaque) callconv(.c) void,
    get: ?*anyopaque,
};
pub const SourceDisposeFunc = *const fn (arg_source: *Source) callconv(.c) void;
pub const SourceDummyMarshal = *const fn () callconv(.c) void;
pub const SourceFunc = *const fn (arg_user_data: ?*anyopaque) callconv(.c) bool;
pub const SourceFuncs = extern struct {
    prepare: ?SourceFuncsPrepareFunc,
    check: ?SourceFuncsCheckFunc,
    dispatch: ?*anyopaque,
    finalize: ?SourceFuncsFinalizeFunc,
    closure_callback: ?SourceFunc,
    closure_marshal: ?SourceDummyMarshal,
};
pub const SourceFuncsCheckFunc = *const fn (arg_source: *Source) callconv(.c) bool;
pub const SourceFuncsFinalizeFunc = *const fn (arg_source: *Source) callconv(.c) void;
pub const SourceFuncsPrepareFunc = *const fn (arg_source: *Source, arg_timeout_: ?*i32) callconv(.c) bool;
pub const SourceOnceFunc = *const fn (arg_user_data: ?*anyopaque) callconv(.c) void;
pub const SourcePrivate = opaque {};
pub const SpawnChildSetupFunc = *const fn (arg_data: ?*anyopaque) callconv(.c) void;
pub const SpawnError = enum(u32) {
    fork = 0,
    read = 1,
    chdir = 2,
    acces = 3,
    perm = 4,
    too_big = 5,
    noexec = 6,
    nametoolong = 7,
    noent = 8,
    nomem = 9,
    notdir = 10,
    loop = 11,
    txtbusy = 12,
    io = 13,
    nfile = 14,
    mfile = 15,
    inval = 16,
    isdir = 17,
    libbad = 18,
    failed = 19,
    pub const @"2big": @This() = @enumFromInt(@as(u32, 5));
};
pub const SpawnFlags = packed struct(u32) {
    leave_descriptors_open: bool = false,
    do_not_reap_child: bool = false,
    search_path: bool = false,
    stdout_to_dev_null: bool = false,
    stderr_to_dev_null: bool = false,
    child_inherits_stdin: bool = false,
    file_and_argv_zero: bool = false,
    search_path_from_envp: bool = false,
    cloexec_pipes: bool = false,
    child_inherits_stdout: bool = false,
    child_inherits_stderr: bool = false,
    stdin_from_dev_null: bool = false,
    _: u20 = 0,
};
pub const StatBuf = opaque {};
pub const String = extern struct {
    str: ?[*:0]const u8,
    len: u64,
    allocated_len: u64,
    pub fn new(arg_init: ?[*:0]const u8) *String {
        const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) *String, .{ .name = "g_string_new" });
        const ret = cFn(arg_init);
        return ret;
    }
    pub fn newLen(arg_init: [*:0]const u8, arg_len: i64) *String {
        const cFn = @extern(*const fn ([*:0]const u8, i64) callconv(.c) *String, .{ .name = "g_string_new_len" });
        const ret = cFn(arg_init, arg_len);
        return ret;
    }
    pub fn newTake(arg_init: ?[*:0]const u8) *String {
        const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) *String, .{ .name = "g_string_new_take" });
        const ret = cFn(arg_init);
        return ret;
    }
    pub fn sizedNew(arg_dfl_size: u64) *String {
        const cFn = @extern(*const fn (u64) callconv(.c) *String, .{ .name = "g_string_sized_new" });
        const ret = cFn(arg_dfl_size);
        return ret;
    }
    pub fn append(self: *String, arg_val: [*:0]const u8) *String {
        const cFn = @extern(*const fn (*String, [*:0]const u8) callconv(.c) *String, .{ .name = "g_string_append" });
        const ret = cFn(self, arg_val);
        return ret;
    }
    pub fn appendC(self: *String, arg_c: i8) *String {
        const cFn = @extern(*const fn (*String, i8) callconv(.c) *String, .{ .name = "g_string_append_c" });
        const ret = cFn(self, arg_c);
        return ret;
    }
    pub fn appendLen(self: *String, arg_val: [*:0]const u8, arg_len: i64) *String {
        const cFn = @extern(*const fn (*String, [*:0]const u8, i64) callconv(.c) *String, .{ .name = "g_string_append_len" });
        const ret = cFn(self, arg_val, arg_len);
        return ret;
    }
    pub fn appendUnichar(self: *String, arg_wc: u32) *String {
        const cFn = @extern(*const fn (*String, u32) callconv(.c) *String, .{ .name = "g_string_append_unichar" });
        const ret = cFn(self, arg_wc);
        return ret;
    }
    pub fn appendUriEscaped(self: *String, arg_unescaped: [*:0]const u8, arg_reserved_chars_allowed: [*:0]const u8, arg_allow_utf8: bool) *String {
        const cFn = @extern(*const fn (*String, [*:0]const u8, [*:0]const u8, bool) callconv(.c) *String, .{ .name = "g_string_append_uri_escaped" });
        const ret = cFn(self, arg_unescaped, arg_reserved_chars_allowed, arg_allow_utf8);
        return ret;
    }
    pub fn asciiDown(self: *String) *String {
        const cFn = @extern(*const fn (*String) callconv(.c) *String, .{ .name = "g_string_ascii_down" });
        const ret = cFn(self);
        return ret;
    }
    pub fn asciiUp(self: *String) *String {
        const cFn = @extern(*const fn (*String) callconv(.c) *String, .{ .name = "g_string_ascii_up" });
        const ret = cFn(self);
        return ret;
    }
    pub fn assign(self: *String, arg_rval: [*:0]const u8) *String {
        const cFn = @extern(*const fn (*String, [*:0]const u8) callconv(.c) *String, .{ .name = "g_string_assign" });
        const ret = cFn(self, arg_rval);
        return ret;
    }
    pub fn copy(self: *String) *String {
        const cFn = @extern(*const fn (*String) callconv(.c) *String, .{ .name = "g_string_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn down(self: *String) *String {
        const cFn = @extern(*const fn (*String) callconv(.c) *String, .{ .name = "g_string_down" });
        const ret = cFn(self);
        return ret;
    }
    pub fn equal(self: *String, arg_v2: *String) bool {
        const cFn = @extern(*const fn (*String, *String) callconv(.c) bool, .{ .name = "g_string_equal" });
        const ret = cFn(self, arg_v2);
        return ret;
    }
    pub fn erase(self: *String, arg_pos: i64, arg_len: i64) *String {
        const cFn = @extern(*const fn (*String, i64, i64) callconv(.c) *String, .{ .name = "g_string_erase" });
        const ret = cFn(self, arg_pos, arg_len);
        return ret;
    }
    pub fn free(self: *String, arg_free_segment: bool) ?[*:0]u8 {
        const cFn = @extern(*const fn (*String, bool) callconv(.c) ?[*:0]u8, .{ .name = "g_string_free" });
        const ret = cFn(self, arg_free_segment);
        return ret;
    }
    pub fn freeAndSteal(self: *String) [*:0]u8 {
        const cFn = @extern(*const fn (*String) callconv(.c) [*:0]u8, .{ .name = "g_string_free_and_steal" });
        const ret = cFn(self);
        return ret;
    }
    pub fn freeToBytes(self: *String) *Bytes {
        const cFn = @extern(*const fn (*String) callconv(.c) *Bytes, .{ .name = "g_string_free_to_bytes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hash(self: *String) u32 {
        const cFn = @extern(*const fn (*String) callconv(.c) u32, .{ .name = "g_string_hash" });
        const ret = cFn(self);
        return ret;
    }
    pub fn insert(self: *String, arg_pos: i64, arg_val: [*:0]const u8) *String {
        const cFn = @extern(*const fn (*String, i64, [*:0]const u8) callconv(.c) *String, .{ .name = "g_string_insert" });
        const ret = cFn(self, arg_pos, arg_val);
        return ret;
    }
    pub fn insertC(self: *String, arg_pos: i64, arg_c: i8) *String {
        const cFn = @extern(*const fn (*String, i64, i8) callconv(.c) *String, .{ .name = "g_string_insert_c" });
        const ret = cFn(self, arg_pos, arg_c);
        return ret;
    }
    pub fn insertLen(self: *String, arg_pos: i64, arg_val: [*:0]const u8, arg_len: i64) *String {
        const cFn = @extern(*const fn (*String, i64, [*:0]const u8, i64) callconv(.c) *String, .{ .name = "g_string_insert_len" });
        const ret = cFn(self, arg_pos, arg_val, arg_len);
        return ret;
    }
    pub fn insertUnichar(self: *String, arg_pos: i64, arg_wc: u32) *String {
        const cFn = @extern(*const fn (*String, i64, u32) callconv(.c) *String, .{ .name = "g_string_insert_unichar" });
        const ret = cFn(self, arg_pos, arg_wc);
        return ret;
    }
    pub fn overwrite(self: *String, arg_pos: u64, arg_val: [*:0]const u8) *String {
        const cFn = @extern(*const fn (*String, u64, [*:0]const u8) callconv(.c) *String, .{ .name = "g_string_overwrite" });
        const ret = cFn(self, arg_pos, arg_val);
        return ret;
    }
    pub fn overwriteLen(self: *String, arg_pos: u64, arg_val: [*:0]const u8, arg_len: i64) *String {
        const cFn = @extern(*const fn (*String, u64, [*:0]const u8, i64) callconv(.c) *String, .{ .name = "g_string_overwrite_len" });
        const ret = cFn(self, arg_pos, arg_val, arg_len);
        return ret;
    }
    pub fn prepend(self: *String, arg_val: [*:0]const u8) *String {
        const cFn = @extern(*const fn (*String, [*:0]const u8) callconv(.c) *String, .{ .name = "g_string_prepend" });
        const ret = cFn(self, arg_val);
        return ret;
    }
    pub fn prependC(self: *String, arg_c: i8) *String {
        const cFn = @extern(*const fn (*String, i8) callconv(.c) *String, .{ .name = "g_string_prepend_c" });
        const ret = cFn(self, arg_c);
        return ret;
    }
    pub fn prependLen(self: *String, arg_val: [*:0]const u8, arg_len: i64) *String {
        const cFn = @extern(*const fn (*String, [*:0]const u8, i64) callconv(.c) *String, .{ .name = "g_string_prepend_len" });
        const ret = cFn(self, arg_val, arg_len);
        return ret;
    }
    pub fn prependUnichar(self: *String, arg_wc: u32) *String {
        const cFn = @extern(*const fn (*String, u32) callconv(.c) *String, .{ .name = "g_string_prepend_unichar" });
        const ret = cFn(self, arg_wc);
        return ret;
    }
    pub fn replace(self: *String, arg_find: [*:0]const u8, arg_replace: [*:0]const u8, arg_limit: u32) u32 {
        const cFn = @extern(*const fn (*String, [*:0]const u8, [*:0]const u8, u32) callconv(.c) u32, .{ .name = "g_string_replace" });
        const ret = cFn(self, arg_find, arg_replace, arg_limit);
        return ret;
    }
    pub fn setSize(self: *String, arg_len: u64) *String {
        const cFn = @extern(*const fn (*String, u64) callconv(.c) *String, .{ .name = "g_string_set_size" });
        const ret = cFn(self, arg_len);
        return ret;
    }
    pub fn truncate(self: *String, arg_len: u64) *String {
        const cFn = @extern(*const fn (*String, u64) callconv(.c) *String, .{ .name = "g_string_truncate" });
        const ret = cFn(self, arg_len);
        return ret;
    }
    pub fn up(self: *String) *String {
        const cFn = @extern(*const fn (*String) callconv(.c) *String, .{ .name = "g_string_up" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_gstring_get_type" });
        return cFn();
    }
};
pub const StringChunk = opaque {
    pub fn clear(self: *StringChunk) void {
        const cFn = @extern(*const fn (*StringChunk) callconv(.c) void, .{ .name = "g_string_chunk_clear" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *StringChunk) void {
        const cFn = @extern(*const fn (*StringChunk) callconv(.c) void, .{ .name = "g_string_chunk_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn insert(self: *StringChunk, arg_string: [*:0]const u8) [*:0]u8 {
        const cFn = @extern(*const fn (*StringChunk, [*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_string_chunk_insert" });
        const ret = cFn(self, arg_string);
        return ret;
    }
    pub fn insertConst(self: *StringChunk, arg_string: [*:0]const u8) [*:0]u8 {
        const cFn = @extern(*const fn (*StringChunk, [*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_string_chunk_insert_const" });
        const ret = cFn(self, arg_string);
        return ret;
    }
    pub fn insertLen(self: *StringChunk, arg_string: [*:0]const u8, arg_len: i64) [*:0]u8 {
        const cFn = @extern(*const fn (*StringChunk, [*:0]const u8, i64) callconv(.c) [*:0]u8, .{ .name = "g_string_chunk_insert_len" });
        const ret = cFn(self, arg_string, arg_len);
        return ret;
    }
};
pub const StrvBuilder = opaque {
    pub fn new() *StrvBuilder {
        const cFn = @extern(*const fn () callconv(.c) *StrvBuilder, .{ .name = "g_strv_builder_new" });
        const ret = cFn();
        return ret;
    }
    pub fn add(self: *StrvBuilder, arg_value: [*:0]const u8) void {
        const cFn = @extern(*const fn (*StrvBuilder, [*:0]const u8) callconv(.c) void, .{ .name = "g_strv_builder_add" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn addv(self: *StrvBuilder, arg_value: [*]?[*:0]const u8) void {
        const cFn = @extern(*const fn (*StrvBuilder, [*]?[*:0]const u8) callconv(.c) void, .{ .name = "g_strv_builder_addv" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn end(self: *StrvBuilder) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*StrvBuilder) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_strv_builder_end" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *StrvBuilder) *StrvBuilder {
        const cFn = @extern(*const fn (*StrvBuilder) callconv(.c) *StrvBuilder, .{ .name = "g_strv_builder_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn take(self: *StrvBuilder, arg_value: [*:0]const u8) void {
        const cFn = @extern(*const fn (*StrvBuilder, [*:0]const u8) callconv(.c) void, .{ .name = "g_strv_builder_take" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn unref(self: *StrvBuilder) void {
        const cFn = @extern(*const fn (*StrvBuilder) callconv(.c) void, .{ .name = "g_strv_builder_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unrefToStrv(self: *StrvBuilder) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn (*StrvBuilder) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_strv_builder_unref_to_strv" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_strv_builder_get_type" });
        return cFn();
    }
};
pub const TEST_OPTION_ISOLATE_DIRS = "isolate_dirs";
pub const TEST_OPTION_NONFATAL_ASSERTIONS = "nonfatal-assertions";
pub const TEST_OPTION_NO_PRGNAME = "no_g_set_prgname";
pub const TIME_SPAN_DAY = 86400000000;
pub const TIME_SPAN_HOUR = 3600000000;
pub const TIME_SPAN_MILLISECOND = 1000;
pub const TIME_SPAN_MINUTE = 60000000;
pub const TIME_SPAN_SECOND = 1000000;
pub const TestCase = opaque {
    pub fn free(self: *TestCase) void {
        const cFn = @extern(*const fn (*TestCase) callconv(.c) void, .{ .name = "g_test_case_free" });
        const ret = cFn(self);
        return ret;
    }
};
pub const TestConfig = extern struct {
    test_initialized: bool,
    test_quick: bool,
    test_perf: bool,
    test_verbose: bool,
    test_quiet: bool,
    test_undefined: bool,
};
pub const TestDataFunc = *const fn (arg_user_data: ?*anyopaque) callconv(.c) void;
pub const TestFileType = enum(u32) {
    dist = 0,
    built = 1,
};
pub const TestFixtureFunc = *const fn (arg_fixture: *anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const TestFunc = *const fn () callconv(.c) void;
pub const TestLogBuffer = extern struct {
    data: ?*String,
    msgs: ?*GLib.SList,
    pub fn free(self: *TestLogBuffer) void {
        const cFn = @extern(*const fn (*TestLogBuffer) callconv(.c) void, .{ .name = "g_test_log_buffer_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn push(self: *TestLogBuffer, arg_n_bytes: u32, arg_bytes: *u8) void {
        const cFn = @extern(*const fn (*TestLogBuffer, u32, *u8) callconv(.c) void, .{ .name = "g_test_log_buffer_push" });
        const ret = cFn(self, arg_n_bytes, arg_bytes);
        return ret;
    }
};
pub const TestLogFatalFunc = *const fn (arg_log_domain: [*:0]const u8, arg_log_level: LogLevelFlags, arg_message: [*:0]const u8, arg_user_data: ?*anyopaque) callconv(.c) bool;
pub const TestLogMsg = extern struct {
    log_type: TestLogType,
    n_strings: u32,
    strings: ?[*:0]const u8,
    n_nums: u32,
    nums: ?*anyopaque,
    pub fn free(self: *TestLogMsg) void {
        const cFn = @extern(*const fn (*TestLogMsg) callconv(.c) void, .{ .name = "g_test_log_msg_free" });
        const ret = cFn(self);
        return ret;
    }
};
pub const TestLogType = enum(u32) {
    none = 0,
    @"error" = 1,
    start_binary = 2,
    list_case = 3,
    skip_case = 4,
    start_case = 5,
    stop_case = 6,
    min_result = 7,
    max_result = 8,
    message = 9,
    start_suite = 10,
    stop_suite = 11,
};
pub const TestResult = enum(u32) {
    success = 0,
    skipped = 1,
    failure = 2,
    incomplete = 3,
};
pub const TestSubprocessFlags = packed struct(u32) {
    inherit_stdin: bool = false,
    inherit_stdout: bool = false,
    inherit_stderr: bool = false,
    _: u29 = 0,
};
pub const TestSuite = opaque {
    pub fn add(self: *TestSuite, arg_test_case: *TestCase) void {
        const cFn = @extern(*const fn (*TestSuite, *TestCase) callconv(.c) void, .{ .name = "g_test_suite_add" });
        const ret = cFn(self, arg_test_case);
        return ret;
    }
    pub fn addSuite(self: *TestSuite, arg_nestedsuite: *TestSuite) void {
        const cFn = @extern(*const fn (*TestSuite, *TestSuite) callconv(.c) void, .{ .name = "g_test_suite_add_suite" });
        const ret = cFn(self, arg_nestedsuite);
        return ret;
    }
    pub fn free(self: *TestSuite) void {
        const cFn = @extern(*const fn (*TestSuite) callconv(.c) void, .{ .name = "g_test_suite_free" });
        const ret = cFn(self);
        return ret;
    }
};
pub const TestTrapFlags = packed struct(u32) {
    _0: u7 = 0,
    silence_stdout: bool = false,
    silence_stderr: bool = false,
    inherit_stdin: bool = false,
    _: u22 = 0,
};
pub const Thread = extern struct {
    func: ?ThreadFunc,
    data: ?*anyopaque,
    joinable: bool,
    priority: ?*anyopaque,
    pub fn new(arg_name: ?[*:0]const u8, argC_func: core.Closure(ThreadFunc)) *Thread {
        const arg_func: ThreadFunc = @ptrCast(argC_func.callback());
        argC_func.closure.once = true;
        const arg_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (?[*:0]const u8, ThreadFunc, ?*anyopaque) callconv(.c) *Thread, .{ .name = "g_thread_new" });
        const ret = cFn(arg_name, arg_func, @ptrCast(arg_data));
        return ret;
    }
    pub fn tryNew(arg_name: ?[*:0]const u8, argC_func: core.Closure(ThreadFunc), arg_error: *?*GLib.Error) error{GError}!*Thread {
        const arg_func: ThreadFunc = @ptrCast(argC_func.callback());
        argC_func.closure.once = true;
        const arg_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (?[*:0]const u8, ThreadFunc, ?*anyopaque, *?*GLib.Error) callconv(.c) *Thread, .{ .name = "g_thread_try_new" });
        const ret = cFn(arg_name, arg_func, @ptrCast(arg_data), arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn getName(self: *Thread) [*:0]u8 {
        const cFn = @extern(*const fn (*Thread) callconv(.c) [*:0]u8, .{ .name = "g_thread_get_name" });
        const ret = cFn(self);
        return ret;
    }
    pub fn join(self: *Thread) ?*anyopaque {
        const cFn = @extern(*const fn (*Thread) callconv(.c) ?*anyopaque, .{ .name = "g_thread_join" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *Thread) *Thread {
        const cFn = @extern(*const fn (*Thread) callconv(.c) *Thread, .{ .name = "g_thread_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *Thread) void {
        const cFn = @extern(*const fn (*Thread) callconv(.c) void, .{ .name = "g_thread_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn errorQuark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_thread_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn exit(arg_retval: ?*anyopaque) void {
        const cFn = @extern(*const fn (?*anyopaque) callconv(.c) void, .{ .name = "g_thread_exit" });
        const ret = cFn(@ptrCast(arg_retval));
        return ret;
    }
    pub fn _self() *Thread {
        const cFn = @extern(*const fn () callconv(.c) *Thread, .{ .name = "g_thread_self" });
        const ret = cFn();
        return ret;
    }
    pub fn yield() void {
        const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_thread_yield" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_thread_get_type" });
        return cFn();
    }
};
pub const ThreadError = enum(u32) {
    thread_error_again = 0,
};
pub const ThreadFunc = *const fn (arg_data: ?*anyopaque) callconv(.c) ?*anyopaque;
pub const ThreadPool = extern struct {
    func: ?Func,
    user_data: ?*anyopaque,
    exclusive: bool,
    pub fn free(self: *ThreadPool, arg_immediate: bool, arg_wait_: bool) void {
        const cFn = @extern(*const fn (*ThreadPool, bool, bool) callconv(.c) void, .{ .name = "g_thread_pool_free" });
        const ret = cFn(self, arg_immediate, arg_wait_);
        return ret;
    }
    pub fn getMaxThreads(self: *ThreadPool) i32 {
        const cFn = @extern(*const fn (*ThreadPool) callconv(.c) i32, .{ .name = "g_thread_pool_get_max_threads" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNumThreads(self: *ThreadPool) u32 {
        const cFn = @extern(*const fn (*ThreadPool) callconv(.c) u32, .{ .name = "g_thread_pool_get_num_threads" });
        const ret = cFn(self);
        return ret;
    }
    pub fn moveToFront(self: *ThreadPool, arg_data: ?*anyopaque) bool {
        const cFn = @extern(*const fn (*ThreadPool, ?*anyopaque) callconv(.c) bool, .{ .name = "g_thread_pool_move_to_front" });
        const ret = cFn(self, @ptrCast(arg_data));
        return ret;
    }
    pub fn push(self: *ThreadPool, arg_data: ?*anyopaque, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*ThreadPool, ?*anyopaque, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_thread_pool_push" });
        const ret = cFn(self, @ptrCast(arg_data), arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn setMaxThreads(self: *ThreadPool, arg_max_threads: i32, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn (*ThreadPool, i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_thread_pool_set_max_threads" });
        const ret = cFn(self, arg_max_threads, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn unprocessed(self: *ThreadPool) u32 {
        const cFn = @extern(*const fn (*ThreadPool) callconv(.c) u32, .{ .name = "g_thread_pool_unprocessed" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMaxIdleTime() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_thread_pool_get_max_idle_time" });
        const ret = cFn();
        return ret;
    }
    pub fn getMaxUnusedThreads() i32 {
        const cFn = @extern(*const fn () callconv(.c) i32, .{ .name = "g_thread_pool_get_max_unused_threads" });
        const ret = cFn();
        return ret;
    }
    pub fn getNumUnusedThreads() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_thread_pool_get_num_unused_threads" });
        const ret = cFn();
        return ret;
    }
    pub fn setMaxIdleTime(arg_interval: u32) void {
        const cFn = @extern(*const fn (u32) callconv(.c) void, .{ .name = "g_thread_pool_set_max_idle_time" });
        const ret = cFn(arg_interval);
        return ret;
    }
    pub fn setMaxUnusedThreads(arg_max_threads: i32) void {
        const cFn = @extern(*const fn (i32) callconv(.c) void, .{ .name = "g_thread_pool_set_max_unused_threads" });
        const ret = cFn(arg_max_threads);
        return ret;
    }
    pub fn stopUnusedThreads() void {
        const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_thread_pool_stop_unused_threads" });
        const ret = cFn();
        return ret;
    }
};
pub const TimeType = enum(u32) {
    standard = 0,
    daylight = 1,
    universal = 2,
};
pub const TimeVal = extern struct {
    tv_sec: i64,
    tv_usec: i64,
    pub fn add(self: *TimeVal, arg_microseconds: i64) void {
        const cFn = @extern(*const fn (*TimeVal, i64) callconv(.c) void, .{ .name = "g_time_val_add" });
        const ret = cFn(self, arg_microseconds);
        return ret;
    }
    pub fn toIso8601(self: *TimeVal) ?[*:0]u8 {
        const cFn = @extern(*const fn (*TimeVal) callconv(.c) ?[*:0]u8, .{ .name = "g_time_val_to_iso8601" });
        const ret = cFn(self);
        return ret;
    }
    pub fn fromIso8601(arg_iso_date: [*:0]const u8, arg_time_: *TimeVal) bool {
        const cFn = @extern(*const fn ([*:0]const u8, *TimeVal) callconv(.c) bool, .{ .name = "g_time_val_from_iso8601" });
        const ret = cFn(arg_iso_date, arg_time_);
        return ret;
    }
};
pub const TimeZone = opaque {
    pub fn new(arg_identifier: ?[*:0]const u8) *TimeZone {
        const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) *TimeZone, .{ .name = "g_time_zone_new" });
        const ret = cFn(arg_identifier);
        return ret;
    }
    pub fn newIdentifier(arg_identifier: ?[*:0]const u8) ?*TimeZone {
        const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) ?*TimeZone, .{ .name = "g_time_zone_new_identifier" });
        const ret = cFn(arg_identifier);
        return ret;
    }
    pub fn newLocal() *TimeZone {
        const cFn = @extern(*const fn () callconv(.c) *TimeZone, .{ .name = "g_time_zone_new_local" });
        const ret = cFn();
        return ret;
    }
    pub fn newOffset(arg_seconds: i32) *TimeZone {
        const cFn = @extern(*const fn (i32) callconv(.c) *TimeZone, .{ .name = "g_time_zone_new_offset" });
        const ret = cFn(arg_seconds);
        return ret;
    }
    pub fn newUtc() *TimeZone {
        const cFn = @extern(*const fn () callconv(.c) *TimeZone, .{ .name = "g_time_zone_new_utc" });
        const ret = cFn();
        return ret;
    }
    pub fn adjustTime(self: *TimeZone, arg_type: TimeType, arg_time_: *i64) i32 {
        const cFn = @extern(*const fn (*TimeZone, TimeType, *i64) callconv(.c) i32, .{ .name = "g_time_zone_adjust_time" });
        const ret = cFn(self, arg_type, arg_time_);
        return ret;
    }
    pub fn findInterval(self: *TimeZone, arg_type: TimeType, arg_time_: i64) i32 {
        const cFn = @extern(*const fn (*TimeZone, TimeType, i64) callconv(.c) i32, .{ .name = "g_time_zone_find_interval" });
        const ret = cFn(self, arg_type, arg_time_);
        return ret;
    }
    pub fn getAbbreviation(self: *TimeZone, arg_interval: i32) [*:0]u8 {
        const cFn = @extern(*const fn (*TimeZone, i32) callconv(.c) [*:0]u8, .{ .name = "g_time_zone_get_abbreviation" });
        const ret = cFn(self, arg_interval);
        return ret;
    }
    pub fn getIdentifier(self: *TimeZone) [*:0]u8 {
        const cFn = @extern(*const fn (*TimeZone) callconv(.c) [*:0]u8, .{ .name = "g_time_zone_get_identifier" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOffset(self: *TimeZone, arg_interval: i32) i32 {
        const cFn = @extern(*const fn (*TimeZone, i32) callconv(.c) i32, .{ .name = "g_time_zone_get_offset" });
        const ret = cFn(self, arg_interval);
        return ret;
    }
    pub fn isDst(self: *TimeZone, arg_interval: i32) bool {
        const cFn = @extern(*const fn (*TimeZone, i32) callconv(.c) bool, .{ .name = "g_time_zone_is_dst" });
        const ret = cFn(self, arg_interval);
        return ret;
    }
    pub fn ref(self: *TimeZone) *TimeZone {
        const cFn = @extern(*const fn (*TimeZone) callconv(.c) *TimeZone, .{ .name = "g_time_zone_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *TimeZone) void {
        const cFn = @extern(*const fn (*TimeZone) callconv(.c) void, .{ .name = "g_time_zone_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_time_zone_get_type" });
        return cFn();
    }
};
pub const Timer = opaque {
    pub fn @"continue"(self: *Timer) void {
        const cFn = @extern(*const fn (*Timer) callconv(.c) void, .{ .name = "g_timer_continue" });
        const ret = cFn(self);
        return ret;
    }
    pub fn destroy(self: *Timer) void {
        const cFn = @extern(*const fn (*Timer) callconv(.c) void, .{ .name = "g_timer_destroy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn elapsed(self: *Timer, arg_microseconds: *u64) f64 {
        const cFn = @extern(*const fn (*Timer, *u64) callconv(.c) f64, .{ .name = "g_timer_elapsed" });
        const ret = cFn(self, arg_microseconds);
        return ret;
    }
    pub fn isActive(self: *Timer) bool {
        const cFn = @extern(*const fn (*Timer) callconv(.c) bool, .{ .name = "g_timer_is_active" });
        const ret = cFn(self);
        return ret;
    }
    pub fn reset(self: *Timer) void {
        const cFn = @extern(*const fn (*Timer) callconv(.c) void, .{ .name = "g_timer_reset" });
        const ret = cFn(self);
        return ret;
    }
    pub fn start(self: *Timer) void {
        const cFn = @extern(*const fn (*Timer) callconv(.c) void, .{ .name = "g_timer_start" });
        const ret = cFn(self);
        return ret;
    }
    pub fn stop(self: *Timer) void {
        const cFn = @extern(*const fn (*Timer) callconv(.c) void, .{ .name = "g_timer_stop" });
        const ret = cFn(self);
        return ret;
    }
};
pub const TokenType = enum(u32) {
    eof = 0,
    left_paren = 40,
    right_paren = 41,
    left_curly = 123,
    right_curly = 125,
    left_brace = 91,
    right_brace = 93,
    equal_sign = 61,
    comma = 44,
    none = 256,
    @"error" = 257,
    char = 258,
    binary = 259,
    octal = 260,
    int = 261,
    hex = 262,
    float = 263,
    string = 264,
    symbol = 265,
    identifier = 266,
    identifier_null = 267,
    comment_single = 268,
    comment_multi = 269,
};
pub const TokenValue = extern union {
    v_symbol: ?*anyopaque,
    v_identifier: ?[*:0]const u8,
    v_binary: u64,
    v_octal: u64,
    v_int: u64,
    v_int64: u64,
    v_float: f64,
    v_hex: u64,
    v_string: ?[*:0]const u8,
    v_comment: ?[*:0]const u8,
    v_char: u8,
    v_error: u32,
};
pub const TranslateFunc = *const fn (arg_str: [*:0]const u8, arg_data: ?*anyopaque) callconv(.c) [*:0]u8;
pub const TrashStack = extern struct {
    next: ?*TrashStack,
    pub fn height(arg_stack_p: *TrashStack) u32 {
        const cFn = @extern(*const fn (*TrashStack) callconv(.c) u32, .{ .name = "g_trash_stack_height" });
        const ret = cFn(arg_stack_p);
        return ret;
    }
    pub fn peek(arg_stack_p: *TrashStack) ?*anyopaque {
        const cFn = @extern(*const fn (*TrashStack) callconv(.c) ?*anyopaque, .{ .name = "g_trash_stack_peek" });
        const ret = cFn(arg_stack_p);
        return ret;
    }
    pub fn pop(arg_stack_p: *TrashStack) ?*anyopaque {
        const cFn = @extern(*const fn (*TrashStack) callconv(.c) ?*anyopaque, .{ .name = "g_trash_stack_pop" });
        const ret = cFn(arg_stack_p);
        return ret;
    }
    pub fn push(arg_stack_p: *TrashStack, arg_data_p: *anyopaque) void {
        const cFn = @extern(*const fn (*TrashStack, *anyopaque) callconv(.c) void, .{ .name = "g_trash_stack_push" });
        const ret = cFn(arg_stack_p, @ptrCast(arg_data_p));
        return ret;
    }
};
pub const TraverseFlags = packed struct(u32) {
    leaves: bool = false,
    non_leaves: bool = false,
    _: u30 = 0,
    pub const all: @This() = @bitCast(@as(u32, 3));
    pub const mask: @This() = @bitCast(@as(u32, 3));
};
pub const TraverseFunc = *const fn (arg_key: ?*anyopaque, arg_value: ?*anyopaque, arg_data: ?*anyopaque) callconv(.c) bool;
pub const TraverseNodeFunc = *const fn (arg_node: *TreeNode, arg_data: ?*anyopaque) callconv(.c) bool;
pub const TraverseType = enum(u32) {
    in_order = 0,
    pre_order = 1,
    post_order = 2,
    level_order = 3,
};
pub const Tree = opaque {
    pub fn newFull(argC_key_compare_func: core.Closure(CompareDataFunc), arg_key_destroy_func: DestroyNotify) *Tree {
        const arg_key_compare_func: CompareDataFunc = @ptrCast(argC_key_compare_func.callback());
        const arg_key_compare_data: ?*anyopaque = @ptrCast(argC_key_compare_func.data());
        const arg_value_destroy_func: DestroyNotify = @ptrCast(argC_key_compare_func.destroy());
        const cFn = @extern(*const fn (CompareDataFunc, ?*anyopaque, DestroyNotify, DestroyNotify) callconv(.c) *Tree, .{ .name = "g_tree_new_full" });
        const ret = cFn(arg_key_compare_func, @ptrCast(arg_key_compare_data), arg_key_destroy_func, arg_value_destroy_func);
        return ret;
    }
    pub fn destroy(self: *Tree) void {
        const cFn = @extern(*const fn (*Tree) callconv(.c) void, .{ .name = "g_tree_destroy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn foreach(self: *Tree, argC_func: core.Closure(TraverseFunc)) void {
        const arg_func: TraverseFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*Tree, TraverseFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_tree_foreach" });
        const ret = cFn(self, arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn foreachNode(self: *Tree, argC_func: core.Closure(TraverseNodeFunc)) void {
        const arg_func: TraverseNodeFunc = @ptrCast(argC_func.callback());
        defer argC_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
        const cFn = @extern(*const fn (*Tree, TraverseNodeFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_tree_foreach_node" });
        const ret = cFn(self, arg_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn height(self: *Tree) i32 {
        const cFn = @extern(*const fn (*Tree) callconv(.c) i32, .{ .name = "g_tree_height" });
        const ret = cFn(self);
        return ret;
    }
    pub fn insert(self: *Tree, arg_key: ?*anyopaque, arg_value: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Tree, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_tree_insert" });
        const ret = cFn(self, @ptrCast(arg_key), @ptrCast(arg_value));
        return ret;
    }
    pub fn insertNode(self: *Tree, arg_key: ?*anyopaque, arg_value: ?*anyopaque) ?*TreeNode {
        const cFn = @extern(*const fn (*Tree, ?*anyopaque, ?*anyopaque) callconv(.c) ?*TreeNode, .{ .name = "g_tree_insert_node" });
        const ret = cFn(self, @ptrCast(arg_key), @ptrCast(arg_value));
        return ret;
    }
    pub fn lookup(self: *Tree, arg_key: ?*anyopaque) ?*anyopaque {
        const cFn = @extern(*const fn (*Tree, ?*anyopaque) callconv(.c) ?*anyopaque, .{ .name = "g_tree_lookup" });
        const ret = cFn(self, @ptrCast(arg_key));
        return ret;
    }
    pub fn lookupExtended(self: *Tree, arg_lookup_key: ?*anyopaque) struct {
        ret: bool,
        orig_key: ?*anyopaque,
        value: ?*anyopaque,
    } {
        var argO_orig_key: ?*anyopaque = undefined;
        const arg_orig_key: ?*anyopaque = &argO_orig_key;
        var argO_value: ?*anyopaque = undefined;
        const arg_value: ?*anyopaque = &argO_value;
        const cFn = @extern(*const fn (*Tree, ?*anyopaque, ?*anyopaque, ?*anyopaque) callconv(.c) bool, .{ .name = "g_tree_lookup_extended" });
        const ret = cFn(self, @ptrCast(arg_lookup_key), @ptrCast(arg_orig_key), @ptrCast(arg_value));
        return .{ .ret = ret, .orig_key = argO_orig_key, .value = argO_value };
    }
    pub fn lookupNode(self: *Tree, arg_key: ?*anyopaque) ?*TreeNode {
        const cFn = @extern(*const fn (*Tree, ?*anyopaque) callconv(.c) ?*TreeNode, .{ .name = "g_tree_lookup_node" });
        const ret = cFn(self, @ptrCast(arg_key));
        return ret;
    }
    pub fn lowerBound(self: *Tree, arg_key: ?*anyopaque) ?*TreeNode {
        const cFn = @extern(*const fn (*Tree, ?*anyopaque) callconv(.c) ?*TreeNode, .{ .name = "g_tree_lower_bound" });
        const ret = cFn(self, @ptrCast(arg_key));
        return ret;
    }
    pub fn nnodes(self: *Tree) i32 {
        const cFn = @extern(*const fn (*Tree) callconv(.c) i32, .{ .name = "g_tree_nnodes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn nodeFirst(self: *Tree) ?*TreeNode {
        const cFn = @extern(*const fn (*Tree) callconv(.c) ?*TreeNode, .{ .name = "g_tree_node_first" });
        const ret = cFn(self);
        return ret;
    }
    pub fn nodeLast(self: *Tree) ?*TreeNode {
        const cFn = @extern(*const fn (*Tree) callconv(.c) ?*TreeNode, .{ .name = "g_tree_node_last" });
        const ret = cFn(self);
        return ret;
    }
    pub fn ref(self: *Tree) *Tree {
        const cFn = @extern(*const fn (*Tree) callconv(.c) *Tree, .{ .name = "g_tree_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn remove(self: *Tree, arg_key: ?*anyopaque) bool {
        const cFn = @extern(*const fn (*Tree, ?*anyopaque) callconv(.c) bool, .{ .name = "g_tree_remove" });
        const ret = cFn(self, @ptrCast(arg_key));
        return ret;
    }
    pub fn removeAll(self: *Tree) void {
        const cFn = @extern(*const fn (*Tree) callconv(.c) void, .{ .name = "g_tree_remove_all" });
        const ret = cFn(self);
        return ret;
    }
    pub fn replace(self: *Tree, arg_key: ?*anyopaque, arg_value: ?*anyopaque) void {
        const cFn = @extern(*const fn (*Tree, ?*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_tree_replace" });
        const ret = cFn(self, @ptrCast(arg_key), @ptrCast(arg_value));
        return ret;
    }
    pub fn replaceNode(self: *Tree, arg_key: ?*anyopaque, arg_value: ?*anyopaque) ?*TreeNode {
        const cFn = @extern(*const fn (*Tree, ?*anyopaque, ?*anyopaque) callconv(.c) ?*TreeNode, .{ .name = "g_tree_replace_node" });
        const ret = cFn(self, @ptrCast(arg_key), @ptrCast(arg_value));
        return ret;
    }
    pub fn search(self: *Tree, argC_search_func: core.Closure(CompareFunc)) ?*anyopaque {
        const arg_search_func: CompareFunc = @ptrCast(argC_search_func.callback());
        defer argC_search_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_search_func.data());
        const cFn = @extern(*const fn (*Tree, CompareFunc, ?*anyopaque) callconv(.c) ?*anyopaque, .{ .name = "g_tree_search" });
        const ret = cFn(self, arg_search_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn searchNode(self: *Tree, argC_search_func: core.Closure(CompareFunc)) ?*TreeNode {
        const arg_search_func: CompareFunc = @ptrCast(argC_search_func.callback());
        defer argC_search_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_search_func.data());
        const cFn = @extern(*const fn (*Tree, CompareFunc, ?*anyopaque) callconv(.c) ?*TreeNode, .{ .name = "g_tree_search_node" });
        const ret = cFn(self, arg_search_func, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn steal(self: *Tree, arg_key: ?*anyopaque) bool {
        const cFn = @extern(*const fn (*Tree, ?*anyopaque) callconv(.c) bool, .{ .name = "g_tree_steal" });
        const ret = cFn(self, @ptrCast(arg_key));
        return ret;
    }
    pub fn traverse(self: *Tree, argC_traverse_func: core.Closure(TraverseFunc), arg_traverse_type: TraverseType) void {
        const arg_traverse_func: TraverseFunc = @ptrCast(argC_traverse_func.callback());
        defer argC_traverse_func.deinit();
        const arg_user_data: ?*anyopaque = @ptrCast(argC_traverse_func.data());
        const cFn = @extern(*const fn (*Tree, TraverseFunc, TraverseType, ?*anyopaque) callconv(.c) void, .{ .name = "g_tree_traverse" });
        const ret = cFn(self, arg_traverse_func, arg_traverse_type, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn unref(self: *Tree) void {
        const cFn = @extern(*const fn (*Tree) callconv(.c) void, .{ .name = "g_tree_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn upperBound(self: *Tree, arg_key: ?*anyopaque) ?*TreeNode {
        const cFn = @extern(*const fn (*Tree, ?*anyopaque) callconv(.c) ?*TreeNode, .{ .name = "g_tree_upper_bound" });
        const ret = cFn(self, @ptrCast(arg_key));
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_tree_get_type" });
        return cFn();
    }
};
pub const TreeNode = opaque {
    pub fn key(self: *TreeNode) ?*anyopaque {
        const cFn = @extern(*const fn (*TreeNode) callconv(.c) ?*anyopaque, .{ .name = "g_tree_node_key" });
        const ret = cFn(self);
        return ret;
    }
    pub fn next(self: *TreeNode) ?*TreeNode {
        const cFn = @extern(*const fn (*TreeNode) callconv(.c) ?*TreeNode, .{ .name = "g_tree_node_next" });
        const ret = cFn(self);
        return ret;
    }
    pub fn previous(self: *TreeNode) ?*TreeNode {
        const cFn = @extern(*const fn (*TreeNode) callconv(.c) ?*TreeNode, .{ .name = "g_tree_node_previous" });
        const ret = cFn(self);
        return ret;
    }
    pub fn value(self: *TreeNode) ?*anyopaque {
        const cFn = @extern(*const fn (*TreeNode) callconv(.c) ?*anyopaque, .{ .name = "g_tree_node_value" });
        const ret = cFn(self);
        return ret;
    }
};
pub const Tuples = extern struct {
    len: u32,
    pub fn destroy(self: *Tuples) void {
        const cFn = @extern(*const fn (*Tuples) callconv(.c) void, .{ .name = "g_tuples_destroy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn index(self: *Tuples, arg_index_: i32, arg_field: i32) ?*anyopaque {
        const cFn = @extern(*const fn (*Tuples, i32, i32) callconv(.c) ?*anyopaque, .{ .name = "g_tuples_index" });
        const ret = cFn(self, arg_index_, arg_field);
        return ret;
    }
};
pub const UNICHAR_MAX_DECOMPOSITION_LENGTH = 18;
pub const URI_RESERVED_CHARS_GENERIC_DELIMITERS = ":/?#[]@";
pub const URI_RESERVED_CHARS_SUBCOMPONENT_DELIMITERS = "!$&'()*+,;=";
pub const USEC_PER_SEC = 1000000;
pub const UnicodeBreakType = enum(u32) {
    mandatory = 0,
    carriage_return = 1,
    line_feed = 2,
    combining_mark = 3,
    surrogate = 4,
    zero_width_space = 5,
    inseparable = 6,
    non_breaking_glue = 7,
    contingent = 8,
    space = 9,
    after = 10,
    before = 11,
    before_and_after = 12,
    hyphen = 13,
    non_starter = 14,
    open_punctuation = 15,
    close_punctuation = 16,
    quotation = 17,
    exclamation = 18,
    ideographic = 19,
    numeric = 20,
    infix_separator = 21,
    symbol = 22,
    alphabetic = 23,
    prefix = 24,
    postfix = 25,
    complex_context = 26,
    ambiguous = 27,
    unknown = 28,
    next_line = 29,
    word_joiner = 30,
    hangul_l_jamo = 31,
    hangul_v_jamo = 32,
    hangul_t_jamo = 33,
    hangul_lv_syllable = 34,
    hangul_lvt_syllable = 35,
    close_paranthesis = 36,
    conditional_japanese_starter = 37,
    hebrew_letter = 38,
    regional_indicator = 39,
    emoji_base = 40,
    emoji_modifier = 41,
    zero_width_joiner = 42,
    aksara = 43,
    aksara_pre_base = 44,
    aksara_start = 45,
    virama_final = 46,
    virama = 47,
    pub const close_parenthesis: @This() = @enumFromInt(@as(u32, 36));
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_unicode_break_type_get_type" });
        return cFn();
    }
};
pub const UnicodeScript = enum(i32) {
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
    avestan = 78,
    bamum = 79,
    egyptian_hieroglyphs = 80,
    imperial_aramaic = 81,
    inscriptional_pahlavi = 82,
    inscriptional_parthian = 83,
    javanese = 84,
    kaithi = 85,
    lisu = 86,
    meetei_mayek = 87,
    old_south_arabian = 88,
    old_turkic = 89,
    samaritan = 90,
    tai_tham = 91,
    tai_viet = 92,
    batak = 93,
    brahmi = 94,
    mandaic = 95,
    chakma = 96,
    meroitic_cursive = 97,
    meroitic_hieroglyphs = 98,
    miao = 99,
    sharada = 100,
    sora_sompeng = 101,
    takri = 102,
    bassa_vah = 103,
    caucasian_albanian = 104,
    duployan = 105,
    elbasan = 106,
    grantha = 107,
    khojki = 108,
    khudawadi = 109,
    linear_a = 110,
    mahajani = 111,
    manichaean = 112,
    mende_kikakui = 113,
    modi = 114,
    mro = 115,
    nabataean = 116,
    old_north_arabian = 117,
    old_permic = 118,
    pahawh_hmong = 119,
    palmyrene = 120,
    pau_cin_hau = 121,
    psalter_pahlavi = 122,
    siddham = 123,
    tirhuta = 124,
    warang_citi = 125,
    ahom = 126,
    anatolian_hieroglyphs = 127,
    hatran = 128,
    multani = 129,
    old_hungarian = 130,
    signwriting = 131,
    adlam = 132,
    bhaiksuki = 133,
    marchen = 134,
    newa = 135,
    osage = 136,
    tangut = 137,
    masaram_gondi = 138,
    nushu = 139,
    soyombo = 140,
    zanabazar_square = 141,
    dogra = 142,
    gunjala_gondi = 143,
    hanifi_rohingya = 144,
    makasar = 145,
    medefaidrin = 146,
    old_sogdian = 147,
    sogdian = 148,
    elymaic = 149,
    nandinagari = 150,
    nyiakeng_puachue_hmong = 151,
    wancho = 152,
    chorasmian = 153,
    dives_akuru = 154,
    khitan_small_script = 155,
    yezidi = 156,
    cypro_minoan = 157,
    old_uyghur = 158,
    tangsa = 159,
    toto = 160,
    vithkuqi = 161,
    math = 162,
    kawi = 163,
    nag_mundari = 164,
    todhri = 165,
    garay = 166,
    tulu_tigalari = 167,
    sunuwar = 168,
    gurung_khema = 169,
    kirat_rai = 170,
    ol_onal = 171,
    pub fn fromIso15924(arg_iso15924: u32) UnicodeScript {
        const cFn = @extern(*const fn (u32) callconv(.c) UnicodeScript, .{ .name = "g_unicode_script_from_iso15924" });
        const ret = cFn(arg_iso15924);
        return ret;
    }
    pub fn toIso15924(arg_script: UnicodeScript) u32 {
        const cFn = @extern(*const fn (UnicodeScript) callconv(.c) u32, .{ .name = "g_unicode_script_to_iso15924" });
        const ret = cFn(arg_script);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_unicode_script_get_type" });
        return cFn();
    }
};
pub const UnicodeType = enum(u32) {
    control = 0,
    format = 1,
    unassigned = 2,
    private_use = 3,
    surrogate = 4,
    lowercase_letter = 5,
    modifier_letter = 6,
    other_letter = 7,
    titlecase_letter = 8,
    uppercase_letter = 9,
    spacing_mark = 10,
    enclosing_mark = 11,
    non_spacing_mark = 12,
    decimal_number = 13,
    letter_number = 14,
    other_number = 15,
    connect_punctuation = 16,
    dash_punctuation = 17,
    close_punctuation = 18,
    final_punctuation = 19,
    initial_punctuation = 20,
    other_punctuation = 21,
    open_punctuation = 22,
    currency_symbol = 23,
    modifier_symbol = 24,
    math_symbol = 25,
    other_symbol = 26,
    line_separator = 27,
    paragraph_separator = 28,
    space_separator = 29,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_unicode_type_get_type" });
        return cFn();
    }
};
pub const UnixFDSourceFunc = *const fn (arg_fd: i32, arg_condition: IOCondition, arg_user_data: ?*anyopaque) callconv(.c) bool;
pub const UnixPipe = extern struct {
    fds: [2]i32,
};
pub const UnixPipeEnd = enum(u32) {
    read = 0,
    write = 1,
};
pub const Uri = opaque {
    pub fn getAuthParams(self: *Uri) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Uri) callconv(.c) ?[*:0]u8, .{ .name = "g_uri_get_auth_params" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFlags(self: *Uri) UriFlags {
        const cFn = @extern(*const fn (*Uri) callconv(.c) UriFlags, .{ .name = "g_uri_get_flags" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getFragment(self: *Uri) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Uri) callconv(.c) ?[*:0]u8, .{ .name = "g_uri_get_fragment" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHost(self: *Uri) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Uri) callconv(.c) ?[*:0]u8, .{ .name = "g_uri_get_host" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPassword(self: *Uri) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Uri) callconv(.c) ?[*:0]u8, .{ .name = "g_uri_get_password" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPath(self: *Uri) [*:0]u8 {
        const cFn = @extern(*const fn (*Uri) callconv(.c) [*:0]u8, .{ .name = "g_uri_get_path" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPort(self: *Uri) i32 {
        const cFn = @extern(*const fn (*Uri) callconv(.c) i32, .{ .name = "g_uri_get_port" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getQuery(self: *Uri) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Uri) callconv(.c) ?[*:0]u8, .{ .name = "g_uri_get_query" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getScheme(self: *Uri) [*:0]u8 {
        const cFn = @extern(*const fn (*Uri) callconv(.c) [*:0]u8, .{ .name = "g_uri_get_scheme" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUser(self: *Uri) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Uri) callconv(.c) ?[*:0]u8, .{ .name = "g_uri_get_user" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUserinfo(self: *Uri) ?[*:0]u8 {
        const cFn = @extern(*const fn (*Uri) callconv(.c) ?[*:0]u8, .{ .name = "g_uri_get_userinfo" });
        const ret = cFn(self);
        return ret;
    }
    pub fn parseRelative(self: *Uri, arg_uri_ref: [*:0]const u8, arg_flags: UriFlags, arg_error: *?*GLib.Error) error{GError}!*Uri {
        const cFn = @extern(*const fn (*Uri, [*:0]const u8, UriFlags, *?*GLib.Error) callconv(.c) *Uri, .{ .name = "g_uri_parse_relative" });
        const ret = cFn(self, arg_uri_ref, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn toString(self: *Uri) [*:0]u8 {
        const cFn = @extern(*const fn (*Uri) callconv(.c) [*:0]u8, .{ .name = "g_uri_to_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn toStringPartial(self: *Uri, arg_flags: UriHideFlags) [*:0]u8 {
        const cFn = @extern(*const fn (*Uri, UriHideFlags) callconv(.c) [*:0]u8, .{ .name = "g_uri_to_string_partial" });
        const ret = cFn(self, arg_flags);
        return ret;
    }
    pub fn build(arg_flags: UriFlags, arg_scheme: [*:0]const u8, arg_userinfo: ?[*:0]const u8, arg_host: ?[*:0]const u8, arg_port: i32, arg_path: [*:0]const u8, arg_query: ?[*:0]const u8, arg_fragment: ?[*:0]const u8) *Uri {
        const cFn = @extern(*const fn (UriFlags, [*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, i32, [*:0]const u8, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) *Uri, .{ .name = "g_uri_build" });
        const ret = cFn(arg_flags, arg_scheme, arg_userinfo, arg_host, arg_port, arg_path, arg_query, arg_fragment);
        return ret;
    }
    pub fn buildWithUser(arg_flags: UriFlags, arg_scheme: [*:0]const u8, arg_user: ?[*:0]const u8, arg_password: ?[*:0]const u8, arg_auth_params: ?[*:0]const u8, arg_host: ?[*:0]const u8, arg_port: i32, arg_path: [*:0]const u8, arg_query: ?[*:0]const u8, arg_fragment: ?[*:0]const u8) *Uri {
        const cFn = @extern(*const fn (UriFlags, [*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, i32, [*:0]const u8, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) *Uri, .{ .name = "g_uri_build_with_user" });
        const ret = cFn(arg_flags, arg_scheme, arg_user, arg_password, arg_auth_params, arg_host, arg_port, arg_path, arg_query, arg_fragment);
        return ret;
    }
    pub fn errorQuark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_uri_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn escapeBytes(argS_unescaped: []u8, arg_reserved_chars_allowed: ?[*:0]const u8) [*:0]u8 {
        const arg_unescaped: [*]u8 = @ptrCast(argS_unescaped);
        const arg_length: u64 = @intCast((argS_unescaped).len);
        const cFn = @extern(*const fn ([*]u8, u64, ?[*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_uri_escape_bytes" });
        const ret = cFn(arg_unescaped, arg_length, arg_reserved_chars_allowed);
        return ret;
    }
    pub fn escapeString(arg_unescaped: [*:0]const u8, arg_reserved_chars_allowed: ?[*:0]const u8, arg_allow_utf8: bool) [*:0]u8 {
        const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, bool) callconv(.c) [*:0]u8, .{ .name = "g_uri_escape_string" });
        const ret = cFn(arg_unescaped, arg_reserved_chars_allowed, arg_allow_utf8);
        return ret;
    }
    pub fn isValid(arg_uri_string: [*:0]const u8, arg_flags: UriFlags, arg_error: *?*GLib.Error) error{GError}!bool {
        const cFn = @extern(*const fn ([*:0]const u8, UriFlags, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_uri_is_valid" });
        const ret = cFn(arg_uri_string, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn join(arg_flags: UriFlags, arg_scheme: ?[*:0]const u8, arg_userinfo: ?[*:0]const u8, arg_host: ?[*:0]const u8, arg_port: i32, arg_path: [*:0]const u8, arg_query: ?[*:0]const u8, arg_fragment: ?[*:0]const u8) [*:0]u8 {
        const cFn = @extern(*const fn (UriFlags, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, i32, [*:0]const u8, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_uri_join" });
        const ret = cFn(arg_flags, arg_scheme, arg_userinfo, arg_host, arg_port, arg_path, arg_query, arg_fragment);
        return ret;
    }
    pub fn joinWithUser(arg_flags: UriFlags, arg_scheme: ?[*:0]const u8, arg_user: ?[*:0]const u8, arg_password: ?[*:0]const u8, arg_auth_params: ?[*:0]const u8, arg_host: ?[*:0]const u8, arg_port: i32, arg_path: [*:0]const u8, arg_query: ?[*:0]const u8, arg_fragment: ?[*:0]const u8) [*:0]u8 {
        const cFn = @extern(*const fn (UriFlags, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, i32, [*:0]const u8, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_uri_join_with_user" });
        const ret = cFn(arg_flags, arg_scheme, arg_user, arg_password, arg_auth_params, arg_host, arg_port, arg_path, arg_query, arg_fragment);
        return ret;
    }
    pub fn listExtractUris(arg_uri_list: [*:0]const u8) [*]?[*:0]const u8 {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_uri_list_extract_uris" });
        const ret = cFn(arg_uri_list);
        return ret;
    }
    pub fn parse(arg_uri_string: [*:0]const u8, arg_flags: UriFlags, arg_error: *?*GLib.Error) error{GError}!*Uri {
        const cFn = @extern(*const fn ([*:0]const u8, UriFlags, *?*GLib.Error) callconv(.c) *Uri, .{ .name = "g_uri_parse" });
        const ret = cFn(arg_uri_string, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn parseParams(arg_params: [*:0]const u8, arg_length: i64, arg_separators: [*:0]const u8, arg_flags: UriParamsFlags, arg_error: *?*GLib.Error) error{GError}!*GLib.HashTable {
        const cFn = @extern(*const fn ([*:0]const u8, i64, [*:0]const u8, UriParamsFlags, *?*GLib.Error) callconv(.c) *GLib.HashTable, .{ .name = "g_uri_parse_params" });
        const ret = cFn(arg_params, arg_length, arg_separators, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn parseScheme(arg_uri: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_uri_parse_scheme" });
        const ret = cFn(arg_uri);
        return ret;
    }
    pub fn peekScheme(arg_uri: [*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_uri_peek_scheme" });
        const ret = cFn(arg_uri);
        return ret;
    }
    pub fn resolveRelative(arg_base_uri_string: ?[*:0]const u8, arg_uri_ref: [*:0]const u8, arg_flags: UriFlags, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
        const cFn = @extern(*const fn (?[*:0]const u8, [*:0]const u8, UriFlags, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_uri_resolve_relative" });
        const ret = cFn(arg_base_uri_string, arg_uri_ref, arg_flags, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn split(arg_uri_ref: [*:0]const u8, arg_flags: UriFlags, arg_error: *?*GLib.Error) error{GError}!struct {
        scheme: ?[*:0]u8,
        userinfo: ?[*:0]u8,
        host: ?[*:0]u8,
        port: i32,
        path: [*:0]u8,
        query: ?[*:0]u8,
        fragment: ?[*:0]u8,
    } {
        var argO_scheme: ?[*:0]u8 = undefined;
        const arg_scheme: ?*?[*:0]u8 = &argO_scheme;
        var argO_userinfo: ?[*:0]u8 = undefined;
        const arg_userinfo: ?*?[*:0]u8 = &argO_userinfo;
        var argO_host: ?[*:0]u8 = undefined;
        const arg_host: ?*?[*:0]u8 = &argO_host;
        var argO_port: i32 = undefined;
        const arg_port: ?*i32 = &argO_port;
        var argO_path: ?[*:0]u8 = undefined;
        const arg_path: ?*[*:0]u8 = &argO_path;
        var argO_query: ?[*:0]u8 = undefined;
        const arg_query: ?*?[*:0]u8 = &argO_query;
        var argO_fragment: ?[*:0]u8 = undefined;
        const arg_fragment: ?*?[*:0]u8 = &argO_fragment;
        const cFn = @extern(*const fn ([*:0]const u8, UriFlags, ?*?[*:0]u8, ?*?[*:0]u8, ?*?[*:0]u8, ?*i32, ?*[*:0]u8, ?*?[*:0]u8, ?*?[*:0]u8, *?*GLib.Error) callconv(.c) void, .{ .name = "g_uri_split" });
        const ret = cFn(arg_uri_ref, arg_flags, arg_scheme, arg_userinfo, arg_host, arg_port, arg_path, arg_query, arg_fragment, arg_error);
        _ = ret;
        if (arg_error.* != null) return error.GError;
        return .{ .scheme = argO_scheme, .userinfo = argO_userinfo, .host = argO_host, .port = argO_port, .path = argO_path, .query = argO_query, .fragment = argO_fragment };
    }
    pub fn splitNetwork(arg_uri_string: [*:0]const u8, arg_flags: UriFlags, arg_error: *?*GLib.Error) error{GError}!struct {
        scheme: ?[*:0]u8,
        host: ?[*:0]u8,
        port: i32,
    } {
        var argO_scheme: ?[*:0]u8 = undefined;
        const arg_scheme: ?*?[*:0]u8 = &argO_scheme;
        var argO_host: ?[*:0]u8 = undefined;
        const arg_host: ?*?[*:0]u8 = &argO_host;
        var argO_port: i32 = undefined;
        const arg_port: ?*i32 = &argO_port;
        const cFn = @extern(*const fn ([*:0]const u8, UriFlags, ?*?[*:0]u8, ?*?[*:0]u8, ?*i32, *?*GLib.Error) callconv(.c) void, .{ .name = "g_uri_split_network" });
        const ret = cFn(arg_uri_string, arg_flags, arg_scheme, arg_host, arg_port, arg_error);
        _ = ret;
        if (arg_error.* != null) return error.GError;
        return .{ .scheme = argO_scheme, .host = argO_host, .port = argO_port };
    }
    pub fn splitWithUser(arg_uri_ref: [*:0]const u8, arg_flags: UriFlags, arg_error: *?*GLib.Error) error{GError}!struct {
        scheme: ?[*:0]u8,
        user: ?[*:0]u8,
        password: ?[*:0]u8,
        auth_params: ?[*:0]u8,
        host: ?[*:0]u8,
        port: i32,
        path: [*:0]u8,
        query: ?[*:0]u8,
        fragment: ?[*:0]u8,
    } {
        var argO_scheme: ?[*:0]u8 = undefined;
        const arg_scheme: ?*?[*:0]u8 = &argO_scheme;
        var argO_user: ?[*:0]u8 = undefined;
        const arg_user: ?*?[*:0]u8 = &argO_user;
        var argO_password: ?[*:0]u8 = undefined;
        const arg_password: ?*?[*:0]u8 = &argO_password;
        var argO_auth_params: ?[*:0]u8 = undefined;
        const arg_auth_params: ?*?[*:0]u8 = &argO_auth_params;
        var argO_host: ?[*:0]u8 = undefined;
        const arg_host: ?*?[*:0]u8 = &argO_host;
        var argO_port: i32 = undefined;
        const arg_port: ?*i32 = &argO_port;
        var argO_path: ?[*:0]u8 = undefined;
        const arg_path: ?*[*:0]u8 = &argO_path;
        var argO_query: ?[*:0]u8 = undefined;
        const arg_query: ?*?[*:0]u8 = &argO_query;
        var argO_fragment: ?[*:0]u8 = undefined;
        const arg_fragment: ?*?[*:0]u8 = &argO_fragment;
        const cFn = @extern(*const fn ([*:0]const u8, UriFlags, ?*?[*:0]u8, ?*?[*:0]u8, ?*?[*:0]u8, ?*?[*:0]u8, ?*?[*:0]u8, ?*i32, ?*[*:0]u8, ?*?[*:0]u8, ?*?[*:0]u8, *?*GLib.Error) callconv(.c) void, .{ .name = "g_uri_split_with_user" });
        const ret = cFn(arg_uri_ref, arg_flags, arg_scheme, arg_user, arg_password, arg_auth_params, arg_host, arg_port, arg_path, arg_query, arg_fragment, arg_error);
        _ = ret;
        if (arg_error.* != null) return error.GError;
        return .{ .scheme = argO_scheme, .user = argO_user, .password = argO_password, .auth_params = argO_auth_params, .host = argO_host, .port = argO_port, .path = argO_path, .query = argO_query, .fragment = argO_fragment };
    }
    pub fn unescapeBytes(arg_escaped_string: [*:0]const u8, arg_length: i64, arg_illegal_characters: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*Bytes {
        const cFn = @extern(*const fn ([*:0]const u8, i64, ?[*:0]const u8, *?*GLib.Error) callconv(.c) *Bytes, .{ .name = "g_uri_unescape_bytes" });
        const ret = cFn(arg_escaped_string, arg_length, arg_illegal_characters, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn unescapeSegment(arg_escaped_string: ?[*:0]const u8, arg_escaped_string_end: ?[*:0]const u8, arg_illegal_characters: ?[*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn (?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_uri_unescape_segment" });
        const ret = cFn(arg_escaped_string, arg_escaped_string_end, arg_illegal_characters);
        return ret;
    }
    pub fn unescapeString(arg_escaped_string: [*:0]const u8, arg_illegal_characters: ?[*:0]const u8) ?[*:0]u8 {
        const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_uri_unescape_string" });
        const ret = cFn(arg_escaped_string, arg_illegal_characters);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_uri_get_type" });
        return cFn();
    }
};
pub const UriError = enum(u32) {
    failed = 0,
    bad_scheme = 1,
    bad_user = 2,
    bad_password = 3,
    bad_auth_params = 4,
    bad_host = 5,
    bad_port = 6,
    bad_path = 7,
    bad_query = 8,
    bad_fragment = 9,
};
pub const UriFlags = packed struct(u32) {
    parse_relaxed: bool = false,
    has_password: bool = false,
    has_auth_params: bool = false,
    encoded: bool = false,
    non_dns: bool = false,
    encoded_query: bool = false,
    encoded_path: bool = false,
    encoded_fragment: bool = false,
    scheme_normalize: bool = false,
    _: u23 = 0,
};
pub const UriHideFlags = packed struct(u32) {
    userinfo: bool = false,
    password: bool = false,
    auth_params: bool = false,
    query: bool = false,
    fragment: bool = false,
    _: u27 = 0,
};
pub const UriParamsFlags = packed struct(u32) {
    case_insensitive: bool = false,
    www_form: bool = false,
    parse_relaxed: bool = false,
    _: u29 = 0,
};
pub const UriParamsIter = extern struct {
    dummy0: i32,
    dummy1: ?*anyopaque,
    dummy2: ?*anyopaque,
    dummy3: [256]u8,
    pub fn init(self: *UriParamsIter, arg_params: [*:0]const u8, arg_length: i64, arg_separators: [*:0]const u8, arg_flags: UriParamsFlags) void {
        const cFn = @extern(*const fn (*UriParamsIter, [*:0]const u8, i64, [*:0]const u8, UriParamsFlags) callconv(.c) void, .{ .name = "g_uri_params_iter_init" });
        const ret = cFn(self, arg_params, arg_length, arg_separators, arg_flags);
        return ret;
    }
    pub fn next(self: *UriParamsIter, arg_error: *?*GLib.Error) error{GError}!struct {
        ret: bool,
        attribute: ?[*:0]u8,
        value: ?[*:0]u8,
    } {
        var argO_attribute: ?[*:0]u8 = undefined;
        const arg_attribute: ?*?[*:0]u8 = &argO_attribute;
        var argO_value: ?[*:0]u8 = undefined;
        const arg_value: ?*?[*:0]u8 = &argO_value;
        const cFn = @extern(*const fn (*UriParamsIter, ?*?[*:0]u8, ?*?[*:0]u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_uri_params_iter_next" });
        const ret = cFn(self, arg_attribute, arg_value, arg_error);
        if (arg_error.* != null) return error.GError;
        return .{ .ret = ret, .attribute = argO_attribute, .value = argO_value };
    }
};
pub const UserDirectory = enum(u32) {
    directory_desktop = 0,
    directory_documents = 1,
    directory_download = 2,
    directory_music = 3,
    directory_pictures = 4,
    directory_public_share = 5,
    directory_templates = 6,
    directory_videos = 7,
    n_directories = 8,
};
pub const VA_COPY_AS_ARRAY = 1;
pub const VERSION_MIN_REQUIRED = 2;
pub const Variant = opaque {
    pub fn newArray(arg_child_type: ?*VariantType, argS_children: []*Variant) *Variant {
        const arg_children: ?[*]*Variant = @ptrCast(argS_children);
        const arg_n_children: u64 = @intCast((argS_children).len);
        const cFn = @extern(*const fn (?*VariantType, ?[*]*Variant, u64) callconv(.c) *Variant, .{ .name = "g_variant_new_array" });
        const ret = cFn(arg_child_type, arg_children, arg_n_children);
        return ret;
    }
    pub fn newBoolean(arg_value: bool) *Variant {
        const cFn = @extern(*const fn (bool) callconv(.c) *Variant, .{ .name = "g_variant_new_boolean" });
        const ret = cFn(arg_value);
        return ret;
    }
    pub fn newByte(arg_value: u8) *Variant {
        const cFn = @extern(*const fn (u8) callconv(.c) *Variant, .{ .name = "g_variant_new_byte" });
        const ret = cFn(arg_value);
        return ret;
    }
    pub fn newBytestring(arg_string: [*:0]u8) *Variant {
        const cFn = @extern(*const fn ([*:0]u8) callconv(.c) *Variant, .{ .name = "g_variant_new_bytestring" });
        const ret = cFn(arg_string);
        return ret;
    }
    pub fn newBytestringArray(argS_strv: [][*:0]const u8) *Variant {
        const arg_strv: [*][*:0]const u8 = @ptrCast(argS_strv);
        const arg_length: i64 = @intCast((argS_strv).len);
        const cFn = @extern(*const fn ([*][*:0]const u8, i64) callconv(.c) *Variant, .{ .name = "g_variant_new_bytestring_array" });
        const ret = cFn(arg_strv, arg_length);
        return ret;
    }
    pub fn newDictEntry(arg_key: *Variant, arg_value: *Variant) *Variant {
        const cFn = @extern(*const fn (*Variant, *Variant) callconv(.c) *Variant, .{ .name = "g_variant_new_dict_entry" });
        const ret = cFn(arg_key, arg_value);
        return ret;
    }
    pub fn newDouble(arg_value: f64) *Variant {
        const cFn = @extern(*const fn (f64) callconv(.c) *Variant, .{ .name = "g_variant_new_double" });
        const ret = cFn(arg_value);
        return ret;
    }
    pub fn newFixedArray(arg_element_type: *VariantType, arg_elements: ?*anyopaque, arg_n_elements: u64, arg_element_size: u64) *Variant {
        const cFn = @extern(*const fn (*VariantType, ?*anyopaque, u64, u64) callconv(.c) *Variant, .{ .name = "g_variant_new_fixed_array" });
        const ret = cFn(arg_element_type, @ptrCast(arg_elements), arg_n_elements, arg_element_size);
        return ret;
    }
    pub fn newFromBytes(arg_type: *VariantType, arg_bytes: *Bytes, arg_trusted: bool) *Variant {
        const cFn = @extern(*const fn (*VariantType, *Bytes, bool) callconv(.c) *Variant, .{ .name = "g_variant_new_from_bytes" });
        const ret = cFn(arg_type, arg_bytes, arg_trusted);
        return ret;
    }
    pub fn newFromData(arg_type: *VariantType, argS_data: []u8, arg_trusted: bool, arg_notify: DestroyNotify, arg_user_data: ?*anyopaque) *Variant {
        const arg_data: [*]u8 = @ptrCast(argS_data);
        const arg_size: u64 = @intCast((argS_data).len);
        const cFn = @extern(*const fn (*VariantType, [*]u8, u64, bool, DestroyNotify, ?*anyopaque) callconv(.c) *Variant, .{ .name = "g_variant_new_from_data" });
        const ret = cFn(arg_type, arg_data, arg_size, arg_trusted, arg_notify, @ptrCast(arg_user_data));
        return ret;
    }
    pub fn newHandle(arg_value: i32) *Variant {
        const cFn = @extern(*const fn (i32) callconv(.c) *Variant, .{ .name = "g_variant_new_handle" });
        const ret = cFn(arg_value);
        return ret;
    }
    pub fn newInt16(arg_value: i16) *Variant {
        const cFn = @extern(*const fn (i16) callconv(.c) *Variant, .{ .name = "g_variant_new_int16" });
        const ret = cFn(arg_value);
        return ret;
    }
    pub fn newInt32(arg_value: i32) *Variant {
        const cFn = @extern(*const fn (i32) callconv(.c) *Variant, .{ .name = "g_variant_new_int32" });
        const ret = cFn(arg_value);
        return ret;
    }
    pub fn newInt64(arg_value: i64) *Variant {
        const cFn = @extern(*const fn (i64) callconv(.c) *Variant, .{ .name = "g_variant_new_int64" });
        const ret = cFn(arg_value);
        return ret;
    }
    pub fn newMaybe(arg_child_type: ?*VariantType, arg_child: ?*Variant) *Variant {
        const cFn = @extern(*const fn (?*VariantType, ?*Variant) callconv(.c) *Variant, .{ .name = "g_variant_new_maybe" });
        const ret = cFn(arg_child_type, arg_child);
        return ret;
    }
    pub fn newObjectPath(arg_object_path: [*:0]const u8) *Variant {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *Variant, .{ .name = "g_variant_new_object_path" });
        const ret = cFn(arg_object_path);
        return ret;
    }
    pub fn newObjv(argS_strv: [][*:0]const u8) *Variant {
        const arg_strv: [*][*:0]const u8 = @ptrCast(argS_strv);
        const arg_length: i64 = @intCast((argS_strv).len);
        const cFn = @extern(*const fn ([*][*:0]const u8, i64) callconv(.c) *Variant, .{ .name = "g_variant_new_objv" });
        const ret = cFn(arg_strv, arg_length);
        return ret;
    }
    pub fn newSignature(arg_signature: [*:0]const u8) *Variant {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *Variant, .{ .name = "g_variant_new_signature" });
        const ret = cFn(arg_signature);
        return ret;
    }
    pub fn newString(arg_string: [*:0]const u8) *Variant {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *Variant, .{ .name = "g_variant_new_string" });
        const ret = cFn(arg_string);
        return ret;
    }
    pub fn newStrv(argS_strv: [][*:0]const u8) *Variant {
        const arg_strv: [*][*:0]const u8 = @ptrCast(argS_strv);
        const arg_length: i64 = @intCast((argS_strv).len);
        const cFn = @extern(*const fn ([*][*:0]const u8, i64) callconv(.c) *Variant, .{ .name = "g_variant_new_strv" });
        const ret = cFn(arg_strv, arg_length);
        return ret;
    }
    pub fn newTuple(argS_children: []*Variant) *Variant {
        const arg_children: [*]*Variant = @ptrCast(argS_children);
        const arg_n_children: u64 = @intCast((argS_children).len);
        const cFn = @extern(*const fn ([*]*Variant, u64) callconv(.c) *Variant, .{ .name = "g_variant_new_tuple" });
        const ret = cFn(arg_children, arg_n_children);
        return ret;
    }
    pub fn newUint16(arg_value: u16) *Variant {
        const cFn = @extern(*const fn (u16) callconv(.c) *Variant, .{ .name = "g_variant_new_uint16" });
        const ret = cFn(arg_value);
        return ret;
    }
    pub fn newUint32(arg_value: u32) *Variant {
        const cFn = @extern(*const fn (u32) callconv(.c) *Variant, .{ .name = "g_variant_new_uint32" });
        const ret = cFn(arg_value);
        return ret;
    }
    pub fn newUint64(arg_value: u64) *Variant {
        const cFn = @extern(*const fn (u64) callconv(.c) *Variant, .{ .name = "g_variant_new_uint64" });
        const ret = cFn(arg_value);
        return ret;
    }
    pub fn newVariant(arg_value: *Variant) *Variant {
        const cFn = @extern(*const fn (*Variant) callconv(.c) *Variant, .{ .name = "g_variant_new_variant" });
        const ret = cFn(arg_value);
        return ret;
    }
    pub fn byteswap(self: *Variant) *Variant {
        const cFn = @extern(*const fn (*Variant) callconv(.c) *Variant, .{ .name = "g_variant_byteswap" });
        const ret = cFn(self);
        return ret;
    }
    pub fn checkFormatString(self: *Variant, arg_format_string: [*:0]const u8, arg_copy_only: bool) bool {
        const cFn = @extern(*const fn (*Variant, [*:0]const u8, bool) callconv(.c) bool, .{ .name = "g_variant_check_format_string" });
        const ret = cFn(self, arg_format_string, arg_copy_only);
        return ret;
    }
    pub fn classify(self: *Variant) VariantClass {
        const cFn = @extern(*const fn (*Variant) callconv(.c) VariantClass, .{ .name = "g_variant_classify" });
        const ret = cFn(self);
        return ret;
    }
    pub fn compare(self: *Variant, arg_two: *Variant) i32 {
        const cFn = @extern(*const fn (*Variant, *Variant) callconv(.c) i32, .{ .name = "g_variant_compare" });
        const ret = cFn(self, arg_two);
        return ret;
    }
    pub fn dupBytestring(self: *Variant) []u8 {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*Variant, ?*u64) callconv(.c) [*:0]u8, .{ .name = "g_variant_dup_bytestring" });
        const ret = cFn(self, arg_length);
        return ret[0..@intCast(argO_length)];
    }
    pub fn dupBytestringArray(self: *Variant) [][*:0]const u8 {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*Variant, ?*u64) callconv(.c) [*][*:0]const u8, .{ .name = "g_variant_dup_bytestring_array" });
        const ret = cFn(self, arg_length);
        return ret[0..@intCast(argO_length)];
    }
    pub fn dupObjv(self: *Variant) [][*:0]const u8 {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*Variant, ?*u64) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_variant_dup_objv" });
        const ret = cFn(self, arg_length);
        return ret[0..@intCast(argO_length)];
    }
    pub fn dupString(self: *Variant) struct {
        ret: [*:0]u8,
        length: u64,
    } {
        var argO_length: u64 = undefined;
        const arg_length: *u64 = &argO_length;
        const cFn = @extern(*const fn (*Variant, *u64) callconv(.c) [*:0]u8, .{ .name = "g_variant_dup_string" });
        const ret = cFn(self, arg_length);
        return .{ .ret = ret, .length = argO_length };
    }
    pub fn dupStrv(self: *Variant) [][*:0]const u8 {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*Variant, ?*u64) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_variant_dup_strv" });
        const ret = cFn(self, arg_length);
        return ret[0..@intCast(argO_length)];
    }
    pub fn equal(self: *Variant, arg_two: *Variant) bool {
        const cFn = @extern(*const fn (*Variant, *Variant) callconv(.c) bool, .{ .name = "g_variant_equal" });
        const ret = cFn(self, arg_two);
        return ret;
    }
    pub fn getBoolean(self: *Variant) bool {
        const cFn = @extern(*const fn (*Variant) callconv(.c) bool, .{ .name = "g_variant_get_boolean" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getByte(self: *Variant) u8 {
        const cFn = @extern(*const fn (*Variant) callconv(.c) u8, .{ .name = "g_variant_get_byte" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBytestring(self: *Variant) [*:0]u8 {
        const cFn = @extern(*const fn (*Variant) callconv(.c) [*:0]u8, .{ .name = "g_variant_get_bytestring" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBytestringArray(self: *Variant) [][*:0]const u8 {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*Variant, ?*u64) callconv(.c) [*][*:0]const u8, .{ .name = "g_variant_get_bytestring_array" });
        const ret = cFn(self, arg_length);
        return ret[0..@intCast(argO_length)];
    }
    pub fn getChildValue(self: *Variant, arg_index_: u64) *Variant {
        const cFn = @extern(*const fn (*Variant, u64) callconv(.c) *Variant, .{ .name = "g_variant_get_child_value" });
        const ret = cFn(self, arg_index_);
        return ret;
    }
    pub fn getData(self: *Variant) ?*anyopaque {
        const cFn = @extern(*const fn (*Variant) callconv(.c) ?*anyopaque, .{ .name = "g_variant_get_data" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDataAsBytes(self: *Variant) *Bytes {
        const cFn = @extern(*const fn (*Variant) callconv(.c) *Bytes, .{ .name = "g_variant_get_data_as_bytes" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getDouble(self: *Variant) f64 {
        const cFn = @extern(*const fn (*Variant) callconv(.c) f64, .{ .name = "g_variant_get_double" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHandle(self: *Variant) i32 {
        const cFn = @extern(*const fn (*Variant) callconv(.c) i32, .{ .name = "g_variant_get_handle" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInt16(self: *Variant) i16 {
        const cFn = @extern(*const fn (*Variant) callconv(.c) i16, .{ .name = "g_variant_get_int16" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInt32(self: *Variant) i32 {
        const cFn = @extern(*const fn (*Variant) callconv(.c) i32, .{ .name = "g_variant_get_int32" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getInt64(self: *Variant) i64 {
        const cFn = @extern(*const fn (*Variant) callconv(.c) i64, .{ .name = "g_variant_get_int64" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMaybe(self: *Variant) ?*Variant {
        const cFn = @extern(*const fn (*Variant) callconv(.c) ?*Variant, .{ .name = "g_variant_get_maybe" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNormalForm(self: *Variant) *Variant {
        const cFn = @extern(*const fn (*Variant) callconv(.c) *Variant, .{ .name = "g_variant_get_normal_form" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getObjv(self: *Variant) [][*:0]const u8 {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*Variant, ?*u64) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_variant_get_objv" });
        const ret = cFn(self, arg_length);
        return ret[0..@intCast(argO_length)];
    }
    pub fn getSize(self: *Variant) u64 {
        const cFn = @extern(*const fn (*Variant) callconv(.c) u64, .{ .name = "g_variant_get_size" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getString(self: *Variant) struct {
        ret: [*:0]u8,
        length: u64,
    } {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*Variant, ?*u64) callconv(.c) [*:0]u8, .{ .name = "g_variant_get_string" });
        const ret = cFn(self, arg_length);
        return .{ .ret = ret, .length = argO_length };
    }
    pub fn getStrv(self: *Variant) [][*:0]const u8 {
        var argO_length: u64 = undefined;
        const arg_length: ?*u64 = &argO_length;
        const cFn = @extern(*const fn (*Variant, ?*u64) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_variant_get_strv" });
        const ret = cFn(self, arg_length);
        return ret[0..@intCast(argO_length)];
    }
    pub fn getType(self: *Variant) *VariantType {
        const cFn = @extern(*const fn (*Variant) callconv(.c) *VariantType, .{ .name = "g_variant_get_type" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTypeString(self: *Variant) [*:0]u8 {
        const cFn = @extern(*const fn (*Variant) callconv(.c) [*:0]u8, .{ .name = "g_variant_get_type_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUint16(self: *Variant) u16 {
        const cFn = @extern(*const fn (*Variant) callconv(.c) u16, .{ .name = "g_variant_get_uint16" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUint32(self: *Variant) u32 {
        const cFn = @extern(*const fn (*Variant) callconv(.c) u32, .{ .name = "g_variant_get_uint32" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getUint64(self: *Variant) u64 {
        const cFn = @extern(*const fn (*Variant) callconv(.c) u64, .{ .name = "g_variant_get_uint64" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getVariant(self: *Variant) *Variant {
        const cFn = @extern(*const fn (*Variant) callconv(.c) *Variant, .{ .name = "g_variant_get_variant" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hash(self: *Variant) u32 {
        const cFn = @extern(*const fn (*Variant) callconv(.c) u32, .{ .name = "g_variant_hash" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isContainer(self: *Variant) bool {
        const cFn = @extern(*const fn (*Variant) callconv(.c) bool, .{ .name = "g_variant_is_container" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isFloating(self: *Variant) bool {
        const cFn = @extern(*const fn (*Variant) callconv(.c) bool, .{ .name = "g_variant_is_floating" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isNormalForm(self: *Variant) bool {
        const cFn = @extern(*const fn (*Variant) callconv(.c) bool, .{ .name = "g_variant_is_normal_form" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isOfType(self: *Variant, arg_type: *VariantType) bool {
        const cFn = @extern(*const fn (*Variant, *VariantType) callconv(.c) bool, .{ .name = "g_variant_is_of_type" });
        const ret = cFn(self, arg_type);
        return ret;
    }
    pub fn lookupValue(self: *Variant, arg_key: [*:0]const u8, arg_expected_type: ?*VariantType) *Variant {
        const cFn = @extern(*const fn (*Variant, [*:0]const u8, ?*VariantType) callconv(.c) *Variant, .{ .name = "g_variant_lookup_value" });
        const ret = cFn(self, arg_key, arg_expected_type);
        return ret;
    }
    pub fn nChildren(self: *Variant) u64 {
        const cFn = @extern(*const fn (*Variant) callconv(.c) u64, .{ .name = "g_variant_n_children" });
        const ret = cFn(self);
        return ret;
    }
    pub fn print(self: *Variant, arg_type_annotate: bool) [*:0]u8 {
        const cFn = @extern(*const fn (*Variant, bool) callconv(.c) [*:0]u8, .{ .name = "g_variant_print" });
        const ret = cFn(self, arg_type_annotate);
        return ret;
    }
    pub fn ref(self: *Variant) *Variant {
        const cFn = @extern(*const fn (*Variant) callconv(.c) *Variant, .{ .name = "g_variant_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn refSink(self: *Variant) *Variant {
        const cFn = @extern(*const fn (*Variant) callconv(.c) *Variant, .{ .name = "g_variant_ref_sink" });
        const ret = cFn(self);
        return ret;
    }
    pub fn store(self: *Variant, arg_data: *anyopaque) void {
        const cFn = @extern(*const fn (*Variant, *anyopaque) callconv(.c) void, .{ .name = "g_variant_store" });
        const ret = cFn(self, @ptrCast(arg_data));
        return ret;
    }
    pub fn takeRef(self: *Variant) *Variant {
        const cFn = @extern(*const fn (*Variant) callconv(.c) *Variant, .{ .name = "g_variant_take_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *Variant) void {
        const cFn = @extern(*const fn (*Variant) callconv(.c) void, .{ .name = "g_variant_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isObjectPath(arg_string: [*:0]const u8) bool {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_variant_is_object_path" });
        const ret = cFn(arg_string);
        return ret;
    }
    pub fn isSignature(arg_string: [*:0]const u8) bool {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_variant_is_signature" });
        const ret = cFn(arg_string);
        return ret;
    }
    pub fn parse(arg_type: ?*VariantType, arg_text: [*:0]const u8, arg_limit: ?[*:0]const u8, arg_endptr: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*Variant {
        const cFn = @extern(*const fn (?*VariantType, [*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, *?*GLib.Error) callconv(.c) *Variant, .{ .name = "g_variant_parse" });
        const ret = cFn(arg_type, arg_text, arg_limit, arg_endptr, arg_error);
        if (arg_error.* != null) return error.GError;
        return ret;
    }
    pub fn parseErrorPrintContext(arg_error: *GLib.Error, arg_source_str: [*:0]const u8) [*:0]u8 {
        const cFn = @extern(*const fn (*GLib.Error, [*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_variant_parse_error_print_context" });
        const ret = cFn(arg_error, arg_source_str);
        return ret;
    }
    pub fn parseErrorQuark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_variant_parse_error_quark" });
        const ret = cFn();
        return ret;
    }
    pub fn parserGetErrorQuark() u32 {
        const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_variant_parser_get_error_quark" });
        const ret = cFn();
        return ret;
    }
};
pub const VariantBuilder = opaque {
    pub fn new(arg_type: *VariantType) *VariantBuilder {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) *VariantBuilder, .{ .name = "g_variant_builder_new" });
        const ret = cFn(arg_type);
        return ret;
    }
    pub fn addValue(self: *VariantBuilder, arg_value: *Variant) void {
        const cFn = @extern(*const fn (*VariantBuilder, *Variant) callconv(.c) void, .{ .name = "g_variant_builder_add_value" });
        const ret = cFn(self, arg_value);
        return ret;
    }
    pub fn close(self: *VariantBuilder) void {
        const cFn = @extern(*const fn (*VariantBuilder) callconv(.c) void, .{ .name = "g_variant_builder_close" });
        const ret = cFn(self);
        return ret;
    }
    pub fn end(self: *VariantBuilder) *Variant {
        const cFn = @extern(*const fn (*VariantBuilder) callconv(.c) *Variant, .{ .name = "g_variant_builder_end" });
        const ret = cFn(self);
        return ret;
    }
    pub fn open(self: *VariantBuilder, arg_type: *VariantType) void {
        const cFn = @extern(*const fn (*VariantBuilder, *VariantType) callconv(.c) void, .{ .name = "g_variant_builder_open" });
        const ret = cFn(self, arg_type);
        return ret;
    }
    pub fn ref(self: *VariantBuilder) *VariantBuilder {
        const cFn = @extern(*const fn (*VariantBuilder) callconv(.c) *VariantBuilder, .{ .name = "g_variant_builder_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn unref(self: *VariantBuilder) void {
        const cFn = @extern(*const fn (*VariantBuilder) callconv(.c) void, .{ .name = "g_variant_builder_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_variant_builder_get_type" });
        return cFn();
    }
};
pub const VariantClass = enum(u32) {
    boolean = 98,
    byte = 121,
    int16 = 110,
    uint16 = 113,
    int32 = 105,
    uint32 = 117,
    int64 = 120,
    uint64 = 116,
    handle = 104,
    double = 100,
    string = 115,
    object_path = 111,
    signature = 103,
    variant = 118,
    maybe = 109,
    array = 97,
    tuple = 40,
    dict_entry = 123,
};
pub const VariantDict = opaque {
    pub fn new(arg_from_asv: ?*Variant) *VariantDict {
        const cFn = @extern(*const fn (?*Variant) callconv(.c) *VariantDict, .{ .name = "g_variant_dict_new" });
        const ret = cFn(arg_from_asv);
        return ret;
    }
    pub fn clear(self: *VariantDict) void {
        const cFn = @extern(*const fn (*VariantDict) callconv(.c) void, .{ .name = "g_variant_dict_clear" });
        const ret = cFn(self);
        return ret;
    }
    pub fn contains(self: *VariantDict, arg_key: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*VariantDict, [*:0]const u8) callconv(.c) bool, .{ .name = "g_variant_dict_contains" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn end(self: *VariantDict) *Variant {
        const cFn = @extern(*const fn (*VariantDict) callconv(.c) *Variant, .{ .name = "g_variant_dict_end" });
        const ret = cFn(self);
        return ret;
    }
    pub fn insertValue(self: *VariantDict, arg_key: [*:0]const u8, arg_value: *Variant) void {
        const cFn = @extern(*const fn (*VariantDict, [*:0]const u8, *Variant) callconv(.c) void, .{ .name = "g_variant_dict_insert_value" });
        const ret = cFn(self, arg_key, arg_value);
        return ret;
    }
    pub fn lookupValue(self: *VariantDict, arg_key: [*:0]const u8, arg_expected_type: ?*VariantType) ?*Variant {
        const cFn = @extern(*const fn (*VariantDict, [*:0]const u8, ?*VariantType) callconv(.c) ?*Variant, .{ .name = "g_variant_dict_lookup_value" });
        const ret = cFn(self, arg_key, arg_expected_type);
        return ret;
    }
    pub fn ref(self: *VariantDict) *VariantDict {
        const cFn = @extern(*const fn (*VariantDict) callconv(.c) *VariantDict, .{ .name = "g_variant_dict_ref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn remove(self: *VariantDict, arg_key: [*:0]const u8) bool {
        const cFn = @extern(*const fn (*VariantDict, [*:0]const u8) callconv(.c) bool, .{ .name = "g_variant_dict_remove" });
        const ret = cFn(self, arg_key);
        return ret;
    }
    pub fn unref(self: *VariantDict) void {
        const cFn = @extern(*const fn (*VariantDict) callconv(.c) void, .{ .name = "g_variant_dict_unref" });
        const ret = cFn(self);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_variant_dict_get_type" });
        return cFn();
    }
};
pub const VariantParseError = enum(u32) {
    failed = 0,
    basic_type_expected = 1,
    cannot_infer_type = 2,
    definite_type_expected = 3,
    input_not_at_end = 4,
    invalid_character = 5,
    invalid_format_string = 6,
    invalid_object_path = 7,
    invalid_signature = 8,
    invalid_type_string = 9,
    no_common_type = 10,
    number_out_of_range = 11,
    number_too_big = 12,
    type_error = 13,
    unexpected_token = 14,
    unknown_keyword = 15,
    unterminated_string_constant = 16,
    value_expected = 17,
    recursion = 18,
};
pub const VariantType = opaque {
    pub fn new(arg_type_string: [*:0]const u8) *VariantType {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *VariantType, .{ .name = "g_variant_type_new" });
        const ret = cFn(arg_type_string);
        return ret;
    }
    pub fn newArray(arg_element: *VariantType) *VariantType {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) *VariantType, .{ .name = "g_variant_type_new_array" });
        const ret = cFn(arg_element);
        return ret;
    }
    pub fn newDictEntry(arg_key: *VariantType, arg_value: *VariantType) *VariantType {
        const cFn = @extern(*const fn (*VariantType, *VariantType) callconv(.c) *VariantType, .{ .name = "g_variant_type_new_dict_entry" });
        const ret = cFn(arg_key, arg_value);
        return ret;
    }
    pub fn newMaybe(arg_element: *VariantType) *VariantType {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) *VariantType, .{ .name = "g_variant_type_new_maybe" });
        const ret = cFn(arg_element);
        return ret;
    }
    pub fn newTuple(argS_items: []*VariantType) *VariantType {
        const arg_items: [*]*VariantType = @ptrCast(argS_items);
        const arg_length: i32 = @intCast((argS_items).len);
        const cFn = @extern(*const fn ([*]*VariantType, i32) callconv(.c) *VariantType, .{ .name = "g_variant_type_new_tuple" });
        const ret = cFn(arg_items, arg_length);
        return ret;
    }
    pub fn copy(self: *VariantType) *VariantType {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) *VariantType, .{ .name = "g_variant_type_copy" });
        const ret = cFn(self);
        return ret;
    }
    pub fn dupString(self: *VariantType) [*:0]u8 {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) [*:0]u8, .{ .name = "g_variant_type_dup_string" });
        const ret = cFn(self);
        return ret;
    }
    pub fn element(self: *VariantType) *VariantType {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) *VariantType, .{ .name = "g_variant_type_element" });
        const ret = cFn(self);
        return ret;
    }
    pub fn equal(self: *VariantType, arg_type2: *VariantType) bool {
        const cFn = @extern(*const fn (*VariantType, *VariantType) callconv(.c) bool, .{ .name = "g_variant_type_equal" });
        const ret = cFn(self, arg_type2);
        return ret;
    }
    pub fn first(self: *VariantType) ?*VariantType {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) ?*VariantType, .{ .name = "g_variant_type_first" });
        const ret = cFn(self);
        return ret;
    }
    pub fn free(self: *VariantType) void {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) void, .{ .name = "g_variant_type_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getStringLength(self: *VariantType) u64 {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) u64, .{ .name = "g_variant_type_get_string_length" });
        const ret = cFn(self);
        return ret;
    }
    pub fn hash(self: *VariantType) u32 {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) u32, .{ .name = "g_variant_type_hash" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isArray(self: *VariantType) bool {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) bool, .{ .name = "g_variant_type_is_array" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isBasic(self: *VariantType) bool {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) bool, .{ .name = "g_variant_type_is_basic" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isContainer(self: *VariantType) bool {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) bool, .{ .name = "g_variant_type_is_container" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isDefinite(self: *VariantType) bool {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) bool, .{ .name = "g_variant_type_is_definite" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isDictEntry(self: *VariantType) bool {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) bool, .{ .name = "g_variant_type_is_dict_entry" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isMaybe(self: *VariantType) bool {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) bool, .{ .name = "g_variant_type_is_maybe" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isSubtypeOf(self: *VariantType, arg_supertype: *VariantType) bool {
        const cFn = @extern(*const fn (*VariantType, *VariantType) callconv(.c) bool, .{ .name = "g_variant_type_is_subtype_of" });
        const ret = cFn(self, arg_supertype);
        return ret;
    }
    pub fn isTuple(self: *VariantType) bool {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) bool, .{ .name = "g_variant_type_is_tuple" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isVariant(self: *VariantType) bool {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) bool, .{ .name = "g_variant_type_is_variant" });
        const ret = cFn(self);
        return ret;
    }
    pub fn key(self: *VariantType) *VariantType {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) *VariantType, .{ .name = "g_variant_type_key" });
        const ret = cFn(self);
        return ret;
    }
    pub fn nItems(self: *VariantType) u64 {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) u64, .{ .name = "g_variant_type_n_items" });
        const ret = cFn(self);
        return ret;
    }
    pub fn next(self: *VariantType) ?*VariantType {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) ?*VariantType, .{ .name = "g_variant_type_next" });
        const ret = cFn(self);
        return ret;
    }
    pub fn value(self: *VariantType) *VariantType {
        const cFn = @extern(*const fn (*VariantType) callconv(.c) *VariantType, .{ .name = "g_variant_type_value" });
        const ret = cFn(self);
        return ret;
    }
    pub fn checked(arg_type_string: [*:0]const u8) *VariantType {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *VariantType, .{ .name = "g_variant_type_checked_" });
        const ret = cFn(arg_type_string);
        return ret;
    }
    pub fn stringGetDepth(arg_type_string: [*:0]const u8) u64 {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) u64, .{ .name = "g_variant_type_string_get_depth_" });
        const ret = cFn(arg_type_string);
        return ret;
    }
    pub fn stringIsValid(arg_type_string: [*:0]const u8) bool {
        const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_variant_type_string_is_valid" });
        const ret = cFn(arg_type_string);
        return ret;
    }
    pub fn stringScan(arg_string: [*:0]const u8, arg_limit: ?[*:0]const u8) struct {
        ret: bool,
        endptr: [*:0]u8,
    } {
        var argO_endptr: ?[*:0]u8 = undefined;
        const arg_endptr: ?*[*:0]u8 = &argO_endptr;
        const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?*[*:0]u8) callconv(.c) bool, .{ .name = "g_variant_type_string_scan" });
        const ret = cFn(arg_string, arg_limit, arg_endptr);
        return .{ .ret = ret, .endptr = argO_endptr };
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_variant_type_get_gtype" });
        return cFn();
    }
};
pub const VoidFunc = *const fn () callconv(.c) void;
pub const WIN32_MSG_HANDLE = 19981206;
pub fn access(arg_filename: [*:0]const u8, arg_mode: i32) i32 {
    const cFn = @extern(*const fn ([*:0]const u8, i32) callconv(.c) i32, .{ .name = "g_access" });
    const ret = cFn(arg_filename, arg_mode);
    return ret;
}
pub fn alignedAlloc(arg_n_blocks: u64, arg_n_block_bytes: u64, arg_alignment: u64) ?*anyopaque {
    const cFn = @extern(*const fn (u64, u64, u64) callconv(.c) ?*anyopaque, .{ .name = "g_aligned_alloc" });
    const ret = cFn(arg_n_blocks, arg_n_block_bytes, arg_alignment);
    return ret;
}
pub fn alignedAlloc0(arg_n_blocks: u64, arg_n_block_bytes: u64, arg_alignment: u64) ?*anyopaque {
    const cFn = @extern(*const fn (u64, u64, u64) callconv(.c) ?*anyopaque, .{ .name = "g_aligned_alloc0" });
    const ret = cFn(arg_n_blocks, arg_n_block_bytes, arg_alignment);
    return ret;
}
pub fn alignedFree(arg_mem: ?*anyopaque) void {
    const cFn = @extern(*const fn (?*anyopaque) callconv(.c) void, .{ .name = "g_aligned_free" });
    const ret = cFn(@ptrCast(arg_mem));
    return ret;
}
pub fn alignedFreeSized(arg_mem: ?*anyopaque, arg_alignment: u64, arg_size: u64) void {
    const cFn = @extern(*const fn (?*anyopaque, u64, u64) callconv(.c) void, .{ .name = "g_aligned_free_sized" });
    const ret = cFn(@ptrCast(arg_mem), arg_alignment, arg_size);
    return ret;
}
pub fn asciiDigitValue(arg_c: i8) i32 {
    const cFn = @extern(*const fn (i8) callconv(.c) i32, .{ .name = "g_ascii_digit_value" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn asciiDtostr(arg_buffer: [*:0]const u8, arg_buf_len: i32, arg_d: f64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i32, f64) callconv(.c) [*:0]u8, .{ .name = "g_ascii_dtostr" });
    const ret = cFn(arg_buffer, arg_buf_len, arg_d);
    return ret;
}
pub fn asciiFormatd(arg_buffer: [*:0]const u8, arg_buf_len: i32, arg_format: [*:0]const u8, arg_d: f64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i32, [*:0]const u8, f64) callconv(.c) [*:0]u8, .{ .name = "g_ascii_formatd" });
    const ret = cFn(arg_buffer, arg_buf_len, arg_format, arg_d);
    return ret;
}
pub fn asciiStrcasecmp(arg_s1: [*:0]const u8, arg_s2: [*:0]const u8) i32 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) i32, .{ .name = "g_ascii_strcasecmp" });
    const ret = cFn(arg_s1, arg_s2);
    return ret;
}
pub fn asciiStrdown(arg_str: [*:0]const u8, arg_len: i64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64) callconv(.c) [*:0]u8, .{ .name = "g_ascii_strdown" });
    const ret = cFn(arg_str, arg_len);
    return ret;
}
pub fn asciiStringToSigned(arg_str: [*:0]const u8, arg_base: u32, arg_min: i64, arg_max: i64, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    out_num: i64,
} {
    var argO_out_num: i64 = undefined;
    const arg_out_num: ?*i64 = &argO_out_num;
    const cFn = @extern(*const fn ([*:0]const u8, u32, i64, i64, ?*i64, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_ascii_string_to_signed" });
    const ret = cFn(arg_str, arg_base, arg_min, arg_max, arg_out_num, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .out_num = argO_out_num };
}
pub fn asciiStringToUnsigned(arg_str: [*:0]const u8, arg_base: u32, arg_min: u64, arg_max: u64, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    out_num: u64,
} {
    var argO_out_num: u64 = undefined;
    const arg_out_num: ?*u64 = &argO_out_num;
    const cFn = @extern(*const fn ([*:0]const u8, u32, u64, u64, ?*u64, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_ascii_string_to_unsigned" });
    const ret = cFn(arg_str, arg_base, arg_min, arg_max, arg_out_num, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .out_num = argO_out_num };
}
pub fn asciiStrncasecmp(arg_s1: [*:0]const u8, arg_s2: [*:0]const u8, arg_n: u64) i32 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, u64) callconv(.c) i32, .{ .name = "g_ascii_strncasecmp" });
    const ret = cFn(arg_s1, arg_s2, arg_n);
    return ret;
}
pub fn asciiStrtod(arg_nptr: [*:0]const u8) struct {
    ret: f64,
    endptr: [*:0]u8,
} {
    var argO_endptr: ?[*:0]u8 = undefined;
    const arg_endptr: ?*[*:0]u8 = &argO_endptr;
    const cFn = @extern(*const fn ([*:0]const u8, ?*[*:0]u8) callconv(.c) f64, .{ .name = "g_ascii_strtod" });
    const ret = cFn(arg_nptr, arg_endptr);
    return .{ .ret = ret, .endptr = argO_endptr };
}
pub fn asciiStrtoll(arg_nptr: [*:0]const u8, arg_base: u32) struct {
    ret: i64,
    endptr: [*:0]u8,
} {
    var argO_endptr: ?[*:0]u8 = undefined;
    const arg_endptr: ?*[*:0]u8 = &argO_endptr;
    const cFn = @extern(*const fn ([*:0]const u8, ?*[*:0]u8, u32) callconv(.c) i64, .{ .name = "g_ascii_strtoll" });
    const ret = cFn(arg_nptr, arg_endptr, arg_base);
    return .{ .ret = ret, .endptr = argO_endptr };
}
pub fn asciiStrtoull(arg_nptr: [*:0]const u8, arg_base: u32) struct {
    ret: u64,
    endptr: [*:0]u8,
} {
    var argO_endptr: ?[*:0]u8 = undefined;
    const arg_endptr: ?*[*:0]u8 = &argO_endptr;
    const cFn = @extern(*const fn ([*:0]const u8, ?*[*:0]u8, u32) callconv(.c) u64, .{ .name = "g_ascii_strtoull" });
    const ret = cFn(arg_nptr, arg_endptr, arg_base);
    return .{ .ret = ret, .endptr = argO_endptr };
}
pub fn asciiStrup(arg_str: [*:0]const u8, arg_len: i64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64) callconv(.c) [*:0]u8, .{ .name = "g_ascii_strup" });
    const ret = cFn(arg_str, arg_len);
    return ret;
}
pub fn asciiTolower(arg_c: i8) i8 {
    const cFn = @extern(*const fn (i8) callconv(.c) i8, .{ .name = "g_ascii_tolower" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn asciiToupper(arg_c: i8) i8 {
    const cFn = @extern(*const fn (i8) callconv(.c) i8, .{ .name = "g_ascii_toupper" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn asciiXdigitValue(arg_c: i8) i32 {
    const cFn = @extern(*const fn (i8) callconv(.c) i32, .{ .name = "g_ascii_xdigit_value" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn assertWarning(arg_log_domain: [*:0]const u8, arg_file: [*:0]const u8, arg_line: i32, arg_pretty_function: [*:0]const u8, arg_expression: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, i32, [*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_assert_warning" });
    const ret = cFn(arg_log_domain, arg_file, arg_line, arg_pretty_function, arg_expression);
    return ret;
}
pub fn assertionMessage(arg_domain: [*:0]const u8, arg_file: [*:0]const u8, arg_line: i32, arg_func: [*:0]const u8, arg_message: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, i32, [*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_assertion_message" });
    const ret = cFn(arg_domain, arg_file, arg_line, arg_func, arg_message);
    return ret;
}
pub fn assertionMessageCmpint(arg_domain: [*:0]const u8, arg_file: [*:0]const u8, arg_line: i32, arg_func: [*:0]const u8, arg_expr: [*:0]const u8, arg_arg1: u64, arg_cmp: [*:0]const u8, arg_arg2: u64, arg_numtype: i8) void {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, i32, [*:0]const u8, [*:0]const u8, u64, [*:0]const u8, u64, i8) callconv(.c) void, .{ .name = "g_assertion_message_cmpint" });
    const ret = cFn(arg_domain, arg_file, arg_line, arg_func, arg_expr, arg_arg1, arg_cmp, arg_arg2, arg_numtype);
    return ret;
}
pub fn assertionMessageCmpstr(arg_domain: [*:0]const u8, arg_file: [*:0]const u8, arg_line: i32, arg_func: [*:0]const u8, arg_expr: [*:0]const u8, arg_arg1: [*:0]const u8, arg_cmp: [*:0]const u8, arg_arg2: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, i32, [*:0]const u8, [*:0]const u8, [*:0]const u8, [*:0]const u8, [*:0]const u8) callconv(.c) void, .{ .name = "g_assertion_message_cmpstr" });
    const ret = cFn(arg_domain, arg_file, arg_line, arg_func, arg_expr, arg_arg1, arg_cmp, arg_arg2);
    return ret;
}
pub fn assertionMessageCmpstrv(arg_domain: [*:0]const u8, arg_file: [*:0]const u8, arg_line: i32, arg_func: [*:0]const u8, arg_expr: [*:0]const u8, arg_arg1: [*:0]const u8, arg_arg2: [*:0]const u8, arg_first_wrong_idx: u64) void {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, i32, [*:0]const u8, [*:0]const u8, [*:0]const u8, [*:0]const u8, u64) callconv(.c) void, .{ .name = "g_assertion_message_cmpstrv" });
    const ret = cFn(arg_domain, arg_file, arg_line, arg_func, arg_expr, arg_arg1, arg_arg2, arg_first_wrong_idx);
    return ret;
}
pub fn assertionMessageError(arg_domain: [*:0]const u8, arg_file: [*:0]const u8, arg_line: i32, arg_func: [*:0]const u8, arg_expr: [*:0]const u8, arg_error: *GLib.Error, arg_error_domain: u32, arg_error_code: i32) void {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, i32, [*:0]const u8, [*:0]const u8, *GLib.Error, u32, i32) callconv(.c) void, .{ .name = "g_assertion_message_error" });
    const ret = cFn(arg_domain, arg_file, arg_line, arg_func, arg_expr, arg_error, arg_error_domain, arg_error_code);
    return ret;
}
pub fn asyncQueueNew() *AsyncQueue {
    const cFn = @extern(*const fn () callconv(.c) *AsyncQueue, .{ .name = "g_async_queue_new" });
    const ret = cFn();
    return ret;
}
pub fn asyncQueueNewFull(arg_item_free_func: ?DestroyNotify) *AsyncQueue {
    const cFn = @extern(*const fn (?DestroyNotify) callconv(.c) *AsyncQueue, .{ .name = "g_async_queue_new_full" });
    const ret = cFn(arg_item_free_func);
    return ret;
}
pub fn atexit(arg_func: VoidFunc) void {
    const cFn = @extern(*const fn (VoidFunc) callconv(.c) void, .{ .name = "g_atexit" });
    const ret = cFn(arg_func);
    return ret;
}
pub fn atomicIntAdd(arg_atomic: ?*anyopaque, arg_val: i32) i32 {
    const cFn = @extern(*const fn (?*anyopaque, i32) callconv(.c) i32, .{ .name = "g_atomic_int_add" });
    const ret = cFn(@ptrCast(arg_atomic), arg_val);
    return ret;
}
pub fn atomicIntAnd(arg_atomic: ?*anyopaque, arg_val: u32) u32 {
    const cFn = @extern(*const fn (?*anyopaque, u32) callconv(.c) u32, .{ .name = "g_atomic_int_and" });
    const ret = cFn(@ptrCast(arg_atomic), arg_val);
    return ret;
}
pub fn atomicIntCompareAndExchange(arg_atomic: ?*anyopaque, arg_oldval: i32, arg_newval: i32) bool {
    const cFn = @extern(*const fn (?*anyopaque, i32, i32) callconv(.c) bool, .{ .name = "g_atomic_int_compare_and_exchange" });
    const ret = cFn(@ptrCast(arg_atomic), arg_oldval, arg_newval);
    return ret;
}
pub fn atomicIntCompareAndExchangeFull(arg_atomic: ?*anyopaque, arg_oldval: i32, arg_newval: i32) struct {
    ret: bool,
    preval: i32,
} {
    var argO_preval: i32 = undefined;
    const arg_preval: *i32 = &argO_preval;
    const cFn = @extern(*const fn (?*anyopaque, i32, i32, *i32) callconv(.c) bool, .{ .name = "g_atomic_int_compare_and_exchange_full" });
    const ret = cFn(@ptrCast(arg_atomic), arg_oldval, arg_newval, arg_preval);
    return .{ .ret = ret, .preval = argO_preval };
}
pub fn atomicIntDecAndTest(arg_atomic: ?*anyopaque) bool {
    const cFn = @extern(*const fn (?*anyopaque) callconv(.c) bool, .{ .name = "g_atomic_int_dec_and_test" });
    const ret = cFn(@ptrCast(arg_atomic));
    return ret;
}
pub fn atomicIntExchange(arg_atomic: ?*anyopaque, arg_newval: i32) i32 {
    const cFn = @extern(*const fn (?*anyopaque, i32) callconv(.c) i32, .{ .name = "g_atomic_int_exchange" });
    const ret = cFn(@ptrCast(arg_atomic), arg_newval);
    return ret;
}
pub fn atomicIntExchangeAndAdd(arg_atomic: ?*anyopaque, arg_val: i32) i32 {
    const cFn = @extern(*const fn (?*anyopaque, i32) callconv(.c) i32, .{ .name = "g_atomic_int_exchange_and_add" });
    const ret = cFn(@ptrCast(arg_atomic), arg_val);
    return ret;
}
pub fn atomicIntGet(arg_atomic: ?*anyopaque) i32 {
    const cFn = @extern(*const fn (?*anyopaque) callconv(.c) i32, .{ .name = "g_atomic_int_get" });
    const ret = cFn(@ptrCast(arg_atomic));
    return ret;
}
pub fn atomicIntInc(arg_atomic: ?*anyopaque) void {
    const cFn = @extern(*const fn (?*anyopaque) callconv(.c) void, .{ .name = "g_atomic_int_inc" });
    const ret = cFn(@ptrCast(arg_atomic));
    return ret;
}
pub fn atomicIntOr(arg_atomic: ?*anyopaque, arg_val: u32) u32 {
    const cFn = @extern(*const fn (?*anyopaque, u32) callconv(.c) u32, .{ .name = "g_atomic_int_or" });
    const ret = cFn(@ptrCast(arg_atomic), arg_val);
    return ret;
}
pub fn atomicIntSet(arg_atomic: ?*anyopaque, arg_newval: i32) void {
    const cFn = @extern(*const fn (?*anyopaque, i32) callconv(.c) void, .{ .name = "g_atomic_int_set" });
    const ret = cFn(@ptrCast(arg_atomic), arg_newval);
    return ret;
}
pub fn atomicIntXor(arg_atomic: ?*anyopaque, arg_val: u32) u32 {
    const cFn = @extern(*const fn (?*anyopaque, u32) callconv(.c) u32, .{ .name = "g_atomic_int_xor" });
    const ret = cFn(@ptrCast(arg_atomic), arg_val);
    return ret;
}
pub fn atomicPointerAdd(arg_atomic: *anyopaque, arg_val: i64) i64 {
    const cFn = @extern(*const fn (*anyopaque, i64) callconv(.c) i64, .{ .name = "g_atomic_pointer_add" });
    const ret = cFn(@ptrCast(arg_atomic), arg_val);
    return ret;
}
pub fn atomicPointerAnd(arg_atomic: *anyopaque, arg_val: u64) u64 {
    const cFn = @extern(*const fn (*anyopaque, u64) callconv(.c) u64, .{ .name = "g_atomic_pointer_and" });
    const ret = cFn(@ptrCast(arg_atomic), arg_val);
    return ret;
}
pub fn atomicPointerCompareAndExchange(arg_atomic: *anyopaque, arg_oldval: ?*anyopaque, arg_newval: ?*anyopaque) bool {
    const cFn = @extern(*const fn (*anyopaque, ?*anyopaque, ?*anyopaque) callconv(.c) bool, .{ .name = "g_atomic_pointer_compare_and_exchange" });
    const ret = cFn(@ptrCast(arg_atomic), @ptrCast(arg_oldval), @ptrCast(arg_newval));
    return ret;
}
pub fn atomicPointerCompareAndExchangeFull(arg_atomic: *anyopaque, arg_oldval: ?*anyopaque, arg_newval: ?*anyopaque) struct {
    ret: bool,
    preval: *anyopaque,
} {
    var argO_preval: *anyopaque = undefined;
    const arg_preval: *anyopaque = &argO_preval;
    const cFn = @extern(*const fn (*anyopaque, ?*anyopaque, ?*anyopaque, *anyopaque) callconv(.c) bool, .{ .name = "g_atomic_pointer_compare_and_exchange_full" });
    const ret = cFn(@ptrCast(arg_atomic), @ptrCast(arg_oldval), @ptrCast(arg_newval), @ptrCast(arg_preval));
    return .{ .ret = ret, .preval = argO_preval };
}
pub fn atomicPointerExchange(arg_atomic: ?*anyopaque, arg_newval: ?*anyopaque) ?*anyopaque {
    const cFn = @extern(*const fn (?*anyopaque, ?*anyopaque) callconv(.c) ?*anyopaque, .{ .name = "g_atomic_pointer_exchange" });
    const ret = cFn(@ptrCast(arg_atomic), @ptrCast(arg_newval));
    return ret;
}
pub fn atomicPointerGet(arg_atomic: *anyopaque) ?*anyopaque {
    const cFn = @extern(*const fn (*anyopaque) callconv(.c) ?*anyopaque, .{ .name = "g_atomic_pointer_get" });
    const ret = cFn(@ptrCast(arg_atomic));
    return ret;
}
pub fn atomicPointerOr(arg_atomic: *anyopaque, arg_val: u64) u64 {
    const cFn = @extern(*const fn (*anyopaque, u64) callconv(.c) u64, .{ .name = "g_atomic_pointer_or" });
    const ret = cFn(@ptrCast(arg_atomic), arg_val);
    return ret;
}
pub fn atomicPointerSet(arg_atomic: *anyopaque, arg_newval: ?*anyopaque) void {
    const cFn = @extern(*const fn (*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_atomic_pointer_set" });
    const ret = cFn(@ptrCast(arg_atomic), @ptrCast(arg_newval));
    return ret;
}
pub fn atomicPointerXor(arg_atomic: *anyopaque, arg_val: u64) u64 {
    const cFn = @extern(*const fn (*anyopaque, u64) callconv(.c) u64, .{ .name = "g_atomic_pointer_xor" });
    const ret = cFn(@ptrCast(arg_atomic), arg_val);
    return ret;
}
pub fn atomicRcBoxAcquire(arg_mem_block: *anyopaque) *anyopaque {
    const cFn = @extern(*const fn (*anyopaque) callconv(.c) *anyopaque, .{ .name = "g_atomic_rc_box_acquire" });
    const ret = cFn(@ptrCast(arg_mem_block));
    return ret;
}
pub fn atomicRcBoxAlloc(arg_block_size: u64) *anyopaque {
    const cFn = @extern(*const fn (u64) callconv(.c) *anyopaque, .{ .name = "g_atomic_rc_box_alloc" });
    const ret = cFn(arg_block_size);
    return ret;
}
pub fn atomicRcBoxAlloc0(arg_block_size: u64) *anyopaque {
    const cFn = @extern(*const fn (u64) callconv(.c) *anyopaque, .{ .name = "g_atomic_rc_box_alloc0" });
    const ret = cFn(arg_block_size);
    return ret;
}
pub fn atomicRcBoxDup(arg_block_size: u64, arg_mem_block: *anyopaque) *anyopaque {
    const cFn = @extern(*const fn (u64, *anyopaque) callconv(.c) *anyopaque, .{ .name = "g_atomic_rc_box_dup" });
    const ret = cFn(arg_block_size, @ptrCast(arg_mem_block));
    return ret;
}
pub fn atomicRcBoxGetSize(arg_mem_block: *anyopaque) u64 {
    const cFn = @extern(*const fn (*anyopaque) callconv(.c) u64, .{ .name = "g_atomic_rc_box_get_size" });
    const ret = cFn(@ptrCast(arg_mem_block));
    return ret;
}
pub fn atomicRcBoxRelease(arg_mem_block: *anyopaque) void {
    const cFn = @extern(*const fn (*anyopaque) callconv(.c) void, .{ .name = "g_atomic_rc_box_release" });
    const ret = cFn(@ptrCast(arg_mem_block));
    return ret;
}
pub fn atomicRcBoxReleaseFull(arg_mem_block: *anyopaque, arg_clear_func: DestroyNotify) void {
    const cFn = @extern(*const fn (*anyopaque, DestroyNotify) callconv(.c) void, .{ .name = "g_atomic_rc_box_release_full" });
    const ret = cFn(@ptrCast(arg_mem_block), arg_clear_func);
    return ret;
}
pub fn atomicRefCountCompare(arg_arc: *i32, arg_val: i32) bool {
    const cFn = @extern(*const fn (*i32, i32) callconv(.c) bool, .{ .name = "g_atomic_ref_count_compare" });
    const ret = cFn(arg_arc, arg_val);
    return ret;
}
pub fn atomicRefCountDec(arg_arc: *i32) bool {
    const cFn = @extern(*const fn (*i32) callconv(.c) bool, .{ .name = "g_atomic_ref_count_dec" });
    const ret = cFn(arg_arc);
    return ret;
}
pub fn atomicRefCountInc(arg_arc: *i32) void {
    const cFn = @extern(*const fn (*i32) callconv(.c) void, .{ .name = "g_atomic_ref_count_inc" });
    const ret = cFn(arg_arc);
    return ret;
}
pub fn atomicRefCountInit() i32 {
    var argO_arc: i32 = undefined;
    const arg_arc: *i32 = &argO_arc;
    const cFn = @extern(*const fn (*i32) callconv(.c) void, .{ .name = "g_atomic_ref_count_init" });
    const ret = cFn(arg_arc);
    _ = ret;
    return argO_arc;
}
pub fn base64Decode(arg_text: [*:0]const u8) []u8 {
    var argO_out_len: u64 = undefined;
    const arg_out_len: *u64 = &argO_out_len;
    const cFn = @extern(*const fn ([*:0]const u8, *u64) callconv(.c) [*]u8, .{ .name = "g_base64_decode" });
    const ret = cFn(arg_text, arg_out_len);
    return ret[0..@intCast(argO_out_len)];
}
pub fn base64DecodeInplace(argS_text: []u8) struct {
    ret: *u8,
    text: []u8,
} {
    const arg_text: *[*]u8 = @ptrCast(argS_text);
    var argO_out_len: u64 = @intCast((argS_text).len);
    const arg_out_len: *u64 = &argO_out_len;
    const cFn = @extern(*const fn (*[*]u8, *u64) callconv(.c) *u8, .{ .name = "g_base64_decode_inplace" });
    const ret = cFn(arg_text, arg_out_len);
    return .{ .ret = ret, .text = arg_text[0..@intCast(arg_out_len)] };
}
pub fn base64Encode(argS_data: []u8) [*:0]u8 {
    const arg_data: ?[*]u8 = @ptrCast(argS_data);
    const arg_len: u64 = @intCast((argS_data).len);
    const cFn = @extern(*const fn (?[*]u8, u64) callconv(.c) [*:0]u8, .{ .name = "g_base64_encode" });
    const ret = cFn(arg_data, arg_len);
    return ret;
}
pub fn base64EncodeClose(arg_break_lines: bool, arg_state: *i32, arg_save: *i32) struct {
    ret: u64,
    out: [*]u8,
} {
    var argO_out: [*]u8 = undefined;
    const arg_out: *[*]u8 = &argO_out;
    const cFn = @extern(*const fn (bool, *[*]u8, *i32, *i32) callconv(.c) u64, .{ .name = "g_base64_encode_close" });
    const ret = cFn(arg_break_lines, arg_out, arg_state, arg_save);
    return .{ .ret = ret, .out = argO_out };
}
pub fn base64EncodeStep(argS_in: []u8, arg_break_lines: bool, arg_state: *i32, arg_save: *i32) struct {
    ret: u64,
    out: [*]u8,
} {
    const arg_in: [*]u8 = @ptrCast(argS_in);
    const arg_len: u64 = @intCast((argS_in).len);
    var argO_out: [*]u8 = undefined;
    const arg_out: *[*]u8 = &argO_out;
    const cFn = @extern(*const fn ([*]u8, u64, bool, *[*]u8, *i32, *i32) callconv(.c) u64, .{ .name = "g_base64_encode_step" });
    const ret = cFn(arg_in, arg_len, arg_break_lines, arg_out, arg_state, arg_save);
    return .{ .ret = ret, .out = argO_out };
}
pub fn basename(arg_file_name: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_basename" });
    const ret = cFn(arg_file_name);
    return ret;
}
pub fn bitLock(arg_address: ?*anyopaque, arg_lock_bit: i32) void {
    const cFn = @extern(*const fn (?*anyopaque, i32) callconv(.c) void, .{ .name = "g_bit_lock" });
    const ret = cFn(@ptrCast(arg_address), arg_lock_bit);
    return ret;
}
pub fn bitLockAndGet(arg_address: ?*anyopaque, arg_lock_bit: u32) i32 {
    var argO_out_val: i32 = undefined;
    const arg_out_val: ?*i32 = &argO_out_val;
    const cFn = @extern(*const fn (?*anyopaque, u32, ?*i32) callconv(.c) void, .{ .name = "g_bit_lock_and_get" });
    const ret = cFn(@ptrCast(arg_address), arg_lock_bit, arg_out_val);
    _ = ret;
    return argO_out_val;
}
pub fn bitNthLsf(arg_mask: u64, arg_nth_bit: i32) i32 {
    const cFn = @extern(*const fn (u64, i32) callconv(.c) i32, .{ .name = "g_bit_nth_lsf" });
    const ret = cFn(arg_mask, arg_nth_bit);
    return ret;
}
pub fn bitNthMsf(arg_mask: u64, arg_nth_bit: i32) i32 {
    const cFn = @extern(*const fn (u64, i32) callconv(.c) i32, .{ .name = "g_bit_nth_msf" });
    const ret = cFn(arg_mask, arg_nth_bit);
    return ret;
}
pub fn bitStorage(arg_number: u64) u32 {
    const cFn = @extern(*const fn (u64) callconv(.c) u32, .{ .name = "g_bit_storage" });
    const ret = cFn(arg_number);
    return ret;
}
pub fn bitTrylock(arg_address: ?*anyopaque, arg_lock_bit: i32) bool {
    const cFn = @extern(*const fn (?*anyopaque, i32) callconv(.c) bool, .{ .name = "g_bit_trylock" });
    const ret = cFn(@ptrCast(arg_address), arg_lock_bit);
    return ret;
}
pub fn bitUnlock(arg_address: ?*anyopaque, arg_lock_bit: i32) void {
    const cFn = @extern(*const fn (?*anyopaque, i32) callconv(.c) void, .{ .name = "g_bit_unlock" });
    const ret = cFn(@ptrCast(arg_address), arg_lock_bit);
    return ret;
}
pub fn bitUnlockAndSet(arg_address: ?*anyopaque, arg_lock_bit: u32, arg_new_val: i32, arg_preserve_mask: i32) void {
    const cFn = @extern(*const fn (?*anyopaque, u32, i32, i32) callconv(.c) void, .{ .name = "g_bit_unlock_and_set" });
    const ret = cFn(@ptrCast(arg_address), arg_lock_bit, arg_new_val, arg_preserve_mask);
    return ret;
}
pub fn blowChunks() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_blow_chunks" });
    const ret = cFn();
    return ret;
}
pub fn bookmarkFileErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_bookmark_file_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn buildFilenamev(arg_args: [*]?[*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*]?[*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_build_filenamev" });
    const ret = cFn(arg_args);
    return ret;
}
pub fn buildPathv(arg_separator: [*:0]const u8, arg_args: [*]?[*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, [*]?[*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_build_pathv" });
    const ret = cFn(arg_separator, arg_args);
    return ret;
}
pub fn byteArrayAppend(arg_array: *GLib.ByteArray, argS_data: []u8) *GLib.ByteArray {
    const arg_data: [*]u8 = @ptrCast(argS_data);
    const arg_len: u32 = @intCast((argS_data).len);
    const cFn = @extern(*const fn (*GLib.ByteArray, [*]u8, u32) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_append" });
    const ret = cFn(arg_array, arg_data, arg_len);
    return ret;
}
pub fn byteArrayFree(arg_array: *GLib.ByteArray, arg_free_segment: bool) ?[*]u8 {
    const cFn = @extern(*const fn (*GLib.ByteArray, bool) callconv(.c) ?[*]u8, .{ .name = "g_byte_array_free" });
    const ret = cFn(arg_array, arg_free_segment);
    return ret;
}
pub fn byteArrayFreeToBytes(arg_array: *GLib.ByteArray) *Bytes {
    const cFn = @extern(*const fn (*GLib.ByteArray) callconv(.c) *Bytes, .{ .name = "g_byte_array_free_to_bytes" });
    const ret = cFn(arg_array);
    return ret;
}
pub fn byteArrayNew() *GLib.ByteArray {
    const cFn = @extern(*const fn () callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_new" });
    const ret = cFn();
    return ret;
}
pub fn byteArrayNewTake(argS_data: []u8) *GLib.ByteArray {
    const arg_data: [*]u8 = @ptrCast(argS_data);
    const arg_len: u64 = @intCast((argS_data).len);
    const cFn = @extern(*const fn ([*]u8, u64) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_new_take" });
    const ret = cFn(arg_data, arg_len);
    return ret;
}
pub fn byteArrayPrepend(arg_array: *GLib.ByteArray, argS_data: []u8) *GLib.ByteArray {
    const arg_data: [*]u8 = @ptrCast(argS_data);
    const arg_len: u32 = @intCast((argS_data).len);
    const cFn = @extern(*const fn (*GLib.ByteArray, [*]u8, u32) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_prepend" });
    const ret = cFn(arg_array, arg_data, arg_len);
    return ret;
}
pub fn byteArrayRef(arg_array: *GLib.ByteArray) *GLib.ByteArray {
    const cFn = @extern(*const fn (*GLib.ByteArray) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_ref" });
    const ret = cFn(arg_array);
    return ret;
}
pub fn byteArrayRemoveIndex(arg_array: *GLib.ByteArray, arg_index_: u32) *GLib.ByteArray {
    const cFn = @extern(*const fn (*GLib.ByteArray, u32) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_remove_index" });
    const ret = cFn(arg_array, arg_index_);
    return ret;
}
pub fn byteArrayRemoveIndexFast(arg_array: *GLib.ByteArray, arg_index_: u32) *GLib.ByteArray {
    const cFn = @extern(*const fn (*GLib.ByteArray, u32) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_remove_index_fast" });
    const ret = cFn(arg_array, arg_index_);
    return ret;
}
pub fn byteArrayRemoveRange(arg_array: *GLib.ByteArray, arg_index_: u32, arg_length: u32) *GLib.ByteArray {
    const cFn = @extern(*const fn (*GLib.ByteArray, u32, u32) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_remove_range" });
    const ret = cFn(arg_array, arg_index_, arg_length);
    return ret;
}
pub fn byteArraySetSize(arg_array: *GLib.ByteArray, arg_length: u32) *GLib.ByteArray {
    const cFn = @extern(*const fn (*GLib.ByteArray, u32) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_set_size" });
    const ret = cFn(arg_array, arg_length);
    return ret;
}
pub fn byteArraySizedNew(arg_reserved_size: u32) *GLib.ByteArray {
    const cFn = @extern(*const fn (u32) callconv(.c) *GLib.ByteArray, .{ .name = "g_byte_array_sized_new" });
    const ret = cFn(arg_reserved_size);
    return ret;
}
pub fn byteArraySort(arg_array: *GLib.ByteArray, arg_compare_func: CompareFunc) void {
    const cFn = @extern(*const fn (*GLib.ByteArray, CompareFunc) callconv(.c) void, .{ .name = "g_byte_array_sort" });
    const ret = cFn(arg_array, arg_compare_func);
    return ret;
}
pub fn byteArraySortWithData(arg_array: *GLib.ByteArray, argC_compare_func: core.Closure(CompareDataFunc)) void {
    const arg_compare_func: CompareDataFunc = @ptrCast(argC_compare_func.callback());
    defer argC_compare_func.deinit();
    const arg_user_data: ?*anyopaque = @ptrCast(argC_compare_func.data());
    const cFn = @extern(*const fn (*GLib.ByteArray, CompareDataFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_byte_array_sort_with_data" });
    const ret = cFn(arg_array, arg_compare_func, @ptrCast(arg_user_data));
    return ret;
}
pub fn byteArraySteal(arg_array: *GLib.ByteArray) []u8 {
    var argO_len: u64 = undefined;
    const arg_len: ?*u64 = &argO_len;
    const cFn = @extern(*const fn (*GLib.ByteArray, ?*u64) callconv(.c) [*]u8, .{ .name = "g_byte_array_steal" });
    const ret = cFn(arg_array, arg_len);
    return ret[0..@intCast(argO_len)];
}
pub fn byteArrayUnref(arg_array: *GLib.ByteArray) void {
    const cFn = @extern(*const fn (*GLib.ByteArray) callconv(.c) void, .{ .name = "g_byte_array_unref" });
    const ret = cFn(arg_array);
    return ret;
}
pub fn canonicalizeFilename(arg_filename: [*:0]const u8, arg_relative_to: ?[*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_canonicalize_filename" });
    const ret = cFn(arg_filename, arg_relative_to);
    return ret;
}
pub fn chdir(arg_path: [*:0]const u8) i32 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) i32, .{ .name = "g_chdir" });
    const ret = cFn(arg_path);
    return ret;
}
pub fn checkVersion(arg_required_major: u32, arg_required_minor: u32, arg_required_micro: u32) ?[*:0]u8 {
    const cFn = @extern(*const fn (u32, u32, u32) callconv(.c) ?[*:0]u8, .{ .name = "glib_check_version" });
    const ret = cFn(arg_required_major, arg_required_minor, arg_required_micro);
    return ret;
}
pub fn checksumTypeGetLength(arg_checksum_type: ChecksumType) i64 {
    const cFn = @extern(*const fn (ChecksumType) callconv(.c) i64, .{ .name = "g_checksum_type_get_length" });
    const ret = cFn(arg_checksum_type);
    return ret;
}
pub fn childWatchAdd(arg_priority: i32, arg_pid: i32, argC_function: core.Closure(ChildWatchFunc)) u32 {
    const arg_function: ChildWatchFunc = @ptrCast(argC_function.callback());
    const arg_data: ?*anyopaque = @ptrCast(argC_function.data());
    const arg_notify: ?DestroyNotify = @ptrCast(argC_function.destroy());
    const cFn = @extern(*const fn (i32, i32, ChildWatchFunc, ?*anyopaque, ?DestroyNotify) callconv(.c) u32, .{ .name = "g_child_watch_add_full" });
    const ret = cFn(arg_priority, arg_pid, arg_function, @ptrCast(arg_data), arg_notify);
    return ret;
}
pub fn childWatchSourceNew(arg_pid: i32) *Source {
    const cFn = @extern(*const fn (i32) callconv(.c) *Source, .{ .name = "g_child_watch_source_new" });
    const ret = cFn(arg_pid);
    return ret;
}
pub fn chmod(arg_filename: [*:0]const u8, arg_mode: i32) i32 {
    const cFn = @extern(*const fn ([*:0]const u8, i32) callconv(.c) i32, .{ .name = "g_chmod" });
    const ret = cFn(arg_filename, arg_mode);
    return ret;
}
pub fn clearError(arg_error: *?*GLib.Error) error{GError}!void {
    const cFn = @extern(*const fn (*?*GLib.Error) callconv(.c) void, .{ .name = "g_clear_error" });
    const ret = cFn(arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn close(arg_fd: i32, arg_error: *?*GLib.Error) error{GError}!bool {
    const cFn = @extern(*const fn (i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_close" });
    const ret = cFn(arg_fd, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn closefrom(arg_lowfd: i32) i32 {
    const cFn = @extern(*const fn (i32) callconv(.c) i32, .{ .name = "g_closefrom" });
    const ret = cFn(arg_lowfd);
    return ret;
}
pub fn computeChecksumForBytes(arg_checksum_type: ChecksumType, arg_data: *Bytes) ?[*:0]u8 {
    const cFn = @extern(*const fn (ChecksumType, *Bytes) callconv(.c) ?[*:0]u8, .{ .name = "g_compute_checksum_for_bytes" });
    const ret = cFn(arg_checksum_type, arg_data);
    return ret;
}
pub fn computeChecksumForData(arg_checksum_type: ChecksumType, argS_data: []u8) ?[*:0]u8 {
    const arg_data: [*]u8 = @ptrCast(argS_data);
    const arg_length: u64 = @intCast((argS_data).len);
    const cFn = @extern(*const fn (ChecksumType, [*]u8, u64) callconv(.c) ?[*:0]u8, .{ .name = "g_compute_checksum_for_data" });
    const ret = cFn(arg_checksum_type, arg_data, arg_length);
    return ret;
}
pub fn computeChecksumForString(arg_checksum_type: ChecksumType, arg_str: [*:0]const u8, arg_length: i64) ?[*:0]u8 {
    const cFn = @extern(*const fn (ChecksumType, [*:0]const u8, i64) callconv(.c) ?[*:0]u8, .{ .name = "g_compute_checksum_for_string" });
    const ret = cFn(arg_checksum_type, arg_str, arg_length);
    return ret;
}
pub fn computeHmacForBytes(arg_digest_type: ChecksumType, arg_key: *Bytes, arg_data: *Bytes) [*:0]u8 {
    const cFn = @extern(*const fn (ChecksumType, *Bytes, *Bytes) callconv(.c) [*:0]u8, .{ .name = "g_compute_hmac_for_bytes" });
    const ret = cFn(arg_digest_type, arg_key, arg_data);
    return ret;
}
pub fn computeHmacForData(arg_digest_type: ChecksumType, argS_key: []u8, argS_data: []u8) [*:0]u8 {
    const arg_key: [*]u8 = @ptrCast(argS_key);
    const arg_key_len: u64 = @intCast((argS_key).len);
    const arg_data: [*]u8 = @ptrCast(argS_data);
    const arg_length: u64 = @intCast((argS_data).len);
    const cFn = @extern(*const fn (ChecksumType, [*]u8, u64, [*]u8, u64) callconv(.c) [*:0]u8, .{ .name = "g_compute_hmac_for_data" });
    const ret = cFn(arg_digest_type, arg_key, arg_key_len, arg_data, arg_length);
    return ret;
}
pub fn computeHmacForString(arg_digest_type: ChecksumType, argS_key: []u8, arg_str: [*:0]const u8, arg_length: i64) [*:0]u8 {
    const arg_key: [*]u8 = @ptrCast(argS_key);
    const arg_key_len: u64 = @intCast((argS_key).len);
    const cFn = @extern(*const fn (ChecksumType, [*]u8, u64, [*:0]const u8, i64) callconv(.c) [*:0]u8, .{ .name = "g_compute_hmac_for_string" });
    const ret = cFn(arg_digest_type, arg_key, arg_key_len, arg_str, arg_length);
    return ret;
}
pub fn convert(argS_str: []u8, arg_to_codeset: [*:0]const u8, arg_from_codeset: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: []u8,
    bytes_read: u64,
} {
    const arg_str: [*]u8 = @ptrCast(argS_str);
    const arg_len: i64 = @intCast((argS_str).len);
    var argO_bytes_read: u64 = undefined;
    const arg_bytes_read: ?*u64 = &argO_bytes_read;
    var argO_bytes_written: u64 = undefined;
    const arg_bytes_written: ?*u64 = &argO_bytes_written;
    const cFn = @extern(*const fn ([*]u8, i64, [*:0]const u8, [*:0]const u8, ?*u64, ?*u64, *?*GLib.Error) callconv(.c) [*]u8, .{ .name = "g_convert" });
    const ret = cFn(arg_str, arg_len, arg_to_codeset, arg_from_codeset, arg_bytes_read, arg_bytes_written, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret[0..@intCast(argO_bytes_written)], .bytes_read = argO_bytes_read };
}
pub fn convertErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_convert_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn convertWithFallback(argS_str: []u8, arg_to_codeset: [*:0]const u8, arg_from_codeset: [*:0]const u8, arg_fallback: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: []u8,
    bytes_read: u64,
} {
    const arg_str: [*]u8 = @ptrCast(argS_str);
    const arg_len: i64 = @intCast((argS_str).len);
    var argO_bytes_read: u64 = undefined;
    const arg_bytes_read: ?*u64 = &argO_bytes_read;
    var argO_bytes_written: u64 = undefined;
    const arg_bytes_written: ?*u64 = &argO_bytes_written;
    const cFn = @extern(*const fn ([*]u8, i64, [*:0]const u8, [*:0]const u8, [*:0]const u8, ?*u64, ?*u64, *?*GLib.Error) callconv(.c) [*]u8, .{ .name = "g_convert_with_fallback" });
    const ret = cFn(arg_str, arg_len, arg_to_codeset, arg_from_codeset, arg_fallback, arg_bytes_read, arg_bytes_written, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret[0..@intCast(argO_bytes_written)], .bytes_read = argO_bytes_read };
}
pub fn creat(arg_filename: [*:0]const u8, arg_mode: i32) i32 {
    const cFn = @extern(*const fn ([*:0]const u8, i32) callconv(.c) i32, .{ .name = "g_creat" });
    const ret = cFn(arg_filename, arg_mode);
    return ret;
}
pub fn datalistForeach(arg_datalist: *Data, argC_func: core.Closure(DataForeachFunc)) void {
    const arg_func: DataForeachFunc = @ptrCast(argC_func.callback());
    defer argC_func.deinit();
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const cFn = @extern(*const fn (*Data, DataForeachFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_datalist_foreach" });
    const ret = cFn(arg_datalist, arg_func, @ptrCast(arg_user_data));
    return ret;
}
pub fn datalistGetData(arg_datalist: *Data, arg_key: [*:0]const u8) ?*anyopaque {
    const cFn = @extern(*const fn (*Data, [*:0]const u8) callconv(.c) ?*anyopaque, .{ .name = "g_datalist_get_data" });
    const ret = cFn(arg_datalist, arg_key);
    return ret;
}
pub fn datalistGetFlags(arg_datalist: *Data) u32 {
    const cFn = @extern(*const fn (*Data) callconv(.c) u32, .{ .name = "g_datalist_get_flags" });
    const ret = cFn(arg_datalist);
    return ret;
}
pub fn datalistIdGetData(arg_datalist: *Data, arg_key_id: u32) ?*anyopaque {
    const cFn = @extern(*const fn (*Data, u32) callconv(.c) ?*anyopaque, .{ .name = "g_datalist_id_get_data" });
    const ret = cFn(arg_datalist, arg_key_id);
    return ret;
}
pub fn datalistIdRemoveMultiple(arg_datalist: *Data, argS_keys: []u32) void {
    const arg_keys: [*]u32 = @ptrCast(argS_keys);
    const arg_n_keys: u64 = @intCast((argS_keys).len);
    const cFn = @extern(*const fn (*Data, [*]u32, u64) callconv(.c) void, .{ .name = "g_datalist_id_remove_multiple" });
    const ret = cFn(arg_datalist, arg_keys, arg_n_keys);
    return ret;
}
pub fn datalistSetFlags(arg_datalist: *Data, arg_flags: u32) void {
    const cFn = @extern(*const fn (*Data, u32) callconv(.c) void, .{ .name = "g_datalist_set_flags" });
    const ret = cFn(arg_datalist, arg_flags);
    return ret;
}
pub fn datalistUnsetFlags(arg_datalist: *Data, arg_flags: u32) void {
    const cFn = @extern(*const fn (*Data, u32) callconv(.c) void, .{ .name = "g_datalist_unset_flags" });
    const ret = cFn(arg_datalist, arg_flags);
    return ret;
}
pub fn datasetDestroy(arg_dataset_location: *anyopaque) void {
    const cFn = @extern(*const fn (*anyopaque) callconv(.c) void, .{ .name = "g_dataset_destroy" });
    const ret = cFn(@ptrCast(arg_dataset_location));
    return ret;
}
pub fn datasetForeach(arg_dataset_location: *anyopaque, argC_func: core.Closure(DataForeachFunc)) void {
    const arg_func: DataForeachFunc = @ptrCast(argC_func.callback());
    defer argC_func.deinit();
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const cFn = @extern(*const fn (*anyopaque, DataForeachFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_dataset_foreach" });
    const ret = cFn(@ptrCast(arg_dataset_location), arg_func, @ptrCast(arg_user_data));
    return ret;
}
pub fn datasetIdGetData(arg_dataset_location: *anyopaque, arg_key_id: u32) ?*anyopaque {
    const cFn = @extern(*const fn (*anyopaque, u32) callconv(.c) ?*anyopaque, .{ .name = "g_dataset_id_get_data" });
    const ret = cFn(@ptrCast(arg_dataset_location), arg_key_id);
    return ret;
}
pub fn dateGetDaysInMonth(arg_month: DateMonth, arg_year: u16) u8 {
    const cFn = @extern(*const fn (DateMonth, u16) callconv(.c) u8, .{ .name = "g_date_get_days_in_month" });
    const ret = cFn(arg_month, arg_year);
    return ret;
}
pub fn dateGetMondayWeeksInYear(arg_year: u16) u8 {
    const cFn = @extern(*const fn (u16) callconv(.c) u8, .{ .name = "g_date_get_monday_weeks_in_year" });
    const ret = cFn(arg_year);
    return ret;
}
pub fn dateGetSundayWeeksInYear(arg_year: u16) u8 {
    const cFn = @extern(*const fn (u16) callconv(.c) u8, .{ .name = "g_date_get_sunday_weeks_in_year" });
    const ret = cFn(arg_year);
    return ret;
}
pub fn dateGetWeeksInYear(arg_year: u16, arg_first_day_of_week: DateWeekday) u8 {
    const cFn = @extern(*const fn (u16, DateWeekday) callconv(.c) u8, .{ .name = "g_date_get_weeks_in_year" });
    const ret = cFn(arg_year, arg_first_day_of_week);
    return ret;
}
pub fn dateIsLeapYear(arg_year: u16) bool {
    const cFn = @extern(*const fn (u16) callconv(.c) bool, .{ .name = "g_date_is_leap_year" });
    const ret = cFn(arg_year);
    return ret;
}
pub fn dateStrftime(arg_s: [*:0]const u8, arg_slen: u64, arg_format: [*:0]const u8, arg_date: *Date) u64 {
    const cFn = @extern(*const fn ([*:0]const u8, u64, [*:0]const u8, *Date) callconv(.c) u64, .{ .name = "g_date_strftime" });
    const ret = cFn(arg_s, arg_slen, arg_format, arg_date);
    return ret;
}
pub fn dateValidDay(arg_day: u8) bool {
    const cFn = @extern(*const fn (u8) callconv(.c) bool, .{ .name = "g_date_valid_day" });
    const ret = cFn(arg_day);
    return ret;
}
pub fn dateValidDmy(arg_day: u8, arg_month: DateMonth, arg_year: u16) bool {
    const cFn = @extern(*const fn (u8, DateMonth, u16) callconv(.c) bool, .{ .name = "g_date_valid_dmy" });
    const ret = cFn(arg_day, arg_month, arg_year);
    return ret;
}
pub fn dateValidJulian(arg_julian_date: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_date_valid_julian" });
    const ret = cFn(arg_julian_date);
    return ret;
}
pub fn dateValidMonth(arg_month: DateMonth) bool {
    const cFn = @extern(*const fn (DateMonth) callconv(.c) bool, .{ .name = "g_date_valid_month" });
    const ret = cFn(arg_month);
    return ret;
}
pub fn dateValidWeekday(arg_weekday: DateWeekday) bool {
    const cFn = @extern(*const fn (DateWeekday) callconv(.c) bool, .{ .name = "g_date_valid_weekday" });
    const ret = cFn(arg_weekday);
    return ret;
}
pub fn dateValidYear(arg_year: u16) bool {
    const cFn = @extern(*const fn (u16) callconv(.c) bool, .{ .name = "g_date_valid_year" });
    const ret = cFn(arg_year);
    return ret;
}
pub fn dcgettext(arg_domain: ?[*:0]const u8, arg_msgid: [*:0]const u8, arg_category: i32) [*:0]u8 {
    const cFn = @extern(*const fn (?[*:0]const u8, [*:0]const u8, i32) callconv(.c) [*:0]u8, .{ .name = "g_dcgettext" });
    const ret = cFn(arg_domain, arg_msgid, arg_category);
    return ret;
}
pub fn dgettext(arg_domain: ?[*:0]const u8, arg_msgid: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn (?[*:0]const u8, [*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_dgettext" });
    const ret = cFn(arg_domain, arg_msgid);
    return ret;
}
pub fn dirMakeTmp(arg_tmpl: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
    const cFn = @extern(*const fn (?[*:0]const u8, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_dir_make_tmp" });
    const ret = cFn(arg_tmpl, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn directEqual(arg_v1: ?*anyopaque, arg_v2: ?*anyopaque) bool {
    const cFn = @extern(*const fn (?*anyopaque, ?*anyopaque) callconv(.c) bool, .{ .name = "g_direct_equal" });
    const ret = cFn(@ptrCast(arg_v1), @ptrCast(arg_v2));
    return ret;
}
pub fn directHash(arg_v: ?*anyopaque) u32 {
    const cFn = @extern(*const fn (?*anyopaque) callconv(.c) u32, .{ .name = "g_direct_hash" });
    const ret = cFn(@ptrCast(arg_v));
    return ret;
}
pub fn dngettext(arg_domain: ?[*:0]const u8, arg_msgid: [*:0]const u8, arg_msgid_plural: [*:0]const u8, arg_n: u64) [*:0]u8 {
    const cFn = @extern(*const fn (?[*:0]const u8, [*:0]const u8, [*:0]const u8, u64) callconv(.c) [*:0]u8, .{ .name = "g_dngettext" });
    const ret = cFn(arg_domain, arg_msgid, arg_msgid_plural, arg_n);
    return ret;
}
pub fn doubleEqual(arg_v1: *anyopaque, arg_v2: *anyopaque) bool {
    const cFn = @extern(*const fn (*anyopaque, *anyopaque) callconv(.c) bool, .{ .name = "g_double_equal" });
    const ret = cFn(@ptrCast(arg_v1), @ptrCast(arg_v2));
    return ret;
}
pub fn doubleHash(arg_v: *anyopaque) u32 {
    const cFn = @extern(*const fn (*anyopaque) callconv(.c) u32, .{ .name = "g_double_hash" });
    const ret = cFn(@ptrCast(arg_v));
    return ret;
}
pub fn dpgettext(arg_domain: ?[*:0]const u8, arg_msgctxtid: [*:0]const u8, arg_msgidoffset: u64) [*:0]u8 {
    const cFn = @extern(*const fn (?[*:0]const u8, [*:0]const u8, u64) callconv(.c) [*:0]u8, .{ .name = "g_dpgettext" });
    const ret = cFn(arg_domain, arg_msgctxtid, arg_msgidoffset);
    return ret;
}
pub fn dpgettext2(arg_domain: ?[*:0]const u8, arg_context: [*:0]const u8, arg_msgid: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn (?[*:0]const u8, [*:0]const u8, [*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_dpgettext2" });
    const ret = cFn(arg_domain, arg_context, arg_msgid);
    return ret;
}
pub fn environGetenv(arg_envp: ?[*]?[*:0]const u8, arg_variable: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn (?[*]?[*:0]const u8, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_environ_getenv" });
    const ret = cFn(arg_envp, arg_variable);
    return ret;
}
pub fn environSetenv(arg_envp: ?[*]?[*:0]const u8, arg_variable: [*:0]const u8, arg_value: [*:0]const u8, arg_overwrite: bool) [*]?[*:0]const u8 {
    const cFn = @extern(*const fn (?[*]?[*:0]const u8, [*:0]const u8, [*:0]const u8, bool) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_environ_setenv" });
    const ret = cFn(arg_envp, arg_variable, arg_value, arg_overwrite);
    return ret;
}
pub fn environUnsetenv(arg_envp: ?[*]?[*:0]const u8, arg_variable: [*:0]const u8) [*]?[*:0]const u8 {
    const cFn = @extern(*const fn (?[*]?[*:0]const u8, [*:0]const u8) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_environ_unsetenv" });
    const ret = cFn(arg_envp, arg_variable);
    return ret;
}
pub fn errorDomainRegister(arg_error_type_name: [*:0]const u8, arg_error_type_private_size: u64, arg_error_type_init: ErrorInitFunc, arg_error_type_copy: ErrorCopyFunc, arg_error_type_clear: ErrorClearFunc) u32 {
    const cFn = @extern(*const fn ([*:0]const u8, u64, ErrorInitFunc, ErrorCopyFunc, ErrorClearFunc) callconv(.c) u32, .{ .name = "g_error_domain_register" });
    const ret = cFn(arg_error_type_name, arg_error_type_private_size, arg_error_type_init, arg_error_type_copy, arg_error_type_clear);
    return ret;
}
pub fn errorDomainRegisterStatic(arg_error_type_name: [*:0]const u8, arg_error_type_private_size: u64, arg_error_type_init: ErrorInitFunc, arg_error_type_copy: ErrorCopyFunc, arg_error_type_clear: ErrorClearFunc) u32 {
    const cFn = @extern(*const fn ([*:0]const u8, u64, ErrorInitFunc, ErrorCopyFunc, ErrorClearFunc) callconv(.c) u32, .{ .name = "g_error_domain_register_static" });
    const ret = cFn(arg_error_type_name, arg_error_type_private_size, arg_error_type_init, arg_error_type_copy, arg_error_type_clear);
    return ret;
}
pub fn fdwalkSetCloexec(arg_lowfd: i32) i32 {
    const cFn = @extern(*const fn (i32) callconv(.c) i32, .{ .name = "g_fdwalk_set_cloexec" });
    const ret = cFn(arg_lowfd);
    return ret;
}
pub fn fileErrorFromErrno(arg_err_no: i32) FileError {
    const cFn = @extern(*const fn (i32) callconv(.c) FileError, .{ .name = "g_file_error_from_errno" });
    const ret = cFn(arg_err_no);
    return ret;
}
pub fn fileErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_file_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn fileGetContents(arg_filename: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    contents: []u8,
} {
    var argO_contents: [*]u8 = undefined;
    const arg_contents: *[*]u8 = &argO_contents;
    var argO_length: u64 = undefined;
    const arg_length: *u64 = &argO_length;
    const cFn = @extern(*const fn ([*:0]const u8, *[*]u8, *u64, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_get_contents" });
    const ret = cFn(arg_filename, arg_contents, arg_length, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .contents = argO_contents[0..@intCast(argO_length)] };
}
pub fn fileOpenTmp(arg_tmpl: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: i32,
    name_used: [*:0]u8,
} {
    var argO_name_used: [*:0]u8 = undefined;
    const arg_name_used: *[*:0]u8 = &argO_name_used;
    const cFn = @extern(*const fn (?[*:0]const u8, *[*:0]u8, *?*GLib.Error) callconv(.c) i32, .{ .name = "g_file_open_tmp" });
    const ret = cFn(arg_tmpl, arg_name_used, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .name_used = argO_name_used };
}
pub fn fileReadLink(arg_filename: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_file_read_link" });
    const ret = cFn(arg_filename, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn fileSetContents(arg_filename: [*:0]const u8, argS_contents: []u8, arg_error: *?*GLib.Error) error{GError}!bool {
    const arg_contents: [*]u8 = @ptrCast(argS_contents);
    const arg_length: i64 = @intCast((argS_contents).len);
    const cFn = @extern(*const fn ([*:0]const u8, [*]u8, i64, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_set_contents" });
    const ret = cFn(arg_filename, arg_contents, arg_length, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn fileSetContentsFull(arg_filename: [*:0]const u8, argS_contents: []u8, arg_flags: FileSetContentsFlags, arg_mode: i32, arg_error: *?*GLib.Error) error{GError}!bool {
    const arg_contents: [*]u8 = @ptrCast(argS_contents);
    const arg_length: i64 = @intCast((argS_contents).len);
    const cFn = @extern(*const fn ([*:0]const u8, [*]u8, i64, FileSetContentsFlags, i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_file_set_contents_full" });
    const ret = cFn(arg_filename, arg_contents, arg_length, arg_flags, arg_mode, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn fileTest(arg_filename: [*:0]const u8, arg_test: FileTest) bool {
    const cFn = @extern(*const fn ([*:0]const u8, FileTest) callconv(.c) bool, .{ .name = "g_file_test" });
    const ret = cFn(arg_filename, arg_test);
    return ret;
}
pub fn filenameDisplayBasename(arg_filename: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_filename_display_basename" });
    const ret = cFn(arg_filename);
    return ret;
}
pub fn filenameDisplayName(arg_filename: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_filename_display_name" });
    const ret = cFn(arg_filename);
    return ret;
}
pub fn filenameFromUri(arg_uri: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: [*:0]u8,
    hostname: ?[*:0]u8,
} {
    var argO_hostname: ?[*:0]u8 = undefined;
    const arg_hostname: ?*?[*:0]u8 = &argO_hostname;
    const cFn = @extern(*const fn ([*:0]const u8, ?*?[*:0]u8, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_filename_from_uri" });
    const ret = cFn(arg_uri, arg_hostname, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .hostname = argO_hostname };
}
pub fn filenameFromUtf8(arg_utf8string: [*:0]const u8, arg_len: i64, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: [*:0]u8,
    bytes_read: u64,
    bytes_written: u64,
} {
    var argO_bytes_read: u64 = undefined;
    const arg_bytes_read: ?*u64 = &argO_bytes_read;
    var argO_bytes_written: u64 = undefined;
    const arg_bytes_written: ?*u64 = &argO_bytes_written;
    const cFn = @extern(*const fn ([*:0]const u8, i64, ?*u64, ?*u64, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_filename_from_utf8" });
    const ret = cFn(arg_utf8string, arg_len, arg_bytes_read, arg_bytes_written, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .bytes_read = argO_bytes_read, .bytes_written = argO_bytes_written };
}
pub fn filenameToUri(arg_filename: [*:0]const u8, arg_hostname: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_filename_to_uri" });
    const ret = cFn(arg_filename, arg_hostname, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn filenameToUtf8(arg_opsysstring: [*:0]const u8, arg_len: i64, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: [*:0]u8,
    bytes_read: u64,
    bytes_written: u64,
} {
    var argO_bytes_read: u64 = undefined;
    const arg_bytes_read: ?*u64 = &argO_bytes_read;
    var argO_bytes_written: u64 = undefined;
    const arg_bytes_written: ?*u64 = &argO_bytes_written;
    const cFn = @extern(*const fn ([*:0]const u8, i64, ?*u64, ?*u64, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_filename_to_utf8" });
    const ret = cFn(arg_opsysstring, arg_len, arg_bytes_read, arg_bytes_written, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .bytes_read = argO_bytes_read, .bytes_written = argO_bytes_written };
}
pub fn findProgramInPath(arg_program: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_find_program_in_path" });
    const ret = cFn(arg_program);
    return ret;
}
pub fn fopen(arg_filename: [*:0]const u8, arg_mode: [*:0]const u8) ?*anyopaque {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) ?*anyopaque, .{ .name = "g_fopen" });
    const ret = cFn(arg_filename, arg_mode);
    return ret;
}
pub fn formatSize(arg_size: u64) [*:0]u8 {
    const cFn = @extern(*const fn (u64) callconv(.c) [*:0]u8, .{ .name = "g_format_size" });
    const ret = cFn(arg_size);
    return ret;
}
pub fn formatSizeForDisplay(arg_size: i64) [*:0]u8 {
    const cFn = @extern(*const fn (i64) callconv(.c) [*:0]u8, .{ .name = "g_format_size_for_display" });
    const ret = cFn(arg_size);
    return ret;
}
pub fn formatSizeFull(arg_size: u64, arg_flags: FormatSizeFlags) [*:0]u8 {
    const cFn = @extern(*const fn (u64, FormatSizeFlags) callconv(.c) [*:0]u8, .{ .name = "g_format_size_full" });
    const ret = cFn(arg_size, arg_flags);
    return ret;
}
pub fn free(arg_mem: ?*anyopaque) void {
    const cFn = @extern(*const fn (?*anyopaque) callconv(.c) void, .{ .name = "g_free" });
    const ret = cFn(@ptrCast(arg_mem));
    return ret;
}
pub fn freeSized(arg_mem: ?*anyopaque, arg_size: u64) void {
    const cFn = @extern(*const fn (?*anyopaque, u64) callconv(.c) void, .{ .name = "g_free_sized" });
    const ret = cFn(@ptrCast(arg_mem), arg_size);
    return ret;
}
pub fn freopen(arg_filename: [*:0]const u8, arg_mode: [*:0]const u8, arg_stream: ?*anyopaque) ?*anyopaque {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, ?*anyopaque) callconv(.c) ?*anyopaque, .{ .name = "g_freopen" });
    const ret = cFn(arg_filename, arg_mode, @ptrCast(arg_stream));
    return ret;
}
pub fn fsync(arg_fd: i32) i32 {
    const cFn = @extern(*const fn (i32) callconv(.c) i32, .{ .name = "g_fsync" });
    const ret = cFn(arg_fd);
    return ret;
}
pub fn getApplicationName() ?[*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) ?[*:0]u8, .{ .name = "g_get_application_name" });
    const ret = cFn();
    return ret;
}
pub fn getCharset() struct {
    ret: bool,
    charset: [*:0]u8,
} {
    var argO_charset: ?[*:0]u8 = undefined;
    const arg_charset: ?*[*:0]u8 = &argO_charset;
    const cFn = @extern(*const fn (?*[*:0]u8) callconv(.c) bool, .{ .name = "g_get_charset" });
    const ret = cFn(arg_charset);
    return .{ .ret = ret, .charset = argO_charset };
}
pub fn getCodeset() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_get_codeset" });
    const ret = cFn();
    return ret;
}
pub fn getConsoleCharset() struct {
    ret: bool,
    charset: [*:0]u8,
} {
    var argO_charset: ?[*:0]u8 = undefined;
    const arg_charset: ?*[*:0]u8 = &argO_charset;
    const cFn = @extern(*const fn (?*[*:0]u8) callconv(.c) bool, .{ .name = "g_get_console_charset" });
    const ret = cFn(arg_charset);
    return .{ .ret = ret, .charset = argO_charset };
}
pub fn getCurrentDir() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_get_current_dir" });
    const ret = cFn();
    return ret;
}
pub fn getCurrentTime(arg_result: *TimeVal) void {
    const cFn = @extern(*const fn (*TimeVal) callconv(.c) void, .{ .name = "g_get_current_time" });
    const ret = cFn(arg_result);
    return ret;
}
pub fn getEnviron() [*]?[*:0]const u8 {
    const cFn = @extern(*const fn () callconv(.c) [*]?[*:0]const u8, .{ .name = "g_get_environ" });
    const ret = cFn();
    return ret;
}
pub fn getFilenameCharsets() struct {
    ret: bool,
    filename_charsets: [*]?[*:0]const u8,
} {
    var argO_filename_charsets: [*]?[*:0]const u8 = undefined;
    const arg_filename_charsets: *[*]?[*:0]const u8 = &argO_filename_charsets;
    const cFn = @extern(*const fn (*[*]?[*:0]const u8) callconv(.c) bool, .{ .name = "g_get_filename_charsets" });
    const ret = cFn(arg_filename_charsets);
    return .{ .ret = ret, .filename_charsets = argO_filename_charsets };
}
pub fn getHomeDir() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_get_home_dir" });
    const ret = cFn();
    return ret;
}
pub fn getHostName() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_get_host_name" });
    const ret = cFn();
    return ret;
}
pub fn getLanguageNames() [*]?[*:0]const u8 {
    const cFn = @extern(*const fn () callconv(.c) [*]?[*:0]const u8, .{ .name = "g_get_language_names" });
    const ret = cFn();
    return ret;
}
pub fn getLanguageNamesWithCategory(arg_category_name: [*:0]const u8) [*]?[*:0]const u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_get_language_names_with_category" });
    const ret = cFn(arg_category_name);
    return ret;
}
pub fn getLocaleVariants(arg_locale: [*:0]const u8) [*]?[*:0]const u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_get_locale_variants" });
    const ret = cFn(arg_locale);
    return ret;
}
pub fn getMonotonicTime() i64 {
    const cFn = @extern(*const fn () callconv(.c) i64, .{ .name = "g_get_monotonic_time" });
    const ret = cFn();
    return ret;
}
pub fn getNumProcessors() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_get_num_processors" });
    const ret = cFn();
    return ret;
}
pub fn getOsInfo(arg_key_name: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_get_os_info" });
    const ret = cFn(arg_key_name);
    return ret;
}
pub fn getPrgname() ?[*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) ?[*:0]u8, .{ .name = "g_get_prgname" });
    const ret = cFn();
    return ret;
}
pub fn getRealName() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_get_real_name" });
    const ret = cFn();
    return ret;
}
pub fn getRealTime() i64 {
    const cFn = @extern(*const fn () callconv(.c) i64, .{ .name = "g_get_real_time" });
    const ret = cFn();
    return ret;
}
pub fn getSystemConfigDirs() [*]?[*:0]const u8 {
    const cFn = @extern(*const fn () callconv(.c) [*]?[*:0]const u8, .{ .name = "g_get_system_config_dirs" });
    const ret = cFn();
    return ret;
}
pub fn getSystemDataDirs() [*]?[*:0]const u8 {
    const cFn = @extern(*const fn () callconv(.c) [*]?[*:0]const u8, .{ .name = "g_get_system_data_dirs" });
    const ret = cFn();
    return ret;
}
pub fn getTmpDir() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_get_tmp_dir" });
    const ret = cFn();
    return ret;
}
pub fn getUserCacheDir() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_get_user_cache_dir" });
    const ret = cFn();
    return ret;
}
pub fn getUserConfigDir() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_get_user_config_dir" });
    const ret = cFn();
    return ret;
}
pub fn getUserDataDir() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_get_user_data_dir" });
    const ret = cFn();
    return ret;
}
pub fn getUserName() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_get_user_name" });
    const ret = cFn();
    return ret;
}
pub fn getUserRuntimeDir() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_get_user_runtime_dir" });
    const ret = cFn();
    return ret;
}
pub fn getUserSpecialDir(arg_directory: UserDirectory) ?[*:0]u8 {
    const cFn = @extern(*const fn (UserDirectory) callconv(.c) ?[*:0]u8, .{ .name = "g_get_user_special_dir" });
    const ret = cFn(arg_directory);
    return ret;
}
pub fn getUserStateDir() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_get_user_state_dir" });
    const ret = cFn();
    return ret;
}
pub fn getenv(arg_variable: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_getenv" });
    const ret = cFn(arg_variable);
    return ret;
}
pub fn hashTableAdd(arg_hash_table: *GLib.HashTable, arg_key: ?*anyopaque) bool {
    const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_add" });
    const ret = cFn(arg_hash_table, @ptrCast(arg_key));
    return ret;
}
pub fn hashTableContains(arg_hash_table: *GLib.HashTable, arg_key: ?*anyopaque) bool {
    const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_contains" });
    const ret = cFn(arg_hash_table, @ptrCast(arg_key));
    return ret;
}
pub fn hashTableDestroy(arg_hash_table: *GLib.HashTable) void {
    const cFn = @extern(*const fn (*GLib.HashTable) callconv(.c) void, .{ .name = "g_hash_table_destroy" });
    const ret = cFn(arg_hash_table);
    return ret;
}
pub fn hashTableFind(arg_hash_table: *GLib.HashTable, argC_predicate: core.Closure(HRFunc)) ?*anyopaque {
    const arg_predicate: HRFunc = @ptrCast(argC_predicate.callback());
    defer argC_predicate.deinit();
    const arg_user_data: ?*anyopaque = @ptrCast(argC_predicate.data());
    const cFn = @extern(*const fn (*GLib.HashTable, HRFunc, ?*anyopaque) callconv(.c) ?*anyopaque, .{ .name = "g_hash_table_find" });
    const ret = cFn(arg_hash_table, arg_predicate, @ptrCast(arg_user_data));
    return ret;
}
pub fn hashTableForeach(arg_hash_table: *GLib.HashTable, argC_func: core.Closure(HFunc)) void {
    const arg_func: HFunc = @ptrCast(argC_func.callback());
    defer argC_func.deinit();
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const cFn = @extern(*const fn (*GLib.HashTable, HFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_hash_table_foreach" });
    const ret = cFn(arg_hash_table, arg_func, @ptrCast(arg_user_data));
    return ret;
}
pub fn hashTableForeachRemove(arg_hash_table: *GLib.HashTable, argC_func: core.Closure(HRFunc)) u32 {
    const arg_func: HRFunc = @ptrCast(argC_func.callback());
    defer argC_func.deinit();
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const cFn = @extern(*const fn (*GLib.HashTable, HRFunc, ?*anyopaque) callconv(.c) u32, .{ .name = "g_hash_table_foreach_remove" });
    const ret = cFn(arg_hash_table, arg_func, @ptrCast(arg_user_data));
    return ret;
}
pub fn hashTableForeachSteal(arg_hash_table: *GLib.HashTable, argC_func: core.Closure(HRFunc)) u32 {
    const arg_func: HRFunc = @ptrCast(argC_func.callback());
    defer argC_func.deinit();
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const cFn = @extern(*const fn (*GLib.HashTable, HRFunc, ?*anyopaque) callconv(.c) u32, .{ .name = "g_hash_table_foreach_steal" });
    const ret = cFn(arg_hash_table, arg_func, @ptrCast(arg_user_data));
    return ret;
}
pub fn hashTableInsert(arg_hash_table: *GLib.HashTable, arg_key: ?*anyopaque, arg_value: ?*anyopaque) bool {
    const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_insert" });
    const ret = cFn(arg_hash_table, @ptrCast(arg_key), @ptrCast(arg_value));
    return ret;
}
pub fn hashTableLookup(arg_hash_table: *GLib.HashTable, arg_key: ?*anyopaque) ?*anyopaque {
    const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque) callconv(.c) ?*anyopaque, .{ .name = "g_hash_table_lookup" });
    const ret = cFn(arg_hash_table, @ptrCast(arg_key));
    return ret;
}
pub fn hashTableLookupExtended(arg_hash_table: *GLib.HashTable, arg_lookup_key: ?*anyopaque) struct {
    ret: bool,
    orig_key: ?*anyopaque,
    value: ?*anyopaque,
} {
    var argO_orig_key: ?*anyopaque = undefined;
    const arg_orig_key: ?*anyopaque = &argO_orig_key;
    var argO_value: ?*anyopaque = undefined;
    const arg_value: ?*anyopaque = &argO_value;
    const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque, ?*anyopaque, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_lookup_extended" });
    const ret = cFn(arg_hash_table, @ptrCast(arg_lookup_key), @ptrCast(arg_orig_key), @ptrCast(arg_value));
    return .{ .ret = ret, .orig_key = argO_orig_key, .value = argO_value };
}
pub fn hashTableNewSimilar(arg_other_hash_table: *GLib.HashTable) *GLib.HashTable {
    const cFn = @extern(*const fn (*GLib.HashTable) callconv(.c) *GLib.HashTable, .{ .name = "g_hash_table_new_similar" });
    const ret = cFn(arg_other_hash_table);
    return ret;
}
pub fn hashTableRef(arg_hash_table: *GLib.HashTable) *GLib.HashTable {
    const cFn = @extern(*const fn (*GLib.HashTable) callconv(.c) *GLib.HashTable, .{ .name = "g_hash_table_ref" });
    const ret = cFn(arg_hash_table);
    return ret;
}
pub fn hashTableRemove(arg_hash_table: *GLib.HashTable, arg_key: ?*anyopaque) bool {
    const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_remove" });
    const ret = cFn(arg_hash_table, @ptrCast(arg_key));
    return ret;
}
pub fn hashTableRemoveAll(arg_hash_table: *GLib.HashTable) void {
    const cFn = @extern(*const fn (*GLib.HashTable) callconv(.c) void, .{ .name = "g_hash_table_remove_all" });
    const ret = cFn(arg_hash_table);
    return ret;
}
pub fn hashTableReplace(arg_hash_table: *GLib.HashTable, arg_key: ?*anyopaque, arg_value: ?*anyopaque) bool {
    const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_replace" });
    const ret = cFn(arg_hash_table, @ptrCast(arg_key), @ptrCast(arg_value));
    return ret;
}
pub fn hashTableSize(arg_hash_table: *GLib.HashTable) u32 {
    const cFn = @extern(*const fn (*GLib.HashTable) callconv(.c) u32, .{ .name = "g_hash_table_size" });
    const ret = cFn(arg_hash_table);
    return ret;
}
pub fn hashTableSteal(arg_hash_table: *GLib.HashTable, arg_key: ?*anyopaque) bool {
    const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_steal" });
    const ret = cFn(arg_hash_table, @ptrCast(arg_key));
    return ret;
}
pub fn hashTableStealAll(arg_hash_table: *GLib.HashTable) void {
    const cFn = @extern(*const fn (*GLib.HashTable) callconv(.c) void, .{ .name = "g_hash_table_steal_all" });
    const ret = cFn(arg_hash_table);
    return ret;
}
pub fn hashTableStealExtended(arg_hash_table: *GLib.HashTable, arg_lookup_key: ?*anyopaque) struct {
    ret: bool,
    stolen_key: ?*anyopaque,
    stolen_value: ?*anyopaque,
} {
    var argO_stolen_key: ?*anyopaque = undefined;
    const arg_stolen_key: ?*anyopaque = &argO_stolen_key;
    var argO_stolen_value: ?*anyopaque = undefined;
    const arg_stolen_value: ?*anyopaque = &argO_stolen_value;
    const cFn = @extern(*const fn (*GLib.HashTable, ?*anyopaque, ?*anyopaque, ?*anyopaque) callconv(.c) bool, .{ .name = "g_hash_table_steal_extended" });
    const ret = cFn(arg_hash_table, @ptrCast(arg_lookup_key), @ptrCast(arg_stolen_key), @ptrCast(arg_stolen_value));
    return .{ .ret = ret, .stolen_key = argO_stolen_key, .stolen_value = argO_stolen_value };
}
pub fn hashTableUnref(arg_hash_table: *GLib.HashTable) void {
    const cFn = @extern(*const fn (*GLib.HashTable) callconv(.c) void, .{ .name = "g_hash_table_unref" });
    const ret = cFn(arg_hash_table);
    return ret;
}
pub fn hookDestroy(arg_hook_list: *HookList, arg_hook_id: u64) bool {
    const cFn = @extern(*const fn (*HookList, u64) callconv(.c) bool, .{ .name = "g_hook_destroy" });
    const ret = cFn(arg_hook_list, arg_hook_id);
    return ret;
}
pub fn hookDestroyLink(arg_hook_list: *HookList, arg_hook: *Hook) void {
    const cFn = @extern(*const fn (*HookList, *Hook) callconv(.c) void, .{ .name = "g_hook_destroy_link" });
    const ret = cFn(arg_hook_list, arg_hook);
    return ret;
}
pub fn hookFree(arg_hook_list: *HookList, arg_hook: *Hook) void {
    const cFn = @extern(*const fn (*HookList, *Hook) callconv(.c) void, .{ .name = "g_hook_free" });
    const ret = cFn(arg_hook_list, arg_hook);
    return ret;
}
pub fn hookInsertBefore(arg_hook_list: *HookList, arg_sibling: ?*Hook, arg_hook: *Hook) void {
    const cFn = @extern(*const fn (*HookList, ?*Hook, *Hook) callconv(.c) void, .{ .name = "g_hook_insert_before" });
    const ret = cFn(arg_hook_list, arg_sibling, arg_hook);
    return ret;
}
pub fn hookInsertSorted(arg_hook_list: *HookList, arg_hook: *Hook, arg_func: HookCompareFunc) void {
    const cFn = @extern(*const fn (*HookList, *Hook, HookCompareFunc) callconv(.c) void, .{ .name = "g_hook_insert_sorted" });
    const ret = cFn(arg_hook_list, arg_hook, arg_func);
    return ret;
}
pub fn hookPrepend(arg_hook_list: *HookList, arg_hook: *Hook) void {
    const cFn = @extern(*const fn (*HookList, *Hook) callconv(.c) void, .{ .name = "g_hook_prepend" });
    const ret = cFn(arg_hook_list, arg_hook);
    return ret;
}
pub fn hookUnref(arg_hook_list: *HookList, arg_hook: *Hook) void {
    const cFn = @extern(*const fn (*HookList, *Hook) callconv(.c) void, .{ .name = "g_hook_unref" });
    const ret = cFn(arg_hook_list, arg_hook);
    return ret;
}
pub fn hostnameIsAsciiEncoded(arg_hostname: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_hostname_is_ascii_encoded" });
    const ret = cFn(arg_hostname);
    return ret;
}
pub fn hostnameIsIpAddress(arg_hostname: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_hostname_is_ip_address" });
    const ret = cFn(arg_hostname);
    return ret;
}
pub fn hostnameIsNonAscii(arg_hostname: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_hostname_is_non_ascii" });
    const ret = cFn(arg_hostname);
    return ret;
}
pub fn hostnameToAscii(arg_hostname: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_hostname_to_ascii" });
    const ret = cFn(arg_hostname);
    return ret;
}
pub fn hostnameToUnicode(arg_hostname: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_hostname_to_unicode" });
    const ret = cFn(arg_hostname);
    return ret;
}
pub fn idleAdd(arg_priority: i32, argC_function: core.Closure(SourceFunc)) u32 {
    const arg_function: SourceFunc = @ptrCast(argC_function.callback());
    const arg_data: ?*anyopaque = @ptrCast(argC_function.data());
    const arg_notify: ?DestroyNotify = @ptrCast(argC_function.destroy());
    const cFn = @extern(*const fn (i32, SourceFunc, ?*anyopaque, ?DestroyNotify) callconv(.c) u32, .{ .name = "g_idle_add_full" });
    const ret = cFn(arg_priority, arg_function, @ptrCast(arg_data), arg_notify);
    return ret;
}
pub fn idleRemoveByData(arg_data: ?*anyopaque) bool {
    const cFn = @extern(*const fn (?*anyopaque) callconv(.c) bool, .{ .name = "g_idle_remove_by_data" });
    const ret = cFn(@ptrCast(arg_data));
    return ret;
}
pub fn idleSourceNew() *Source {
    const cFn = @extern(*const fn () callconv(.c) *Source, .{ .name = "g_idle_source_new" });
    const ret = cFn();
    return ret;
}
pub fn int64Equal(arg_v1: *anyopaque, arg_v2: *anyopaque) bool {
    const cFn = @extern(*const fn (*anyopaque, *anyopaque) callconv(.c) bool, .{ .name = "g_int64_equal" });
    const ret = cFn(@ptrCast(arg_v1), @ptrCast(arg_v2));
    return ret;
}
pub fn int64Hash(arg_v: *anyopaque) u32 {
    const cFn = @extern(*const fn (*anyopaque) callconv(.c) u32, .{ .name = "g_int64_hash" });
    const ret = cFn(@ptrCast(arg_v));
    return ret;
}
pub fn intEqual(arg_v1: *anyopaque, arg_v2: *anyopaque) bool {
    const cFn = @extern(*const fn (*anyopaque, *anyopaque) callconv(.c) bool, .{ .name = "g_int_equal" });
    const ret = cFn(@ptrCast(arg_v1), @ptrCast(arg_v2));
    return ret;
}
pub fn intHash(arg_v: *anyopaque) u32 {
    const cFn = @extern(*const fn (*anyopaque) callconv(.c) u32, .{ .name = "g_int_hash" });
    const ret = cFn(@ptrCast(arg_v));
    return ret;
}
pub fn internStaticString(arg_string: ?[*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_intern_static_string" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn internString(arg_string: ?[*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_intern_string" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn ioAddWatch(arg_channel: *IOChannel, arg_priority: i32, arg_condition: IOCondition, argC_func: core.Closure(IOFunc)) u32 {
    const arg_func: IOFunc = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_notify: DestroyNotify = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*IOChannel, i32, IOCondition, IOFunc, ?*anyopaque, DestroyNotify) callconv(.c) u32, .{ .name = "g_io_add_watch_full" });
    const ret = cFn(arg_channel, arg_priority, arg_condition, arg_func, @ptrCast(arg_user_data), arg_notify);
    return ret;
}
pub fn ioChannelErrorFromErrno(arg_en: i32) IOChannelError {
    const cFn = @extern(*const fn (i32) callconv(.c) IOChannelError, .{ .name = "g_io_channel_error_from_errno" });
    const ret = cFn(arg_en);
    return ret;
}
pub fn ioChannelErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_io_channel_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn ioCreateWatch(arg_channel: *IOChannel, arg_condition: IOCondition) *Source {
    const cFn = @extern(*const fn (*IOChannel, IOCondition) callconv(.c) *Source, .{ .name = "g_io_create_watch" });
    const ret = cFn(arg_channel, arg_condition);
    return ret;
}
pub fn keyFileErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_key_file_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn listPopAllocator() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_list_pop_allocator" });
    const ret = cFn();
    return ret;
}
pub fn listPushAllocator(arg_allocator: *Allocator) void {
    const cFn = @extern(*const fn (*Allocator) callconv(.c) void, .{ .name = "g_list_push_allocator" });
    const ret = cFn(arg_allocator);
    return ret;
}
pub fn listenv() [*]?[*:0]const u8 {
    const cFn = @extern(*const fn () callconv(.c) [*]?[*:0]const u8, .{ .name = "g_listenv" });
    const ret = cFn();
    return ret;
}
pub fn localeFromUtf8(arg_utf8string: [*:0]const u8, arg_len: i64, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: []u8,
    bytes_read: u64,
} {
    var argO_bytes_read: u64 = undefined;
    const arg_bytes_read: ?*u64 = &argO_bytes_read;
    var argO_bytes_written: u64 = undefined;
    const arg_bytes_written: ?*u64 = &argO_bytes_written;
    const cFn = @extern(*const fn ([*:0]const u8, i64, ?*u64, ?*u64, *?*GLib.Error) callconv(.c) [*]u8, .{ .name = "g_locale_from_utf8" });
    const ret = cFn(arg_utf8string, arg_len, arg_bytes_read, arg_bytes_written, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret[0..@intCast(argO_bytes_written)], .bytes_read = argO_bytes_read };
}
pub fn localeToUtf8(argS_opsysstring: []u8, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: [*:0]u8,
    bytes_read: u64,
    bytes_written: u64,
} {
    const arg_opsysstring: [*]u8 = @ptrCast(argS_opsysstring);
    const arg_len: i64 = @intCast((argS_opsysstring).len);
    var argO_bytes_read: u64 = undefined;
    const arg_bytes_read: ?*u64 = &argO_bytes_read;
    var argO_bytes_written: u64 = undefined;
    const arg_bytes_written: ?*u64 = &argO_bytes_written;
    const cFn = @extern(*const fn ([*]u8, i64, ?*u64, ?*u64, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_locale_to_utf8" });
    const ret = cFn(arg_opsysstring, arg_len, arg_bytes_read, arg_bytes_written, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .bytes_read = argO_bytes_read, .bytes_written = argO_bytes_written };
}
pub fn logDefaultHandler(arg_log_domain: ?[*:0]const u8, arg_log_level: LogLevelFlags, arg_message: ?[*:0]const u8, arg_unused_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (?[*:0]const u8, LogLevelFlags, ?[*:0]const u8, ?*anyopaque) callconv(.c) void, .{ .name = "g_log_default_handler" });
    const ret = cFn(arg_log_domain, arg_log_level, arg_message, @ptrCast(arg_unused_data));
    return ret;
}
pub fn logGetAlwaysFatal() LogLevelFlags {
    const cFn = @extern(*const fn () callconv(.c) LogLevelFlags, .{ .name = "g_log_get_always_fatal" });
    const ret = cFn();
    return ret;
}
pub fn logGetDebugEnabled() bool {
    const cFn = @extern(*const fn () callconv(.c) bool, .{ .name = "g_log_get_debug_enabled" });
    const ret = cFn();
    return ret;
}
pub fn logRemoveHandler(arg_log_domain: [*:0]const u8, arg_handler_id: u32) void {
    const cFn = @extern(*const fn ([*:0]const u8, u32) callconv(.c) void, .{ .name = "g_log_remove_handler" });
    const ret = cFn(arg_log_domain, arg_handler_id);
    return ret;
}
pub fn logSetAlwaysFatal(arg_fatal_mask: LogLevelFlags) LogLevelFlags {
    const cFn = @extern(*const fn (LogLevelFlags) callconv(.c) LogLevelFlags, .{ .name = "g_log_set_always_fatal" });
    const ret = cFn(arg_fatal_mask);
    return ret;
}
pub fn logSetDebugEnabled(arg_enabled: bool) void {
    const cFn = @extern(*const fn (bool) callconv(.c) void, .{ .name = "g_log_set_debug_enabled" });
    const ret = cFn(arg_enabled);
    return ret;
}
pub fn logSetFatalMask(arg_log_domain: [*:0]const u8, arg_fatal_mask: LogLevelFlags) LogLevelFlags {
    const cFn = @extern(*const fn ([*:0]const u8, LogLevelFlags) callconv(.c) LogLevelFlags, .{ .name = "g_log_set_fatal_mask" });
    const ret = cFn(arg_log_domain, arg_fatal_mask);
    return ret;
}
pub fn logSetHandler(arg_log_domain: ?[*:0]const u8, arg_log_levels: LogLevelFlags, argC_log_func: core.Closure(LogFunc)) u32 {
    const arg_log_func: LogFunc = @ptrCast(argC_log_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_log_func.data());
    const arg_destroy: DestroyNotify = @ptrCast(argC_log_func.destroy());
    const cFn = @extern(*const fn (?[*:0]const u8, LogLevelFlags, LogFunc, ?*anyopaque, DestroyNotify) callconv(.c) u32, .{ .name = "g_log_set_handler_full" });
    const ret = cFn(arg_log_domain, arg_log_levels, arg_log_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn logSetWriterFunc(argC_func: core.Closure(LogWriterFunc)) void {
    const arg_func: LogWriterFunc = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_user_data_free: DestroyNotify = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (LogWriterFunc, ?*anyopaque, DestroyNotify) callconv(.c) void, .{ .name = "g_log_set_writer_func" });
    const ret = cFn(arg_func, @ptrCast(arg_user_data), arg_user_data_free);
    return ret;
}
pub fn logStructuredArray(arg_log_level: LogLevelFlags, argS_fields: []LogField) void {
    const arg_fields: [*]LogField = @ptrCast(argS_fields);
    const arg_n_fields: u64 = @intCast((argS_fields).len);
    const cFn = @extern(*const fn (LogLevelFlags, [*]LogField, u64) callconv(.c) void, .{ .name = "g_log_structured_array" });
    const ret = cFn(arg_log_level, arg_fields, arg_n_fields);
    return ret;
}
pub fn logVariant(arg_log_domain: ?[*:0]const u8, arg_log_level: LogLevelFlags, arg_fields: *Variant) void {
    const cFn = @extern(*const fn (?[*:0]const u8, LogLevelFlags, *Variant) callconv(.c) void, .{ .name = "g_log_variant" });
    const ret = cFn(arg_log_domain, arg_log_level, arg_fields);
    return ret;
}
pub fn logWriterDefault(arg_log_level: LogLevelFlags, argS_fields: []LogField, arg_user_data: ?*anyopaque) LogWriterOutput {
    const arg_fields: [*]LogField = @ptrCast(argS_fields);
    const arg_n_fields: u64 = @intCast((argS_fields).len);
    const cFn = @extern(*const fn (LogLevelFlags, [*]LogField, u64, ?*anyopaque) callconv(.c) LogWriterOutput, .{ .name = "g_log_writer_default" });
    const ret = cFn(arg_log_level, arg_fields, arg_n_fields, @ptrCast(arg_user_data));
    return ret;
}
pub fn logWriterDefaultSetDebugDomains(arg_domains: ?[*:0]const u8) void {
    const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) void, .{ .name = "g_log_writer_default_set_debug_domains" });
    const ret = cFn(arg_domains);
    return ret;
}
pub fn logWriterDefaultSetUseStderr(arg_use_stderr: bool) void {
    const cFn = @extern(*const fn (bool) callconv(.c) void, .{ .name = "g_log_writer_default_set_use_stderr" });
    const ret = cFn(arg_use_stderr);
    return ret;
}
pub fn logWriterDefaultWouldDrop(arg_log_level: LogLevelFlags, arg_log_domain: ?[*:0]const u8) bool {
    const cFn = @extern(*const fn (LogLevelFlags, ?[*:0]const u8) callconv(.c) bool, .{ .name = "g_log_writer_default_would_drop" });
    const ret = cFn(arg_log_level, arg_log_domain);
    return ret;
}
pub fn logWriterFormatFields(arg_log_level: LogLevelFlags, argS_fields: []LogField, arg_use_color: bool) [*:0]u8 {
    const arg_fields: [*]LogField = @ptrCast(argS_fields);
    const arg_n_fields: u64 = @intCast((argS_fields).len);
    const cFn = @extern(*const fn (LogLevelFlags, [*]LogField, u64, bool) callconv(.c) [*:0]u8, .{ .name = "g_log_writer_format_fields" });
    const ret = cFn(arg_log_level, arg_fields, arg_n_fields, arg_use_color);
    return ret;
}
pub fn logWriterIsJournald(arg_output_fd: i32) bool {
    const cFn = @extern(*const fn (i32) callconv(.c) bool, .{ .name = "g_log_writer_is_journald" });
    const ret = cFn(arg_output_fd);
    return ret;
}
pub fn logWriterJournald(arg_log_level: LogLevelFlags, argS_fields: []LogField, arg_user_data: ?*anyopaque) LogWriterOutput {
    const arg_fields: [*]LogField = @ptrCast(argS_fields);
    const arg_n_fields: u64 = @intCast((argS_fields).len);
    const cFn = @extern(*const fn (LogLevelFlags, [*]LogField, u64, ?*anyopaque) callconv(.c) LogWriterOutput, .{ .name = "g_log_writer_journald" });
    const ret = cFn(arg_log_level, arg_fields, arg_n_fields, @ptrCast(arg_user_data));
    return ret;
}
pub fn logWriterStandardStreams(arg_log_level: LogLevelFlags, argS_fields: []LogField, arg_user_data: ?*anyopaque) LogWriterOutput {
    const arg_fields: [*]LogField = @ptrCast(argS_fields);
    const arg_n_fields: u64 = @intCast((argS_fields).len);
    const cFn = @extern(*const fn (LogLevelFlags, [*]LogField, u64, ?*anyopaque) callconv(.c) LogWriterOutput, .{ .name = "g_log_writer_standard_streams" });
    const ret = cFn(arg_log_level, arg_fields, arg_n_fields, @ptrCast(arg_user_data));
    return ret;
}
pub fn logWriterSupportsColor(arg_output_fd: i32) bool {
    const cFn = @extern(*const fn (i32) callconv(.c) bool, .{ .name = "g_log_writer_supports_color" });
    const ret = cFn(arg_output_fd);
    return ret;
}
pub fn logWriterSyslog(arg_log_level: LogLevelFlags, argS_fields: []LogField, arg_user_data: ?*anyopaque) LogWriterOutput {
    const arg_fields: [*]LogField = @ptrCast(argS_fields);
    const arg_n_fields: u64 = @intCast((argS_fields).len);
    const cFn = @extern(*const fn (LogLevelFlags, [*]LogField, u64, ?*anyopaque) callconv(.c) LogWriterOutput, .{ .name = "g_log_writer_syslog" });
    const ret = cFn(arg_log_level, arg_fields, arg_n_fields, @ptrCast(arg_user_data));
    return ret;
}
pub fn lstat(arg_filename: [*:0]const u8, arg_buf: *StatBuf) i32 {
    const cFn = @extern(*const fn ([*:0]const u8, *StatBuf) callconv(.c) i32, .{ .name = "g_lstat" });
    const ret = cFn(arg_filename, arg_buf);
    return ret;
}
pub const macro__has_attribute___noreturn__ = 0;
pub const macro__has_attribute_ifunc = 0;
pub const macro__has_attribute_no_sanitize_address = 0;
pub fn mainContextDefault() *MainContext {
    const cFn = @extern(*const fn () callconv(.c) *MainContext, .{ .name = "g_main_context_default" });
    const ret = cFn();
    return ret;
}
pub fn mainContextGetThreadDefault() ?*MainContext {
    const cFn = @extern(*const fn () callconv(.c) ?*MainContext, .{ .name = "g_main_context_get_thread_default" });
    const ret = cFn();
    return ret;
}
pub fn mainContextRefThreadDefault() *MainContext {
    const cFn = @extern(*const fn () callconv(.c) *MainContext, .{ .name = "g_main_context_ref_thread_default" });
    const ret = cFn();
    return ret;
}
pub fn mainCurrentSource() ?*Source {
    const cFn = @extern(*const fn () callconv(.c) ?*Source, .{ .name = "g_main_current_source" });
    const ret = cFn();
    return ret;
}
pub fn mainDepth() i32 {
    const cFn = @extern(*const fn () callconv(.c) i32, .{ .name = "g_main_depth" });
    const ret = cFn();
    return ret;
}
pub fn malloc(arg_n_bytes: u64) ?*anyopaque {
    const cFn = @extern(*const fn (u64) callconv(.c) ?*anyopaque, .{ .name = "g_malloc" });
    const ret = cFn(arg_n_bytes);
    return ret;
}
pub fn malloc0(arg_n_bytes: u64) ?*anyopaque {
    const cFn = @extern(*const fn (u64) callconv(.c) ?*anyopaque, .{ .name = "g_malloc0" });
    const ret = cFn(arg_n_bytes);
    return ret;
}
pub fn malloc0N(arg_n_blocks: u64, arg_n_block_bytes: u64) ?*anyopaque {
    const cFn = @extern(*const fn (u64, u64) callconv(.c) ?*anyopaque, .{ .name = "g_malloc0_n" });
    const ret = cFn(arg_n_blocks, arg_n_block_bytes);
    return ret;
}
pub fn mallocN(arg_n_blocks: u64, arg_n_block_bytes: u64) ?*anyopaque {
    const cFn = @extern(*const fn (u64, u64) callconv(.c) ?*anyopaque, .{ .name = "g_malloc_n" });
    const ret = cFn(arg_n_blocks, arg_n_block_bytes);
    return ret;
}
pub fn markupErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_markup_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn markupEscapeText(arg_text: [*:0]const u8, arg_length: i64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64) callconv(.c) [*:0]u8, .{ .name = "g_markup_escape_text" });
    const ret = cFn(arg_text, arg_length);
    return ret;
}
pub fn memChunkInfo() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_mem_chunk_info" });
    const ret = cFn();
    return ret;
}
pub fn memIsSystemMalloc() bool {
    const cFn = @extern(*const fn () callconv(.c) bool, .{ .name = "g_mem_is_system_malloc" });
    const ret = cFn();
    return ret;
}
pub fn memProfile() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_mem_profile" });
    const ret = cFn();
    return ret;
}
pub fn memSetVtable(arg_vtable: *MemVTable) void {
    const cFn = @extern(*const fn (*MemVTable) callconv(.c) void, .{ .name = "g_mem_set_vtable" });
    const ret = cFn(arg_vtable);
    return ret;
}
pub fn memdup(arg_mem: ?*anyopaque, arg_byte_size: u32) ?*anyopaque {
    const cFn = @extern(*const fn (?*anyopaque, u32) callconv(.c) ?*anyopaque, .{ .name = "g_memdup" });
    const ret = cFn(@ptrCast(arg_mem), arg_byte_size);
    return ret;
}
pub fn memdup2(arg_mem: ?*anyopaque, arg_byte_size: u64) ?*anyopaque {
    const cFn = @extern(*const fn (?*anyopaque, u64) callconv(.c) ?*anyopaque, .{ .name = "g_memdup2" });
    const ret = cFn(@ptrCast(arg_mem), arg_byte_size);
    return ret;
}
pub fn mkdir(arg_filename: [*:0]const u8, arg_mode: i32) i32 {
    const cFn = @extern(*const fn ([*:0]const u8, i32) callconv(.c) i32, .{ .name = "g_mkdir" });
    const ret = cFn(arg_filename, arg_mode);
    return ret;
}
pub fn mkdirWithParents(arg_pathname: [*:0]const u8, arg_mode: i32) i32 {
    const cFn = @extern(*const fn ([*:0]const u8, i32) callconv(.c) i32, .{ .name = "g_mkdir_with_parents" });
    const ret = cFn(arg_pathname, arg_mode);
    return ret;
}
pub fn nodePopAllocator() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_node_pop_allocator" });
    const ret = cFn();
    return ret;
}
pub fn nodePushAllocator(arg_allocator: *Allocator) void {
    const cFn = @extern(*const fn (*Allocator) callconv(.c) void, .{ .name = "g_node_push_allocator" });
    const ret = cFn(arg_allocator);
    return ret;
}
pub fn nullifyPointer(arg_nullify_location: *anyopaque) void {
    const cFn = @extern(*const fn (*anyopaque) callconv(.c) void, .{ .name = "g_nullify_pointer" });
    const ret = cFn(@ptrCast(arg_nullify_location));
    return ret;
}
pub fn numberParserErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_number_parser_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn onErrorQuery(arg_prg_name: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) void, .{ .name = "g_on_error_query" });
    const ret = cFn(arg_prg_name);
    return ret;
}
pub fn onErrorStackTrace(arg_prg_name: ?[*:0]const u8) void {
    const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) void, .{ .name = "g_on_error_stack_trace" });
    const ret = cFn(arg_prg_name);
    return ret;
}
pub fn onceInitEnter(arg_location: *anyopaque) bool {
    const cFn = @extern(*const fn (*anyopaque) callconv(.c) bool, .{ .name = "g_once_init_enter" });
    const ret = cFn(@ptrCast(arg_location));
    return ret;
}
pub fn onceInitEnterImpl(arg_location: *u64) bool {
    const cFn = @extern(*const fn (*u64) callconv(.c) bool, .{ .name = "g_once_init_enter_impl" });
    const ret = cFn(arg_location);
    return ret;
}
pub fn onceInitEnterPointer(arg_location: *anyopaque) bool {
    const cFn = @extern(*const fn (*anyopaque) callconv(.c) bool, .{ .name = "g_once_init_enter_pointer" });
    const ret = cFn(@ptrCast(arg_location));
    return ret;
}
pub fn onceInitLeave(arg_location: *anyopaque, arg_result: u64) void {
    const cFn = @extern(*const fn (*anyopaque, u64) callconv(.c) void, .{ .name = "g_once_init_leave" });
    const ret = cFn(@ptrCast(arg_location), arg_result);
    return ret;
}
pub fn onceInitLeavePointer(arg_location: *anyopaque, arg_result: ?*anyopaque) void {
    const cFn = @extern(*const fn (*anyopaque, ?*anyopaque) callconv(.c) void, .{ .name = "g_once_init_leave_pointer" });
    const ret = cFn(@ptrCast(arg_location), @ptrCast(arg_result));
    return ret;
}
pub fn open(arg_filename: [*:0]const u8, arg_flags: i32, arg_mode: i32) i32 {
    const cFn = @extern(*const fn ([*:0]const u8, i32, i32) callconv(.c) i32, .{ .name = "g_open" });
    const ret = cFn(arg_filename, arg_flags, arg_mode);
    return ret;
}
pub fn optionErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_option_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn parseDebugString(arg_string: ?[*:0]const u8, argS_keys: []DebugKey) u32 {
    const arg_keys: [*]DebugKey = @ptrCast(argS_keys);
    const arg_nkeys: u32 = @intCast((argS_keys).len);
    const cFn = @extern(*const fn (?[*:0]const u8, [*]DebugKey, u32) callconv(.c) u32, .{ .name = "g_parse_debug_string" });
    const ret = cFn(arg_string, arg_keys, arg_nkeys);
    return ret;
}
pub fn pathBufEqual(arg_v1: *anyopaque, arg_v2: *anyopaque) bool {
    const cFn = @extern(*const fn (*anyopaque, *anyopaque) callconv(.c) bool, .{ .name = "g_path_buf_equal" });
    const ret = cFn(@ptrCast(arg_v1), @ptrCast(arg_v2));
    return ret;
}
pub fn pathGetBasename(arg_file_name: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_path_get_basename" });
    const ret = cFn(arg_file_name);
    return ret;
}
pub fn pathGetDirname(arg_file_name: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_path_get_dirname" });
    const ret = cFn(arg_file_name);
    return ret;
}
pub fn pathIsAbsolute(arg_file_name: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_path_is_absolute" });
    const ret = cFn(arg_file_name);
    return ret;
}
pub fn pathSkipRoot(arg_file_name: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_path_skip_root" });
    const ret = cFn(arg_file_name);
    return ret;
}
pub fn patternMatchSimple(arg_pattern: [*:0]const u8, arg_string: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) bool, .{ .name = "g_pattern_match_simple" });
    const ret = cFn(arg_pattern, arg_string);
    return ret;
}
pub fn pointerBitLock(arg_address: *anyopaque, arg_lock_bit: i32) void {
    const cFn = @extern(*const fn (*anyopaque, i32) callconv(.c) void, .{ .name = "g_pointer_bit_lock" });
    const ret = cFn(@ptrCast(arg_address), arg_lock_bit);
    return ret;
}
pub fn pointerBitLockAndGet(arg_address: *anyopaque, arg_lock_bit: u32) u64 {
    var argO_out_ptr: u64 = undefined;
    const arg_out_ptr: ?*u64 = &argO_out_ptr;
    const cFn = @extern(*const fn (*anyopaque, u32, ?*u64) callconv(.c) void, .{ .name = "g_pointer_bit_lock_and_get" });
    const ret = cFn(@ptrCast(arg_address), arg_lock_bit, arg_out_ptr);
    _ = ret;
    return argO_out_ptr;
}
pub fn pointerBitLockMaskPtr(arg_ptr: ?*anyopaque, arg_lock_bit: u32, arg_set: bool, arg_preserve_mask: u64, arg_preserve_ptr: ?*anyopaque) ?*anyopaque {
    const cFn = @extern(*const fn (?*anyopaque, u32, bool, u64, ?*anyopaque) callconv(.c) ?*anyopaque, .{ .name = "g_pointer_bit_lock_mask_ptr" });
    const ret = cFn(@ptrCast(arg_ptr), arg_lock_bit, arg_set, arg_preserve_mask, @ptrCast(arg_preserve_ptr));
    return ret;
}
pub fn pointerBitTrylock(arg_address: *anyopaque, arg_lock_bit: i32) bool {
    const cFn = @extern(*const fn (*anyopaque, i32) callconv(.c) bool, .{ .name = "g_pointer_bit_trylock" });
    const ret = cFn(@ptrCast(arg_address), arg_lock_bit);
    return ret;
}
pub fn pointerBitUnlock(arg_address: *anyopaque, arg_lock_bit: i32) void {
    const cFn = @extern(*const fn (*anyopaque, i32) callconv(.c) void, .{ .name = "g_pointer_bit_unlock" });
    const ret = cFn(@ptrCast(arg_address), arg_lock_bit);
    return ret;
}
pub fn pointerBitUnlockAndSet(arg_address: *anyopaque, arg_lock_bit: u32, arg_ptr: ?*anyopaque, arg_preserve_mask: u64) void {
    const cFn = @extern(*const fn (*anyopaque, u32, ?*anyopaque, u64) callconv(.c) void, .{ .name = "g_pointer_bit_unlock_and_set" });
    const ret = cFn(@ptrCast(arg_address), arg_lock_bit, @ptrCast(arg_ptr), arg_preserve_mask);
    return ret;
}
pub fn poll(arg_fds: *PollFD, arg_nfds: u32, arg_timeout: i32) i32 {
    const cFn = @extern(*const fn (*PollFD, u32, i32) callconv(.c) i32, .{ .name = "g_poll" });
    const ret = cFn(arg_fds, arg_nfds, arg_timeout);
    return ret;
}
pub fn prefixErrorLiteral(arg_err: ?*?*GLib.Error, arg_prefix: [*:0]const u8) void {
    const cFn = @extern(*const fn (?*?*GLib.Error, [*:0]const u8) callconv(.c) void, .{ .name = "g_prefix_error_literal" });
    const ret = cFn(arg_err, arg_prefix);
    return ret;
}
pub fn propagateError(arg_src: *GLib.Error) ?*GLib.Error {
    var argO_dest: ?*GLib.Error = undefined;
    const arg_dest: ?*?*GLib.Error = &argO_dest;
    const cFn = @extern(*const fn (?*?*GLib.Error, *GLib.Error) callconv(.c) void, .{ .name = "g_propagate_error" });
    const ret = cFn(arg_dest, arg_src);
    _ = ret;
    return argO_dest;
}
pub fn qsortWithData(arg_pbase: *anyopaque, arg_total_elems: i32, arg_size: u64, argC_compare_func: core.Closure(CompareDataFunc)) void {
    const arg_compare_func: CompareDataFunc = @ptrCast(argC_compare_func.callback());
    defer argC_compare_func.deinit();
    const arg_user_data: ?*anyopaque = @ptrCast(argC_compare_func.data());
    const cFn = @extern(*const fn (*anyopaque, i32, u64, CompareDataFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_qsort_with_data" });
    const ret = cFn(@ptrCast(arg_pbase), arg_total_elems, arg_size, arg_compare_func, @ptrCast(arg_user_data));
    return ret;
}
pub fn quarkFromStaticString(arg_string: ?[*:0]const u8) u32 {
    const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) u32, .{ .name = "g_quark_from_static_string" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn quarkFromString(arg_string: ?[*:0]const u8) u32 {
    const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) u32, .{ .name = "g_quark_from_string" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn quarkToString(arg_quark: u32) [*:0]u8 {
    const cFn = @extern(*const fn (u32) callconv(.c) [*:0]u8, .{ .name = "g_quark_to_string" });
    const ret = cFn(arg_quark);
    return ret;
}
pub fn quarkTryString(arg_string: ?[*:0]const u8) u32 {
    const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) u32, .{ .name = "g_quark_try_string" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn randomDouble() f64 {
    const cFn = @extern(*const fn () callconv(.c) f64, .{ .name = "g_random_double" });
    const ret = cFn();
    return ret;
}
pub fn randomDoubleRange(arg_begin: f64, arg_end: f64) f64 {
    const cFn = @extern(*const fn (f64, f64) callconv(.c) f64, .{ .name = "g_random_double_range" });
    const ret = cFn(arg_begin, arg_end);
    return ret;
}
pub fn randomInt() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_random_int" });
    const ret = cFn();
    return ret;
}
pub fn randomIntRange(arg_begin: i32, arg_end: i32) i32 {
    const cFn = @extern(*const fn (i32, i32) callconv(.c) i32, .{ .name = "g_random_int_range" });
    const ret = cFn(arg_begin, arg_end);
    return ret;
}
pub fn randomSetSeed(arg_seed: u32) void {
    const cFn = @extern(*const fn (u32) callconv(.c) void, .{ .name = "g_random_set_seed" });
    const ret = cFn(arg_seed);
    return ret;
}
pub fn rcBoxAcquire(arg_mem_block: *anyopaque) *anyopaque {
    const cFn = @extern(*const fn (*anyopaque) callconv(.c) *anyopaque, .{ .name = "g_rc_box_acquire" });
    const ret = cFn(@ptrCast(arg_mem_block));
    return ret;
}
pub fn rcBoxAlloc(arg_block_size: u64) *anyopaque {
    const cFn = @extern(*const fn (u64) callconv(.c) *anyopaque, .{ .name = "g_rc_box_alloc" });
    const ret = cFn(arg_block_size);
    return ret;
}
pub fn rcBoxAlloc0(arg_block_size: u64) *anyopaque {
    const cFn = @extern(*const fn (u64) callconv(.c) *anyopaque, .{ .name = "g_rc_box_alloc0" });
    const ret = cFn(arg_block_size);
    return ret;
}
pub fn rcBoxDup(arg_block_size: u64, arg_mem_block: *anyopaque) *anyopaque {
    const cFn = @extern(*const fn (u64, *anyopaque) callconv(.c) *anyopaque, .{ .name = "g_rc_box_dup" });
    const ret = cFn(arg_block_size, @ptrCast(arg_mem_block));
    return ret;
}
pub fn rcBoxGetSize(arg_mem_block: *anyopaque) u64 {
    const cFn = @extern(*const fn (*anyopaque) callconv(.c) u64, .{ .name = "g_rc_box_get_size" });
    const ret = cFn(@ptrCast(arg_mem_block));
    return ret;
}
pub fn rcBoxRelease(arg_mem_block: *anyopaque) void {
    const cFn = @extern(*const fn (*anyopaque) callconv(.c) void, .{ .name = "g_rc_box_release" });
    const ret = cFn(@ptrCast(arg_mem_block));
    return ret;
}
pub fn rcBoxReleaseFull(arg_mem_block: *anyopaque, arg_clear_func: DestroyNotify) void {
    const cFn = @extern(*const fn (*anyopaque, DestroyNotify) callconv(.c) void, .{ .name = "g_rc_box_release_full" });
    const ret = cFn(@ptrCast(arg_mem_block), arg_clear_func);
    return ret;
}
pub fn realloc(arg_mem: ?*anyopaque, arg_n_bytes: u64) ?*anyopaque {
    const cFn = @extern(*const fn (?*anyopaque, u64) callconv(.c) ?*anyopaque, .{ .name = "g_realloc" });
    const ret = cFn(@ptrCast(arg_mem), arg_n_bytes);
    return ret;
}
pub fn reallocN(arg_mem: ?*anyopaque, arg_n_blocks: u64, arg_n_block_bytes: u64) ?*anyopaque {
    const cFn = @extern(*const fn (?*anyopaque, u64, u64) callconv(.c) ?*anyopaque, .{ .name = "g_realloc_n" });
    const ret = cFn(@ptrCast(arg_mem), arg_n_blocks, arg_n_block_bytes);
    return ret;
}
pub fn refCountCompare(arg_rc: *i32, arg_val: i32) bool {
    const cFn = @extern(*const fn (*i32, i32) callconv(.c) bool, .{ .name = "g_ref_count_compare" });
    const ret = cFn(arg_rc, arg_val);
    return ret;
}
pub fn refCountDec(arg_rc: *i32) bool {
    const cFn = @extern(*const fn (*i32) callconv(.c) bool, .{ .name = "g_ref_count_dec" });
    const ret = cFn(arg_rc);
    return ret;
}
pub fn refCountInc(arg_rc: *i32) void {
    const cFn = @extern(*const fn (*i32) callconv(.c) void, .{ .name = "g_ref_count_inc" });
    const ret = cFn(arg_rc);
    return ret;
}
pub fn refCountInit() i32 {
    var argO_rc: i32 = undefined;
    const arg_rc: *i32 = &argO_rc;
    const cFn = @extern(*const fn (*i32) callconv(.c) void, .{ .name = "g_ref_count_init" });
    const ret = cFn(arg_rc);
    _ = ret;
    return argO_rc;
}
pub fn refStringAcquire(arg_str: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_ref_string_acquire" });
    const ret = cFn(arg_str);
    return ret;
}
pub fn refStringEqual(arg_str1: [*:0]const u8, arg_str2: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) bool, .{ .name = "g_ref_string_equal" });
    const ret = cFn(arg_str1, arg_str2);
    return ret;
}
pub fn refStringLength(arg_str: [*:0]const u8) u64 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) u64, .{ .name = "g_ref_string_length" });
    const ret = cFn(arg_str);
    return ret;
}
pub fn refStringNew(arg_str: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_ref_string_new" });
    const ret = cFn(arg_str);
    return ret;
}
pub fn refStringNewIntern(arg_str: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_ref_string_new_intern" });
    const ret = cFn(arg_str);
    return ret;
}
pub fn refStringNewLen(arg_str: [*:0]const u8, arg_len: i64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64) callconv(.c) [*:0]u8, .{ .name = "g_ref_string_new_len" });
    const ret = cFn(arg_str, arg_len);
    return ret;
}
pub fn refStringRelease(arg_str: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) void, .{ .name = "g_ref_string_release" });
    const ret = cFn(arg_str);
    return ret;
}
pub fn regexCheckReplacement(arg_replacement: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    has_references: bool,
} {
    var argO_has_references: bool = undefined;
    const arg_has_references: ?*bool = &argO_has_references;
    const cFn = @extern(*const fn ([*:0]const u8, ?*bool, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_regex_check_replacement" });
    const ret = cFn(arg_replacement, arg_has_references, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .has_references = argO_has_references };
}
pub fn regexErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_regex_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn regexEscapeNul(arg_string: [*:0]const u8, arg_length: i32) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i32) callconv(.c) [*:0]u8, .{ .name = "g_regex_escape_nul" });
    const ret = cFn(arg_string, arg_length);
    return ret;
}
pub fn regexEscapeString(arg_string: [*:0]const u8, arg_length: i32) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i32) callconv(.c) [*:0]u8, .{ .name = "g_regex_escape_string" });
    const ret = cFn(arg_string, arg_length);
    return ret;
}
pub fn regexMatchSimple(arg_pattern: [*:0]const u8, arg_string: [*:0]const u8, arg_compile_options: RegexCompileFlags, arg_match_options: RegexMatchFlags) bool {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, RegexCompileFlags, RegexMatchFlags) callconv(.c) bool, .{ .name = "g_regex_match_simple" });
    const ret = cFn(arg_pattern, arg_string, arg_compile_options, arg_match_options);
    return ret;
}
pub fn regexSplitSimple(arg_pattern: [*:0]const u8, arg_string: [*:0]const u8, arg_compile_options: RegexCompileFlags, arg_match_options: RegexMatchFlags) [*]?[*:0]const u8 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, RegexCompileFlags, RegexMatchFlags) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_regex_split_simple" });
    const ret = cFn(arg_pattern, arg_string, arg_compile_options, arg_match_options);
    return ret;
}
pub fn reloadUserSpecialDirsCache() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_reload_user_special_dirs_cache" });
    const ret = cFn();
    return ret;
}
pub fn remove(arg_filename: [*:0]const u8) i32 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) i32, .{ .name = "g_remove" });
    const ret = cFn(arg_filename);
    return ret;
}
pub fn rename(arg_oldfilename: [*:0]const u8, arg_newfilename: [*:0]const u8) i32 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) i32, .{ .name = "g_rename" });
    const ret = cFn(arg_oldfilename, arg_newfilename);
    return ret;
}
pub fn rmdir(arg_filename: [*:0]const u8) i32 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) i32, .{ .name = "g_rmdir" });
    const ret = cFn(arg_filename);
    return ret;
}
pub fn sequenceForeachRange(arg_begin: *SequenceIter, arg_end: *SequenceIter, argC_func: core.Closure(Func)) void {
    const arg_func: Func = @ptrCast(argC_func.callback());
    defer argC_func.deinit();
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const cFn = @extern(*const fn (*SequenceIter, *SequenceIter, Func, ?*anyopaque) callconv(.c) void, .{ .name = "g_sequence_foreach_range" });
    const ret = cFn(arg_begin, arg_end, arg_func, @ptrCast(arg_user_data));
    return ret;
}
pub fn sequenceGet(arg_iter: *SequenceIter) ?*anyopaque {
    const cFn = @extern(*const fn (*SequenceIter) callconv(.c) ?*anyopaque, .{ .name = "g_sequence_get" });
    const ret = cFn(arg_iter);
    return ret;
}
pub fn sequenceInsertBefore(arg_iter: *SequenceIter, arg_data: ?*anyopaque) *SequenceIter {
    const cFn = @extern(*const fn (*SequenceIter, ?*anyopaque) callconv(.c) *SequenceIter, .{ .name = "g_sequence_insert_before" });
    const ret = cFn(arg_iter, @ptrCast(arg_data));
    return ret;
}
pub fn sequenceMove(arg_src: *SequenceIter, arg_dest: *SequenceIter) void {
    const cFn = @extern(*const fn (*SequenceIter, *SequenceIter) callconv(.c) void, .{ .name = "g_sequence_move" });
    const ret = cFn(arg_src, arg_dest);
    return ret;
}
pub fn sequenceMoveRange(arg_dest: *SequenceIter, arg_begin: *SequenceIter, arg_end: *SequenceIter) void {
    const cFn = @extern(*const fn (*SequenceIter, *SequenceIter, *SequenceIter) callconv(.c) void, .{ .name = "g_sequence_move_range" });
    const ret = cFn(arg_dest, arg_begin, arg_end);
    return ret;
}
pub fn sequenceRangeGetMidpoint(arg_begin: *SequenceIter, arg_end: *SequenceIter) *SequenceIter {
    const cFn = @extern(*const fn (*SequenceIter, *SequenceIter) callconv(.c) *SequenceIter, .{ .name = "g_sequence_range_get_midpoint" });
    const ret = cFn(arg_begin, arg_end);
    return ret;
}
pub fn sequenceRemove(arg_iter: *SequenceIter) void {
    const cFn = @extern(*const fn (*SequenceIter) callconv(.c) void, .{ .name = "g_sequence_remove" });
    const ret = cFn(arg_iter);
    return ret;
}
pub fn sequenceRemoveRange(arg_begin: *SequenceIter, arg_end: *SequenceIter) void {
    const cFn = @extern(*const fn (*SequenceIter, *SequenceIter) callconv(.c) void, .{ .name = "g_sequence_remove_range" });
    const ret = cFn(arg_begin, arg_end);
    return ret;
}
pub fn sequenceSet(arg_iter: *SequenceIter, arg_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*SequenceIter, ?*anyopaque) callconv(.c) void, .{ .name = "g_sequence_set" });
    const ret = cFn(arg_iter, @ptrCast(arg_data));
    return ret;
}
pub fn sequenceSortChanged(arg_iter: *SequenceIter, argC_cmp_func: core.Closure(CompareDataFunc)) void {
    const arg_cmp_func: CompareDataFunc = @ptrCast(argC_cmp_func.callback());
    defer argC_cmp_func.deinit();
    const arg_cmp_data: ?*anyopaque = @ptrCast(argC_cmp_func.data());
    const cFn = @extern(*const fn (*SequenceIter, CompareDataFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_sequence_sort_changed" });
    const ret = cFn(arg_iter, arg_cmp_func, @ptrCast(arg_cmp_data));
    return ret;
}
pub fn sequenceSortChangedIter(arg_iter: *SequenceIter, argC_iter_cmp: core.Closure(SequenceIterCompareFunc)) void {
    const arg_iter_cmp: SequenceIterCompareFunc = @ptrCast(argC_iter_cmp.callback());
    defer argC_iter_cmp.deinit();
    const arg_cmp_data: ?*anyopaque = @ptrCast(argC_iter_cmp.data());
    const cFn = @extern(*const fn (*SequenceIter, SequenceIterCompareFunc, ?*anyopaque) callconv(.c) void, .{ .name = "g_sequence_sort_changed_iter" });
    const ret = cFn(arg_iter, arg_iter_cmp, @ptrCast(arg_cmp_data));
    return ret;
}
pub fn sequenceSwap(arg_a: *SequenceIter, arg_b: *SequenceIter) void {
    const cFn = @extern(*const fn (*SequenceIter, *SequenceIter) callconv(.c) void, .{ .name = "g_sequence_swap" });
    const ret = cFn(arg_a, arg_b);
    return ret;
}
pub fn setApplicationName(arg_application_name: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) void, .{ .name = "g_set_application_name" });
    const ret = cFn(arg_application_name);
    return ret;
}
pub fn setErrorLiteral(arg_domain: u32, arg_code: i32, arg_message: [*:0]const u8) *GLib.Error {
    var argO_err: ?*GLib.Error = undefined;
    const arg_err: ?**GLib.Error = &argO_err;
    const cFn = @extern(*const fn (?**GLib.Error, u32, i32, [*:0]const u8) callconv(.c) void, .{ .name = "g_set_error_literal" });
    const ret = cFn(arg_err, arg_domain, arg_code, arg_message);
    _ = ret;
    return argO_err;
}
pub fn setPrgname(arg_prgname: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) void, .{ .name = "g_set_prgname" });
    const ret = cFn(arg_prgname);
    return ret;
}
pub fn setenv(arg_variable: [*:0]const u8, arg_value: [*:0]const u8, arg_overwrite: bool) bool {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, bool) callconv(.c) bool, .{ .name = "g_setenv" });
    const ret = cFn(arg_variable, arg_value, arg_overwrite);
    return ret;
}
pub fn shellErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_shell_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn shellParseArgv(arg_command_line: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    argvp: ?[]?[*:0]const u8,
} {
    var argO_argcp: i32 = undefined;
    const arg_argcp: ?*i32 = &argO_argcp;
    var argO_argvp: ?[*]?[*:0]const u8 = undefined;
    const arg_argvp: ?*[*]?[*:0]const u8 = &argO_argvp;
    const cFn = @extern(*const fn ([*:0]const u8, ?*i32, ?*[*]?[*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_shell_parse_argv" });
    const ret = cFn(arg_command_line, arg_argcp, arg_argvp, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .argvp = argO_argvp[0..@intCast(argO_argcp)] };
}
pub fn shellQuote(arg_unquoted_string: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_shell_quote" });
    const ret = cFn(arg_unquoted_string);
    return ret;
}
pub fn shellUnquote(arg_quoted_string: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_shell_unquote" });
    const ret = cFn(arg_quoted_string, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn sliceAlloc(arg_block_size: u64) ?*anyopaque {
    const cFn = @extern(*const fn (u64) callconv(.c) ?*anyopaque, .{ .name = "g_slice_alloc" });
    const ret = cFn(arg_block_size);
    return ret;
}
pub fn sliceAlloc0(arg_block_size: u64) ?*anyopaque {
    const cFn = @extern(*const fn (u64) callconv(.c) ?*anyopaque, .{ .name = "g_slice_alloc0" });
    const ret = cFn(arg_block_size);
    return ret;
}
pub fn sliceCopy(arg_block_size: u64, arg_mem_block: ?*anyopaque) ?*anyopaque {
    const cFn = @extern(*const fn (u64, ?*anyopaque) callconv(.c) ?*anyopaque, .{ .name = "g_slice_copy" });
    const ret = cFn(arg_block_size, @ptrCast(arg_mem_block));
    return ret;
}
pub fn sliceFree1(arg_block_size: u64, arg_mem_block: ?*anyopaque) void {
    const cFn = @extern(*const fn (u64, ?*anyopaque) callconv(.c) void, .{ .name = "g_slice_free1" });
    const ret = cFn(arg_block_size, @ptrCast(arg_mem_block));
    return ret;
}
pub fn sliceFreeChainWithOffset(arg_block_size: u64, arg_mem_chain: ?*anyopaque, arg_next_offset: u64) void {
    const cFn = @extern(*const fn (u64, ?*anyopaque, u64) callconv(.c) void, .{ .name = "g_slice_free_chain_with_offset" });
    const ret = cFn(arg_block_size, @ptrCast(arg_mem_chain), arg_next_offset);
    return ret;
}
pub fn sliceGetConfig(arg_ckey: SliceConfig) i64 {
    const cFn = @extern(*const fn (SliceConfig) callconv(.c) i64, .{ .name = "g_slice_get_config" });
    const ret = cFn(arg_ckey);
    return ret;
}
pub fn sliceGetConfigState(arg_ckey: SliceConfig, arg_address: i64, arg_n_values: *u32) *i64 {
    const cFn = @extern(*const fn (SliceConfig, i64, *u32) callconv(.c) *i64, .{ .name = "g_slice_get_config_state" });
    const ret = cFn(arg_ckey, arg_address, arg_n_values);
    return ret;
}
pub fn sliceSetConfig(arg_ckey: SliceConfig, arg_value: i64) void {
    const cFn = @extern(*const fn (SliceConfig, i64) callconv(.c) void, .{ .name = "g_slice_set_config" });
    const ret = cFn(arg_ckey, arg_value);
    return ret;
}
pub fn slistPopAllocator() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_slist_pop_allocator" });
    const ret = cFn();
    return ret;
}
pub fn slistPushAllocator(arg_allocator: *Allocator) void {
    const cFn = @extern(*const fn (*Allocator) callconv(.c) void, .{ .name = "g_slist_push_allocator" });
    const ret = cFn(arg_allocator);
    return ret;
}
pub fn sourceRemove(arg_tag: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_source_remove" });
    const ret = cFn(arg_tag);
    return ret;
}
pub fn sourceRemoveByFuncsUserData(arg_funcs: *SourceFuncs, arg_user_data: ?*anyopaque) bool {
    const cFn = @extern(*const fn (*SourceFuncs, ?*anyopaque) callconv(.c) bool, .{ .name = "g_source_remove_by_funcs_user_data" });
    const ret = cFn(arg_funcs, @ptrCast(arg_user_data));
    return ret;
}
pub fn sourceRemoveByUserData(arg_user_data: ?*anyopaque) bool {
    const cFn = @extern(*const fn (?*anyopaque) callconv(.c) bool, .{ .name = "g_source_remove_by_user_data" });
    const ret = cFn(@ptrCast(arg_user_data));
    return ret;
}
pub fn sourceSetNameById(arg_tag: u32, arg_name: [*:0]const u8) void {
    const cFn = @extern(*const fn (u32, [*:0]const u8) callconv(.c) void, .{ .name = "g_source_set_name_by_id" });
    const ret = cFn(arg_tag, arg_name);
    return ret;
}
pub fn spacedPrimesClosest(arg_num: u32) u32 {
    const cFn = @extern(*const fn (u32) callconv(.c) u32, .{ .name = "g_spaced_primes_closest" });
    const ret = cFn(arg_num);
    return ret;
}
pub fn spawnAsync(arg_working_directory: ?[*:0]const u8, arg_argv: [*]?[*:0]const u8, arg_envp: ?[*]?[*:0]const u8, arg_flags: SpawnFlags, argC_child_setup: core.Closure(?SpawnChildSetupFunc), arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    child_pid: i32,
} {
    const arg_child_setup: ?SpawnChildSetupFunc = @ptrCast(argC_child_setup.callback());
    argC_child_setup.closure.once = true;
    const arg_user_data: ?*anyopaque = @ptrCast(argC_child_setup.data());
    var argO_child_pid: i32 = undefined;
    const arg_child_pid: ?*i32 = &argO_child_pid;
    const cFn = @extern(*const fn (?[*:0]const u8, [*]?[*:0]const u8, ?[*]?[*:0]const u8, SpawnFlags, ?SpawnChildSetupFunc, ?*anyopaque, ?*i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_spawn_async" });
    const ret = cFn(arg_working_directory, arg_argv, arg_envp, arg_flags, arg_child_setup, @ptrCast(arg_user_data), arg_child_pid, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .child_pid = argO_child_pid };
}
pub fn spawnAsyncWithFds(arg_working_directory: ?[*:0]const u8, arg_argv: [*]?[*:0]const u8, arg_envp: ?[*]?[*:0]const u8, arg_flags: SpawnFlags, argC_child_setup: core.Closure(?SpawnChildSetupFunc), arg_stdin_fd: i32, arg_stdout_fd: i32, arg_stderr_fd: i32, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    child_pid: i32,
} {
    const arg_child_setup: ?SpawnChildSetupFunc = @ptrCast(argC_child_setup.callback());
    argC_child_setup.closure.once = true;
    const arg_user_data: ?*anyopaque = @ptrCast(argC_child_setup.data());
    var argO_child_pid: i32 = undefined;
    const arg_child_pid: ?*i32 = &argO_child_pid;
    const cFn = @extern(*const fn (?[*:0]const u8, [*]?[*:0]const u8, ?[*]?[*:0]const u8, SpawnFlags, ?SpawnChildSetupFunc, ?*anyopaque, ?*i32, i32, i32, i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_spawn_async_with_fds" });
    const ret = cFn(arg_working_directory, arg_argv, arg_envp, arg_flags, arg_child_setup, @ptrCast(arg_user_data), arg_child_pid, arg_stdin_fd, arg_stdout_fd, arg_stderr_fd, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .child_pid = argO_child_pid };
}
pub fn spawnAsyncWithPipes(arg_working_directory: ?[*:0]const u8, arg_argv: [*]?[*:0]const u8, arg_envp: ?[*]?[*:0]const u8, arg_flags: SpawnFlags, argC_child_setup: core.Closure(?SpawnChildSetupFunc), arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    child_pid: i32,
    standard_input: i32,
    standard_output: i32,
    standard_error: i32,
} {
    const arg_child_setup: ?SpawnChildSetupFunc = @ptrCast(argC_child_setup.callback());
    argC_child_setup.closure.once = true;
    const arg_user_data: ?*anyopaque = @ptrCast(argC_child_setup.data());
    var argO_child_pid: i32 = undefined;
    const arg_child_pid: ?*i32 = &argO_child_pid;
    var argO_standard_input: i32 = undefined;
    const arg_standard_input: ?*i32 = &argO_standard_input;
    var argO_standard_output: i32 = undefined;
    const arg_standard_output: ?*i32 = &argO_standard_output;
    var argO_standard_error: i32 = undefined;
    const arg_standard_error: ?*i32 = &argO_standard_error;
    const cFn = @extern(*const fn (?[*:0]const u8, [*]?[*:0]const u8, ?[*]?[*:0]const u8, SpawnFlags, ?SpawnChildSetupFunc, ?*anyopaque, ?*i32, ?*i32, ?*i32, ?*i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_spawn_async_with_pipes" });
    const ret = cFn(arg_working_directory, arg_argv, arg_envp, arg_flags, arg_child_setup, @ptrCast(arg_user_data), arg_child_pid, arg_standard_input, arg_standard_output, arg_standard_error, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .child_pid = argO_child_pid, .standard_input = argO_standard_input, .standard_output = argO_standard_output, .standard_error = argO_standard_error };
}
pub fn spawnAsyncWithPipesAndFds(arg_working_directory: ?[*:0]const u8, arg_argv: [*]?[*:0]const u8, arg_envp: ?[*]?[*:0]const u8, arg_flags: SpawnFlags, argC_child_setup: core.Closure(?SpawnChildSetupFunc), arg_stdin_fd: i32, arg_stdout_fd: i32, arg_stderr_fd: i32, argS_source_fds: []i32, argS_target_fds: []i32, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    child_pid_out: i32,
    stdin_pipe_out: i32,
    stdout_pipe_out: i32,
    stderr_pipe_out: i32,
} {
    const arg_child_setup: ?SpawnChildSetupFunc = @ptrCast(argC_child_setup.callback());
    argC_child_setup.closure.once = true;
    const arg_user_data: ?*anyopaque = @ptrCast(argC_child_setup.data());
    const arg_source_fds: ?[*]i32 = @ptrCast(argS_source_fds);
    const arg_target_fds: ?[*]i32 = @ptrCast(argS_target_fds);
    const arg_n_fds: u64 = @intCast((argS_source_fds).len);
    var argO_child_pid_out: i32 = undefined;
    const arg_child_pid_out: ?*i32 = &argO_child_pid_out;
    var argO_stdin_pipe_out: i32 = undefined;
    const arg_stdin_pipe_out: ?*i32 = &argO_stdin_pipe_out;
    var argO_stdout_pipe_out: i32 = undefined;
    const arg_stdout_pipe_out: ?*i32 = &argO_stdout_pipe_out;
    var argO_stderr_pipe_out: i32 = undefined;
    const arg_stderr_pipe_out: ?*i32 = &argO_stderr_pipe_out;
    const cFn = @extern(*const fn (?[*:0]const u8, [*]?[*:0]const u8, ?[*]?[*:0]const u8, SpawnFlags, ?SpawnChildSetupFunc, ?*anyopaque, i32, i32, i32, ?[*]i32, ?[*]i32, u64, ?*i32, ?*i32, ?*i32, ?*i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_spawn_async_with_pipes_and_fds" });
    const ret = cFn(arg_working_directory, arg_argv, arg_envp, arg_flags, arg_child_setup, @ptrCast(arg_user_data), arg_stdin_fd, arg_stdout_fd, arg_stderr_fd, arg_source_fds, arg_target_fds, arg_n_fds, arg_child_pid_out, arg_stdin_pipe_out, arg_stdout_pipe_out, arg_stderr_pipe_out, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .child_pid_out = argO_child_pid_out, .stdin_pipe_out = argO_stdin_pipe_out, .stdout_pipe_out = argO_stdout_pipe_out, .stderr_pipe_out = argO_stderr_pipe_out };
}
pub fn spawnCheckExitStatus(arg_wait_status: i32, arg_error: *?*GLib.Error) error{GError}!bool {
    const cFn = @extern(*const fn (i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_spawn_check_exit_status" });
    const ret = cFn(arg_wait_status, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn spawnCheckWaitStatus(arg_wait_status: i32, arg_error: *?*GLib.Error) error{GError}!bool {
    const cFn = @extern(*const fn (i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_spawn_check_wait_status" });
    const ret = cFn(arg_wait_status, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn spawnClosePid(arg_pid: i32) void {
    const cFn = @extern(*const fn (i32) callconv(.c) void, .{ .name = "g_spawn_close_pid" });
    const ret = cFn(arg_pid);
    return ret;
}
pub fn spawnCommandLineAsync(arg_command_line: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!bool {
    const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_spawn_command_line_async" });
    const ret = cFn(arg_command_line, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn spawnCommandLineSync(arg_command_line: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    standard_output: [*:0]u8,
    standard_error: [*:0]u8,
    wait_status: i32,
} {
    var argO_standard_output: ?[*:0]u8 = undefined;
    const arg_standard_output: ?*[*:0]u8 = &argO_standard_output;
    var argO_standard_error: ?[*:0]u8 = undefined;
    const arg_standard_error: ?*[*:0]u8 = &argO_standard_error;
    var argO_wait_status: i32 = undefined;
    const arg_wait_status: ?*i32 = &argO_wait_status;
    const cFn = @extern(*const fn ([*:0]const u8, ?*[*:0]u8, ?*[*:0]u8, ?*i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_spawn_command_line_sync" });
    const ret = cFn(arg_command_line, arg_standard_output, arg_standard_error, arg_wait_status, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .standard_output = argO_standard_output, .standard_error = argO_standard_error, .wait_status = argO_wait_status };
}
pub fn spawnErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_spawn_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn spawnExitErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_spawn_exit_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn spawnSync(arg_working_directory: ?[*:0]const u8, arg_argv: [*]?[*:0]const u8, arg_envp: ?[*]?[*:0]const u8, arg_flags: SpawnFlags, argC_child_setup: core.Closure(?SpawnChildSetupFunc), arg_error: *?*GLib.Error) error{GError}!struct {
    ret: bool,
    standard_output: [*:0]u8,
    standard_error: [*:0]u8,
    wait_status: i32,
} {
    const arg_child_setup: ?SpawnChildSetupFunc = @ptrCast(argC_child_setup.callback());
    defer argC_child_setup.deinit();
    const arg_user_data: ?*anyopaque = @ptrCast(argC_child_setup.data());
    var argO_standard_output: ?[*:0]u8 = undefined;
    const arg_standard_output: ?*[*:0]u8 = &argO_standard_output;
    var argO_standard_error: ?[*:0]u8 = undefined;
    const arg_standard_error: ?*[*:0]u8 = &argO_standard_error;
    var argO_wait_status: i32 = undefined;
    const arg_wait_status: ?*i32 = &argO_wait_status;
    const cFn = @extern(*const fn (?[*:0]const u8, [*]?[*:0]const u8, ?[*]?[*:0]const u8, SpawnFlags, ?SpawnChildSetupFunc, ?*anyopaque, ?*[*:0]u8, ?*[*:0]u8, ?*i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_spawn_sync" });
    const ret = cFn(arg_working_directory, arg_argv, arg_envp, arg_flags, arg_child_setup, @ptrCast(arg_user_data), arg_standard_output, arg_standard_error, arg_wait_status, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .standard_output = argO_standard_output, .standard_error = argO_standard_error, .wait_status = argO_wait_status };
}
pub fn stat(arg_filename: [*:0]const u8, arg_buf: *StatBuf) i32 {
    const cFn = @extern(*const fn ([*:0]const u8, *StatBuf) callconv(.c) i32, .{ .name = "g_stat" });
    const ret = cFn(arg_filename, arg_buf);
    return ret;
}
pub fn stpcpy(arg_dest: [*:0]const u8, arg_src: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_stpcpy" });
    const ret = cFn(arg_dest, arg_src);
    return ret;
}
pub fn strEqual(arg_v1: *anyopaque, arg_v2: *anyopaque) bool {
    const cFn = @extern(*const fn (*anyopaque, *anyopaque) callconv(.c) bool, .{ .name = "g_str_equal" });
    const ret = cFn(@ptrCast(arg_v1), @ptrCast(arg_v2));
    return ret;
}
pub fn strHasPrefix(arg_str: [*:0]const u8, arg_prefix: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) bool, .{ .name = "g_str_has_prefix" });
    const ret = cFn(arg_str, arg_prefix);
    return ret;
}
pub fn strHasSuffix(arg_str: [*:0]const u8, arg_suffix: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) bool, .{ .name = "g_str_has_suffix" });
    const ret = cFn(arg_str, arg_suffix);
    return ret;
}
pub fn strHash(arg_v: *anyopaque) u32 {
    const cFn = @extern(*const fn (*anyopaque) callconv(.c) u32, .{ .name = "g_str_hash" });
    const ret = cFn(@ptrCast(arg_v));
    return ret;
}
pub fn strIsAscii(arg_str: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_str_is_ascii" });
    const ret = cFn(arg_str);
    return ret;
}
pub fn strMatchString(arg_search_term: [*:0]const u8, arg_potential_hit: [*:0]const u8, arg_accept_alternates: bool) bool {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, bool) callconv(.c) bool, .{ .name = "g_str_match_string" });
    const ret = cFn(arg_search_term, arg_potential_hit, arg_accept_alternates);
    return ret;
}
pub fn strToAscii(arg_str: [*:0]const u8, arg_from_locale: ?[*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_str_to_ascii" });
    const ret = cFn(arg_str, arg_from_locale);
    return ret;
}
pub fn strTokenizeAndFold(arg_string: [*:0]const u8, arg_translit_locale: ?[*:0]const u8) struct {
    ret: [*]?[*:0]const u8,
    ascii_alternates: [*]?[*:0]const u8,
} {
    var argO_ascii_alternates: ?[*]?[*:0]const u8 = undefined;
    const arg_ascii_alternates: ?*[*]?[*:0]const u8 = &argO_ascii_alternates;
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?*[*]?[*:0]const u8) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_str_tokenize_and_fold" });
    const ret = cFn(arg_string, arg_translit_locale, arg_ascii_alternates);
    return .{ .ret = ret, .ascii_alternates = argO_ascii_alternates };
}
pub fn strcanon(arg_string: [*:0]const u8, arg_valid_chars: [*:0]const u8, arg_substitutor: i8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, i8) callconv(.c) [*:0]u8, .{ .name = "g_strcanon" });
    const ret = cFn(arg_string, arg_valid_chars, arg_substitutor);
    return ret;
}
pub fn strcasecmp(arg_s1: [*:0]const u8, arg_s2: [*:0]const u8) i32 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) i32, .{ .name = "g_strcasecmp" });
    const ret = cFn(arg_s1, arg_s2);
    return ret;
}
pub fn strchomp(arg_string: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_strchomp" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn strchug(arg_string: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_strchug" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn strcmp0(arg_str1: ?[*:0]const u8, arg_str2: ?[*:0]const u8) i32 {
    const cFn = @extern(*const fn (?[*:0]const u8, ?[*:0]const u8) callconv(.c) i32, .{ .name = "g_strcmp0" });
    const ret = cFn(arg_str1, arg_str2);
    return ret;
}
pub fn strcompress(arg_source: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_strcompress" });
    const ret = cFn(arg_source);
    return ret;
}
pub fn strdelimit(arg_string: [*:0]const u8, arg_delimiters: ?[*:0]const u8, arg_new_delimiter: i8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, i8) callconv(.c) [*:0]u8, .{ .name = "g_strdelimit" });
    const ret = cFn(arg_string, arg_delimiters, arg_new_delimiter);
    return ret;
}
pub fn strdown(arg_string: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_strdown" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn strdup(arg_str: ?[*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_strdup" });
    const ret = cFn(arg_str);
    return ret;
}
pub fn strdupv(arg_str_array: ?[*]?[*:0]const u8) ?[*]?[*:0]const u8 {
    const cFn = @extern(*const fn (?[*]?[*:0]const u8) callconv(.c) ?[*]?[*:0]const u8, .{ .name = "g_strdupv" });
    const ret = cFn(arg_str_array);
    return ret;
}
pub fn strerror(arg_errnum: i32) [*:0]u8 {
    const cFn = @extern(*const fn (i32) callconv(.c) [*:0]u8, .{ .name = "g_strerror" });
    const ret = cFn(arg_errnum);
    return ret;
}
pub fn strescape(arg_source: [*:0]const u8, arg_exceptions: ?[*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_strescape" });
    const ret = cFn(arg_source, arg_exceptions);
    return ret;
}
pub fn strfreev(arg_str_array: ?[*]?[*:0]const u8) void {
    const cFn = @extern(*const fn (?[*]?[*:0]const u8) callconv(.c) void, .{ .name = "g_strfreev" });
    const ret = cFn(arg_str_array);
    return ret;
}
pub fn stripContext(arg_msgid: [*:0]const u8, arg_msgval: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_strip_context" });
    const ret = cFn(arg_msgid, arg_msgval);
    return ret;
}
pub fn strjoinv(arg_separator: ?[*:0]const u8, arg_str_array: [*]?[*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn (?[*:0]const u8, [*]?[*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_strjoinv" });
    const ret = cFn(arg_separator, arg_str_array);
    return ret;
}
pub fn strlcat(arg_dest: [*:0]const u8, arg_src: [*:0]const u8, arg_dest_size: u64) u64 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, u64) callconv(.c) u64, .{ .name = "g_strlcat" });
    const ret = cFn(arg_dest, arg_src, arg_dest_size);
    return ret;
}
pub fn strlcpy(arg_dest: [*:0]const u8, arg_src: [*:0]const u8, arg_dest_size: u64) u64 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, u64) callconv(.c) u64, .{ .name = "g_strlcpy" });
    const ret = cFn(arg_dest, arg_src, arg_dest_size);
    return ret;
}
pub fn strncasecmp(arg_s1: [*:0]const u8, arg_s2: [*:0]const u8, arg_n: u32) i32 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, u32) callconv(.c) i32, .{ .name = "g_strncasecmp" });
    const ret = cFn(arg_s1, arg_s2, arg_n);
    return ret;
}
pub fn strndup(arg_str: ?[*:0]const u8, arg_n: u64) ?[*:0]u8 {
    const cFn = @extern(*const fn (?[*:0]const u8, u64) callconv(.c) ?[*:0]u8, .{ .name = "g_strndup" });
    const ret = cFn(arg_str, arg_n);
    return ret;
}
pub fn strnfill(arg_length: u64, arg_fill_char: i8) [*:0]u8 {
    const cFn = @extern(*const fn (u64, i8) callconv(.c) [*:0]u8, .{ .name = "g_strnfill" });
    const ret = cFn(arg_length, arg_fill_char);
    return ret;
}
pub fn strreverse(arg_string: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_strreverse" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn strrstr(arg_haystack: [*:0]const u8, arg_needle: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_strrstr" });
    const ret = cFn(arg_haystack, arg_needle);
    return ret;
}
pub fn strrstrLen(arg_haystack: [*:0]const u8, arg_haystack_len: i64, arg_needle: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_strrstr_len" });
    const ret = cFn(arg_haystack, arg_haystack_len, arg_needle);
    return ret;
}
pub fn strsignal(arg_signum: i32) [*:0]u8 {
    const cFn = @extern(*const fn (i32) callconv(.c) [*:0]u8, .{ .name = "g_strsignal" });
    const ret = cFn(arg_signum);
    return ret;
}
pub fn strsplit(arg_string: [*:0]const u8, arg_delimiter: [*:0]const u8, arg_max_tokens: i32) [*]?[*:0]const u8 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, i32) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_strsplit" });
    const ret = cFn(arg_string, arg_delimiter, arg_max_tokens);
    return ret;
}
pub fn strsplitSet(arg_string: [*:0]const u8, arg_delimiters: [*:0]const u8, arg_max_tokens: i32) [*]?[*:0]const u8 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, i32) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_strsplit_set" });
    const ret = cFn(arg_string, arg_delimiters, arg_max_tokens);
    return ret;
}
pub fn strstrLen(arg_haystack: [*:0]const u8, arg_haystack_len: i64, arg_needle: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_strstr_len" });
    const ret = cFn(arg_haystack, arg_haystack_len, arg_needle);
    return ret;
}
pub fn strtod(arg_nptr: [*:0]const u8) struct {
    ret: f64,
    endptr: [*:0]u8,
} {
    var argO_endptr: ?[*:0]u8 = undefined;
    const arg_endptr: ?*[*:0]u8 = &argO_endptr;
    const cFn = @extern(*const fn ([*:0]const u8, ?*[*:0]u8) callconv(.c) f64, .{ .name = "g_strtod" });
    const ret = cFn(arg_nptr, arg_endptr);
    return .{ .ret = ret, .endptr = argO_endptr };
}
pub fn strup(arg_string: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_strup" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn strvContains(arg_strv: [*]?[*:0]const u8, arg_str: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*]?[*:0]const u8, [*:0]const u8) callconv(.c) bool, .{ .name = "g_strv_contains" });
    const ret = cFn(arg_strv, arg_str);
    return ret;
}
pub fn strvEqual(arg_strv1: [*]?[*:0]const u8, arg_strv2: [*]?[*:0]const u8) bool {
    const cFn = @extern(*const fn ([*]?[*:0]const u8, [*]?[*:0]const u8) callconv(.c) bool, .{ .name = "g_strv_equal" });
    const ret = cFn(arg_strv1, arg_strv2);
    return ret;
}
pub fn strvGetType() core.Type {
    const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_strv_get_type" });
    const ret = cFn();
    return ret;
}
pub fn strvLength(arg_str_array: [*]?[*:0]const u8) u32 {
    const cFn = @extern(*const fn ([*]?[*:0]const u8) callconv(.c) u32, .{ .name = "g_strv_length" });
    const ret = cFn(arg_str_array);
    return ret;
}
pub fn testAddDataFunc(arg_testpath: [*:0]const u8, arg_test_data: ?*anyopaque, arg_test_func: TestDataFunc) void {
    const cFn = @extern(*const fn ([*:0]const u8, ?*anyopaque, TestDataFunc) callconv(.c) void, .{ .name = "g_test_add_data_func" });
    const ret = cFn(arg_testpath, @ptrCast(arg_test_data), arg_test_func);
    return ret;
}
pub fn testAddDataFuncFull(arg_testpath: [*:0]const u8, arg_test_data: ?*anyopaque, arg_test_func: TestDataFunc, arg_data_free_func: DestroyNotify) void {
    const cFn = @extern(*const fn ([*:0]const u8, ?*anyopaque, TestDataFunc, DestroyNotify) callconv(.c) void, .{ .name = "g_test_add_data_func_full" });
    const ret = cFn(arg_testpath, @ptrCast(arg_test_data), arg_test_func, arg_data_free_func);
    return ret;
}
pub fn testAddFunc(arg_testpath: [*:0]const u8, arg_test_func: TestFunc) void {
    const cFn = @extern(*const fn ([*:0]const u8, TestFunc) callconv(.c) void, .{ .name = "g_test_add_func" });
    const ret = cFn(arg_testpath, arg_test_func);
    return ret;
}
pub fn testAssertExpectedMessagesInternal(arg_domain: [*:0]const u8, arg_file: [*:0]const u8, arg_line: i32, arg_func: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, i32, [*:0]const u8) callconv(.c) void, .{ .name = "g_test_assert_expected_messages_internal" });
    const ret = cFn(arg_domain, arg_file, arg_line, arg_func);
    return ret;
}
pub fn testBug(arg_bug_uri_snippet: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) void, .{ .name = "g_test_bug" });
    const ret = cFn(arg_bug_uri_snippet);
    return ret;
}
pub fn testBugBase(arg_uri_pattern: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) void, .{ .name = "g_test_bug_base" });
    const ret = cFn(arg_uri_pattern);
    return ret;
}
pub fn testDisableCrashReporting() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_test_disable_crash_reporting" });
    const ret = cFn();
    return ret;
}
pub fn testExpectMessage(arg_log_domain: ?[*:0]const u8, arg_log_level: LogLevelFlags, arg_pattern: [*:0]const u8) void {
    const cFn = @extern(*const fn (?[*:0]const u8, LogLevelFlags, [*:0]const u8) callconv(.c) void, .{ .name = "g_test_expect_message" });
    const ret = cFn(arg_log_domain, arg_log_level, arg_pattern);
    return ret;
}
pub fn testFail() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_test_fail" });
    const ret = cFn();
    return ret;
}
pub fn testFailed() bool {
    const cFn = @extern(*const fn () callconv(.c) bool, .{ .name = "g_test_failed" });
    const ret = cFn();
    return ret;
}
pub fn testGetDir(arg_file_type: TestFileType) [*:0]u8 {
    const cFn = @extern(*const fn (TestFileType) callconv(.c) [*:0]u8, .{ .name = "g_test_get_dir" });
    const ret = cFn(arg_file_type);
    return ret;
}
pub fn testGetPath() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_test_get_path" });
    const ret = cFn();
    return ret;
}
pub fn testIncomplete(arg_msg: ?[*:0]const u8) void {
    const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) void, .{ .name = "g_test_incomplete" });
    const ret = cFn(arg_msg);
    return ret;
}
pub fn testLogTypeName(arg_log_type: TestLogType) [*:0]u8 {
    const cFn = @extern(*const fn (TestLogType) callconv(.c) [*:0]u8, .{ .name = "g_test_log_type_name" });
    const ret = cFn(arg_log_type);
    return ret;
}
pub fn testQueueDestroy(arg_destroy_func: DestroyNotify, arg_destroy_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (DestroyNotify, ?*anyopaque) callconv(.c) void, .{ .name = "g_test_queue_destroy" });
    const ret = cFn(arg_destroy_func, @ptrCast(arg_destroy_data));
    return ret;
}
pub fn testQueueFree(arg_gfree_pointer: ?*anyopaque) void {
    const cFn = @extern(*const fn (?*anyopaque) callconv(.c) void, .{ .name = "g_test_queue_free" });
    const ret = cFn(@ptrCast(arg_gfree_pointer));
    return ret;
}
pub fn testRandDouble() f64 {
    const cFn = @extern(*const fn () callconv(.c) f64, .{ .name = "g_test_rand_double" });
    const ret = cFn();
    return ret;
}
pub fn testRandDoubleRange(arg_range_start: f64, arg_range_end: f64) f64 {
    const cFn = @extern(*const fn (f64, f64) callconv(.c) f64, .{ .name = "g_test_rand_double_range" });
    const ret = cFn(arg_range_start, arg_range_end);
    return ret;
}
pub fn testRandInt() i32 {
    const cFn = @extern(*const fn () callconv(.c) i32, .{ .name = "g_test_rand_int" });
    const ret = cFn();
    return ret;
}
pub fn testRandIntRange(arg_begin: i32, arg_end: i32) i32 {
    const cFn = @extern(*const fn (i32, i32) callconv(.c) i32, .{ .name = "g_test_rand_int_range" });
    const ret = cFn(arg_begin, arg_end);
    return ret;
}
pub fn testRun() i32 {
    const cFn = @extern(*const fn () callconv(.c) i32, .{ .name = "g_test_run" });
    const ret = cFn();
    return ret;
}
pub fn testRunSuite(arg_suite: *TestSuite) i32 {
    const cFn = @extern(*const fn (*TestSuite) callconv(.c) i32, .{ .name = "g_test_run_suite" });
    const ret = cFn(arg_suite);
    return ret;
}
pub fn testSetNonfatalAssertions() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_test_set_nonfatal_assertions" });
    const ret = cFn();
    return ret;
}
pub fn testSkip(arg_msg: ?[*:0]const u8) void {
    const cFn = @extern(*const fn (?[*:0]const u8) callconv(.c) void, .{ .name = "g_test_skip" });
    const ret = cFn(arg_msg);
    return ret;
}
pub fn testSubprocess() bool {
    const cFn = @extern(*const fn () callconv(.c) bool, .{ .name = "g_test_subprocess" });
    const ret = cFn();
    return ret;
}
pub fn testSummary(arg_summary: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) void, .{ .name = "g_test_summary" });
    const ret = cFn(arg_summary);
    return ret;
}
pub fn testTimerElapsed() f64 {
    const cFn = @extern(*const fn () callconv(.c) f64, .{ .name = "g_test_timer_elapsed" });
    const ret = cFn();
    return ret;
}
pub fn testTimerLast() f64 {
    const cFn = @extern(*const fn () callconv(.c) f64, .{ .name = "g_test_timer_last" });
    const ret = cFn();
    return ret;
}
pub fn testTimerStart() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_test_timer_start" });
    const ret = cFn();
    return ret;
}
pub fn testTrapAssertions(arg_domain: [*:0]const u8, arg_file: [*:0]const u8, arg_line: i32, arg_func: [*:0]const u8, arg_assertion_flags: u64, arg_pattern: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, i32, [*:0]const u8, u64, [*:0]const u8) callconv(.c) void, .{ .name = "g_test_trap_assertions" });
    const ret = cFn(arg_domain, arg_file, arg_line, arg_func, arg_assertion_flags, arg_pattern);
    return ret;
}
pub fn testTrapFork(arg_usec_timeout: u64, arg_test_trap_flags: TestTrapFlags) bool {
    const cFn = @extern(*const fn (u64, TestTrapFlags) callconv(.c) bool, .{ .name = "g_test_trap_fork" });
    const ret = cFn(arg_usec_timeout, arg_test_trap_flags);
    return ret;
}
pub fn testTrapHasPassed() bool {
    const cFn = @extern(*const fn () callconv(.c) bool, .{ .name = "g_test_trap_has_passed" });
    const ret = cFn();
    return ret;
}
pub fn testTrapReachedTimeout() bool {
    const cFn = @extern(*const fn () callconv(.c) bool, .{ .name = "g_test_trap_reached_timeout" });
    const ret = cFn();
    return ret;
}
pub fn testTrapSubprocess(arg_test_path: ?[*:0]const u8, arg_usec_timeout: u64, arg_test_flags: TestSubprocessFlags) void {
    const cFn = @extern(*const fn (?[*:0]const u8, u64, TestSubprocessFlags) callconv(.c) void, .{ .name = "g_test_trap_subprocess" });
    const ret = cFn(arg_test_path, arg_usec_timeout, arg_test_flags);
    return ret;
}
pub fn testTrapSubprocessWithEnvp(arg_test_path: ?[*:0]const u8, arg_envp: ?[*]?[*:0]const u8, arg_usec_timeout: u64, arg_test_flags: TestSubprocessFlags) void {
    const cFn = @extern(*const fn (?[*:0]const u8, ?[*]?[*:0]const u8, u64, TestSubprocessFlags) callconv(.c) void, .{ .name = "g_test_trap_subprocess_with_envp" });
    const ret = cFn(arg_test_path, arg_envp, arg_usec_timeout, arg_test_flags);
    return ret;
}
pub fn threadErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_thread_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn threadExit(arg_retval: ?*anyopaque) void {
    const cFn = @extern(*const fn (?*anyopaque) callconv(.c) void, .{ .name = "g_thread_exit" });
    const ret = cFn(@ptrCast(arg_retval));
    return ret;
}
pub fn threadPoolGetMaxIdleTime() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_thread_pool_get_max_idle_time" });
    const ret = cFn();
    return ret;
}
pub fn threadPoolGetMaxUnusedThreads() i32 {
    const cFn = @extern(*const fn () callconv(.c) i32, .{ .name = "g_thread_pool_get_max_unused_threads" });
    const ret = cFn();
    return ret;
}
pub fn threadPoolGetNumUnusedThreads() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_thread_pool_get_num_unused_threads" });
    const ret = cFn();
    return ret;
}
pub fn threadPoolSetMaxIdleTime(arg_interval: u32) void {
    const cFn = @extern(*const fn (u32) callconv(.c) void, .{ .name = "g_thread_pool_set_max_idle_time" });
    const ret = cFn(arg_interval);
    return ret;
}
pub fn threadPoolSetMaxUnusedThreads(arg_max_threads: i32) void {
    const cFn = @extern(*const fn (i32) callconv(.c) void, .{ .name = "g_thread_pool_set_max_unused_threads" });
    const ret = cFn(arg_max_threads);
    return ret;
}
pub fn threadPoolStopUnusedThreads() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_thread_pool_stop_unused_threads" });
    const ret = cFn();
    return ret;
}
pub fn threadSelf() *Thread {
    const cFn = @extern(*const fn () callconv(.c) *Thread, .{ .name = "g_thread_self" });
    const ret = cFn();
    return ret;
}
pub fn threadYield() void {
    const cFn = @extern(*const fn () callconv(.c) void, .{ .name = "g_thread_yield" });
    const ret = cFn();
    return ret;
}
pub fn timeValFromIso8601(arg_iso_date: [*:0]const u8, arg_time_: *TimeVal) bool {
    const cFn = @extern(*const fn ([*:0]const u8, *TimeVal) callconv(.c) bool, .{ .name = "g_time_val_from_iso8601" });
    const ret = cFn(arg_iso_date, arg_time_);
    return ret;
}
pub fn timeoutAdd(arg_priority: i32, arg_interval: u32, argC_function: core.Closure(SourceFunc)) u32 {
    const arg_function: SourceFunc = @ptrCast(argC_function.callback());
    const arg_data: ?*anyopaque = @ptrCast(argC_function.data());
    const arg_notify: ?DestroyNotify = @ptrCast(argC_function.destroy());
    const cFn = @extern(*const fn (i32, u32, SourceFunc, ?*anyopaque, ?DestroyNotify) callconv(.c) u32, .{ .name = "g_timeout_add_full" });
    const ret = cFn(arg_priority, arg_interval, arg_function, @ptrCast(arg_data), arg_notify);
    return ret;
}
pub fn timeoutAddSeconds(arg_priority: i32, arg_interval: u32, argC_function: core.Closure(SourceFunc)) u32 {
    const arg_function: SourceFunc = @ptrCast(argC_function.callback());
    const arg_data: ?*anyopaque = @ptrCast(argC_function.data());
    const arg_notify: ?DestroyNotify = @ptrCast(argC_function.destroy());
    const cFn = @extern(*const fn (i32, u32, SourceFunc, ?*anyopaque, ?DestroyNotify) callconv(.c) u32, .{ .name = "g_timeout_add_seconds_full" });
    const ret = cFn(arg_priority, arg_interval, arg_function, @ptrCast(arg_data), arg_notify);
    return ret;
}
pub fn timeoutSourceNew(arg_interval: u32) *Source {
    const cFn = @extern(*const fn (u32) callconv(.c) *Source, .{ .name = "g_timeout_source_new" });
    const ret = cFn(arg_interval);
    return ret;
}
pub fn timeoutSourceNewSeconds(arg_interval: u32) *Source {
    const cFn = @extern(*const fn (u32) callconv(.c) *Source, .{ .name = "g_timeout_source_new_seconds" });
    const ret = cFn(arg_interval);
    return ret;
}
pub fn trashStackHeight(arg_stack_p: *TrashStack) u32 {
    const cFn = @extern(*const fn (*TrashStack) callconv(.c) u32, .{ .name = "g_trash_stack_height" });
    const ret = cFn(arg_stack_p);
    return ret;
}
pub fn trashStackPeek(arg_stack_p: *TrashStack) ?*anyopaque {
    const cFn = @extern(*const fn (*TrashStack) callconv(.c) ?*anyopaque, .{ .name = "g_trash_stack_peek" });
    const ret = cFn(arg_stack_p);
    return ret;
}
pub fn trashStackPop(arg_stack_p: *TrashStack) ?*anyopaque {
    const cFn = @extern(*const fn (*TrashStack) callconv(.c) ?*anyopaque, .{ .name = "g_trash_stack_pop" });
    const ret = cFn(arg_stack_p);
    return ret;
}
pub fn trashStackPush(arg_stack_p: *TrashStack, arg_data_p: *anyopaque) void {
    const cFn = @extern(*const fn (*TrashStack, *anyopaque) callconv(.c) void, .{ .name = "g_trash_stack_push" });
    const ret = cFn(arg_stack_p, @ptrCast(arg_data_p));
    return ret;
}
pub fn tryMalloc(arg_n_bytes: u64) ?*anyopaque {
    const cFn = @extern(*const fn (u64) callconv(.c) ?*anyopaque, .{ .name = "g_try_malloc" });
    const ret = cFn(arg_n_bytes);
    return ret;
}
pub fn tryMalloc0(arg_n_bytes: u64) ?*anyopaque {
    const cFn = @extern(*const fn (u64) callconv(.c) ?*anyopaque, .{ .name = "g_try_malloc0" });
    const ret = cFn(arg_n_bytes);
    return ret;
}
pub fn tryMalloc0N(arg_n_blocks: u64, arg_n_block_bytes: u64) ?*anyopaque {
    const cFn = @extern(*const fn (u64, u64) callconv(.c) ?*anyopaque, .{ .name = "g_try_malloc0_n" });
    const ret = cFn(arg_n_blocks, arg_n_block_bytes);
    return ret;
}
pub fn tryMallocN(arg_n_blocks: u64, arg_n_block_bytes: u64) ?*anyopaque {
    const cFn = @extern(*const fn (u64, u64) callconv(.c) ?*anyopaque, .{ .name = "g_try_malloc_n" });
    const ret = cFn(arg_n_blocks, arg_n_block_bytes);
    return ret;
}
pub fn tryRealloc(arg_mem: ?*anyopaque, arg_n_bytes: u64) ?*anyopaque {
    const cFn = @extern(*const fn (?*anyopaque, u64) callconv(.c) ?*anyopaque, .{ .name = "g_try_realloc" });
    const ret = cFn(@ptrCast(arg_mem), arg_n_bytes);
    return ret;
}
pub fn tryReallocN(arg_mem: ?*anyopaque, arg_n_blocks: u64, arg_n_block_bytes: u64) ?*anyopaque {
    const cFn = @extern(*const fn (?*anyopaque, u64, u64) callconv(.c) ?*anyopaque, .{ .name = "g_try_realloc_n" });
    const ret = cFn(@ptrCast(arg_mem), arg_n_blocks, arg_n_block_bytes);
    return ret;
}
pub fn ucs4ToUtf16(argS_str: []u32, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: *u16,
    items_read: i64,
    items_written: i64,
} {
    const arg_str: [*]u32 = @ptrCast(argS_str);
    const arg_len: i64 = @intCast((argS_str).len);
    var argO_items_read: i64 = undefined;
    const arg_items_read: ?*i64 = &argO_items_read;
    var argO_items_written: i64 = undefined;
    const arg_items_written: ?*i64 = &argO_items_written;
    const cFn = @extern(*const fn ([*]u32, i64, ?*i64, ?*i64, *?*GLib.Error) callconv(.c) *u16, .{ .name = "g_ucs4_to_utf16" });
    const ret = cFn(arg_str, arg_len, arg_items_read, arg_items_written, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .items_read = argO_items_read, .items_written = argO_items_written };
}
pub fn ucs4ToUtf8(argS_str: []u32, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: [*:0]u8,
    items_read: i64,
    items_written: i64,
} {
    const arg_str: [*]u32 = @ptrCast(argS_str);
    const arg_len: i64 = @intCast((argS_str).len);
    var argO_items_read: i64 = undefined;
    const arg_items_read: ?*i64 = &argO_items_read;
    var argO_items_written: i64 = undefined;
    const arg_items_written: ?*i64 = &argO_items_written;
    const cFn = @extern(*const fn ([*]u32, i64, ?*i64, ?*i64, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_ucs4_to_utf8" });
    const ret = cFn(arg_str, arg_len, arg_items_read, arg_items_written, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .items_read = argO_items_read, .items_written = argO_items_written };
}
pub fn unicharBreakType(arg_c: u32) UnicodeBreakType {
    const cFn = @extern(*const fn (u32) callconv(.c) UnicodeBreakType, .{ .name = "g_unichar_break_type" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharCombiningClass(arg_uc: u32) i32 {
    const cFn = @extern(*const fn (u32) callconv(.c) i32, .{ .name = "g_unichar_combining_class" });
    const ret = cFn(arg_uc);
    return ret;
}
pub fn unicharCompose(arg_a: u32, arg_b: u32) struct {
    ret: bool,
    ch: u32,
} {
    var argO_ch: u32 = undefined;
    const arg_ch: *u32 = &argO_ch;
    const cFn = @extern(*const fn (u32, u32, *u32) callconv(.c) bool, .{ .name = "g_unichar_compose" });
    const ret = cFn(arg_a, arg_b, arg_ch);
    return .{ .ret = ret, .ch = argO_ch };
}
pub fn unicharDecompose(arg_ch: u32) struct {
    ret: bool,
    a: u32,
    b: u32,
} {
    var argO_a: u32 = undefined;
    const arg_a: *u32 = &argO_a;
    var argO_b: u32 = undefined;
    const arg_b: *u32 = &argO_b;
    const cFn = @extern(*const fn (u32, *u32, *u32) callconv(.c) bool, .{ .name = "g_unichar_decompose" });
    const ret = cFn(arg_ch, arg_a, arg_b);
    return .{ .ret = ret, .a = argO_a, .b = argO_b };
}
pub fn unicharDigitValue(arg_c: u32) i32 {
    const cFn = @extern(*const fn (u32) callconv(.c) i32, .{ .name = "g_unichar_digit_value" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharFullyDecompose(arg_ch: u32, arg_compat: bool, arg_result: ?*u32, arg_result_len: u64) u64 {
    const cFn = @extern(*const fn (u32, bool, ?*u32, u64) callconv(.c) u64, .{ .name = "g_unichar_fully_decompose" });
    const ret = cFn(arg_ch, arg_compat, arg_result, arg_result_len);
    return ret;
}
pub fn unicharGetMirrorChar(arg_ch: u32) struct {
    ret: bool,
    mirrored_ch: u32,
} {
    var argO_mirrored_ch: u32 = undefined;
    const arg_mirrored_ch: *u32 = &argO_mirrored_ch;
    const cFn = @extern(*const fn (u32, *u32) callconv(.c) bool, .{ .name = "g_unichar_get_mirror_char" });
    const ret = cFn(arg_ch, arg_mirrored_ch);
    return .{ .ret = ret, .mirrored_ch = argO_mirrored_ch };
}
pub fn unicharGetScript(arg_ch: u32) UnicodeScript {
    const cFn = @extern(*const fn (u32) callconv(.c) UnicodeScript, .{ .name = "g_unichar_get_script" });
    const ret = cFn(arg_ch);
    return ret;
}
pub fn unicharIsalnum(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_isalnum" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIsalpha(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_isalpha" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIscntrl(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_iscntrl" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIsdefined(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_isdefined" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIsdigit(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_isdigit" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIsgraph(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_isgraph" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIslower(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_islower" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIsmark(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_ismark" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIsprint(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_isprint" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIspunct(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_ispunct" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIsspace(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_isspace" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIstitle(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_istitle" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIsupper(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_isupper" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIswide(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_iswide" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIswideCjk(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_iswide_cjk" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIsxdigit(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_isxdigit" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharIszerowidth(arg_c: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_iszerowidth" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharToUtf8(arg_c: u32, arg_outbuf: ?*[*:0]u8) i32 {
    const cFn = @extern(*const fn (u32, ?*[*:0]u8) callconv(.c) i32, .{ .name = "g_unichar_to_utf8" });
    const ret = cFn(arg_c, arg_outbuf);
    return ret;
}
pub fn unicharTolower(arg_c: u32) u32 {
    const cFn = @extern(*const fn (u32) callconv(.c) u32, .{ .name = "g_unichar_tolower" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharTotitle(arg_c: u32) u32 {
    const cFn = @extern(*const fn (u32) callconv(.c) u32, .{ .name = "g_unichar_totitle" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharToupper(arg_c: u32) u32 {
    const cFn = @extern(*const fn (u32) callconv(.c) u32, .{ .name = "g_unichar_toupper" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharType(arg_c: u32) UnicodeType {
    const cFn = @extern(*const fn (u32) callconv(.c) UnicodeType, .{ .name = "g_unichar_type" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicharValidate(arg_ch: u32) bool {
    const cFn = @extern(*const fn (u32) callconv(.c) bool, .{ .name = "g_unichar_validate" });
    const ret = cFn(arg_ch);
    return ret;
}
pub fn unicharXdigitValue(arg_c: u32) i32 {
    const cFn = @extern(*const fn (u32) callconv(.c) i32, .{ .name = "g_unichar_xdigit_value" });
    const ret = cFn(arg_c);
    return ret;
}
pub fn unicodeCanonicalDecomposition(arg_ch: u32, arg_result_len: *u64) *u32 {
    const cFn = @extern(*const fn (u32, *u64) callconv(.c) *u32, .{ .name = "g_unicode_canonical_decomposition" });
    const ret = cFn(arg_ch, arg_result_len);
    return ret;
}
pub fn unicodeCanonicalOrdering(argS_string: []u32) void {
    const arg_string: [*]u32 = @ptrCast(argS_string);
    const arg_len: u64 = @intCast((argS_string).len);
    const cFn = @extern(*const fn ([*]u32, u64) callconv(.c) void, .{ .name = "g_unicode_canonical_ordering" });
    const ret = cFn(arg_string, arg_len);
    return ret;
}
pub fn unicodeScriptFromIso15924(arg_iso15924: u32) UnicodeScript {
    const cFn = @extern(*const fn (u32) callconv(.c) UnicodeScript, .{ .name = "g_unicode_script_from_iso15924" });
    const ret = cFn(arg_iso15924);
    return ret;
}
pub fn unicodeScriptToIso15924(arg_script: UnicodeScript) u32 {
    const cFn = @extern(*const fn (UnicodeScript) callconv(.c) u32, .{ .name = "g_unicode_script_to_iso15924" });
    const ret = cFn(arg_script);
    return ret;
}
pub fn unixErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_unix_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn unixFdAddFull(arg_priority: i32, arg_fd: i32, arg_condition: IOCondition, argC_function: core.Closure(UnixFDSourceFunc)) u32 {
    const arg_function: UnixFDSourceFunc = @ptrCast(argC_function.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_function.data());
    const arg_notify: DestroyNotify = @ptrCast(argC_function.destroy());
    const cFn = @extern(*const fn (i32, i32, IOCondition, UnixFDSourceFunc, ?*anyopaque, DestroyNotify) callconv(.c) u32, .{ .name = "g_unix_fd_add_full" });
    const ret = cFn(arg_priority, arg_fd, arg_condition, arg_function, @ptrCast(arg_user_data), arg_notify);
    return ret;
}
pub fn unixFdSourceNew(arg_fd: i32, arg_condition: IOCondition) *Source {
    const cFn = @extern(*const fn (i32, IOCondition) callconv(.c) *Source, .{ .name = "g_unix_fd_source_new" });
    const ret = cFn(arg_fd, arg_condition);
    return ret;
}
pub fn unixGetPasswdEntry(arg_user_name: [*:0]const u8, arg_error: *?*GLib.Error) error{GError}!?*anyopaque {
    const cFn = @extern(*const fn ([*:0]const u8, *?*GLib.Error) callconv(.c) ?*anyopaque, .{ .name = "g_unix_get_passwd_entry" });
    const ret = cFn(arg_user_name, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn unixOpenPipe(arg_fds: *[2]i32, arg_flags: i32, arg_error: *?*GLib.Error) error{GError}!bool {
    const cFn = @extern(*const fn (*[2]i32, i32, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_unix_open_pipe" });
    const ret = cFn(arg_fds, arg_flags, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn unixSetFdNonblocking(arg_fd: i32, arg_nonblock: bool, arg_error: *?*GLib.Error) error{GError}!bool {
    const cFn = @extern(*const fn (i32, bool, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_unix_set_fd_nonblocking" });
    const ret = cFn(arg_fd, arg_nonblock, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn unixSignalAdd(arg_priority: i32, arg_signum: i32, argC_handler: core.Closure(SourceFunc)) u32 {
    const arg_handler: SourceFunc = @ptrCast(argC_handler.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_handler.data());
    const arg_notify: DestroyNotify = @ptrCast(argC_handler.destroy());
    const cFn = @extern(*const fn (i32, i32, SourceFunc, ?*anyopaque, DestroyNotify) callconv(.c) u32, .{ .name = "g_unix_signal_add_full" });
    const ret = cFn(arg_priority, arg_signum, arg_handler, @ptrCast(arg_user_data), arg_notify);
    return ret;
}
pub fn unixSignalSourceNew(arg_signum: i32) *Source {
    const cFn = @extern(*const fn (i32) callconv(.c) *Source, .{ .name = "g_unix_signal_source_new" });
    const ret = cFn(arg_signum);
    return ret;
}
pub fn unlink(arg_filename: [*:0]const u8) i32 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) i32, .{ .name = "g_unlink" });
    const ret = cFn(arg_filename);
    return ret;
}
pub fn unsetenv(arg_variable: [*:0]const u8) void {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) void, .{ .name = "g_unsetenv" });
    const ret = cFn(arg_variable);
    return ret;
}
pub fn uriBuild(arg_flags: UriFlags, arg_scheme: [*:0]const u8, arg_userinfo: ?[*:0]const u8, arg_host: ?[*:0]const u8, arg_port: i32, arg_path: [*:0]const u8, arg_query: ?[*:0]const u8, arg_fragment: ?[*:0]const u8) *Uri {
    const cFn = @extern(*const fn (UriFlags, [*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, i32, [*:0]const u8, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) *Uri, .{ .name = "g_uri_build" });
    const ret = cFn(arg_flags, arg_scheme, arg_userinfo, arg_host, arg_port, arg_path, arg_query, arg_fragment);
    return ret;
}
pub fn uriBuildWithUser(arg_flags: UriFlags, arg_scheme: [*:0]const u8, arg_user: ?[*:0]const u8, arg_password: ?[*:0]const u8, arg_auth_params: ?[*:0]const u8, arg_host: ?[*:0]const u8, arg_port: i32, arg_path: [*:0]const u8, arg_query: ?[*:0]const u8, arg_fragment: ?[*:0]const u8) *Uri {
    const cFn = @extern(*const fn (UriFlags, [*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, i32, [*:0]const u8, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) *Uri, .{ .name = "g_uri_build_with_user" });
    const ret = cFn(arg_flags, arg_scheme, arg_user, arg_password, arg_auth_params, arg_host, arg_port, arg_path, arg_query, arg_fragment);
    return ret;
}
pub fn uriErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_uri_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn uriEscapeBytes(argS_unescaped: []u8, arg_reserved_chars_allowed: ?[*:0]const u8) [*:0]u8 {
    const arg_unescaped: [*]u8 = @ptrCast(argS_unescaped);
    const arg_length: u64 = @intCast((argS_unescaped).len);
    const cFn = @extern(*const fn ([*]u8, u64, ?[*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_uri_escape_bytes" });
    const ret = cFn(arg_unescaped, arg_length, arg_reserved_chars_allowed);
    return ret;
}
pub fn uriEscapeString(arg_unescaped: [*:0]const u8, arg_reserved_chars_allowed: ?[*:0]const u8, arg_allow_utf8: bool) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, bool) callconv(.c) [*:0]u8, .{ .name = "g_uri_escape_string" });
    const ret = cFn(arg_unescaped, arg_reserved_chars_allowed, arg_allow_utf8);
    return ret;
}
pub fn uriIsValid(arg_uri_string: [*:0]const u8, arg_flags: UriFlags, arg_error: *?*GLib.Error) error{GError}!bool {
    const cFn = @extern(*const fn ([*:0]const u8, UriFlags, *?*GLib.Error) callconv(.c) bool, .{ .name = "g_uri_is_valid" });
    const ret = cFn(arg_uri_string, arg_flags, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn uriJoin(arg_flags: UriFlags, arg_scheme: ?[*:0]const u8, arg_userinfo: ?[*:0]const u8, arg_host: ?[*:0]const u8, arg_port: i32, arg_path: [*:0]const u8, arg_query: ?[*:0]const u8, arg_fragment: ?[*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn (UriFlags, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, i32, [*:0]const u8, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_uri_join" });
    const ret = cFn(arg_flags, arg_scheme, arg_userinfo, arg_host, arg_port, arg_path, arg_query, arg_fragment);
    return ret;
}
pub fn uriJoinWithUser(arg_flags: UriFlags, arg_scheme: ?[*:0]const u8, arg_user: ?[*:0]const u8, arg_password: ?[*:0]const u8, arg_auth_params: ?[*:0]const u8, arg_host: ?[*:0]const u8, arg_port: i32, arg_path: [*:0]const u8, arg_query: ?[*:0]const u8, arg_fragment: ?[*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn (UriFlags, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, i32, [*:0]const u8, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_uri_join_with_user" });
    const ret = cFn(arg_flags, arg_scheme, arg_user, arg_password, arg_auth_params, arg_host, arg_port, arg_path, arg_query, arg_fragment);
    return ret;
}
pub fn uriListExtractUris(arg_uri_list: [*:0]const u8) [*]?[*:0]const u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*]?[*:0]const u8, .{ .name = "g_uri_list_extract_uris" });
    const ret = cFn(arg_uri_list);
    return ret;
}
pub fn uriParse(arg_uri_string: [*:0]const u8, arg_flags: UriFlags, arg_error: *?*GLib.Error) error{GError}!*Uri {
    const cFn = @extern(*const fn ([*:0]const u8, UriFlags, *?*GLib.Error) callconv(.c) *Uri, .{ .name = "g_uri_parse" });
    const ret = cFn(arg_uri_string, arg_flags, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn uriParseParams(arg_params: [*:0]const u8, arg_length: i64, arg_separators: [*:0]const u8, arg_flags: UriParamsFlags, arg_error: *?*GLib.Error) error{GError}!*GLib.HashTable {
    const cFn = @extern(*const fn ([*:0]const u8, i64, [*:0]const u8, UriParamsFlags, *?*GLib.Error) callconv(.c) *GLib.HashTable, .{ .name = "g_uri_parse_params" });
    const ret = cFn(arg_params, arg_length, arg_separators, arg_flags, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn uriParseScheme(arg_uri: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_uri_parse_scheme" });
    const ret = cFn(arg_uri);
    return ret;
}
pub fn uriPeekScheme(arg_uri: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_uri_peek_scheme" });
    const ret = cFn(arg_uri);
    return ret;
}
pub fn uriResolveRelative(arg_base_uri_string: ?[*:0]const u8, arg_uri_ref: [*:0]const u8, arg_flags: UriFlags, arg_error: *?*GLib.Error) error{GError}![*:0]u8 {
    const cFn = @extern(*const fn (?[*:0]const u8, [*:0]const u8, UriFlags, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_uri_resolve_relative" });
    const ret = cFn(arg_base_uri_string, arg_uri_ref, arg_flags, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn uriSplit(arg_uri_ref: [*:0]const u8, arg_flags: UriFlags, arg_error: *?*GLib.Error) error{GError}!struct {
    scheme: ?[*:0]u8,
    userinfo: ?[*:0]u8,
    host: ?[*:0]u8,
    port: i32,
    path: [*:0]u8,
    query: ?[*:0]u8,
    fragment: ?[*:0]u8,
} {
    var argO_scheme: ?[*:0]u8 = undefined;
    const arg_scheme: ?*?[*:0]u8 = &argO_scheme;
    var argO_userinfo: ?[*:0]u8 = undefined;
    const arg_userinfo: ?*?[*:0]u8 = &argO_userinfo;
    var argO_host: ?[*:0]u8 = undefined;
    const arg_host: ?*?[*:0]u8 = &argO_host;
    var argO_port: i32 = undefined;
    const arg_port: ?*i32 = &argO_port;
    var argO_path: ?[*:0]u8 = undefined;
    const arg_path: ?*[*:0]u8 = &argO_path;
    var argO_query: ?[*:0]u8 = undefined;
    const arg_query: ?*?[*:0]u8 = &argO_query;
    var argO_fragment: ?[*:0]u8 = undefined;
    const arg_fragment: ?*?[*:0]u8 = &argO_fragment;
    const cFn = @extern(*const fn ([*:0]const u8, UriFlags, ?*?[*:0]u8, ?*?[*:0]u8, ?*?[*:0]u8, ?*i32, ?*[*:0]u8, ?*?[*:0]u8, ?*?[*:0]u8, *?*GLib.Error) callconv(.c) void, .{ .name = "g_uri_split" });
    const ret = cFn(arg_uri_ref, arg_flags, arg_scheme, arg_userinfo, arg_host, arg_port, arg_path, arg_query, arg_fragment, arg_error);
    _ = ret;
    if (arg_error.* != null) return error.GError;
    return .{ .scheme = argO_scheme, .userinfo = argO_userinfo, .host = argO_host, .port = argO_port, .path = argO_path, .query = argO_query, .fragment = argO_fragment };
}
pub fn uriSplitNetwork(arg_uri_string: [*:0]const u8, arg_flags: UriFlags, arg_error: *?*GLib.Error) error{GError}!struct {
    scheme: ?[*:0]u8,
    host: ?[*:0]u8,
    port: i32,
} {
    var argO_scheme: ?[*:0]u8 = undefined;
    const arg_scheme: ?*?[*:0]u8 = &argO_scheme;
    var argO_host: ?[*:0]u8 = undefined;
    const arg_host: ?*?[*:0]u8 = &argO_host;
    var argO_port: i32 = undefined;
    const arg_port: ?*i32 = &argO_port;
    const cFn = @extern(*const fn ([*:0]const u8, UriFlags, ?*?[*:0]u8, ?*?[*:0]u8, ?*i32, *?*GLib.Error) callconv(.c) void, .{ .name = "g_uri_split_network" });
    const ret = cFn(arg_uri_string, arg_flags, arg_scheme, arg_host, arg_port, arg_error);
    _ = ret;
    if (arg_error.* != null) return error.GError;
    return .{ .scheme = argO_scheme, .host = argO_host, .port = argO_port };
}
pub fn uriSplitWithUser(arg_uri_ref: [*:0]const u8, arg_flags: UriFlags, arg_error: *?*GLib.Error) error{GError}!struct {
    scheme: ?[*:0]u8,
    user: ?[*:0]u8,
    password: ?[*:0]u8,
    auth_params: ?[*:0]u8,
    host: ?[*:0]u8,
    port: i32,
    path: [*:0]u8,
    query: ?[*:0]u8,
    fragment: ?[*:0]u8,
} {
    var argO_scheme: ?[*:0]u8 = undefined;
    const arg_scheme: ?*?[*:0]u8 = &argO_scheme;
    var argO_user: ?[*:0]u8 = undefined;
    const arg_user: ?*?[*:0]u8 = &argO_user;
    var argO_password: ?[*:0]u8 = undefined;
    const arg_password: ?*?[*:0]u8 = &argO_password;
    var argO_auth_params: ?[*:0]u8 = undefined;
    const arg_auth_params: ?*?[*:0]u8 = &argO_auth_params;
    var argO_host: ?[*:0]u8 = undefined;
    const arg_host: ?*?[*:0]u8 = &argO_host;
    var argO_port: i32 = undefined;
    const arg_port: ?*i32 = &argO_port;
    var argO_path: ?[*:0]u8 = undefined;
    const arg_path: ?*[*:0]u8 = &argO_path;
    var argO_query: ?[*:0]u8 = undefined;
    const arg_query: ?*?[*:0]u8 = &argO_query;
    var argO_fragment: ?[*:0]u8 = undefined;
    const arg_fragment: ?*?[*:0]u8 = &argO_fragment;
    const cFn = @extern(*const fn ([*:0]const u8, UriFlags, ?*?[*:0]u8, ?*?[*:0]u8, ?*?[*:0]u8, ?*?[*:0]u8, ?*?[*:0]u8, ?*i32, ?*[*:0]u8, ?*?[*:0]u8, ?*?[*:0]u8, *?*GLib.Error) callconv(.c) void, .{ .name = "g_uri_split_with_user" });
    const ret = cFn(arg_uri_ref, arg_flags, arg_scheme, arg_user, arg_password, arg_auth_params, arg_host, arg_port, arg_path, arg_query, arg_fragment, arg_error);
    _ = ret;
    if (arg_error.* != null) return error.GError;
    return .{ .scheme = argO_scheme, .user = argO_user, .password = argO_password, .auth_params = argO_auth_params, .host = argO_host, .port = argO_port, .path = argO_path, .query = argO_query, .fragment = argO_fragment };
}
pub fn uriUnescapeBytes(arg_escaped_string: [*:0]const u8, arg_length: i64, arg_illegal_characters: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*Bytes {
    const cFn = @extern(*const fn ([*:0]const u8, i64, ?[*:0]const u8, *?*GLib.Error) callconv(.c) *Bytes, .{ .name = "g_uri_unescape_bytes" });
    const ret = cFn(arg_escaped_string, arg_length, arg_illegal_characters, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn uriUnescapeSegment(arg_escaped_string: ?[*:0]const u8, arg_escaped_string_end: ?[*:0]const u8, arg_illegal_characters: ?[*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn (?[*:0]const u8, ?[*:0]const u8, ?[*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_uri_unescape_segment" });
    const ret = cFn(arg_escaped_string, arg_escaped_string_end, arg_illegal_characters);
    return ret;
}
pub fn uriUnescapeString(arg_escaped_string: [*:0]const u8, arg_illegal_characters: ?[*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_uri_unescape_string" });
    const ret = cFn(arg_escaped_string, arg_illegal_characters);
    return ret;
}
pub fn usleep(arg_microseconds: u64) void {
    const cFn = @extern(*const fn (u64) callconv(.c) void, .{ .name = "g_usleep" });
    const ret = cFn(arg_microseconds);
    return ret;
}
pub fn utf16ToUcs4(argS_str: []u16, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: *u32,
    items_read: i64,
    items_written: i64,
} {
    const arg_str: [*]u16 = @ptrCast(argS_str);
    const arg_len: i64 = @intCast((argS_str).len);
    var argO_items_read: i64 = undefined;
    const arg_items_read: ?*i64 = &argO_items_read;
    var argO_items_written: i64 = undefined;
    const arg_items_written: ?*i64 = &argO_items_written;
    const cFn = @extern(*const fn ([*]u16, i64, ?*i64, ?*i64, *?*GLib.Error) callconv(.c) *u32, .{ .name = "g_utf16_to_ucs4" });
    const ret = cFn(arg_str, arg_len, arg_items_read, arg_items_written, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .items_read = argO_items_read, .items_written = argO_items_written };
}
pub fn utf16ToUtf8(argS_str: []u16, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: [*:0]u8,
    items_read: i64,
    items_written: i64,
} {
    const arg_str: [*]u16 = @ptrCast(argS_str);
    const arg_len: i64 = @intCast((argS_str).len);
    var argO_items_read: i64 = undefined;
    const arg_items_read: ?*i64 = &argO_items_read;
    var argO_items_written: i64 = undefined;
    const arg_items_written: ?*i64 = &argO_items_written;
    const cFn = @extern(*const fn ([*]u16, i64, ?*i64, ?*i64, *?*GLib.Error) callconv(.c) [*:0]u8, .{ .name = "g_utf16_to_utf8" });
    const ret = cFn(arg_str, arg_len, arg_items_read, arg_items_written, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .items_read = argO_items_read, .items_written = argO_items_written };
}
pub fn utf8Casefold(arg_str: [*:0]const u8, arg_len: i64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64) callconv(.c) [*:0]u8, .{ .name = "g_utf8_casefold" });
    const ret = cFn(arg_str, arg_len);
    return ret;
}
pub fn utf8Collate(arg_str1: [*:0]const u8, arg_str2: [*:0]const u8) i32 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) i32, .{ .name = "g_utf8_collate" });
    const ret = cFn(arg_str1, arg_str2);
    return ret;
}
pub fn utf8CollateKey(arg_str: [*:0]const u8, arg_len: i64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64) callconv(.c) [*:0]u8, .{ .name = "g_utf8_collate_key" });
    const ret = cFn(arg_str, arg_len);
    return ret;
}
pub fn utf8CollateKeyForFilename(arg_str: [*:0]const u8, arg_len: i64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64) callconv(.c) [*:0]u8, .{ .name = "g_utf8_collate_key_for_filename" });
    const ret = cFn(arg_str, arg_len);
    return ret;
}
pub fn utf8FindNextChar(arg_p: [*:0]const u8, arg_end: ?[*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_utf8_find_next_char" });
    const ret = cFn(arg_p, arg_end);
    return ret;
}
pub fn utf8FindPrevChar(arg_str: [*:0]const u8, arg_p: [*:0]const u8) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) ?[*:0]u8, .{ .name = "g_utf8_find_prev_char" });
    const ret = cFn(arg_str, arg_p);
    return ret;
}
pub fn utf8GetChar(arg_p: [*:0]const u8) u32 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) u32, .{ .name = "g_utf8_get_char" });
    const ret = cFn(arg_p);
    return ret;
}
pub fn utf8GetCharValidated(arg_p: [*:0]const u8, arg_max_len: i64) u32 {
    const cFn = @extern(*const fn ([*:0]const u8, i64) callconv(.c) u32, .{ .name = "g_utf8_get_char_validated" });
    const ret = cFn(arg_p, arg_max_len);
    return ret;
}
pub fn utf8MakeValid(arg_str: [*:0]const u8, arg_len: i64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64) callconv(.c) [*:0]u8, .{ .name = "g_utf8_make_valid" });
    const ret = cFn(arg_str, arg_len);
    return ret;
}
pub fn utf8Normalize(arg_str: [*:0]const u8, arg_len: i64, arg_mode: NormalizeMode) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64, NormalizeMode) callconv(.c) ?[*:0]u8, .{ .name = "g_utf8_normalize" });
    const ret = cFn(arg_str, arg_len, arg_mode);
    return ret;
}
pub fn utf8OffsetToPointer(arg_str: [*:0]const u8, arg_offset: i64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64) callconv(.c) [*:0]u8, .{ .name = "g_utf8_offset_to_pointer" });
    const ret = cFn(arg_str, arg_offset);
    return ret;
}
pub fn utf8PointerToOffset(arg_str: [*:0]const u8, arg_pos: [*:0]const u8) i64 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8) callconv(.c) i64, .{ .name = "g_utf8_pointer_to_offset" });
    const ret = cFn(arg_str, arg_pos);
    return ret;
}
pub fn utf8PrevChar(arg_p: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_utf8_prev_char" });
    const ret = cFn(arg_p);
    return ret;
}
pub fn utf8Strchr(arg_p: [*:0]const u8, arg_len: i64, arg_c: u32) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64, u32) callconv(.c) ?[*:0]u8, .{ .name = "g_utf8_strchr" });
    const ret = cFn(arg_p, arg_len, arg_c);
    return ret;
}
pub fn utf8Strdown(arg_str: [*:0]const u8, arg_len: i64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64) callconv(.c) [*:0]u8, .{ .name = "g_utf8_strdown" });
    const ret = cFn(arg_str, arg_len);
    return ret;
}
pub fn utf8Strlen(arg_p: [*:0]const u8, arg_max: i64) i64 {
    const cFn = @extern(*const fn ([*:0]const u8, i64) callconv(.c) i64, .{ .name = "g_utf8_strlen" });
    const ret = cFn(arg_p, arg_max);
    return ret;
}
pub fn utf8Strncpy(arg_dest: [*:0]const u8, arg_src: [*:0]const u8, arg_n: u64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, [*:0]const u8, u64) callconv(.c) [*:0]u8, .{ .name = "g_utf8_strncpy" });
    const ret = cFn(arg_dest, arg_src, arg_n);
    return ret;
}
pub fn utf8Strrchr(arg_p: [*:0]const u8, arg_len: i64, arg_c: u32) ?[*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64, u32) callconv(.c) ?[*:0]u8, .{ .name = "g_utf8_strrchr" });
    const ret = cFn(arg_p, arg_len, arg_c);
    return ret;
}
pub fn utf8Strreverse(arg_str: [*:0]const u8, arg_len: i64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64) callconv(.c) [*:0]u8, .{ .name = "g_utf8_strreverse" });
    const ret = cFn(arg_str, arg_len);
    return ret;
}
pub fn utf8Strup(arg_str: [*:0]const u8, arg_len: i64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64) callconv(.c) [*:0]u8, .{ .name = "g_utf8_strup" });
    const ret = cFn(arg_str, arg_len);
    return ret;
}
pub fn utf8Substring(arg_str: [*:0]const u8, arg_start_pos: i64, arg_end_pos: i64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, i64, i64) callconv(.c) [*:0]u8, .{ .name = "g_utf8_substring" });
    const ret = cFn(arg_str, arg_start_pos, arg_end_pos);
    return ret;
}
pub fn utf8ToUcs4(arg_str: [*:0]const u8, arg_len: i64, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: *u32,
    items_read: i64,
    items_written: i64,
} {
    var argO_items_read: i64 = undefined;
    const arg_items_read: ?*i64 = &argO_items_read;
    var argO_items_written: i64 = undefined;
    const arg_items_written: ?*i64 = &argO_items_written;
    const cFn = @extern(*const fn ([*:0]const u8, i64, ?*i64, ?*i64, *?*GLib.Error) callconv(.c) *u32, .{ .name = "g_utf8_to_ucs4" });
    const ret = cFn(arg_str, arg_len, arg_items_read, arg_items_written, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .items_read = argO_items_read, .items_written = argO_items_written };
}
pub fn utf8ToUcs4Fast(arg_str: [*:0]const u8, arg_len: i64) struct {
    ret: *u32,
    items_written: i64,
} {
    var argO_items_written: i64 = undefined;
    const arg_items_written: ?*i64 = &argO_items_written;
    const cFn = @extern(*const fn ([*:0]const u8, i64, ?*i64) callconv(.c) *u32, .{ .name = "g_utf8_to_ucs4_fast" });
    const ret = cFn(arg_str, arg_len, arg_items_written);
    return .{ .ret = ret, .items_written = argO_items_written };
}
pub fn utf8ToUtf16(arg_str: [*:0]const u8, arg_len: i64, arg_error: *?*GLib.Error) error{GError}!struct {
    ret: *u16,
    items_read: i64,
    items_written: i64,
} {
    var argO_items_read: i64 = undefined;
    const arg_items_read: ?*i64 = &argO_items_read;
    var argO_items_written: i64 = undefined;
    const arg_items_written: ?*i64 = &argO_items_written;
    const cFn = @extern(*const fn ([*:0]const u8, i64, ?*i64, ?*i64, *?*GLib.Error) callconv(.c) *u16, .{ .name = "g_utf8_to_utf16" });
    const ret = cFn(arg_str, arg_len, arg_items_read, arg_items_written, arg_error);
    if (arg_error.* != null) return error.GError;
    return .{ .ret = ret, .items_read = argO_items_read, .items_written = argO_items_written };
}
pub fn utf8TruncateMiddle(arg_string: [*:0]const u8, arg_truncate_length: u64) [*:0]u8 {
    const cFn = @extern(*const fn ([*:0]const u8, u64) callconv(.c) [*:0]u8, .{ .name = "g_utf8_truncate_middle" });
    const ret = cFn(arg_string, arg_truncate_length);
    return ret;
}
pub fn utf8Validate(argS_str: []u8) struct {
    ret: bool,
    end: [*:0]u8,
} {
    const arg_str: [*]u8 = @ptrCast(argS_str);
    const arg_max_len: i64 = @intCast((argS_str).len);
    var argO_end: ?[*:0]u8 = undefined;
    const arg_end: ?*[*:0]u8 = &argO_end;
    const cFn = @extern(*const fn ([*]u8, i64, ?*[*:0]u8) callconv(.c) bool, .{ .name = "g_utf8_validate" });
    const ret = cFn(arg_str, arg_max_len, arg_end);
    return .{ .ret = ret, .end = argO_end };
}
pub fn utf8ValidateLen(argS_str: []u8) struct {
    ret: bool,
    end: [*:0]u8,
} {
    const arg_str: [*]u8 = @ptrCast(argS_str);
    const arg_max_len: u64 = @intCast((argS_str).len);
    var argO_end: ?[*:0]u8 = undefined;
    const arg_end: ?*[*:0]u8 = &argO_end;
    const cFn = @extern(*const fn ([*]u8, u64, ?*[*:0]u8) callconv(.c) bool, .{ .name = "g_utf8_validate_len" });
    const ret = cFn(arg_str, arg_max_len, arg_end);
    return .{ .ret = ret, .end = argO_end };
}
pub fn utime(arg_filename: [*:0]const u8, arg_utb: ?*anyopaque) i32 {
    const cFn = @extern(*const fn ([*:0]const u8, ?*anyopaque) callconv(.c) i32, .{ .name = "g_utime" });
    const ret = cFn(arg_filename, @ptrCast(arg_utb));
    return ret;
}
pub fn uuidStringIsValid(arg_str: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_uuid_string_is_valid" });
    const ret = cFn(arg_str);
    return ret;
}
pub fn uuidStringRandom() [*:0]u8 {
    const cFn = @extern(*const fn () callconv(.c) [*:0]u8, .{ .name = "g_uuid_string_random" });
    const ret = cFn();
    return ret;
}
pub fn variantGetGtype() core.Type {
    const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "g_variant_get_gtype" });
    const ret = cFn();
    return ret;
}
pub fn variantIsObjectPath(arg_string: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_variant_is_object_path" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn variantIsSignature(arg_string: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_variant_is_signature" });
    const ret = cFn(arg_string);
    return ret;
}
pub fn variantParse(arg_type: ?*VariantType, arg_text: [*:0]const u8, arg_limit: ?[*:0]const u8, arg_endptr: ?[*:0]const u8, arg_error: *?*GLib.Error) error{GError}!*Variant {
    const cFn = @extern(*const fn (?*VariantType, [*:0]const u8, ?[*:0]const u8, ?[*:0]const u8, *?*GLib.Error) callconv(.c) *Variant, .{ .name = "g_variant_parse" });
    const ret = cFn(arg_type, arg_text, arg_limit, arg_endptr, arg_error);
    if (arg_error.* != null) return error.GError;
    return ret;
}
pub fn variantParseErrorPrintContext(arg_error: *GLib.Error, arg_source_str: [*:0]const u8) [*:0]u8 {
    const cFn = @extern(*const fn (*GLib.Error, [*:0]const u8) callconv(.c) [*:0]u8, .{ .name = "g_variant_parse_error_print_context" });
    const ret = cFn(arg_error, arg_source_str);
    return ret;
}
pub fn variantParseErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_variant_parse_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn variantParserGetErrorQuark() u32 {
    const cFn = @extern(*const fn () callconv(.c) u32, .{ .name = "g_variant_parser_get_error_quark" });
    const ret = cFn();
    return ret;
}
pub fn variantTypeChecked(arg_type_string: [*:0]const u8) *VariantType {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *VariantType, .{ .name = "g_variant_type_checked_" });
    const ret = cFn(arg_type_string);
    return ret;
}
pub fn variantTypeStringGetDepth(arg_type_string: [*:0]const u8) u64 {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) u64, .{ .name = "g_variant_type_string_get_depth_" });
    const ret = cFn(arg_type_string);
    return ret;
}
pub fn variantTypeStringIsValid(arg_type_string: [*:0]const u8) bool {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) bool, .{ .name = "g_variant_type_string_is_valid" });
    const ret = cFn(arg_type_string);
    return ret;
}
pub fn variantTypeStringScan(arg_string: [*:0]const u8, arg_limit: ?[*:0]const u8) struct {
    ret: bool,
    endptr: [*:0]u8,
} {
    var argO_endptr: ?[*:0]u8 = undefined;
    const arg_endptr: ?*[*:0]u8 = &argO_endptr;
    const cFn = @extern(*const fn ([*:0]const u8, ?[*:0]const u8, ?*[*:0]u8) callconv(.c) bool, .{ .name = "g_variant_type_string_scan" });
    const ret = cFn(arg_string, arg_limit, arg_endptr);
    return .{ .ret = ret, .endptr = argO_endptr };
}

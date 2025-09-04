const core = @import("core.zig");
const GObject = @import("GObject.zig");
const GLib = @import("GLib.zig");
const Graphene = @This();
pub const Box = extern struct {
    min: Vec3,
    max: Vec3,
    pub fn alloc() *Box {
        const cFn = @extern(*const fn () callconv(.c) *Box, .{ .name = "graphene_box_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn containsBox(self: *Box, arg_b: *Box) bool {
        const cFn = @extern(*const fn (*Box, *Box) callconv(.c) bool, .{ .name = "graphene_box_contains_box" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn containsPoint(self: *Box, arg_point: *Point3D) bool {
        const cFn = @extern(*const fn (*Box, *Point3D) callconv(.c) bool, .{ .name = "graphene_box_contains_point" });
        const ret = cFn(self, arg_point);
        return ret;
    }
    pub fn equal(self: *Box, arg_b: *Box) bool {
        const cFn = @extern(*const fn (*Box, *Box) callconv(.c) bool, .{ .name = "graphene_box_equal" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn expand(self: *Box, arg_point: *Point3D, arg_res: *Box) void {
        const cFn = @extern(*const fn (*Box, *Point3D, *Box) callconv(.c) void, .{ .name = "graphene_box_expand" });
        const ret = cFn(self, arg_point, arg_res);
        return ret;
    }
    pub fn expandScalar(self: *Box, arg_scalar: f32, arg_res: *Box) void {
        const cFn = @extern(*const fn (*Box, f32, *Box) callconv(.c) void, .{ .name = "graphene_box_expand_scalar" });
        const ret = cFn(self, arg_scalar, arg_res);
        return ret;
    }
    pub fn expandVec3(self: *Box, arg_vec: *Vec3, arg_res: *Box) void {
        const cFn = @extern(*const fn (*Box, *Vec3, *Box) callconv(.c) void, .{ .name = "graphene_box_expand_vec3" });
        const ret = cFn(self, arg_vec, arg_res);
        return ret;
    }
    pub fn free(self: *Box) void {
        const cFn = @extern(*const fn (*Box) callconv(.c) void, .{ .name = "graphene_box_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBoundingSphere(self: *Box, arg_sphere: *Sphere) void {
        const cFn = @extern(*const fn (*Box, *Sphere) callconv(.c) void, .{ .name = "graphene_box_get_bounding_sphere" });
        const ret = cFn(self, arg_sphere);
        return ret;
    }
    pub fn getCenter(self: *Box, arg_center: *Point3D) void {
        const cFn = @extern(*const fn (*Box, *Point3D) callconv(.c) void, .{ .name = "graphene_box_get_center" });
        const ret = cFn(self, arg_center);
        return ret;
    }
    pub fn getDepth(self: *Box) f32 {
        const cFn = @extern(*const fn (*Box) callconv(.c) f32, .{ .name = "graphene_box_get_depth" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getHeight(self: *Box) f32 {
        const cFn = @extern(*const fn (*Box) callconv(.c) f32, .{ .name = "graphene_box_get_height" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getMax(self: *Box, arg_max: *Point3D) void {
        const cFn = @extern(*const fn (*Box, *Point3D) callconv(.c) void, .{ .name = "graphene_box_get_max" });
        const ret = cFn(self, arg_max);
        return ret;
    }
    pub fn getMin(self: *Box, arg_min: *Point3D) void {
        const cFn = @extern(*const fn (*Box, *Point3D) callconv(.c) void, .{ .name = "graphene_box_get_min" });
        const ret = cFn(self, arg_min);
        return ret;
    }
    pub fn getSize(self: *Box, arg_size: *Vec3) void {
        const cFn = @extern(*const fn (*Box, *Vec3) callconv(.c) void, .{ .name = "graphene_box_get_size" });
        const ret = cFn(self, arg_size);
        return ret;
    }
    pub fn getVertices(self: *Box, arg_vertices: *[8]Vec3) void {
        const cFn = @extern(*const fn (*Box, *[8]Vec3) callconv(.c) void, .{ .name = "graphene_box_get_vertices" });
        const ret = cFn(self, arg_vertices);
        return ret;
    }
    pub fn getWidth(self: *Box) f32 {
        const cFn = @extern(*const fn (*Box) callconv(.c) f32, .{ .name = "graphene_box_get_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *Box, arg_min: ?*Point3D, arg_max: ?*Point3D) *Box {
        const cFn = @extern(*const fn (*Box, ?*Point3D, ?*Point3D) callconv(.c) *Box, .{ .name = "graphene_box_init" });
        const ret = cFn(self, arg_min, arg_max);
        return ret;
    }
    pub fn initFromBox(self: *Box, arg_src: *Box) *Box {
        const cFn = @extern(*const fn (*Box, *Box) callconv(.c) *Box, .{ .name = "graphene_box_init_from_box" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn initFromPoints(self: *Box, argS_points: []Point3D) *Box {
        const arg_n_points: u32 = @intCast((argS_points).len);
        const arg_points: [*]Point3D = @ptrCast(argS_points);
        const cFn = @extern(*const fn (*Box, u32, [*]Point3D) callconv(.c) *Box, .{ .name = "graphene_box_init_from_points" });
        const ret = cFn(self, arg_n_points, arg_points);
        return ret;
    }
    pub fn initFromVec3(self: *Box, arg_min: ?*Vec3, arg_max: ?*Vec3) *Box {
        const cFn = @extern(*const fn (*Box, ?*Vec3, ?*Vec3) callconv(.c) *Box, .{ .name = "graphene_box_init_from_vec3" });
        const ret = cFn(self, arg_min, arg_max);
        return ret;
    }
    pub fn initFromVectors(self: *Box, argS_vectors: []Vec3) *Box {
        const arg_n_vectors: u32 = @intCast((argS_vectors).len);
        const arg_vectors: [*]Vec3 = @ptrCast(argS_vectors);
        const cFn = @extern(*const fn (*Box, u32, [*]Vec3) callconv(.c) *Box, .{ .name = "graphene_box_init_from_vectors" });
        const ret = cFn(self, arg_n_vectors, arg_vectors);
        return ret;
    }
    pub fn intersection(self: *Box, arg_b: *Box, arg_res: ?*Box) bool {
        const cFn = @extern(*const fn (*Box, *Box, ?*Box) callconv(.c) bool, .{ .name = "graphene_box_intersection" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn @"union"(self: *Box, arg_b: *Box, arg_res: *Box) void {
        const cFn = @extern(*const fn (*Box, *Box, *Box) callconv(.c) void, .{ .name = "graphene_box_union" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn empty() *Box {
        const cFn = @extern(*const fn () callconv(.c) *Box, .{ .name = "graphene_box_empty" });
        const ret = cFn();
        return ret;
    }
    pub fn infinite() *Box {
        const cFn = @extern(*const fn () callconv(.c) *Box, .{ .name = "graphene_box_infinite" });
        const ret = cFn();
        return ret;
    }
    pub fn minusOne() *Box {
        const cFn = @extern(*const fn () callconv(.c) *Box, .{ .name = "graphene_box_minus_one" });
        const ret = cFn();
        return ret;
    }
    pub fn one() *Box {
        const cFn = @extern(*const fn () callconv(.c) *Box, .{ .name = "graphene_box_one" });
        const ret = cFn();
        return ret;
    }
    pub fn oneMinusOne() *Box {
        const cFn = @extern(*const fn () callconv(.c) *Box, .{ .name = "graphene_box_one_minus_one" });
        const ret = cFn();
        return ret;
    }
    pub fn zero() *Box {
        const cFn = @extern(*const fn () callconv(.c) *Box, .{ .name = "graphene_box_zero" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_box_get_type" });
        return cFn();
    }
};
pub const Euler = extern struct {
    angles: Vec3,
    order: EulerOrder,
    pub fn alloc() *Euler {
        const cFn = @extern(*const fn () callconv(.c) *Euler, .{ .name = "graphene_euler_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn equal(self: *Euler, arg_b: *Euler) bool {
        const cFn = @extern(*const fn (*Euler, *Euler) callconv(.c) bool, .{ .name = "graphene_euler_equal" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn free(self: *Euler) void {
        const cFn = @extern(*const fn (*Euler) callconv(.c) void, .{ .name = "graphene_euler_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getAlpha(self: *Euler) f32 {
        const cFn = @extern(*const fn (*Euler) callconv(.c) f32, .{ .name = "graphene_euler_get_alpha" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBeta(self: *Euler) f32 {
        const cFn = @extern(*const fn (*Euler) callconv(.c) f32, .{ .name = "graphene_euler_get_beta" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getGamma(self: *Euler) f32 {
        const cFn = @extern(*const fn (*Euler) callconv(.c) f32, .{ .name = "graphene_euler_get_gamma" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getOrder(self: *Euler) EulerOrder {
        const cFn = @extern(*const fn (*Euler) callconv(.c) EulerOrder, .{ .name = "graphene_euler_get_order" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getX(self: *Euler) f32 {
        const cFn = @extern(*const fn (*Euler) callconv(.c) f32, .{ .name = "graphene_euler_get_x" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getY(self: *Euler) f32 {
        const cFn = @extern(*const fn (*Euler) callconv(.c) f32, .{ .name = "graphene_euler_get_y" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getZ(self: *Euler) f32 {
        const cFn = @extern(*const fn (*Euler) callconv(.c) f32, .{ .name = "graphene_euler_get_z" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *Euler, arg_x: f32, arg_y: f32, arg_z: f32) *Euler {
        const cFn = @extern(*const fn (*Euler, f32, f32, f32) callconv(.c) *Euler, .{ .name = "graphene_euler_init" });
        const ret = cFn(self, arg_x, arg_y, arg_z);
        return ret;
    }
    pub fn initFromEuler(self: *Euler, arg_src: ?*Euler) *Euler {
        const cFn = @extern(*const fn (*Euler, ?*Euler) callconv(.c) *Euler, .{ .name = "graphene_euler_init_from_euler" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn initFromMatrix(self: *Euler, arg_m: ?*Matrix, arg_order: EulerOrder) *Euler {
        const cFn = @extern(*const fn (*Euler, ?*Matrix, EulerOrder) callconv(.c) *Euler, .{ .name = "graphene_euler_init_from_matrix" });
        const ret = cFn(self, arg_m, arg_order);
        return ret;
    }
    pub fn initFromQuaternion(self: *Euler, arg_q: ?*Quaternion, arg_order: EulerOrder) *Euler {
        const cFn = @extern(*const fn (*Euler, ?*Quaternion, EulerOrder) callconv(.c) *Euler, .{ .name = "graphene_euler_init_from_quaternion" });
        const ret = cFn(self, arg_q, arg_order);
        return ret;
    }
    pub fn initFromRadians(self: *Euler, arg_x: f32, arg_y: f32, arg_z: f32, arg_order: EulerOrder) *Euler {
        const cFn = @extern(*const fn (*Euler, f32, f32, f32, EulerOrder) callconv(.c) *Euler, .{ .name = "graphene_euler_init_from_radians" });
        const ret = cFn(self, arg_x, arg_y, arg_z, arg_order);
        return ret;
    }
    pub fn initFromVec3(self: *Euler, arg_v: ?*Vec3, arg_order: EulerOrder) *Euler {
        const cFn = @extern(*const fn (*Euler, ?*Vec3, EulerOrder) callconv(.c) *Euler, .{ .name = "graphene_euler_init_from_vec3" });
        const ret = cFn(self, arg_v, arg_order);
        return ret;
    }
    pub fn initWithOrder(self: *Euler, arg_x: f32, arg_y: f32, arg_z: f32, arg_order: EulerOrder) *Euler {
        const cFn = @extern(*const fn (*Euler, f32, f32, f32, EulerOrder) callconv(.c) *Euler, .{ .name = "graphene_euler_init_with_order" });
        const ret = cFn(self, arg_x, arg_y, arg_z, arg_order);
        return ret;
    }
    pub fn reorder(self: *Euler, arg_order: EulerOrder, arg_res: *Euler) void {
        const cFn = @extern(*const fn (*Euler, EulerOrder, *Euler) callconv(.c) void, .{ .name = "graphene_euler_reorder" });
        const ret = cFn(self, arg_order, arg_res);
        return ret;
    }
    pub fn toMatrix(self: *Euler, arg_res: *Matrix) void {
        const cFn = @extern(*const fn (*Euler, *Matrix) callconv(.c) void, .{ .name = "graphene_euler_to_matrix" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn toQuaternion(self: *Euler, arg_res: *Quaternion) void {
        const cFn = @extern(*const fn (*Euler, *Quaternion) callconv(.c) void, .{ .name = "graphene_euler_to_quaternion" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn toVec3(self: *Euler, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Euler, *Vec3) callconv(.c) void, .{ .name = "graphene_euler_to_vec3" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_euler_get_type" });
        return cFn();
    }
};
pub const EulerOrder = enum(i32) {
    default = -1,
    xyz = 0,
    yzx = 1,
    zxy = 2,
    xzy = 3,
    yxz = 4,
    zyx = 5,
    sxyz = 6,
    sxyx = 7,
    sxzy = 8,
    sxzx = 9,
    syzx = 10,
    syzy = 11,
    syxz = 12,
    syxy = 13,
    szxy = 14,
    szxz = 15,
    szyx = 16,
    szyz = 17,
    rzyx = 18,
    rxyx = 19,
    ryzx = 20,
    rxzx = 21,
    rxzy = 22,
    ryzy = 23,
    rzxy = 24,
    ryxy = 25,
    ryxz = 26,
    rzxz = 27,
    rxyz = 28,
    rzyz = 29,
};
pub const Frustum = extern struct {
    planes: [6]Plane,
    pub fn alloc() *Frustum {
        const cFn = @extern(*const fn () callconv(.c) *Frustum, .{ .name = "graphene_frustum_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn containsPoint(self: *Frustum, arg_point: *Point3D) bool {
        const cFn = @extern(*const fn (*Frustum, *Point3D) callconv(.c) bool, .{ .name = "graphene_frustum_contains_point" });
        const ret = cFn(self, arg_point);
        return ret;
    }
    pub fn equal(self: *Frustum, arg_b: *Frustum) bool {
        const cFn = @extern(*const fn (*Frustum, *Frustum) callconv(.c) bool, .{ .name = "graphene_frustum_equal" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn free(self: *Frustum) void {
        const cFn = @extern(*const fn (*Frustum) callconv(.c) void, .{ .name = "graphene_frustum_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPlanes(self: *Frustum, arg_planes: *[6]Plane) void {
        const cFn = @extern(*const fn (*Frustum, *[6]Plane) callconv(.c) void, .{ .name = "graphene_frustum_get_planes" });
        const ret = cFn(self, arg_planes);
        return ret;
    }
    pub fn init(self: *Frustum, arg_p0: *Plane, arg_p1: *Plane, arg_p2: *Plane, arg_p3: *Plane, arg_p4: *Plane, arg_p5: *Plane) *Frustum {
        const cFn = @extern(*const fn (*Frustum, *Plane, *Plane, *Plane, *Plane, *Plane, *Plane) callconv(.c) *Frustum, .{ .name = "graphene_frustum_init" });
        const ret = cFn(self, arg_p0, arg_p1, arg_p2, arg_p3, arg_p4, arg_p5);
        return ret;
    }
    pub fn initFromFrustum(self: *Frustum, arg_src: *Frustum) *Frustum {
        const cFn = @extern(*const fn (*Frustum, *Frustum) callconv(.c) *Frustum, .{ .name = "graphene_frustum_init_from_frustum" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn initFromMatrix(self: *Frustum, arg_matrix: *Matrix) *Frustum {
        const cFn = @extern(*const fn (*Frustum, *Matrix) callconv(.c) *Frustum, .{ .name = "graphene_frustum_init_from_matrix" });
        const ret = cFn(self, arg_matrix);
        return ret;
    }
    pub fn intersectsBox(self: *Frustum, arg_box: *Box) bool {
        const cFn = @extern(*const fn (*Frustum, *Box) callconv(.c) bool, .{ .name = "graphene_frustum_intersects_box" });
        const ret = cFn(self, arg_box);
        return ret;
    }
    pub fn intersectsSphere(self: *Frustum, arg_sphere: *Sphere) bool {
        const cFn = @extern(*const fn (*Frustum, *Sphere) callconv(.c) bool, .{ .name = "graphene_frustum_intersects_sphere" });
        const ret = cFn(self, arg_sphere);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_frustum_get_type" });
        return cFn();
    }
};
pub const Matrix = extern struct {
    value: Simd4X4F,
    pub fn alloc() *Matrix {
        const cFn = @extern(*const fn () callconv(.c) *Matrix, .{ .name = "graphene_matrix_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn decompose(self: *Matrix, arg_translate: *Vec3, arg_scale: *Vec3, arg_rotate: *Quaternion, arg_shear: *Vec3, arg_perspective: *Vec4) bool {
        const cFn = @extern(*const fn (*Matrix, *Vec3, *Vec3, *Quaternion, *Vec3, *Vec4) callconv(.c) bool, .{ .name = "graphene_matrix_decompose" });
        const ret = cFn(self, arg_translate, arg_scale, arg_rotate, arg_shear, arg_perspective);
        return ret;
    }
    pub fn determinant(self: *Matrix) f32 {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) f32, .{ .name = "graphene_matrix_determinant" });
        const ret = cFn(self);
        return ret;
    }
    pub fn equal(self: *Matrix, arg_b: *Matrix) bool {
        const cFn = @extern(*const fn (*Matrix, *Matrix) callconv(.c) bool, .{ .name = "graphene_matrix_equal" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn equalFast(self: *Matrix, arg_b: *Matrix) bool {
        const cFn = @extern(*const fn (*Matrix, *Matrix) callconv(.c) bool, .{ .name = "graphene_matrix_equal_fast" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn free(self: *Matrix) void {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) void, .{ .name = "graphene_matrix_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getRow(self: *Matrix, arg_index_: u32, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Matrix, u32, *Vec4) callconv(.c) void, .{ .name = "graphene_matrix_get_row" });
        const ret = cFn(self, arg_index_, arg_res);
        return ret;
    }
    pub fn getValue(self: *Matrix, arg_row: u32, arg_col: u32) f32 {
        const cFn = @extern(*const fn (*Matrix, u32, u32) callconv(.c) f32, .{ .name = "graphene_matrix_get_value" });
        const ret = cFn(self, arg_row, arg_col);
        return ret;
    }
    pub fn getXScale(self: *Matrix) f32 {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) f32, .{ .name = "graphene_matrix_get_x_scale" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getXTranslation(self: *Matrix) f32 {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) f32, .{ .name = "graphene_matrix_get_x_translation" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getYScale(self: *Matrix) f32 {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) f32, .{ .name = "graphene_matrix_get_y_scale" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getYTranslation(self: *Matrix) f32 {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) f32, .{ .name = "graphene_matrix_get_y_translation" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getZScale(self: *Matrix) f32 {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) f32, .{ .name = "graphene_matrix_get_z_scale" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getZTranslation(self: *Matrix) f32 {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) f32, .{ .name = "graphene_matrix_get_z_translation" });
        const ret = cFn(self);
        return ret;
    }
    pub fn initFrom2d(self: *Matrix, arg_xx: f64, arg_yx: f64, arg_xy: f64, arg_yy: f64, arg_x_0: f64, arg_y_0: f64) *Matrix {
        const cFn = @extern(*const fn (*Matrix, f64, f64, f64, f64, f64, f64) callconv(.c) *Matrix, .{ .name = "graphene_matrix_init_from_2d" });
        const ret = cFn(self, arg_xx, arg_yx, arg_xy, arg_yy, arg_x_0, arg_y_0);
        return ret;
    }
    pub fn initFromFloat(self: *Matrix, arg_v: *[16]f32) *Matrix {
        const cFn = @extern(*const fn (*Matrix, *[16]f32) callconv(.c) *Matrix, .{ .name = "graphene_matrix_init_from_float" });
        const ret = cFn(self, arg_v);
        return ret;
    }
    pub fn initFromMatrix(self: *Matrix, arg_src: *Matrix) *Matrix {
        const cFn = @extern(*const fn (*Matrix, *Matrix) callconv(.c) *Matrix, .{ .name = "graphene_matrix_init_from_matrix" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn initFromVec4(self: *Matrix, arg_v0: *Vec4, arg_v1: *Vec4, arg_v2: *Vec4, arg_v3: *Vec4) *Matrix {
        const cFn = @extern(*const fn (*Matrix, *Vec4, *Vec4, *Vec4, *Vec4) callconv(.c) *Matrix, .{ .name = "graphene_matrix_init_from_vec4" });
        const ret = cFn(self, arg_v0, arg_v1, arg_v2, arg_v3);
        return ret;
    }
    pub fn initFrustum(self: *Matrix, arg_left: f32, arg_right: f32, arg_bottom: f32, arg_top: f32, arg_z_near: f32, arg_z_far: f32) *Matrix {
        const cFn = @extern(*const fn (*Matrix, f32, f32, f32, f32, f32, f32) callconv(.c) *Matrix, .{ .name = "graphene_matrix_init_frustum" });
        const ret = cFn(self, arg_left, arg_right, arg_bottom, arg_top, arg_z_near, arg_z_far);
        return ret;
    }
    pub fn initIdentity(self: *Matrix) *Matrix {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) *Matrix, .{ .name = "graphene_matrix_init_identity" });
        const ret = cFn(self);
        return ret;
    }
    pub fn initLookAt(self: *Matrix, arg_eye: *Vec3, arg_center: *Vec3, arg_up: *Vec3) *Matrix {
        const cFn = @extern(*const fn (*Matrix, *Vec3, *Vec3, *Vec3) callconv(.c) *Matrix, .{ .name = "graphene_matrix_init_look_at" });
        const ret = cFn(self, arg_eye, arg_center, arg_up);
        return ret;
    }
    pub fn initOrtho(self: *Matrix, arg_left: f32, arg_right: f32, arg_top: f32, arg_bottom: f32, arg_z_near: f32, arg_z_far: f32) *Matrix {
        const cFn = @extern(*const fn (*Matrix, f32, f32, f32, f32, f32, f32) callconv(.c) *Matrix, .{ .name = "graphene_matrix_init_ortho" });
        const ret = cFn(self, arg_left, arg_right, arg_top, arg_bottom, arg_z_near, arg_z_far);
        return ret;
    }
    pub fn initPerspective(self: *Matrix, arg_fovy: f32, arg_aspect: f32, arg_z_near: f32, arg_z_far: f32) *Matrix {
        const cFn = @extern(*const fn (*Matrix, f32, f32, f32, f32) callconv(.c) *Matrix, .{ .name = "graphene_matrix_init_perspective" });
        const ret = cFn(self, arg_fovy, arg_aspect, arg_z_near, arg_z_far);
        return ret;
    }
    pub fn initRotate(self: *Matrix, arg_angle: f32, arg_axis: *Vec3) *Matrix {
        const cFn = @extern(*const fn (*Matrix, f32, *Vec3) callconv(.c) *Matrix, .{ .name = "graphene_matrix_init_rotate" });
        const ret = cFn(self, arg_angle, arg_axis);
        return ret;
    }
    pub fn initScale(self: *Matrix, arg_x: f32, arg_y: f32, arg_z: f32) *Matrix {
        const cFn = @extern(*const fn (*Matrix, f32, f32, f32) callconv(.c) *Matrix, .{ .name = "graphene_matrix_init_scale" });
        const ret = cFn(self, arg_x, arg_y, arg_z);
        return ret;
    }
    pub fn initSkew(self: *Matrix, arg_x_skew: f32, arg_y_skew: f32) *Matrix {
        const cFn = @extern(*const fn (*Matrix, f32, f32) callconv(.c) *Matrix, .{ .name = "graphene_matrix_init_skew" });
        const ret = cFn(self, arg_x_skew, arg_y_skew);
        return ret;
    }
    pub fn initTranslate(self: *Matrix, arg_p: *Point3D) *Matrix {
        const cFn = @extern(*const fn (*Matrix, *Point3D) callconv(.c) *Matrix, .{ .name = "graphene_matrix_init_translate" });
        const ret = cFn(self, arg_p);
        return ret;
    }
    pub fn interpolate(self: *Matrix, arg_b: *Matrix, arg_factor: f64, arg_res: *Matrix) void {
        const cFn = @extern(*const fn (*Matrix, *Matrix, f64, *Matrix) callconv(.c) void, .{ .name = "graphene_matrix_interpolate" });
        const ret = cFn(self, arg_b, arg_factor, arg_res);
        return ret;
    }
    pub fn inverse(self: *Matrix, arg_res: *Matrix) bool {
        const cFn = @extern(*const fn (*Matrix, *Matrix) callconv(.c) bool, .{ .name = "graphene_matrix_inverse" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn is2d(self: *Matrix) bool {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) bool, .{ .name = "graphene_matrix_is_2d" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isBackfaceVisible(self: *Matrix) bool {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) bool, .{ .name = "graphene_matrix_is_backface_visible" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isIdentity(self: *Matrix) bool {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) bool, .{ .name = "graphene_matrix_is_identity" });
        const ret = cFn(self);
        return ret;
    }
    pub fn isSingular(self: *Matrix) bool {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) bool, .{ .name = "graphene_matrix_is_singular" });
        const ret = cFn(self);
        return ret;
    }
    pub fn multiply(self: *Matrix, arg_b: *Matrix, arg_res: *Matrix) void {
        const cFn = @extern(*const fn (*Matrix, *Matrix, *Matrix) callconv(.c) void, .{ .name = "graphene_matrix_multiply" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn near(self: *Matrix, arg_b: *Matrix, arg_epsilon: f32) bool {
        const cFn = @extern(*const fn (*Matrix, *Matrix, f32) callconv(.c) bool, .{ .name = "graphene_matrix_near" });
        const ret = cFn(self, arg_b, arg_epsilon);
        return ret;
    }
    pub fn normalize(self: *Matrix, arg_res: *Matrix) void {
        const cFn = @extern(*const fn (*Matrix, *Matrix) callconv(.c) void, .{ .name = "graphene_matrix_normalize" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn perspective(self: *Matrix, arg_depth: f32, arg_res: *Matrix) void {
        const cFn = @extern(*const fn (*Matrix, f32, *Matrix) callconv(.c) void, .{ .name = "graphene_matrix_perspective" });
        const ret = cFn(self, arg_depth, arg_res);
        return ret;
    }
    pub fn print(self: *Matrix) void {
        const cFn = @extern(*const fn (*Matrix) callconv(.c) void, .{ .name = "graphene_matrix_print" });
        const ret = cFn(self);
        return ret;
    }
    pub fn projectPoint(self: *Matrix, arg_p: *Point, arg_res: *Point) void {
        const cFn = @extern(*const fn (*Matrix, *Point, *Point) callconv(.c) void, .{ .name = "graphene_matrix_project_point" });
        const ret = cFn(self, arg_p, arg_res);
        return ret;
    }
    pub fn projectRect(self: *Matrix, arg_r: *Rect, arg_res: *Quad) void {
        const cFn = @extern(*const fn (*Matrix, *Rect, *Quad) callconv(.c) void, .{ .name = "graphene_matrix_project_rect" });
        const ret = cFn(self, arg_r, arg_res);
        return ret;
    }
    pub fn projectRectBounds(self: *Matrix, arg_r: *Rect, arg_res: *Rect) void {
        const cFn = @extern(*const fn (*Matrix, *Rect, *Rect) callconv(.c) void, .{ .name = "graphene_matrix_project_rect_bounds" });
        const ret = cFn(self, arg_r, arg_res);
        return ret;
    }
    pub fn rotate(self: *Matrix, arg_angle: f32, arg_axis: *Vec3) void {
        const cFn = @extern(*const fn (*Matrix, f32, *Vec3) callconv(.c) void, .{ .name = "graphene_matrix_rotate" });
        const ret = cFn(self, arg_angle, arg_axis);
        return ret;
    }
    pub fn rotateEuler(self: *Matrix, arg_e: *Euler) void {
        const cFn = @extern(*const fn (*Matrix, *Euler) callconv(.c) void, .{ .name = "graphene_matrix_rotate_euler" });
        const ret = cFn(self, arg_e);
        return ret;
    }
    pub fn rotateQuaternion(self: *Matrix, arg_q: *Quaternion) void {
        const cFn = @extern(*const fn (*Matrix, *Quaternion) callconv(.c) void, .{ .name = "graphene_matrix_rotate_quaternion" });
        const ret = cFn(self, arg_q);
        return ret;
    }
    pub fn rotateX(self: *Matrix, arg_angle: f32) void {
        const cFn = @extern(*const fn (*Matrix, f32) callconv(.c) void, .{ .name = "graphene_matrix_rotate_x" });
        const ret = cFn(self, arg_angle);
        return ret;
    }
    pub fn rotateY(self: *Matrix, arg_angle: f32) void {
        const cFn = @extern(*const fn (*Matrix, f32) callconv(.c) void, .{ .name = "graphene_matrix_rotate_y" });
        const ret = cFn(self, arg_angle);
        return ret;
    }
    pub fn rotateZ(self: *Matrix, arg_angle: f32) void {
        const cFn = @extern(*const fn (*Matrix, f32) callconv(.c) void, .{ .name = "graphene_matrix_rotate_z" });
        const ret = cFn(self, arg_angle);
        return ret;
    }
    pub fn scale(self: *Matrix, arg_factor_x: f32, arg_factor_y: f32, arg_factor_z: f32) void {
        const cFn = @extern(*const fn (*Matrix, f32, f32, f32) callconv(.c) void, .{ .name = "graphene_matrix_scale" });
        const ret = cFn(self, arg_factor_x, arg_factor_y, arg_factor_z);
        return ret;
    }
    pub fn skewXy(self: *Matrix, arg_factor: f32) void {
        const cFn = @extern(*const fn (*Matrix, f32) callconv(.c) void, .{ .name = "graphene_matrix_skew_xy" });
        const ret = cFn(self, arg_factor);
        return ret;
    }
    pub fn skewXz(self: *Matrix, arg_factor: f32) void {
        const cFn = @extern(*const fn (*Matrix, f32) callconv(.c) void, .{ .name = "graphene_matrix_skew_xz" });
        const ret = cFn(self, arg_factor);
        return ret;
    }
    pub fn skewYz(self: *Matrix, arg_factor: f32) void {
        const cFn = @extern(*const fn (*Matrix, f32) callconv(.c) void, .{ .name = "graphene_matrix_skew_yz" });
        const ret = cFn(self, arg_factor);
        return ret;
    }
    pub fn to2d(self: *Matrix) struct {
        ret: bool,
        xx: f64,
        yx: f64,
        xy: f64,
        yy: f64,
        x_0: f64,
        y_0: f64,
    } {
        var argO_xx: f64 = undefined;
        const arg_xx: *f64 = &argO_xx;
        var argO_yx: f64 = undefined;
        const arg_yx: *f64 = &argO_yx;
        var argO_xy: f64 = undefined;
        const arg_xy: *f64 = &argO_xy;
        var argO_yy: f64 = undefined;
        const arg_yy: *f64 = &argO_yy;
        var argO_x_0: f64 = undefined;
        const arg_x_0: *f64 = &argO_x_0;
        var argO_y_0: f64 = undefined;
        const arg_y_0: *f64 = &argO_y_0;
        const cFn = @extern(*const fn (*Matrix, *f64, *f64, *f64, *f64, *f64, *f64) callconv(.c) bool, .{ .name = "graphene_matrix_to_2d" });
        const ret = cFn(self, arg_xx, arg_yx, arg_xy, arg_yy, arg_x_0, arg_y_0);
        return .{ .ret = ret, .xx = argO_xx, .yx = argO_yx, .xy = argO_xy, .yy = argO_yy, .x_0 = argO_x_0, .y_0 = argO_y_0 };
    }
    pub fn toFloat(self: *Matrix, arg_v: *[16]f32) void {
        const cFn = @extern(*const fn (*Matrix, *[16]f32) callconv(.c) void, .{ .name = "graphene_matrix_to_float" });
        const ret = cFn(self, arg_v);
        return ret;
    }
    pub fn transformBounds(self: *Matrix, arg_r: *Rect, arg_res: *Rect) void {
        const cFn = @extern(*const fn (*Matrix, *Rect, *Rect) callconv(.c) void, .{ .name = "graphene_matrix_transform_bounds" });
        const ret = cFn(self, arg_r, arg_res);
        return ret;
    }
    pub fn transformBox(self: *Matrix, arg_b: *Box, arg_res: *Box) void {
        const cFn = @extern(*const fn (*Matrix, *Box, *Box) callconv(.c) void, .{ .name = "graphene_matrix_transform_box" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn transformPoint(self: *Matrix, arg_p: *Point, arg_res: *Point) void {
        const cFn = @extern(*const fn (*Matrix, *Point, *Point) callconv(.c) void, .{ .name = "graphene_matrix_transform_point" });
        const ret = cFn(self, arg_p, arg_res);
        return ret;
    }
    pub fn transformPoint3d(self: *Matrix, arg_p: *Point3D, arg_res: *Point3D) void {
        const cFn = @extern(*const fn (*Matrix, *Point3D, *Point3D) callconv(.c) void, .{ .name = "graphene_matrix_transform_point3d" });
        const ret = cFn(self, arg_p, arg_res);
        return ret;
    }
    pub fn transformRay(self: *Matrix, arg_r: *Ray, arg_res: *Ray) void {
        const cFn = @extern(*const fn (*Matrix, *Ray, *Ray) callconv(.c) void, .{ .name = "graphene_matrix_transform_ray" });
        const ret = cFn(self, arg_r, arg_res);
        return ret;
    }
    pub fn transformRect(self: *Matrix, arg_r: *Rect, arg_res: *Quad) void {
        const cFn = @extern(*const fn (*Matrix, *Rect, *Quad) callconv(.c) void, .{ .name = "graphene_matrix_transform_rect" });
        const ret = cFn(self, arg_r, arg_res);
        return ret;
    }
    pub fn transformSphere(self: *Matrix, arg_s: *Sphere, arg_res: *Sphere) void {
        const cFn = @extern(*const fn (*Matrix, *Sphere, *Sphere) callconv(.c) void, .{ .name = "graphene_matrix_transform_sphere" });
        const ret = cFn(self, arg_s, arg_res);
        return ret;
    }
    pub fn transformVec3(self: *Matrix, arg_v: *Vec3, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Matrix, *Vec3, *Vec3) callconv(.c) void, .{ .name = "graphene_matrix_transform_vec3" });
        const ret = cFn(self, arg_v, arg_res);
        return ret;
    }
    pub fn transformVec4(self: *Matrix, arg_v: *Vec4, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Matrix, *Vec4, *Vec4) callconv(.c) void, .{ .name = "graphene_matrix_transform_vec4" });
        const ret = cFn(self, arg_v, arg_res);
        return ret;
    }
    pub fn translate(self: *Matrix, arg_pos: *Point3D) void {
        const cFn = @extern(*const fn (*Matrix, *Point3D) callconv(.c) void, .{ .name = "graphene_matrix_translate" });
        const ret = cFn(self, arg_pos);
        return ret;
    }
    pub fn transpose(self: *Matrix, arg_res: *Matrix) void {
        const cFn = @extern(*const fn (*Matrix, *Matrix) callconv(.c) void, .{ .name = "graphene_matrix_transpose" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn unprojectPoint3d(self: *Matrix, arg_modelview: *Matrix, arg_point: *Point3D, arg_res: *Point3D) void {
        const cFn = @extern(*const fn (*Matrix, *Matrix, *Point3D, *Point3D) callconv(.c) void, .{ .name = "graphene_matrix_unproject_point3d" });
        const ret = cFn(self, arg_modelview, arg_point, arg_res);
        return ret;
    }
    pub fn untransformBounds(self: *Matrix, arg_r: *Rect, arg_bounds: *Rect, arg_res: *Rect) void {
        const cFn = @extern(*const fn (*Matrix, *Rect, *Rect, *Rect) callconv(.c) void, .{ .name = "graphene_matrix_untransform_bounds" });
        const ret = cFn(self, arg_r, arg_bounds, arg_res);
        return ret;
    }
    pub fn untransformPoint(self: *Matrix, arg_p: *Point, arg_bounds: *Rect, arg_res: *Point) bool {
        const cFn = @extern(*const fn (*Matrix, *Point, *Rect, *Point) callconv(.c) bool, .{ .name = "graphene_matrix_untransform_point" });
        const ret = cFn(self, arg_p, arg_bounds, arg_res);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_matrix_get_type" });
        return cFn();
    }
};
pub const PI = 3.141593;
pub const PI_2 = 1.570796;
pub const Plane = extern struct {
    normal: Vec3,
    constant: f32,
    pub fn alloc() *Plane {
        const cFn = @extern(*const fn () callconv(.c) *Plane, .{ .name = "graphene_plane_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn distance(self: *Plane, arg_point: *Point3D) f32 {
        const cFn = @extern(*const fn (*Plane, *Point3D) callconv(.c) f32, .{ .name = "graphene_plane_distance" });
        const ret = cFn(self, arg_point);
        return ret;
    }
    pub fn equal(self: *Plane, arg_b: *Plane) bool {
        const cFn = @extern(*const fn (*Plane, *Plane) callconv(.c) bool, .{ .name = "graphene_plane_equal" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn free(self: *Plane) void {
        const cFn = @extern(*const fn (*Plane) callconv(.c) void, .{ .name = "graphene_plane_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getConstant(self: *Plane) f32 {
        const cFn = @extern(*const fn (*Plane) callconv(.c) f32, .{ .name = "graphene_plane_get_constant" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getNormal(self: *Plane, arg_normal: *Vec3) void {
        const cFn = @extern(*const fn (*Plane, *Vec3) callconv(.c) void, .{ .name = "graphene_plane_get_normal" });
        const ret = cFn(self, arg_normal);
        return ret;
    }
    pub fn init(self: *Plane, arg_normal: ?*Vec3, arg_constant: f32) *Plane {
        const cFn = @extern(*const fn (*Plane, ?*Vec3, f32) callconv(.c) *Plane, .{ .name = "graphene_plane_init" });
        const ret = cFn(self, arg_normal, arg_constant);
        return ret;
    }
    pub fn initFromPlane(self: *Plane, arg_src: *Plane) *Plane {
        const cFn = @extern(*const fn (*Plane, *Plane) callconv(.c) *Plane, .{ .name = "graphene_plane_init_from_plane" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn initFromPoint(self: *Plane, arg_normal: *Vec3, arg_point: *Point3D) *Plane {
        const cFn = @extern(*const fn (*Plane, *Vec3, *Point3D) callconv(.c) *Plane, .{ .name = "graphene_plane_init_from_point" });
        const ret = cFn(self, arg_normal, arg_point);
        return ret;
    }
    pub fn initFromPoints(self: *Plane, arg_a: *Point3D, arg_b: *Point3D, arg_c: *Point3D) *Plane {
        const cFn = @extern(*const fn (*Plane, *Point3D, *Point3D, *Point3D) callconv(.c) *Plane, .{ .name = "graphene_plane_init_from_points" });
        const ret = cFn(self, arg_a, arg_b, arg_c);
        return ret;
    }
    pub fn initFromVec4(self: *Plane, arg_src: *Vec4) *Plane {
        const cFn = @extern(*const fn (*Plane, *Vec4) callconv(.c) *Plane, .{ .name = "graphene_plane_init_from_vec4" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn negate(self: *Plane, arg_res: *Plane) void {
        const cFn = @extern(*const fn (*Plane, *Plane) callconv(.c) void, .{ .name = "graphene_plane_negate" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn normalize(self: *Plane, arg_res: *Plane) void {
        const cFn = @extern(*const fn (*Plane, *Plane) callconv(.c) void, .{ .name = "graphene_plane_normalize" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn transform(self: *Plane, arg_matrix: *Matrix, arg_normal_matrix: ?*Matrix, arg_res: *Plane) void {
        const cFn = @extern(*const fn (*Plane, *Matrix, ?*Matrix, *Plane) callconv(.c) void, .{ .name = "graphene_plane_transform" });
        const ret = cFn(self, arg_matrix, arg_normal_matrix, arg_res);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_plane_get_type" });
        return cFn();
    }
};
pub const Point = extern struct {
    x: f32,
    y: f32,
    pub fn alloc() *Point {
        const cFn = @extern(*const fn () callconv(.c) *Point, .{ .name = "graphene_point_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn distance(self: *Point, arg_b: *Point) struct {
        ret: f32,
        d_x: f32,
        d_y: f32,
    } {
        var argO_d_x: f32 = undefined;
        const arg_d_x: ?*f32 = &argO_d_x;
        var argO_d_y: f32 = undefined;
        const arg_d_y: ?*f32 = &argO_d_y;
        const cFn = @extern(*const fn (*Point, *Point, ?*f32, ?*f32) callconv(.c) f32, .{ .name = "graphene_point_distance" });
        const ret = cFn(self, arg_b, arg_d_x, arg_d_y);
        return .{ .ret = ret, .d_x = argO_d_x, .d_y = argO_d_y };
    }
    pub fn equal(self: *Point, arg_b: *Point) bool {
        const cFn = @extern(*const fn (*Point, *Point) callconv(.c) bool, .{ .name = "graphene_point_equal" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn free(self: *Point) void {
        const cFn = @extern(*const fn (*Point) callconv(.c) void, .{ .name = "graphene_point_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *Point, arg_x: f32, arg_y: f32) *Point {
        const cFn = @extern(*const fn (*Point, f32, f32) callconv(.c) *Point, .{ .name = "graphene_point_init" });
        const ret = cFn(self, arg_x, arg_y);
        return ret;
    }
    pub fn initFromPoint(self: *Point, arg_src: *Point) *Point {
        const cFn = @extern(*const fn (*Point, *Point) callconv(.c) *Point, .{ .name = "graphene_point_init_from_point" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn initFromVec2(self: *Point, arg_src: *Vec2) *Point {
        const cFn = @extern(*const fn (*Point, *Vec2) callconv(.c) *Point, .{ .name = "graphene_point_init_from_vec2" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn interpolate(self: *Point, arg_b: *Point, arg_factor: f64, arg_res: *Point) void {
        const cFn = @extern(*const fn (*Point, *Point, f64, *Point) callconv(.c) void, .{ .name = "graphene_point_interpolate" });
        const ret = cFn(self, arg_b, arg_factor, arg_res);
        return ret;
    }
    pub fn near(self: *Point, arg_b: *Point, arg_epsilon: f32) bool {
        const cFn = @extern(*const fn (*Point, *Point, f32) callconv(.c) bool, .{ .name = "graphene_point_near" });
        const ret = cFn(self, arg_b, arg_epsilon);
        return ret;
    }
    pub fn toVec2(self: *Point, arg_v: *Vec2) void {
        const cFn = @extern(*const fn (*Point, *Vec2) callconv(.c) void, .{ .name = "graphene_point_to_vec2" });
        const ret = cFn(self, arg_v);
        return ret;
    }
    pub fn zero() *Point {
        const cFn = @extern(*const fn () callconv(.c) *Point, .{ .name = "graphene_point_zero" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_point_get_type" });
        return cFn();
    }
};
pub const Point3D = extern struct {
    x: f32,
    y: f32,
    z: f32,
    pub fn alloc() *Point3D {
        const cFn = @extern(*const fn () callconv(.c) *Point3D, .{ .name = "graphene_point3d_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn cross(self: *Point3D, arg_b: *Point3D, arg_res: *Point3D) void {
        const cFn = @extern(*const fn (*Point3D, *Point3D, *Point3D) callconv(.c) void, .{ .name = "graphene_point3d_cross" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn distance(self: *Point3D, arg_b: *Point3D, arg_delta: ?*Vec3) f32 {
        const cFn = @extern(*const fn (*Point3D, *Point3D, ?*Vec3) callconv(.c) f32, .{ .name = "graphene_point3d_distance" });
        const ret = cFn(self, arg_b, arg_delta);
        return ret;
    }
    pub fn dot(self: *Point3D, arg_b: *Point3D) f32 {
        const cFn = @extern(*const fn (*Point3D, *Point3D) callconv(.c) f32, .{ .name = "graphene_point3d_dot" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn equal(self: *Point3D, arg_b: *Point3D) bool {
        const cFn = @extern(*const fn (*Point3D, *Point3D) callconv(.c) bool, .{ .name = "graphene_point3d_equal" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn free(self: *Point3D) void {
        const cFn = @extern(*const fn (*Point3D) callconv(.c) void, .{ .name = "graphene_point3d_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *Point3D, arg_x: f32, arg_y: f32, arg_z: f32) *Point3D {
        const cFn = @extern(*const fn (*Point3D, f32, f32, f32) callconv(.c) *Point3D, .{ .name = "graphene_point3d_init" });
        const ret = cFn(self, arg_x, arg_y, arg_z);
        return ret;
    }
    pub fn initFromPoint(self: *Point3D, arg_src: *Point3D) *Point3D {
        const cFn = @extern(*const fn (*Point3D, *Point3D) callconv(.c) *Point3D, .{ .name = "graphene_point3d_init_from_point" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn initFromVec3(self: *Point3D, arg_v: *Vec3) *Point3D {
        const cFn = @extern(*const fn (*Point3D, *Vec3) callconv(.c) *Point3D, .{ .name = "graphene_point3d_init_from_vec3" });
        const ret = cFn(self, arg_v);
        return ret;
    }
    pub fn interpolate(self: *Point3D, arg_b: *Point3D, arg_factor: f64, arg_res: *Point3D) void {
        const cFn = @extern(*const fn (*Point3D, *Point3D, f64, *Point3D) callconv(.c) void, .{ .name = "graphene_point3d_interpolate" });
        const ret = cFn(self, arg_b, arg_factor, arg_res);
        return ret;
    }
    pub fn length(self: *Point3D) f32 {
        const cFn = @extern(*const fn (*Point3D) callconv(.c) f32, .{ .name = "graphene_point3d_length" });
        const ret = cFn(self);
        return ret;
    }
    pub fn near(self: *Point3D, arg_b: *Point3D, arg_epsilon: f32) bool {
        const cFn = @extern(*const fn (*Point3D, *Point3D, f32) callconv(.c) bool, .{ .name = "graphene_point3d_near" });
        const ret = cFn(self, arg_b, arg_epsilon);
        return ret;
    }
    pub fn normalize(self: *Point3D, arg_res: *Point3D) void {
        const cFn = @extern(*const fn (*Point3D, *Point3D) callconv(.c) void, .{ .name = "graphene_point3d_normalize" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn normalizeViewport(self: *Point3D, arg_viewport: *Rect, arg_z_near: f32, arg_z_far: f32, arg_res: *Point3D) void {
        const cFn = @extern(*const fn (*Point3D, *Rect, f32, f32, *Point3D) callconv(.c) void, .{ .name = "graphene_point3d_normalize_viewport" });
        const ret = cFn(self, arg_viewport, arg_z_near, arg_z_far, arg_res);
        return ret;
    }
    pub fn scale(self: *Point3D, arg_factor: f32, arg_res: *Point3D) void {
        const cFn = @extern(*const fn (*Point3D, f32, *Point3D) callconv(.c) void, .{ .name = "graphene_point3d_scale" });
        const ret = cFn(self, arg_factor, arg_res);
        return ret;
    }
    pub fn toVec3(self: *Point3D, arg_v: *Vec3) void {
        const cFn = @extern(*const fn (*Point3D, *Vec3) callconv(.c) void, .{ .name = "graphene_point3d_to_vec3" });
        const ret = cFn(self, arg_v);
        return ret;
    }
    pub fn zero() *Point3D {
        const cFn = @extern(*const fn () callconv(.c) *Point3D, .{ .name = "graphene_point3d_zero" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_point3d_get_type" });
        return cFn();
    }
};
pub const Quad = extern struct {
    points: [4]Point,
    pub fn alloc() *Quad {
        const cFn = @extern(*const fn () callconv(.c) *Quad, .{ .name = "graphene_quad_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn bounds(self: *Quad, arg_r: *Rect) void {
        const cFn = @extern(*const fn (*Quad, *Rect) callconv(.c) void, .{ .name = "graphene_quad_bounds" });
        const ret = cFn(self, arg_r);
        return ret;
    }
    pub fn contains(self: *Quad, arg_p: *Point) bool {
        const cFn = @extern(*const fn (*Quad, *Point) callconv(.c) bool, .{ .name = "graphene_quad_contains" });
        const ret = cFn(self, arg_p);
        return ret;
    }
    pub fn free(self: *Quad) void {
        const cFn = @extern(*const fn (*Quad) callconv(.c) void, .{ .name = "graphene_quad_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getPoint(self: *Quad, arg_index_: u32) *Point {
        const cFn = @extern(*const fn (*Quad, u32) callconv(.c) *Point, .{ .name = "graphene_quad_get_point" });
        const ret = cFn(self, arg_index_);
        return ret;
    }
    pub fn init(self: *Quad, arg_p1: *Point, arg_p2: *Point, arg_p3: *Point, arg_p4: *Point) *Quad {
        const cFn = @extern(*const fn (*Quad, *Point, *Point, *Point, *Point) callconv(.c) *Quad, .{ .name = "graphene_quad_init" });
        const ret = cFn(self, arg_p1, arg_p2, arg_p3, arg_p4);
        return ret;
    }
    pub fn initFromPoints(self: *Quad, arg_points: *[4]Point) *Quad {
        const cFn = @extern(*const fn (*Quad, *[4]Point) callconv(.c) *Quad, .{ .name = "graphene_quad_init_from_points" });
        const ret = cFn(self, arg_points);
        return ret;
    }
    pub fn initFromRect(self: *Quad, arg_r: *Rect) *Quad {
        const cFn = @extern(*const fn (*Quad, *Rect) callconv(.c) *Quad, .{ .name = "graphene_quad_init_from_rect" });
        const ret = cFn(self, arg_r);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_quad_get_type" });
        return cFn();
    }
};
pub const Quaternion = extern struct {
    x: f32,
    y: f32,
    z: f32,
    w: f32,
    pub fn alloc() *Quaternion {
        const cFn = @extern(*const fn () callconv(.c) *Quaternion, .{ .name = "graphene_quaternion_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn add(self: *Quaternion, arg_b: *Quaternion, arg_res: *Quaternion) void {
        const cFn = @extern(*const fn (*Quaternion, *Quaternion, *Quaternion) callconv(.c) void, .{ .name = "graphene_quaternion_add" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn dot(self: *Quaternion, arg_b: *Quaternion) f32 {
        const cFn = @extern(*const fn (*Quaternion, *Quaternion) callconv(.c) f32, .{ .name = "graphene_quaternion_dot" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn equal(self: *Quaternion, arg_b: *Quaternion) bool {
        const cFn = @extern(*const fn (*Quaternion, *Quaternion) callconv(.c) bool, .{ .name = "graphene_quaternion_equal" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn free(self: *Quaternion) void {
        const cFn = @extern(*const fn (*Quaternion) callconv(.c) void, .{ .name = "graphene_quaternion_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *Quaternion, arg_x: f32, arg_y: f32, arg_z: f32, arg_w: f32) *Quaternion {
        const cFn = @extern(*const fn (*Quaternion, f32, f32, f32, f32) callconv(.c) *Quaternion, .{ .name = "graphene_quaternion_init" });
        const ret = cFn(self, arg_x, arg_y, arg_z, arg_w);
        return ret;
    }
    pub fn initFromAngleVec3(self: *Quaternion, arg_angle: f32, arg_axis: *Vec3) *Quaternion {
        const cFn = @extern(*const fn (*Quaternion, f32, *Vec3) callconv(.c) *Quaternion, .{ .name = "graphene_quaternion_init_from_angle_vec3" });
        const ret = cFn(self, arg_angle, arg_axis);
        return ret;
    }
    pub fn initFromAngles(self: *Quaternion, arg_deg_x: f32, arg_deg_y: f32, arg_deg_z: f32) *Quaternion {
        const cFn = @extern(*const fn (*Quaternion, f32, f32, f32) callconv(.c) *Quaternion, .{ .name = "graphene_quaternion_init_from_angles" });
        const ret = cFn(self, arg_deg_x, arg_deg_y, arg_deg_z);
        return ret;
    }
    pub fn initFromEuler(self: *Quaternion, arg_e: *Euler) *Quaternion {
        const cFn = @extern(*const fn (*Quaternion, *Euler) callconv(.c) *Quaternion, .{ .name = "graphene_quaternion_init_from_euler" });
        const ret = cFn(self, arg_e);
        return ret;
    }
    pub fn initFromMatrix(self: *Quaternion, arg_m: *Matrix) *Quaternion {
        const cFn = @extern(*const fn (*Quaternion, *Matrix) callconv(.c) *Quaternion, .{ .name = "graphene_quaternion_init_from_matrix" });
        const ret = cFn(self, arg_m);
        return ret;
    }
    pub fn initFromQuaternion(self: *Quaternion, arg_src: *Quaternion) *Quaternion {
        const cFn = @extern(*const fn (*Quaternion, *Quaternion) callconv(.c) *Quaternion, .{ .name = "graphene_quaternion_init_from_quaternion" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn initFromRadians(self: *Quaternion, arg_rad_x: f32, arg_rad_y: f32, arg_rad_z: f32) *Quaternion {
        const cFn = @extern(*const fn (*Quaternion, f32, f32, f32) callconv(.c) *Quaternion, .{ .name = "graphene_quaternion_init_from_radians" });
        const ret = cFn(self, arg_rad_x, arg_rad_y, arg_rad_z);
        return ret;
    }
    pub fn initFromVec4(self: *Quaternion, arg_src: *Vec4) *Quaternion {
        const cFn = @extern(*const fn (*Quaternion, *Vec4) callconv(.c) *Quaternion, .{ .name = "graphene_quaternion_init_from_vec4" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn initIdentity(self: *Quaternion) *Quaternion {
        const cFn = @extern(*const fn (*Quaternion) callconv(.c) *Quaternion, .{ .name = "graphene_quaternion_init_identity" });
        const ret = cFn(self);
        return ret;
    }
    pub fn invert(self: *Quaternion, arg_res: *Quaternion) void {
        const cFn = @extern(*const fn (*Quaternion, *Quaternion) callconv(.c) void, .{ .name = "graphene_quaternion_invert" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn multiply(self: *Quaternion, arg_b: *Quaternion, arg_res: *Quaternion) void {
        const cFn = @extern(*const fn (*Quaternion, *Quaternion, *Quaternion) callconv(.c) void, .{ .name = "graphene_quaternion_multiply" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn normalize(self: *Quaternion, arg_res: *Quaternion) void {
        const cFn = @extern(*const fn (*Quaternion, *Quaternion) callconv(.c) void, .{ .name = "graphene_quaternion_normalize" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn scale(self: *Quaternion, arg_factor: f32, arg_res: *Quaternion) void {
        const cFn = @extern(*const fn (*Quaternion, f32, *Quaternion) callconv(.c) void, .{ .name = "graphene_quaternion_scale" });
        const ret = cFn(self, arg_factor, arg_res);
        return ret;
    }
    pub fn slerp(self: *Quaternion, arg_b: *Quaternion, arg_factor: f32, arg_res: *Quaternion) void {
        const cFn = @extern(*const fn (*Quaternion, *Quaternion, f32, *Quaternion) callconv(.c) void, .{ .name = "graphene_quaternion_slerp" });
        const ret = cFn(self, arg_b, arg_factor, arg_res);
        return ret;
    }
    pub fn toAngleVec3(self: *Quaternion, arg_axis: *Vec3) f32 {
        var argO_angle: f32 = undefined;
        const arg_angle: *f32 = &argO_angle;
        const cFn = @extern(*const fn (*Quaternion, *f32, *Vec3) callconv(.c) void, .{ .name = "graphene_quaternion_to_angle_vec3" });
        const ret = cFn(self, arg_angle, arg_axis);
        _ = ret;
        return argO_angle;
    }
    pub fn toAngles(self: *Quaternion) struct {
        deg_x: f32,
        deg_y: f32,
        deg_z: f32,
    } {
        var argO_deg_x: f32 = undefined;
        const arg_deg_x: ?*f32 = &argO_deg_x;
        var argO_deg_y: f32 = undefined;
        const arg_deg_y: ?*f32 = &argO_deg_y;
        var argO_deg_z: f32 = undefined;
        const arg_deg_z: ?*f32 = &argO_deg_z;
        const cFn = @extern(*const fn (*Quaternion, ?*f32, ?*f32, ?*f32) callconv(.c) void, .{ .name = "graphene_quaternion_to_angles" });
        const ret = cFn(self, arg_deg_x, arg_deg_y, arg_deg_z);
        _ = ret;
        return .{ .deg_x = argO_deg_x, .deg_y = argO_deg_y, .deg_z = argO_deg_z };
    }
    pub fn toMatrix(self: *Quaternion, arg_m: *Matrix) void {
        const cFn = @extern(*const fn (*Quaternion, *Matrix) callconv(.c) void, .{ .name = "graphene_quaternion_to_matrix" });
        const ret = cFn(self, arg_m);
        return ret;
    }
    pub fn toRadians(self: *Quaternion) struct {
        rad_x: f32,
        rad_y: f32,
        rad_z: f32,
    } {
        var argO_rad_x: f32 = undefined;
        const arg_rad_x: ?*f32 = &argO_rad_x;
        var argO_rad_y: f32 = undefined;
        const arg_rad_y: ?*f32 = &argO_rad_y;
        var argO_rad_z: f32 = undefined;
        const arg_rad_z: ?*f32 = &argO_rad_z;
        const cFn = @extern(*const fn (*Quaternion, ?*f32, ?*f32, ?*f32) callconv(.c) void, .{ .name = "graphene_quaternion_to_radians" });
        const ret = cFn(self, arg_rad_x, arg_rad_y, arg_rad_z);
        _ = ret;
        return .{ .rad_x = argO_rad_x, .rad_y = argO_rad_y, .rad_z = argO_rad_z };
    }
    pub fn toVec4(self: *Quaternion, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Quaternion, *Vec4) callconv(.c) void, .{ .name = "graphene_quaternion_to_vec4" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_quaternion_get_type" });
        return cFn();
    }
};
pub const Ray = extern struct {
    origin: Vec3,
    direction: Vec3,
    pub fn alloc() *Ray {
        const cFn = @extern(*const fn () callconv(.c) *Ray, .{ .name = "graphene_ray_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn equal(self: *Ray, arg_b: *Ray) bool {
        const cFn = @extern(*const fn (*Ray, *Ray) callconv(.c) bool, .{ .name = "graphene_ray_equal" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn free(self: *Ray) void {
        const cFn = @extern(*const fn (*Ray) callconv(.c) void, .{ .name = "graphene_ray_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getClosestPointToPoint(self: *Ray, arg_p: *Point3D, arg_res: *Point3D) void {
        const cFn = @extern(*const fn (*Ray, *Point3D, *Point3D) callconv(.c) void, .{ .name = "graphene_ray_get_closest_point_to_point" });
        const ret = cFn(self, arg_p, arg_res);
        return ret;
    }
    pub fn getDirection(self: *Ray, arg_direction: *Vec3) void {
        const cFn = @extern(*const fn (*Ray, *Vec3) callconv(.c) void, .{ .name = "graphene_ray_get_direction" });
        const ret = cFn(self, arg_direction);
        return ret;
    }
    pub fn getDistanceToPlane(self: *Ray, arg_p: *Plane) f32 {
        const cFn = @extern(*const fn (*Ray, *Plane) callconv(.c) f32, .{ .name = "graphene_ray_get_distance_to_plane" });
        const ret = cFn(self, arg_p);
        return ret;
    }
    pub fn getDistanceToPoint(self: *Ray, arg_p: *Point3D) f32 {
        const cFn = @extern(*const fn (*Ray, *Point3D) callconv(.c) f32, .{ .name = "graphene_ray_get_distance_to_point" });
        const ret = cFn(self, arg_p);
        return ret;
    }
    pub fn getOrigin(self: *Ray, arg_origin: *Point3D) void {
        const cFn = @extern(*const fn (*Ray, *Point3D) callconv(.c) void, .{ .name = "graphene_ray_get_origin" });
        const ret = cFn(self, arg_origin);
        return ret;
    }
    pub fn getPositionAt(self: *Ray, arg_t: f32, arg_position: *Point3D) void {
        const cFn = @extern(*const fn (*Ray, f32, *Point3D) callconv(.c) void, .{ .name = "graphene_ray_get_position_at" });
        const ret = cFn(self, arg_t, arg_position);
        return ret;
    }
    pub fn init(self: *Ray, arg_origin: ?*Point3D, arg_direction: ?*Vec3) *Ray {
        const cFn = @extern(*const fn (*Ray, ?*Point3D, ?*Vec3) callconv(.c) *Ray, .{ .name = "graphene_ray_init" });
        const ret = cFn(self, arg_origin, arg_direction);
        return ret;
    }
    pub fn initFromRay(self: *Ray, arg_src: *Ray) *Ray {
        const cFn = @extern(*const fn (*Ray, *Ray) callconv(.c) *Ray, .{ .name = "graphene_ray_init_from_ray" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn initFromVec3(self: *Ray, arg_origin: ?*Vec3, arg_direction: ?*Vec3) *Ray {
        const cFn = @extern(*const fn (*Ray, ?*Vec3, ?*Vec3) callconv(.c) *Ray, .{ .name = "graphene_ray_init_from_vec3" });
        const ret = cFn(self, arg_origin, arg_direction);
        return ret;
    }
    pub fn intersectBox(self: *Ray, arg_b: *Box) struct {
        ret: RayIntersectionKind,
        t_out: f32,
    } {
        var argO_t_out: f32 = undefined;
        const arg_t_out: *f32 = &argO_t_out;
        const cFn = @extern(*const fn (*Ray, *Box, *f32) callconv(.c) RayIntersectionKind, .{ .name = "graphene_ray_intersect_box" });
        const ret = cFn(self, arg_b, arg_t_out);
        return .{ .ret = ret, .t_out = argO_t_out };
    }
    pub fn intersectSphere(self: *Ray, arg_s: *Sphere) struct {
        ret: RayIntersectionKind,
        t_out: f32,
    } {
        var argO_t_out: f32 = undefined;
        const arg_t_out: *f32 = &argO_t_out;
        const cFn = @extern(*const fn (*Ray, *Sphere, *f32) callconv(.c) RayIntersectionKind, .{ .name = "graphene_ray_intersect_sphere" });
        const ret = cFn(self, arg_s, arg_t_out);
        return .{ .ret = ret, .t_out = argO_t_out };
    }
    pub fn intersectTriangle(self: *Ray, arg_t: *Triangle) struct {
        ret: RayIntersectionKind,
        t_out: f32,
    } {
        var argO_t_out: f32 = undefined;
        const arg_t_out: *f32 = &argO_t_out;
        const cFn = @extern(*const fn (*Ray, *Triangle, *f32) callconv(.c) RayIntersectionKind, .{ .name = "graphene_ray_intersect_triangle" });
        const ret = cFn(self, arg_t, arg_t_out);
        return .{ .ret = ret, .t_out = argO_t_out };
    }
    pub fn intersectsBox(self: *Ray, arg_b: *Box) bool {
        const cFn = @extern(*const fn (*Ray, *Box) callconv(.c) bool, .{ .name = "graphene_ray_intersects_box" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn intersectsSphere(self: *Ray, arg_s: *Sphere) bool {
        const cFn = @extern(*const fn (*Ray, *Sphere) callconv(.c) bool, .{ .name = "graphene_ray_intersects_sphere" });
        const ret = cFn(self, arg_s);
        return ret;
    }
    pub fn intersectsTriangle(self: *Ray, arg_t: *Triangle) bool {
        const cFn = @extern(*const fn (*Ray, *Triangle) callconv(.c) bool, .{ .name = "graphene_ray_intersects_triangle" });
        const ret = cFn(self, arg_t);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_ray_get_type" });
        return cFn();
    }
};
pub const RayIntersectionKind = enum(u32) {
    none = 0,
    enter = 1,
    leave = 2,
};
pub const Rect = extern struct {
    origin: Point,
    size: Size,
    pub fn containsPoint(self: *Rect, arg_p: *Point) bool {
        const cFn = @extern(*const fn (*Rect, *Point) callconv(.c) bool, .{ .name = "graphene_rect_contains_point" });
        const ret = cFn(self, arg_p);
        return ret;
    }
    pub fn containsRect(self: *Rect, arg_b: *Rect) bool {
        const cFn = @extern(*const fn (*Rect, *Rect) callconv(.c) bool, .{ .name = "graphene_rect_contains_rect" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn equal(self: *Rect, arg_b: *Rect) bool {
        const cFn = @extern(*const fn (*Rect, *Rect) callconv(.c) bool, .{ .name = "graphene_rect_equal" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn expand(self: *Rect, arg_p: *Point, arg_res: *Rect) void {
        const cFn = @extern(*const fn (*Rect, *Point, *Rect) callconv(.c) void, .{ .name = "graphene_rect_expand" });
        const ret = cFn(self, arg_p, arg_res);
        return ret;
    }
    pub fn free(self: *Rect) void {
        const cFn = @extern(*const fn (*Rect) callconv(.c) void, .{ .name = "graphene_rect_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getArea(self: *Rect) f32 {
        const cFn = @extern(*const fn (*Rect) callconv(.c) f32, .{ .name = "graphene_rect_get_area" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBottomLeft(self: *Rect, arg_p: *Point) void {
        const cFn = @extern(*const fn (*Rect, *Point) callconv(.c) void, .{ .name = "graphene_rect_get_bottom_left" });
        const ret = cFn(self, arg_p);
        return ret;
    }
    pub fn getBottomRight(self: *Rect, arg_p: *Point) void {
        const cFn = @extern(*const fn (*Rect, *Point) callconv(.c) void, .{ .name = "graphene_rect_get_bottom_right" });
        const ret = cFn(self, arg_p);
        return ret;
    }
    pub fn getCenter(self: *Rect, arg_p: *Point) void {
        const cFn = @extern(*const fn (*Rect, *Point) callconv(.c) void, .{ .name = "graphene_rect_get_center" });
        const ret = cFn(self, arg_p);
        return ret;
    }
    pub fn getHeight(self: *Rect) f32 {
        const cFn = @extern(*const fn (*Rect) callconv(.c) f32, .{ .name = "graphene_rect_get_height" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getTopLeft(self: *Rect, arg_p: *Point) void {
        const cFn = @extern(*const fn (*Rect, *Point) callconv(.c) void, .{ .name = "graphene_rect_get_top_left" });
        const ret = cFn(self, arg_p);
        return ret;
    }
    pub fn getTopRight(self: *Rect, arg_p: *Point) void {
        const cFn = @extern(*const fn (*Rect, *Point) callconv(.c) void, .{ .name = "graphene_rect_get_top_right" });
        const ret = cFn(self, arg_p);
        return ret;
    }
    pub fn getVertices(self: *Rect, arg_vertices: *[4]Vec2) void {
        const cFn = @extern(*const fn (*Rect, *[4]Vec2) callconv(.c) void, .{ .name = "graphene_rect_get_vertices" });
        const ret = cFn(self, arg_vertices);
        return ret;
    }
    pub fn getWidth(self: *Rect) f32 {
        const cFn = @extern(*const fn (*Rect) callconv(.c) f32, .{ .name = "graphene_rect_get_width" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getX(self: *Rect) f32 {
        const cFn = @extern(*const fn (*Rect) callconv(.c) f32, .{ .name = "graphene_rect_get_x" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getY(self: *Rect) f32 {
        const cFn = @extern(*const fn (*Rect) callconv(.c) f32, .{ .name = "graphene_rect_get_y" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *Rect, arg_x: f32, arg_y: f32, arg_width: f32, arg_height: f32) *Rect {
        const cFn = @extern(*const fn (*Rect, f32, f32, f32, f32) callconv(.c) *Rect, .{ .name = "graphene_rect_init" });
        const ret = cFn(self, arg_x, arg_y, arg_width, arg_height);
        return ret;
    }
    pub fn initFromRect(self: *Rect, arg_src: *Rect) *Rect {
        const cFn = @extern(*const fn (*Rect, *Rect) callconv(.c) *Rect, .{ .name = "graphene_rect_init_from_rect" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn inset(self: *Rect, arg_d_x: f32, arg_d_y: f32) *Rect {
        const cFn = @extern(*const fn (*Rect, f32, f32) callconv(.c) *Rect, .{ .name = "graphene_rect_inset" });
        const ret = cFn(self, arg_d_x, arg_d_y);
        return ret;
    }
    pub fn insetR(self: *Rect, arg_d_x: f32, arg_d_y: f32, arg_res: *Rect) void {
        const cFn = @extern(*const fn (*Rect, f32, f32, *Rect) callconv(.c) void, .{ .name = "graphene_rect_inset_r" });
        const ret = cFn(self, arg_d_x, arg_d_y, arg_res);
        return ret;
    }
    pub fn interpolate(self: *Rect, arg_b: *Rect, arg_factor: f64, arg_res: *Rect) void {
        const cFn = @extern(*const fn (*Rect, *Rect, f64, *Rect) callconv(.c) void, .{ .name = "graphene_rect_interpolate" });
        const ret = cFn(self, arg_b, arg_factor, arg_res);
        return ret;
    }
    pub fn intersection(self: *Rect, arg_b: *Rect, arg_res: ?*Rect) bool {
        const cFn = @extern(*const fn (*Rect, *Rect, ?*Rect) callconv(.c) bool, .{ .name = "graphene_rect_intersection" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn normalize(self: *Rect) *Rect {
        const cFn = @extern(*const fn (*Rect) callconv(.c) *Rect, .{ .name = "graphene_rect_normalize" });
        const ret = cFn(self);
        return ret;
    }
    pub fn normalizeR(self: *Rect, arg_res: *Rect) void {
        const cFn = @extern(*const fn (*Rect, *Rect) callconv(.c) void, .{ .name = "graphene_rect_normalize_r" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn offset(self: *Rect, arg_d_x: f32, arg_d_y: f32) *Rect {
        const cFn = @extern(*const fn (*Rect, f32, f32) callconv(.c) *Rect, .{ .name = "graphene_rect_offset" });
        const ret = cFn(self, arg_d_x, arg_d_y);
        return ret;
    }
    pub fn offsetR(self: *Rect, arg_d_x: f32, arg_d_y: f32, arg_res: *Rect) void {
        const cFn = @extern(*const fn (*Rect, f32, f32, *Rect) callconv(.c) void, .{ .name = "graphene_rect_offset_r" });
        const ret = cFn(self, arg_d_x, arg_d_y, arg_res);
        return ret;
    }
    pub fn round(self: *Rect, arg_res: *Rect) void {
        const cFn = @extern(*const fn (*Rect, *Rect) callconv(.c) void, .{ .name = "graphene_rect_round" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn roundExtents(self: *Rect, arg_res: *Rect) void {
        const cFn = @extern(*const fn (*Rect, *Rect) callconv(.c) void, .{ .name = "graphene_rect_round_extents" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn roundToPixel(self: *Rect) *Rect {
        const cFn = @extern(*const fn (*Rect) callconv(.c) *Rect, .{ .name = "graphene_rect_round_to_pixel" });
        const ret = cFn(self);
        return ret;
    }
    pub fn scale(self: *Rect, arg_s_h: f32, arg_s_v: f32, arg_res: *Rect) void {
        const cFn = @extern(*const fn (*Rect, f32, f32, *Rect) callconv(.c) void, .{ .name = "graphene_rect_scale" });
        const ret = cFn(self, arg_s_h, arg_s_v, arg_res);
        return ret;
    }
    pub fn @"union"(self: *Rect, arg_b: *Rect, arg_res: *Rect) void {
        const cFn = @extern(*const fn (*Rect, *Rect, *Rect) callconv(.c) void, .{ .name = "graphene_rect_union" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn alloc() *Rect {
        const cFn = @extern(*const fn () callconv(.c) *Rect, .{ .name = "graphene_rect_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn zero() *Rect {
        const cFn = @extern(*const fn () callconv(.c) *Rect, .{ .name = "graphene_rect_zero" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_rect_get_type" });
        return cFn();
    }
};
pub const Simd4F = extern struct {
    x: f32,
    y: f32,
    z: f32,
    w: f32,
};
pub const Simd4X4F = extern struct {
    x: Simd4F,
    y: Simd4F,
    z: Simd4F,
    w: Simd4F,
};
pub const Size = extern struct {
    width: f32,
    height: f32,
    pub fn alloc() *Size {
        const cFn = @extern(*const fn () callconv(.c) *Size, .{ .name = "graphene_size_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn equal(self: *Size, arg_b: *Size) bool {
        const cFn = @extern(*const fn (*Size, *Size) callconv(.c) bool, .{ .name = "graphene_size_equal" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn free(self: *Size) void {
        const cFn = @extern(*const fn (*Size) callconv(.c) void, .{ .name = "graphene_size_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *Size, arg_width: f32, arg_height: f32) *Size {
        const cFn = @extern(*const fn (*Size, f32, f32) callconv(.c) *Size, .{ .name = "graphene_size_init" });
        const ret = cFn(self, arg_width, arg_height);
        return ret;
    }
    pub fn initFromSize(self: *Size, arg_src: *Size) *Size {
        const cFn = @extern(*const fn (*Size, *Size) callconv(.c) *Size, .{ .name = "graphene_size_init_from_size" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn interpolate(self: *Size, arg_b: *Size, arg_factor: f64, arg_res: *Size) void {
        const cFn = @extern(*const fn (*Size, *Size, f64, *Size) callconv(.c) void, .{ .name = "graphene_size_interpolate" });
        const ret = cFn(self, arg_b, arg_factor, arg_res);
        return ret;
    }
    pub fn scale(self: *Size, arg_factor: f32, arg_res: *Size) void {
        const cFn = @extern(*const fn (*Size, f32, *Size) callconv(.c) void, .{ .name = "graphene_size_scale" });
        const ret = cFn(self, arg_factor, arg_res);
        return ret;
    }
    pub fn zero() *Size {
        const cFn = @extern(*const fn () callconv(.c) *Size, .{ .name = "graphene_size_zero" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_size_get_type" });
        return cFn();
    }
};
pub const Sphere = extern struct {
    center: Vec3,
    radius: f32,
    pub fn alloc() *Sphere {
        const cFn = @extern(*const fn () callconv(.c) *Sphere, .{ .name = "graphene_sphere_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn containsPoint(self: *Sphere, arg_point: *Point3D) bool {
        const cFn = @extern(*const fn (*Sphere, *Point3D) callconv(.c) bool, .{ .name = "graphene_sphere_contains_point" });
        const ret = cFn(self, arg_point);
        return ret;
    }
    pub fn distance(self: *Sphere, arg_point: *Point3D) f32 {
        const cFn = @extern(*const fn (*Sphere, *Point3D) callconv(.c) f32, .{ .name = "graphene_sphere_distance" });
        const ret = cFn(self, arg_point);
        return ret;
    }
    pub fn equal(self: *Sphere, arg_b: *Sphere) bool {
        const cFn = @extern(*const fn (*Sphere, *Sphere) callconv(.c) bool, .{ .name = "graphene_sphere_equal" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn free(self: *Sphere) void {
        const cFn = @extern(*const fn (*Sphere) callconv(.c) void, .{ .name = "graphene_sphere_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBoundingBox(self: *Sphere, arg_box: *Box) void {
        const cFn = @extern(*const fn (*Sphere, *Box) callconv(.c) void, .{ .name = "graphene_sphere_get_bounding_box" });
        const ret = cFn(self, arg_box);
        return ret;
    }
    pub fn getCenter(self: *Sphere, arg_center: *Point3D) void {
        const cFn = @extern(*const fn (*Sphere, *Point3D) callconv(.c) void, .{ .name = "graphene_sphere_get_center" });
        const ret = cFn(self, arg_center);
        return ret;
    }
    pub fn getRadius(self: *Sphere) f32 {
        const cFn = @extern(*const fn (*Sphere) callconv(.c) f32, .{ .name = "graphene_sphere_get_radius" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *Sphere, arg_center: ?*Point3D, arg_radius: f32) *Sphere {
        const cFn = @extern(*const fn (*Sphere, ?*Point3D, f32) callconv(.c) *Sphere, .{ .name = "graphene_sphere_init" });
        const ret = cFn(self, arg_center, arg_radius);
        return ret;
    }
    pub fn initFromPoints(self: *Sphere, argS_points: []Point3D, arg_center: ?*Point3D) *Sphere {
        const arg_n_points: u32 = @intCast((argS_points).len);
        const arg_points: [*]Point3D = @ptrCast(argS_points);
        const cFn = @extern(*const fn (*Sphere, u32, [*]Point3D, ?*Point3D) callconv(.c) *Sphere, .{ .name = "graphene_sphere_init_from_points" });
        const ret = cFn(self, arg_n_points, arg_points, arg_center);
        return ret;
    }
    pub fn initFromVectors(self: *Sphere, argS_vectors: []Vec3, arg_center: ?*Point3D) *Sphere {
        const arg_n_vectors: u32 = @intCast((argS_vectors).len);
        const arg_vectors: [*]Vec3 = @ptrCast(argS_vectors);
        const cFn = @extern(*const fn (*Sphere, u32, [*]Vec3, ?*Point3D) callconv(.c) *Sphere, .{ .name = "graphene_sphere_init_from_vectors" });
        const ret = cFn(self, arg_n_vectors, arg_vectors, arg_center);
        return ret;
    }
    pub fn isEmpty(self: *Sphere) bool {
        const cFn = @extern(*const fn (*Sphere) callconv(.c) bool, .{ .name = "graphene_sphere_is_empty" });
        const ret = cFn(self);
        return ret;
    }
    pub fn translate(self: *Sphere, arg_point: *Point3D, arg_res: *Sphere) void {
        const cFn = @extern(*const fn (*Sphere, *Point3D, *Sphere) callconv(.c) void, .{ .name = "graphene_sphere_translate" });
        const ret = cFn(self, arg_point, arg_res);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_sphere_get_type" });
        return cFn();
    }
};
pub const Triangle = extern struct {
    a: Vec3,
    b: Vec3,
    c: Vec3,
    pub fn alloc() *Triangle {
        const cFn = @extern(*const fn () callconv(.c) *Triangle, .{ .name = "graphene_triangle_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn containsPoint(self: *Triangle, arg_p: *Point3D) bool {
        const cFn = @extern(*const fn (*Triangle, *Point3D) callconv(.c) bool, .{ .name = "graphene_triangle_contains_point" });
        const ret = cFn(self, arg_p);
        return ret;
    }
    pub fn equal(self: *Triangle, arg_b: *Triangle) bool {
        const cFn = @extern(*const fn (*Triangle, *Triangle) callconv(.c) bool, .{ .name = "graphene_triangle_equal" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn free(self: *Triangle) void {
        const cFn = @extern(*const fn (*Triangle) callconv(.c) void, .{ .name = "graphene_triangle_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getArea(self: *Triangle) f32 {
        const cFn = @extern(*const fn (*Triangle) callconv(.c) f32, .{ .name = "graphene_triangle_get_area" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getBarycoords(self: *Triangle, arg_p: ?*Point3D, arg_res: *Vec2) bool {
        const cFn = @extern(*const fn (*Triangle, ?*Point3D, *Vec2) callconv(.c) bool, .{ .name = "graphene_triangle_get_barycoords" });
        const ret = cFn(self, arg_p, arg_res);
        return ret;
    }
    pub fn getBoundingBox(self: *Triangle, arg_res: *Box) void {
        const cFn = @extern(*const fn (*Triangle, *Box) callconv(.c) void, .{ .name = "graphene_triangle_get_bounding_box" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn getMidpoint(self: *Triangle, arg_res: *Point3D) void {
        const cFn = @extern(*const fn (*Triangle, *Point3D) callconv(.c) void, .{ .name = "graphene_triangle_get_midpoint" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn getNormal(self: *Triangle, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Triangle, *Vec3) callconv(.c) void, .{ .name = "graphene_triangle_get_normal" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn getPlane(self: *Triangle, arg_res: *Plane) void {
        const cFn = @extern(*const fn (*Triangle, *Plane) callconv(.c) void, .{ .name = "graphene_triangle_get_plane" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn getPoints(self: *Triangle, arg_a: ?*Point3D, arg_b: ?*Point3D, arg_c: ?*Point3D) void {
        const cFn = @extern(*const fn (*Triangle, ?*Point3D, ?*Point3D, ?*Point3D) callconv(.c) void, .{ .name = "graphene_triangle_get_points" });
        const ret = cFn(self, arg_a, arg_b, arg_c);
        return ret;
    }
    pub fn getUv(self: *Triangle, arg_p: ?*Point3D, arg_uv_a: *Vec2, arg_uv_b: *Vec2, arg_uv_c: *Vec2, arg_res: *Vec2) bool {
        const cFn = @extern(*const fn (*Triangle, ?*Point3D, *Vec2, *Vec2, *Vec2, *Vec2) callconv(.c) bool, .{ .name = "graphene_triangle_get_uv" });
        const ret = cFn(self, arg_p, arg_uv_a, arg_uv_b, arg_uv_c, arg_res);
        return ret;
    }
    pub fn getVertices(self: *Triangle, arg_a: ?*Vec3, arg_b: ?*Vec3, arg_c: ?*Vec3) void {
        const cFn = @extern(*const fn (*Triangle, ?*Vec3, ?*Vec3, ?*Vec3) callconv(.c) void, .{ .name = "graphene_triangle_get_vertices" });
        const ret = cFn(self, arg_a, arg_b, arg_c);
        return ret;
    }
    pub fn initFromFloat(self: *Triangle, arg_a: *[3]f32, arg_b: *[3]f32, arg_c: *[3]f32) *Triangle {
        const cFn = @extern(*const fn (*Triangle, *[3]f32, *[3]f32, *[3]f32) callconv(.c) *Triangle, .{ .name = "graphene_triangle_init_from_float" });
        const ret = cFn(self, arg_a, arg_b, arg_c);
        return ret;
    }
    pub fn initFromPoint3d(self: *Triangle, arg_a: ?*Point3D, arg_b: ?*Point3D, arg_c: ?*Point3D) *Triangle {
        const cFn = @extern(*const fn (*Triangle, ?*Point3D, ?*Point3D, ?*Point3D) callconv(.c) *Triangle, .{ .name = "graphene_triangle_init_from_point3d" });
        const ret = cFn(self, arg_a, arg_b, arg_c);
        return ret;
    }
    pub fn initFromVec3(self: *Triangle, arg_a: ?*Vec3, arg_b: ?*Vec3, arg_c: ?*Vec3) *Triangle {
        const cFn = @extern(*const fn (*Triangle, ?*Vec3, ?*Vec3, ?*Vec3) callconv(.c) *Triangle, .{ .name = "graphene_triangle_init_from_vec3" });
        const ret = cFn(self, arg_a, arg_b, arg_c);
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_triangle_get_type" });
        return cFn();
    }
};
pub const VEC2_LEN = 2;
pub const VEC3_LEN = 3;
pub const VEC4_LEN = 4;
pub const Vec2 = extern struct {
    value: Simd4F,
    pub fn alloc() *Vec2 {
        const cFn = @extern(*const fn () callconv(.c) *Vec2, .{ .name = "graphene_vec2_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn add(self: *Vec2, arg_b: *Vec2, arg_res: *Vec2) void {
        const cFn = @extern(*const fn (*Vec2, *Vec2, *Vec2) callconv(.c) void, .{ .name = "graphene_vec2_add" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn divide(self: *Vec2, arg_b: *Vec2, arg_res: *Vec2) void {
        const cFn = @extern(*const fn (*Vec2, *Vec2, *Vec2) callconv(.c) void, .{ .name = "graphene_vec2_divide" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn dot(self: *Vec2, arg_b: *Vec2) f32 {
        const cFn = @extern(*const fn (*Vec2, *Vec2) callconv(.c) f32, .{ .name = "graphene_vec2_dot" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn equal(self: *Vec2, arg_v2: *Vec2) bool {
        const cFn = @extern(*const fn (*Vec2, *Vec2) callconv(.c) bool, .{ .name = "graphene_vec2_equal" });
        const ret = cFn(self, arg_v2);
        return ret;
    }
    pub fn free(self: *Vec2) void {
        const cFn = @extern(*const fn (*Vec2) callconv(.c) void, .{ .name = "graphene_vec2_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getX(self: *Vec2) f32 {
        const cFn = @extern(*const fn (*Vec2) callconv(.c) f32, .{ .name = "graphene_vec2_get_x" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getY(self: *Vec2) f32 {
        const cFn = @extern(*const fn (*Vec2) callconv(.c) f32, .{ .name = "graphene_vec2_get_y" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *Vec2, arg_x: f32, arg_y: f32) *Vec2 {
        const cFn = @extern(*const fn (*Vec2, f32, f32) callconv(.c) *Vec2, .{ .name = "graphene_vec2_init" });
        const ret = cFn(self, arg_x, arg_y);
        return ret;
    }
    pub fn initFromFloat(self: *Vec2, arg_src: *[2]f32) *Vec2 {
        const cFn = @extern(*const fn (*Vec2, *[2]f32) callconv(.c) *Vec2, .{ .name = "graphene_vec2_init_from_float" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn initFromVec2(self: *Vec2, arg_src: *Vec2) *Vec2 {
        const cFn = @extern(*const fn (*Vec2, *Vec2) callconv(.c) *Vec2, .{ .name = "graphene_vec2_init_from_vec2" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn interpolate(self: *Vec2, arg_v2: *Vec2, arg_factor: f64, arg_res: *Vec2) void {
        const cFn = @extern(*const fn (*Vec2, *Vec2, f64, *Vec2) callconv(.c) void, .{ .name = "graphene_vec2_interpolate" });
        const ret = cFn(self, arg_v2, arg_factor, arg_res);
        return ret;
    }
    pub fn length(self: *Vec2) f32 {
        const cFn = @extern(*const fn (*Vec2) callconv(.c) f32, .{ .name = "graphene_vec2_length" });
        const ret = cFn(self);
        return ret;
    }
    pub fn max(self: *Vec2, arg_b: *Vec2, arg_res: *Vec2) void {
        const cFn = @extern(*const fn (*Vec2, *Vec2, *Vec2) callconv(.c) void, .{ .name = "graphene_vec2_max" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn min(self: *Vec2, arg_b: *Vec2, arg_res: *Vec2) void {
        const cFn = @extern(*const fn (*Vec2, *Vec2, *Vec2) callconv(.c) void, .{ .name = "graphene_vec2_min" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn multiply(self: *Vec2, arg_b: *Vec2, arg_res: *Vec2) void {
        const cFn = @extern(*const fn (*Vec2, *Vec2, *Vec2) callconv(.c) void, .{ .name = "graphene_vec2_multiply" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn near(self: *Vec2, arg_v2: *Vec2, arg_epsilon: f32) bool {
        const cFn = @extern(*const fn (*Vec2, *Vec2, f32) callconv(.c) bool, .{ .name = "graphene_vec2_near" });
        const ret = cFn(self, arg_v2, arg_epsilon);
        return ret;
    }
    pub fn negate(self: *Vec2, arg_res: *Vec2) void {
        const cFn = @extern(*const fn (*Vec2, *Vec2) callconv(.c) void, .{ .name = "graphene_vec2_negate" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn normalize(self: *Vec2, arg_res: *Vec2) void {
        const cFn = @extern(*const fn (*Vec2, *Vec2) callconv(.c) void, .{ .name = "graphene_vec2_normalize" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn scale(self: *Vec2, arg_factor: f32, arg_res: *Vec2) void {
        const cFn = @extern(*const fn (*Vec2, f32, *Vec2) callconv(.c) void, .{ .name = "graphene_vec2_scale" });
        const ret = cFn(self, arg_factor, arg_res);
        return ret;
    }
    pub fn subtract(self: *Vec2, arg_b: *Vec2, arg_res: *Vec2) void {
        const cFn = @extern(*const fn (*Vec2, *Vec2, *Vec2) callconv(.c) void, .{ .name = "graphene_vec2_subtract" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn toFloat(self: *Vec2, arg_dest: *[2]f32) void {
        const cFn = @extern(*const fn (*Vec2, *[2]f32) callconv(.c) void, .{ .name = "graphene_vec2_to_float" });
        const ret = cFn(self, arg_dest);
        return ret;
    }
    pub fn one() *Vec2 {
        const cFn = @extern(*const fn () callconv(.c) *Vec2, .{ .name = "graphene_vec2_one" });
        const ret = cFn();
        return ret;
    }
    pub fn xAxis() *Vec2 {
        const cFn = @extern(*const fn () callconv(.c) *Vec2, .{ .name = "graphene_vec2_x_axis" });
        const ret = cFn();
        return ret;
    }
    pub fn yAxis() *Vec2 {
        const cFn = @extern(*const fn () callconv(.c) *Vec2, .{ .name = "graphene_vec2_y_axis" });
        const ret = cFn();
        return ret;
    }
    pub fn zero() *Vec2 {
        const cFn = @extern(*const fn () callconv(.c) *Vec2, .{ .name = "graphene_vec2_zero" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_vec2_get_type" });
        return cFn();
    }
};
pub const Vec3 = extern struct {
    value: Simd4F,
    pub fn alloc() *Vec3 {
        const cFn = @extern(*const fn () callconv(.c) *Vec3, .{ .name = "graphene_vec3_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn add(self: *Vec3, arg_b: *Vec3, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Vec3, *Vec3, *Vec3) callconv(.c) void, .{ .name = "graphene_vec3_add" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn cross(self: *Vec3, arg_b: *Vec3, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Vec3, *Vec3, *Vec3) callconv(.c) void, .{ .name = "graphene_vec3_cross" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn divide(self: *Vec3, arg_b: *Vec3, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Vec3, *Vec3, *Vec3) callconv(.c) void, .{ .name = "graphene_vec3_divide" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn dot(self: *Vec3, arg_b: *Vec3) f32 {
        const cFn = @extern(*const fn (*Vec3, *Vec3) callconv(.c) f32, .{ .name = "graphene_vec3_dot" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn equal(self: *Vec3, arg_v2: *Vec3) bool {
        const cFn = @extern(*const fn (*Vec3, *Vec3) callconv(.c) bool, .{ .name = "graphene_vec3_equal" });
        const ret = cFn(self, arg_v2);
        return ret;
    }
    pub fn free(self: *Vec3) void {
        const cFn = @extern(*const fn (*Vec3) callconv(.c) void, .{ .name = "graphene_vec3_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getX(self: *Vec3) f32 {
        const cFn = @extern(*const fn (*Vec3) callconv(.c) f32, .{ .name = "graphene_vec3_get_x" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getXy(self: *Vec3, arg_res: *Vec2) void {
        const cFn = @extern(*const fn (*Vec3, *Vec2) callconv(.c) void, .{ .name = "graphene_vec3_get_xy" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn getXy0(self: *Vec3, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Vec3, *Vec3) callconv(.c) void, .{ .name = "graphene_vec3_get_xy0" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn getXyz0(self: *Vec3, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Vec3, *Vec4) callconv(.c) void, .{ .name = "graphene_vec3_get_xyz0" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn getXyz1(self: *Vec3, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Vec3, *Vec4) callconv(.c) void, .{ .name = "graphene_vec3_get_xyz1" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn getXyzw(self: *Vec3, arg_w: f32, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Vec3, f32, *Vec4) callconv(.c) void, .{ .name = "graphene_vec3_get_xyzw" });
        const ret = cFn(self, arg_w, arg_res);
        return ret;
    }
    pub fn getY(self: *Vec3) f32 {
        const cFn = @extern(*const fn (*Vec3) callconv(.c) f32, .{ .name = "graphene_vec3_get_y" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getZ(self: *Vec3) f32 {
        const cFn = @extern(*const fn (*Vec3) callconv(.c) f32, .{ .name = "graphene_vec3_get_z" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *Vec3, arg_x: f32, arg_y: f32, arg_z: f32) *Vec3 {
        const cFn = @extern(*const fn (*Vec3, f32, f32, f32) callconv(.c) *Vec3, .{ .name = "graphene_vec3_init" });
        const ret = cFn(self, arg_x, arg_y, arg_z);
        return ret;
    }
    pub fn initFromFloat(self: *Vec3, arg_src: *[3]f32) *Vec3 {
        const cFn = @extern(*const fn (*Vec3, *[3]f32) callconv(.c) *Vec3, .{ .name = "graphene_vec3_init_from_float" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn initFromVec3(self: *Vec3, arg_src: *Vec3) *Vec3 {
        const cFn = @extern(*const fn (*Vec3, *Vec3) callconv(.c) *Vec3, .{ .name = "graphene_vec3_init_from_vec3" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn interpolate(self: *Vec3, arg_v2: *Vec3, arg_factor: f64, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Vec3, *Vec3, f64, *Vec3) callconv(.c) void, .{ .name = "graphene_vec3_interpolate" });
        const ret = cFn(self, arg_v2, arg_factor, arg_res);
        return ret;
    }
    pub fn length(self: *Vec3) f32 {
        const cFn = @extern(*const fn (*Vec3) callconv(.c) f32, .{ .name = "graphene_vec3_length" });
        const ret = cFn(self);
        return ret;
    }
    pub fn max(self: *Vec3, arg_b: *Vec3, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Vec3, *Vec3, *Vec3) callconv(.c) void, .{ .name = "graphene_vec3_max" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn min(self: *Vec3, arg_b: *Vec3, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Vec3, *Vec3, *Vec3) callconv(.c) void, .{ .name = "graphene_vec3_min" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn multiply(self: *Vec3, arg_b: *Vec3, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Vec3, *Vec3, *Vec3) callconv(.c) void, .{ .name = "graphene_vec3_multiply" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn near(self: *Vec3, arg_v2: *Vec3, arg_epsilon: f32) bool {
        const cFn = @extern(*const fn (*Vec3, *Vec3, f32) callconv(.c) bool, .{ .name = "graphene_vec3_near" });
        const ret = cFn(self, arg_v2, arg_epsilon);
        return ret;
    }
    pub fn negate(self: *Vec3, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Vec3, *Vec3) callconv(.c) void, .{ .name = "graphene_vec3_negate" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn normalize(self: *Vec3, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Vec3, *Vec3) callconv(.c) void, .{ .name = "graphene_vec3_normalize" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn scale(self: *Vec3, arg_factor: f32, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Vec3, f32, *Vec3) callconv(.c) void, .{ .name = "graphene_vec3_scale" });
        const ret = cFn(self, arg_factor, arg_res);
        return ret;
    }
    pub fn subtract(self: *Vec3, arg_b: *Vec3, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Vec3, *Vec3, *Vec3) callconv(.c) void, .{ .name = "graphene_vec3_subtract" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn toFloat(self: *Vec3, arg_dest: *[3]f32) void {
        const cFn = @extern(*const fn (*Vec3, *[3]f32) callconv(.c) void, .{ .name = "graphene_vec3_to_float" });
        const ret = cFn(self, arg_dest);
        return ret;
    }
    pub fn one() *Vec3 {
        const cFn = @extern(*const fn () callconv(.c) *Vec3, .{ .name = "graphene_vec3_one" });
        const ret = cFn();
        return ret;
    }
    pub fn xAxis() *Vec3 {
        const cFn = @extern(*const fn () callconv(.c) *Vec3, .{ .name = "graphene_vec3_x_axis" });
        const ret = cFn();
        return ret;
    }
    pub fn yAxis() *Vec3 {
        const cFn = @extern(*const fn () callconv(.c) *Vec3, .{ .name = "graphene_vec3_y_axis" });
        const ret = cFn();
        return ret;
    }
    pub fn zAxis() *Vec3 {
        const cFn = @extern(*const fn () callconv(.c) *Vec3, .{ .name = "graphene_vec3_z_axis" });
        const ret = cFn();
        return ret;
    }
    pub fn zero() *Vec3 {
        const cFn = @extern(*const fn () callconv(.c) *Vec3, .{ .name = "graphene_vec3_zero" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_vec3_get_type" });
        return cFn();
    }
};
pub const Vec4 = extern struct {
    value: Simd4F,
    pub fn alloc() *Vec4 {
        const cFn = @extern(*const fn () callconv(.c) *Vec4, .{ .name = "graphene_vec4_alloc" });
        const ret = cFn();
        return ret;
    }
    pub fn add(self: *Vec4, arg_b: *Vec4, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Vec4, *Vec4, *Vec4) callconv(.c) void, .{ .name = "graphene_vec4_add" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn divide(self: *Vec4, arg_b: *Vec4, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Vec4, *Vec4, *Vec4) callconv(.c) void, .{ .name = "graphene_vec4_divide" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn dot(self: *Vec4, arg_b: *Vec4) f32 {
        const cFn = @extern(*const fn (*Vec4, *Vec4) callconv(.c) f32, .{ .name = "graphene_vec4_dot" });
        const ret = cFn(self, arg_b);
        return ret;
    }
    pub fn equal(self: *Vec4, arg_v2: *Vec4) bool {
        const cFn = @extern(*const fn (*Vec4, *Vec4) callconv(.c) bool, .{ .name = "graphene_vec4_equal" });
        const ret = cFn(self, arg_v2);
        return ret;
    }
    pub fn free(self: *Vec4) void {
        const cFn = @extern(*const fn (*Vec4) callconv(.c) void, .{ .name = "graphene_vec4_free" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getW(self: *Vec4) f32 {
        const cFn = @extern(*const fn (*Vec4) callconv(.c) f32, .{ .name = "graphene_vec4_get_w" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getX(self: *Vec4) f32 {
        const cFn = @extern(*const fn (*Vec4) callconv(.c) f32, .{ .name = "graphene_vec4_get_x" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getXy(self: *Vec4, arg_res: *Vec2) void {
        const cFn = @extern(*const fn (*Vec4, *Vec2) callconv(.c) void, .{ .name = "graphene_vec4_get_xy" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn getXyz(self: *Vec4, arg_res: *Vec3) void {
        const cFn = @extern(*const fn (*Vec4, *Vec3) callconv(.c) void, .{ .name = "graphene_vec4_get_xyz" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn getY(self: *Vec4) f32 {
        const cFn = @extern(*const fn (*Vec4) callconv(.c) f32, .{ .name = "graphene_vec4_get_y" });
        const ret = cFn(self);
        return ret;
    }
    pub fn getZ(self: *Vec4) f32 {
        const cFn = @extern(*const fn (*Vec4) callconv(.c) f32, .{ .name = "graphene_vec4_get_z" });
        const ret = cFn(self);
        return ret;
    }
    pub fn init(self: *Vec4, arg_x: f32, arg_y: f32, arg_z: f32, arg_w: f32) *Vec4 {
        const cFn = @extern(*const fn (*Vec4, f32, f32, f32, f32) callconv(.c) *Vec4, .{ .name = "graphene_vec4_init" });
        const ret = cFn(self, arg_x, arg_y, arg_z, arg_w);
        return ret;
    }
    pub fn initFromFloat(self: *Vec4, arg_src: *[4]f32) *Vec4 {
        const cFn = @extern(*const fn (*Vec4, *[4]f32) callconv(.c) *Vec4, .{ .name = "graphene_vec4_init_from_float" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn initFromVec2(self: *Vec4, arg_src: *Vec2, arg_z: f32, arg_w: f32) *Vec4 {
        const cFn = @extern(*const fn (*Vec4, *Vec2, f32, f32) callconv(.c) *Vec4, .{ .name = "graphene_vec4_init_from_vec2" });
        const ret = cFn(self, arg_src, arg_z, arg_w);
        return ret;
    }
    pub fn initFromVec3(self: *Vec4, arg_src: *Vec3, arg_w: f32) *Vec4 {
        const cFn = @extern(*const fn (*Vec4, *Vec3, f32) callconv(.c) *Vec4, .{ .name = "graphene_vec4_init_from_vec3" });
        const ret = cFn(self, arg_src, arg_w);
        return ret;
    }
    pub fn initFromVec4(self: *Vec4, arg_src: *Vec4) *Vec4 {
        const cFn = @extern(*const fn (*Vec4, *Vec4) callconv(.c) *Vec4, .{ .name = "graphene_vec4_init_from_vec4" });
        const ret = cFn(self, arg_src);
        return ret;
    }
    pub fn interpolate(self: *Vec4, arg_v2: *Vec4, arg_factor: f64, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Vec4, *Vec4, f64, *Vec4) callconv(.c) void, .{ .name = "graphene_vec4_interpolate" });
        const ret = cFn(self, arg_v2, arg_factor, arg_res);
        return ret;
    }
    pub fn length(self: *Vec4) f32 {
        const cFn = @extern(*const fn (*Vec4) callconv(.c) f32, .{ .name = "graphene_vec4_length" });
        const ret = cFn(self);
        return ret;
    }
    pub fn max(self: *Vec4, arg_b: *Vec4, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Vec4, *Vec4, *Vec4) callconv(.c) void, .{ .name = "graphene_vec4_max" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn min(self: *Vec4, arg_b: *Vec4, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Vec4, *Vec4, *Vec4) callconv(.c) void, .{ .name = "graphene_vec4_min" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn multiply(self: *Vec4, arg_b: *Vec4, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Vec4, *Vec4, *Vec4) callconv(.c) void, .{ .name = "graphene_vec4_multiply" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn near(self: *Vec4, arg_v2: *Vec4, arg_epsilon: f32) bool {
        const cFn = @extern(*const fn (*Vec4, *Vec4, f32) callconv(.c) bool, .{ .name = "graphene_vec4_near" });
        const ret = cFn(self, arg_v2, arg_epsilon);
        return ret;
    }
    pub fn negate(self: *Vec4, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Vec4, *Vec4) callconv(.c) void, .{ .name = "graphene_vec4_negate" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn normalize(self: *Vec4, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Vec4, *Vec4) callconv(.c) void, .{ .name = "graphene_vec4_normalize" });
        const ret = cFn(self, arg_res);
        return ret;
    }
    pub fn scale(self: *Vec4, arg_factor: f32, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Vec4, f32, *Vec4) callconv(.c) void, .{ .name = "graphene_vec4_scale" });
        const ret = cFn(self, arg_factor, arg_res);
        return ret;
    }
    pub fn subtract(self: *Vec4, arg_b: *Vec4, arg_res: *Vec4) void {
        const cFn = @extern(*const fn (*Vec4, *Vec4, *Vec4) callconv(.c) void, .{ .name = "graphene_vec4_subtract" });
        const ret = cFn(self, arg_b, arg_res);
        return ret;
    }
    pub fn toFloat(self: *Vec4, arg_dest: *[4]f32) void {
        const cFn = @extern(*const fn (*Vec4, *[4]f32) callconv(.c) void, .{ .name = "graphene_vec4_to_float" });
        const ret = cFn(self, arg_dest);
        return ret;
    }
    pub fn one() *Vec4 {
        const cFn = @extern(*const fn () callconv(.c) *Vec4, .{ .name = "graphene_vec4_one" });
        const ret = cFn();
        return ret;
    }
    pub fn wAxis() *Vec4 {
        const cFn = @extern(*const fn () callconv(.c) *Vec4, .{ .name = "graphene_vec4_w_axis" });
        const ret = cFn();
        return ret;
    }
    pub fn xAxis() *Vec4 {
        const cFn = @extern(*const fn () callconv(.c) *Vec4, .{ .name = "graphene_vec4_x_axis" });
        const ret = cFn();
        return ret;
    }
    pub fn yAxis() *Vec4 {
        const cFn = @extern(*const fn () callconv(.c) *Vec4, .{ .name = "graphene_vec4_y_axis" });
        const ret = cFn();
        return ret;
    }
    pub fn zAxis() *Vec4 {
        const cFn = @extern(*const fn () callconv(.c) *Vec4, .{ .name = "graphene_vec4_z_axis" });
        const ret = cFn();
        return ret;
    }
    pub fn zero() *Vec4 {
        const cFn = @extern(*const fn () callconv(.c) *Vec4, .{ .name = "graphene_vec4_zero" });
        const ret = cFn();
        return ret;
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "graphene_vec4_get_type" });
        return cFn();
    }
};
pub fn boxEmpty() *Box {
    const cFn = @extern(*const fn () callconv(.c) *Box, .{ .name = "graphene_box_empty" });
    const ret = cFn();
    return ret;
}
pub fn boxInfinite() *Box {
    const cFn = @extern(*const fn () callconv(.c) *Box, .{ .name = "graphene_box_infinite" });
    const ret = cFn();
    return ret;
}
pub fn boxMinusOne() *Box {
    const cFn = @extern(*const fn () callconv(.c) *Box, .{ .name = "graphene_box_minus_one" });
    const ret = cFn();
    return ret;
}
pub fn boxOne() *Box {
    const cFn = @extern(*const fn () callconv(.c) *Box, .{ .name = "graphene_box_one" });
    const ret = cFn();
    return ret;
}
pub fn boxOneMinusOne() *Box {
    const cFn = @extern(*const fn () callconv(.c) *Box, .{ .name = "graphene_box_one_minus_one" });
    const ret = cFn();
    return ret;
}
pub fn boxZero() *Box {
    const cFn = @extern(*const fn () callconv(.c) *Box, .{ .name = "graphene_box_zero" });
    const ret = cFn();
    return ret;
}
pub fn point3dZero() *Point3D {
    const cFn = @extern(*const fn () callconv(.c) *Point3D, .{ .name = "graphene_point3d_zero" });
    const ret = cFn();
    return ret;
}
pub fn pointZero() *Point {
    const cFn = @extern(*const fn () callconv(.c) *Point, .{ .name = "graphene_point_zero" });
    const ret = cFn();
    return ret;
}
pub fn rectAlloc() *Rect {
    const cFn = @extern(*const fn () callconv(.c) *Rect, .{ .name = "graphene_rect_alloc" });
    const ret = cFn();
    return ret;
}
pub fn rectZero() *Rect {
    const cFn = @extern(*const fn () callconv(.c) *Rect, .{ .name = "graphene_rect_zero" });
    const ret = cFn();
    return ret;
}
pub fn sizeZero() *Size {
    const cFn = @extern(*const fn () callconv(.c) *Size, .{ .name = "graphene_size_zero" });
    const ret = cFn();
    return ret;
}
pub fn vec2One() *Vec2 {
    const cFn = @extern(*const fn () callconv(.c) *Vec2, .{ .name = "graphene_vec2_one" });
    const ret = cFn();
    return ret;
}
pub fn vec2XAxis() *Vec2 {
    const cFn = @extern(*const fn () callconv(.c) *Vec2, .{ .name = "graphene_vec2_x_axis" });
    const ret = cFn();
    return ret;
}
pub fn vec2YAxis() *Vec2 {
    const cFn = @extern(*const fn () callconv(.c) *Vec2, .{ .name = "graphene_vec2_y_axis" });
    const ret = cFn();
    return ret;
}
pub fn vec2Zero() *Vec2 {
    const cFn = @extern(*const fn () callconv(.c) *Vec2, .{ .name = "graphene_vec2_zero" });
    const ret = cFn();
    return ret;
}
pub fn vec3One() *Vec3 {
    const cFn = @extern(*const fn () callconv(.c) *Vec3, .{ .name = "graphene_vec3_one" });
    const ret = cFn();
    return ret;
}
pub fn vec3XAxis() *Vec3 {
    const cFn = @extern(*const fn () callconv(.c) *Vec3, .{ .name = "graphene_vec3_x_axis" });
    const ret = cFn();
    return ret;
}
pub fn vec3YAxis() *Vec3 {
    const cFn = @extern(*const fn () callconv(.c) *Vec3, .{ .name = "graphene_vec3_y_axis" });
    const ret = cFn();
    return ret;
}
pub fn vec3ZAxis() *Vec3 {
    const cFn = @extern(*const fn () callconv(.c) *Vec3, .{ .name = "graphene_vec3_z_axis" });
    const ret = cFn();
    return ret;
}
pub fn vec3Zero() *Vec3 {
    const cFn = @extern(*const fn () callconv(.c) *Vec3, .{ .name = "graphene_vec3_zero" });
    const ret = cFn();
    return ret;
}
pub fn vec4One() *Vec4 {
    const cFn = @extern(*const fn () callconv(.c) *Vec4, .{ .name = "graphene_vec4_one" });
    const ret = cFn();
    return ret;
}
pub fn vec4WAxis() *Vec4 {
    const cFn = @extern(*const fn () callconv(.c) *Vec4, .{ .name = "graphene_vec4_w_axis" });
    const ret = cFn();
    return ret;
}
pub fn vec4XAxis() *Vec4 {
    const cFn = @extern(*const fn () callconv(.c) *Vec4, .{ .name = "graphene_vec4_x_axis" });
    const ret = cFn();
    return ret;
}
pub fn vec4YAxis() *Vec4 {
    const cFn = @extern(*const fn () callconv(.c) *Vec4, .{ .name = "graphene_vec4_y_axis" });
    const ret = cFn();
    return ret;
}
pub fn vec4ZAxis() *Vec4 {
    const cFn = @extern(*const fn () callconv(.c) *Vec4, .{ .name = "graphene_vec4_z_axis" });
    const ret = cFn();
    return ret;
}
pub fn vec4Zero() *Vec4 {
    const cFn = @extern(*const fn () callconv(.c) *Vec4, .{ .name = "graphene_vec4_zero" });
    const ret = cFn();
    return ret;
}

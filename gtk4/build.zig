const std = @import("std");

pub fn build(b: *std.Build) !void{
    var template = b.addModule("template", .{ .root_source_file = b.path("template.zig") });
    var core = b.addModule("core", .{ .root_source_file = b.path("core.zig") });
    var glib = b.addModule("glib", .{ .root_source_file = b.path("glib.zig") });
    var gmodule = b.addModule("gmodule", .{ .root_source_file = b.path("gmodule.zig") });
    var gobject = b.addModule("gobject", .{ .root_source_file = b.path("gobject.zig") });
    var gdk = b.addModule("gdk", .{ .root_source_file = b.path("gdk.zig") });
    var gdk_pixbuf = b.addModule("gdk_pixbuf", .{ .root_source_file = b.path("gdk_pixbuf.zig") });
    var gio = b.addModule("gio", .{ .root_source_file = b.path("gio.zig") });
    var graphene = b.addModule("graphene", .{ .root_source_file = b.path("graphene.zig") });
    var gsk = b.addModule("gsk", .{ .root_source_file = b.path("gsk.zig") });
    var gtk = b.addModule("gtk", .{ .root_source_file = b.path("gtk.zig") });
    var harf_buzz = b.addModule("harf_buzz", .{ .root_source_file = b.path("harf_buzz.zig") });
    var pango = b.addModule("pango", .{ .root_source_file = b.path("pango.zig") });
    var pango_cairo = b.addModule("pango_cairo", .{ .root_source_file = b.path("pango_cairo.zig") });
    var cairo = b.addModule("cairo", .{ .root_source_file = b.path("cairo.zig") });
    var freetype2 = b.addModule("freetype2", .{ .root_source_file = b.path("freetype2.zig") });
    inline for ([_]*std.Build.Module{ core }, [_][]const u8{ "core" }) |dep_mod, dep_name| {
        glib.addImport(dep_name, dep_mod);
    }
    inline for ([_]*std.Build.Module{ core, glib }, [_][]const u8{ "core", "glib" }) |dep_mod, dep_name| {
        gmodule.addImport(dep_name, dep_mod);
    }
    inline for ([_]*std.Build.Module{ core, glib }, [_][]const u8{ "core", "glib" }) |dep_mod, dep_name| {
        gobject.addImport(dep_name, dep_mod);
    }
    inline for ([_]*std.Build.Module{ core, pango_cairo, freetype2, glib, gdk_pixbuf, harf_buzz, gmodule, cairo, gobject, pango, gio }, [_][]const u8{ "core", "pango_cairo", "freetype2", "glib", "gdk_pixbuf", "harf_buzz", "gmodule", "cairo", "gobject", "pango", "gio" }) |dep_mod, dep_name| {
        gdk.addImport(dep_name, dep_mod);
    }
    inline for ([_]*std.Build.Module{ core, gobject, gio, glib, gmodule }, [_][]const u8{ "core", "gobject", "gio", "glib", "gmodule" }) |dep_mod, dep_name| {
        gdk_pixbuf.addImport(dep_name, dep_mod);
    }
    inline for ([_]*std.Build.Module{ core, gobject, glib, gmodule }, [_][]const u8{ "core", "gobject", "glib", "gmodule" }) |dep_mod, dep_name| {
        gio.addImport(dep_name, dep_mod);
    }
    inline for ([_]*std.Build.Module{ core, gobject, glib }, [_][]const u8{ "core", "gobject", "glib" }) |dep_mod, dep_name| {
        graphene.addImport(dep_name, dep_mod);
    }
    inline for ([_]*std.Build.Module{ core, pango_cairo, freetype2, glib, gdk_pixbuf, harf_buzz, gmodule, cairo, graphene, gobject, pango, gdk, gio }, [_][]const u8{ "core", "pango_cairo", "freetype2", "glib", "gdk_pixbuf", "harf_buzz", "gmodule", "cairo", "graphene", "gobject", "pango", "gdk", "gio" }) |dep_mod, dep_name| {
        gsk.addImport(dep_name, dep_mod);
    }
    inline for ([_]*std.Build.Module{ core, pango_cairo, freetype2, glib, gdk_pixbuf, harf_buzz, gmodule, cairo, graphene, gsk, gobject, gdk, gio, pango }, [_][]const u8{ "core", "pango_cairo", "freetype2", "glib", "gdk_pixbuf", "harf_buzz", "gmodule", "cairo", "graphene", "gsk", "gobject", "gdk", "gio", "pango" }) |dep_mod, dep_name| {
        gtk.addImport(dep_name, dep_mod);
    }
    gtk.addImport("template", template);
    inline for ([_]*std.Build.Module{ core, gobject, glib, freetype2 }, [_][]const u8{ "core", "gobject", "glib", "freetype2" }) |dep_mod, dep_name| {
        harf_buzz.addImport(dep_name, dep_mod);
    }
    inline for ([_]*std.Build.Module{ core, gobject, gio, cairo, glib, harf_buzz, freetype2, gmodule }, [_][]const u8{ "core", "gobject", "gio", "cairo", "glib", "harf_buzz", "freetype2", "gmodule" }) |dep_mod, dep_name| {
        pango.addImport(dep_name, dep_mod);
    }
    inline for ([_]*std.Build.Module{ core, freetype2, glib, harf_buzz, gmodule, cairo, gobject, pango, gio }, [_][]const u8{ "core", "freetype2", "glib", "harf_buzz", "gmodule", "cairo", "gobject", "pango", "gio" }) |dep_mod, dep_name| {
        pango_cairo.addImport(dep_name, dep_mod);
    }
    inline for ([_]*std.Build.Module{ core, gobject, glib }, [_][]const u8{ "core", "gobject", "glib" }) |dep_mod, dep_name| {
        cairo.addImport(dep_name, dep_mod);
    }
    inline for ([_]*std.Build.Module{ core }, [_][]const u8{ "core" }) |dep_mod, dep_name| {
        freetype2.addImport(dep_name, dep_mod);
    }
    template.addImport("core", core);
    template.addImport("gtk", gtk);
    core.addImport("glib", glib);
    core.addImport("gobject", gobject);
}
const gtk = @import("gtk");

pub fn toggleClassnameForWidget(w: *gtk.Widget, class: [:0]const u8, toggle: bool) void {
    if (toggle) {
        w.addCssClass(class);
    } else {
        w.removeCssClass(class);
    }
}

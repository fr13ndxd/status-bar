const core = @import("core.zig");
const GObject = @import("GObject.zig");
const GLib = @import("GLib.zig");
const freetype2 = @import("freetype2.zig");
const HarfBuzz = @This();
pub const AAT_LAYOUT_NO_SELECTOR_INDEX = 65535;
pub const BUFFER_REPLACEMENT_CODEPOINT_DEFAULT = 65533;
pub const CODEPOINT_INVALID = 4294967295;
pub const FEATURE_GLOBAL_START = 0;
pub const FONT_NO_VAR_NAMED_INSTANCE = -1;
pub const LANGUAGE_INVALID = null;
pub const OT_LAYOUT_DEFAULT_LANGUAGE_INDEX = 65535;
pub const OT_LAYOUT_NO_FEATURE_INDEX = 65535;
pub const OT_LAYOUT_NO_SCRIPT_INDEX = 65535;
pub const OT_LAYOUT_NO_VARIATIONS_INDEX = -1;
pub const OT_MAX_TAGS_PER_LANGUAGE = 3;
pub const OT_MAX_TAGS_PER_SCRIPT = 3;
pub const OT_VAR_NO_AXIS_INDEX = -1;
pub const UNICODE_COMBINING_CLASS_CCC133 = 133;
pub const UNICODE_MAX = 1114111;
pub const UNICODE_MAX_DECOMPOSITION_LEN = 19;
pub const VERSION_MAJOR = 10;
pub const VERSION_MICRO = 0;
pub const VERSION_MINOR = 2;
pub const VERSION_STRING = "10.2.0";
pub const aat_layout_feature_selector_info_t = extern struct {
    name_id: u32,
    enable: aat_layout_feature_selector_t,
    disable: aat_layout_feature_selector_t,
    reserved: u32,
};
pub const aat_layout_feature_selector_t = enum(u32) {
    invalid = 65535,
    all_type_features_on = 0,
    all_type_features_off = 1,
    common_ligatures_on = 2,
    common_ligatures_off = 3,
    rare_ligatures_on = 4,
    rare_ligatures_off = 5,
    logos_on = 6,
    logos_off = 7,
    rebus_pictures_on = 8,
    rebus_pictures_off = 9,
    diphthong_ligatures_on = 10,
    diphthong_ligatures_off = 11,
    squared_ligatures_on = 12,
    squared_ligatures_off = 13,
    abbrev_squared_ligatures_on = 14,
    abbrev_squared_ligatures_off = 15,
    symbol_ligatures_on = 16,
    symbol_ligatures_off = 17,
    contextual_ligatures_on = 18,
    contextual_ligatures_off = 19,
    historical_ligatures_on = 20,
    historical_ligatures_off = 21,
    stylistic_alt_eleven_on = 22,
    stylistic_alt_eleven_off = 23,
    stylistic_alt_twelve_on = 24,
    stylistic_alt_twelve_off = 25,
    stylistic_alt_thirteen_on = 26,
    stylistic_alt_thirteen_off = 27,
    stylistic_alt_fourteen_on = 28,
    stylistic_alt_fourteen_off = 29,
    stylistic_alt_fifteen_on = 30,
    stylistic_alt_fifteen_off = 31,
    stylistic_alt_sixteen_on = 32,
    stylistic_alt_sixteen_off = 33,
    stylistic_alt_seventeen_on = 34,
    stylistic_alt_seventeen_off = 35,
    stylistic_alt_eighteen_on = 36,
    stylistic_alt_eighteen_off = 37,
    stylistic_alt_nineteen_on = 38,
    stylistic_alt_nineteen_off = 39,
    stylistic_alt_twenty_on = 40,
    stylistic_alt_twenty_off = 41,
    pub const required_ligatures_on: @This() = @enumFromInt(@as(u32, 0));
    pub const required_ligatures_off: @This() = @enumFromInt(@as(u32, 1));
    pub const unconnected: @This() = @enumFromInt(@as(u32, 0));
    pub const partially_connected: @This() = @enumFromInt(@as(u32, 1));
    pub const cursive: @This() = @enumFromInt(@as(u32, 2));
    pub const upper_and_lower_case: @This() = @enumFromInt(@as(u32, 0));
    pub const all_caps: @This() = @enumFromInt(@as(u32, 1));
    pub const all_lower_case: @This() = @enumFromInt(@as(u32, 2));
    pub const small_caps: @This() = @enumFromInt(@as(u32, 3));
    pub const initial_caps: @This() = @enumFromInt(@as(u32, 4));
    pub const initial_caps_and_small_caps: @This() = @enumFromInt(@as(u32, 5));
    pub const substitute_vertical_forms_on: @This() = @enumFromInt(@as(u32, 0));
    pub const substitute_vertical_forms_off: @This() = @enumFromInt(@as(u32, 1));
    pub const linguistic_rearrangement_on: @This() = @enumFromInt(@as(u32, 0));
    pub const linguistic_rearrangement_off: @This() = @enumFromInt(@as(u32, 1));
    pub const monospaced_numbers: @This() = @enumFromInt(@as(u32, 0));
    pub const proportional_numbers: @This() = @enumFromInt(@as(u32, 1));
    pub const third_width_numbers: @This() = @enumFromInt(@as(u32, 2));
    pub const quarter_width_numbers: @This() = @enumFromInt(@as(u32, 3));
    pub const word_initial_swashes_on: @This() = @enumFromInt(@as(u32, 0));
    pub const word_initial_swashes_off: @This() = @enumFromInt(@as(u32, 1));
    pub const word_final_swashes_on: @This() = @enumFromInt(@as(u32, 2));
    pub const word_final_swashes_off: @This() = @enumFromInt(@as(u32, 3));
    pub const line_initial_swashes_on: @This() = @enumFromInt(@as(u32, 4));
    pub const line_initial_swashes_off: @This() = @enumFromInt(@as(u32, 5));
    pub const line_final_swashes_on: @This() = @enumFromInt(@as(u32, 6));
    pub const line_final_swashes_off: @This() = @enumFromInt(@as(u32, 7));
    pub const non_final_swashes_on: @This() = @enumFromInt(@as(u32, 8));
    pub const non_final_swashes_off: @This() = @enumFromInt(@as(u32, 9));
    pub const show_diacritics: @This() = @enumFromInt(@as(u32, 0));
    pub const hide_diacritics: @This() = @enumFromInt(@as(u32, 1));
    pub const decompose_diacritics: @This() = @enumFromInt(@as(u32, 2));
    pub const normal_position: @This() = @enumFromInt(@as(u32, 0));
    pub const superiors: @This() = @enumFromInt(@as(u32, 1));
    pub const inferiors: @This() = @enumFromInt(@as(u32, 2));
    pub const ordinals: @This() = @enumFromInt(@as(u32, 3));
    pub const scientific_inferiors: @This() = @enumFromInt(@as(u32, 4));
    pub const no_fractions: @This() = @enumFromInt(@as(u32, 0));
    pub const vertical_fractions: @This() = @enumFromInt(@as(u32, 1));
    pub const diagonal_fractions: @This() = @enumFromInt(@as(u32, 2));
    pub const prevent_overlap_on: @This() = @enumFromInt(@as(u32, 0));
    pub const prevent_overlap_off: @This() = @enumFromInt(@as(u32, 1));
    pub const hyphens_to_em_dash_on: @This() = @enumFromInt(@as(u32, 0));
    pub const hyphens_to_em_dash_off: @This() = @enumFromInt(@as(u32, 1));
    pub const hyphen_to_en_dash_on: @This() = @enumFromInt(@as(u32, 2));
    pub const hyphen_to_en_dash_off: @This() = @enumFromInt(@as(u32, 3));
    pub const slashed_zero_on: @This() = @enumFromInt(@as(u32, 4));
    pub const slashed_zero_off: @This() = @enumFromInt(@as(u32, 5));
    pub const form_interrobang_on: @This() = @enumFromInt(@as(u32, 6));
    pub const form_interrobang_off: @This() = @enumFromInt(@as(u32, 7));
    pub const smart_quotes_on: @This() = @enumFromInt(@as(u32, 8));
    pub const smart_quotes_off: @This() = @enumFromInt(@as(u32, 9));
    pub const periods_to_ellipsis_on: @This() = @enumFromInt(@as(u32, 10));
    pub const periods_to_ellipsis_off: @This() = @enumFromInt(@as(u32, 11));
    pub const hyphen_to_minus_on: @This() = @enumFromInt(@as(u32, 0));
    pub const hyphen_to_minus_off: @This() = @enumFromInt(@as(u32, 1));
    pub const asterisk_to_multiply_on: @This() = @enumFromInt(@as(u32, 2));
    pub const asterisk_to_multiply_off: @This() = @enumFromInt(@as(u32, 3));
    pub const slash_to_divide_on: @This() = @enumFromInt(@as(u32, 4));
    pub const slash_to_divide_off: @This() = @enumFromInt(@as(u32, 5));
    pub const inequality_ligatures_on: @This() = @enumFromInt(@as(u32, 6));
    pub const inequality_ligatures_off: @This() = @enumFromInt(@as(u32, 7));
    pub const exponents_on: @This() = @enumFromInt(@as(u32, 8));
    pub const exponents_off: @This() = @enumFromInt(@as(u32, 9));
    pub const mathematical_greek_on: @This() = @enumFromInt(@as(u32, 10));
    pub const mathematical_greek_off: @This() = @enumFromInt(@as(u32, 11));
    pub const no_ornaments: @This() = @enumFromInt(@as(u32, 0));
    pub const dingbats: @This() = @enumFromInt(@as(u32, 1));
    pub const pi_characters: @This() = @enumFromInt(@as(u32, 2));
    pub const fleurons: @This() = @enumFromInt(@as(u32, 3));
    pub const decorative_borders: @This() = @enumFromInt(@as(u32, 4));
    pub const international_symbols: @This() = @enumFromInt(@as(u32, 5));
    pub const math_symbols: @This() = @enumFromInt(@as(u32, 6));
    pub const no_alternates: @This() = @enumFromInt(@as(u32, 0));
    pub const design_level1: @This() = @enumFromInt(@as(u32, 0));
    pub const design_level2: @This() = @enumFromInt(@as(u32, 1));
    pub const design_level3: @This() = @enumFromInt(@as(u32, 2));
    pub const design_level4: @This() = @enumFromInt(@as(u32, 3));
    pub const design_level5: @This() = @enumFromInt(@as(u32, 4));
    pub const no_style_options: @This() = @enumFromInt(@as(u32, 0));
    pub const display_text: @This() = @enumFromInt(@as(u32, 1));
    pub const engraved_text: @This() = @enumFromInt(@as(u32, 2));
    pub const illuminated_caps: @This() = @enumFromInt(@as(u32, 3));
    pub const titling_caps: @This() = @enumFromInt(@as(u32, 4));
    pub const tall_caps: @This() = @enumFromInt(@as(u32, 5));
    pub const traditional_characters: @This() = @enumFromInt(@as(u32, 0));
    pub const simplified_characters: @This() = @enumFromInt(@as(u32, 1));
    pub const jis1978_characters: @This() = @enumFromInt(@as(u32, 2));
    pub const jis1983_characters: @This() = @enumFromInt(@as(u32, 3));
    pub const jis1990_characters: @This() = @enumFromInt(@as(u32, 4));
    pub const traditional_alt_one: @This() = @enumFromInt(@as(u32, 5));
    pub const traditional_alt_two: @This() = @enumFromInt(@as(u32, 6));
    pub const traditional_alt_three: @This() = @enumFromInt(@as(u32, 7));
    pub const traditional_alt_four: @This() = @enumFromInt(@as(u32, 8));
    pub const traditional_alt_five: @This() = @enumFromInt(@as(u32, 9));
    pub const expert_characters: @This() = @enumFromInt(@as(u32, 10));
    pub const jis2004_characters: @This() = @enumFromInt(@as(u32, 11));
    pub const hojo_characters: @This() = @enumFromInt(@as(u32, 12));
    pub const nlccharacters: @This() = @enumFromInt(@as(u32, 13));
    pub const traditional_names_characters: @This() = @enumFromInt(@as(u32, 14));
    pub const lower_case_numbers: @This() = @enumFromInt(@as(u32, 0));
    pub const upper_case_numbers: @This() = @enumFromInt(@as(u32, 1));
    pub const proportional_text: @This() = @enumFromInt(@as(u32, 0));
    pub const monospaced_text: @This() = @enumFromInt(@as(u32, 1));
    pub const half_width_text: @This() = @enumFromInt(@as(u32, 2));
    pub const third_width_text: @This() = @enumFromInt(@as(u32, 3));
    pub const quarter_width_text: @This() = @enumFromInt(@as(u32, 4));
    pub const alt_proportional_text: @This() = @enumFromInt(@as(u32, 5));
    pub const alt_half_width_text: @This() = @enumFromInt(@as(u32, 6));
    pub const no_transliteration: @This() = @enumFromInt(@as(u32, 0));
    pub const hanja_to_hangul: @This() = @enumFromInt(@as(u32, 1));
    pub const hiragana_to_katakana: @This() = @enumFromInt(@as(u32, 2));
    pub const katakana_to_hiragana: @This() = @enumFromInt(@as(u32, 3));
    pub const kana_to_romanization: @This() = @enumFromInt(@as(u32, 4));
    pub const romanization_to_hiragana: @This() = @enumFromInt(@as(u32, 5));
    pub const romanization_to_katakana: @This() = @enumFromInt(@as(u32, 6));
    pub const hanja_to_hangul_alt_one: @This() = @enumFromInt(@as(u32, 7));
    pub const hanja_to_hangul_alt_two: @This() = @enumFromInt(@as(u32, 8));
    pub const hanja_to_hangul_alt_three: @This() = @enumFromInt(@as(u32, 9));
    pub const no_annotation: @This() = @enumFromInt(@as(u32, 0));
    pub const box_annotation: @This() = @enumFromInt(@as(u32, 1));
    pub const rounded_box_annotation: @This() = @enumFromInt(@as(u32, 2));
    pub const circle_annotation: @This() = @enumFromInt(@as(u32, 3));
    pub const inverted_circle_annotation: @This() = @enumFromInt(@as(u32, 4));
    pub const parenthesis_annotation: @This() = @enumFromInt(@as(u32, 5));
    pub const period_annotation: @This() = @enumFromInt(@as(u32, 6));
    pub const roman_numeral_annotation: @This() = @enumFromInt(@as(u32, 7));
    pub const diamond_annotation: @This() = @enumFromInt(@as(u32, 8));
    pub const inverted_box_annotation: @This() = @enumFromInt(@as(u32, 9));
    pub const inverted_rounded_box_annotation: @This() = @enumFromInt(@as(u32, 10));
    pub const full_width_kana: @This() = @enumFromInt(@as(u32, 0));
    pub const proportional_kana: @This() = @enumFromInt(@as(u32, 1));
    pub const full_width_ideographs: @This() = @enumFromInt(@as(u32, 0));
    pub const proportional_ideographs: @This() = @enumFromInt(@as(u32, 1));
    pub const half_width_ideographs: @This() = @enumFromInt(@as(u32, 2));
    pub const canonical_composition_on: @This() = @enumFromInt(@as(u32, 0));
    pub const canonical_composition_off: @This() = @enumFromInt(@as(u32, 1));
    pub const compatibility_composition_on: @This() = @enumFromInt(@as(u32, 2));
    pub const compatibility_composition_off: @This() = @enumFromInt(@as(u32, 3));
    pub const transcoding_composition_on: @This() = @enumFromInt(@as(u32, 4));
    pub const transcoding_composition_off: @This() = @enumFromInt(@as(u32, 5));
    pub const no_ruby_kana: @This() = @enumFromInt(@as(u32, 0));
    pub const ruby_kana: @This() = @enumFromInt(@as(u32, 1));
    pub const ruby_kana_on: @This() = @enumFromInt(@as(u32, 2));
    pub const ruby_kana_off: @This() = @enumFromInt(@as(u32, 3));
    pub const no_cjk_symbol_alternatives: @This() = @enumFromInt(@as(u32, 0));
    pub const cjk_symbol_alt_one: @This() = @enumFromInt(@as(u32, 1));
    pub const cjk_symbol_alt_two: @This() = @enumFromInt(@as(u32, 2));
    pub const cjk_symbol_alt_three: @This() = @enumFromInt(@as(u32, 3));
    pub const cjk_symbol_alt_four: @This() = @enumFromInt(@as(u32, 4));
    pub const cjk_symbol_alt_five: @This() = @enumFromInt(@as(u32, 5));
    pub const no_ideographic_alternatives: @This() = @enumFromInt(@as(u32, 0));
    pub const ideographic_alt_one: @This() = @enumFromInt(@as(u32, 1));
    pub const ideographic_alt_two: @This() = @enumFromInt(@as(u32, 2));
    pub const ideographic_alt_three: @This() = @enumFromInt(@as(u32, 3));
    pub const ideographic_alt_four: @This() = @enumFromInt(@as(u32, 4));
    pub const ideographic_alt_five: @This() = @enumFromInt(@as(u32, 5));
    pub const cjk_vertical_roman_centered: @This() = @enumFromInt(@as(u32, 0));
    pub const cjk_vertical_roman_hbaseline: @This() = @enumFromInt(@as(u32, 1));
    pub const no_cjk_italic_roman: @This() = @enumFromInt(@as(u32, 0));
    pub const cjk_italic_roman: @This() = @enumFromInt(@as(u32, 1));
    pub const cjk_italic_roman_on: @This() = @enumFromInt(@as(u32, 2));
    pub const cjk_italic_roman_off: @This() = @enumFromInt(@as(u32, 3));
    pub const case_sensitive_layout_on: @This() = @enumFromInt(@as(u32, 0));
    pub const case_sensitive_layout_off: @This() = @enumFromInt(@as(u32, 1));
    pub const case_sensitive_spacing_on: @This() = @enumFromInt(@as(u32, 2));
    pub const case_sensitive_spacing_off: @This() = @enumFromInt(@as(u32, 3));
    pub const alternate_horiz_kana_on: @This() = @enumFromInt(@as(u32, 0));
    pub const alternate_horiz_kana_off: @This() = @enumFromInt(@as(u32, 1));
    pub const alternate_vert_kana_on: @This() = @enumFromInt(@as(u32, 2));
    pub const alternate_vert_kana_off: @This() = @enumFromInt(@as(u32, 3));
    pub const no_stylistic_alternates: @This() = @enumFromInt(@as(u32, 0));
    pub const stylistic_alt_one_on: @This() = @enumFromInt(@as(u32, 2));
    pub const stylistic_alt_one_off: @This() = @enumFromInt(@as(u32, 3));
    pub const stylistic_alt_two_on: @This() = @enumFromInt(@as(u32, 4));
    pub const stylistic_alt_two_off: @This() = @enumFromInt(@as(u32, 5));
    pub const stylistic_alt_three_on: @This() = @enumFromInt(@as(u32, 6));
    pub const stylistic_alt_three_off: @This() = @enumFromInt(@as(u32, 7));
    pub const stylistic_alt_four_on: @This() = @enumFromInt(@as(u32, 8));
    pub const stylistic_alt_four_off: @This() = @enumFromInt(@as(u32, 9));
    pub const stylistic_alt_five_on: @This() = @enumFromInt(@as(u32, 10));
    pub const stylistic_alt_five_off: @This() = @enumFromInt(@as(u32, 11));
    pub const stylistic_alt_six_on: @This() = @enumFromInt(@as(u32, 12));
    pub const stylistic_alt_six_off: @This() = @enumFromInt(@as(u32, 13));
    pub const stylistic_alt_seven_on: @This() = @enumFromInt(@as(u32, 14));
    pub const stylistic_alt_seven_off: @This() = @enumFromInt(@as(u32, 15));
    pub const stylistic_alt_eight_on: @This() = @enumFromInt(@as(u32, 16));
    pub const stylistic_alt_eight_off: @This() = @enumFromInt(@as(u32, 17));
    pub const stylistic_alt_nine_on: @This() = @enumFromInt(@as(u32, 18));
    pub const stylistic_alt_nine_off: @This() = @enumFromInt(@as(u32, 19));
    pub const stylistic_alt_ten_on: @This() = @enumFromInt(@as(u32, 20));
    pub const stylistic_alt_ten_off: @This() = @enumFromInt(@as(u32, 21));
    pub const contextual_alternates_on: @This() = @enumFromInt(@as(u32, 0));
    pub const contextual_alternates_off: @This() = @enumFromInt(@as(u32, 1));
    pub const swash_alternates_on: @This() = @enumFromInt(@as(u32, 2));
    pub const swash_alternates_off: @This() = @enumFromInt(@as(u32, 3));
    pub const contextual_swash_alternates_on: @This() = @enumFromInt(@as(u32, 4));
    pub const contextual_swash_alternates_off: @This() = @enumFromInt(@as(u32, 5));
    pub const default_lower_case: @This() = @enumFromInt(@as(u32, 0));
    pub const lower_case_small_caps: @This() = @enumFromInt(@as(u32, 1));
    pub const lower_case_petite_caps: @This() = @enumFromInt(@as(u32, 2));
    pub const default_upper_case: @This() = @enumFromInt(@as(u32, 0));
    pub const upper_case_small_caps: @This() = @enumFromInt(@as(u32, 1));
    pub const upper_case_petite_caps: @This() = @enumFromInt(@as(u32, 2));
    pub const half_width_cjk_roman: @This() = @enumFromInt(@as(u32, 0));
    pub const proportional_cjk_roman: @This() = @enumFromInt(@as(u32, 1));
    pub const default_cjk_roman: @This() = @enumFromInt(@as(u32, 2));
    pub const full_width_cjk_roman: @This() = @enumFromInt(@as(u32, 3));
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_aat_layout_feature_selector_get_type" });
        return cFn();
    }
};
pub fn aatLayoutFeatureTypeGetNameId(arg_face: *face_t, arg_feature_type: aat_layout_feature_type_t) u32 {
    const cFn = @extern(*const fn (*face_t, aat_layout_feature_type_t) callconv(.c) u32, .{ .name = "hb_aat_layout_feature_type_get_name_id" });
    const ret = cFn(arg_face, arg_feature_type);
    return ret;
}
pub fn aatLayoutFeatureTypeGetSelectorInfos(arg_face: *face_t, arg_feature_type: aat_layout_feature_type_t, arg_start_offset: u32, argS_selectors: ?[]aat_layout_feature_selector_info_t) struct {
    ret: u32,
    selectors: ?[]aat_layout_feature_selector_info_t,
    default_index: u32,
} {
    const arg_selectors: [*]aat_layout_feature_selector_info_t = @ptrCast(argS_selectors);
    var argO_selector_count: u32 = undefined;
    const arg_selector_count: ?*u32 = &argO_selector_count;
    var argO_default_index: u32 = undefined;
    const arg_default_index: ?*u32 = &argO_default_index;
    const cFn = @extern(*const fn (*face_t, aat_layout_feature_type_t, u32, ?*u32, [*]aat_layout_feature_selector_info_t, ?*u32) callconv(.c) u32, .{ .name = "hb_aat_layout_feature_type_get_selector_infos" });
    const ret = cFn(arg_face, arg_feature_type, arg_start_offset, arg_selector_count, arg_selectors, arg_default_index);
    return .{ .ret = ret, .selectors = arg_selectors[0..@intCast(argO_selector_count)], .default_index = argO_default_index };
}
pub const aat_layout_feature_type_t = enum(u32) {
    invalid = 65535,
    all_typographic = 0,
    ligatures = 1,
    cursive_connection = 2,
    letter_case = 3,
    vertical_substitution = 4,
    linguistic_rearrangement = 5,
    number_spacing = 6,
    smart_swash_type = 8,
    diacritics_type = 9,
    vertical_position = 10,
    fractions = 11,
    overlapping_characters_type = 13,
    typographic_extras = 14,
    mathematical_extras = 15,
    ornament_sets_type = 16,
    character_alternatives = 17,
    design_complexity_type = 18,
    style_options = 19,
    character_shape = 20,
    number_case = 21,
    text_spacing = 22,
    transliteration = 23,
    annotation_type = 24,
    kana_spacing_type = 25,
    ideographic_spacing_type = 26,
    unicode_decomposition_type = 27,
    ruby_kana = 28,
    cjk_symbol_alternatives_type = 29,
    ideographic_alternatives_type = 30,
    cjk_vertical_roman_placement_type = 31,
    italic_cjk_roman = 32,
    case_sensitive_layout = 33,
    alternate_kana = 34,
    stylistic_alternatives = 35,
    contextual_alternatives = 36,
    lower_case = 37,
    upper_case = 38,
    language_tag_type = 39,
    cjk_roman_spacing_type = 103,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_aat_layout_feature_type_get_type" });
        return cFn();
    }
};
pub fn aatLayoutGetFeatureTypes(arg_face: *face_t, arg_start_offset: u32, argS_features: []aat_layout_feature_type_t) struct {
    ret: u32,
    features: []aat_layout_feature_type_t,
} {
    const arg_features: [*]aat_layout_feature_type_t = @ptrCast(argS_features);
    var argO_feature_count: u32 = undefined;
    const arg_feature_count: ?*u32 = &argO_feature_count;
    const cFn = @extern(*const fn (*face_t, u32, ?*u32, [*]aat_layout_feature_type_t) callconv(.c) u32, .{ .name = "hb_aat_layout_get_feature_types" });
    const ret = cFn(arg_face, arg_start_offset, arg_feature_count, arg_features);
    return .{ .ret = ret, .features = arg_features[0..@intCast(argO_feature_count)] };
}
pub fn aatLayoutHasPositioning(arg_face: *face_t) i32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) i32, .{ .name = "hb_aat_layout_has_positioning" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn aatLayoutHasSubstitution(arg_face: *face_t) i32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) i32, .{ .name = "hb_aat_layout_has_substitution" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn aatLayoutHasTracking(arg_face: *face_t) i32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) i32, .{ .name = "hb_aat_layout_has_tracking" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn blobCopyWritableOrFail(arg_blob: *blob_t) *blob_t {
    const cFn = @extern(*const fn (*blob_t) callconv(.c) *blob_t, .{ .name = "hb_blob_copy_writable_or_fail" });
    const ret = cFn(arg_blob);
    return ret;
}
pub fn blobCreateFromFile(arg_file_name: [*:0]const u8) *blob_t {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *blob_t, .{ .name = "hb_blob_create_from_file" });
    const ret = cFn(arg_file_name);
    return ret;
}
pub fn blobCreateFromFileOrFail(arg_file_name: [*:0]const u8) *blob_t {
    const cFn = @extern(*const fn ([*:0]const u8) callconv(.c) *blob_t, .{ .name = "hb_blob_create_from_file_or_fail" });
    const ret = cFn(arg_file_name);
    return ret;
}
pub fn blobCreateSubBlob(arg_parent: *blob_t, arg_offset: u32, arg_length: u32) *blob_t {
    const cFn = @extern(*const fn (*blob_t, u32, u32) callconv(.c) *blob_t, .{ .name = "hb_blob_create_sub_blob" });
    const ret = cFn(arg_parent, arg_offset, arg_length);
    return ret;
}
pub fn blobGetData(arg_blob: *blob_t) [][*:0]const u8 {
    var argO_length: u32 = undefined;
    const arg_length: *u32 = &argO_length;
    const cFn = @extern(*const fn (*blob_t, *u32) callconv(.c) ?[*][*:0]const u8, .{ .name = "hb_blob_get_data" });
    const ret = cFn(arg_blob, arg_length);
    return ret[0..@intCast(argO_length)];
}
pub fn blobGetDataWritable(arg_blob: *blob_t) [][*:0]const u8 {
    var argO_length: u32 = undefined;
    const arg_length: *u32 = &argO_length;
    const cFn = @extern(*const fn (*blob_t, *u32) callconv(.c) [*][*:0]const u8, .{ .name = "hb_blob_get_data_writable" });
    const ret = cFn(arg_blob, arg_length);
    return ret[0..@intCast(argO_length)];
}
pub fn blobGetEmpty() *blob_t {
    const cFn = @extern(*const fn () callconv(.c) *blob_t, .{ .name = "hb_blob_get_empty" });
    const ret = cFn();
    return ret;
}
pub fn blobGetLength(arg_blob: *blob_t) u32 {
    const cFn = @extern(*const fn (*blob_t) callconv(.c) u32, .{ .name = "hb_blob_get_length" });
    const ret = cFn(arg_blob);
    return ret;
}
pub fn blobIsImmutable(arg_blob: *blob_t) i32 {
    const cFn = @extern(*const fn (*blob_t) callconv(.c) i32, .{ .name = "hb_blob_is_immutable" });
    const ret = cFn(arg_blob);
    return ret;
}
pub fn blobMakeImmutable(arg_blob: *blob_t) void {
    const cFn = @extern(*const fn (*blob_t) callconv(.c) void, .{ .name = "hb_blob_make_immutable" });
    const ret = cFn(arg_blob);
    return ret;
}
pub const blob_t = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_blob_get_type" });
        return cFn();
    }
};
pub fn bufferAdd(arg_buffer: *buffer_t, arg_codepoint: u32, arg_cluster: u32) void {
    const cFn = @extern(*const fn (*buffer_t, u32, u32) callconv(.c) void, .{ .name = "hb_buffer_add" });
    const ret = cFn(arg_buffer, arg_codepoint, arg_cluster);
    return ret;
}
pub fn bufferAddCodepoints(arg_buffer: *buffer_t, argS_text: []u32, arg_item_offset: u32, arg_item_length: i32) void {
    const arg_text: [*]u32 = @ptrCast(argS_text);
    const arg_text_length: i32 = @intCast((argS_text).len);
    const cFn = @extern(*const fn (*buffer_t, [*]u32, i32, u32, i32) callconv(.c) void, .{ .name = "hb_buffer_add_codepoints" });
    const ret = cFn(arg_buffer, arg_text, arg_text_length, arg_item_offset, arg_item_length);
    return ret;
}
pub fn bufferAddLatin1(arg_buffer: *buffer_t, argS_text: []u8, arg_item_offset: u32, arg_item_length: i32) void {
    const arg_text: [*]u8 = @ptrCast(argS_text);
    const arg_text_length: i32 = @intCast((argS_text).len);
    const cFn = @extern(*const fn (*buffer_t, [*]u8, i32, u32, i32) callconv(.c) void, .{ .name = "hb_buffer_add_latin1" });
    const ret = cFn(arg_buffer, arg_text, arg_text_length, arg_item_offset, arg_item_length);
    return ret;
}
pub fn bufferAddUtf16(arg_buffer: *buffer_t, argS_text: []u16, arg_item_offset: u32, arg_item_length: i32) void {
    const arg_text: [*]u16 = @ptrCast(argS_text);
    const arg_text_length: i32 = @intCast((argS_text).len);
    const cFn = @extern(*const fn (*buffer_t, [*]u16, i32, u32, i32) callconv(.c) void, .{ .name = "hb_buffer_add_utf16" });
    const ret = cFn(arg_buffer, arg_text, arg_text_length, arg_item_offset, arg_item_length);
    return ret;
}
pub fn bufferAddUtf32(arg_buffer: *buffer_t, argS_text: []u32, arg_item_offset: u32, arg_item_length: i32) void {
    const arg_text: [*]u32 = @ptrCast(argS_text);
    const arg_text_length: i32 = @intCast((argS_text).len);
    const cFn = @extern(*const fn (*buffer_t, [*]u32, i32, u32, i32) callconv(.c) void, .{ .name = "hb_buffer_add_utf32" });
    const ret = cFn(arg_buffer, arg_text, arg_text_length, arg_item_offset, arg_item_length);
    return ret;
}
pub fn bufferAddUtf8(arg_buffer: *buffer_t, argS_text: []u8, arg_item_offset: u32, arg_item_length: i32) void {
    const arg_text: [*]u8 = @ptrCast(argS_text);
    const arg_text_length: i32 = @intCast((argS_text).len);
    const cFn = @extern(*const fn (*buffer_t, [*]u8, i32, u32, i32) callconv(.c) void, .{ .name = "hb_buffer_add_utf8" });
    const ret = cFn(arg_buffer, arg_text, arg_text_length, arg_item_offset, arg_item_length);
    return ret;
}
pub fn bufferAllocationSuccessful(arg_buffer: *buffer_t) i32 {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) i32, .{ .name = "hb_buffer_allocation_successful" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferAppend(arg_buffer: *buffer_t, arg_source: *buffer_t, arg_start: u32, arg_end: u32) void {
    const cFn = @extern(*const fn (*buffer_t, *buffer_t, u32, u32) callconv(.c) void, .{ .name = "hb_buffer_append" });
    const ret = cFn(arg_buffer, arg_source, arg_start, arg_end);
    return ret;
}
pub fn bufferClearContents(arg_buffer: *buffer_t) void {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) void, .{ .name = "hb_buffer_clear_contents" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub const buffer_cluster_level_t = enum(u32) {
    monotone_graphemes = 0,
    monotone_characters = 1,
    characters = 2,
    pub const default: @This() = @enumFromInt(@as(u32, 0));
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_buffer_cluster_level_get_type" });
        return cFn();
    }
};
pub const buffer_content_type_t = enum(u32) {
    invalid = 0,
    unicode = 1,
    glyphs = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_buffer_content_type_get_type" });
        return cFn();
    }
};
pub fn bufferCreate() *buffer_t {
    const cFn = @extern(*const fn () callconv(.c) *buffer_t, .{ .name = "hb_buffer_create" });
    const ret = cFn();
    return ret;
}
pub fn bufferCreateSimilar(arg_src: *buffer_t) *buffer_t {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) *buffer_t, .{ .name = "hb_buffer_create_similar" });
    const ret = cFn(arg_src);
    return ret;
}
pub fn bufferDeserializeGlyphs(arg_buffer: *buffer_t, argS_buf: [][*:0]const u8, arg_font: ?*font_t, arg_format: buffer_serialize_format_t) struct {
    ret: i32,
    end_ptr: [*:0]u8,
} {
    const arg_buf: [*][*:0]const u8 = @ptrCast(argS_buf);
    const arg_buf_len: i32 = @intCast((argS_buf).len);
    var argO_end_ptr: ?[*:0]u8 = undefined;
    const arg_end_ptr: ?*[*:0]u8 = &argO_end_ptr;
    const cFn = @extern(*const fn (*buffer_t, [*][*:0]const u8, i32, ?*[*:0]u8, ?*font_t, buffer_serialize_format_t) callconv(.c) i32, .{ .name = "hb_buffer_deserialize_glyphs" });
    const ret = cFn(arg_buffer, arg_buf, arg_buf_len, arg_end_ptr, arg_font, arg_format);
    return .{ .ret = ret, .end_ptr = argO_end_ptr };
}
pub fn bufferDeserializeUnicode(arg_buffer: *buffer_t, argS_buf: [][*:0]const u8, arg_format: buffer_serialize_format_t) struct {
    ret: i32,
    end_ptr: [*:0]u8,
} {
    const arg_buf: [*][*:0]const u8 = @ptrCast(argS_buf);
    const arg_buf_len: i32 = @intCast((argS_buf).len);
    var argO_end_ptr: ?[*:0]u8 = undefined;
    const arg_end_ptr: ?*[*:0]u8 = &argO_end_ptr;
    const cFn = @extern(*const fn (*buffer_t, [*][*:0]const u8, i32, ?*[*:0]u8, buffer_serialize_format_t) callconv(.c) i32, .{ .name = "hb_buffer_deserialize_unicode" });
    const ret = cFn(arg_buffer, arg_buf, arg_buf_len, arg_end_ptr, arg_format);
    return .{ .ret = ret, .end_ptr = argO_end_ptr };
}
pub fn bufferDiff(arg_buffer: *buffer_t, arg_reference: *buffer_t, arg_dottedcircle_glyph: u32, arg_position_fuzz: u32) buffer_diff_flags_t {
    const cFn = @extern(*const fn (*buffer_t, *buffer_t, u32, u32) callconv(.c) buffer_diff_flags_t, .{ .name = "hb_buffer_diff" });
    const ret = cFn(arg_buffer, arg_reference, arg_dottedcircle_glyph, arg_position_fuzz);
    return ret;
}
pub const buffer_diff_flags_t = packed struct(u32) {
    content_type_mismatch: bool = false,
    length_mismatch: bool = false,
    notdef_present: bool = false,
    dotted_circle_present: bool = false,
    codepoint_mismatch: bool = false,
    cluster_mismatch: bool = false,
    glyph_flags_mismatch: bool = false,
    position_mismatch: bool = false,
    _: u24 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_buffer_diff_flags_get_type" });
        return cFn();
    }
};
pub const buffer_flags_t = packed struct(u32) {
    bot: bool = false,
    eot: bool = false,
    preserve_default_ignorables: bool = false,
    remove_default_ignorables: bool = false,
    do_not_insert_dotted_circle: bool = false,
    verify: bool = false,
    produce_unsafe_to_concat: bool = false,
    produce_safe_to_insert_tatweel: bool = false,
    _: u24 = 0,
    pub const defined: @This() = @bitCast(@as(u32, 255));
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_buffer_flags_get_type" });
        return cFn();
    }
};
pub fn bufferGetClusterLevel(arg_buffer: *buffer_t) buffer_cluster_level_t {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) buffer_cluster_level_t, .{ .name = "hb_buffer_get_cluster_level" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferGetContentType(arg_buffer: *buffer_t) buffer_content_type_t {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) buffer_content_type_t, .{ .name = "hb_buffer_get_content_type" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferGetDirection(arg_buffer: *buffer_t) direction_t {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) direction_t, .{ .name = "hb_buffer_get_direction" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferGetEmpty() *buffer_t {
    const cFn = @extern(*const fn () callconv(.c) *buffer_t, .{ .name = "hb_buffer_get_empty" });
    const ret = cFn();
    return ret;
}
pub fn bufferGetFlags(arg_buffer: *buffer_t) buffer_flags_t {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) buffer_flags_t, .{ .name = "hb_buffer_get_flags" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferGetGlyphInfos(arg_buffer: *buffer_t) []glyph_info_t {
    var argO_length: u32 = undefined;
    const arg_length: *u32 = &argO_length;
    const cFn = @extern(*const fn (*buffer_t, *u32) callconv(.c) [*]glyph_info_t, .{ .name = "hb_buffer_get_glyph_infos" });
    const ret = cFn(arg_buffer, arg_length);
    return ret[0..@intCast(argO_length)];
}
pub fn bufferGetGlyphPositions(arg_buffer: *buffer_t) []glyph_position_t {
    var argO_length: u32 = undefined;
    const arg_length: *u32 = &argO_length;
    const cFn = @extern(*const fn (*buffer_t, *u32) callconv(.c) [*]glyph_position_t, .{ .name = "hb_buffer_get_glyph_positions" });
    const ret = cFn(arg_buffer, arg_length);
    return ret[0..@intCast(argO_length)];
}
pub fn bufferGetInvisibleGlyph(arg_buffer: *buffer_t) u32 {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) u32, .{ .name = "hb_buffer_get_invisible_glyph" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferGetLanguage(arg_buffer: *buffer_t) *language_t {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) *language_t, .{ .name = "hb_buffer_get_language" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferGetLength(arg_buffer: *buffer_t) u32 {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) u32, .{ .name = "hb_buffer_get_length" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferGetNotFoundGlyph(arg_buffer: *buffer_t) u32 {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) u32, .{ .name = "hb_buffer_get_not_found_glyph" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferGetNotFoundVariationSelectorGlyph(arg_buffer: *buffer_t) u32 {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) u32, .{ .name = "hb_buffer_get_not_found_variation_selector_glyph" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferGetRandomState(arg_buffer: *buffer_t) u32 {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) u32, .{ .name = "hb_buffer_get_random_state" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferGetReplacementCodepoint(arg_buffer: *buffer_t) u32 {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) u32, .{ .name = "hb_buffer_get_replacement_codepoint" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferGetScript(arg_buffer: *buffer_t) script_t {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) script_t, .{ .name = "hb_buffer_get_script" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferGetSegmentProperties(arg_buffer: *buffer_t, arg_props: *segment_properties_t) void {
    const cFn = @extern(*const fn (*buffer_t, *segment_properties_t) callconv(.c) void, .{ .name = "hb_buffer_get_segment_properties" });
    const ret = cFn(arg_buffer, arg_props);
    return ret;
}
pub fn bufferGetUnicodeFuncs(arg_buffer: *buffer_t) *unicode_funcs_t {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) *unicode_funcs_t, .{ .name = "hb_buffer_get_unicode_funcs" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferGuessSegmentProperties(arg_buffer: *buffer_t) void {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) void, .{ .name = "hb_buffer_guess_segment_properties" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferHasPositions(arg_buffer: *buffer_t) i32 {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) i32, .{ .name = "hb_buffer_has_positions" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub const buffer_message_func_t = *const fn (arg_buffer: *buffer_t, arg_font: *font_t, arg_message: [*:0]const u8, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub fn bufferNormalizeGlyphs(arg_buffer: *buffer_t) void {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) void, .{ .name = "hb_buffer_normalize_glyphs" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferPreAllocate(arg_buffer: *buffer_t, arg_size: u32) i32 {
    const cFn = @extern(*const fn (*buffer_t, u32) callconv(.c) i32, .{ .name = "hb_buffer_pre_allocate" });
    const ret = cFn(arg_buffer, arg_size);
    return ret;
}
pub fn bufferReset(arg_buffer: *buffer_t) void {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) void, .{ .name = "hb_buffer_reset" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferReverse(arg_buffer: *buffer_t) void {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) void, .{ .name = "hb_buffer_reverse" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferReverseClusters(arg_buffer: *buffer_t) void {
    const cFn = @extern(*const fn (*buffer_t) callconv(.c) void, .{ .name = "hb_buffer_reverse_clusters" });
    const ret = cFn(arg_buffer);
    return ret;
}
pub fn bufferReverseRange(arg_buffer: *buffer_t, arg_start: u32, arg_end: u32) void {
    const cFn = @extern(*const fn (*buffer_t, u32, u32) callconv(.c) void, .{ .name = "hb_buffer_reverse_range" });
    const ret = cFn(arg_buffer, arg_start, arg_end);
    return ret;
}
pub fn bufferSerialize(arg_buffer: *buffer_t, arg_start: u32, arg_end: u32, arg_font: ?*font_t, arg_format: buffer_serialize_format_t, arg_flags: buffer_serialize_flags_t) struct {
    ret: u32,
    buf: []u8,
    buf_consumed: u32,
} {
    var argO_buf: [*]u8 = undefined;
    const arg_buf: *[*]u8 = &argO_buf;
    var argO_buf_size: u32 = undefined;
    const arg_buf_size: *u32 = &argO_buf_size;
    var argO_buf_consumed: u32 = undefined;
    const arg_buf_consumed: ?*u32 = &argO_buf_consumed;
    const cFn = @extern(*const fn (*buffer_t, u32, u32, *[*]u8, *u32, ?*u32, ?*font_t, buffer_serialize_format_t, buffer_serialize_flags_t) callconv(.c) u32, .{ .name = "hb_buffer_serialize" });
    const ret = cFn(arg_buffer, arg_start, arg_end, arg_buf, arg_buf_size, arg_buf_consumed, arg_font, arg_format, arg_flags);
    return .{ .ret = ret, .buf = argO_buf[0..@intCast(argO_buf_size)], .buf_consumed = argO_buf_consumed };
}
pub const buffer_serialize_flags_t = packed struct(u32) {
    no_clusters: bool = false,
    no_positions: bool = false,
    no_glyph_names: bool = false,
    glyph_extents: bool = false,
    glyph_flags: bool = false,
    no_advances: bool = false,
    _: u26 = 0,
    pub const defined: @This() = @bitCast(@as(u32, 63));
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_buffer_serialize_flags_get_type" });
        return cFn();
    }
};
pub fn bufferSerializeFormatFromString(argS_str: []u8) buffer_serialize_format_t {
    const arg_str: [*]u8 = @ptrCast(argS_str);
    const arg_len: i32 = @intCast((argS_str).len);
    const cFn = @extern(*const fn ([*]u8, i32) callconv(.c) buffer_serialize_format_t, .{ .name = "hb_buffer_serialize_format_from_string" });
    const ret = cFn(arg_str, arg_len);
    return ret;
}
pub const buffer_serialize_format_t = enum(u32) {
    text = 1413830740,
    json = 1246973774,
    invalid = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_buffer_serialize_format_get_type" });
        return cFn();
    }
};
pub fn bufferSerializeFormatToString(arg_format: buffer_serialize_format_t) [*:0]u8 {
    const cFn = @extern(*const fn (buffer_serialize_format_t) callconv(.c) [*:0]u8, .{ .name = "hb_buffer_serialize_format_to_string" });
    const ret = cFn(arg_format);
    return ret;
}
pub fn bufferSerializeGlyphs(arg_buffer: *buffer_t, arg_start: u32, arg_end: u32, arg_font: ?*font_t, arg_format: buffer_serialize_format_t, arg_flags: buffer_serialize_flags_t) struct {
    ret: u32,
    buf: []u8,
    buf_consumed: u32,
} {
    var argO_buf: [*]u8 = undefined;
    const arg_buf: *[*]u8 = &argO_buf;
    var argO_buf_size: u32 = undefined;
    const arg_buf_size: *u32 = &argO_buf_size;
    var argO_buf_consumed: u32 = undefined;
    const arg_buf_consumed: ?*u32 = &argO_buf_consumed;
    const cFn = @extern(*const fn (*buffer_t, u32, u32, *[*]u8, *u32, ?*u32, ?*font_t, buffer_serialize_format_t, buffer_serialize_flags_t) callconv(.c) u32, .{ .name = "hb_buffer_serialize_glyphs" });
    const ret = cFn(arg_buffer, arg_start, arg_end, arg_buf, arg_buf_size, arg_buf_consumed, arg_font, arg_format, arg_flags);
    return .{ .ret = ret, .buf = argO_buf[0..@intCast(argO_buf_size)], .buf_consumed = argO_buf_consumed };
}
pub fn bufferSerializeListFormats() [*]?[*:0]const u8 {
    const cFn = @extern(*const fn () callconv(.c) [*]?[*:0]const u8, .{ .name = "hb_buffer_serialize_list_formats" });
    const ret = cFn();
    return ret;
}
pub fn bufferSerializeUnicode(arg_buffer: *buffer_t, arg_start: u32, arg_end: u32, arg_format: buffer_serialize_format_t, arg_flags: buffer_serialize_flags_t) struct {
    ret: u32,
    buf: []u8,
    buf_consumed: u32,
} {
    var argO_buf: [*]u8 = undefined;
    const arg_buf: *[*]u8 = &argO_buf;
    var argO_buf_size: u32 = undefined;
    const arg_buf_size: *u32 = &argO_buf_size;
    var argO_buf_consumed: u32 = undefined;
    const arg_buf_consumed: ?*u32 = &argO_buf_consumed;
    const cFn = @extern(*const fn (*buffer_t, u32, u32, *[*]u8, *u32, ?*u32, buffer_serialize_format_t, buffer_serialize_flags_t) callconv(.c) u32, .{ .name = "hb_buffer_serialize_unicode" });
    const ret = cFn(arg_buffer, arg_start, arg_end, arg_buf, arg_buf_size, arg_buf_consumed, arg_format, arg_flags);
    return .{ .ret = ret, .buf = argO_buf[0..@intCast(argO_buf_size)], .buf_consumed = argO_buf_consumed };
}
pub fn bufferSetClusterLevel(arg_buffer: *buffer_t, arg_cluster_level: buffer_cluster_level_t) void {
    const cFn = @extern(*const fn (*buffer_t, buffer_cluster_level_t) callconv(.c) void, .{ .name = "hb_buffer_set_cluster_level" });
    const ret = cFn(arg_buffer, arg_cluster_level);
    return ret;
}
pub fn bufferSetContentType(arg_buffer: *buffer_t, arg_content_type: buffer_content_type_t) void {
    const cFn = @extern(*const fn (*buffer_t, buffer_content_type_t) callconv(.c) void, .{ .name = "hb_buffer_set_content_type" });
    const ret = cFn(arg_buffer, arg_content_type);
    return ret;
}
pub fn bufferSetDirection(arg_buffer: *buffer_t, arg_direction: direction_t) void {
    const cFn = @extern(*const fn (*buffer_t, direction_t) callconv(.c) void, .{ .name = "hb_buffer_set_direction" });
    const ret = cFn(arg_buffer, arg_direction);
    return ret;
}
pub fn bufferSetFlags(arg_buffer: *buffer_t, arg_flags: buffer_flags_t) void {
    const cFn = @extern(*const fn (*buffer_t, buffer_flags_t) callconv(.c) void, .{ .name = "hb_buffer_set_flags" });
    const ret = cFn(arg_buffer, arg_flags);
    return ret;
}
pub fn bufferSetInvisibleGlyph(arg_buffer: *buffer_t, arg_invisible: u32) void {
    const cFn = @extern(*const fn (*buffer_t, u32) callconv(.c) void, .{ .name = "hb_buffer_set_invisible_glyph" });
    const ret = cFn(arg_buffer, arg_invisible);
    return ret;
}
pub fn bufferSetLanguage(arg_buffer: *buffer_t, arg_language: *language_t) void {
    const cFn = @extern(*const fn (*buffer_t, *language_t) callconv(.c) void, .{ .name = "hb_buffer_set_language" });
    const ret = cFn(arg_buffer, arg_language);
    return ret;
}
pub fn bufferSetLength(arg_buffer: *buffer_t, arg_length: u32) i32 {
    const cFn = @extern(*const fn (*buffer_t, u32) callconv(.c) i32, .{ .name = "hb_buffer_set_length" });
    const ret = cFn(arg_buffer, arg_length);
    return ret;
}
pub fn bufferSetMessageFunc(arg_buffer: *buffer_t, argC_func: core.Closure(*const fn (arg_buffer: *buffer_t, arg_font: *font_t, arg_message: [*:0]const u8, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_buffer: *buffer_t, arg_font: *font_t, arg_message: [*:0]const u8, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*buffer_t, *const fn (arg_buffer: *buffer_t, arg_font: *font_t, arg_message: [*:0]const u8, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_buffer_set_message_func" });
    const ret = cFn(arg_buffer, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn bufferSetNotFoundGlyph(arg_buffer: *buffer_t, arg_not_found: u32) void {
    const cFn = @extern(*const fn (*buffer_t, u32) callconv(.c) void, .{ .name = "hb_buffer_set_not_found_glyph" });
    const ret = cFn(arg_buffer, arg_not_found);
    return ret;
}
pub fn bufferSetNotFoundVariationSelectorGlyph(arg_buffer: *buffer_t, arg_not_found_variation_selector: u32) void {
    const cFn = @extern(*const fn (*buffer_t, u32) callconv(.c) void, .{ .name = "hb_buffer_set_not_found_variation_selector_glyph" });
    const ret = cFn(arg_buffer, arg_not_found_variation_selector);
    return ret;
}
pub fn bufferSetRandomState(arg_buffer: *buffer_t, arg_state: u32) void {
    const cFn = @extern(*const fn (*buffer_t, u32) callconv(.c) void, .{ .name = "hb_buffer_set_random_state" });
    const ret = cFn(arg_buffer, arg_state);
    return ret;
}
pub fn bufferSetReplacementCodepoint(arg_buffer: *buffer_t, arg_replacement: u32) void {
    const cFn = @extern(*const fn (*buffer_t, u32) callconv(.c) void, .{ .name = "hb_buffer_set_replacement_codepoint" });
    const ret = cFn(arg_buffer, arg_replacement);
    return ret;
}
pub fn bufferSetScript(arg_buffer: *buffer_t, arg_script: script_t) void {
    const cFn = @extern(*const fn (*buffer_t, script_t) callconv(.c) void, .{ .name = "hb_buffer_set_script" });
    const ret = cFn(arg_buffer, arg_script);
    return ret;
}
pub fn bufferSetSegmentProperties(arg_buffer: *buffer_t, arg_props: *segment_properties_t) void {
    const cFn = @extern(*const fn (*buffer_t, *segment_properties_t) callconv(.c) void, .{ .name = "hb_buffer_set_segment_properties" });
    const ret = cFn(arg_buffer, arg_props);
    return ret;
}
pub fn bufferSetUnicodeFuncs(arg_buffer: *buffer_t, arg_unicode_funcs: *unicode_funcs_t) void {
    const cFn = @extern(*const fn (*buffer_t, *unicode_funcs_t) callconv(.c) void, .{ .name = "hb_buffer_set_unicode_funcs" });
    const ret = cFn(arg_buffer, arg_unicode_funcs);
    return ret;
}
pub const buffer_t = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_buffer_get_type" });
        return cFn();
    }
};
pub fn colorGetAlpha(arg_color: u32) u8 {
    const cFn = @extern(*const fn (u32) callconv(.c) u8, .{ .name = "hb_color_get_alpha" });
    const ret = cFn(arg_color);
    return ret;
}
pub fn colorGetBlue(arg_color: u32) u8 {
    const cFn = @extern(*const fn (u32) callconv(.c) u8, .{ .name = "hb_color_get_blue" });
    const ret = cFn(arg_color);
    return ret;
}
pub fn colorGetGreen(arg_color: u32) u8 {
    const cFn = @extern(*const fn (u32) callconv(.c) u8, .{ .name = "hb_color_get_green" });
    const ret = cFn(arg_color);
    return ret;
}
pub fn colorGetRed(arg_color: u32) u8 {
    const cFn = @extern(*const fn (u32) callconv(.c) u8, .{ .name = "hb_color_get_red" });
    const ret = cFn(arg_color);
    return ret;
}
pub fn colorLineGetColorStops(arg_color_line: *color_line_t, arg_start: u32, argS_color_stops: ?[]color_stop_t) struct {
    ret: u32,
    color_stops: ?[]color_stop_t,
} {
    const arg_color_stops: [*]color_stop_t = @ptrCast(argS_color_stops);
    var argO_count: u32 = undefined;
    const arg_count: ?*u32 = &argO_count;
    const cFn = @extern(*const fn (*color_line_t, u32, ?*u32, [*]color_stop_t) callconv(.c) u32, .{ .name = "hb_color_line_get_color_stops" });
    const ret = cFn(arg_color_line, arg_start, arg_count, arg_color_stops);
    return .{ .ret = ret, .color_stops = arg_color_stops[0..@intCast(argO_count)] };
}
pub const color_line_get_color_stops_func_t = *const fn (arg_color_line: *color_line_t, arg_color_line_data: ?*anyopaque, arg_start: u32, arg_count: ?*u32, arg_color_stops: [*]color_stop_t, arg_user_data: ?*anyopaque) callconv(.c) u32;
pub fn colorLineGetExtend(arg_color_line: *color_line_t) paint_extend_t {
    const cFn = @extern(*const fn (*color_line_t) callconv(.c) paint_extend_t, .{ .name = "hb_color_line_get_extend" });
    const ret = cFn(arg_color_line);
    return ret;
}
pub const color_line_get_extend_func_t = *const fn (arg_color_line: *color_line_t, arg_color_line_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) paint_extend_t;
pub const color_line_t = extern struct {
    data: ?*anyopaque,
    get_color_stops: ?*const fn (arg_color_line: *color_line_t, arg_color_line_data: ?*anyopaque, arg_start: u32, arg_count: ?*u32, arg_color_stops: [*]color_stop_t, arg_user_data: ?*anyopaque) callconv(.c) u32,
    get_color_stops_user_data: ?*anyopaque,
    get_extend: ?*const fn (arg_color_line: *color_line_t, arg_color_line_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) paint_extend_t,
    get_extend_user_data: ?*anyopaque,
    reserved0: ?*anyopaque,
    reserved1: ?*anyopaque,
    reserved2: ?*anyopaque,
    reserved3: ?*anyopaque,
    reserved5: ?*anyopaque,
    reserved6: ?*anyopaque,
    reserved7: ?*anyopaque,
    reserved8: ?*anyopaque,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_color_line_get_type" });
        return cFn();
    }
};
pub const color_stop_t = extern struct {
    offset: f32,
    is_foreground: i32,
    color: u32,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_color_stop_get_type" });
        return cFn();
    }
};
pub const destroy_func_t = *const fn (arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn directionFromString(argS_str: []u8) direction_t {
    const arg_str: [*]u8 = @ptrCast(argS_str);
    const arg_len: i32 = @intCast((argS_str).len);
    const cFn = @extern(*const fn ([*]u8, i32) callconv(.c) direction_t, .{ .name = "hb_direction_from_string" });
    const ret = cFn(arg_str, arg_len);
    return ret;
}
pub const direction_t = enum(u32) {
    invalid = 0,
    ltr = 4,
    rtl = 5,
    ttb = 6,
    btt = 7,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_direction_get_type" });
        return cFn();
    }
};
pub fn directionToString(arg_direction: direction_t) [*:0]u8 {
    const cFn = @extern(*const fn (direction_t) callconv(.c) [*:0]u8, .{ .name = "hb_direction_to_string" });
    const ret = cFn(arg_direction);
    return ret;
}
pub fn drawClosePath(arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t) void {
    const cFn = @extern(*const fn (*draw_funcs_t, ?*anyopaque, *draw_state_t) callconv(.c) void, .{ .name = "hb_draw_close_path" });
    const ret = cFn(arg_dfuncs, @ptrCast(arg_draw_data), arg_st);
    return ret;
}
pub const draw_close_path_func_t = *const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn drawCubicTo(arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_control1_x: f32, arg_control1_y: f32, arg_control2_x: f32, arg_control2_y: f32, arg_to_x: f32, arg_to_y: f32) void {
    const cFn = @extern(*const fn (*draw_funcs_t, ?*anyopaque, *draw_state_t, f32, f32, f32, f32, f32, f32) callconv(.c) void, .{ .name = "hb_draw_cubic_to" });
    const ret = cFn(arg_dfuncs, @ptrCast(arg_draw_data), arg_st, arg_control1_x, arg_control1_y, arg_control2_x, arg_control2_y, arg_to_x, arg_to_y);
    return ret;
}
pub const draw_cubic_to_func_t = *const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_control1_x: f32, arg_control1_y: f32, arg_control2_x: f32, arg_control2_y: f32, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn drawFuncsCreate() *draw_funcs_t {
    const cFn = @extern(*const fn () callconv(.c) *draw_funcs_t, .{ .name = "hb_draw_funcs_create" });
    const ret = cFn();
    return ret;
}
pub fn drawFuncsGetEmpty() *draw_funcs_t {
    const cFn = @extern(*const fn () callconv(.c) *draw_funcs_t, .{ .name = "hb_draw_funcs_get_empty" });
    const ret = cFn();
    return ret;
}
pub fn drawFuncsIsImmutable(arg_dfuncs: *draw_funcs_t) i32 {
    const cFn = @extern(*const fn (*draw_funcs_t) callconv(.c) i32, .{ .name = "hb_draw_funcs_is_immutable" });
    const ret = cFn(arg_dfuncs);
    return ret;
}
pub fn drawFuncsMakeImmutable(arg_dfuncs: *draw_funcs_t) void {
    const cFn = @extern(*const fn (*draw_funcs_t) callconv(.c) void, .{ .name = "hb_draw_funcs_make_immutable" });
    const ret = cFn(arg_dfuncs);
    return ret;
}
pub fn drawFuncsSetClosePathFunc(arg_dfuncs: *draw_funcs_t, argC_func: core.Closure(*const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*draw_funcs_t, *const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_draw_funcs_set_close_path_func" });
    const ret = cFn(arg_dfuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn drawFuncsSetCubicToFunc(arg_dfuncs: *draw_funcs_t, argC_func: core.Closure(*const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_control1_x: f32, arg_control1_y: f32, arg_control2_x: f32, arg_control2_y: f32, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_control1_x: f32, arg_control1_y: f32, arg_control2_x: f32, arg_control2_y: f32, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*draw_funcs_t, *const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_control1_x: f32, arg_control1_y: f32, arg_control2_x: f32, arg_control2_y: f32, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_draw_funcs_set_cubic_to_func" });
    const ret = cFn(arg_dfuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn drawFuncsSetLineToFunc(arg_dfuncs: *draw_funcs_t, argC_func: core.Closure(*const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*draw_funcs_t, *const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_draw_funcs_set_line_to_func" });
    const ret = cFn(arg_dfuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn drawFuncsSetMoveToFunc(arg_dfuncs: *draw_funcs_t, argC_func: core.Closure(*const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*draw_funcs_t, *const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_draw_funcs_set_move_to_func" });
    const ret = cFn(arg_dfuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn drawFuncsSetQuadraticToFunc(arg_dfuncs: *draw_funcs_t, argC_func: core.Closure(*const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_control_x: f32, arg_control_y: f32, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_control_x: f32, arg_control_y: f32, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*draw_funcs_t, *const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_control_x: f32, arg_control_y: f32, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_draw_funcs_set_quadratic_to_func" });
    const ret = cFn(arg_dfuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub const draw_funcs_t = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_draw_funcs_get_type" });
        return cFn();
    }
};
pub fn drawLineTo(arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_to_x: f32, arg_to_y: f32) void {
    const cFn = @extern(*const fn (*draw_funcs_t, ?*anyopaque, *draw_state_t, f32, f32) callconv(.c) void, .{ .name = "hb_draw_line_to" });
    const ret = cFn(arg_dfuncs, @ptrCast(arg_draw_data), arg_st, arg_to_x, arg_to_y);
    return ret;
}
pub const draw_line_to_func_t = *const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn drawMoveTo(arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_to_x: f32, arg_to_y: f32) void {
    const cFn = @extern(*const fn (*draw_funcs_t, ?*anyopaque, *draw_state_t, f32, f32) callconv(.c) void, .{ .name = "hb_draw_move_to" });
    const ret = cFn(arg_dfuncs, @ptrCast(arg_draw_data), arg_st, arg_to_x, arg_to_y);
    return ret;
}
pub const draw_move_to_func_t = *const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn drawQuadraticTo(arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_control_x: f32, arg_control_y: f32, arg_to_x: f32, arg_to_y: f32) void {
    const cFn = @extern(*const fn (*draw_funcs_t, ?*anyopaque, *draw_state_t, f32, f32, f32, f32) callconv(.c) void, .{ .name = "hb_draw_quadratic_to" });
    const ret = cFn(arg_dfuncs, @ptrCast(arg_draw_data), arg_st, arg_control_x, arg_control_y, arg_to_x, arg_to_y);
    return ret;
}
pub const draw_quadratic_to_func_t = *const fn (arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_st: *draw_state_t, arg_control_x: f32, arg_control_y: f32, arg_to_x: f32, arg_to_y: f32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const draw_state_t = extern struct {
    path_open: i32,
    path_start_x: f32,
    path_start_y: f32,
    current_x: f32,
    current_y: f32,
    reserved1: var_num_t,
    reserved2: var_num_t,
    reserved3: var_num_t,
    reserved4: var_num_t,
    reserved5: var_num_t,
    reserved6: var_num_t,
    reserved7: var_num_t,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_draw_state_get_type" });
        return cFn();
    }
};
pub fn faceBuilderAddTable(arg_face: *face_t, arg_tag: u32, arg_blob: *blob_t) i32 {
    const cFn = @extern(*const fn (*face_t, u32, *blob_t) callconv(.c) i32, .{ .name = "hb_face_builder_add_table" });
    const ret = cFn(arg_face, arg_tag, arg_blob);
    return ret;
}
pub fn faceBuilderCreate() *face_t {
    const cFn = @extern(*const fn () callconv(.c) *face_t, .{ .name = "hb_face_builder_create" });
    const ret = cFn();
    return ret;
}
pub fn faceBuilderSortTables(arg_face: *face_t, arg_tags: [*:0]u32) void {
    const cFn = @extern(*const fn (*face_t, [*:0]u32) callconv(.c) void, .{ .name = "hb_face_builder_sort_tables" });
    const ret = cFn(arg_face, arg_tags);
    return ret;
}
pub fn faceCollectNominalGlyphMapping(arg_face: *face_t, arg_mapping: *map_t, arg_unicodes: *set_t) void {
    const cFn = @extern(*const fn (*face_t, *map_t, *set_t) callconv(.c) void, .{ .name = "hb_face_collect_nominal_glyph_mapping" });
    const ret = cFn(arg_face, arg_mapping, arg_unicodes);
    return ret;
}
pub fn faceCollectUnicodes(arg_face: *face_t, arg_out: *set_t) void {
    const cFn = @extern(*const fn (*face_t, *set_t) callconv(.c) void, .{ .name = "hb_face_collect_unicodes" });
    const ret = cFn(arg_face, arg_out);
    return ret;
}
pub fn faceCollectVariationSelectors(arg_face: *face_t, arg_out: *set_t) void {
    const cFn = @extern(*const fn (*face_t, *set_t) callconv(.c) void, .{ .name = "hb_face_collect_variation_selectors" });
    const ret = cFn(arg_face, arg_out);
    return ret;
}
pub fn faceCollectVariationUnicodes(arg_face: *face_t, arg_variation_selector: u32, arg_out: *set_t) void {
    const cFn = @extern(*const fn (*face_t, u32, *set_t) callconv(.c) void, .{ .name = "hb_face_collect_variation_unicodes" });
    const ret = cFn(arg_face, arg_variation_selector, arg_out);
    return ret;
}
pub fn faceCount(arg_blob: *blob_t) u32 {
    const cFn = @extern(*const fn (*blob_t) callconv(.c) u32, .{ .name = "hb_face_count" });
    const ret = cFn(arg_blob);
    return ret;
}
pub fn faceCreate(arg_blob: *blob_t, arg_index: u32) *face_t {
    const cFn = @extern(*const fn (*blob_t, u32) callconv(.c) *face_t, .{ .name = "hb_face_create" });
    const ret = cFn(arg_blob, arg_index);
    return ret;
}
pub fn faceCreateForTables(argC_reference_table_func: core.Closure(*const fn (arg_face: *face_t, arg_tag: u32, arg_user_data: ?*anyopaque) callconv(.c) *blob_t)) *face_t {
    const arg_reference_table_func: *const fn (arg_face: *face_t, arg_tag: u32, arg_user_data: ?*anyopaque) callconv(.c) *blob_t = @ptrCast(argC_reference_table_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_reference_table_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_reference_table_func.destroy());
    const cFn = @extern(*const fn (*const fn (arg_face: *face_t, arg_tag: u32, arg_user_data: ?*anyopaque) callconv(.c) *blob_t, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) *face_t, .{ .name = "hb_face_create_for_tables" });
    const ret = cFn(arg_reference_table_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn faceCreateFromFileOrFail(arg_file_name: [*:0]const u8, arg_index: u32) *face_t {
    const cFn = @extern(*const fn ([*:0]const u8, u32) callconv(.c) *face_t, .{ .name = "hb_face_create_from_file_or_fail" });
    const ret = cFn(arg_file_name, arg_index);
    return ret;
}
pub fn faceCreateOrFail(arg_blob: *blob_t, arg_index: u32) *face_t {
    const cFn = @extern(*const fn (*blob_t, u32) callconv(.c) *face_t, .{ .name = "hb_face_create_or_fail" });
    const ret = cFn(arg_blob, arg_index);
    return ret;
}
pub fn faceGetEmpty() *face_t {
    const cFn = @extern(*const fn () callconv(.c) *face_t, .{ .name = "hb_face_get_empty" });
    const ret = cFn();
    return ret;
}
pub fn faceGetGlyphCount(arg_face: *face_t) u32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) u32, .{ .name = "hb_face_get_glyph_count" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn faceGetIndex(arg_face: *face_t) u32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) u32, .{ .name = "hb_face_get_index" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn faceGetTableTags(arg_face: *face_t, arg_start_offset: u32) struct {
    ret: u32,
    table_tags: []u32,
} {
    var argO_table_count: u32 = undefined;
    const arg_table_count: *u32 = &argO_table_count;
    var argO_table_tags: [*]u32 = undefined;
    const arg_table_tags: *[*]u32 = &argO_table_tags;
    const cFn = @extern(*const fn (*face_t, u32, *u32, *[*]u32) callconv(.c) u32, .{ .name = "hb_face_get_table_tags" });
    const ret = cFn(arg_face, arg_start_offset, arg_table_count, arg_table_tags);
    return .{ .ret = ret, .table_tags = argO_table_tags[0..@intCast(argO_table_count)] };
}
pub fn faceGetUpem(arg_face: *face_t) u32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) u32, .{ .name = "hb_face_get_upem" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn faceIsImmutable(arg_face: *face_t) i32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) i32, .{ .name = "hb_face_is_immutable" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn faceMakeImmutable(arg_face: *face_t) void {
    const cFn = @extern(*const fn (*face_t) callconv(.c) void, .{ .name = "hb_face_make_immutable" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn faceReferenceBlob(arg_face: *face_t) *blob_t {
    const cFn = @extern(*const fn (*face_t) callconv(.c) *blob_t, .{ .name = "hb_face_reference_blob" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn faceReferenceTable(arg_face: *face_t, arg_tag: u32) *blob_t {
    const cFn = @extern(*const fn (*face_t, u32) callconv(.c) *blob_t, .{ .name = "hb_face_reference_table" });
    const ret = cFn(arg_face, arg_tag);
    return ret;
}
pub fn faceSetGetTableTagsFunc(arg_face: *face_t, argC_func: core.Closure(*const fn (arg_face: *face_t, arg_start_offset: u32, arg_table_count: *u32, arg_table_tags: *[*]u32, arg_user_data: ?*anyopaque) callconv(.c) u32)) void {
    const arg_func: *const fn (arg_face: *face_t, arg_start_offset: u32, arg_table_count: *u32, arg_table_tags: *[*]u32, arg_user_data: ?*anyopaque) callconv(.c) u32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*face_t, *const fn (arg_face: *face_t, arg_start_offset: u32, arg_table_count: *u32, arg_table_tags: *[*]u32, arg_user_data: ?*anyopaque) callconv(.c) u32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_face_set_get_table_tags_func" });
    const ret = cFn(arg_face, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn faceSetGlyphCount(arg_face: *face_t, arg_glyph_count: u32) void {
    const cFn = @extern(*const fn (*face_t, u32) callconv(.c) void, .{ .name = "hb_face_set_glyph_count" });
    const ret = cFn(arg_face, arg_glyph_count);
    return ret;
}
pub fn faceSetIndex(arg_face: *face_t, arg_index: u32) void {
    const cFn = @extern(*const fn (*face_t, u32) callconv(.c) void, .{ .name = "hb_face_set_index" });
    const ret = cFn(arg_face, arg_index);
    return ret;
}
pub fn faceSetUpem(arg_face: *face_t, arg_upem: u32) void {
    const cFn = @extern(*const fn (*face_t, u32) callconv(.c) void, .{ .name = "hb_face_set_upem" });
    const ret = cFn(arg_face, arg_upem);
    return ret;
}
pub const face_t = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_face_get_type" });
        return cFn();
    }
};
pub fn featureFromString(argS_str: []u8, arg_feature: *feature_t) i32 {
    const arg_str: [*]u8 = @ptrCast(argS_str);
    const arg_len: i32 = @intCast((argS_str).len);
    const cFn = @extern(*const fn ([*]u8, i32, *feature_t) callconv(.c) i32, .{ .name = "hb_feature_from_string" });
    const ret = cFn(arg_str, arg_len, arg_feature);
    return ret;
}
pub const feature_t = extern struct {
    tag: u32,
    value: u32,
    start: u32,
    end: u32,
    pub fn _string(self: *feature_t) [][*:0]const u8 {
        var argO_buf: [*][*:0]const u8 = undefined;
        const arg_buf: *[*][*:0]const u8 = &argO_buf;
        var argO_size: u32 = undefined;
        const arg_size: *u32 = &argO_size;
        const cFn = @extern(*const fn (*feature_t, *[*][*:0]const u8, *u32) callconv(.c) void, .{ .name = "hb_feature_to_string" });
        const ret = cFn(self, arg_buf, arg_size);
        _ = ret;
        return argO_buf[0..@intCast(argO_size)];
    }
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_feature_get_type" });
        return cFn();
    }
};
pub fn featureToString(arg_feature: *feature_t) [][*:0]const u8 {
    var argO_buf: [*][*:0]const u8 = undefined;
    const arg_buf: *[*][*:0]const u8 = &argO_buf;
    var argO_size: u32 = undefined;
    const arg_size: *u32 = &argO_size;
    const cFn = @extern(*const fn (*feature_t, *[*][*:0]const u8, *u32) callconv(.c) void, .{ .name = "hb_feature_to_string" });
    const ret = cFn(arg_feature, arg_buf, arg_size);
    _ = ret;
    return argO_buf[0..@intCast(argO_size)];
}
pub fn fontAddGlyphOriginForDirection(arg_font: *font_t, arg_glyph: u32, arg_direction: direction_t, arg_x: *i32, arg_y: *i32) void {
    const cFn = @extern(*const fn (*font_t, u32, direction_t, *i32, *i32) callconv(.c) void, .{ .name = "hb_font_add_glyph_origin_for_direction" });
    const ret = cFn(arg_font, arg_glyph, arg_direction, arg_x, arg_y);
    return ret;
}
pub fn fontChanged(arg_font: *font_t) void {
    const cFn = @extern(*const fn (*font_t) callconv(.c) void, .{ .name = "hb_font_changed" });
    const ret = cFn(arg_font);
    return ret;
}
pub fn fontCreate(arg_face: *face_t) *font_t {
    const cFn = @extern(*const fn (*face_t) callconv(.c) *font_t, .{ .name = "hb_font_create" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn fontCreateSubFont(arg_parent: *font_t) *font_t {
    const cFn = @extern(*const fn (*font_t) callconv(.c) *font_t, .{ .name = "hb_font_create_sub_font" });
    const ret = cFn(arg_parent);
    return ret;
}
pub fn fontDrawGlyph(arg_font: *font_t, arg_glyph: u32, arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*font_t, u32, *draw_funcs_t, ?*anyopaque) callconv(.c) void, .{ .name = "hb_font_draw_glyph" });
    const ret = cFn(arg_font, arg_glyph, arg_dfuncs, @ptrCast(arg_draw_data));
    return ret;
}
pub const font_draw_glyph_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_draw_funcs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const font_extents_t = extern struct {
    ascender: i32,
    descender: i32,
    line_gap: i32,
    reserved9: i32,
    reserved8: i32,
    reserved7: i32,
    reserved6: i32,
    reserved5: i32,
    reserved4: i32,
    reserved3: i32,
    reserved2: i32,
    reserved1: i32,
};
pub fn fontFuncsCreate() *font_funcs_t {
    const cFn = @extern(*const fn () callconv(.c) *font_funcs_t, .{ .name = "hb_font_funcs_create" });
    const ret = cFn();
    return ret;
}
pub fn fontFuncsGetEmpty() *font_funcs_t {
    const cFn = @extern(*const fn () callconv(.c) *font_funcs_t, .{ .name = "hb_font_funcs_get_empty" });
    const ret = cFn();
    return ret;
}
pub fn fontFuncsIsImmutable(arg_ffuncs: *font_funcs_t) i32 {
    const cFn = @extern(*const fn (*font_funcs_t) callconv(.c) i32, .{ .name = "hb_font_funcs_is_immutable" });
    const ret = cFn(arg_ffuncs);
    return ret;
}
pub fn fontFuncsMakeImmutable(arg_ffuncs: *font_funcs_t) void {
    const cFn = @extern(*const fn (*font_funcs_t) callconv(.c) void, .{ .name = "hb_font_funcs_make_immutable" });
    const ret = cFn(arg_ffuncs);
    return ret;
}
pub fn fontFuncsSetDrawGlyphFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_draw_funcs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_draw_funcs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_draw_funcs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_draw_glyph_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetFontHExtentsFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_extents: *font_extents_t, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_extents: *font_extents_t, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_extents: *font_extents_t, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_font_h_extents_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetFontVExtentsFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_extents: *font_extents_t, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_extents: *font_extents_t, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_extents: *font_extents_t, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_font_v_extents_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetGlyphContourPointFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_point_index: u32, arg_x: *i32, arg_y: *i32, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_point_index: u32, arg_x: *i32, arg_y: *i32, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_point_index: u32, arg_x: *i32, arg_y: *i32, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_glyph_contour_point_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetGlyphExtentsFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_extents: *glyph_extents_t, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_extents: *glyph_extents_t, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_extents: *glyph_extents_t, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_glyph_extents_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetGlyphFromNameFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_name: [*][*:0]const u8, arg_len: i32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_name: [*][*:0]const u8, arg_len: i32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_name: [*][*:0]const u8, arg_len: i32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_glyph_from_name_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetGlyphFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_unicode: u32, arg_variation_selector: u32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_unicode: u32, arg_variation_selector: u32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_unicode: u32, arg_variation_selector: u32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_glyph_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetGlyphHAdvanceFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_glyph_h_advance_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetGlyphHAdvancesFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_count: u32, arg_first_glyph: *u32, arg_glyph_stride: u32, arg_first_advance: *i32, arg_advance_stride: u32, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_count: u32, arg_first_glyph: *u32, arg_glyph_stride: u32, arg_first_advance: *i32, arg_advance_stride: u32, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_count: u32, arg_first_glyph: *u32, arg_glyph_stride: u32, arg_first_advance: *i32, arg_advance_stride: u32, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_glyph_h_advances_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetGlyphHKerningFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_first_glyph: u32, arg_second_glyph: u32, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_first_glyph: u32, arg_second_glyph: u32, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_first_glyph: u32, arg_second_glyph: u32, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_glyph_h_kerning_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetGlyphHOriginFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_x: *i32, arg_y: *i32, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_x: *i32, arg_y: *i32, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_x: *i32, arg_y: *i32, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_glyph_h_origin_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetGlyphNameFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_name: *[*][*:0]const u8, arg_size: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_name: *[*][*:0]const u8, arg_size: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_name: *[*][*:0]const u8, arg_size: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_glyph_name_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetGlyphShapeFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_draw_funcs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_draw_funcs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_draw_funcs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_glyph_shape_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetGlyphVAdvanceFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_glyph_v_advance_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetGlyphVAdvancesFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_count: u32, arg_first_glyph: *u32, arg_glyph_stride: u32, arg_first_advance: *i32, arg_advance_stride: u32, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_count: u32, arg_first_glyph: *u32, arg_glyph_stride: u32, arg_first_advance: *i32, arg_advance_stride: u32, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_count: u32, arg_first_glyph: *u32, arg_glyph_stride: u32, arg_first_advance: *i32, arg_advance_stride: u32, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_glyph_v_advances_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetGlyphVKerningFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_first_glyph: u32, arg_second_glyph: u32, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_first_glyph: u32, arg_second_glyph: u32, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_first_glyph: u32, arg_second_glyph: u32, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_glyph_v_kerning_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetGlyphVOriginFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_x: *i32, arg_y: *i32, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_x: *i32, arg_y: *i32, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_x: *i32, arg_y: *i32, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_glyph_v_origin_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetNominalGlyphFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_unicode: u32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_unicode: u32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_unicode: u32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_nominal_glyph_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetNominalGlyphsFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_count: u32, arg_first_unicode: *u32, arg_unicode_stride: u32, arg_first_glyph: *u32, arg_glyph_stride: u32, arg_user_data: ?*anyopaque) callconv(.c) u32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_count: u32, arg_first_unicode: *u32, arg_unicode_stride: u32, arg_first_glyph: *u32, arg_glyph_stride: u32, arg_user_data: ?*anyopaque) callconv(.c) u32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_count: u32, arg_first_unicode: *u32, arg_unicode_stride: u32, arg_first_glyph: *u32, arg_glyph_stride: u32, arg_user_data: ?*anyopaque) callconv(.c) u32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_nominal_glyphs_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetPaintGlyphFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_paint_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_palette_index: u32, arg_foreground: u32, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_paint_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_palette_index: u32, arg_foreground: u32, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_paint_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_palette_index: u32, arg_foreground: u32, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_paint_glyph_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn fontFuncsSetVariationGlyphFunc(arg_ffuncs: *font_funcs_t, argC_func: core.Closure(*const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_unicode: u32, arg_variation_selector: u32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_unicode: u32, arg_variation_selector: u32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*font_funcs_t, *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_unicode: u32, arg_variation_selector: u32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_font_funcs_set_variation_glyph_func" });
    const ret = cFn(arg_ffuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub const font_funcs_t = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_font_funcs_get_type" });
        return cFn();
    }
};
pub fn fontGetEmpty() *font_t {
    const cFn = @extern(*const fn () callconv(.c) *font_t, .{ .name = "hb_font_get_empty" });
    const ret = cFn();
    return ret;
}
pub fn fontGetExtentsForDirection(arg_font: *font_t, arg_direction: direction_t, arg_extents: *font_extents_t) void {
    const cFn = @extern(*const fn (*font_t, direction_t, *font_extents_t) callconv(.c) void, .{ .name = "hb_font_get_extents_for_direction" });
    const ret = cFn(arg_font, arg_direction, arg_extents);
    return ret;
}
pub fn fontGetFace(arg_font: *font_t) *face_t {
    const cFn = @extern(*const fn (*font_t) callconv(.c) *face_t, .{ .name = "hb_font_get_face" });
    const ret = cFn(arg_font);
    return ret;
}
pub const font_get_font_extents_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_extents: *font_extents_t, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub fn fontGetGlyph(arg_font: *font_t, arg_unicode: u32, arg_variation_selector: u32) struct {
    ret: i32,
    glyph: u32,
} {
    var argO_glyph: u32 = undefined;
    const arg_glyph: *u32 = &argO_glyph;
    const cFn = @extern(*const fn (*font_t, u32, u32, *u32) callconv(.c) i32, .{ .name = "hb_font_get_glyph" });
    const ret = cFn(arg_font, arg_unicode, arg_variation_selector, arg_glyph);
    return .{ .ret = ret, .glyph = argO_glyph };
}
pub fn fontGetGlyphAdvanceForDirection(arg_font: *font_t, arg_glyph: u32, arg_direction: direction_t) struct {
    x: i32,
    y: i32,
} {
    var argO_x: i32 = undefined;
    const arg_x: *i32 = &argO_x;
    var argO_y: i32 = undefined;
    const arg_y: *i32 = &argO_y;
    const cFn = @extern(*const fn (*font_t, u32, direction_t, *i32, *i32) callconv(.c) void, .{ .name = "hb_font_get_glyph_advance_for_direction" });
    const ret = cFn(arg_font, arg_glyph, arg_direction, arg_x, arg_y);
    _ = ret;
    return .{ .x = argO_x, .y = argO_y };
}
pub const font_get_glyph_advance_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub fn fontGetGlyphAdvancesForDirection(arg_font: *font_t, arg_direction: direction_t, arg_count: u32, arg_first_glyph: *u32, arg_glyph_stride: u32) struct {
    first_advance: i32,
    advance_stride: u32,
} {
    var argO_first_advance: i32 = undefined;
    const arg_first_advance: *i32 = &argO_first_advance;
    var argO_advance_stride: u32 = undefined;
    const arg_advance_stride: *u32 = &argO_advance_stride;
    const cFn = @extern(*const fn (*font_t, direction_t, u32, *u32, u32, *i32, *u32) callconv(.c) void, .{ .name = "hb_font_get_glyph_advances_for_direction" });
    const ret = cFn(arg_font, arg_direction, arg_count, arg_first_glyph, arg_glyph_stride, arg_first_advance, arg_advance_stride);
    _ = ret;
    return .{ .first_advance = argO_first_advance, .advance_stride = argO_advance_stride };
}
pub const font_get_glyph_advances_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_count: u32, arg_first_glyph: *u32, arg_glyph_stride: u32, arg_first_advance: *i32, arg_advance_stride: u32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn fontGetGlyphContourPoint(arg_font: *font_t, arg_glyph: u32, arg_point_index: u32) struct {
    ret: i32,
    x: i32,
    y: i32,
} {
    var argO_x: i32 = undefined;
    const arg_x: *i32 = &argO_x;
    var argO_y: i32 = undefined;
    const arg_y: *i32 = &argO_y;
    const cFn = @extern(*const fn (*font_t, u32, u32, *i32, *i32) callconv(.c) i32, .{ .name = "hb_font_get_glyph_contour_point" });
    const ret = cFn(arg_font, arg_glyph, arg_point_index, arg_x, arg_y);
    return .{ .ret = ret, .x = argO_x, .y = argO_y };
}
pub fn fontGetGlyphContourPointForOrigin(arg_font: *font_t, arg_glyph: u32, arg_point_index: u32, arg_direction: direction_t) struct {
    ret: i32,
    x: i32,
    y: i32,
} {
    var argO_x: i32 = undefined;
    const arg_x: *i32 = &argO_x;
    var argO_y: i32 = undefined;
    const arg_y: *i32 = &argO_y;
    const cFn = @extern(*const fn (*font_t, u32, u32, direction_t, *i32, *i32) callconv(.c) i32, .{ .name = "hb_font_get_glyph_contour_point_for_origin" });
    const ret = cFn(arg_font, arg_glyph, arg_point_index, arg_direction, arg_x, arg_y);
    return .{ .ret = ret, .x = argO_x, .y = argO_y };
}
pub const font_get_glyph_contour_point_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_point_index: u32, arg_x: *i32, arg_y: *i32, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub fn fontGetGlyphExtents(arg_font: *font_t, arg_glyph: u32, arg_extents: *glyph_extents_t) i32 {
    const cFn = @extern(*const fn (*font_t, u32, *glyph_extents_t) callconv(.c) i32, .{ .name = "hb_font_get_glyph_extents" });
    const ret = cFn(arg_font, arg_glyph, arg_extents);
    return ret;
}
pub fn fontGetGlyphExtentsForOrigin(arg_font: *font_t, arg_glyph: u32, arg_direction: direction_t, arg_extents: *glyph_extents_t) i32 {
    const cFn = @extern(*const fn (*font_t, u32, direction_t, *glyph_extents_t) callconv(.c) i32, .{ .name = "hb_font_get_glyph_extents_for_origin" });
    const ret = cFn(arg_font, arg_glyph, arg_direction, arg_extents);
    return ret;
}
pub const font_get_glyph_extents_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_extents: *glyph_extents_t, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub fn fontGetGlyphFromName(arg_font: *font_t, argS_name: [][*:0]const u8) struct {
    ret: i32,
    glyph: u32,
} {
    const arg_name: [*][*:0]const u8 = @ptrCast(argS_name);
    const arg_len: i32 = @intCast((argS_name).len);
    var argO_glyph: u32 = undefined;
    const arg_glyph: *u32 = &argO_glyph;
    const cFn = @extern(*const fn (*font_t, [*][*:0]const u8, i32, *u32) callconv(.c) i32, .{ .name = "hb_font_get_glyph_from_name" });
    const ret = cFn(arg_font, arg_name, arg_len, arg_glyph);
    return .{ .ret = ret, .glyph = argO_glyph };
}
pub const font_get_glyph_from_name_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_name: [*][*:0]const u8, arg_len: i32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub const font_get_glyph_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_unicode: u32, arg_variation_selector: u32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub fn fontGetGlyphHAdvance(arg_font: *font_t, arg_glyph: u32) i32 {
    const cFn = @extern(*const fn (*font_t, u32) callconv(.c) i32, .{ .name = "hb_font_get_glyph_h_advance" });
    const ret = cFn(arg_font, arg_glyph);
    return ret;
}
pub fn fontGetGlyphHAdvances(arg_font: *font_t, arg_count: u32, arg_first_glyph: *u32, arg_glyph_stride: u32, arg_advance_stride: u32) i32 {
    var argO_first_advance: i32 = undefined;
    const arg_first_advance: *i32 = &argO_first_advance;
    const cFn = @extern(*const fn (*font_t, u32, *u32, u32, *i32, u32) callconv(.c) void, .{ .name = "hb_font_get_glyph_h_advances" });
    const ret = cFn(arg_font, arg_count, arg_first_glyph, arg_glyph_stride, arg_first_advance, arg_advance_stride);
    _ = ret;
    return argO_first_advance;
}
pub fn fontGetGlyphHKerning(arg_font: *font_t, arg_left_glyph: u32, arg_right_glyph: u32) i32 {
    const cFn = @extern(*const fn (*font_t, u32, u32) callconv(.c) i32, .{ .name = "hb_font_get_glyph_h_kerning" });
    const ret = cFn(arg_font, arg_left_glyph, arg_right_glyph);
    return ret;
}
pub fn fontGetGlyphHOrigin(arg_font: *font_t, arg_glyph: u32) struct {
    ret: i32,
    x: i32,
    y: i32,
} {
    var argO_x: i32 = undefined;
    const arg_x: *i32 = &argO_x;
    var argO_y: i32 = undefined;
    const arg_y: *i32 = &argO_y;
    const cFn = @extern(*const fn (*font_t, u32, *i32, *i32) callconv(.c) i32, .{ .name = "hb_font_get_glyph_h_origin" });
    const ret = cFn(arg_font, arg_glyph, arg_x, arg_y);
    return .{ .ret = ret, .x = argO_x, .y = argO_y };
}
pub fn fontGetGlyphKerningForDirection(arg_font: *font_t, arg_first_glyph: u32, arg_second_glyph: u32, arg_direction: direction_t) struct {
    x: i32,
    y: i32,
} {
    var argO_x: i32 = undefined;
    const arg_x: *i32 = &argO_x;
    var argO_y: i32 = undefined;
    const arg_y: *i32 = &argO_y;
    const cFn = @extern(*const fn (*font_t, u32, u32, direction_t, *i32, *i32) callconv(.c) void, .{ .name = "hb_font_get_glyph_kerning_for_direction" });
    const ret = cFn(arg_font, arg_first_glyph, arg_second_glyph, arg_direction, arg_x, arg_y);
    _ = ret;
    return .{ .x = argO_x, .y = argO_y };
}
pub const font_get_glyph_kerning_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_first_glyph: u32, arg_second_glyph: u32, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub fn fontGetGlyphName(arg_font: *font_t, arg_glyph: u32) struct {
    ret: i32,
    name: [][*:0]const u8,
} {
    var argO_name: [*][*:0]const u8 = undefined;
    const arg_name: *[*][*:0]const u8 = &argO_name;
    var argO_size: u32 = undefined;
    const arg_size: *u32 = &argO_size;
    const cFn = @extern(*const fn (*font_t, u32, *[*][*:0]const u8, *u32) callconv(.c) i32, .{ .name = "hb_font_get_glyph_name" });
    const ret = cFn(arg_font, arg_glyph, arg_name, arg_size);
    return .{ .ret = ret, .name = argO_name[0..@intCast(argO_size)] };
}
pub const font_get_glyph_name_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_name: *[*][*:0]const u8, arg_size: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub fn fontGetGlyphOriginForDirection(arg_font: *font_t, arg_glyph: u32, arg_direction: direction_t) struct {
    x: i32,
    y: i32,
} {
    var argO_x: i32 = undefined;
    const arg_x: *i32 = &argO_x;
    var argO_y: i32 = undefined;
    const arg_y: *i32 = &argO_y;
    const cFn = @extern(*const fn (*font_t, u32, direction_t, *i32, *i32) callconv(.c) void, .{ .name = "hb_font_get_glyph_origin_for_direction" });
    const ret = cFn(arg_font, arg_glyph, arg_direction, arg_x, arg_y);
    _ = ret;
    return .{ .x = argO_x, .y = argO_y };
}
pub const font_get_glyph_origin_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_x: *i32, arg_y: *i32, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub fn fontGetGlyphShape(arg_font: *font_t, arg_glyph: u32, arg_dfuncs: *draw_funcs_t, arg_draw_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*font_t, u32, *draw_funcs_t, ?*anyopaque) callconv(.c) void, .{ .name = "hb_font_get_glyph_shape" });
    const ret = cFn(arg_font, arg_glyph, arg_dfuncs, @ptrCast(arg_draw_data));
    return ret;
}
pub const font_get_glyph_shape_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_draw_funcs: *draw_funcs_t, arg_draw_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn fontGetGlyphVAdvance(arg_font: *font_t, arg_glyph: u32) i32 {
    const cFn = @extern(*const fn (*font_t, u32) callconv(.c) i32, .{ .name = "hb_font_get_glyph_v_advance" });
    const ret = cFn(arg_font, arg_glyph);
    return ret;
}
pub fn fontGetGlyphVAdvances(arg_font: *font_t, arg_count: u32, arg_first_glyph: *u32, arg_glyph_stride: u32) struct {
    first_advance: i32,
    advance_stride: u32,
} {
    var argO_first_advance: i32 = undefined;
    const arg_first_advance: *i32 = &argO_first_advance;
    var argO_advance_stride: u32 = undefined;
    const arg_advance_stride: *u32 = &argO_advance_stride;
    const cFn = @extern(*const fn (*font_t, u32, *u32, u32, *i32, *u32) callconv(.c) void, .{ .name = "hb_font_get_glyph_v_advances" });
    const ret = cFn(arg_font, arg_count, arg_first_glyph, arg_glyph_stride, arg_first_advance, arg_advance_stride);
    _ = ret;
    return .{ .first_advance = argO_first_advance, .advance_stride = argO_advance_stride };
}
pub fn fontGetGlyphVKerning(arg_font: *font_t, arg_top_glyph: u32, arg_bottom_glyph: u32) i32 {
    const cFn = @extern(*const fn (*font_t, u32, u32) callconv(.c) i32, .{ .name = "hb_font_get_glyph_v_kerning" });
    const ret = cFn(arg_font, arg_top_glyph, arg_bottom_glyph);
    return ret;
}
pub fn fontGetGlyphVOrigin(arg_font: *font_t, arg_glyph: u32) struct {
    ret: i32,
    x: i32,
    y: i32,
} {
    var argO_x: i32 = undefined;
    const arg_x: *i32 = &argO_x;
    var argO_y: i32 = undefined;
    const arg_y: *i32 = &argO_y;
    const cFn = @extern(*const fn (*font_t, u32, *i32, *i32) callconv(.c) i32, .{ .name = "hb_font_get_glyph_v_origin" });
    const ret = cFn(arg_font, arg_glyph, arg_x, arg_y);
    return .{ .ret = ret, .x = argO_x, .y = argO_y };
}
pub fn fontGetHExtents(arg_font: *font_t, arg_extents: *font_extents_t) i32 {
    const cFn = @extern(*const fn (*font_t, *font_extents_t) callconv(.c) i32, .{ .name = "hb_font_get_h_extents" });
    const ret = cFn(arg_font, arg_extents);
    return ret;
}
pub fn fontGetNominalGlyph(arg_font: *font_t, arg_unicode: u32) struct {
    ret: i32,
    glyph: u32,
} {
    var argO_glyph: u32 = undefined;
    const arg_glyph: *u32 = &argO_glyph;
    const cFn = @extern(*const fn (*font_t, u32, *u32) callconv(.c) i32, .{ .name = "hb_font_get_nominal_glyph" });
    const ret = cFn(arg_font, arg_unicode, arg_glyph);
    return .{ .ret = ret, .glyph = argO_glyph };
}
pub const font_get_nominal_glyph_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_unicode: u32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub fn fontGetNominalGlyphs(arg_font: *font_t, arg_count: u32, arg_first_unicode: *u32, arg_unicode_stride: u32, arg_glyph_stride: u32) struct {
    ret: u32,
    first_glyph: u32,
} {
    var argO_first_glyph: u32 = undefined;
    const arg_first_glyph: *u32 = &argO_first_glyph;
    const cFn = @extern(*const fn (*font_t, u32, *u32, u32, *u32, u32) callconv(.c) u32, .{ .name = "hb_font_get_nominal_glyphs" });
    const ret = cFn(arg_font, arg_count, arg_first_unicode, arg_unicode_stride, arg_first_glyph, arg_glyph_stride);
    return .{ .ret = ret, .first_glyph = argO_first_glyph };
}
pub const font_get_nominal_glyphs_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_count: u32, arg_first_unicode: *u32, arg_unicode_stride: u32, arg_first_glyph: *u32, arg_glyph_stride: u32, arg_user_data: ?*anyopaque) callconv(.c) u32;
pub fn fontGetParent(arg_font: *font_t) *font_t {
    const cFn = @extern(*const fn (*font_t) callconv(.c) *font_t, .{ .name = "hb_font_get_parent" });
    const ret = cFn(arg_font);
    return ret;
}
pub fn fontGetPpem(arg_font: *font_t) struct {
    x_ppem: u32,
    y_ppem: u32,
} {
    var argO_x_ppem: u32 = undefined;
    const arg_x_ppem: *u32 = &argO_x_ppem;
    var argO_y_ppem: u32 = undefined;
    const arg_y_ppem: *u32 = &argO_y_ppem;
    const cFn = @extern(*const fn (*font_t, *u32, *u32) callconv(.c) void, .{ .name = "hb_font_get_ppem" });
    const ret = cFn(arg_font, arg_x_ppem, arg_y_ppem);
    _ = ret;
    return .{ .x_ppem = argO_x_ppem, .y_ppem = argO_y_ppem };
}
pub fn fontGetPtem(arg_font: *font_t) f32 {
    const cFn = @extern(*const fn (*font_t) callconv(.c) f32, .{ .name = "hb_font_get_ptem" });
    const ret = cFn(arg_font);
    return ret;
}
pub fn fontGetScale(arg_font: *font_t) struct {
    x_scale: i32,
    y_scale: i32,
} {
    var argO_x_scale: i32 = undefined;
    const arg_x_scale: *i32 = &argO_x_scale;
    var argO_y_scale: i32 = undefined;
    const arg_y_scale: *i32 = &argO_y_scale;
    const cFn = @extern(*const fn (*font_t, *i32, *i32) callconv(.c) void, .{ .name = "hb_font_get_scale" });
    const ret = cFn(arg_font, arg_x_scale, arg_y_scale);
    _ = ret;
    return .{ .x_scale = argO_x_scale, .y_scale = argO_y_scale };
}
pub fn fontGetSerial(arg_font: *font_t) u32 {
    const cFn = @extern(*const fn (*font_t) callconv(.c) u32, .{ .name = "hb_font_get_serial" });
    const ret = cFn(arg_font);
    return ret;
}
pub fn fontGetSyntheticBold(arg_font: *font_t) struct {
    x_embolden: f32,
    y_embolden: f32,
    in_place: i32,
} {
    var argO_x_embolden: f32 = undefined;
    const arg_x_embolden: *f32 = &argO_x_embolden;
    var argO_y_embolden: f32 = undefined;
    const arg_y_embolden: *f32 = &argO_y_embolden;
    var argO_in_place: i32 = undefined;
    const arg_in_place: *i32 = &argO_in_place;
    const cFn = @extern(*const fn (*font_t, *f32, *f32, *i32) callconv(.c) void, .{ .name = "hb_font_get_synthetic_bold" });
    const ret = cFn(arg_font, arg_x_embolden, arg_y_embolden, arg_in_place);
    _ = ret;
    return .{ .x_embolden = argO_x_embolden, .y_embolden = argO_y_embolden, .in_place = argO_in_place };
}
pub fn fontGetSyntheticSlant(arg_font: *font_t) f32 {
    const cFn = @extern(*const fn (*font_t) callconv(.c) f32, .{ .name = "hb_font_get_synthetic_slant" });
    const ret = cFn(arg_font);
    return ret;
}
pub fn fontGetVExtents(arg_font: *font_t, arg_extents: *font_extents_t) i32 {
    const cFn = @extern(*const fn (*font_t, *font_extents_t) callconv(.c) i32, .{ .name = "hb_font_get_v_extents" });
    const ret = cFn(arg_font, arg_extents);
    return ret;
}
pub fn fontGetVarCoordsDesign(arg_font: *font_t) struct {
    ret: *f32,
    length: u32,
} {
    var argO_length: u32 = undefined;
    const arg_length: *u32 = &argO_length;
    const cFn = @extern(*const fn (*font_t, *u32) callconv(.c) *f32, .{ .name = "hb_font_get_var_coords_design" });
    const ret = cFn(arg_font, arg_length);
    return .{ .ret = ret, .length = argO_length };
}
pub fn fontGetVarCoordsNormalized(arg_font: *font_t) struct {
    ret: *i32,
    length: u32,
} {
    var argO_length: u32 = undefined;
    const arg_length: *u32 = &argO_length;
    const cFn = @extern(*const fn (*font_t, *u32) callconv(.c) *i32, .{ .name = "hb_font_get_var_coords_normalized" });
    const ret = cFn(arg_font, arg_length);
    return .{ .ret = ret, .length = argO_length };
}
pub fn fontGetVarNamedInstance(arg_font: *font_t) u32 {
    const cFn = @extern(*const fn (*font_t) callconv(.c) u32, .{ .name = "hb_font_get_var_named_instance" });
    const ret = cFn(arg_font);
    return ret;
}
pub fn fontGetVariationGlyph(arg_font: *font_t, arg_unicode: u32, arg_variation_selector: u32) struct {
    ret: i32,
    glyph: u32,
} {
    var argO_glyph: u32 = undefined;
    const arg_glyph: *u32 = &argO_glyph;
    const cFn = @extern(*const fn (*font_t, u32, u32, *u32) callconv(.c) i32, .{ .name = "hb_font_get_variation_glyph" });
    const ret = cFn(arg_font, arg_unicode, arg_variation_selector, arg_glyph);
    return .{ .ret = ret, .glyph = argO_glyph };
}
pub const font_get_variation_glyph_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_unicode: u32, arg_variation_selector: u32, arg_glyph: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub fn fontGlyphFromString(arg_font: *font_t, argS_s: []u8) struct {
    ret: i32,
    glyph: u32,
} {
    const arg_s: [*]u8 = @ptrCast(argS_s);
    const arg_len: i32 = @intCast((argS_s).len);
    var argO_glyph: u32 = undefined;
    const arg_glyph: *u32 = &argO_glyph;
    const cFn = @extern(*const fn (*font_t, [*]u8, i32, *u32) callconv(.c) i32, .{ .name = "hb_font_glyph_from_string" });
    const ret = cFn(arg_font, arg_s, arg_len, arg_glyph);
    return .{ .ret = ret, .glyph = argO_glyph };
}
pub fn fontGlyphToString(arg_font: *font_t, arg_glyph: u32) [][*:0]const u8 {
    var argO_s: [*][*:0]const u8 = undefined;
    const arg_s: *[*][*:0]const u8 = &argO_s;
    var argO_size: u32 = undefined;
    const arg_size: *u32 = &argO_size;
    const cFn = @extern(*const fn (*font_t, u32, *[*][*:0]const u8, *u32) callconv(.c) void, .{ .name = "hb_font_glyph_to_string" });
    const ret = cFn(arg_font, arg_glyph, arg_s, arg_size);
    _ = ret;
    return argO_s[0..@intCast(argO_size)];
}
pub fn fontIsImmutable(arg_font: *font_t) i32 {
    const cFn = @extern(*const fn (*font_t) callconv(.c) i32, .{ .name = "hb_font_is_immutable" });
    const ret = cFn(arg_font);
    return ret;
}
pub fn fontMakeImmutable(arg_font: *font_t) void {
    const cFn = @extern(*const fn (*font_t) callconv(.c) void, .{ .name = "hb_font_make_immutable" });
    const ret = cFn(arg_font);
    return ret;
}
pub fn fontPaintGlyph(arg_font: *font_t, arg_glyph: u32, arg_pfuncs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_palette_index: u32, arg_foreground: u32) void {
    const cFn = @extern(*const fn (*font_t, u32, *paint_funcs_t, ?*anyopaque, u32, u32) callconv(.c) void, .{ .name = "hb_font_paint_glyph" });
    const ret = cFn(arg_font, arg_glyph, arg_pfuncs, @ptrCast(arg_paint_data), arg_palette_index, arg_foreground);
    return ret;
}
pub const font_paint_glyph_func_t = *const fn (arg_font: *font_t, arg_font_data: ?*anyopaque, arg_glyph: u32, arg_paint_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_palette_index: u32, arg_foreground: u32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn fontSetFace(arg_font: *font_t, arg_face: *face_t) void {
    const cFn = @extern(*const fn (*font_t, *face_t) callconv(.c) void, .{ .name = "hb_font_set_face" });
    const ret = cFn(arg_font, arg_face);
    return ret;
}
pub fn fontSetParent(arg_font: *font_t, arg_parent: *font_t) void {
    const cFn = @extern(*const fn (*font_t, *font_t) callconv(.c) void, .{ .name = "hb_font_set_parent" });
    const ret = cFn(arg_font, arg_parent);
    return ret;
}
pub fn fontSetPpem(arg_font: *font_t, arg_x_ppem: u32, arg_y_ppem: u32) void {
    const cFn = @extern(*const fn (*font_t, u32, u32) callconv(.c) void, .{ .name = "hb_font_set_ppem" });
    const ret = cFn(arg_font, arg_x_ppem, arg_y_ppem);
    return ret;
}
pub fn fontSetPtem(arg_font: *font_t, arg_ptem: f32) void {
    const cFn = @extern(*const fn (*font_t, f32) callconv(.c) void, .{ .name = "hb_font_set_ptem" });
    const ret = cFn(arg_font, arg_ptem);
    return ret;
}
pub fn fontSetScale(arg_font: *font_t, arg_x_scale: i32, arg_y_scale: i32) void {
    const cFn = @extern(*const fn (*font_t, i32, i32) callconv(.c) void, .{ .name = "hb_font_set_scale" });
    const ret = cFn(arg_font, arg_x_scale, arg_y_scale);
    return ret;
}
pub fn fontSetSyntheticBold(arg_font: *font_t, arg_x_embolden: f32, arg_y_embolden: f32, arg_in_place: i32) void {
    const cFn = @extern(*const fn (*font_t, f32, f32, i32) callconv(.c) void, .{ .name = "hb_font_set_synthetic_bold" });
    const ret = cFn(arg_font, arg_x_embolden, arg_y_embolden, arg_in_place);
    return ret;
}
pub fn fontSetSyntheticSlant(arg_font: *font_t, arg_slant: f32) void {
    const cFn = @extern(*const fn (*font_t, f32) callconv(.c) void, .{ .name = "hb_font_set_synthetic_slant" });
    const ret = cFn(arg_font, arg_slant);
    return ret;
}
pub fn fontSetVarCoordsDesign(arg_font: *font_t, argS_coords: []f32) void {
    const arg_coords: [*]f32 = @ptrCast(argS_coords);
    const arg_coords_length: u32 = @intCast((argS_coords).len);
    const cFn = @extern(*const fn (*font_t, [*]f32, u32) callconv(.c) void, .{ .name = "hb_font_set_var_coords_design" });
    const ret = cFn(arg_font, arg_coords, arg_coords_length);
    return ret;
}
pub fn fontSetVarCoordsNormalized(arg_font: *font_t, argS_coords: []i32) void {
    const arg_coords: [*]i32 = @ptrCast(argS_coords);
    const arg_coords_length: u32 = @intCast((argS_coords).len);
    const cFn = @extern(*const fn (*font_t, [*]i32, u32) callconv(.c) void, .{ .name = "hb_font_set_var_coords_normalized" });
    const ret = cFn(arg_font, arg_coords, arg_coords_length);
    return ret;
}
pub fn fontSetVarNamedInstance(arg_font: *font_t, arg_instance_index: u32) void {
    const cFn = @extern(*const fn (*font_t, u32) callconv(.c) void, .{ .name = "hb_font_set_var_named_instance" });
    const ret = cFn(arg_font, arg_instance_index);
    return ret;
}
pub fn fontSetVariation(arg_font: *font_t, arg_tag: u32, arg_value: f32) void {
    const cFn = @extern(*const fn (*font_t, u32, f32) callconv(.c) void, .{ .name = "hb_font_set_variation" });
    const ret = cFn(arg_font, arg_tag, arg_value);
    return ret;
}
pub fn fontSetVariations(arg_font: *font_t, argS_variations: []variation_t) void {
    const arg_variations: [*]variation_t = @ptrCast(argS_variations);
    const arg_variations_length: u32 = @intCast((argS_variations).len);
    const cFn = @extern(*const fn (*font_t, [*]variation_t, u32) callconv(.c) void, .{ .name = "hb_font_set_variations" });
    const ret = cFn(arg_font, arg_variations, arg_variations_length);
    return ret;
}
pub fn fontSubtractGlyphOriginForDirection(arg_font: *font_t, arg_glyph: u32, arg_direction: direction_t, arg_x: *i32, arg_y: *i32) void {
    const cFn = @extern(*const fn (*font_t, u32, direction_t, *i32, *i32) callconv(.c) void, .{ .name = "hb_font_subtract_glyph_origin_for_direction" });
    const ret = cFn(arg_font, arg_glyph, arg_direction, arg_x, arg_y);
    return ret;
}
pub const font_t = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_font_get_type" });
        return cFn();
    }
};
pub fn ftFaceCreateCached(arg_ft_face: freetype2.Face) *face_t {
    const cFn = @extern(*const fn (freetype2.Face) callconv(.c) *face_t, .{ .name = "hb_ft_face_create_cached" });
    const ret = cFn(arg_ft_face);
    return ret;
}
pub fn ftFaceCreateFromFileOrFail(arg_file_name: [*:0]const u8, arg_index: u32) *face_t {
    const cFn = @extern(*const fn ([*:0]const u8, u32) callconv(.c) *face_t, .{ .name = "hb_ft_face_create_from_file_or_fail" });
    const ret = cFn(arg_file_name, arg_index);
    return ret;
}
pub fn ftFaceCreateReferenced(arg_ft_face: freetype2.Face) *face_t {
    const cFn = @extern(*const fn (freetype2.Face) callconv(.c) *face_t, .{ .name = "hb_ft_face_create_referenced" });
    const ret = cFn(arg_ft_face);
    return ret;
}
pub fn ftFontChanged(arg_font: *font_t) void {
    const cFn = @extern(*const fn (*font_t) callconv(.c) void, .{ .name = "hb_ft_font_changed" });
    const ret = cFn(arg_font);
    return ret;
}
pub fn ftFontCreateReferenced(arg_ft_face: freetype2.Face) *font_t {
    const cFn = @extern(*const fn (freetype2.Face) callconv(.c) *font_t, .{ .name = "hb_ft_font_create_referenced" });
    const ret = cFn(arg_ft_face);
    return ret;
}
pub fn ftFontGetLoadFlags(arg_font: *font_t) i32 {
    const cFn = @extern(*const fn (*font_t) callconv(.c) i32, .{ .name = "hb_ft_font_get_load_flags" });
    const ret = cFn(arg_font);
    return ret;
}
pub fn ftFontSetFuncs(arg_font: *font_t) void {
    const cFn = @extern(*const fn (*font_t) callconv(.c) void, .{ .name = "hb_ft_font_set_funcs" });
    const ret = cFn(arg_font);
    return ret;
}
pub fn ftFontSetLoadFlags(arg_font: *font_t, arg_load_flags: i32) void {
    const cFn = @extern(*const fn (*font_t, i32) callconv(.c) void, .{ .name = "hb_ft_font_set_load_flags" });
    const ret = cFn(arg_font, arg_load_flags);
    return ret;
}
pub fn ftHbFontChanged(arg_font: *font_t) i32 {
    const cFn = @extern(*const fn (*font_t) callconv(.c) i32, .{ .name = "hb_ft_hb_font_changed" });
    const ret = cFn(arg_font);
    return ret;
}
pub const get_table_tags_func_t = *const fn (arg_face: *face_t, arg_start_offset: u32, arg_table_count: *u32, arg_table_tags: *[*]u32, arg_user_data: ?*anyopaque) callconv(.c) u32;
pub fn glibBlobCreate(arg_gbytes: *GLib.Bytes) *blob_t {
    const cFn = @extern(*const fn (*GLib.Bytes) callconv(.c) *blob_t, .{ .name = "hb_glib_blob_create" });
    const ret = cFn(arg_gbytes);
    return ret;
}
pub fn glibGetUnicodeFuncs() *unicode_funcs_t {
    const cFn = @extern(*const fn () callconv(.c) *unicode_funcs_t, .{ .name = "hb_glib_get_unicode_funcs" });
    const ret = cFn();
    return ret;
}
pub fn glibScriptFromScript(arg_script: script_t) GLib.UnicodeScript {
    const cFn = @extern(*const fn (script_t) callconv(.c) GLib.UnicodeScript, .{ .name = "hb_glib_script_from_script" });
    const ret = cFn(arg_script);
    return ret;
}
pub fn glibScriptToScript(arg_script: GLib.UnicodeScript) script_t {
    const cFn = @extern(*const fn (GLib.UnicodeScript) callconv(.c) script_t, .{ .name = "hb_glib_script_to_script" });
    const ret = cFn(arg_script);
    return ret;
}
pub const glyph_extents_t = extern struct {
    x_bearing: i32,
    y_bearing: i32,
    width: i32,
    height: i32,
};
pub const glyph_flags_t = packed struct(u32) {
    unsafe_to_break: bool = false,
    unsafe_to_concat: bool = false,
    safe_to_insert_tatweel: bool = false,
    _: u29 = 0,
    pub const defined: @This() = @bitCast(@as(u32, 7));
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_glyph_flags_get_type" });
        return cFn();
    }
};
pub fn glyphInfoGetGlyphFlags(arg_info: *glyph_info_t) glyph_flags_t {
    const cFn = @extern(*const fn (*glyph_info_t) callconv(.c) glyph_flags_t, .{ .name = "hb_glyph_info_get_glyph_flags" });
    const ret = cFn(arg_info);
    return ret;
}
pub const glyph_info_t = extern struct {
    codepoint: u32,
    mask: u32,
    cluster: u32,
    var1: var_int_t,
    var2: var_int_t,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_glyph_info_get_type" });
        return cFn();
    }
};
pub const glyph_position_t = extern struct {
    x_advance: i32,
    y_advance: i32,
    x_offset: i32,
    y_offset: i32,
    @"var": var_int_t,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_glyph_position_get_type" });
        return cFn();
    }
};
pub fn languageFromString(argS_str: []u8) *language_t {
    const arg_str: [*]u8 = @ptrCast(argS_str);
    const arg_len: i32 = @intCast((argS_str).len);
    const cFn = @extern(*const fn ([*]u8, i32) callconv(.c) *language_t, .{ .name = "hb_language_from_string" });
    const ret = cFn(arg_str, arg_len);
    return ret;
}
pub fn languageGetDefault() *language_t {
    const cFn = @extern(*const fn () callconv(.c) *language_t, .{ .name = "hb_language_get_default" });
    const ret = cFn();
    return ret;
}
pub fn languageMatches(arg_language: *language_t, arg_specific: *language_t) i32 {
    const cFn = @extern(*const fn (*language_t, *language_t) callconv(.c) i32, .{ .name = "hb_language_matches" });
    const ret = cFn(arg_language, arg_specific);
    return ret;
}
pub const language_t = opaque {
    pub fn _string(self: *language_t) [*:0]u8 {
        const cFn = @extern(*const fn (*language_t) callconv(.c) [*:0]u8, .{ .name = "hb_language_to_string" });
        const ret = cFn(self);
        return ret;
    }
};
pub fn languageToString(arg_language: *language_t) [*:0]u8 {
    const cFn = @extern(*const fn (*language_t) callconv(.c) [*:0]u8, .{ .name = "hb_language_to_string" });
    const ret = cFn(arg_language);
    return ret;
}
pub fn mapAllocationSuccessful(arg_map: *map_t) i32 {
    const cFn = @extern(*const fn (*map_t) callconv(.c) i32, .{ .name = "hb_map_allocation_successful" });
    const ret = cFn(arg_map);
    return ret;
}
pub fn mapClear(arg_map: *map_t) void {
    const cFn = @extern(*const fn (*map_t) callconv(.c) void, .{ .name = "hb_map_clear" });
    const ret = cFn(arg_map);
    return ret;
}
pub fn mapCopy(arg_map: *map_t) *map_t {
    const cFn = @extern(*const fn (*map_t) callconv(.c) *map_t, .{ .name = "hb_map_copy" });
    const ret = cFn(arg_map);
    return ret;
}
pub fn mapCreate() *map_t {
    const cFn = @extern(*const fn () callconv(.c) *map_t, .{ .name = "hb_map_create" });
    const ret = cFn();
    return ret;
}
pub fn mapDel(arg_map: *map_t, arg_key: u32) void {
    const cFn = @extern(*const fn (*map_t, u32) callconv(.c) void, .{ .name = "hb_map_del" });
    const ret = cFn(arg_map, arg_key);
    return ret;
}
pub fn mapGet(arg_map: *map_t, arg_key: u32) u32 {
    const cFn = @extern(*const fn (*map_t, u32) callconv(.c) u32, .{ .name = "hb_map_get" });
    const ret = cFn(arg_map, arg_key);
    return ret;
}
pub fn mapGetEmpty() *map_t {
    const cFn = @extern(*const fn () callconv(.c) *map_t, .{ .name = "hb_map_get_empty" });
    const ret = cFn();
    return ret;
}
pub fn mapGetPopulation(arg_map: *map_t) u32 {
    const cFn = @extern(*const fn (*map_t) callconv(.c) u32, .{ .name = "hb_map_get_population" });
    const ret = cFn(arg_map);
    return ret;
}
pub fn mapHas(arg_map: *map_t, arg_key: u32) i32 {
    const cFn = @extern(*const fn (*map_t, u32) callconv(.c) i32, .{ .name = "hb_map_has" });
    const ret = cFn(arg_map, arg_key);
    return ret;
}
pub fn mapHash(arg_map: *map_t) u32 {
    const cFn = @extern(*const fn (*map_t) callconv(.c) u32, .{ .name = "hb_map_hash" });
    const ret = cFn(arg_map);
    return ret;
}
pub fn mapIsEmpty(arg_map: *map_t) i32 {
    const cFn = @extern(*const fn (*map_t) callconv(.c) i32, .{ .name = "hb_map_is_empty" });
    const ret = cFn(arg_map);
    return ret;
}
pub fn mapIsEqual(arg_map: *map_t, arg_other: *map_t) i32 {
    const cFn = @extern(*const fn (*map_t, *map_t) callconv(.c) i32, .{ .name = "hb_map_is_equal" });
    const ret = cFn(arg_map, arg_other);
    return ret;
}
pub fn mapKeys(arg_map: *map_t, arg_keys: *set_t) void {
    const cFn = @extern(*const fn (*map_t, *set_t) callconv(.c) void, .{ .name = "hb_map_keys" });
    const ret = cFn(arg_map, arg_keys);
    return ret;
}
pub fn mapNext(arg_map: *map_t, arg_idx: *i32) struct {
    ret: i32,
    key: u32,
    value: u32,
} {
    var argO_key: u32 = undefined;
    const arg_key: *u32 = &argO_key;
    var argO_value: u32 = undefined;
    const arg_value: *u32 = &argO_value;
    const cFn = @extern(*const fn (*map_t, *i32, *u32, *u32) callconv(.c) i32, .{ .name = "hb_map_next" });
    const ret = cFn(arg_map, arg_idx, arg_key, arg_value);
    return .{ .ret = ret, .key = argO_key, .value = argO_value };
}
pub fn mapSet(arg_map: *map_t, arg_key: u32, arg_value: u32) void {
    const cFn = @extern(*const fn (*map_t, u32, u32) callconv(.c) void, .{ .name = "hb_map_set" });
    const ret = cFn(arg_map, arg_key, arg_value);
    return ret;
}
pub const map_t = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_map_get_type" });
        return cFn();
    }
};
pub fn mapUpdate(arg_map: *map_t, arg_other: *map_t) void {
    const cFn = @extern(*const fn (*map_t, *map_t) callconv(.c) void, .{ .name = "hb_map_update" });
    const ret = cFn(arg_map, arg_other);
    return ret;
}
pub fn mapValues(arg_map: *map_t, arg_values: *set_t) void {
    const cFn = @extern(*const fn (*map_t, *set_t) callconv(.c) void, .{ .name = "hb_map_values" });
    const ret = cFn(arg_map, arg_values);
    return ret;
}
pub const memory_mode_t = enum(u32) {
    duplicate = 0,
    readonly = 1,
    writable = 2,
    readonly_may_make_writable = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_memory_mode_get_type" });
        return cFn();
    }
};
pub fn otColorGlyphGetLayers(arg_face: *face_t, arg_glyph: u32, arg_start_offset: u32, argS_layers: []ot_color_layer_t) struct {
    ret: u32,
    layers: []ot_color_layer_t,
} {
    const arg_layers: ?[*]ot_color_layer_t = @ptrCast(argS_layers);
    var argO_layer_count: u32 = undefined;
    const arg_layer_count: ?*u32 = &argO_layer_count;
    const cFn = @extern(*const fn (*face_t, u32, u32, ?*u32, ?[*]ot_color_layer_t) callconv(.c) u32, .{ .name = "hb_ot_color_glyph_get_layers" });
    const ret = cFn(arg_face, arg_glyph, arg_start_offset, arg_layer_count, arg_layers);
    return .{ .ret = ret, .layers = arg_layers[0..@intCast(argO_layer_count)] };
}
pub fn otColorGlyphHasPaint(arg_face: *face_t, arg_glyph: u32) i32 {
    const cFn = @extern(*const fn (*face_t, u32) callconv(.c) i32, .{ .name = "hb_ot_color_glyph_has_paint" });
    const ret = cFn(arg_face, arg_glyph);
    return ret;
}
pub fn otColorGlyphReferencePng(arg_font: *font_t, arg_glyph: u32) *blob_t {
    const cFn = @extern(*const fn (*font_t, u32) callconv(.c) *blob_t, .{ .name = "hb_ot_color_glyph_reference_png" });
    const ret = cFn(arg_font, arg_glyph);
    return ret;
}
pub fn otColorGlyphReferenceSvg(arg_face: *face_t, arg_glyph: u32) *blob_t {
    const cFn = @extern(*const fn (*face_t, u32) callconv(.c) *blob_t, .{ .name = "hb_ot_color_glyph_reference_svg" });
    const ret = cFn(arg_face, arg_glyph);
    return ret;
}
pub fn otColorHasLayers(arg_face: *face_t) i32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) i32, .{ .name = "hb_ot_color_has_layers" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn otColorHasPaint(arg_face: *face_t) i32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) i32, .{ .name = "hb_ot_color_has_paint" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn otColorHasPalettes(arg_face: *face_t) i32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) i32, .{ .name = "hb_ot_color_has_palettes" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn otColorHasPng(arg_face: *face_t) i32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) i32, .{ .name = "hb_ot_color_has_png" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn otColorHasSvg(arg_face: *face_t) i32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) i32, .{ .name = "hb_ot_color_has_svg" });
    const ret = cFn(arg_face);
    return ret;
}
pub const ot_color_layer_t = extern struct {
    glyph: u32,
    color_index: u32,
};
pub fn otColorPaletteColorGetNameId(arg_face: *face_t, arg_color_index: u32) u32 {
    const cFn = @extern(*const fn (*face_t, u32) callconv(.c) u32, .{ .name = "hb_ot_color_palette_color_get_name_id" });
    const ret = cFn(arg_face, arg_color_index);
    return ret;
}
pub const ot_color_palette_flags_t = packed struct(u32) {
    usable_with_light_background: bool = false,
    usable_with_dark_background: bool = false,
    _: u30 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_ot_color_palette_flags_get_type" });
        return cFn();
    }
};
pub fn otColorPaletteGetColors(arg_face: *face_t, arg_palette_index: u32, arg_start_offset: u32) struct {
    ret: u32,
    colors: []u32,
} {
    var argO_color_count: u32 = undefined;
    const arg_color_count: ?*u32 = &argO_color_count;
    var argO_colors: [*]u32 = undefined;
    const arg_colors: *?[*]u32 = &argO_colors;
    const cFn = @extern(*const fn (*face_t, u32, u32, ?*u32, *?[*]u32) callconv(.c) u32, .{ .name = "hb_ot_color_palette_get_colors" });
    const ret = cFn(arg_face, arg_palette_index, arg_start_offset, arg_color_count, arg_colors);
    return .{ .ret = ret, .colors = argO_colors[0..@intCast(argO_color_count)] };
}
pub fn otColorPaletteGetCount(arg_face: *face_t) u32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) u32, .{ .name = "hb_ot_color_palette_get_count" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn otColorPaletteGetFlags(arg_face: *face_t, arg_palette_index: u32) ot_color_palette_flags_t {
    const cFn = @extern(*const fn (*face_t, u32) callconv(.c) ot_color_palette_flags_t, .{ .name = "hb_ot_color_palette_get_flags" });
    const ret = cFn(arg_face, arg_palette_index);
    return ret;
}
pub fn otColorPaletteGetNameId(arg_face: *face_t, arg_palette_index: u32) u32 {
    const cFn = @extern(*const fn (*face_t, u32) callconv(.c) u32, .{ .name = "hb_ot_color_palette_get_name_id" });
    const ret = cFn(arg_face, arg_palette_index);
    return ret;
}
pub fn otFontSetFuncs(arg_font: *font_t) void {
    const cFn = @extern(*const fn (*font_t) callconv(.c) void, .{ .name = "hb_ot_font_set_funcs" });
    const ret = cFn(arg_font);
    return ret;
}
pub const ot_layout_baseline_tag_t = enum(u32) {
    roman = 1919905134,
    hanging = 1751215719,
    ideo_face_bottom_or_left = 1768121954,
    ideo_face_top_or_right = 1768121972,
    ideo_face_central = 1231251043,
    ideo_embox_bottom_or_left = 1768187247,
    ideo_embox_top_or_right = 1768191088,
    ideo_embox_central = 1231315813,
    math = 1835103336,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_ot_layout_baseline_tag_get_type" });
        return cFn();
    }
};
pub fn otLayoutCollectFeatures(arg_face: *face_t, arg_table_tag: u32, arg_scripts: ?[*:0]u32, arg_languages: ?[*:0]u32, arg_features: ?[*:0]u32, arg_feature_indexes: *set_t) void {
    const cFn = @extern(*const fn (*face_t, u32, ?[*:0]u32, ?[*:0]u32, ?[*:0]u32, *set_t) callconv(.c) void, .{ .name = "hb_ot_layout_collect_features" });
    const ret = cFn(arg_face, arg_table_tag, arg_scripts, arg_languages, arg_features, arg_feature_indexes);
    return ret;
}
pub fn otLayoutCollectFeaturesMap(arg_face: *face_t, arg_table_tag: u32, arg_script_index: u32, arg_language_index: u32, arg_feature_map: *map_t) void {
    const cFn = @extern(*const fn (*face_t, u32, u32, u32, *map_t) callconv(.c) void, .{ .name = "hb_ot_layout_collect_features_map" });
    const ret = cFn(arg_face, arg_table_tag, arg_script_index, arg_language_index, arg_feature_map);
    return ret;
}
pub fn otLayoutCollectLookups(arg_face: *face_t, arg_table_tag: u32, arg_scripts: ?[*:0]u32, arg_languages: ?[*:0]u32, arg_features: ?[*:0]u32, arg_lookup_indexes: *set_t) void {
    const cFn = @extern(*const fn (*face_t, u32, ?[*:0]u32, ?[*:0]u32, ?[*:0]u32, *set_t) callconv(.c) void, .{ .name = "hb_ot_layout_collect_lookups" });
    const ret = cFn(arg_face, arg_table_tag, arg_scripts, arg_languages, arg_features, arg_lookup_indexes);
    return ret;
}
pub fn otLayoutFeatureGetCharacters(arg_face: *face_t, arg_table_tag: u32, arg_feature_index: u32, arg_start_offset: u32, argS_characters: []u32) struct {
    ret: u32,
    characters: []u32,
} {
    const arg_characters: [*]u32 = @ptrCast(argS_characters);
    var argO_char_count: u32 = undefined;
    const arg_char_count: ?*u32 = &argO_char_count;
    const cFn = @extern(*const fn (*face_t, u32, u32, u32, ?*u32, [*]u32) callconv(.c) u32, .{ .name = "hb_ot_layout_feature_get_characters" });
    const ret = cFn(arg_face, arg_table_tag, arg_feature_index, arg_start_offset, arg_char_count, arg_characters);
    return .{ .ret = ret, .characters = arg_characters[0..@intCast(argO_char_count)] };
}
pub fn otLayoutFeatureGetLookups(arg_face: *face_t, arg_table_tag: u32, arg_feature_index: u32, arg_start_offset: u32) struct {
    ret: u32,
    lookup_indexes: []u32,
} {
    var argO_lookup_count: u32 = undefined;
    const arg_lookup_count: ?*u32 = &argO_lookup_count;
    var argO_lookup_indexes: [*]u32 = undefined;
    const arg_lookup_indexes: *[*]u32 = &argO_lookup_indexes;
    const cFn = @extern(*const fn (*face_t, u32, u32, u32, ?*u32, *[*]u32) callconv(.c) u32, .{ .name = "hb_ot_layout_feature_get_lookups" });
    const ret = cFn(arg_face, arg_table_tag, arg_feature_index, arg_start_offset, arg_lookup_count, arg_lookup_indexes);
    return .{ .ret = ret, .lookup_indexes = argO_lookup_indexes[0..@intCast(argO_lookup_count)] };
}
pub fn otLayoutFeatureGetNameIds(arg_face: *face_t, arg_table_tag: u32, arg_feature_index: u32) struct {
    ret: i32,
    label_id: u32,
    tooltip_id: u32,
    sample_id: u32,
    num_named_parameters: u32,
    first_param_id: u32,
} {
    var argO_label_id: u32 = undefined;
    const arg_label_id: ?*u32 = &argO_label_id;
    var argO_tooltip_id: u32 = undefined;
    const arg_tooltip_id: ?*u32 = &argO_tooltip_id;
    var argO_sample_id: u32 = undefined;
    const arg_sample_id: ?*u32 = &argO_sample_id;
    var argO_num_named_parameters: u32 = undefined;
    const arg_num_named_parameters: ?*u32 = &argO_num_named_parameters;
    var argO_first_param_id: u32 = undefined;
    const arg_first_param_id: ?*u32 = &argO_first_param_id;
    const cFn = @extern(*const fn (*face_t, u32, u32, ?*u32, ?*u32, ?*u32, ?*u32, ?*u32) callconv(.c) i32, .{ .name = "hb_ot_layout_feature_get_name_ids" });
    const ret = cFn(arg_face, arg_table_tag, arg_feature_index, arg_label_id, arg_tooltip_id, arg_sample_id, arg_num_named_parameters, arg_first_param_id);
    return .{ .ret = ret, .label_id = argO_label_id, .tooltip_id = argO_tooltip_id, .sample_id = argO_sample_id, .num_named_parameters = argO_num_named_parameters, .first_param_id = argO_first_param_id };
}
pub fn otLayoutFeatureWithVariationsGetLookups(arg_face: *face_t, arg_table_tag: u32, arg_feature_index: u32, arg_variations_index: u32, arg_start_offset: u32) struct {
    ret: u32,
    lookup_indexes: []u32,
} {
    var argO_lookup_count: u32 = undefined;
    const arg_lookup_count: ?*u32 = &argO_lookup_count;
    var argO_lookup_indexes: [*]u32 = undefined;
    const arg_lookup_indexes: *[*]u32 = &argO_lookup_indexes;
    const cFn = @extern(*const fn (*face_t, u32, u32, u32, u32, ?*u32, *[*]u32) callconv(.c) u32, .{ .name = "hb_ot_layout_feature_with_variations_get_lookups" });
    const ret = cFn(arg_face, arg_table_tag, arg_feature_index, arg_variations_index, arg_start_offset, arg_lookup_count, arg_lookup_indexes);
    return .{ .ret = ret, .lookup_indexes = argO_lookup_indexes[0..@intCast(argO_lookup_count)] };
}
pub fn otLayoutGetAttachPoints(arg_face: *face_t, arg_glyph: u32, arg_start_offset: u32) struct {
    ret: u32,
    point_array: []u32,
} {
    var argO_point_count: u32 = undefined;
    const arg_point_count: ?*u32 = &argO_point_count;
    var argO_point_array: [*]u32 = undefined;
    const arg_point_array: *[*]u32 = &argO_point_array;
    const cFn = @extern(*const fn (*face_t, u32, u32, ?*u32, *[*]u32) callconv(.c) u32, .{ .name = "hb_ot_layout_get_attach_points" });
    const ret = cFn(arg_face, arg_glyph, arg_start_offset, arg_point_count, arg_point_array);
    return .{ .ret = ret, .point_array = argO_point_array[0..@intCast(argO_point_count)] };
}
pub fn otLayoutGetBaseline(arg_font: *font_t, arg_baseline_tag: ot_layout_baseline_tag_t, arg_direction: direction_t, arg_script_tag: u32, arg_language_tag: u32) struct {
    ret: i32,
    coord: i32,
} {
    var argO_coord: i32 = undefined;
    const arg_coord: *i32 = &argO_coord;
    const cFn = @extern(*const fn (*font_t, ot_layout_baseline_tag_t, direction_t, u32, u32, *i32) callconv(.c) i32, .{ .name = "hb_ot_layout_get_baseline" });
    const ret = cFn(arg_font, arg_baseline_tag, arg_direction, arg_script_tag, arg_language_tag, arg_coord);
    return .{ .ret = ret, .coord = argO_coord };
}
pub fn otLayoutGetBaseline2(arg_font: *font_t, arg_baseline_tag: ot_layout_baseline_tag_t, arg_direction: direction_t, arg_script: script_t, arg_language: ?*language_t) struct {
    ret: i32,
    coord: i32,
} {
    var argO_coord: i32 = undefined;
    const arg_coord: *i32 = &argO_coord;
    const cFn = @extern(*const fn (*font_t, ot_layout_baseline_tag_t, direction_t, script_t, ?*language_t, *i32) callconv(.c) i32, .{ .name = "hb_ot_layout_get_baseline2" });
    const ret = cFn(arg_font, arg_baseline_tag, arg_direction, arg_script, arg_language, arg_coord);
    return .{ .ret = ret, .coord = argO_coord };
}
pub fn otLayoutGetBaselineWithFallback(arg_font: *font_t, arg_baseline_tag: ot_layout_baseline_tag_t, arg_direction: direction_t, arg_script_tag: u32, arg_language_tag: u32) i32 {
    var argO_coord: i32 = undefined;
    const arg_coord: *i32 = &argO_coord;
    const cFn = @extern(*const fn (*font_t, ot_layout_baseline_tag_t, direction_t, u32, u32, *i32) callconv(.c) void, .{ .name = "hb_ot_layout_get_baseline_with_fallback" });
    const ret = cFn(arg_font, arg_baseline_tag, arg_direction, arg_script_tag, arg_language_tag, arg_coord);
    _ = ret;
    return argO_coord;
}
pub fn otLayoutGetBaselineWithFallback2(arg_font: *font_t, arg_baseline_tag: ot_layout_baseline_tag_t, arg_direction: direction_t, arg_script: script_t, arg_language: ?*language_t) i32 {
    var argO_coord: i32 = undefined;
    const arg_coord: *i32 = &argO_coord;
    const cFn = @extern(*const fn (*font_t, ot_layout_baseline_tag_t, direction_t, script_t, ?*language_t, *i32) callconv(.c) void, .{ .name = "hb_ot_layout_get_baseline_with_fallback2" });
    const ret = cFn(arg_font, arg_baseline_tag, arg_direction, arg_script, arg_language, arg_coord);
    _ = ret;
    return argO_coord;
}
pub fn otLayoutGetFontExtents(arg_font: *font_t, arg_direction: direction_t, arg_script_tag: u32, arg_language_tag: u32, arg_extents: *font_extents_t) i32 {
    const cFn = @extern(*const fn (*font_t, direction_t, u32, u32, *font_extents_t) callconv(.c) i32, .{ .name = "hb_ot_layout_get_font_extents" });
    const ret = cFn(arg_font, arg_direction, arg_script_tag, arg_language_tag, arg_extents);
    return ret;
}
pub fn otLayoutGetFontExtents2(arg_font: *font_t, arg_direction: direction_t, arg_script: script_t, arg_language: ?*language_t, arg_extents: *font_extents_t) i32 {
    const cFn = @extern(*const fn (*font_t, direction_t, script_t, ?*language_t, *font_extents_t) callconv(.c) i32, .{ .name = "hb_ot_layout_get_font_extents2" });
    const ret = cFn(arg_font, arg_direction, arg_script, arg_language, arg_extents);
    return ret;
}
pub fn otLayoutGetGlyphClass(arg_face: *face_t, arg_glyph: u32) ot_layout_glyph_class_t {
    const cFn = @extern(*const fn (*face_t, u32) callconv(.c) ot_layout_glyph_class_t, .{ .name = "hb_ot_layout_get_glyph_class" });
    const ret = cFn(arg_face, arg_glyph);
    return ret;
}
pub fn otLayoutGetGlyphsInClass(arg_face: *face_t, arg_klass: ot_layout_glyph_class_t, arg_glyphs: *set_t) void {
    const cFn = @extern(*const fn (*face_t, ot_layout_glyph_class_t, *set_t) callconv(.c) void, .{ .name = "hb_ot_layout_get_glyphs_in_class" });
    const ret = cFn(arg_face, arg_klass, arg_glyphs);
    return ret;
}
pub fn otLayoutGetHorizontalBaselineTagForScript(arg_script: script_t) ot_layout_baseline_tag_t {
    const cFn = @extern(*const fn (script_t) callconv(.c) ot_layout_baseline_tag_t, .{ .name = "hb_ot_layout_get_horizontal_baseline_tag_for_script" });
    const ret = cFn(arg_script);
    return ret;
}
pub fn otLayoutGetLigatureCarets(arg_font: *font_t, arg_direction: direction_t, arg_glyph: u32, arg_start_offset: u32) struct {
    ret: u32,
    caret_array: []i32,
} {
    var argO_caret_count: u32 = undefined;
    const arg_caret_count: ?*u32 = &argO_caret_count;
    var argO_caret_array: [*]i32 = undefined;
    const arg_caret_array: *[*]i32 = &argO_caret_array;
    const cFn = @extern(*const fn (*font_t, direction_t, u32, u32, ?*u32, *[*]i32) callconv(.c) u32, .{ .name = "hb_ot_layout_get_ligature_carets" });
    const ret = cFn(arg_font, arg_direction, arg_glyph, arg_start_offset, arg_caret_count, arg_caret_array);
    return .{ .ret = ret, .caret_array = argO_caret_array[0..@intCast(argO_caret_count)] };
}
pub fn otLayoutGetSizeParams(arg_face: *face_t) struct {
    ret: i32,
    design_size: u32,
    subfamily_id: u32,
    subfamily_name_id: u32,
    range_start: u32,
    range_end: u32,
} {
    var argO_design_size: u32 = undefined;
    const arg_design_size: *u32 = &argO_design_size;
    var argO_subfamily_id: u32 = undefined;
    const arg_subfamily_id: *u32 = &argO_subfamily_id;
    var argO_subfamily_name_id: u32 = undefined;
    const arg_subfamily_name_id: *u32 = &argO_subfamily_name_id;
    var argO_range_start: u32 = undefined;
    const arg_range_start: *u32 = &argO_range_start;
    var argO_range_end: u32 = undefined;
    const arg_range_end: *u32 = &argO_range_end;
    const cFn = @extern(*const fn (*face_t, *u32, *u32, *u32, *u32, *u32) callconv(.c) i32, .{ .name = "hb_ot_layout_get_size_params" });
    const ret = cFn(arg_face, arg_design_size, arg_subfamily_id, arg_subfamily_name_id, arg_range_start, arg_range_end);
    return .{ .ret = ret, .design_size = argO_design_size, .subfamily_id = argO_subfamily_id, .subfamily_name_id = argO_subfamily_name_id, .range_start = argO_range_start, .range_end = argO_range_end };
}
pub const ot_layout_glyph_class_t = enum(u32) {
    unclassified = 0,
    base_glyph = 1,
    ligature = 2,
    mark = 3,
    component = 4,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_ot_layout_glyph_class_get_type" });
        return cFn();
    }
};
pub fn otLayoutHasGlyphClasses(arg_face: *face_t) i32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) i32, .{ .name = "hb_ot_layout_has_glyph_classes" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn otLayoutHasPositioning(arg_face: *face_t) i32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) i32, .{ .name = "hb_ot_layout_has_positioning" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn otLayoutHasSubstitution(arg_face: *face_t) i32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) i32, .{ .name = "hb_ot_layout_has_substitution" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn otLayoutLanguageFindFeature(arg_face: *face_t, arg_table_tag: u32, arg_script_index: u32, arg_language_index: u32, arg_feature_tag: u32) struct {
    ret: i32,
    feature_index: u32,
} {
    var argO_feature_index: u32 = undefined;
    const arg_feature_index: *u32 = &argO_feature_index;
    const cFn = @extern(*const fn (*face_t, u32, u32, u32, u32, *u32) callconv(.c) i32, .{ .name = "hb_ot_layout_language_find_feature" });
    const ret = cFn(arg_face, arg_table_tag, arg_script_index, arg_language_index, arg_feature_tag, arg_feature_index);
    return .{ .ret = ret, .feature_index = argO_feature_index };
}
pub fn otLayoutLanguageGetFeatureIndexes(arg_face: *face_t, arg_table_tag: u32, arg_script_index: u32, arg_language_index: u32, arg_start_offset: u32) struct {
    ret: u32,
    feature_indexes: []u32,
} {
    var argO_feature_count: u32 = undefined;
    const arg_feature_count: ?*u32 = &argO_feature_count;
    var argO_feature_indexes: [*]u32 = undefined;
    const arg_feature_indexes: *[*]u32 = &argO_feature_indexes;
    const cFn = @extern(*const fn (*face_t, u32, u32, u32, u32, ?*u32, *[*]u32) callconv(.c) u32, .{ .name = "hb_ot_layout_language_get_feature_indexes" });
    const ret = cFn(arg_face, arg_table_tag, arg_script_index, arg_language_index, arg_start_offset, arg_feature_count, arg_feature_indexes);
    return .{ .ret = ret, .feature_indexes = argO_feature_indexes[0..@intCast(argO_feature_count)] };
}
pub fn otLayoutLanguageGetFeatureTags(arg_face: *face_t, arg_table_tag: u32, arg_script_index: u32, arg_language_index: u32, arg_start_offset: u32) struct {
    ret: u32,
    feature_tags: []u32,
} {
    var argO_feature_count: u32 = undefined;
    const arg_feature_count: ?*u32 = &argO_feature_count;
    var argO_feature_tags: [*]u32 = undefined;
    const arg_feature_tags: *[*]u32 = &argO_feature_tags;
    const cFn = @extern(*const fn (*face_t, u32, u32, u32, u32, ?*u32, *[*]u32) callconv(.c) u32, .{ .name = "hb_ot_layout_language_get_feature_tags" });
    const ret = cFn(arg_face, arg_table_tag, arg_script_index, arg_language_index, arg_start_offset, arg_feature_count, arg_feature_tags);
    return .{ .ret = ret, .feature_tags = argO_feature_tags[0..@intCast(argO_feature_count)] };
}
pub fn otLayoutLanguageGetRequiredFeature(arg_face: *face_t, arg_table_tag: u32, arg_script_index: u32, arg_language_index: u32) struct {
    ret: i32,
    feature_index: u32,
    feature_tag: u32,
} {
    var argO_feature_index: u32 = undefined;
    const arg_feature_index: *u32 = &argO_feature_index;
    var argO_feature_tag: u32 = undefined;
    const arg_feature_tag: *u32 = &argO_feature_tag;
    const cFn = @extern(*const fn (*face_t, u32, u32, u32, *u32, *u32) callconv(.c) i32, .{ .name = "hb_ot_layout_language_get_required_feature" });
    const ret = cFn(arg_face, arg_table_tag, arg_script_index, arg_language_index, arg_feature_index, arg_feature_tag);
    return .{ .ret = ret, .feature_index = argO_feature_index, .feature_tag = argO_feature_tag };
}
pub fn otLayoutLanguageGetRequiredFeatureIndex(arg_face: *face_t, arg_table_tag: u32, arg_script_index: u32, arg_language_index: u32) struct {
    ret: i32,
    feature_index: u32,
} {
    var argO_feature_index: u32 = undefined;
    const arg_feature_index: *u32 = &argO_feature_index;
    const cFn = @extern(*const fn (*face_t, u32, u32, u32, *u32) callconv(.c) i32, .{ .name = "hb_ot_layout_language_get_required_feature_index" });
    const ret = cFn(arg_face, arg_table_tag, arg_script_index, arg_language_index, arg_feature_index);
    return .{ .ret = ret, .feature_index = argO_feature_index };
}
pub fn otLayoutLookupCollectGlyphs(arg_face: *face_t, arg_table_tag: u32, arg_lookup_index: u32, arg_glyphs_before: *set_t, arg_glyphs_input: *set_t, arg_glyphs_after: *set_t, arg_glyphs_output: *set_t) void {
    const cFn = @extern(*const fn (*face_t, u32, u32, *set_t, *set_t, *set_t, *set_t) callconv(.c) void, .{ .name = "hb_ot_layout_lookup_collect_glyphs" });
    const ret = cFn(arg_face, arg_table_tag, arg_lookup_index, arg_glyphs_before, arg_glyphs_input, arg_glyphs_after, arg_glyphs_output);
    return ret;
}
pub fn otLayoutLookupGetGlyphAlternates(arg_face: *face_t, arg_lookup_index: u32, arg_glyph: u32, arg_start_offset: u32, argS_alternate_glyphs: []u32) struct {
    ret: u32,
    alternate_glyphs: []u32,
} {
    const arg_alternate_glyphs: [*]u32 = @ptrCast(argS_alternate_glyphs);
    var argO_alternate_count: u32 = undefined;
    const arg_alternate_count: ?*u32 = &argO_alternate_count;
    const cFn = @extern(*const fn (*face_t, u32, u32, u32, ?*u32, [*]u32) callconv(.c) u32, .{ .name = "hb_ot_layout_lookup_get_glyph_alternates" });
    const ret = cFn(arg_face, arg_lookup_index, arg_glyph, arg_start_offset, arg_alternate_count, arg_alternate_glyphs);
    return .{ .ret = ret, .alternate_glyphs = arg_alternate_glyphs[0..@intCast(argO_alternate_count)] };
}
pub fn otLayoutLookupGetOpticalBound(arg_font: *font_t, arg_lookup_index: u32, arg_direction: direction_t, arg_glyph: u32) i32 {
    const cFn = @extern(*const fn (*font_t, u32, direction_t, u32) callconv(.c) i32, .{ .name = "hb_ot_layout_lookup_get_optical_bound" });
    const ret = cFn(arg_font, arg_lookup_index, arg_direction, arg_glyph);
    return ret;
}
pub fn otLayoutLookupSubstituteClosure(arg_face: *face_t, arg_lookup_index: u32, arg_glyphs: *set_t) void {
    const cFn = @extern(*const fn (*face_t, u32, *set_t) callconv(.c) void, .{ .name = "hb_ot_layout_lookup_substitute_closure" });
    const ret = cFn(arg_face, arg_lookup_index, arg_glyphs);
    return ret;
}
pub fn otLayoutLookupWouldSubstitute(arg_face: *face_t, arg_lookup_index: u32, arg_glyphs: *u32, arg_glyphs_length: u32, arg_zero_context: i32) i32 {
    const cFn = @extern(*const fn (*face_t, u32, *u32, u32, i32) callconv(.c) i32, .{ .name = "hb_ot_layout_lookup_would_substitute" });
    const ret = cFn(arg_face, arg_lookup_index, arg_glyphs, arg_glyphs_length, arg_zero_context);
    return ret;
}
pub fn otLayoutLookupsSubstituteClosure(arg_face: *face_t, arg_lookups: *set_t, arg_glyphs: *set_t) void {
    const cFn = @extern(*const fn (*face_t, *set_t, *set_t) callconv(.c) void, .{ .name = "hb_ot_layout_lookups_substitute_closure" });
    const ret = cFn(arg_face, arg_lookups, arg_glyphs);
    return ret;
}
pub fn otLayoutScriptFindLanguage(arg_face: *face_t, arg_table_tag: u32, arg_script_index: u32, arg_language_tag: u32, arg_language_index: *u32) i32 {
    const cFn = @extern(*const fn (*face_t, u32, u32, u32, *u32) callconv(.c) i32, .{ .name = "hb_ot_layout_script_find_language" });
    const ret = cFn(arg_face, arg_table_tag, arg_script_index, arg_language_tag, arg_language_index);
    return ret;
}
pub fn otLayoutScriptGetLanguageTags(arg_face: *face_t, arg_table_tag: u32, arg_script_index: u32, arg_start_offset: u32) struct {
    ret: u32,
    language_tags: []u32,
} {
    var argO_language_count: u32 = undefined;
    const arg_language_count: ?*u32 = &argO_language_count;
    var argO_language_tags: [*]u32 = undefined;
    const arg_language_tags: *[*]u32 = &argO_language_tags;
    const cFn = @extern(*const fn (*face_t, u32, u32, u32, ?*u32, *[*]u32) callconv(.c) u32, .{ .name = "hb_ot_layout_script_get_language_tags" });
    const ret = cFn(arg_face, arg_table_tag, arg_script_index, arg_start_offset, arg_language_count, arg_language_tags);
    return .{ .ret = ret, .language_tags = argO_language_tags[0..@intCast(argO_language_count)] };
}
pub fn otLayoutScriptSelectLanguage(arg_face: *face_t, arg_table_tag: u32, arg_script_index: u32, arg_language_count: u32, arg_language_tags: *u32) struct {
    ret: i32,
    language_index: u32,
} {
    var argO_language_index: u32 = undefined;
    const arg_language_index: *u32 = &argO_language_index;
    const cFn = @extern(*const fn (*face_t, u32, u32, u32, *u32, *u32) callconv(.c) i32, .{ .name = "hb_ot_layout_script_select_language" });
    const ret = cFn(arg_face, arg_table_tag, arg_script_index, arg_language_count, arg_language_tags, arg_language_index);
    return .{ .ret = ret, .language_index = argO_language_index };
}
pub fn otLayoutScriptSelectLanguage2(arg_face: *face_t, arg_table_tag: u32, arg_script_index: u32, arg_language_count: u32, arg_language_tags: *u32) struct {
    ret: i32,
    language_index: u32,
    chosen_language: u32,
} {
    var argO_language_index: u32 = undefined;
    const arg_language_index: *u32 = &argO_language_index;
    var argO_chosen_language: u32 = undefined;
    const arg_chosen_language: *u32 = &argO_chosen_language;
    const cFn = @extern(*const fn (*face_t, u32, u32, u32, *u32, *u32, *u32) callconv(.c) i32, .{ .name = "hb_ot_layout_script_select_language2" });
    const ret = cFn(arg_face, arg_table_tag, arg_script_index, arg_language_count, arg_language_tags, arg_language_index, arg_chosen_language);
    return .{ .ret = ret, .language_index = argO_language_index, .chosen_language = argO_chosen_language };
}
pub fn otLayoutTableChooseScript(arg_face: *face_t, arg_table_tag: u32, arg_script_tags: *u32) struct {
    ret: i32,
    script_index: u32,
    chosen_script: u32,
} {
    var argO_script_index: u32 = undefined;
    const arg_script_index: *u32 = &argO_script_index;
    var argO_chosen_script: u32 = undefined;
    const arg_chosen_script: *u32 = &argO_chosen_script;
    const cFn = @extern(*const fn (*face_t, u32, *u32, *u32, *u32) callconv(.c) i32, .{ .name = "hb_ot_layout_table_choose_script" });
    const ret = cFn(arg_face, arg_table_tag, arg_script_tags, arg_script_index, arg_chosen_script);
    return .{ .ret = ret, .script_index = argO_script_index, .chosen_script = argO_chosen_script };
}
pub fn otLayoutTableFindFeatureVariations(arg_face: *face_t, arg_table_tag: u32, arg_coords: *i32, arg_num_coords: u32) struct {
    ret: i32,
    variations_index: u32,
} {
    var argO_variations_index: u32 = undefined;
    const arg_variations_index: *u32 = &argO_variations_index;
    const cFn = @extern(*const fn (*face_t, u32, *i32, u32, *u32) callconv(.c) i32, .{ .name = "hb_ot_layout_table_find_feature_variations" });
    const ret = cFn(arg_face, arg_table_tag, arg_coords, arg_num_coords, arg_variations_index);
    return .{ .ret = ret, .variations_index = argO_variations_index };
}
pub fn otLayoutTableFindScript(arg_face: *face_t, arg_table_tag: u32, arg_script_tag: u32) struct {
    ret: i32,
    script_index: u32,
} {
    var argO_script_index: u32 = undefined;
    const arg_script_index: *u32 = &argO_script_index;
    const cFn = @extern(*const fn (*face_t, u32, u32, *u32) callconv(.c) i32, .{ .name = "hb_ot_layout_table_find_script" });
    const ret = cFn(arg_face, arg_table_tag, arg_script_tag, arg_script_index);
    return .{ .ret = ret, .script_index = argO_script_index };
}
pub fn otLayoutTableGetFeatureTags(arg_face: *face_t, arg_table_tag: u32, arg_start_offset: u32) struct {
    ret: u32,
    feature_tags: []u32,
} {
    var argO_feature_count: u32 = undefined;
    const arg_feature_count: ?*u32 = &argO_feature_count;
    var argO_feature_tags: [*]u32 = undefined;
    const arg_feature_tags: *[*]u32 = &argO_feature_tags;
    const cFn = @extern(*const fn (*face_t, u32, u32, ?*u32, *[*]u32) callconv(.c) u32, .{ .name = "hb_ot_layout_table_get_feature_tags" });
    const ret = cFn(arg_face, arg_table_tag, arg_start_offset, arg_feature_count, arg_feature_tags);
    return .{ .ret = ret, .feature_tags = argO_feature_tags[0..@intCast(argO_feature_count)] };
}
pub fn otLayoutTableGetLookupCount(arg_face: *face_t, arg_table_tag: u32) u32 {
    const cFn = @extern(*const fn (*face_t, u32) callconv(.c) u32, .{ .name = "hb_ot_layout_table_get_lookup_count" });
    const ret = cFn(arg_face, arg_table_tag);
    return ret;
}
pub fn otLayoutTableGetScriptTags(arg_face: *face_t, arg_table_tag: u32, arg_start_offset: u32) struct {
    ret: u32,
    script_tags: []u32,
} {
    var argO_script_count: u32 = undefined;
    const arg_script_count: ?*u32 = &argO_script_count;
    var argO_script_tags: [*]u32 = undefined;
    const arg_script_tags: *[*]u32 = &argO_script_tags;
    const cFn = @extern(*const fn (*face_t, u32, u32, ?*u32, *[*]u32) callconv(.c) u32, .{ .name = "hb_ot_layout_table_get_script_tags" });
    const ret = cFn(arg_face, arg_table_tag, arg_start_offset, arg_script_count, arg_script_tags);
    return .{ .ret = ret, .script_tags = argO_script_tags[0..@intCast(argO_script_count)] };
}
pub fn otLayoutTableSelectScript(arg_face: *face_t, arg_table_tag: u32, arg_script_count: u32, arg_script_tags: *u32) struct {
    ret: i32,
    script_index: u32,
    chosen_script: u32,
} {
    var argO_script_index: u32 = undefined;
    const arg_script_index: ?*u32 = &argO_script_index;
    var argO_chosen_script: u32 = undefined;
    const arg_chosen_script: ?*u32 = &argO_chosen_script;
    const cFn = @extern(*const fn (*face_t, u32, u32, *u32, ?*u32, ?*u32) callconv(.c) i32, .{ .name = "hb_ot_layout_table_select_script" });
    const ret = cFn(arg_face, arg_table_tag, arg_script_count, arg_script_tags, arg_script_index, arg_chosen_script);
    return .{ .ret = ret, .script_index = argO_script_index, .chosen_script = argO_chosen_script };
}
pub const ot_math_constant_t = enum(u32) {
    script_percent_scale_down = 0,
    script_script_percent_scale_down = 1,
    delimited_sub_formula_min_height = 2,
    display_operator_min_height = 3,
    math_leading = 4,
    axis_height = 5,
    accent_base_height = 6,
    flattened_accent_base_height = 7,
    subscript_shift_down = 8,
    subscript_top_max = 9,
    subscript_baseline_drop_min = 10,
    superscript_shift_up = 11,
    superscript_shift_up_cramped = 12,
    superscript_bottom_min = 13,
    superscript_baseline_drop_max = 14,
    sub_superscript_gap_min = 15,
    superscript_bottom_max_with_subscript = 16,
    space_after_script = 17,
    upper_limit_gap_min = 18,
    upper_limit_baseline_rise_min = 19,
    lower_limit_gap_min = 20,
    lower_limit_baseline_drop_min = 21,
    stack_top_shift_up = 22,
    stack_top_display_style_shift_up = 23,
    stack_bottom_shift_down = 24,
    stack_bottom_display_style_shift_down = 25,
    stack_gap_min = 26,
    stack_display_style_gap_min = 27,
    stretch_stack_top_shift_up = 28,
    stretch_stack_bottom_shift_down = 29,
    stretch_stack_gap_above_min = 30,
    stretch_stack_gap_below_min = 31,
    fraction_numerator_shift_up = 32,
    fraction_numerator_display_style_shift_up = 33,
    fraction_denominator_shift_down = 34,
    fraction_denominator_display_style_shift_down = 35,
    fraction_numerator_gap_min = 36,
    fraction_num_display_style_gap_min = 37,
    fraction_rule_thickness = 38,
    fraction_denominator_gap_min = 39,
    fraction_denom_display_style_gap_min = 40,
    skewed_fraction_horizontal_gap = 41,
    skewed_fraction_vertical_gap = 42,
    overbar_vertical_gap = 43,
    overbar_rule_thickness = 44,
    overbar_extra_ascender = 45,
    underbar_vertical_gap = 46,
    underbar_rule_thickness = 47,
    underbar_extra_descender = 48,
    radical_vertical_gap = 49,
    radical_display_style_vertical_gap = 50,
    radical_rule_thickness = 51,
    radical_extra_ascender = 52,
    radical_kern_before_degree = 53,
    radical_kern_after_degree = 54,
    radical_degree_bottom_raise_percent = 55,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_ot_math_constant_get_type" });
        return cFn();
    }
};
pub fn otMathGetConstant(arg_font: *font_t, arg_constant: ot_math_constant_t) i32 {
    const cFn = @extern(*const fn (*font_t, ot_math_constant_t) callconv(.c) i32, .{ .name = "hb_ot_math_get_constant" });
    const ret = cFn(arg_font, arg_constant);
    return ret;
}
pub fn otMathGetGlyphAssembly(arg_font: *font_t, arg_glyph: u32, arg_direction: direction_t, arg_start_offset: u32, argS_parts: []ot_math_glyph_part_t) struct {
    ret: u32,
    parts: []ot_math_glyph_part_t,
    italics_correction: i32,
} {
    const arg_parts: [*]ot_math_glyph_part_t = @ptrCast(argS_parts);
    var argO_parts_count: u32 = undefined;
    const arg_parts_count: *u32 = &argO_parts_count;
    var argO_italics_correction: i32 = undefined;
    const arg_italics_correction: *i32 = &argO_italics_correction;
    const cFn = @extern(*const fn (*font_t, u32, direction_t, u32, *u32, [*]ot_math_glyph_part_t, *i32) callconv(.c) u32, .{ .name = "hb_ot_math_get_glyph_assembly" });
    const ret = cFn(arg_font, arg_glyph, arg_direction, arg_start_offset, arg_parts_count, arg_parts, arg_italics_correction);
    return .{ .ret = ret, .parts = arg_parts[0..@intCast(argO_parts_count)], .italics_correction = argO_italics_correction };
}
pub fn otMathGetGlyphItalicsCorrection(arg_font: *font_t, arg_glyph: u32) i32 {
    const cFn = @extern(*const fn (*font_t, u32) callconv(.c) i32, .{ .name = "hb_ot_math_get_glyph_italics_correction" });
    const ret = cFn(arg_font, arg_glyph);
    return ret;
}
pub fn otMathGetGlyphKerning(arg_font: *font_t, arg_glyph: u32, arg_kern: ot_math_kern_t, arg_correction_height: i32) i32 {
    const cFn = @extern(*const fn (*font_t, u32, ot_math_kern_t, i32) callconv(.c) i32, .{ .name = "hb_ot_math_get_glyph_kerning" });
    const ret = cFn(arg_font, arg_glyph, arg_kern, arg_correction_height);
    return ret;
}
pub fn otMathGetGlyphKernings(arg_font: *font_t, arg_glyph: u32, arg_kern: ot_math_kern_t, arg_start_offset: u32, argS_kern_entries: []ot_math_kern_entry_t) struct {
    ret: u32,
    kern_entries: []ot_math_kern_entry_t,
} {
    const arg_kern_entries: [*]ot_math_kern_entry_t = @ptrCast(argS_kern_entries);
    var argO_entries_count: u32 = undefined;
    const arg_entries_count: ?*u32 = &argO_entries_count;
    const cFn = @extern(*const fn (*font_t, u32, ot_math_kern_t, u32, ?*u32, [*]ot_math_kern_entry_t) callconv(.c) u32, .{ .name = "hb_ot_math_get_glyph_kernings" });
    const ret = cFn(arg_font, arg_glyph, arg_kern, arg_start_offset, arg_entries_count, arg_kern_entries);
    return .{ .ret = ret, .kern_entries = arg_kern_entries[0..@intCast(argO_entries_count)] };
}
pub fn otMathGetGlyphTopAccentAttachment(arg_font: *font_t, arg_glyph: u32) i32 {
    const cFn = @extern(*const fn (*font_t, u32) callconv(.c) i32, .{ .name = "hb_ot_math_get_glyph_top_accent_attachment" });
    const ret = cFn(arg_font, arg_glyph);
    return ret;
}
pub fn otMathGetGlyphVariants(arg_font: *font_t, arg_glyph: u32, arg_direction: direction_t, arg_start_offset: u32, argS_variants: []ot_math_glyph_variant_t) struct {
    ret: u32,
    variants: []ot_math_glyph_variant_t,
} {
    const arg_variants: [*]ot_math_glyph_variant_t = @ptrCast(argS_variants);
    var argO_variants_count: u32 = undefined;
    const arg_variants_count: *u32 = &argO_variants_count;
    const cFn = @extern(*const fn (*font_t, u32, direction_t, u32, *u32, [*]ot_math_glyph_variant_t) callconv(.c) u32, .{ .name = "hb_ot_math_get_glyph_variants" });
    const ret = cFn(arg_font, arg_glyph, arg_direction, arg_start_offset, arg_variants_count, arg_variants);
    return .{ .ret = ret, .variants = arg_variants[0..@intCast(argO_variants_count)] };
}
pub fn otMathGetMinConnectorOverlap(arg_font: *font_t, arg_direction: direction_t) i32 {
    const cFn = @extern(*const fn (*font_t, direction_t) callconv(.c) i32, .{ .name = "hb_ot_math_get_min_connector_overlap" });
    const ret = cFn(arg_font, arg_direction);
    return ret;
}
pub const ot_math_glyph_part_flags_t = packed struct(u32) {
    extender: bool = false,
    _: u31 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_ot_math_glyph_part_flags_get_type" });
        return cFn();
    }
};
pub const ot_math_glyph_part_t = extern struct {
    glyph: u32,
    start_connector_length: i32,
    end_connector_length: i32,
    full_advance: i32,
    flags: ot_math_glyph_part_flags_t,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_ot_math_glyph_part_get_type" });
        return cFn();
    }
};
pub const ot_math_glyph_variant_t = extern struct {
    glyph: u32,
    advance: i32,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_ot_math_glyph_variant_get_type" });
        return cFn();
    }
};
pub fn otMathHasData(arg_face: *face_t) i32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) i32, .{ .name = "hb_ot_math_has_data" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn otMathIsGlyphExtendedShape(arg_face: *face_t, arg_glyph: u32) i32 {
    const cFn = @extern(*const fn (*face_t, u32) callconv(.c) i32, .{ .name = "hb_ot_math_is_glyph_extended_shape" });
    const ret = cFn(arg_face, arg_glyph);
    return ret;
}
pub const ot_math_kern_entry_t = extern struct {
    max_correction_height: i32,
    kern_value: i32,
};
pub const ot_math_kern_t = enum(u32) {
    top_right = 0,
    top_left = 1,
    bottom_right = 2,
    bottom_left = 3,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_ot_math_kern_get_type" });
        return cFn();
    }
};
pub fn otMetaGetEntryTags(arg_face: *face_t, arg_start_offset: u32, argS_entries: []ot_meta_tag_t) struct {
    ret: u32,
    entries: []ot_meta_tag_t,
} {
    const arg_entries: [*]ot_meta_tag_t = @ptrCast(argS_entries);
    var argO_entries_count: u32 = undefined;
    const arg_entries_count: ?*u32 = &argO_entries_count;
    const cFn = @extern(*const fn (*face_t, u32, ?*u32, [*]ot_meta_tag_t) callconv(.c) u32, .{ .name = "hb_ot_meta_get_entry_tags" });
    const ret = cFn(arg_face, arg_start_offset, arg_entries_count, arg_entries);
    return .{ .ret = ret, .entries = arg_entries[0..@intCast(argO_entries_count)] };
}
pub fn otMetaReferenceEntry(arg_face: *face_t, arg_meta_tag: ot_meta_tag_t) *blob_t {
    const cFn = @extern(*const fn (*face_t, ot_meta_tag_t) callconv(.c) *blob_t, .{ .name = "hb_ot_meta_reference_entry" });
    const ret = cFn(arg_face, arg_meta_tag);
    return ret;
}
pub const ot_meta_tag_t = enum(u32) {
    design_languages = 1684827751,
    supported_languages = 1936485991,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_ot_meta_tag_get_type" });
        return cFn();
    }
};
pub fn otMetricsGetPosition(arg_font: *font_t, arg_metrics_tag: ot_metrics_tag_t) struct {
    ret: i32,
    position: i32,
} {
    var argO_position: i32 = undefined;
    const arg_position: ?*i32 = &argO_position;
    const cFn = @extern(*const fn (*font_t, ot_metrics_tag_t, ?*i32) callconv(.c) i32, .{ .name = "hb_ot_metrics_get_position" });
    const ret = cFn(arg_font, arg_metrics_tag, arg_position);
    return .{ .ret = ret, .position = argO_position };
}
pub fn otMetricsGetPositionWithFallback(arg_font: *font_t, arg_metrics_tag: ot_metrics_tag_t) i32 {
    var argO_position: i32 = undefined;
    const arg_position: ?*i32 = &argO_position;
    const cFn = @extern(*const fn (*font_t, ot_metrics_tag_t, ?*i32) callconv(.c) void, .{ .name = "hb_ot_metrics_get_position_with_fallback" });
    const ret = cFn(arg_font, arg_metrics_tag, arg_position);
    _ = ret;
    return argO_position;
}
pub fn otMetricsGetVariation(arg_font: *font_t, arg_metrics_tag: ot_metrics_tag_t) f32 {
    const cFn = @extern(*const fn (*font_t, ot_metrics_tag_t) callconv(.c) f32, .{ .name = "hb_ot_metrics_get_variation" });
    const ret = cFn(arg_font, arg_metrics_tag);
    return ret;
}
pub fn otMetricsGetXVariation(arg_font: *font_t, arg_metrics_tag: ot_metrics_tag_t) i32 {
    const cFn = @extern(*const fn (*font_t, ot_metrics_tag_t) callconv(.c) i32, .{ .name = "hb_ot_metrics_get_x_variation" });
    const ret = cFn(arg_font, arg_metrics_tag);
    return ret;
}
pub fn otMetricsGetYVariation(arg_font: *font_t, arg_metrics_tag: ot_metrics_tag_t) i32 {
    const cFn = @extern(*const fn (*font_t, ot_metrics_tag_t) callconv(.c) i32, .{ .name = "hb_ot_metrics_get_y_variation" });
    const ret = cFn(arg_font, arg_metrics_tag);
    return ret;
}
pub const ot_metrics_tag_t = enum(u32) {
    horizontal_ascender = 1751216995,
    horizontal_descender = 1751413603,
    horizontal_line_gap = 1751934832,
    horizontal_clipping_ascent = 1751346273,
    horizontal_clipping_descent = 1751346276,
    vertical_ascender = 1986098019,
    vertical_descender = 1986294627,
    vertical_line_gap = 1986815856,
    horizontal_caret_rise = 1751347827,
    horizontal_caret_run = 1751347822,
    horizontal_caret_offset = 1751347046,
    vertical_caret_rise = 1986228851,
    vertical_caret_run = 1986228846,
    vertical_caret_offset = 1986228070,
    x_height = 2020108148,
    cap_height = 1668311156,
    subscript_em_x_size = 1935833203,
    subscript_em_y_size = 1935833459,
    subscript_em_x_offset = 1935833199,
    subscript_em_y_offset = 1935833455,
    superscript_em_x_size = 1936750707,
    superscript_em_y_size = 1936750963,
    superscript_em_x_offset = 1936750703,
    superscript_em_y_offset = 1936750959,
    strikeout_size = 1937011315,
    strikeout_offset = 1937011311,
    underline_size = 1970168947,
    underline_offset = 1970168943,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_ot_metrics_tag_get_type" });
        return cFn();
    }
};
pub const ot_name_entry_t = extern struct {
    name_id: u32,
    @"var": var_int_t,
    language: ?*language_t,
};
pub fn otNameGetUtf16(arg_face: *face_t, arg_name_id: u32, arg_language: *language_t, argS_text: []u16) struct {
    ret: u32,
    text: []u16,
} {
    const arg_text: [*]u16 = @ptrCast(argS_text);
    var argO_text_size: u32 = undefined;
    const arg_text_size: ?*u32 = &argO_text_size;
    const cFn = @extern(*const fn (*face_t, u32, *language_t, ?*u32, [*]u16) callconv(.c) u32, .{ .name = "hb_ot_name_get_utf16" });
    const ret = cFn(arg_face, arg_name_id, arg_language, arg_text_size, arg_text);
    return .{ .ret = ret, .text = arg_text[0..@intCast(argO_text_size)] };
}
pub fn otNameGetUtf32(arg_face: *face_t, arg_name_id: u32, arg_language: *language_t, argS_text: []u32) struct {
    ret: u32,
    text: []u32,
} {
    const arg_text: [*]u32 = @ptrCast(argS_text);
    var argO_text_size: u32 = undefined;
    const arg_text_size: ?*u32 = &argO_text_size;
    const cFn = @extern(*const fn (*face_t, u32, *language_t, ?*u32, [*]u32) callconv(.c) u32, .{ .name = "hb_ot_name_get_utf32" });
    const ret = cFn(arg_face, arg_name_id, arg_language, arg_text_size, arg_text);
    return .{ .ret = ret, .text = arg_text[0..@intCast(argO_text_size)] };
}
pub fn otNameGetUtf8(arg_face: *face_t, arg_name_id: u32, arg_language: *language_t, argS_text: [][*:0]const u8) struct {
    ret: u32,
    text: [][*:0]const u8,
} {
    const arg_text: [*][*:0]const u8 = @ptrCast(argS_text);
    var argO_text_size: u32 = undefined;
    const arg_text_size: ?*u32 = &argO_text_size;
    const cFn = @extern(*const fn (*face_t, u32, *language_t, ?*u32, [*][*:0]const u8) callconv(.c) u32, .{ .name = "hb_ot_name_get_utf8" });
    const ret = cFn(arg_face, arg_name_id, arg_language, arg_text_size, arg_text);
    return .{ .ret = ret, .text = arg_text[0..@intCast(argO_text_size)] };
}
pub const ot_name_id_predefined_t = enum(u32) {
    copyright = 0,
    font_family = 1,
    font_subfamily = 2,
    unique_id = 3,
    full_name = 4,
    version_string = 5,
    postscript_name = 6,
    trademark = 7,
    manufacturer = 8,
    designer = 9,
    description = 10,
    vendor_url = 11,
    designer_url = 12,
    license = 13,
    license_url = 14,
    typographic_family = 16,
    typographic_subfamily = 17,
    mac_full_name = 18,
    sample_text = 19,
    cid_findfont_name = 20,
    wws_family = 21,
    wws_subfamily = 22,
    light_background = 23,
    dark_background = 24,
    variations_ps_prefix = 25,
    invalid = 65535,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_ot_name_id_predefined_get_type" });
        return cFn();
    }
};
pub fn otNameListNames(arg_face: *face_t) []ot_name_entry_t {
    var argO_num_entries: u32 = undefined;
    const arg_num_entries: ?*u32 = &argO_num_entries;
    const cFn = @extern(*const fn (*face_t, ?*u32) callconv(.c) [*]ot_name_entry_t, .{ .name = "hb_ot_name_list_names" });
    const ret = cFn(arg_face, arg_num_entries);
    return ret[0..@intCast(argO_num_entries)];
}
pub fn otShapeGlyphsClosure(arg_font: *font_t, arg_buffer: *buffer_t, argS_features: []feature_t, arg_glyphs: *set_t) void {
    const arg_features: [*]feature_t = @ptrCast(argS_features);
    const arg_num_features: u32 = @intCast((argS_features).len);
    const cFn = @extern(*const fn (*font_t, *buffer_t, [*]feature_t, u32, *set_t) callconv(.c) void, .{ .name = "hb_ot_shape_glyphs_closure" });
    const ret = cFn(arg_font, arg_buffer, arg_features, arg_num_features, arg_glyphs);
    return ret;
}
pub fn otShapePlanCollectLookups(arg_shape_plan: *shape_plan_t, arg_table_tag: u32, arg_lookup_indexes: *set_t) void {
    const cFn = @extern(*const fn (*shape_plan_t, u32, *set_t) callconv(.c) void, .{ .name = "hb_ot_shape_plan_collect_lookups" });
    const ret = cFn(arg_shape_plan, arg_table_tag, arg_lookup_indexes);
    return ret;
}
pub fn otTagFromLanguage(arg_language: *language_t) u32 {
    const cFn = @extern(*const fn (*language_t) callconv(.c) u32, .{ .name = "hb_ot_tag_from_language" });
    const ret = cFn(arg_language);
    return ret;
}
pub fn otTagToLanguage(arg_tag: u32) ?*language_t {
    const cFn = @extern(*const fn (u32) callconv(.c) ?*language_t, .{ .name = "hb_ot_tag_to_language" });
    const ret = cFn(arg_tag);
    return ret;
}
pub fn otTagToScript(arg_tag: u32) script_t {
    const cFn = @extern(*const fn (u32) callconv(.c) script_t, .{ .name = "hb_ot_tag_to_script" });
    const ret = cFn(arg_tag);
    return ret;
}
pub fn otTagsFromScript(arg_script: script_t) struct {
    script_tag_1: u32,
    script_tag_2: u32,
} {
    var argO_script_tag_1: u32 = undefined;
    const arg_script_tag_1: *u32 = &argO_script_tag_1;
    var argO_script_tag_2: u32 = undefined;
    const arg_script_tag_2: *u32 = &argO_script_tag_2;
    const cFn = @extern(*const fn (script_t, *u32, *u32) callconv(.c) void, .{ .name = "hb_ot_tags_from_script" });
    const ret = cFn(arg_script, arg_script_tag_1, arg_script_tag_2);
    _ = ret;
    return .{ .script_tag_1 = argO_script_tag_1, .script_tag_2 = argO_script_tag_2 };
}
pub fn otTagsFromScriptAndLanguage(arg_script: script_t, arg_language: ?*language_t, arg_script_count: ?*u32, arg_language_count: ?*u32) struct {
    script_tags: u32,
    language_tags: u32,
} {
    var argO_script_tags: u32 = undefined;
    const arg_script_tags: ?*u32 = &argO_script_tags;
    var argO_language_tags: u32 = undefined;
    const arg_language_tags: ?*u32 = &argO_language_tags;
    const cFn = @extern(*const fn (script_t, ?*language_t, ?*u32, ?*u32, ?*u32, ?*u32) callconv(.c) void, .{ .name = "hb_ot_tags_from_script_and_language" });
    const ret = cFn(arg_script, arg_language, arg_script_count, arg_script_tags, arg_language_count, arg_language_tags);
    _ = ret;
    return .{ .script_tags = argO_script_tags, .language_tags = argO_language_tags };
}
pub fn otTagsToScriptAndLanguage(arg_script_tag: u32, arg_language_tag: u32, arg_language: ?**language_t) script_t {
    var argO_script: script_t = undefined;
    const arg_script: ?*script_t = &argO_script;
    const cFn = @extern(*const fn (u32, u32, ?*script_t, ?**language_t) callconv(.c) void, .{ .name = "hb_ot_tags_to_script_and_language" });
    const ret = cFn(arg_script_tag, arg_language_tag, arg_script, arg_language);
    _ = ret;
    return argO_script;
}
pub const ot_var_axis_flags_t = packed struct(u32) {
    hidden: bool = false,
    _: u31 = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_ot_var_axis_flags_get_type" });
        return cFn();
    }
};
pub const ot_var_axis_info_t = extern struct {
    axis_index: u32,
    tag: u32,
    name_id: u32,
    flags: ot_var_axis_flags_t,
    min_value: f32,
    default_value: f32,
    max_value: f32,
    reserved: u32,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_ot_var_axis_info_get_type" });
        return cFn();
    }
};
pub const ot_var_axis_t = extern struct {
    tag: u32,
    name_id: u32,
    min_value: f32,
    default_value: f32,
    max_value: f32,
};
pub fn otVarFindAxis(arg_face: *face_t, arg_axis_tag: u32, arg_axis_index: *u32, arg_axis_info: *ot_var_axis_t) i32 {
    const cFn = @extern(*const fn (*face_t, u32, *u32, *ot_var_axis_t) callconv(.c) i32, .{ .name = "hb_ot_var_find_axis" });
    const ret = cFn(arg_face, arg_axis_tag, arg_axis_index, arg_axis_info);
    return ret;
}
pub fn otVarFindAxisInfo(arg_face: *face_t, arg_axis_tag: u32, arg_axis_info: *ot_var_axis_info_t) i32 {
    const cFn = @extern(*const fn (*face_t, u32, *ot_var_axis_info_t) callconv(.c) i32, .{ .name = "hb_ot_var_find_axis_info" });
    const ret = cFn(arg_face, arg_axis_tag, arg_axis_info);
    return ret;
}
pub fn otVarGetAxes(arg_face: *face_t, arg_start_offset: u32, argS_axes_array: []ot_var_axis_t) struct {
    ret: u32,
    axes_array: []ot_var_axis_t,
} {
    const arg_axes_array: [*]ot_var_axis_t = @ptrCast(argS_axes_array);
    var argO_axes_count: u32 = undefined;
    const arg_axes_count: ?*u32 = &argO_axes_count;
    const cFn = @extern(*const fn (*face_t, u32, ?*u32, [*]ot_var_axis_t) callconv(.c) u32, .{ .name = "hb_ot_var_get_axes" });
    const ret = cFn(arg_face, arg_start_offset, arg_axes_count, arg_axes_array);
    return .{ .ret = ret, .axes_array = arg_axes_array[0..@intCast(argO_axes_count)] };
}
pub fn otVarGetAxisCount(arg_face: *face_t) u32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) u32, .{ .name = "hb_ot_var_get_axis_count" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn otVarGetAxisInfos(arg_face: *face_t, arg_start_offset: u32, argS_axes_array: []ot_var_axis_info_t) struct {
    ret: u32,
    axes_array: []ot_var_axis_info_t,
} {
    const arg_axes_array: [*]ot_var_axis_info_t = @ptrCast(argS_axes_array);
    var argO_axes_count: u32 = undefined;
    const arg_axes_count: ?*u32 = &argO_axes_count;
    const cFn = @extern(*const fn (*face_t, u32, ?*u32, [*]ot_var_axis_info_t) callconv(.c) u32, .{ .name = "hb_ot_var_get_axis_infos" });
    const ret = cFn(arg_face, arg_start_offset, arg_axes_count, arg_axes_array);
    return .{ .ret = ret, .axes_array = arg_axes_array[0..@intCast(argO_axes_count)] };
}
pub fn otVarGetNamedInstanceCount(arg_face: *face_t) u32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) u32, .{ .name = "hb_ot_var_get_named_instance_count" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn otVarHasData(arg_face: *face_t) i32 {
    const cFn = @extern(*const fn (*face_t) callconv(.c) i32, .{ .name = "hb_ot_var_has_data" });
    const ret = cFn(arg_face);
    return ret;
}
pub fn otVarNamedInstanceGetDesignCoords(arg_face: *face_t, arg_instance_index: u32) struct {
    ret: u32,
    coords: []f32,
} {
    var argO_coords_length: u32 = undefined;
    const arg_coords_length: ?*u32 = &argO_coords_length;
    var argO_coords: [*]f32 = undefined;
    const arg_coords: *[*]f32 = &argO_coords;
    const cFn = @extern(*const fn (*face_t, u32, ?*u32, *[*]f32) callconv(.c) u32, .{ .name = "hb_ot_var_named_instance_get_design_coords" });
    const ret = cFn(arg_face, arg_instance_index, arg_coords_length, arg_coords);
    return .{ .ret = ret, .coords = argO_coords[0..@intCast(argO_coords_length)] };
}
pub fn otVarNamedInstanceGetPostscriptNameId(arg_face: *face_t, arg_instance_index: u32) u32 {
    const cFn = @extern(*const fn (*face_t, u32) callconv(.c) u32, .{ .name = "hb_ot_var_named_instance_get_postscript_name_id" });
    const ret = cFn(arg_face, arg_instance_index);
    return ret;
}
pub fn otVarNamedInstanceGetSubfamilyNameId(arg_face: *face_t, arg_instance_index: u32) u32 {
    const cFn = @extern(*const fn (*face_t, u32) callconv(.c) u32, .{ .name = "hb_ot_var_named_instance_get_subfamily_name_id" });
    const ret = cFn(arg_face, arg_instance_index);
    return ret;
}
pub fn otVarNormalizeCoords(arg_face: *face_t, arg_coords_length: u32, arg_design_coords: *f32) i32 {
    var argO_normalized_coords: i32 = undefined;
    const arg_normalized_coords: *i32 = &argO_normalized_coords;
    const cFn = @extern(*const fn (*face_t, u32, *f32, *i32) callconv(.c) void, .{ .name = "hb_ot_var_normalize_coords" });
    const ret = cFn(arg_face, arg_coords_length, arg_design_coords, arg_normalized_coords);
    _ = ret;
    return argO_normalized_coords;
}
pub fn otVarNormalizeVariations(arg_face: *face_t, arg_variations: *variation_t, arg_variations_length: u32) []i32 {
    var argO_coords: [*]i32 = undefined;
    const arg_coords: *[*]i32 = &argO_coords;
    var argO_coords_length: u32 = undefined;
    const arg_coords_length: *u32 = &argO_coords_length;
    const cFn = @extern(*const fn (*face_t, *variation_t, u32, *[*]i32, *u32) callconv(.c) void, .{ .name = "hb_ot_var_normalize_variations" });
    const ret = cFn(arg_face, arg_variations, arg_variations_length, arg_coords, arg_coords_length);
    _ = ret;
    return argO_coords[0..@intCast(argO_coords_length)];
}
pub fn paintColor(arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_is_foreground: i32, arg_color: u32) void {
    const cFn = @extern(*const fn (*paint_funcs_t, ?*anyopaque, i32, u32) callconv(.c) void, .{ .name = "hb_paint_color" });
    const ret = cFn(arg_funcs, @ptrCast(arg_paint_data), arg_is_foreground, arg_color);
    return ret;
}
pub const paint_color_func_t = *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_is_foreground: i32, arg_color: u32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn paintColorGlyph(arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_glyph: u32, arg_font: *font_t) i32 {
    const cFn = @extern(*const fn (*paint_funcs_t, ?*anyopaque, u32, *font_t) callconv(.c) i32, .{ .name = "hb_paint_color_glyph" });
    const ret = cFn(arg_funcs, @ptrCast(arg_paint_data), arg_glyph, arg_font);
    return ret;
}
pub const paint_color_glyph_func_t = *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_glyph: u32, arg_font: *font_t, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub const paint_composite_mode_t = enum(u32) {
    clear = 0,
    src = 1,
    dest = 2,
    src_over = 3,
    dest_over = 4,
    src_in = 5,
    dest_in = 6,
    src_out = 7,
    dest_out = 8,
    src_atop = 9,
    dest_atop = 10,
    xor = 11,
    plus = 12,
    screen = 13,
    overlay = 14,
    darken = 15,
    lighten = 16,
    color_dodge = 17,
    color_burn = 18,
    hard_light = 19,
    soft_light = 20,
    difference = 21,
    exclusion = 22,
    multiply = 23,
    hsl_hue = 24,
    hsl_saturation = 25,
    hsl_color = 26,
    hsl_luminosity = 27,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_paint_composite_mode_get_type" });
        return cFn();
    }
};
pub fn paintCustomPaletteColor(arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_index: u32) struct {
    ret: i32,
    color: u32,
} {
    var argO_color: u32 = undefined;
    const arg_color: *u32 = &argO_color;
    const cFn = @extern(*const fn (*paint_funcs_t, ?*anyopaque, u32, *u32) callconv(.c) i32, .{ .name = "hb_paint_custom_palette_color" });
    const ret = cFn(arg_funcs, @ptrCast(arg_paint_data), arg_color_index, arg_color);
    return .{ .ret = ret, .color = argO_color };
}
pub const paint_custom_palette_color_func_t = *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_index: u32, arg_color: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub const paint_extend_t = enum(u32) {
    pad = 0,
    repeat = 1,
    reflect = 2,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_paint_extend_get_type" });
        return cFn();
    }
};
pub fn paintFuncsCreate() *paint_funcs_t {
    const cFn = @extern(*const fn () callconv(.c) *paint_funcs_t, .{ .name = "hb_paint_funcs_create" });
    const ret = cFn();
    return ret;
}
pub fn paintFuncsGetEmpty() *paint_funcs_t {
    const cFn = @extern(*const fn () callconv(.c) *paint_funcs_t, .{ .name = "hb_paint_funcs_get_empty" });
    const ret = cFn();
    return ret;
}
pub fn paintFuncsIsImmutable(arg_funcs: *paint_funcs_t) i32 {
    const cFn = @extern(*const fn (*paint_funcs_t) callconv(.c) i32, .{ .name = "hb_paint_funcs_is_immutable" });
    const ret = cFn(arg_funcs);
    return ret;
}
pub fn paintFuncsMakeImmutable(arg_funcs: *paint_funcs_t) void {
    const cFn = @extern(*const fn (*paint_funcs_t) callconv(.c) void, .{ .name = "hb_paint_funcs_make_immutable" });
    const ret = cFn(arg_funcs);
    return ret;
}
pub fn paintFuncsSetColorFunc(arg_funcs: *paint_funcs_t, argC_func: core.Closure(*const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_is_foreground: i32, arg_color: u32, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_is_foreground: i32, arg_color: u32, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*paint_funcs_t, *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_is_foreground: i32, arg_color: u32, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_paint_funcs_set_color_func" });
    const ret = cFn(arg_funcs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn paintFuncsSetColorGlyphFunc(arg_funcs: *paint_funcs_t, argC_func: core.Closure(*const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_glyph: u32, arg_font: *font_t, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_glyph: u32, arg_font: *font_t, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*paint_funcs_t, *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_glyph: u32, arg_font: *font_t, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_paint_funcs_set_color_glyph_func" });
    const ret = cFn(arg_funcs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn paintFuncsSetCustomPaletteColorFunc(arg_funcs: *paint_funcs_t, argC_func: core.Closure(*const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_index: u32, arg_color: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_index: u32, arg_color: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*paint_funcs_t, *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_index: u32, arg_color: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_paint_funcs_set_custom_palette_color_func" });
    const ret = cFn(arg_funcs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn paintFuncsSetImageFunc(arg_funcs: *paint_funcs_t, argC_func: core.Closure(*const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_image: *blob_t, arg_width: u32, arg_height: u32, arg_format: u32, arg_slant: f32, arg_extents: ?*glyph_extents_t, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_image: *blob_t, arg_width: u32, arg_height: u32, arg_format: u32, arg_slant: f32, arg_extents: ?*glyph_extents_t, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*paint_funcs_t, *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_image: *blob_t, arg_width: u32, arg_height: u32, arg_format: u32, arg_slant: f32, arg_extents: ?*glyph_extents_t, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_paint_funcs_set_image_func" });
    const ret = cFn(arg_funcs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn paintFuncsSetLinearGradientFunc(arg_funcs: *paint_funcs_t, argC_func: core.Closure(*const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_line: *color_line_t, arg_x0: f32, arg_y0: f32, arg_x1: f32, arg_y1: f32, arg_x2: f32, arg_y2: f32, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_line: *color_line_t, arg_x0: f32, arg_y0: f32, arg_x1: f32, arg_y1: f32, arg_x2: f32, arg_y2: f32, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*paint_funcs_t, *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_line: *color_line_t, arg_x0: f32, arg_y0: f32, arg_x1: f32, arg_y1: f32, arg_x2: f32, arg_y2: f32, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_paint_funcs_set_linear_gradient_func" });
    const ret = cFn(arg_funcs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn paintFuncsSetPopClipFunc(arg_funcs: *paint_funcs_t, argC_func: core.Closure(*const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*paint_funcs_t, *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_paint_funcs_set_pop_clip_func" });
    const ret = cFn(arg_funcs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn paintFuncsSetPopGroupFunc(arg_funcs: *paint_funcs_t, argC_func: core.Closure(*const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_mode: paint_composite_mode_t, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_mode: paint_composite_mode_t, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*paint_funcs_t, *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_mode: paint_composite_mode_t, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_paint_funcs_set_pop_group_func" });
    const ret = cFn(arg_funcs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn paintFuncsSetPopTransformFunc(arg_funcs: *paint_funcs_t, argC_func: core.Closure(*const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*paint_funcs_t, *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_paint_funcs_set_pop_transform_func" });
    const ret = cFn(arg_funcs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn paintFuncsSetPushClipGlyphFunc(arg_funcs: *paint_funcs_t, argC_func: core.Closure(*const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_glyph: u32, arg_font: *font_t, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_glyph: u32, arg_font: *font_t, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*paint_funcs_t, *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_glyph: u32, arg_font: *font_t, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_paint_funcs_set_push_clip_glyph_func" });
    const ret = cFn(arg_funcs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn paintFuncsSetPushClipRectangleFunc(arg_funcs: *paint_funcs_t, argC_func: core.Closure(*const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_xmin: f32, arg_ymin: f32, arg_xmax: f32, arg_ymax: f32, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_xmin: f32, arg_ymin: f32, arg_xmax: f32, arg_ymax: f32, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*paint_funcs_t, *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_xmin: f32, arg_ymin: f32, arg_xmax: f32, arg_ymax: f32, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_paint_funcs_set_push_clip_rectangle_func" });
    const ret = cFn(arg_funcs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn paintFuncsSetPushGroupFunc(arg_funcs: *paint_funcs_t, argC_func: core.Closure(*const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*paint_funcs_t, *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_paint_funcs_set_push_group_func" });
    const ret = cFn(arg_funcs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn paintFuncsSetPushTransformFunc(arg_funcs: *paint_funcs_t, argC_func: core.Closure(*const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_xx: f32, arg_yx: f32, arg_xy: f32, arg_yy: f32, arg_dx: f32, arg_dy: f32, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_xx: f32, arg_yx: f32, arg_xy: f32, arg_yy: f32, arg_dx: f32, arg_dy: f32, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*paint_funcs_t, *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_xx: f32, arg_yx: f32, arg_xy: f32, arg_yy: f32, arg_dx: f32, arg_dy: f32, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_paint_funcs_set_push_transform_func" });
    const ret = cFn(arg_funcs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn paintFuncsSetRadialGradientFunc(arg_funcs: *paint_funcs_t, argC_func: core.Closure(*const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_line: *color_line_t, arg_x0: f32, arg_y0: f32, arg_r0: f32, arg_x1: f32, arg_y1: f32, arg_r1: f32, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_line: *color_line_t, arg_x0: f32, arg_y0: f32, arg_r0: f32, arg_x1: f32, arg_y1: f32, arg_r1: f32, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*paint_funcs_t, *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_line: *color_line_t, arg_x0: f32, arg_y0: f32, arg_r0: f32, arg_x1: f32, arg_y1: f32, arg_r1: f32, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_paint_funcs_set_radial_gradient_func" });
    const ret = cFn(arg_funcs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn paintFuncsSetSweepGradientFunc(arg_funcs: *paint_funcs_t, argC_func: core.Closure(*const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_line: *color_line_t, arg_x0: f32, arg_y0: f32, arg_start_angle: f32, arg_end_angle: f32, arg_user_data: ?*anyopaque) callconv(.c) void)) void {
    const arg_func: *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_line: *color_line_t, arg_x0: f32, arg_y0: f32, arg_start_angle: f32, arg_end_angle: f32, arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*paint_funcs_t, *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_line: *color_line_t, arg_x0: f32, arg_y0: f32, arg_start_angle: f32, arg_end_angle: f32, arg_user_data: ?*anyopaque) callconv(.c) void, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_paint_funcs_set_sweep_gradient_func" });
    const ret = cFn(arg_funcs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub const paint_funcs_t = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_paint_funcs_get_type" });
        return cFn();
    }
};
pub fn paintImage(arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_image: *blob_t, arg_width: u32, arg_height: u32, arg_format: u32, arg_slant: f32, arg_extents: ?*glyph_extents_t) void {
    const cFn = @extern(*const fn (*paint_funcs_t, ?*anyopaque, *blob_t, u32, u32, u32, f32, ?*glyph_extents_t) callconv(.c) void, .{ .name = "hb_paint_image" });
    const ret = cFn(arg_funcs, @ptrCast(arg_paint_data), arg_image, arg_width, arg_height, arg_format, arg_slant, arg_extents);
    return ret;
}
pub const paint_image_func_t = *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_image: *blob_t, arg_width: u32, arg_height: u32, arg_format: u32, arg_slant: f32, arg_extents: ?*glyph_extents_t, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub fn paintLinearGradient(arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_line: *color_line_t, arg_x0: f32, arg_y0: f32, arg_x1: f32, arg_y1: f32, arg_x2: f32, arg_y2: f32) void {
    const cFn = @extern(*const fn (*paint_funcs_t, ?*anyopaque, *color_line_t, f32, f32, f32, f32, f32, f32) callconv(.c) void, .{ .name = "hb_paint_linear_gradient" });
    const ret = cFn(arg_funcs, @ptrCast(arg_paint_data), arg_color_line, arg_x0, arg_y0, arg_x1, arg_y1, arg_x2, arg_y2);
    return ret;
}
pub const paint_linear_gradient_func_t = *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_line: *color_line_t, arg_x0: f32, arg_y0: f32, arg_x1: f32, arg_y1: f32, arg_x2: f32, arg_y2: f32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn paintPopClip(arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*paint_funcs_t, ?*anyopaque) callconv(.c) void, .{ .name = "hb_paint_pop_clip" });
    const ret = cFn(arg_funcs, @ptrCast(arg_paint_data));
    return ret;
}
pub const paint_pop_clip_func_t = *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn paintPopGroup(arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_mode: paint_composite_mode_t) void {
    const cFn = @extern(*const fn (*paint_funcs_t, ?*anyopaque, paint_composite_mode_t) callconv(.c) void, .{ .name = "hb_paint_pop_group" });
    const ret = cFn(arg_funcs, @ptrCast(arg_paint_data), arg_mode);
    return ret;
}
pub const paint_pop_group_func_t = *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_mode: paint_composite_mode_t, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn paintPopTransform(arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*paint_funcs_t, ?*anyopaque) callconv(.c) void, .{ .name = "hb_paint_pop_transform" });
    const ret = cFn(arg_funcs, @ptrCast(arg_paint_data));
    return ret;
}
pub const paint_pop_transform_func_t = *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn paintPushClipGlyph(arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_glyph: u32, arg_font: *font_t) void {
    const cFn = @extern(*const fn (*paint_funcs_t, ?*anyopaque, u32, *font_t) callconv(.c) void, .{ .name = "hb_paint_push_clip_glyph" });
    const ret = cFn(arg_funcs, @ptrCast(arg_paint_data), arg_glyph, arg_font);
    return ret;
}
pub const paint_push_clip_glyph_func_t = *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_glyph: u32, arg_font: *font_t, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn paintPushClipRectangle(arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_xmin: f32, arg_ymin: f32, arg_xmax: f32, arg_ymax: f32) void {
    const cFn = @extern(*const fn (*paint_funcs_t, ?*anyopaque, f32, f32, f32, f32) callconv(.c) void, .{ .name = "hb_paint_push_clip_rectangle" });
    const ret = cFn(arg_funcs, @ptrCast(arg_paint_data), arg_xmin, arg_ymin, arg_xmax, arg_ymax);
    return ret;
}
pub const paint_push_clip_rectangle_func_t = *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_xmin: f32, arg_ymin: f32, arg_xmax: f32, arg_ymax: f32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn paintPushGroup(arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque) void {
    const cFn = @extern(*const fn (*paint_funcs_t, ?*anyopaque) callconv(.c) void, .{ .name = "hb_paint_push_group" });
    const ret = cFn(arg_funcs, @ptrCast(arg_paint_data));
    return ret;
}
pub const paint_push_group_func_t = *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn paintPushTransform(arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_xx: f32, arg_yx: f32, arg_xy: f32, arg_yy: f32, arg_dx: f32, arg_dy: f32) void {
    const cFn = @extern(*const fn (*paint_funcs_t, ?*anyopaque, f32, f32, f32, f32, f32, f32) callconv(.c) void, .{ .name = "hb_paint_push_transform" });
    const ret = cFn(arg_funcs, @ptrCast(arg_paint_data), arg_xx, arg_yx, arg_xy, arg_yy, arg_dx, arg_dy);
    return ret;
}
pub const paint_push_transform_func_t = *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_xx: f32, arg_yx: f32, arg_xy: f32, arg_yy: f32, arg_dx: f32, arg_dy: f32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn paintRadialGradient(arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_line: *color_line_t, arg_x0: f32, arg_y0: f32, arg_r0: f32, arg_x1: f32, arg_y1: f32, arg_r1: f32) void {
    const cFn = @extern(*const fn (*paint_funcs_t, ?*anyopaque, *color_line_t, f32, f32, f32, f32, f32, f32) callconv(.c) void, .{ .name = "hb_paint_radial_gradient" });
    const ret = cFn(arg_funcs, @ptrCast(arg_paint_data), arg_color_line, arg_x0, arg_y0, arg_r0, arg_x1, arg_y1, arg_r1);
    return ret;
}
pub const paint_radial_gradient_func_t = *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_line: *color_line_t, arg_x0: f32, arg_y0: f32, arg_r0: f32, arg_x1: f32, arg_y1: f32, arg_r1: f32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub fn paintSweepGradient(arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_line: *color_line_t, arg_x0: f32, arg_y0: f32, arg_start_angle: f32, arg_end_angle: f32) void {
    const cFn = @extern(*const fn (*paint_funcs_t, ?*anyopaque, *color_line_t, f32, f32, f32, f32) callconv(.c) void, .{ .name = "hb_paint_sweep_gradient" });
    const ret = cFn(arg_funcs, @ptrCast(arg_paint_data), arg_color_line, arg_x0, arg_y0, arg_start_angle, arg_end_angle);
    return ret;
}
pub const paint_sweep_gradient_func_t = *const fn (arg_funcs: *paint_funcs_t, arg_paint_data: ?*anyopaque, arg_color_line: *color_line_t, arg_x0: f32, arg_y0: f32, arg_start_angle: f32, arg_end_angle: f32, arg_user_data: ?*anyopaque) callconv(.c) void;
pub const reference_table_func_t = *const fn (arg_face: *face_t, arg_tag: u32, arg_user_data: ?*anyopaque) callconv(.c) *blob_t;
pub fn scriptFromIso15924Tag(arg_tag: u32) script_t {
    const cFn = @extern(*const fn (u32) callconv(.c) script_t, .{ .name = "hb_script_from_iso15924_tag" });
    const ret = cFn(arg_tag);
    return ret;
}
pub fn scriptFromString(argS_str: []u8) script_t {
    const arg_str: [*]u8 = @ptrCast(argS_str);
    const arg_len: i32 = @intCast((argS_str).len);
    const cFn = @extern(*const fn ([*]u8, i32) callconv(.c) script_t, .{ .name = "hb_script_from_string" });
    const ret = cFn(arg_str, arg_len);
    return ret;
}
pub fn scriptGetHorizontalDirection(arg_script: script_t) direction_t {
    const cFn = @extern(*const fn (script_t) callconv(.c) direction_t, .{ .name = "hb_script_get_horizontal_direction" });
    const ret = cFn(arg_script);
    return ret;
}
pub const script_t = enum(u32) {
    common = 1517910393,
    inherited = 1516858984,
    unknown = 1517976186,
    arabic = 1098015074,
    armenian = 1098018158,
    bengali = 1113943655,
    cyrillic = 1132032620,
    devanagari = 1147500129,
    georgian = 1197830002,
    greek = 1198679403,
    gujarati = 1198877298,
    gurmukhi = 1198879349,
    hangul = 1214344807,
    han = 1214344809,
    hebrew = 1214603890,
    hiragana = 1214870113,
    kannada = 1265525857,
    katakana = 1264676449,
    lao = 1281453935,
    latin = 1281455214,
    malayalam = 1298954605,
    oriya = 1332902241,
    tamil = 1415671148,
    telugu = 1415933045,
    thai = 1416126825,
    tibetan = 1416192628,
    bopomofo = 1114599535,
    braille = 1114792297,
    canadian_syllabics = 1130458739,
    cherokee = 1130915186,
    ethiopic = 1165256809,
    khmer = 1265134962,
    mongolian = 1299148391,
    myanmar = 1299803506,
    ogham = 1332175213,
    runic = 1383427698,
    sinhala = 1399418472,
    syriac = 1400468067,
    thaana = 1416126817,
    yi = 1500080489,
    deseret = 1148416628,
    gothic = 1198486632,
    old_italic = 1232363884,
    buhid = 1114990692,
    hanunoo = 1214344815,
    tagalog = 1416064103,
    tagbanwa = 1415669602,
    cypriot = 1131442804,
    limbu = 1281977698,
    linear_b = 1281977954,
    osmanya = 1332964705,
    shavian = 1399349623,
    tai_le = 1415670885,
    ugaritic = 1432838514,
    buginese = 1114990441,
    coptic = 1131376756,
    glagolitic = 1198285159,
    kharoshthi = 1265131890,
    new_tai_lue = 1415670901,
    old_persian = 1483761007,
    syloti_nagri = 1400466543,
    tifinagh = 1415999079,
    balinese = 1113681001,
    cuneiform = 1483961720,
    nko = 1315663727,
    phags_pa = 1349017959,
    phoenician = 1349021304,
    carian = 1130459753,
    cham = 1130914157,
    kayah_li = 1264675945,
    lepcha = 1281716323,
    lycian = 1283023721,
    lydian = 1283023977,
    ol_chiki = 1332503403,
    rejang = 1382706791,
    saurashtra = 1398895986,
    sundanese = 1400204900,
    vai = 1449224553,
    avestan = 1098281844,
    bamum = 1113681269,
    egyptian_hieroglyphs = 1164409200,
    imperial_aramaic = 1098018153,
    inscriptional_pahlavi = 1349020777,
    inscriptional_parthian = 1349678185,
    javanese = 1247901281,
    kaithi = 1265920105,
    lisu = 1281979253,
    meetei_mayek = 1299473769,
    old_south_arabian = 1398895202,
    old_turkic = 1332898664,
    samaritan = 1398893938,
    tai_tham = 1281453665,
    tai_viet = 1415673460,
    batak = 1113683051,
    brahmi = 1114792296,
    mandaic = 1298230884,
    chakma = 1130457965,
    meroitic_cursive = 1298494051,
    meroitic_hieroglyphs = 1298494063,
    miao = 1349284452,
    sharada = 1399353956,
    sora_sompeng = 1399812705,
    takri = 1415670642,
    bassa_vah = 1113682803,
    caucasian_albanian = 1097295970,
    duployan = 1148547180,
    elbasan = 1164730977,
    grantha = 1198678382,
    khojki = 1265135466,
    khudawadi = 1399418468,
    linear_a = 1281977953,
    mahajani = 1298229354,
    manichaean = 1298230889,
    mende_kikakui = 1298493028,
    modi = 1299145833,
    mro = 1299345263,
    nabataean = 1315070324,
    old_north_arabian = 1315009122,
    old_permic = 1348825709,
    pahawh_hmong = 1215131239,
    palmyrene = 1348562029,
    pau_cin_hau = 1348564323,
    psalter_pahlavi = 1349020784,
    siddham = 1399415908,
    tirhuta = 1416196712,
    warang_citi = 1466004065,
    ahom = 1097363309,
    anatolian_hieroglyphs = 1215067511,
    hatran = 1214346354,
    multani = 1299541108,
    old_hungarian = 1215655527,
    signwriting = 1399287415,
    adlam = 1097100397,
    bhaiksuki = 1114139507,
    marchen = 1298231907,
    osage = 1332963173,
    tangut = 1415671399,
    newa = 1315272545,
    masaram_gondi = 1198485101,
    nushu = 1316186229,
    soyombo = 1399814511,
    zanabazar_square = 1516334690,
    dogra = 1148151666,
    gunjala_gondi = 1198485095,
    hanifi_rohingya = 1383032935,
    makasar = 1298230113,
    medefaidrin = 1298490470,
    old_sogdian = 1399809903,
    sogdian = 1399809892,
    elymaic = 1164736877,
    nandinagari = 1315008100,
    nyiakeng_puachue_hmong = 1215131248,
    wancho = 1466132591,
    chorasmian = 1130918515,
    dives_akuru = 1147756907,
    khitan_small_script = 1265202291,
    yezidi = 1499822697,
    cypro_minoan = 1131441518,
    old_uyghur = 1333094258,
    tangsa = 1416524641,
    toto = 1416590447,
    vithkuqi = 1449751656,
    math = 1517122664,
    kawi = 1264678761,
    nag_mundari = 1315006317,
    garay = 1197568609,
    gurung_khema = 1198877544,
    kirat_rai = 1265787241,
    ol_onal = 1332633967,
    sunuwar = 1400204917,
    todhri = 1416586354,
    tulu_tigalari = 1416983655,
    invalid = 0,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_script_get_type" });
        return cFn();
    }
};
pub fn scriptToIso15924Tag(arg_script: script_t) u32 {
    const cFn = @extern(*const fn (script_t) callconv(.c) u32, .{ .name = "hb_script_to_iso15924_tag" });
    const ret = cFn(arg_script);
    return ret;
}
pub fn segmentPropertiesEqual(arg_a: *segment_properties_t, arg_b: *segment_properties_t) i32 {
    const cFn = @extern(*const fn (*segment_properties_t, *segment_properties_t) callconv(.c) i32, .{ .name = "hb_segment_properties_equal" });
    const ret = cFn(arg_a, arg_b);
    return ret;
}
pub fn segmentPropertiesHash(arg_p: *segment_properties_t) u32 {
    const cFn = @extern(*const fn (*segment_properties_t) callconv(.c) u32, .{ .name = "hb_segment_properties_hash" });
    const ret = cFn(arg_p);
    return ret;
}
pub fn segmentPropertiesOverlay(arg_p: *segment_properties_t, arg_src: *segment_properties_t) void {
    const cFn = @extern(*const fn (*segment_properties_t, *segment_properties_t) callconv(.c) void, .{ .name = "hb_segment_properties_overlay" });
    const ret = cFn(arg_p, arg_src);
    return ret;
}
pub const segment_properties_t = extern struct {
    direction: direction_t,
    script: script_t,
    language: ?*language_t,
    reserved1: ?*anyopaque,
    reserved2: ?*anyopaque,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_segment_properties_get_type" });
        return cFn();
    }
};
pub fn setAdd(arg_set: *set_t, arg_codepoint: u32) void {
    const cFn = @extern(*const fn (*set_t, u32) callconv(.c) void, .{ .name = "hb_set_add" });
    const ret = cFn(arg_set, arg_codepoint);
    return ret;
}
pub fn setAddRange(arg_set: *set_t, arg_first: u32, arg_last: u32) void {
    const cFn = @extern(*const fn (*set_t, u32, u32) callconv(.c) void, .{ .name = "hb_set_add_range" });
    const ret = cFn(arg_set, arg_first, arg_last);
    return ret;
}
pub fn setAddSortedArray(arg_set: *set_t, argS_sorted_codepoints: []u32) void {
    const arg_sorted_codepoints: [*]u32 = @ptrCast(argS_sorted_codepoints);
    const arg_num_codepoints: u32 = @intCast((argS_sorted_codepoints).len);
    const cFn = @extern(*const fn (*set_t, [*]u32, u32) callconv(.c) void, .{ .name = "hb_set_add_sorted_array" });
    const ret = cFn(arg_set, arg_sorted_codepoints, arg_num_codepoints);
    return ret;
}
pub fn setAllocationSuccessful(arg_set: *set_t) i32 {
    const cFn = @extern(*const fn (*set_t) callconv(.c) i32, .{ .name = "hb_set_allocation_successful" });
    const ret = cFn(arg_set);
    return ret;
}
pub fn setClear(arg_set: *set_t) void {
    const cFn = @extern(*const fn (*set_t) callconv(.c) void, .{ .name = "hb_set_clear" });
    const ret = cFn(arg_set);
    return ret;
}
pub fn setCopy(arg_set: *set_t) *set_t {
    const cFn = @extern(*const fn (*set_t) callconv(.c) *set_t, .{ .name = "hb_set_copy" });
    const ret = cFn(arg_set);
    return ret;
}
pub fn setCreate() *set_t {
    const cFn = @extern(*const fn () callconv(.c) *set_t, .{ .name = "hb_set_create" });
    const ret = cFn();
    return ret;
}
pub fn setDel(arg_set: *set_t, arg_codepoint: u32) void {
    const cFn = @extern(*const fn (*set_t, u32) callconv(.c) void, .{ .name = "hb_set_del" });
    const ret = cFn(arg_set, arg_codepoint);
    return ret;
}
pub fn setDelRange(arg_set: *set_t, arg_first: u32, arg_last: u32) void {
    const cFn = @extern(*const fn (*set_t, u32, u32) callconv(.c) void, .{ .name = "hb_set_del_range" });
    const ret = cFn(arg_set, arg_first, arg_last);
    return ret;
}
pub fn setGetEmpty() *set_t {
    const cFn = @extern(*const fn () callconv(.c) *set_t, .{ .name = "hb_set_get_empty" });
    const ret = cFn();
    return ret;
}
pub fn setGetMax(arg_set: *set_t) u32 {
    const cFn = @extern(*const fn (*set_t) callconv(.c) u32, .{ .name = "hb_set_get_max" });
    const ret = cFn(arg_set);
    return ret;
}
pub fn setGetMin(arg_set: *set_t) u32 {
    const cFn = @extern(*const fn (*set_t) callconv(.c) u32, .{ .name = "hb_set_get_min" });
    const ret = cFn(arg_set);
    return ret;
}
pub fn setGetPopulation(arg_set: *set_t) u32 {
    const cFn = @extern(*const fn (*set_t) callconv(.c) u32, .{ .name = "hb_set_get_population" });
    const ret = cFn(arg_set);
    return ret;
}
pub fn setHas(arg_set: *set_t, arg_codepoint: u32) i32 {
    const cFn = @extern(*const fn (*set_t, u32) callconv(.c) i32, .{ .name = "hb_set_has" });
    const ret = cFn(arg_set, arg_codepoint);
    return ret;
}
pub fn setHash(arg_set: *set_t) u32 {
    const cFn = @extern(*const fn (*set_t) callconv(.c) u32, .{ .name = "hb_set_hash" });
    const ret = cFn(arg_set);
    return ret;
}
pub fn setIntersect(arg_set: *set_t, arg_other: *set_t) void {
    const cFn = @extern(*const fn (*set_t, *set_t) callconv(.c) void, .{ .name = "hb_set_intersect" });
    const ret = cFn(arg_set, arg_other);
    return ret;
}
pub fn setInvert(arg_set: *set_t) void {
    const cFn = @extern(*const fn (*set_t) callconv(.c) void, .{ .name = "hb_set_invert" });
    const ret = cFn(arg_set);
    return ret;
}
pub fn setIsEmpty(arg_set: *set_t) i32 {
    const cFn = @extern(*const fn (*set_t) callconv(.c) i32, .{ .name = "hb_set_is_empty" });
    const ret = cFn(arg_set);
    return ret;
}
pub fn setIsEqual(arg_set: *set_t, arg_other: *set_t) i32 {
    const cFn = @extern(*const fn (*set_t, *set_t) callconv(.c) i32, .{ .name = "hb_set_is_equal" });
    const ret = cFn(arg_set, arg_other);
    return ret;
}
pub fn setIsInverted(arg_set: *set_t) i32 {
    const cFn = @extern(*const fn (*set_t) callconv(.c) i32, .{ .name = "hb_set_is_inverted" });
    const ret = cFn(arg_set);
    return ret;
}
pub fn setIsSubset(arg_set: *set_t, arg_larger_set: *set_t) i32 {
    const cFn = @extern(*const fn (*set_t, *set_t) callconv(.c) i32, .{ .name = "hb_set_is_subset" });
    const ret = cFn(arg_set, arg_larger_set);
    return ret;
}
pub fn setNext(arg_set: *set_t, arg_codepoint: *u32) i32 {
    const cFn = @extern(*const fn (*set_t, *u32) callconv(.c) i32, .{ .name = "hb_set_next" });
    const ret = cFn(arg_set, arg_codepoint);
    return ret;
}
pub fn setNextMany(arg_set: *set_t, arg_codepoint: u32, argS_out: []u32) u32 {
    const arg_out: [*]u32 = @ptrCast(argS_out);
    const arg_size: u32 = @intCast((argS_out).len);
    const cFn = @extern(*const fn (*set_t, u32, [*]u32, u32) callconv(.c) u32, .{ .name = "hb_set_next_many" });
    const ret = cFn(arg_set, arg_codepoint, arg_out, arg_size);
    return ret;
}
pub fn setNextRange(arg_set: *set_t, arg_last: *u32) struct {
    ret: i32,
    first: u32,
} {
    var argO_first: u32 = undefined;
    const arg_first: *u32 = &argO_first;
    const cFn = @extern(*const fn (*set_t, *u32, *u32) callconv(.c) i32, .{ .name = "hb_set_next_range" });
    const ret = cFn(arg_set, arg_first, arg_last);
    return .{ .ret = ret, .first = argO_first };
}
pub fn setPrevious(arg_set: *set_t, arg_codepoint: *u32) i32 {
    const cFn = @extern(*const fn (*set_t, *u32) callconv(.c) i32, .{ .name = "hb_set_previous" });
    const ret = cFn(arg_set, arg_codepoint);
    return ret;
}
pub fn setPreviousRange(arg_set: *set_t, arg_first: *u32) struct {
    ret: i32,
    last: u32,
} {
    var argO_last: u32 = undefined;
    const arg_last: *u32 = &argO_last;
    const cFn = @extern(*const fn (*set_t, *u32, *u32) callconv(.c) i32, .{ .name = "hb_set_previous_range" });
    const ret = cFn(arg_set, arg_first, arg_last);
    return .{ .ret = ret, .last = argO_last };
}
pub fn setSet(arg_set: *set_t, arg_other: *set_t) void {
    const cFn = @extern(*const fn (*set_t, *set_t) callconv(.c) void, .{ .name = "hb_set_set" });
    const ret = cFn(arg_set, arg_other);
    return ret;
}
pub fn setSubtract(arg_set: *set_t, arg_other: *set_t) void {
    const cFn = @extern(*const fn (*set_t, *set_t) callconv(.c) void, .{ .name = "hb_set_subtract" });
    const ret = cFn(arg_set, arg_other);
    return ret;
}
pub fn setSymmetricDifference(arg_set: *set_t, arg_other: *set_t) void {
    const cFn = @extern(*const fn (*set_t, *set_t) callconv(.c) void, .{ .name = "hb_set_symmetric_difference" });
    const ret = cFn(arg_set, arg_other);
    return ret;
}
pub const set_t = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_set_get_type" });
        return cFn();
    }
};
pub fn setUnion(arg_set: *set_t, arg_other: *set_t) void {
    const cFn = @extern(*const fn (*set_t, *set_t) callconv(.c) void, .{ .name = "hb_set_union" });
    const ret = cFn(arg_set, arg_other);
    return ret;
}
pub fn shape(arg_font: *font_t, arg_buffer: *buffer_t, argS_features: []feature_t) void {
    const arg_features: ?[*]feature_t = @ptrCast(argS_features);
    const arg_num_features: u32 = @intCast((argS_features).len);
    const cFn = @extern(*const fn (*font_t, *buffer_t, ?[*]feature_t, u32) callconv(.c) void, .{ .name = "hb_shape" });
    const ret = cFn(arg_font, arg_buffer, arg_features, arg_num_features);
    return ret;
}
pub fn shapeFull(arg_font: *font_t, arg_buffer: *buffer_t, argS_features: []feature_t, arg_shaper_list: ?[*]?[*:0]const u8) i32 {
    const arg_features: ?[*]feature_t = @ptrCast(argS_features);
    const arg_num_features: u32 = @intCast((argS_features).len);
    const cFn = @extern(*const fn (*font_t, *buffer_t, ?[*]feature_t, u32, ?[*]?[*:0]const u8) callconv(.c) i32, .{ .name = "hb_shape_full" });
    const ret = cFn(arg_font, arg_buffer, arg_features, arg_num_features, arg_shaper_list);
    return ret;
}
pub fn shapeListShapers() [*]?[*:0]const u8 {
    const cFn = @extern(*const fn () callconv(.c) [*]?[*:0]const u8, .{ .name = "hb_shape_list_shapers" });
    const ret = cFn();
    return ret;
}
pub fn shapePlanCreate(arg_face: *face_t, arg_props: *segment_properties_t, argS_user_features: []feature_t, arg_shaper_list: [*]?[*:0]const u8) *shape_plan_t {
    const arg_user_features: [*]feature_t = @ptrCast(argS_user_features);
    const arg_num_user_features: u32 = @intCast((argS_user_features).len);
    const cFn = @extern(*const fn (*face_t, *segment_properties_t, [*]feature_t, u32, [*]?[*:0]const u8) callconv(.c) *shape_plan_t, .{ .name = "hb_shape_plan_create" });
    const ret = cFn(arg_face, arg_props, arg_user_features, arg_num_user_features, arg_shaper_list);
    return ret;
}
pub fn shapePlanCreate2(arg_face: *face_t, arg_props: *segment_properties_t, argS_user_features: []feature_t, argS_coords: []i32, arg_shaper_list: [*]?[*:0]const u8) *shape_plan_t {
    const arg_user_features: [*]feature_t = @ptrCast(argS_user_features);
    const arg_num_user_features: u32 = @intCast((argS_user_features).len);
    const arg_coords: [*]i32 = @ptrCast(argS_coords);
    const arg_num_coords: u32 = @intCast((argS_coords).len);
    const cFn = @extern(*const fn (*face_t, *segment_properties_t, [*]feature_t, u32, [*]i32, u32, [*]?[*:0]const u8) callconv(.c) *shape_plan_t, .{ .name = "hb_shape_plan_create2" });
    const ret = cFn(arg_face, arg_props, arg_user_features, arg_num_user_features, arg_coords, arg_num_coords, arg_shaper_list);
    return ret;
}
pub fn shapePlanCreateCached(arg_face: *face_t, arg_props: *segment_properties_t, argS_user_features: []feature_t, arg_shaper_list: [*]?[*:0]const u8) *shape_plan_t {
    const arg_user_features: [*]feature_t = @ptrCast(argS_user_features);
    const arg_num_user_features: u32 = @intCast((argS_user_features).len);
    const cFn = @extern(*const fn (*face_t, *segment_properties_t, [*]feature_t, u32, [*]?[*:0]const u8) callconv(.c) *shape_plan_t, .{ .name = "hb_shape_plan_create_cached" });
    const ret = cFn(arg_face, arg_props, arg_user_features, arg_num_user_features, arg_shaper_list);
    return ret;
}
pub fn shapePlanCreateCached2(arg_face: *face_t, arg_props: *segment_properties_t, argS_user_features: []feature_t, argS_coords: []i32, arg_shaper_list: [*]?[*:0]const u8) *shape_plan_t {
    const arg_user_features: [*]feature_t = @ptrCast(argS_user_features);
    const arg_num_user_features: u32 = @intCast((argS_user_features).len);
    const arg_coords: [*]i32 = @ptrCast(argS_coords);
    const arg_num_coords: u32 = @intCast((argS_coords).len);
    const cFn = @extern(*const fn (*face_t, *segment_properties_t, [*]feature_t, u32, [*]i32, u32, [*]?[*:0]const u8) callconv(.c) *shape_plan_t, .{ .name = "hb_shape_plan_create_cached2" });
    const ret = cFn(arg_face, arg_props, arg_user_features, arg_num_user_features, arg_coords, arg_num_coords, arg_shaper_list);
    return ret;
}
pub fn shapePlanExecute(arg_shape_plan: *shape_plan_t, arg_font: *font_t, arg_buffer: *buffer_t, argS_features: []feature_t) i32 {
    const arg_features: [*]feature_t = @ptrCast(argS_features);
    const arg_num_features: u32 = @intCast((argS_features).len);
    const cFn = @extern(*const fn (*shape_plan_t, *font_t, *buffer_t, [*]feature_t, u32) callconv(.c) i32, .{ .name = "hb_shape_plan_execute" });
    const ret = cFn(arg_shape_plan, arg_font, arg_buffer, arg_features, arg_num_features);
    return ret;
}
pub fn shapePlanGetEmpty() *shape_plan_t {
    const cFn = @extern(*const fn () callconv(.c) *shape_plan_t, .{ .name = "hb_shape_plan_get_empty" });
    const ret = cFn();
    return ret;
}
pub fn shapePlanGetShaper(arg_shape_plan: *shape_plan_t) [*:0]u8 {
    const cFn = @extern(*const fn (*shape_plan_t) callconv(.c) [*:0]u8, .{ .name = "hb_shape_plan_get_shaper" });
    const ret = cFn(arg_shape_plan);
    return ret;
}
pub const shape_plan_t = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_shape_plan_get_type" });
        return cFn();
    }
};
pub fn styleGetValue(arg_font: *font_t, arg_style_tag: style_tag_t) f32 {
    const cFn = @extern(*const fn (*font_t, style_tag_t) callconv(.c) f32, .{ .name = "hb_style_get_value" });
    const ret = cFn(arg_font, arg_style_tag);
    return ret;
}
pub const style_tag_t = enum(u32) {
    italic = 1769234796,
    optical_size = 1869640570,
    slant_angle = 1936486004,
    slant_ratio = 1399615092,
    width = 2003072104,
    weight = 2003265652,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_style_tag_get_type" });
        return cFn();
    }
};
pub fn tagFromString(argS_str: []u8) u32 {
    const arg_str: [*]u8 = @ptrCast(argS_str);
    const arg_len: i32 = @intCast((argS_str).len);
    const cFn = @extern(*const fn ([*]u8, i32) callconv(.c) u32, .{ .name = "hb_tag_from_string" });
    const ret = cFn(arg_str, arg_len);
    return ret;
}
pub fn tagToString(arg_tag: u32, arg_buf: *[4]u8) void {
    const cFn = @extern(*const fn (u32, *[4]u8) callconv(.c) void, .{ .name = "hb_tag_to_string" });
    const ret = cFn(arg_tag, arg_buf);
    return ret;
}
pub fn unicodeCombiningClass(arg_ufuncs: *unicode_funcs_t, arg_unicode: u32) unicode_combining_class_t {
    const cFn = @extern(*const fn (*unicode_funcs_t, u32) callconv(.c) unicode_combining_class_t, .{ .name = "hb_unicode_combining_class" });
    const ret = cFn(arg_ufuncs, arg_unicode);
    return ret;
}
pub const unicode_combining_class_func_t = *const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) unicode_combining_class_t;
pub const unicode_combining_class_t = enum(u32) {
    not_reordered = 0,
    overlay = 1,
    nukta = 7,
    kana_voicing = 8,
    virama = 9,
    ccc10 = 10,
    ccc11 = 11,
    ccc12 = 12,
    ccc13 = 13,
    ccc14 = 14,
    ccc15 = 15,
    ccc16 = 16,
    ccc17 = 17,
    ccc18 = 18,
    ccc19 = 19,
    ccc20 = 20,
    ccc21 = 21,
    ccc22 = 22,
    ccc23 = 23,
    ccc24 = 24,
    ccc25 = 25,
    ccc26 = 26,
    ccc27 = 27,
    ccc28 = 28,
    ccc29 = 29,
    ccc30 = 30,
    ccc31 = 31,
    ccc32 = 32,
    ccc33 = 33,
    ccc34 = 34,
    ccc35 = 35,
    ccc36 = 36,
    ccc84 = 84,
    ccc91 = 91,
    ccc103 = 103,
    ccc107 = 107,
    ccc118 = 118,
    ccc122 = 122,
    ccc129 = 129,
    ccc130 = 130,
    ccc132 = 132,
    attached_below_left = 200,
    attached_below = 202,
    attached_above = 214,
    attached_above_right = 216,
    below_left = 218,
    below = 220,
    below_right = 222,
    left = 224,
    right = 226,
    above_left = 228,
    above = 230,
    above_right = 232,
    double_below = 233,
    double_above = 234,
    iota_subscript = 240,
    invalid = 255,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_unicode_combining_class_get_type" });
        return cFn();
    }
};
pub fn unicodeCompose(arg_ufuncs: *unicode_funcs_t, arg_a: u32, arg_b: u32) struct {
    ret: i32,
    ab: u32,
} {
    var argO_ab: u32 = undefined;
    const arg_ab: *u32 = &argO_ab;
    const cFn = @extern(*const fn (*unicode_funcs_t, u32, u32, *u32) callconv(.c) i32, .{ .name = "hb_unicode_compose" });
    const ret = cFn(arg_ufuncs, arg_a, arg_b, arg_ab);
    return .{ .ret = ret, .ab = argO_ab };
}
pub const unicode_compose_func_t = *const fn (arg_ufuncs: *unicode_funcs_t, arg_a: u32, arg_b: u32, arg_ab: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub fn unicodeDecompose(arg_ufuncs: *unicode_funcs_t, arg_ab: u32) struct {
    ret: i32,
    a: u32,
    b: u32,
} {
    var argO_a: u32 = undefined;
    const arg_a: *u32 = &argO_a;
    var argO_b: u32 = undefined;
    const arg_b: *u32 = &argO_b;
    const cFn = @extern(*const fn (*unicode_funcs_t, u32, *u32, *u32) callconv(.c) i32, .{ .name = "hb_unicode_decompose" });
    const ret = cFn(arg_ufuncs, arg_ab, arg_a, arg_b);
    return .{ .ret = ret, .a = argO_a, .b = argO_b };
}
pub fn unicodeDecomposeCompatibility(arg_ufuncs: *unicode_funcs_t, arg_u: u32) struct {
    ret: u32,
    decomposed: u32,
} {
    var argO_decomposed: u32 = undefined;
    const arg_decomposed: *u32 = &argO_decomposed;
    const cFn = @extern(*const fn (*unicode_funcs_t, u32, *u32) callconv(.c) u32, .{ .name = "hb_unicode_decompose_compatibility" });
    const ret = cFn(arg_ufuncs, arg_u, arg_decomposed);
    return .{ .ret = ret, .decomposed = argO_decomposed };
}
pub const unicode_decompose_compatibility_func_t = *const fn (arg_ufuncs: *unicode_funcs_t, arg_u: u32, arg_decomposed: *u32, arg_user_data: ?*anyopaque) callconv(.c) u32;
pub const unicode_decompose_func_t = *const fn (arg_ufuncs: *unicode_funcs_t, arg_ab: u32, arg_a: *u32, arg_b: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32;
pub fn unicodeEastasianWidth(arg_ufuncs: *unicode_funcs_t, arg_unicode: u32) u32 {
    const cFn = @extern(*const fn (*unicode_funcs_t, u32) callconv(.c) u32, .{ .name = "hb_unicode_eastasian_width" });
    const ret = cFn(arg_ufuncs, arg_unicode);
    return ret;
}
pub const unicode_eastasian_width_func_t = *const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) u32;
pub fn unicodeFuncsCreate(arg_parent: ?*unicode_funcs_t) *unicode_funcs_t {
    const cFn = @extern(*const fn (?*unicode_funcs_t) callconv(.c) *unicode_funcs_t, .{ .name = "hb_unicode_funcs_create" });
    const ret = cFn(arg_parent);
    return ret;
}
pub fn unicodeFuncsGetDefault() *unicode_funcs_t {
    const cFn = @extern(*const fn () callconv(.c) *unicode_funcs_t, .{ .name = "hb_unicode_funcs_get_default" });
    const ret = cFn();
    return ret;
}
pub fn unicodeFuncsGetEmpty() *unicode_funcs_t {
    const cFn = @extern(*const fn () callconv(.c) *unicode_funcs_t, .{ .name = "hb_unicode_funcs_get_empty" });
    const ret = cFn();
    return ret;
}
pub fn unicodeFuncsGetParent(arg_ufuncs: *unicode_funcs_t) *unicode_funcs_t {
    const cFn = @extern(*const fn (*unicode_funcs_t) callconv(.c) *unicode_funcs_t, .{ .name = "hb_unicode_funcs_get_parent" });
    const ret = cFn(arg_ufuncs);
    return ret;
}
pub fn unicodeFuncsIsImmutable(arg_ufuncs: *unicode_funcs_t) i32 {
    const cFn = @extern(*const fn (*unicode_funcs_t) callconv(.c) i32, .{ .name = "hb_unicode_funcs_is_immutable" });
    const ret = cFn(arg_ufuncs);
    return ret;
}
pub fn unicodeFuncsMakeImmutable(arg_ufuncs: *unicode_funcs_t) void {
    const cFn = @extern(*const fn (*unicode_funcs_t) callconv(.c) void, .{ .name = "hb_unicode_funcs_make_immutable" });
    const ret = cFn(arg_ufuncs);
    return ret;
}
pub fn unicodeFuncsSetCombiningClassFunc(arg_ufuncs: *unicode_funcs_t, argC_func: core.Closure(*const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) unicode_combining_class_t)) void {
    const arg_func: *const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) unicode_combining_class_t = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*unicode_funcs_t, *const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) unicode_combining_class_t, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_unicode_funcs_set_combining_class_func" });
    const ret = cFn(arg_ufuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn unicodeFuncsSetComposeFunc(arg_ufuncs: *unicode_funcs_t, argC_func: core.Closure(*const fn (arg_ufuncs: *unicode_funcs_t, arg_a: u32, arg_b: u32, arg_ab: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_ufuncs: *unicode_funcs_t, arg_a: u32, arg_b: u32, arg_ab: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*unicode_funcs_t, *const fn (arg_ufuncs: *unicode_funcs_t, arg_a: u32, arg_b: u32, arg_ab: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_unicode_funcs_set_compose_func" });
    const ret = cFn(arg_ufuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn unicodeFuncsSetDecomposeCompatibilityFunc(arg_ufuncs: *unicode_funcs_t, argC_func: core.Closure(*const fn (arg_ufuncs: *unicode_funcs_t, arg_u: u32, arg_decomposed: *u32, arg_user_data: ?*anyopaque) callconv(.c) u32)) void {
    const arg_func: *const fn (arg_ufuncs: *unicode_funcs_t, arg_u: u32, arg_decomposed: *u32, arg_user_data: ?*anyopaque) callconv(.c) u32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*unicode_funcs_t, *const fn (arg_ufuncs: *unicode_funcs_t, arg_u: u32, arg_decomposed: *u32, arg_user_data: ?*anyopaque) callconv(.c) u32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_unicode_funcs_set_decompose_compatibility_func" });
    const ret = cFn(arg_ufuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn unicodeFuncsSetDecomposeFunc(arg_ufuncs: *unicode_funcs_t, argC_func: core.Closure(*const fn (arg_ufuncs: *unicode_funcs_t, arg_ab: u32, arg_a: *u32, arg_b: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32)) void {
    const arg_func: *const fn (arg_ufuncs: *unicode_funcs_t, arg_ab: u32, arg_a: *u32, arg_b: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*unicode_funcs_t, *const fn (arg_ufuncs: *unicode_funcs_t, arg_ab: u32, arg_a: *u32, arg_b: *u32, arg_user_data: ?*anyopaque) callconv(.c) i32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_unicode_funcs_set_decompose_func" });
    const ret = cFn(arg_ufuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn unicodeFuncsSetEastasianWidthFunc(arg_ufuncs: *unicode_funcs_t, argC_func: core.Closure(*const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) u32)) void {
    const arg_func: *const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) u32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*unicode_funcs_t, *const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) u32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_unicode_funcs_set_eastasian_width_func" });
    const ret = cFn(arg_ufuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn unicodeFuncsSetGeneralCategoryFunc(arg_ufuncs: *unicode_funcs_t, argC_func: core.Closure(*const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) unicode_general_category_t)) void {
    const arg_func: *const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) unicode_general_category_t = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*unicode_funcs_t, *const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) unicode_general_category_t, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_unicode_funcs_set_general_category_func" });
    const ret = cFn(arg_ufuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn unicodeFuncsSetMirroringFunc(arg_ufuncs: *unicode_funcs_t, argC_func: core.Closure(*const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) u32)) void {
    const arg_func: *const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) u32 = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*unicode_funcs_t, *const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) u32, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_unicode_funcs_set_mirroring_func" });
    const ret = cFn(arg_ufuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub fn unicodeFuncsSetScriptFunc(arg_ufuncs: *unicode_funcs_t, argC_func: core.Closure(*const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) script_t)) void {
    const arg_func: *const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) script_t = @ptrCast(argC_func.callback());
    const arg_user_data: ?*anyopaque = @ptrCast(argC_func.data());
    const arg_destroy: ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void = @ptrCast(argC_func.destroy());
    const cFn = @extern(*const fn (*unicode_funcs_t, *const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) script_t, ?*anyopaque, ?*const fn (arg_user_data: ?*anyopaque) callconv(.c) void) callconv(.c) void, .{ .name = "hb_unicode_funcs_set_script_func" });
    const ret = cFn(arg_ufuncs, arg_func, @ptrCast(arg_user_data), arg_destroy);
    return ret;
}
pub const unicode_funcs_t = opaque {
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_unicode_funcs_get_type" });
        return cFn();
    }
};
pub fn unicodeGeneralCategory(arg_ufuncs: *unicode_funcs_t, arg_unicode: u32) unicode_general_category_t {
    const cFn = @extern(*const fn (*unicode_funcs_t, u32) callconv(.c) unicode_general_category_t, .{ .name = "hb_unicode_general_category" });
    const ret = cFn(arg_ufuncs, arg_unicode);
    return ret;
}
pub const unicode_general_category_func_t = *const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) unicode_general_category_t;
pub const unicode_general_category_t = enum(u32) {
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
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_unicode_general_category_get_type" });
        return cFn();
    }
};
pub fn unicodeMirroring(arg_ufuncs: *unicode_funcs_t, arg_unicode: u32) u32 {
    const cFn = @extern(*const fn (*unicode_funcs_t, u32) callconv(.c) u32, .{ .name = "hb_unicode_mirroring" });
    const ret = cFn(arg_ufuncs, arg_unicode);
    return ret;
}
pub const unicode_mirroring_func_t = *const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) u32;
pub fn unicodeScript(arg_ufuncs: *unicode_funcs_t, arg_unicode: u32) script_t {
    const cFn = @extern(*const fn (*unicode_funcs_t, u32) callconv(.c) script_t, .{ .name = "hb_unicode_script" });
    const ret = cFn(arg_ufuncs, arg_unicode);
    return ret;
}
pub const unicode_script_func_t = *const fn (arg_ufuncs: *unicode_funcs_t, arg_unicode: u32, arg_user_data: ?*anyopaque) callconv(.c) script_t;
pub const user_data_key_t = extern struct {
    unused: i8,
    pub fn gType() core.Type {
        const cFn = @extern(*const fn () callconv(.c) core.Type, .{ .name = "hb_gobject_user_data_key_get_type" });
        return cFn();
    }
};
pub const var_int_t = extern union {
    u32: u32,
    i32: i32,
    u16: [2]u16,
    i16: [2]i16,
    u8: [4]u8,
    i8: [4]i8,
};
pub const var_num_t = extern union {
    f: f32,
    u32: u32,
    i32: i32,
    u16: [2]u16,
    i16: [2]i16,
    u8: [4]u8,
    i8: [4]i8,
};
pub fn variationFromString(argS_str: []u8, arg_variation: *variation_t) i32 {
    const arg_str: [*]u8 = @ptrCast(argS_str);
    const arg_len: i32 = @intCast((argS_str).len);
    const cFn = @extern(*const fn ([*]u8, i32, *variation_t) callconv(.c) i32, .{ .name = "hb_variation_from_string" });
    const ret = cFn(arg_str, arg_len, arg_variation);
    return ret;
}
pub const variation_t = extern struct {
    tag: u32,
    value: f32,
    pub fn _string(self: *variation_t, argS_buf: [][*:0]const u8) [][*:0]const u8 {
        const arg_buf: [*][*:0]const u8 = @ptrCast(argS_buf);
        var argO_size: u32 = undefined;
        const arg_size: *u32 = &argO_size;
        const cFn = @extern(*const fn (*variation_t, [*][*:0]const u8, *u32) callconv(.c) void, .{ .name = "hb_variation_to_string" });
        const ret = cFn(self, arg_buf, arg_size);
        _ = ret;
        return arg_buf[0..@intCast(argO_size)];
    }
};
pub fn variationToString(arg_variation: *variation_t, argS_buf: [][*:0]const u8) [][*:0]const u8 {
    const arg_buf: [*][*:0]const u8 = @ptrCast(argS_buf);
    var argO_size: u32 = undefined;
    const arg_size: *u32 = &argO_size;
    const cFn = @extern(*const fn (*variation_t, [*][*:0]const u8, *u32) callconv(.c) void, .{ .name = "hb_variation_to_string" });
    const ret = cFn(arg_variation, arg_buf, arg_size);
    _ = ret;
    return arg_buf[0..@intCast(argO_size)];
}

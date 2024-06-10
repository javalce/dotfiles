local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font({
	family = "JetBrainsMono Nerd Font",
	weight = "Medium",
	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
})
config.font_size = 12
config.bold_brightens_ansi_colors = false
config.freetype_load_target = "Normal"
config.color_scheme = "GNOME"
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true
config.audible_bell = "Disabled"
config.warn_about_missing_glyphs = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config

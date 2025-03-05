local wezterm = require("wezterm")

---@module 'wezterm'
---@type 'wezterm.config'
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.window_padding = {
	top = 0,
	right = 0,
	left = 0,
}

-- Background
config.window_background_opacity = 1 -- Adjust this value as needed
config.macos_window_background_blur = 20 -- Adjust this value as needed
config.win32_system_backdrop = "Acrylic" -- Only works in Windows

-- UI
config.font = wezterm.font({
	family = "JetBrainsMono Nerd Font",
	weight = "Medium",
	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
})
config.font_size = 12
-- config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.max_fps = 240 -- hack for smoothness
config.enable_kitty_graphics = true

config.bold_brightens_ansi_colors = false
config.freetype_load_target = "Normal"
config.color_scheme = "GNOME"
config.audible_bell = "Disabled"
config.warn_about_missing_glyphs = true
config.enable_scroll_bar = false

return config

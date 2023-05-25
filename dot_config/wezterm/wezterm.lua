local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.font = wezterm.font("JetBrainsMono Nerd Font Mono", {
	-- weight = "Bold",
	-- italics = true,
})
config.font_size = 12
-- config.color_scheme = "TokyoNight"
-- config.color_scheme = "IDEA Dark"
config.colors = {
	foreground = "#ffffff",
	background = "#000000",
	cursor_bg = "#ffffff",
	cursor_fg = "#111111",
	cursor_border = "#ffffff",
	selection_bg = "#ffffff",
	selection_fg = "#000000",

	ansi = {
		"#000000",
		"#c01c28",
		"#26a269",
		"#a2734c",
		"#12488b",
		"#a347ba",
		"#2aa1b3",
		"#d0cfcc",
	},
	brights = {
		"#5e5c64",
		"#f66151",
		"#33da7a",
		"#e9ad0c",
		"#2a7bde",
		"#c061cb",
		"#33c7de",
		"#ffffff",
	},
}
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.audible_bell = "Disabled"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config

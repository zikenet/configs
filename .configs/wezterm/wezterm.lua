local wezterm = require("wezterm")

local config = {}
-- User config builder if possible

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.font_size = 14
-- config.font_size = 11 -- Mac
config.initial_rows = 50
config.initial_cols = 125
-- config.front_end = "OpenGL"
config.front_end = "WebGpu" -- Mac
config.enable_tab_bar = true
config.scrollback_lines = 10240
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.enable_scroll_bar = false
config.window_decorations = "RESIZE"
config.color_scheme = "Decaf (base16)"
config.automatically_reload_config = true
-- config.hide_tab_bar_if_only_one_tab = false -- windows
config.hide_tab_bar_if_only_one_tab = true -- Mac
config.default_cursor_style = "BlinkingBar"
-- config.default_prog = { "pwsh.exe", "-NoLogo" } -- windows

config.window_frame = {
	font = wezterm.font({
		family = "JetBrainsMono Nerd Font Mono",
	}),
	-- font = wezterm.font({ family = "Geist Mono" }),
	-- active_titlebar_bg = "#1e1e1e",
	-- inactive_titlebar_bg = "#1e1e1e",
	-- font_size = 15.0,
}
config.color_scheme = "NvimDark"

-- config.color_scheme = "OneDark"
config.color_schemes = {
	["NvimDark"] = {
		background = "#14161B",
		foreground = "#f0f6fc",
		ansi = {
			"#07080D",
			"#FFC0B9",
			"#B3F6C0",
			"#FCE094",
			"#A6DCFF",
			"#FFCAFF",
			"#8CF8F7",
			"#EEF1F8",
		},

		brights = {
			"#505257",
			"#FFC0B9",
			"#B3F6C0",
			"#FCE094",
			"#A6DCFF",
			"#FFCAFF",
			"#8CF8F7",
			"#EEF1F8",
		},
	},
}
config.status_update_interval = 1000
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

config.inactive_pane_hsb = {
	saturation = 0.7,
	brightness = 0.3,
}

require("status-bar").apply_to_config(config)
require("tab-format").apply_to_config(config)
require("keymappings").apply_to_config(config)
-- require("plugins").apply_to_config(config)

return config

local wezterm = require("wezterm")

local config = {}
-- User config builder if possible

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Settings
config.font_size = 14.5
config.initial_rows = 50
config.initial_cols = 115
config.front_end = "WebGpu"
config.enable_tab_bar = true
config.scrollback_lines = 10240
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.enable_scroll_bar = false
config.window_decorations = "RESIZE"
config.color_scheme = "Decaf (base16)"
config.automatically_reload_config = true
config.hide_tab_bar_if_only_one_tab = true
config.default_cursor_style = "BlinkingBar"

config.window_frame = {
	font = wezterm.font({
		family = "JetBrainsMono Nerd Font Mono",
	}),
	-- font = wezterm.font({ family = "Geist Mono" }),
	-- active_titlebar_bg = "#1e1e1e",
	-- inactive_titlebar_bg = "#1e1e1e",
	font_size = 15.0,
}

config.color_scheme = "OneDark"
config.color_schemes = {
	["OneDark"] = {
		foreground = "#f0f6fc",
		background = "#1e1f21",
		cursor_bg = "#b1cad8",
		cursor_fg = "#21262d",
		cursor_border = "#CF7277",
		selection_fg = "#21262d",
		selection_bg = "#2A4668",
		scrollbar_thumb = "#30363d",
		split = "#6e7681",

		ansi = {
			"#21222C",
			"#FF5555",
			"#50FA7B",
			"#FFCB6B",
			"#B3DEEF",
			"#B148B8",
			"#8BE9FD",
			"#F8F8F2",
		},
		brights = {

			"#BABABA",
			"#F43753",
			"#C9D05C",
			"#ffc24b",
			"#b3deef",
			"#d382db",
			"#73cef4",
			"#eeeeee",
		},
	},
}

config.window_decorations = "RESIZE"
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

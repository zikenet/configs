--- wezterm.lua
--- $ figlet -f small Wezterm
--- __      __      _
--- \ \    / /__ __| |_ ___ _ _ _ __
---  \ \/\/ / -_)_ /  _/ -_) '_| '  \
---   \_/\_/\___/__|\__\___|_| |_|_|_|
---
--- My Wezterm config file

local wezterm = require("wezterm")
local act = wezterm.action

local fish_path = "/opt/homebrew/bin/fish"

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

local fonts = {
	-- "MonoLisa",
	-- "Geist Mono",
	-- "SF Mono",
	-- "Monaspace Neon",
	-- "Monaspace Xenon",
	-- "Monaspace Krypton",
	-- "Monaspace Radon",
	-- "Monaspace Argon",
	-- "Comic Code Ligatures",
	-- "Liga SFMono Nerd Font",
	-- "Fira Code Retina",
	-- "DankMono Nerd Font",
	-- "Monego Ligatures",
	-- "Operator Mono Lig",
	-- "Gintronic",
	-- "Cascadia Code",
	"JetBrainsMono Nerd Font Mono",
	-- "Victor Mono",
	-- "Inconsolata",
	-- "TempleOS",
	-- "Apercu Pro",
}
local emoji_fonts = { "Apple Color Emoji", "Joypixels", "Twemoji", "Noto Color Emoji", "Noto Emoji" }

config.harfbuzz_features = {
	"calt",
	"liga",
	"zero",
	"-ss01",
	"ss02",
	"-ss03",
	"ss04",
	"ss05",
	"-ss06",
	"-ss07",
	"-ss08",
	"-ss09",
	"ss10",
	"ss11",
	"ss12",
	"-ss13",
	"ss14",
	"ss15",
	"ss16",
	"ss17",
	"ss18",
}
config.font = wezterm.font_with_fallback({ fonts[1], emoji_fonts[1], emoji_fonts[2] })
-- config.disable_default_key_bindings = true
config.front_end = "WebGpu"
config.enable_scroll_bar = false
config.scrollback_lines = 10240
config.font_size = 14.5
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.automatically_reload_config = true
config.default_cursor_style = "BlinkingBar"
config.initial_cols = 115
config.initial_rows = 50
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.window_decorations = "RESIZE"
-- config.window_decorations = "RESIZE|TITLE"
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- config.window_padding = {
-- 	left = 30,
-- 	right = 30,
-- 	top = 50,
-- 	bottom = 30,
-- }
-- config.window_frame = {
-- 	font = wezterm.font({ family = "SF Mono" }),
-- 	-- font = wezterm.font({ family = "Geist Mono" }),
-- 	active_titlebar_bg = "#1e1e1e",
-- 	inactive_titlebar_bg = "#1e1e1e",
-- 	font_size = 15.0,
-- }

config.color_scheme = "OneDark (base16)"
config.color_scheme = "OneDark"
config.color_schemes = {
	["OneDark"] = {
		foreground = "#f0f6fc",
		background = "#1e1e1e",
		-- background = "#21262d",
		-- background = "#1e1e2e",
		-- background = "#1a1b26",
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

config.colors = {
	tab_bar = {
		background = "#1e1e1e",
		active_tab = {
			bg_color = "#1e1e1e",
			fg_color = "#c8c8c8",
		},
		inactive_tab = {
			bg_color = "1e1e1e",
			fg_color = "#4c4f69",
		},
		inactive_tab_hover = {
			bg_color = "#484f58",
			fg_color = "#b1bac4",
		},
		new_tab = {
			bg_color = "1e1e1e",
			fg_color = "#8b949e",
		},
		new_tab_hover = {
			bg_color = "#484f58",
			fg_color = "#b1bac4",
		},
	},
}

config.window_background_opacity = 0.9
config.macos_window_background_blur = 15

-- Settings
config.default_prog = { fish_path, "-l" }

-- Keys
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Send C-a when pressing C-a twice
	{ key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },

	-- Pane keybindings
	{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "o", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	-- We can make separate keybindings for resizing panes
	-- But Wezterm offers custom "mode" in the name of "KeyTable"
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
	},

	-- Tab keybindings
	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "n", mods = "LEADER", action = act.ShowTabNavigator },
	{
		key = "e",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = wezterm.format({
				{ Attribute = { Intensity = "Bold" } },
				{ Foreground = { AnsiColor = "Fuchsia" } },
				{ Text = "Renaming Tab Title...:" },
			}),
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- Key table for moving tabs around
	{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },
	-- Or shortcuts to move tab w/o move_tab table. SHIFT is for when caps lock is on
	{ key = "{", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
	{ key = "}", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },

	-- Lastly, workspace
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}
-- I can use the tab navigator (LDR t), but I also want to quickly navigate tabs with index
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
	move_tab = {
		{ key = "h", action = act.MoveTabRelative(-1) },
		{ key = "j", action = act.MoveTabRelative(-1) },
		{ key = "k", action = act.MoveTabRelative(1) },
		{ key = "l", action = act.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

-- Tab bar
-- I don't like the look of "fancy" tab bar
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = false

wezterm.on("update-status", function(window, _)
	-- Left status (left of the tab line)
	window:set_left_status(wezterm.format({
		{ Text = "  " },
	}))
end)

return config

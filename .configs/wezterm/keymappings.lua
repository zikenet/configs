local wezterm = require("wezterm")
local act = wezterm.action
local module = {}

function module.apply_to_config(config)
	config.leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 }

	wezterm.on("trigger-custom-layout", function(_, pane)
		-- Step 1: Split off the bottom 30%
		local bottom = pane:split({
			direction = "Bottom",
			size = 0.25, --Bottom 25%
		})
		-- Step 2: Horizontally split that bottom area into 3 panes
		local bottom_right = bottom:split({
			direction = "Right",
			size = 1 / 3, -- 66% of remaining (2/3)
		})
		local bottom_middle = bottom:split({
			direction = "Right",
			size = 0.50, -- 50% of remaining (1/2)
		})
		-- Top pane (original) remains untouched
	end)

	wezterm.on("toggle-pane-navigator", function(window, pane)
		window:perform_action(wezterm.action.ActivateKeyTable({ name = "pane_navigator", one_shot = false }), pane)
	end)

	config.keys = {
		-- Send C-a when pressing C-a twice
		-- { key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },
		{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
		{ key = "phys:Space", mods = "LEADER", action = act.ActivateCommandPalette },
		{ key = "i", mods = "LEADER", action = wezterm.action.EmitEvent("trigger-custom-layout") },
		{ key = "p", mods = "LEADER", action = wezterm.action.EmitEvent("toggle-pane-navigator") },

		-- Pane keybindings
		{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "Backslash", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
		{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		{ key = "q", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
		{ key = "m", mods = "LEADER", action = act.TogglePaneZoomState },
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
				action = wezterm.action_callback(function(window, _, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		-- Key table for moving tabs around
		{ key = "s", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },
		-- Or shortcuts to move tab w/o move_tab table. SHIFT is for when caps lock is on
		{ key = "{", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
		{ key = "}", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },

		-- Lastly, workspace
		{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	}

	config.key_tables = {
		pane_navigator = {
			{ key = "h", mods = "", action = wezterm.action.ActivatePaneDirection("Left") },
			{ key = "j", mods = "", action = wezterm.action.ActivatePaneDirection("Down") },
			{ key = "k", mods = "", action = wezterm.action.ActivatePaneDirection("Up") },
			{ key = "l", mods = "", action = wezterm.action.ActivatePaneDirection("Right") },
			{ key = "Return", mods = "", action = "PopKeyTable" },
			{ key = "q", mods = "", action = "PopKeyTable" },
		},

		resize_pane = {
			{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
			{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },

			{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
			{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },

			{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
			{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },

			{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
			{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },

			-- Cancel the mode by pressing escape
			{ key = "Escape", action = "PopKeyTable" },
		},
	}

	for i = 1, 9 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "LEADER",
			action = act.ActivateTab(i - 1),
		})
	end
end

return module

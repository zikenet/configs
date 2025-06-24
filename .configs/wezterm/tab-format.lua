local wezterm = require("wezterm")

local module = {}

-- local SOLID_RIGHT_ARROW = "〉"
local SOLID_RIGHT_ARROW = "〡"

local COLORS = {
	background = "#1E1F22",
	active_edge = "#a6d189",
	inactive_edge = "#3b3b3b",
	text = "#000000", -- White for active tab
	new_tab_bg = "#1E1F22", -- Background of "new tab" button
	new_tab_fg = "#808080", -- Text/icon color of "new tab" button
	new_tab_hover_bg = "#1E1F22",
	new_tab_hover_fg = "#ffffff",
}

function module.apply_to_config(config)
	config.tab_max_width = 16 -- Try values between 10–20
	config.colors = config.colors or {}
	config.colors.tab_bar = config.colors.tab_bar or {}

	-- Tab bar background
	config.colors.tab_bar.background = COLORS.background

	-- "New tab" button colors
	config.colors.tab_bar.new_tab = {
		bg_color = COLORS.new_tab_bg,
		fg_color = COLORS.new_tab_fg,
	}

	config.colors.tab_bar.new_tab_hover = {
		bg_color = COLORS.new_tab_hover_bg,
		fg_color = COLORS.new_tab_hover_fg,
	}

	wezterm.on("format-tab-title", function(tab)
		local bg = COLORS.background
		local is_active = tab.is_active
		local edge_color = is_active and COLORS.active_edge or COLORS.inactive_edge
		local tab_index = tab.tab_index + 1 -- Convert 0-based to 1-based
		local title_text = tostring(tab_index) .. ": Tab"

		local title = {
			{ Background = { Color = bg } },
			{ Foreground = { Color = edge_color } },
			{ Text = " " .. title_text .. " " },
		}

		local right_arrow = {
			{ Background = { Color = bg } },
			{ Foreground = { Color = edge_color } },
			{ Text = SOLID_RIGHT_ARROW },
		}

		return wezterm.format(title) .. wezterm.format(right_arrow)
	end)
end

return module

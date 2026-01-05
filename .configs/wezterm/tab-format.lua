local wezterm = require("wezterm")

local module = {}

-- local SOLID_RIGHT_ARROW = "〉"
local SOLID_RIGHT_ARROW = "〡"
local ZOOM_INDICATOR = "⧉ "

local COLORS = {
	background = "#1E1F22",
	-- background = "#21252A",
	active_edge = "#eee8d5",
	inactive_edge = "#627174",
	text = "#000000", -- White for active tab
	new_tab_bg = "#1E1F22", -- Background of "new tab" button
	-- new_tab_bg = "#21252A", -- Background of "new tab" button
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

		-- tmux: #I
		local index = tab.tab_index + 1

		-- tmux: window_zoomed_flag
		local zoomed = tab.active_pane and tab.active_pane.is_zoomed
		local zoom_text = zoomed and ZOOM_INDICATOR or ""

		-- Explicitly renamed tab title ONLY
		local custom_title = tab.tab_title or ""

		-- Truncate renamed titles
		local MAX_TITLE_LEN = 12
		if #custom_title > MAX_TITLE_LEN then
			custom_title = custom_title:sub(1, MAX_TITLE_LEN) .. "…"
		end

		-- Base title
		local title_text = tostring(index)

		-- Show renamed title on active *and* inactive tabs
		if custom_title ~= "" then
			title_text = title_text .. ": " .. custom_title
		end

		local title = {
			{ Background = { Color = bg } },
			{ Foreground = { Color = edge_color } },
			{ Text = zoom_text .. title_text .. " " },
		}

		local right_arrow = {
			{ Background = { Color = bg } },
			{ Foreground = { Color = COLORS.inactive_edge } },
			{ Text = SOLID_RIGHT_ARROW },
		}

		return wezterm.format(title) .. wezterm.format(right_arrow)
	end)
end

return module

local wezterm = require("wezterm")
local colors = require("colors")
local utils = require("utils")
local module = {}

function module.apply_to_config(config)
	config.window_frame = {
		font = require("wezterm").font({ family = "DejaVuSansM Nerd Font" }),
		font_size = 14,
		active_titlebar_bg = colors.statusBarBackground,
	}

	local function getActiveWorkspace()
		local workspaceName = " "
			-- .. wezterm.nerdfonts.cod_workspace_trusted
			.. wezterm.nerdfonts.cod_verified_filled
			.. " "
			.. wezterm.mux.get_active_workspace():upper()
			.. " "

		return utils.formatSegment({
			left = colors.secondaryBackground,
			text = workspaceName,
		})
	end

	wezterm.on("update-status", function(window, _)
		local leftStatusFormatItem = {}
		utils.mergeTable(leftStatusFormatItem, getActiveWorkspace())

		window:set_left_status(wezterm.format(leftStatusFormatItem))
	end)
end

return module

local wezterm = require("wezterm")
local colors = require("colors")
local module = {}

function module.apply_to_config(_)
	wezterm.on("update-status", function(window, pane)
		local stat = window:active_workspace():upper()

		if window:active_key_table() then
			stat = window:active_key_table()
		end

		local basename = function(s)
			return string.gsub(s, "(.*[/\\])(.*)", "%2")
		end
		-- local winBaseName = function(path)
		-- 	return path:match("([^/\\]+)[/\\]?$")
		-- end
		--
		local directoryName = pane:get_current_working_dir()
		wezterm.log_info(directoryName.file_path)
		local cwd = directoryName.path:gsub("^/", "")
		if cwd then
			directoryName = basename(cwd) --> URL object introduced in 20240127-113634-bbcac864 (type(directoryName) == "userdata")
		else
			directoryName = ""
		end
		local processName = pane:get_foreground_process_name()
		processName = processName and basename(processName) or ""

		window:set_left_status(wezterm.format({
			{ Foreground = { Color = colors.dim } },
			{ Text = " " },
			{ Text = " " .. "[" .. stat .. "]" .. "  " },
		}))

		window:set_right_status(wezterm.format({
			{ Foreground = { Color = colors.dim } },
			{ Text = "  " .. directoryName },
			{ Text = " | " },
			{ Foreground = { Color = colors.dim } },
			{ Text = wezterm.nerdfonts.fa_code .. "  " .. processName .. " " },
			{ Text = " " },
		}))
	end)
end

return module

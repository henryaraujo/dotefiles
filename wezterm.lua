local wezterm = require("wezterm")
local action = wezterm.action

local function remove_exe_extension(title)
	if title:sub(-4) == ".exe" then
		return title:sub(1, -5)
	end
	return title
end

local function tab_title(tab)
	local title = tab.tab_title

	if title and #title > 0 then
		return title
	end

	return remove_exe_extension(tab.active_pane.title)
end
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local tab_index = tab.tab_index + 1
	local title = tab_title(tab)
	return {
		{ Text = " " .. tostring(tab_index) .. " " .. title .. " " },
	}
end)

wezterm.on("update-right-status", function(window, pane)
	local cwd_uri = pane:get_current_working_dir()

	local cwd = ""
	if cwd_uri then
		cwd = cwd_uri.file_path or cwd_uri
		cwd = cwd:sub(11)
	else
		cwd = "N/A"
	end
	local date = wezterm.strftime("%d %b %Y %H:%M")
	window:set_right_status(wezterm.format({
		{ Background = { Color = "#98C379" } },
		{ Foreground = { Color = "#282C34" } },
		{ Text = " " .. date .. " " },
	}))
end)

return {
	default_prog = { "powershell.exe", "-NoLogo" },
	color_scheme = "Catppuccin Macchiato",
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	font = wezterm.font("JetBrains Mono"),
	font_size = 10,
	use_fancy_tab_bar = false,
	show_tabs_in_tab_bar = true,
	tab_bar_at_bottom = true,
	show_new_tab_button_in_tab_bar = false,
	default_cursor_style = "BlinkingBar",
	automatically_reload_config = true,
	window_decorations = "RESIZE",
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	colors = {
		tab_bar = {
			background = "#3b4048",
			active_tab = {
				bg_color = "#61afef",
				fg_color = "#ffffff",
			},
			inactive_tab = {
				bg_color = "#3b4048",
				fg_color = "#c0c0c0",
			},
			inactive_tab_hover = {
				bg_color = "#4e5b62",
				fg_color = "#ffffff",
			},
		},
	},
	keys = {
		{
			key = "a",
			mods = "LEADER",
			action = action.SendKey({
				key = "a",
				mods = "CTRL",
			}),
		},
		{
			key = "c",
			mods = "LEADER",
			action = action.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "p",
			mods = "CTRL|ALT",
			action = wezterm.action.SpawnCommandInNewTab({
				args = { "powershell.exe" },
				domain = { DomainName = "local" },
			}),
		},
		{
			key = "q",
			mods = "CTRL",
			action = action.CloseCurrentPane({ confirm = false }),
		},
		{
			key = "r",
			mods = "LEADER",
			action = action.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					if line and #line > 0 then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{
			key = "\\",
			mods = "LEADER",
			action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "-",
			mods = "LEADER",
			action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "h",
			mods = "LEADER",
			action = action.ActivatePaneDirection("Left"),
		},
		{
			key = "j",
			mods = "LEADER",
			action = action.ActivatePaneDirection("Down"),
		},
		{
			key = "k",
			mods = "LEADER",
			action = action.ActivatePaneDirection("Up"),
		},
		{
			key = "l",
			mods = "LEADER",
			action = action.ActivatePaneDirection("Right"),
		},
		{
			key = "LeftArrow",
			mods = "ALT",
			action = action.ActivatePaneDirection("Left"),
		},
		{
			key = "RightArrow",
			mods = "ALT",
			action = action.ActivatePaneDirection("Right"),
		},
		{
			key = "UpArrow",
			mods = "ALT",
			action = action.ActivatePaneDirection("Up"),
		},
		{
			key = "DownArrow",
			mods = "ALT",
			action = action.ActivatePaneDirection("Down"),
		},
		{
			key = "LeftArrow",
			mods = "SHIFT",
			action = action.ActivateTabRelative(-1),
		},
		{
			key = "RightArrow",
			mods = "SHIFT",
			action = action.ActivateTabRelative(1),
		},
		{
			key = "G",
			mods = "LEADER",
			action = action.SpawnCommandInNewTab({
				args = { "C:\\Program Files\\Git\\bin\\bash.exe -l -i", "--cd=" .. wezterm.home_dir },
			}),
		},
		{ key = "LeftArrow", mods = "CTRL", action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }) },
		{ key = "RightArrow", mods = "CTRL", action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }) },
	},
}

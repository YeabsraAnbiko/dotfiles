local wezterm = require("wezterm")

return {
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 12,

	color_scheme = "Tokyo Night",

	default_prog = { "wsl.exe", "--cd", "~" },

	window_background_opacity = 0.95,

	-- Minimal window decorations: just resizable frame, no title bar buttons
	window_decorations = "RESIZE",

	-- initial_rows = 30,
	-- initial_cols = 130,

	enable_scroll_bar = false, -- hide scrollbar for cleaner look

	-- Optional: hide tab bar if only single tab open
	-- hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,

	audible_bell = "Disabled",

	colors = {
		tab_bar = {
			background = "#1a1b26", -- match your background (Tokyo Night)
			active_tab = {
				bg_color = "#82AAFF",
				fg_color = "#1a1b26",
			},
			inactive_tab = {
				bg_color = "#1a1b26",
				fg_color = "#565f89",
			},
			inactive_tab_hover = {
				bg_color = "#c0caf5",
				fg_color = "#1a1b26",
			},
			new_tab = {
				bg_color = "#1a1b26",
				fg_color = "#c0caf5",
			},
			new_tab_hover = {
				bg_color = "#1a1b26",
				fg_color = "#c0caf5",
			},
		},
	},

	window_frame = {
		font = wezterm.font({ family = "JetBrainsMono Nerd Font" }),
		font_size = 10.0,
		active_titlebar_bg = "#1a1b26",
		inactive_titlebar_bg = "#1a1b26",
	},

	keys = {
		{
			key = "Space",
			mods = "CTRL|SHIFT",
			action = wezterm.action.ActivateKeyTable({
				name = "vi",
				one_shot = false,
			}),
		},
	},

	key_tables = {
		vi = {
			{ key = "h", action = wezterm.action.SendKey({ key = "LeftArrow" }) },
			{ key = "l", action = wezterm.action.SendKey({ key = "RightArrow" }) },
			{ key = "j", action = wezterm.action.SendKey({ key = "DownArrow" }) },
			{ key = "k", action = wezterm.action.SendKey({ key = "UpArrow" }) },
			{ key = "Escape", action = "PopKeyTable" },
		},
	},
}

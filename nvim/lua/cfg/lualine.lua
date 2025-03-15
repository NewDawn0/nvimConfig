local c = require("b16").cols
require("lualine").setup({
	extensions = { "neo-tree", "oil", "man", "quickfix", "toggleterm", "trouble" },
	options = {
		theme = "b16",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { "mode", icon = { "" } } },
		lualine_b = {
			{ "branch", icon = { "" } },
			{
				"filetype",
				icon_only = true,
				separator = "",
				padding = { left = 1, right = 0 },
			},
			{
				"filename",
				padding = { left = 0, right = 1 },
				symbols = { modified = "", readonly = " " },
			},
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			{
				"diagnostics",
				separator = { left = "" },
				symbols = {
					error = " ",
					warn = " ",
					hint = " ",
					info = " ",
				},
			},
			{
				"diff",
				colored = true,
				sources = { "nvim" },
				separator = { left = "" },
				symbols = { added = "󰐖 ", modified = "󱗜 ", removed = "󰍵 " },
				diff_color = {
					added = { fg = c.base0B },
					modified = { fg = c.base0C },
					removed = { fg = c.base08 },
				},
			},
		},
		lualine_z = {
			{ "progress", icon = { "" } },
		},
	},
})

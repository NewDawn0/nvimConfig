require("lib.keys").setKb({
	{
		"<C-h>",
		action = ":TmuxNavigateLeft<cr>",
		desc = "Move left",
		modes = { "n" },
	},
	{
		"<C-j>",
		action = ":TmuxNavigateDown<cr>",
		desc = "Move down",
		modes = { "n" },
	},
	{
		"<C-k>",
		action = ":TmuxNavigateUp<cr>",
		desc = "Move up",
		modes = { "n" },
	},
	{
		"<C-l>",
		action = ":TmuxNavigateRight<cr>",
		desc = "Move right",
		modes = { "n" },
	},
})

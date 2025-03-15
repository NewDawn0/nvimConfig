local gitsigns = require("gitsigns")
local setKb = require("lib.keys").setKb
gitsigns.setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "┃" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "" },
		change = { text = "" },
		delete = { text = "" },
		topdelete = { text = "" },
		changedelete = { text = "~" },
		untracked = { text = "" },
	},
	on_attach = function(_)
		setKb({
			{
				"<leader>gs",
				action = gitsigns.stage_hunk,
				desc = "Stage hunk",
				modes = { "n" },
			},
			{
				"<leader>gu",
				action = gitsigns.undo_stage_hunk,
				desc = "Unstage hunk",
				modes = { "n" },
			},
			{
				"<leader>gr",
				action = gitsigns.reset_hunk,
				desc = "Reset hunk",
				modes = { "n" },
			},
			{
				"<leader>gd",
				action = gitsigns.diffthis,
				desc = "Diff this",
				modes = { "v" },
			},
			{
				"<leader>gnn",
				action = function()
					gitsigns.nav_hunk("next")
				end,
				desc = "Next hunk",
				modes = { "n" },
			},
			{
				"<leader>gnp",
				action = function()
					gitsigns.nav_hunk("prev")
				end,
				desc = "Previous hunk",
				modes = { "n" },
			},
		})
	end,
})

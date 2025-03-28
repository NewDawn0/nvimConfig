require("oil").setup({
	default_file_explorer = true,
	delete_to_trash = true,
	columns = { "icons" },
	win_options = {
		wrap = false,
		signcolumn = "no",
		cursorcolumn = false,
		foldcolumn = "0",
		spell = true,
		list = false,
		conceallevel = 3,
		concealcursor = "nvic",
	},
	git = {
		add = function(_)
			return true
		end,
		mv = function(_)
			return true
		end,
		rm = function(_)
			return true
		end,
	},
	use_default_keymaps = false,
	keymaps = {
		["<leader>oh"] = "actions.show_help",
		["<cr>"] = "actions.select",
		["-"] = "actions.parent",
		["<leader>omu"] = "actions.parent",
		["<leader>osc"] = "actions.change_sort",
		["<leader>o."] = "actions.toggle_hidden",
		["<leader>op"] = "actions.preview",
		["<leader>orr"] = "actions.refresh",
		["<leader>osv"] = "actions.select_vsplit",
		["<leader>oss"] = "actions.select_split",
	},
})
require("lib.keys").setKb({
	{
		"<leader>fw",
		desc = "Open oil",
		action = ":Oil<cr>",
		modes = { "n" },
	},
})

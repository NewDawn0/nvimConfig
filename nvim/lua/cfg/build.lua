require("build-nvim").setup({})
require("lib.keys").setKb({
	{
		"<leader>bb",
		action = ":Build build<cr>",
		desc = "Build project",
		modes = { "n" },
	},
	{
		"<leader>br",
		action = ":Build run<cr>",
		desc = "Run project",
		modes = { "n" },
	},
})

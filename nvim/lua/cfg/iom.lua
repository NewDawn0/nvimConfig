require("indent-o-matic").setup({
	max_lines = 500,
	standard_widths = { 2, 4, 8 },
	skip_multiline = true,
})
vim.cmd("IndentOMatic")

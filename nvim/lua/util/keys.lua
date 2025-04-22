local setKb = require("lib.keys").setKb

---Finds a string in a buffer
local function findInBuf()
	vim.api.nvim_feedkeys("/", "n", false)
end

setKb({
	-- General
	{
		"<leader>hh",
		action = ":nohlsearch<cr>",
		desc = "Disable search highlight",
		modes = { "n", "v" },
	},
	{
		"<leader>fib",
		action = "",
		desc = "Find in buffer",
		modes = { "n" },
		callback = findInBuf,
	},
	{
		"<",
		action = "<gv",
		desc = "Unindent selection",
		modes = { "v" },
	},
	{
		">",
		action = ">gv",
		desc = "Indent selection",
		modes = { "v" },
	},
	{
		"<leader>ss",
		action = ":sort<cr>",
		desc = "Sort selection",
		modes = { "v" },
	},
	{
		"<leader>fc",
		action = ":foldclose<cr>",
		desc = "Close fold",
		modes = { "n", "v" },
	},
	{
		"<leader>fo",
		action = ":foldopen<cr>",
		desc = "Open fold",
		modes = { "n", "v" },
	},
	{
		"<leader>sh",
		action = ":split<cr>",
		desc = "New horizontal split",
		modes = { "n", "v" },
	},
	{
		"<leader>sv",
		action = ":vsplit<cr>",
		desc = "New vertical split",
		modes = { "n", "v" },
	},
})

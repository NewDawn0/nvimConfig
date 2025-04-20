local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local fn = vim.fn
local cmd = vim.cmd
local setKb = vim.api.nvim_buf_set_keymap
local optl = vim.opt_local

-- Create group
augroup("userconf", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
	group = "userconf",
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- Return to position when opening files
autocmd("BufReadPost", {
	group = "userconf",
	callback = function()
		if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line("$") then
			fn.setpos(".", fn.getpos("'\""))
			cmd("silent! foldopen")
		end
	end,
})

-- Automatically reload file if changed
autocmd({ "BufEnter", "CursorHold", "FocusGained" }, {
	group = "userconf",
	command = "silent! checktime %",
})

-- Automatically resize windows when screen size changes
autocmd("VimResized", {
	command = "tabdo wincmd =",
	group = "userconf",
})

-- Create missing dirs for writing to path
autocmd("BufWritePre", {
	group = "userconf",
	command = "call mkdir(expand('<afile>:p:h'), 'p')",
})

-- Text editing
autocmd("FileType", {
	group = "userconf",
	pattern = {
		"gitcommit",
		"markdown",
		"text",
	},
	callback = function()
		local opts = { noremap = true, silent = true }
		optl.spell = true
		optl.wrap = true
		setKb(0, "n", "j", "gj", opts)
		setKb(0, "n", "k", "gk", opts)
	end,
})

-- Make bufs closable using <q>
autocmd("FileType", {
	group = "userconf",
	pattern = {
		"help",
		"man",
		"lspinfo",
		"checkhealth",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", ":q<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Set filetype for asm includes & macros
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = "*.inc",
	group = "userconf",
	callback = function()
		vim.bo.filetype = "asm"
	end,
})

-- Display last write time
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		local file = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")
		local lines = vim.fn.line("$")
		local bytes = vim.fn.getfsize(vim.fn.expand("%"))
		local time = os.date("%I:%M:%S%p")
		vim.cmd("echo '' | redraw")
		vim.cmd(string.format("echo '\"%s\" %sL, %s bytes written at %s'", file, lines, bytes, time))
	end,
})

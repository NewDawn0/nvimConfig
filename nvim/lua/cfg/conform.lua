require("conform").setup({
	format_on_save = function(bufnr)
		if vim.b[bufnr].format_enabled == false or vim.b.format_enabled == false then
			return
		end
		return { timeout_ms = 1000, lsp_format = "fallback" }
	end,
	formatters = {
		black = { prepend_args = { "--fast" } },
		gleam = { prepend_args = { "format" } },
		proto = { command = "buf", args = { "format", "$FILENAME" }, stdin = true },
		taplo = { prepend_args = { "format", "$FILENAME" }, stdin = false },
		zig = { command = "zig", args = { "fmt", "$FILENAME" }, stdin = false },
	},
	formatters_by_ft = {
		asm = { "asmfmt" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		css = { "prettierd" },
		fortran = { "fprettify" },
		gleam = { "gleam" },
		go = { "gofmt" },
		haskell = { "ormulu" },
		html = { "prettierd" },
		java = { "google-java-format" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		json = { "prettierd" },
		lua = { "stylua" },
		markdown = { "prettierd" },
		nix = { "nixfmt" },
		perl = { "perltidy" },
		python = { "isort", "black" },
		rust = { "rustfmt" },
		sh = { "beautysh", "shellharden" },
		toml = { "taplo" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		yaml = { "yamlfmt" },
		zig = { "zig" },
		zsh = { "beautysh", "shellharden" },
	},
})

-- Create user command
vim.api.nvim_create_user_command("FormatToggle", function(opts)
	local scope = opts.args:lower()
	local bufnr = vim.api.nvim_get_current_buf()
	if scope == "local" then
		vim.b[bufnr] = vim.b[bufnr] or {}
		if vim.b[bufnr].format_enabled == nil then
			vim.b[bufnr].format_enabled = true
		end
		vim.b[bufnr].format_enabled = not vim.b[bufnr].format_enabled
		vim.notify("Format (Local) set to: " .. tostring(vim.b[bufnr].format_enabled))
	elseif scope == "global" then
		vim.g.format_enabled = not vim.g.format_enabled
		vim.notify("Format (Global) set to: " .. tostring(vim.g.format_enabled))
	else
		vim.b[bufnr].format_enabled = not vim.b[bufnr].format_enabled
		vim.notify(
			"> Assuming 'local'\n> Format (Local) set to: " .. tostring(vim.b[bufnr].format_enabled),
			vim.log.levels.WARN,
			{ title = "⚠️ No visibility specified" }
		)
	end
end, {
	nargs = 1,
	complete = function()
		return { "local", "global" }
	end,
})

-- Create keybinds
require("lib.keys").setKb({
	{
		"<leader>ftl",
		action = ":FormatToggle local<cr>",
		desc = "Format toggle (Local)",
		modes = { "n", "v" },
	},
	{
		"<leader>ftg",
		action = ":FormatToggle Global<cr>",
		desc = "Format toggle (Global)",
		modes = { "n", "v" },
	},
})

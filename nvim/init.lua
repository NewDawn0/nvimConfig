-- @NOTE: Must be loaded in this exact order
require("util")
require("cfg.b16")
require("cfg.alpha")

local loader = require("loader")
loader.setup()
loader.load({
	-- Speed 🚀
	["indent-o-matic"] = {
		events = { "InsertEnter" },
		file = "cfg.iom",
	},
	["vim-startuptime"] = {
		cmds = { "StartupTime" },
	},
	-- UI ✨
	["bufferline.nvim"] = {
		deps = { "nvim-web-devicons" },
		events = { "BufAdd", "BufReadPost" },
		file = "cfg.bufferline",
	},
	["gitsigns.nvim"] = {
		events = { "BufReadPre", "BufNewFile" },
		file = "cfg.gitsigns",
	},
	["lualine.nvim"] = {
		events = { "UIEnter" },
		deps = { "nvim-web-devicons" },
		file = "cfg.lualine",
	},
	["nvim-notify"] = {
		events = { "UIEnter" },
		file = "cfg.notify",
	},
	["vimplugin-colorful-winsep"] = {
		events = { "WinNew" },
		file = "cfg.winsep",
	},
	-- Functionality 💬
	["comment.nvim"] = {
		keys = { "gcc", "gcb" },
		file = "cfg.comment",
	},
	["mini.surround"] = {
		events = { "ModeChanged" },
		file = "cfg.surround",
	},
	["nvim-cmp"] = {
		cmds = { "CmpStatus" },
		events = { "InsertEnter" },
		deps = { "cmp-buffer", "cmp-nvim-lsp", "cmp-path", "cmp_luasnip", "lspkind.nvim", "luasnip" },
		file = "cfg.cmp",
	},
	["nvim-lspconfig"] = {
		cmds = { "LspInfo" },
		events = { "BufReadPre", "BufNewFile" },
		deps = { "cmp-nvim-lsp", "lspkind.nvim", "nvim-cmp" },
		file = "cfg.lsp",
	},
	["oil.nvim"] = {
		events = "VimEnter",
		deps = { "nvim-web-devicons" },
		file = "cfg.oil",
	},
	["trim.nvim"] = {
		events = { "BufWritePre" },
		file = "cfg.trim",
	},
	["vim-tmux-navigator"] = {
		keys = { "<C-h>", "<C-j>", "<C-k>", "<C-l>" },
		cmds = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight" },
		file = "cfg.tmux",
	},
	["wrapping.nvim"] = {
		keys = { "<leader>wt" },
		filetypes = { "latex", "mail", "rst", "tex", "text" },
		file = "cfg.wrap",
	},
	-- Dependencies 📦
	["luasnip"] = {
		deps = { "friendly-snippets", "cmp_luasnip", "neogen" },
	},
	["neogen"] = {
		file = "cfg.doc",
	},
	["nvim-treesitter"] = {
		events = { "BufNewFile", "BufReadPre" },
		deps = { "nvim-web-devicons" },
		file = "cfg.ts",
	},
	["nvim-web-devicons"] = {
		config = function()
			require("nvim-web-devicons").setup({})
		end,
	},
	-- Dependencies (No CFG) 📦
	["cmp-buffer"] = {},
	["cmp-nvim-lsp"] = {},
	["cmp-path"] = {},
	["cmp_luasnip"] = {},
	["friendly-snippets"] = {},
	["lspkind.nvim"] = {},
})

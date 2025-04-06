-- @NOTE: Must be loaded in this exact order
require("util")
require("cfg.b16")
require("cfg.tokyonight")
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
		keys = {
			"<leader>bn",
			"<leader>bp",
			"<leader>bdd",
			"<leader>bdo",
			"<leader>bdn",
			"<leader>bdp",
			"<leader>bmn",
			"<leader>bmp",
			"<leader>bt",
		},
		events = { "BufAdd", "BufReadPost" },
		file = "cfg.bufferline",
	},
	["dressing.nvim"] = {
		events = { "UIEnter" },
		file = "cfg.dressing",
	},
	["gitsigns.nvim"] = {
		keys = { "<leader>gs", "<leader>gu", "<leader>gr", "<leader>gd", "<leader>gnn", "<leader>gnp" },
		events = { "BufReadPre", "BufNewFile" },
		file = "cfg.gitsigns",
	},
	["indent-blankline.nvim"] = {
		events = { "BufReadPost", "BufNewFile" },
		deps = { "rainbow-delimiters.nvim" },
		file = "cfg.ibl",
	},
	["lspsaga.nvim"] = {
		events = { "BufReadPre", "BufNewFile" },
		deps = { "telescope.nvim", "nvim-web-devicons", "nvim-lspconfig" },
		config = function()
			require("lspsaga").setup({})
		end,
	},
	["lualine.nvim"] = {
		events = { "UIEnter" },
		deps = { "nvim-web-devicons" },
		file = "cfg.lualine",
	},
	["nvim-colorizer.lua"] = {
		events = { "BufReadPre" },
		file = "cfg.colorizer",
	},
	["nvim-notify"] = {
		events = { "UIEnter" },
		file = "cfg.notify",
	},
	["todo-comments.nvim"] = {
		events = { "BufReadPre" },
		deps = { "plenary.nvim" },
		file = "cfg.todo",
	},
	["vimplugin-colorful-winsep"] = {
		events = { "WinNew" },
		file = "cfg.winsep",
	},
	-- Functionality 💬
	["boole.nvim"] = {
		keys = { "<C-i>", "<C-d>" },
		file = "cfg.boole",
	},
	["comment.nvim"] = {
		keys = { "gcc", "gcb" },
		file = "cfg.comment",
	},
	["conform.nvim"] = {
		events = { "BufAdd", "BufReadPost" }, -- Just needs to be loaded before BufWritePre
		keys = { "<leader>bf", "<leader>ftl", "<leader>ftg" },
		file = "cfg.conform",
	},
	["markdown-preview.nvim"] = {
		filetypes = { "markdown" },
	},
	["mini.surround"] = {
		events = { "ModeChanged" },
		file = "cfg.surround",
	},
	["nvim-autopairs"] = {
		events = { "InsertEnter" },
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	["nvim-cmp"] = {
		cmds = { "CmpStatus" },
		events = { "InsertEnter" },
		deps = { "cmp-buffer", "cmp-nvim-lsp", "cmp-path", "cmp_luasnip", "lspkind.nvim", "luasnip" },
		file = "cfg.cmp",
	},
	["nvim-dap"] = {
		deps = { "nvim-dap-ui", "nvim-dap-go", "nvim-dap-python" },
		keys = { "<leader>dt" },
		file = "cfg.dap",
	},
	["nvim-lspconfig"] = {
		cmds = { "LspInfo" },
		events = { "BufReadPre", "BufNewFile" },
		deps = { "cmp-nvim-lsp", "lspkind.nvim", "nvim-cmp" },
		file = "cfg.lsp",
	},
	["oil.nvim"] = {
		events = { "VimEnter" },
		keys = { "<leader>fw" },
		deps = { "nvim-web-devicons" },
		file = "cfg.oil",
	},
	["telescope.nvim"] = {
		cmds = { "Telescope" },
		keys = {
			"<leader>ff",
			"<leader>fb",
			"<leader>fd",
			"<leader>fgc",
			"<leader>fll",
			"<leader>fn",
			"<leader>fs",
			"<leader>fm",
		},
		deps = { "plenary.nvim", "telescope-fzf-native.nvim", "telescope-media-files.nvim" },
		file = "cfg.telescope",
	},
	["trim.nvim"] = {
		events = { "BufWritePre" },
		file = "cfg.trim",
	},
	["vim-markdown-toc"] = {
		filetypes = { "markdown" },
	},
	["vim-tmux-navigator"] = {
		keys = { "<C-h>", "<C-j>", "<C-k>", "<C-l>" },
		cmds = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight" },
		file = "cfg.tmux",
	},
	["vimplugin-build-nvim"] = {
		keys = { "<leader>bb", "<leader>br" },
		cmds = { "Build" },
		file = "cfg.build",
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
		keys = { "<leader>cd" },
		file = "cfg.doc",
	},
	["nvim-dap-ui"] = {
		deps = { "nvim-nio" },
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
	["rainbow-delimiters.nvim"] = {
		deps = { "nvim-treesitter" },
		file = "cfg.delims",
	},
	["telescope-media-files.nvim"] = {
		deps = { "popup.nvim" },
	},
	-- Dependencies (No CFG) 📦
	["cmp-buffer"] = {},
	["cmp-nvim-lsp"] = {},
	["cmp-path"] = {},
	["cmp_luasnip"] = {},
	["friendly-snippets"] = {},
	["lspkind.nvim"] = {},
	["nvim-dap-go"] = {},
	["nvim-dap-python"] = {},
	["nvim-nio"] = {},
	["nvim-treesitter-textobjects"] = {},
	["plenary.nvim"] = {},
	["popup.nvim"] = {},
	["telescope-fzf-native.nvim"] = {},
})

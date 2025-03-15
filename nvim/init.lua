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
	["nvim-web-devicons"] = {
		config = function()
			require("nvim-web-devicons").setup({})
		end,
	},
})

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
})

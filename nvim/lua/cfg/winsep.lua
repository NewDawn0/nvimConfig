local c = require("b16").config.cols
require("colorful-winsep").setup({
	hi = { bg = "NONE", fg = c.base09 },
	no_exec_files = { "TelescopePrompt", "mason" },
	smooth = true,
})

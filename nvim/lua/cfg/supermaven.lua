local c = require("b16").cols
require("supermaven-nvim").setup({
	color = { suggestion_color = c.base03 },
	disable_inline_completion = false,
	log_level = "info",
	keymaps = {
		accept_suggestion = "<leader>cb",
		accept_word = "<C-a>",
		clear_suggestion = "<leader>cc",
	},
})

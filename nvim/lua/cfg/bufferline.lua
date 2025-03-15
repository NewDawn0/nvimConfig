require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		always_show_bufferline = false,
		separator_style = { "", "" },
		diagnostics_indicator = function(count, level, _, _)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		offsets = {
			{
				filetype = "oil",
				text = "Oil",
				highlight = "Directory",
				text_align = "left",
			},
		},
	},
})

require("lib.keys").setKb({
	{
		"<leader>bn",
		action = ":BufferLineCycleNext<cr>",
		desc = "Goto next buffer",
		modes = { "n" },
	},
	{
		"<leader>bp",
		action = ":BufferLineCyclePrev<cr>",
		desc = "Goto previous buffer",
		modes = { "n" },
	},
	{
		"<leader>bdd",
		action = ":bdelete<cr>",
		desc = "Close current buffer",
		modes = { "n" },
	},
	{
		"<leader>bdo",
		action = ":BufferLineCloseOthers<cr>",
		desc = "Close other buffers",
		modes = { "n" },
	},
	{
		"<leader>bdn",
		action = ":BufferLineCloseRight<cr>",
		desc = "Close right buffer",
		modes = { "n" },
	},
	{
		"<leader>bdp",
		action = ":BufferLineCloseLeft<cr>",
		desc = "Close left buffer",
		modes = { "n" },
	},
	{
		"<leader>bmn",
		action = ":BufferLineMoveNext<cr>",
		desc = "Move buffer to next",
		modes = { "n" },
	},
	{
		"<leader>bmp",
		action = ":BufferLineMovePrev<cr>",
		desc = "Move buffer to previous",
		modes = { "n" },
	},
	{
		"<leader>bt",
		action = ":BufferLineTogglePin<cr>",
		desc = "Toggle pin buffer",
		modes = { "n" },
	},
})

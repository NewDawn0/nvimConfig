local telescope = require("telescope")
local extensions = {
	"fzf",
	"media_files",
}
telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})
for _, ext in ipairs(extensions) do
	telescope.load_extension(ext)
end

require("lib.keys").setKb({
	{
		"<leader>fb",
		action = ":Telescope buffers<cr>",
		desc = "Find buffers",
		modes = { "n" },
	},
	{
		"<leader>fd",
		action = ":Telescope diagnostics<cr>",
		desc = "Find workspace diagnostics",
		modes = { "n" },
	},
	{
		"<leader>ff",
		action = ":Telescope find_files<cr>",
		desc = "Find files",
		modes = { "n" },
	},
	{
		"<leader>fgc",
		action = ":Telescope git_commits<cr>",
		desc = "Find git commits",
		modes = { "n" },
	},
	{
		"<leader>fll",
		action = ":Telescope lsp symbols<cr>",
		desc = "Find lsp symbols",
		modes = { "n" },
	},
	{
		"<leader>fn",
		action = ":Telescope notify<cr>",
		desc = "Find notifications",
		modes = { "n" },
	},
	{
		"<leader>fs",
		action = ":Telescope live_grep<cr>",
		desc = "Find string",
		modes = { "n" },
	},
	{
		"<leader>fm",
		action = ":Telescope media_files<cr>",
		desc = "Find media",
		modes = { "n" },
	},
})

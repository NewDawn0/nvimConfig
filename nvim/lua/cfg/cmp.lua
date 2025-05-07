require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
local luasnip = require("luasnip")
local lib = require("lib.optional")
local cmp = require("cmp")

-- Formatting
local formatting = {
	fields = { "kind", "abbr", "menu" },
	format = function(entry, item)
		local kind = require("lspkind").cmp_format({
			mode = "symbol_text",
			maxwidth = 20,
			ellipsis_char = "...",
			symbol_map = { Codeium = "󰊤", Supermaven = "" },
		})(entry, item)
		local strings = vim.split(kind.kind, "%s", { trimempty = true })
		kind.kind = " " .. (strings[1] or "") .. "  "
		kind.menu = "    (" .. (strings[2] or "") .. ")"
		kind.menu_hl_group = "comment"
		return kind
	end,
}

-- Mapping
local mapping = cmp.mapping.preset.insert({
	["<Tab>"] = function(fallback)
		if cmp.visible() then
			cmp.select_next_item()
		else
			fallback()
		end
	end,
	["<S-Tab>"] = function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		else
			fallback()
		end
	end,
	["<cr>"] = cmp.mapping(function(fallback)
		if cmp.visible() then
			lib.optionalCallback("ai", function()
				local supermaven = require("supermaven-nvim.completion_preview")
				if supermaven.has_suggestion() then
					supermaven.on_accept_suggestion()
				end
			end)
			if luasnip.expandable() then
				luasnip.expand()
			else
				cmp.confirm({ select = true })
			end
		else
			fallback()
		end
	end),
})

-- Snippet
local snippet = {
	expand = function(args)
		luasnip.lsp_expand(args.body)
	end,
}

-- Sources
local sources = {
	{ name = "buffer", keyword_length = 4 },
	{ name = "luasnip" },
	{ name = "nvim_lsp" },
	{ name = "path" },
}
-- Optional ai integration
lib.optionalList("ai", sources, { name = "supermaven" })

-- Setup
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		cmp.setup({
			formatting = formatting,
			mapping = mapping,
			snippet = snippet,
			sources = sources,
		})
	end,
})

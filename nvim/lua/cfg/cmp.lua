require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
local luasnip = require("luasnip")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		local cmp = require("cmp")
		cmp.setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "buffer", keyword_length = 4 },
				{ name = "luasnip" },
				{ name = "path" },
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
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
						if luasnip.expandable() then
							luasnip.expand()
						else
							cmp.confirm({ select = true })
						end
					else
						fallback()
					end
				end),
			}),
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, item)
					local kind = require("lspkind").cmp_format({
						mode = "symbol_text",
						maxwidth = 20,
						ellipsis_char = "...",
						symbol_map = { Codeium = "󰊤" },
					})(entry, item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. "  "
					kind.menu = "    (" .. (strings[2] or "") .. ")"
					kind.menu_hl_group = "comment"
					return kind
				end,
			},
		})
	end,
})

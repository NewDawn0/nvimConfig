local lspcfg = require("lspconfig")
local lsps = require("lib.lsps")

local configured = {
	["lua_ls"] = {
		on_init = function(client)
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if
					path ~= vim.fn.stdpath("config")
					and (vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc"))
				then
					return
				end
			end
			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				runtime = {
					version = "LuaJIT",
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
					},
				},
			})
		end,
		settings = {
			Lua = {},
		},
	},
}

-- Override default capabilities
local lspdefault = lspcfg.util.default_config
lspdefault.capabilities =
	vim.tbl_deep_extend("force", lspdefault.capabilities, require("cmp_nvim_lsp").default_capabilities())

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		require("lib.keys").setKb({
			{
				"<leader>ch",
				action = ":lua vim.lsp.buf.hover()<cr>",
				desc = "Lsp hover",
				modes = { "n" },
			},
			{
				"<leader>cgd",
				action = ":lua vim.lsp.buf.definition()<cr>",
				desc = "Lsp goto definition",
				modes = { "n" },
			},
			{
				"<leader>cgD",
				action = ":lua vim.lsp.buf.declaration()<cr>",
				desc = "Lsp goto declaration",
				modes = { "n" },
			},
			{
				"<leader>cgi",
				action = ":lua vim.lsp.buf.implementation()<cr>",
				desc = "Lsp goto implementation",
				modes = { "n" },
			},
			{
				"<leader>cgt",
				action = ":lua vim.lsp.buf.type_definition()<cr>",
				desc = "Lsp goto type definition",
				modes = { "n" },
			},
			{
				"<leader>cgr",
				action = ":lua vim.lsp.buf.references()<cr>",
				desc = "Lsp goto references",
				modes = { "n" },
			},
			{
				"<leader>cs",
				action = ":lua vim.lsp.buf.signature_help()<cr>",
				desc = "Lsp open signature help",
				modes = { "n" },
			},
			{
				"<leader>cr",
				action = ":lua vim.lsp.buf.rename()<cr>",
				desc = "Lsp rename",
				modes = { "n" },
			},
			{
				"<leader>ca",
				action = ":lua vim.lsp.buf.code_action()<cr>",
				desc = "Lsp code action",
				modes = { "n" },
			},
			{
				"<leader>cf",
				action = ":lua vim.lsp.buf.format({async=true})<cr>",
				desc = "Lsp format",
				modes = { "n" },
			},
		})
	end,
})

-- Setup all handlers
for lsp, cfg in pairs(lsps.merge(configured)) do
	lspcfg[lsp].setup({
		capabilities = lspdefault.capabilities,
		on_init = cfg.on_init or function(...) end,
		on_attach = cfg.on_attach or function(...) end,
		settings = cfg.settings or {},
	})
end

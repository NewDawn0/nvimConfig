local M = {}

M.lsps = {
	["asm_lsp"] = {},
	["basedpyright"] = {},
	["bashls"] = {},
	["buf_ls"] = {},
	["ccls"] = {},
	["clangd"] = {},
	["css_variables"] = {},
	["cssls"] = {},
	["diagnosticls"] = {},
	["dockerls"] = {},
	["emmet_language_server"] = {},
	["emmet_ls"] = {},
	["fortls"] = {},
	["gleam"] = {},
	["golangci_lint_ls"] = {},
	["gopls"] = {},
	["html"] = {},
	["java_language_server"] = {},
	["jdtls"] = {},
	["jsonls"] = {},
	["lua_ls"] = {},
	["marksman"] = {},
	["nil_ls"] = {},
	["nixd"] = {},
	["perlnavigator"] = {},
	["powershell_es"] = {},
	["protols"] = {},
	["rust_analyzer"] = {},
	["taplo"] = {},
	["typos_lsp"] = {},
	["yamlls"] = {},
	["zls"] = {},
}

M.merge = function(configured)
	for name, config in pairs(configured) do
		if M.lsps[name] then
			for k, v in pairs(config) do
				M.lsps[name][k] = v --
			end
		else
			M.lsps[name] = config
		end
	end
	return M.lsps
end

return M

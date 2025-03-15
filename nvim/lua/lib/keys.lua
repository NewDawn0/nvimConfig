local M = {}

M.setKb = function(keybinds)
	for _, k in ipairs(keybinds) do
		local opts = { desc = k.desc, noremap = true, silent = true }
		if k.callback then
			opts.callback = k.callback
		end
		vim.keymap.set(k.modes, k[1], k.action, opts)
	end
end

return M

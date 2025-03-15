local cmd = vim.cmd
local usrcmd = vim.api.nvim_create_user_command

-- Emacs' scratch buffer
usrcmd("Scratch", function()
	cmd([[ split | ene | startinsert ]])
	vim.bo.bufhidden = "wipe"
	vim.bo.buftype = "nofile"
	vim.api.nvim_buf_set_name(0, "Scratch")
end, {})

local wrap = require("wrapping")

wrap.setup({
  notify_on_switch = false,
})

wrap.soft_wrap_mode()

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"latex", "mail", "rst", "tex", "text"},
  callback = function ()
    require("wrapping").soft_wrap_mode()
  end
})

require("lib.keys").setKb({
  {
    "<leader>wt",
    desc = "toggle wrapping",
    action = ":lua require('wrapping').toggle_wrap_mode()<cr>",
    modes = {"n"},
  }
})


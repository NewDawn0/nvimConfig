local g = vim.g
local wo = vim.wo
local opt = vim.opt

-- Globals
g.mapleader = " "
g.autoformat = true

-- Buffer
wo.number = true
wo.relativenumber = true

-- Options
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.completeopt = { "menu", "menuone", "noselect" }
opt.conceallevel = 2
opt.confirm = false
opt.expandtab = true
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.jumpoptions = "view"
opt.laststatus = 3
opt.linebreak = true
opt.list = false
opt.mouse = "a"
opt.pumblend = 10
opt.pumheight = 10
opt.ruler = false
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 2
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartindent = true
opt.smoothscroll = true
opt.spelllang = { "en" }
opt.tabstop = 2
opt.termguicolors = true
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.wrap = false

-- Folds
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 8
opt.foldlevelstart = 8
opt.foldmethod = "expr"

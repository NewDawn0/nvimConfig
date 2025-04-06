{ pkgs }:
with pkgs.vimPlugins; [
  # Speed 🚀
  indent-o-matic
  vim-startuptime
  # UI ✨
  alpha-nvim
  b16-nvim
  bufferline-nvim
  colorful-winsep-nvim
  dressing-nvim
  gitsigns-nvim
  indent-blankline-nvim
  lspsaga-nvim
  lualine-nvim
  nvim-colorizer-lua
  nvim-notify
  todo-comments-nvim
  tokyonight-nvim
  # Functionality 💬
  boole-nvim
  build-nvim
  comment-nvim
  conform-nvim
  markdown-preview-nvim
  mini-surround
  nvim-autopairs
  nvim-cmp
  nvim-dap
  nvim-dap-ui
  nvim-lspconfig
  oil-nvim
  telescope-nvim
  trim-nvim
  vim-markdown-toc
  vim-tmux-navigator
  wrapping-nvim
  # Dependencies 📦
  cmp-buffer
  cmp-nvim-lsp
  cmp-path
  cmp_luasnip
  friendly-snippets
  lspkind-nvim
  luasnip
  neogen
  nvim-nio
  nvim-treesitter-textobjects
  nvim-treesitter.withAllGrammars
  nvim-web-devicons
  plenary-nvim
  popup-nvim
  rainbow-delimiters-nvim
  telescope-fzf-native-nvim
  telescope-media-files-nvim
  nvim-dap-python
  nvim-dap-go
]

{ pkgs }:
with pkgs; [
  # Lua
  lua-language-server
  luaPackages.luacheck
  stylua
  # General lsp
  clang-tools
  lua-language-server
  typos-lsp
  # General
  chafa
  epub-thumbnailer
  ffmpegthumbnailer
  imagemagick
  poppler_utils
  ripgrep
]

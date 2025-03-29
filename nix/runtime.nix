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
  # Formatters
  asmfmt # Assembly
  clang-tools # C, C++
  prettierd # CSS, Html, JS, TS
  fprettify # Fortran
  gleam # Gleam
  go # Go
  golangci-lint-langserver # Go
  gopls # Go
  ormolu # Haskell
  stylua # Stylua
  nixfmt-classic # Nixfmt
  perlPackages.PerlTidy # Perl
  black # Python
  isort # Python
  rustfmt # Rust
  beautysh # Shell, Bash, Zsh
  shellharden # Shell, Bash, Zsh
  taplo # Toml
  yamlfmt # Yaml
  zig # Zig
  # General
  chafa
  epub-thumbnailer
  ffmpegthumbnailer
  imagemagick
  poppler_utils
  ripgrep
]

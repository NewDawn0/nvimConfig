{ pkgs }:
with pkgs; [
  # Lsps
  clang-tools # C, C++
  ccls # C, C++
  lua-language-server # Lua
  typos-lsp # All
  asm-lsp # Assembly
  nodePackages.bash-language-server # Bash, Shell, Zsh
  nodePackages.diagnostic-languageserver # Diagnostics
  vscode-langservers-extracted # CSS, Html, JS, Sass, JSON
  dockerfile-language-server-nodejs # Dockerfile
  fortran-language-server # Fortran
  gleam # Gleam
  gopls # Go
  ormolu # Haskell
  java-language-server # Java
  jdt-language-server # Java
  nodePackages.typescript-language-server # JS, TS
  marksman # Markdown
  write-good # Markdown, Text
  nixd # Nix
  nil # Nix
  perlnavigator # Perl
  buf # Protobuf
  powershell-editor-services # Powershell
  protols # Protobuf
  black # Python
  basedpyright # Python
  rust-analyzer # Rust
  taplo # Toml
  tinymist # Typst
  yaml-language-server # Yaml
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
  # Debuggers
  lldb
  delve
  (python3.withPackages (p: with p; [ debugpy pytest flake8 ]))
  # Linters
  write-good # All
  typos # All
  codespell # All
  nodePackages.cspell # All
  # General
  chafa
  coreutils
  curl
  epub-thumbnailer
  fd
  ffmpegthumbnailer
  fzf
  imagemagick
  poppler_utils
  ripgrep
  wget
  # General: Language tooling
  typescript # JS, TS
  nodejs # JS, TS
  prettierd # JS, TS
  openjdk # Java
  gcc # C
  gnumake # C, C++
  libcxxStdenv # C++
  nasm # Assembly
]

{ pkgs }:
with pkgs; [
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

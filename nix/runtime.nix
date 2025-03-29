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

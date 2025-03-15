{ pkgs }:
let
  lib = import ./lib.nix;
  ndnvimRtp = pkgs.stdenvNoCC.mkDerivation {
    name = "ndnvimRtp";
    src = ../nvim;
    installPhase = ''
      mkdir -p $out/lua
      cp -r lua $out/lua
      rm -r init.lua lua
    '';
  };
  baseNvim = opts:
    pkgs.neovim.override {
      configure = {
        packages.all.start = with pkgs.vimPlugins; [
          b16-nvim
          alpha-nvim
          cmp-buffer
          cmp-nvim-lsp
          cmp-path
          cmp_luasnip
          friendly-snippets
          loader-nvim
          lspkind-nvim
          luasnip
          nvim-cmp
          plenary-nvim
        ];
        packages.all.opt = (import ./plugins.nix { inherit pkgs; });
        customRC = ''
          lua <<EOF
          -- Startup optimisations
          vim.loader.enable()
          vim.opt.rtp:prepend('${ndnvimRtp}/lua')
          vim.g.ndnvim = {
            ${lib.luaOpts opts}
          }
          ${builtins.readFile ../nvim/init.lua}
          EOF
        '';
      };
    };
  wrapNvim = opts: name:
    pkgs.writeShellApplication {
      inherit name;
      runtimeInputs = import ./runtime.nix { inherit pkgs; };
      text = ''
        ${baseNvim opts}/bin/nvim "$@"
      '';
    };
  finalNvim = opts:
    pkgs.symlinkJoin {
      name = "final-nvim";
      paths = map (e: wrapNvim opts e) ([ "nvim" ] ++ opts.aliases);
      meta = {
        description = "Fully setup runnable neovim configuration";
        homepage = "https://github.com/NewDawn0/nvimConfig";
        license = pkgs.lib.licenses.mit;
        maintainers = with pkgs.lib.maintainers; [ NewDawn0 ];
        platforms = pkgs.lib.platforms.all;
      };
    };
in { inherit finalNvim; }

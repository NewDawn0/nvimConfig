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
  wrapNvim = opts:
    pkgs.writeShellApplication {
      name = "nvim";
      runtimeInputs = import ./runtime.nix { inherit pkgs; };
      text = ''
        ${baseNvim opts}/bin/nvim "$@"
      '';
    };
  finalNvim = opts:
    pkgs.stdenvNoCC.mkDerivation {
      name = "nvim";
      src = null;
      dontUnpack = true;
      dontBuild = true;
      installPhase = ''
        install -D ${wrapNvim opts}/bin/nvim $out/bin/nvim
      '' + builtins.concatStringsSep "\n"
        (map (e: "ln -s $out/bin/nvim $out/bin/${e}") opts.aliases);
      meta = {
        description = "Fully setup runnable neovim configuration";
        homepage = "https://github.com/NewDawn0/nvimConfig";
        license = pkgs.lib.licenses.mit;
        maintainers = with pkgs.lib.maintainers; [ NewDawn0 ];
        platforms = pkgs.lib.platforms.all;
      };
    };
in { inherit finalNvim; }

{
  description = "Fully setup runnable neovim configuration";
  inputs = {
    cmp-locked.url = "github:NewDawn0/nvimCmpLocked";
    utils.url = "github:NewDawn0/nixUtils";
    b16-nvim = {
      # url = "github:NewDawn0/b16.nvim";
      url = "path:/Users/dawn/GitHub/b16.nvim";
      inputs.utils.follows = "utils";
    };
    build-nvim = {
      url = "github:NewDawn0/build.nvim";
      inputs.utils.follows = "utils";
    };
    loader-nvim = {
      url = "github:NewDawn0/loader.nvim";
      inputs.utils.follows = "utils";
    };
  };

  outputs = { self, utils, ... }@inputs:
    let
      overlays = with inputs; [
        b16-nvim.overlays.default
        build-nvim.overlays.default
        loader-nvim.overlays.default
        cmp-locked.overlays.default
        (final: prev: (import ./nix/overlays.nix { inherit prev; }))
      ];
    in {
      overlays.default = final: prev: {
        ndnvim = self.packages.${prev.system}.default;
      };
      packages = utils.lib.eachSystem { inherit overlays; } (pkgs:
        let
          opts = import ./nix/opts.nix;
          nvim = import ./nix/nvim.nix { inherit pkgs; };
        in { default = pkgs.lib.makeOverridable nvim.finalNvim opts; });
    };
}

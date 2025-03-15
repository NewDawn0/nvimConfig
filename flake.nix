{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    cmp-locked = { url = "github:NewDawn0/nvimCmpLocked"; };
    b16 = {
      url = "github:NewDawn0/b16.nvim";
      inputs.utils.follows = "utils";
    };
    build-nvim = {
      url = "github:NewDawn0/build.nvim";
      inputs.utils.follows = "utils";
    };
    utils = {
      url = "github:NewDawn0/nixUtils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    loader = {
      url = "github:NewDawn0/loader.nvim";
      inputs.utils.follows = "utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, utils, nixpkgs, ... }@inputs:
    let
      mkPkgs = system:
        import nixpkgs {
          inherit system;
          overlays = [
            inputs.b16.overlays.default
            inputs.build-nvim.overlays.default
            inputs.loader.overlays.default
            inputs.cmp-locked.overlays.default
            (final: prev: (import ./nix/overlays.nix { inherit prev; }))
          ];
        };
    in {
      overlays.default = final: prev: {
        ndnvim = self.packages.${prev.system}.default;
      };
      packages = utils.lib.eachSystem { inherit mkPkgs; } (pkgs:
        let
          opts = import ./nix/opts.nix;
          nvim = import ./nix/nvim.nix { inherit pkgs; };
        in { default = pkgs.lib.makeOverridable nvim.finalNvim opts; });
    };
}

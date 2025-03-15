{ prev }: {
  vimPlugins = prev.vimPlugins // {
    colorful-winsep-nvim = prev.vimUtils.buildVimPlugin {
      name = "colorful-winsep";
      src = prev.fetchFromGitHub {
        owner = "nvim-zh";
        repo = "colorful-winsep.nvim";
        rev = "0070484536ea55ec64a8453d41e3badace04a61a";
        hash = "sha256-OlddU0ehlkbrLzI+Wsq53azzT72HP+75UsaVqIziSvs=";
      };
    };
  };
}

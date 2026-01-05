{ pkgs, config, nixDir, ... }:
let
mkLink = config.lib.file.mkOutOfStoreSymlink;
in
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];
  };
  xdg.configFile.nvim.source = mkLink "${nixDir}/config/nvim";
  home.packages = with pkgs; [
    nixfmt
  ];
}


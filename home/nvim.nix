{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter.withAllGrammars
    ];
  };
  home.file.".config/nvim".source = ../config/nvim;
  home.packages = with pkgs; [
    nixfmt
  ];
}


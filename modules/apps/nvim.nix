{
  pkgs,
  nixDir,
  my-lib,
  ...
}:
{
  hm = {
    xdg.configFile."nvim/parser" = {
      source =
        let
          parsers = pkgs.symlinkJoin {
            name = "treesitter-parsers";
            paths = pkgs.vimPlugins.nvim-treesitter.withAllGrammars.dependencies;
          };
        in
        "${parsers}/parser";
    };
    programs.neovim = {
      enable = true;
      withRuby = true;
      withPython3 = false;
      withNodeJs = false;
      plugins = with pkgs.vimPlugins; [
        nvim-treesitter.withAllGrammars
      ];
      extraConfig = ''
        lua require("config.lazy")
        lua require("langmapper").automapping({ global = true, buffer = true })'';
    };
    xdg.mimeApps.defaultApplications = my-lib.mime-for "nvim.desktop" "text" [
      "plain"
      "markdown"
      "x-python"
      "x-csrc"
      "x-c++src"
      "html"
      "css"
    ];
  };

  my.link-to-conf."nvim" = "${nixDir}/config/nvim";
  environment.systemPackages = with pkgs; [
    tree-sitter
    luarocks

    nixfmt
    nil
    marksman
    statix
    clang-tools
    rust-analyzer
  ];
}

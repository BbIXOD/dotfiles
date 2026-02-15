{ lib, pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
    initLua = ../config/yazi/init.lua;
    settings = lib.importTOML ../config/yazi/yazi.toml;
    keymap = lib.importTOML ../config/yazi/keymap.toml;
    theme = lib.importTOML ../config/yazi/theme.toml;
    plugins = {
      inherit (pkgs.yaziPlugins)
        compress
        recycle-bin
        smart-enter
        smart-paste
        ;
    };
  };
}

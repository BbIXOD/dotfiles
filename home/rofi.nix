{ ... }: {}
# { config, pkgs, ... }:
#
# {
#   programs.rofi = {
#     enable = true;
#     package = pkgs.rofi-wayland;
#
#     plugins = with pkgs; [
#       rofi-calc
#       rofi-emoji
#       rofi-pass
#     ];
#
#     configPath = "$HOME/.config/rofi/config.rasi";
#
#     theme = "gruvbox-dark";
#
#     extraConfig = {
#       modi = "drun,run,window,calc,emoji";
#       show-icons = true;
#       # font = "JetBrains Mono 12";
#       terminal = "ghostty";
#     };
#   };
# }

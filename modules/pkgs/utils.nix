{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xdg-utils
    wl-clipboard
    wlr-randr
    trash-cli
    dragon-drop
    wayfreeze
    luarocks
    grim
    swappy
    wf-recorder
  ];

  fonts.packages = with pkgs; [
    corefonts
  ];
}

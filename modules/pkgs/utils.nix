{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xdg-utils
    wl-clipboard
    wlr-randr
    trash-cli
    dragon-drop
    icu

    hyphen
    hyphenDicts.en-us
  ];
}

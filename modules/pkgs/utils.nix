{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xdg-utils
    wl-clipboard
    wlr-randr
    trash-cli
    dragon-drop
    icu
    slurp
    grim

    hyphen
    hyphenDicts.en-us
  ];
}

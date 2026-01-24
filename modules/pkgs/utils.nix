{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    xdg-utils
    wl-clipboard
    wlr-randr
    trash-cli
    dragon-drop

    hyphen
    hyphenDicts.en-us
  ];
}

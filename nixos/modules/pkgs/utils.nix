{ config, pkgs, inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    xdg-utils
    wl-clipboard
    nerd-fonts.jetbrains-mono
];

}

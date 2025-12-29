{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    xdg-utils
    wl-clipboard
    nerd-fonts.jetbrains-mono
];

}

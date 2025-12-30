{ config, pkgs, inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true;

  imports = [
    ./apps.nix
    ./cli.nix
    ./dev.nix
    ./utils.nix
    ./flatpak.nix
    ./game.nix
  ];
}

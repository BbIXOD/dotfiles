{ config, pkgs, ... }:

{
  imports = [
    ./core.nix
    ./sound.nix
    ./zram.nix
  ];
}

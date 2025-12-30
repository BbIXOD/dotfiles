{ ... }:
{
  home.stateVersion = "25.11";

  imports = [
    ./nvim.nix
    ./gammastep.nix
    ./fish.nix
    ./git.nix
    ./xdg.nix
    ./env.nix
  ];
}


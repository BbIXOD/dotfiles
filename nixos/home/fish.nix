{ pkgs, inputs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --icons";
      rebuild = "sudo nixos-rebuild switch --flake /home/maksym/nixos";
      upgrade = "sudo nixos-rebuild switch --upgrade --flake /home/maksym/nixos";
      stow_sync = "stow /home/maksym/dotfiles";
      yazi = "y";
    };

  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = pkgs.lib.importTOML ../config/starship.toml;
  };

  home.packages = with pkgs; [
    fzf
    grc
    fishPlugins.grc
    fishPlugins.fzf
    fishPlugins.autopair
    fishPlugins.z
    fishPlugins.done
  ];

}

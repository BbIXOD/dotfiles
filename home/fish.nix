{ pkgs, username, ... }:
{

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --icons";
      rebuild = "nh os switch /home/${username}/nixos";
      upgrade = "sudo nixos-rebuild switch --upgrade --flake /home/maksym/nixos";
      stow_sync = "stow /home/maksym/dotfiles";
      yazi = "y";
      cd = "z";
    };
  };
  home.file.".config/fish/functions".source = ../config/fish-functions;

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = pkgs.lib.importTOML ../config/starship.toml;
  };

  programs.zoxide.enable = true;

  home.packages = with pkgs; [
    fzf
    grc
    fishPlugins.grc
    fishPlugins.fzf
    fishPlugins.autopair
    fishPlugins.done
  ];

}

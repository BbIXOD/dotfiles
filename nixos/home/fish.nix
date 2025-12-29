{ pkgs, ... }:
{
  programs.fish = {
    plugins = with pkgs; [
      fishPlugins.fzf-fish
      fishPlugins.autopair
      fishPlugins.grc
      fishPlugins.done
      grc
      fzf
    ];
    shellAliases = {
      ls = "eza --icons";
      cd = "z";
      rebuild = "sudo nixos-rebuild switch --flake /home/maksym/nixos";
      upgrade = "sudo nixos-rebuild switch --upgrade --flake /home/maksym/nixos";
      stow_sync = "stow /home/maksym/dotfiles";
      yazi = "y";
    };
  };
}


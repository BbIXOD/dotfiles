{
  pkgs,
  nixDir,
  config,
  ...
}:
let
  mkLink = config.lib.file.mkOutOfStoreSymlink;
in
{

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --icons";
      rebuild = "sudo -v && nh os switch --impure ${nixDir}";
      stow_sync = "stow /home/maksym/dotfiles";
      yazi = "y";
      cd = "z";
    };
  };
  xdg.configFile."fish/functions".source = mkLink "${nixDir}/config/fish-functions";

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

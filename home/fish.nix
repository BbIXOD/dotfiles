{
  inputs,
  pkgs,
  nixDir,
  config,
  ...
}:
let
  linkDir = import ../lib/linkDir.nix { inherit config; };

in
{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --icons";
      yazi = "yy";
      y = "yy";
      cd = "z";
    };
    interactiveShellInit = (builtins.readFile "${inputs.nightfox}/extra/nightfox/nightfox.fish") + ''
      test -e "${nixDir}/secrets/setup.fish" && source "${nixDir}/secrets/setup.fish"
    '';
    plugins = with pkgs.fishPlugins; [
      {
        name = "grc";
        src = grc.src;
      }
      {
        name = "fzf";
        src = fzf.src;
      }
      {
        name = "autopair";
        src = autopair.src;
      }
      {
        name = "done";
        src = done.src;
      }
    ];
  };
  xdg.configFile = linkDir "${nixDir}/config/fish-functions" "fish/functions";

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = pkgs.lib.importTOML ../config/starship.toml;
  };
  programs.zoxide.enable = true;
  home.packages = with pkgs; [
    fzf
    grc
  ];

  programs.direnv.enable = true;
}

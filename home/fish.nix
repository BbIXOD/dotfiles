{
  inputs,
  pkgs,
  nixDir,
  config,
  ...
}:
let
  mkLink = config.lib.file.mkOutOfStoreSymlink;
in
{
  programs.bash = {
    enable = true;

    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" \
            && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza --icons";
      yazi = "y";
      cd = "z";
    };
    interactiveShellInit = builtins.readFile "${inputs.nightfox}/extra/nightfox/nightfox.fish";
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
  ];

}

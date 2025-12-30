{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    protonup-ng
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
 
  programs.gamemode.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
}

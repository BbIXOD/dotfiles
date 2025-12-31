{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    protonup-ng
      xwayland-satellite
  ];

  services.logmein-hamachi.enable = true;
  systemd.services.logmein-hamachi.wantedBy = lib.mkForce [];

  systemd.user.services.xwayland-satellite = {
    description = "XWayland Satellite";
    after = [ "graphical.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
      Restart = "on-failure";
    };
    wantedBy = [ "default.target" ];
  };


  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
    DISPLAY = ":0";
  };

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  programs.gamemode.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
}

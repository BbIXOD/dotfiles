{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
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
    wantedBy = [ "graphical.target" ];
  };


  environment.sessionVariables = {
    DISPLAY = ":0";
  };

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin];
  };

  programs.gamemode.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  boot.kernelModules = [ "zram" ];
  zramSwap = {
    algorithm = "zstd";
    enable = true;
    memoryPercent = 100;
  };
}

{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  services.logmein-hamachi.enable = true;
  systemd.services.logmein-hamachi.wantedBy = lib.mkForce [ ];
  networking.firewall.trustedInterfaces = [ "ham0" ];


  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  programs.gamemode.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
}

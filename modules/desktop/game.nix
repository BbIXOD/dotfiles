{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    beyond-all-reason
    brogue-ce
    # luanti
    mangohud
  ];

  services.logmein-hamachi.enable = true;
  systemd.services.logmein-hamachi.wantedBy = lib.mkForce [ ];
  networking.firewall.trustedInterfaces = [ "ham0" ];

  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.gamemode.enable = true;

}

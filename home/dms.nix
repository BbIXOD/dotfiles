{
  inputs,
  pkgs,
  config,
  nixDir,
  lib,
  ...
}:
let
  mkLink = config.lib.file.mkOutOfStoreSymlink;
in
{
  imports = [
    inputs.dms.homeModules.dank-material-shell
  ];
  xdg.configFile.DankMaterialShell.source = mkLink "${nixDir}/config/dms";

  programs.dankMaterialShell = {
    enable = true;
    systemd = {
      enable = true;
      restartIfChanged = true;
    };
    quickshell.package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };

  systemd.user.services.dms = {
    Install = {
      WantedBy = lib.mkForce [ "niri.service" "mango-session.target" ];
    };
  };
}

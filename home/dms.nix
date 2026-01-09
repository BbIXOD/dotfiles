{ inputs, pkgs, config, nixDir, ... }:
let
  mkLink = config.lib.file.mkOutOfStoreSymlink;
in
{
  imports = [
    inputs.dms.homeModules.dankMaterialShell.default
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
}

{ nixDir, config, ... }:
let
  mkLink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.stateVersion = "25.11";

  xdg.configFile = {
    niri.source = mkLink "${nixDir}/config/niri";
    yazi.source = mkLink "${nixDir}/config/yazi";
    mango.source = mkLink "${nixDir}/config/mango";
  };
}

{ nixDir, config, ... }:
let
  mkLink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.stateVersion = "25.11";

  xdg.configFile = {
    yazi.source = mkLink "${nixDir}/config/yazi";
  };

}

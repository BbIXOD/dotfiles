{ inputs, config, nixDir, ... }:
let
  mkLink = config.lib.file.mkOutOfStoreSymlink;
in
{
  imports = [
    inputs.mango.hmModules.mango
  ];

  xdg.configFile.mango.source = mkLink "${nixDir}/config/mango";

  wayland.windowManager.mango = {
    enable = true;
  };
}

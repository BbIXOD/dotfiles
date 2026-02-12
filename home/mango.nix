{
  inputs,
  config,
  nixDir,
  system,
  ...
}:
let
  mkLink = config.lib.file.mkOutOfStoreSymlink;
  mango = inputs.mango.packages.${system}.mango.overrideAttrs (old: {
    patches = [ "${inputs.mango-zoom}/screen-zoom.patch" ];
  });
in
{
  imports = [
    inputs.mango.hmModules.mango
  ];

  xdg.configFile.mango.source = mkLink "${nixDir}/config/mango";

  wayland.windowManager.mango = {
    enable = true;
    package = mango;
    systemd = {
      enable = true;
      variables = [
        "XDG_CURRENT_DESKTOP"
        "XDG_SESSION_TYPE"
        "QT_QPA_PLATFORM"
        "XDG_DATA_DIRS"
        "WAYLAND_DISPLAY"
        "DISPLAY"
        "PATH"
      ];
    };
  };
}

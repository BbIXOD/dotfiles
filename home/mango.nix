{
  inputs,
  config,
  nixDir,
  pkgs,
  ...
}:
let
  linkDir = import  ../lib/linkDir.nix { inherit config; };
  mangoPkg = import  ../lib/mango.nix { inherit inputs pkgs; };
in
{
  imports = [
    inputs.mango.hmModules.mango
  ];

  xdg.configFile = linkDir "${nixDir}/config/mango" "mango";

  wayland.windowManager.mango = {
    enable = true;
    package = mangoPkg.mango;
    autostart_sh = " ";
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

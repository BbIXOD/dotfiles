{
  pkgs,
  inputs,
  config,
  nixDir,
  ...
}:

let
  still = pkgs.callPackage ../derivations/still.nix { inherit inputs; };
  msnap = pkgs.callPackage ../derivations/msnap.nix { inherit inputs; };
  mkLink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.packages = with pkgs; [
    msnap
    gpu-screen-recorder
    slurp
    libnotify
    grim
    wl-clipboard
    satty
    still
    quickshell
  ];

  home.file.".local/bin/mcast".source = "${msnap}/bin/mcast";
  home.file.".local/bin/mshot".source = "${msnap}/bin/mshot";
  xdg.configFile."msnap/mcast.conf".source = mkLink "${nixDir}/config/msnap/mcast.conf";
  xdg.configFile."msnap/mshot.conf".source = mkLink "${nixDir}/config/msnap/mshot.conf";

  xdg.configFile."msnap/gui.conf".source =
    "${msnap}/share/msnap/gui.conf";

  xdg.configFile."msnap/gui".source =
    "${msnap}/share/msnap/gui";
}

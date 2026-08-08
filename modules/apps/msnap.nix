{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  nixpkgs.overlays = [ inputs.msnap.overlays.default ];
  environment.systemPackages = with pkgs; [ msnap envsubst ];
  hm = { config, ... }: {
    xdg.configFile."msnap/msnap.conf".source = (pkgs.formats.ini { }).generate "msnap.conf" {
      globalSection = {
        shot_output_dir = config.xdg.userDirs.pictures + "/screenshots";
        shot_filename_pattern = "%Y_%m_%d-%H_%M_%S.png";
        cast_output_dir = config.xdg.userDirs.videos + "/screencasts";
        cast_filename_pattern = "%Y_%m_%d-%H_%M_%S.mp4";
      };
    };
  };
}

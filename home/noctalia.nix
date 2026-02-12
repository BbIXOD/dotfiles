{ inputs, lib, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
    settings = lib.mkForce (builtins.fromJSON (builtins.readFile ../config/noctalia/settings.json));
    colors = lib.mkForce {
      mError = "#ffb2bf";
      mOnError = "#561d2b";
      mOnPrimary = "#003738";
      mOnSecondary = "#3a255b";
      mOnSurface = "#b8f5f4";
      mOnSurfaceVariant = "#a8e3e2";
      mOnTertiary = "#003826";
      mOnHover = "#80d4d6";
      mOutline = "#7193d6";
      mPrimary = "#63cdcf";
      mSecondary = "#9d79d6";
      mShadow = "#000000";
      mSurface = "#192330";
      mHover = "#01434f";
      mSurfaceVariant = "#29394f";
      mTertiary = "#81b29a";
    };
  };
}

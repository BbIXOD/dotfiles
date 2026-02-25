{ inputs, lib, pkgs, ... }:
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
      mHover = "#02499c";
      mSurfaceVariant = "#29394f";
      mTertiary = "#81b29a";
    };
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
        {
          enabled = true;
          name = "Slow Bongo";
          url = "https://github.com/tuibird/slowbongo.git";
        }
      ];
      states = {
        privacy-indicator = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        "805fa1:slowbongo" = {
          enabled = true;
          sourceUrl = "https://github.com/tuibird/slowbongo.git";
        };
      };
      version = 2;
    };

    pluginSettings = {
      privacy-indicator = ../config/noctalia/plugins/privacy-indicator.json;
      "805fa1:slowbongo" = ../config/noctalia/plugins/slowbongo.json;
    };
  };

  home.packages = with pkgs; [
    evtest
  ];
}

{
  pkgs,
  ...
}:
{
  nixpkgs.overlays = [
    (import (
      builtins.fetchTarball {
        url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      }
    ))
  ];
  services.emacs.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    symbola
  ];

  environment.systemPackages = with pkgs; [
    pandoc
    shellcheck
  ];

  hm = { config, ... }: {
    home.sessionPath = [
      "${config.xdg.configHome}/emacs/bin"
    ];
  };
}

{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    ghostty

    inputs.forkprince.packages.x86_64-linux.helium-nightly
    libreoffice
    vlc
    krita
    kdePackages.kdenlive
    qalculate-qt
    obs-studio
    dolphin
    ark
    okular
    gwenview

    spectacle
    kdeconnect
    filelight
    partitionmanager

    ayugram-desktop
    vesktop
    zoom-us
  ];
  programs.neovim.enable = true;
}

{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    ghostty

    inputs.forkprince.packages.x86_64-linux.helium-nightly
    libreoffice
    vlc
    krita
    qbittorrent
    kdePackages.kdenlive
    qalculate-qt
    obs-studio
    kdePackages.dolphin
    kdePackages.ark
    kdePackages.okular
    kdePackages.gwenview
    kdePackages.partitionmanager

    ayugram-desktop
    vesktop
    zoom-us
  ];
  programs.neovim.enable = true;
}

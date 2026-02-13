{ pkgs, inputs, system, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.forkprince.packages.${system}.helium-nightly
    libreoffice
    vlc
    krita
    qbittorrent
    qalculate-gtk
    kdePackages.kdenlive
    kdePackages.okular
    kdePackages.gwenview
    kdePackages.partitionmanager
    freetube

    obs-studio
    deepfilternet
    easyeffects

    ayugram-desktop
    vesktop
    zoom-us
  ];
  programs.neovim.enable = true;
}

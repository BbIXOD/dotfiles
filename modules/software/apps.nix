{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.helium.packages.${stdenv.hostPlatform.system}.helium-nightly
    krita
    qbittorrent
    qalculate-qt
    kdePackages.kdenlive
    kdePackages.partitionmanager
    freetube
    # winboat
    vscode

    obs-studio
    deepfilternet
    easyeffects

    ayugram-desktop
    vesktop
    zoom-us
  ];
  programs.neovim.enable = true;

}

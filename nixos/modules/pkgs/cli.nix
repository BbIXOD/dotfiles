{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
  vim
  wget
  curl
  git
  stow
  yazi

  eza
  bat
  fd
  ripgrep
  fzf
  zoxide
  starship
  btop
  gdu
  fastfetch
  tldr
  locate
  unixtools.netstat


  unzip
  zip
  tree
  jq

  alsa-utils
];

}

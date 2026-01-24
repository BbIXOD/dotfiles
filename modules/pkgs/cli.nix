{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    yazi
    github-copilot-cli
    gemini-cli

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
    plocate
    unixtools.netstat
    fortune

    tree
    jq
    libarchive
    libqalculate
    nix-tree

    atool
    rar
    unrar
    zip
    unzip

    alsa-utils
  ];

}

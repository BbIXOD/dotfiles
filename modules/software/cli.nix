{
  pkgs,
  inputs,
  ...
}:
let
  llm-pkgs = with inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
    codegraph
    antigravity-cli
  ];
in
{
  environment.systemPackages =
    with pkgs;
    [
      vim
      wget
      curl
      git
      git-crypt

      cursor-cli
      opencode
      codex

      eza
      bat
      fd
      sd
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
      calibre
      alsa-utils
      tintin # mud client
      hyprpicker
      fanficfare # download ebooks from site

      atool
      rar
      unrar
      zip
      unzip
      p7zip
    ]
    ++ llm-pkgs;

  # services.pcscd.enable = true;
  programs = {
    firejail.enable = true;
    gnupg.agent = {
      enable = true;
      pinentryPackage = with pkgs; pinentry-qt;
      enableSSHSupport = true;
    };
  };
}

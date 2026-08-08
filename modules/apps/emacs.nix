{
  pkgs,
  ...
}:
{
  nixpkgs.config.packageOverrides = pkgs: {
    myEmacs = pkgs.emacs31.pkgs.withPackages (
      epkgs: with epkgs; [
        treesit-grammars.with-all-grammars
      ]
    );
  };

  services.emacs = {
    enable = true;
    package = pkgs.myEmacs;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.symbols-only
    symbola
  ];

  environment.systemPackages = with pkgs; [
    myEmacs
    pandoc
    shellcheck
    libtool
    isort
    pyenv
    emacsPackages.pytest
    html-tidy
    stylelint
    js-beautify
    emacs-lsp-booster
    (aspellWithDicts (
      dicts: with dicts; [
        en
        en-computers
        uk
      ]
    ))
  ];

  hm = { config, ... }: {
    home.sessionPath = [
      "${config.xdg.configHome}/emacs/bin"
    ];
  };
}

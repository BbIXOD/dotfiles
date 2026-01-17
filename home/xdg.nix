{ ... }:
{
  xdg = {
    configFile."user-dirs.dirs".force = true;
    userDirs = {
      enable = true;
      createDirectories = true;

      documents = "$HOME/docs";
      download = "$HOME/downloads";
      music = "$HOME/media/music";
      pictures = "$HOME/media/pictures";
      videos = "$HOME/media/videos";
      desktop = "$HOME/tmp";
      templates = "$HOME/tmp";
      publicShare = "$HOME/public";
    };
    mime.enable = true;
    mimeApps = {
      enable = true;
      associations.added = {
        "application/pdf" = [ "okular.desktop" ];
        "x-scheme-handler/http" = [ "helium.desktop" ];
        "x-scheme-handler/https" = [ "helium.desktop" ];
      };
      defaultApplications = {
        "application/pdf" = [ "okular.desktop" ];
        "x-scheme-handler/http" = [ "helium.desktop" ];
        "x-scheme-handler/https" = [ "helium.desktop" ];
      };
    };
  };

}

{ lib, ... }:
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
      defaultApplications = {
        "application/pdf" = [ "org.kde.okular.desktop" ];
        "x-scheme-handler/http" = [ "helium.desktop" ];
        "x-scheme-handler/https" = [ "helium.desktop" ];
        "x-scheme-handler/ftp" = [ "helium.desktop" ];
        "image/*" = [ "org.kde.gwenview.desktop" ];
        "audio/*" = [ "vlc.desktop" ];
        "video/*" = [ "vlc.desktop" ];
        "text/*" = [ "nvim.desktop" ];
        "application/json" = [ "nvim.desktop" ];
        "inode/directory" = [ "yazi.desktop" ];
      };
    };
  };

}

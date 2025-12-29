{ ... }:
{
  xdg.configFile."user-dirs.dirs".force = true;
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    documents = "$HOME/docs";
    download = "$HOME/dl";
    music = "$HOME/media/music";
    pictures = "$HOME/media/pictures";
    videos = "$HOME/media/videos";
    desktop = "$HOME/tmp";
  };

}

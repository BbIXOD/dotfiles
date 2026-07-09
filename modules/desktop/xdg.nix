_: {
  hm.xdg = {
    configFile."user-dirs.dirs".force = true;
    userDirs = {
      enable = true;
      setSessionVariables = true;
      createDirectories = true;

      download = "$HOME/downloads";
      projects = "$HOME/projects";
      documents = "$HOME/documents";
      music = "$HOME/music";
      pictures = "$HOME/pictures";
      videos = "$HOME/videos";
      desktop = "$HOME/desktop";
      templates = "$HOME/templates";
      publicShare = "$HOME/public";
    };
    mime.enable = true;
    mimeApps = {
      enable = true;
    };
  };
}

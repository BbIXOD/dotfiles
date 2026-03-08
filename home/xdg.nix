{ lib, ... }:
let
  mimeFor =
    app: category: exts:
    builtins.listToAttrs (
      map (ext: {
        name = "${category}/${ext}";
        value = [ app ];
      }) exts
    );

in
{
  xdg.mimeApps.defaultApplications =
    (mimeFor "org.kde.gwenview.desktop" "image" [
      "png"
      "jpeg"
      "jpg"
      "gif"
      "webp"
      "bmp"
      "tiff"
    ])
    // (mimeFor "vlc.desktop" "video" [
      "mp4"
      "mkv"
      "webm"
      "avi"
      "mov"
    ])
    // (mimeFor "vlc.desktop" "audio" [
      "mp3"
      "flac"
      "wav"
      "ogg"
      "m4a"
    ])
    // (mimeFor "nvim.desktop" "text" [
      "plain"
      "markdown"
      "x-python"
      "x-csrc"
      "x-c++src"
      "html"
      "css"
    ])
    // (mimeFor "helium.desktop" "x-scheme-handler" [
      "http"
      "https"
      "ftp"
    ])
    // {
      "application/pdf" = [ "org.kde.okular.desktop" ];

      "inode/directory" = [ "yazi.desktop" ];
      "x-scheme-handler/terminal" = [ "kitty.desktop" ];
    };
}

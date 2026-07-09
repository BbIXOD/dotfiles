{ my-lib, pkgs, ... }:
{
  hm.xdg.mimeApps.defaultApplications =
    (my-lib.mime-for "vlc.desktop" "video" [
      "mp4"
      "mkv"
      "webm"
      "avi"
      "mov"
    ])
    // (my-lib.mime-for "vlc.desktop" "audio" [
      "mp3"
      "flac"
      "wav"
      "ogg"
      "m4a"
    ])
    // (my-lib.mime-for "qview.desktop" "image" [
      "png"
      "jpeg"
      "jpg"
      "gif"
      "webp"
      "bmp"
      "tiff"
    ])
    // (my-lib.mime-for "startcenter.desktop" "application" [
      "msword"
      "vnd.openxmlformats-officedocument.wordprocessingml.document"
      "vnd.ms-excel"
      "vnd.openxmlformats-officedocument.spreadsheetml.sheet"
      "vnd.ms-powerpoint"
      "vnd.openxmlformats-officedocument.presentationml.presentation"
      "vnd.oasis.opendocument.text"
      "vnd.oasis.opendocument.spreadsheet"
      "vnd.oasis.opendocument.presentation"
      # "epub+zip"
      "rtf"
    ])
    // {
      "application/pdf" = [ "org.kde.okular.desktop" ];
    };

  environment.systemPackages = with pkgs; [
    vlc
    qview
    kdePackages.okular
    libreoffice
  ];
}

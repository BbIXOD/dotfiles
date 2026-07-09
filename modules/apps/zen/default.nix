{ inputs, my-lib, ... }:
{
  hm = {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];

    programs.zen-browser = {
      enable = true;
      setAsDefaultBrowser = false;
      profiles.default = {
        containersForce = true;
        spacesForce = false;
      };
    };

    xdg.mimeApps.defaultApplications =
      my-lib.mime-for "zen-beta.desktop" "x-scheme-handler" [
        "http"
        "https"
        "ftp"
      ]
      // {
        "text/html" = [ "zen-beta.desktop" ];
      };
  };
}

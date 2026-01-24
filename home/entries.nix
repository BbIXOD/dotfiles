{ pkgs, ... }:
{
    xdg.desktopEntries.freetube = {
    name = "Freetube";
    icon = "freetube";
    exec = "${pkgs.freetube}/bin/freetube";
  };
}

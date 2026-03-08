{ lib, ... }:
{
  
  wayland.windowManager.hyprland.settings = {
    general = {
      border_size = 3;
        "col.active_border" = lib.mkForce "rgba(63cdcfff) rgba(9d79d6ff)";
        "col.inactive_border" = lib.mkForce "rgba(212e3fff) rgba(71839bff)";
    };
    decoration = {
      active_opacity = 1.0;
      inactive_opacity = 0.9;
      shadow.enabled = false;
      rounding = 16;
    };
    misc = {
      force_default_wallpaper = false;
    };

    bezier = [
      "standard, 0.1, 0.9, 0.1, 1.05"
    ];
    animation = [
      "windows, 1, 5, standard, slide"
      "windowsOut, 1, 5, standard, slide"
      "border, 1, 10, default"
      "fade, 1, 7, default"
      "workspaces, 1, 5, default, slidevert"
      "borderangle, 1, 5, default, once"

    ];

  };
}

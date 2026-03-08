{ ... }:
{

  wayland.windowManager.hyprland.settings = {
    windowrule = [
      {
        name = "fix-xwayland-drags";
        "match:class" = "^$";
        "match:title" = "^$";
        "match:xwayland" = true;
        "match:float" = true;
        "match:fullscreen" = false;
        "match:pin" = false;
        no_focus = true;
      }
      {
        name = "suppress-maximize-events";
        "match:class" = ".*";
        suppress_event = "maximize";
      }
      {
        name = "neovim-border-color";
        "match:tag" = "neovim";
      }
    ];
    layerrule = [
      {
        name = "region-selector";
        "match:namespace" = "noctalia-shell:regionSelector";
        no_anim = true;
      }
    ];
  };
}

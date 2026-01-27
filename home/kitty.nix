{ lib, ... }:
{
  programs.kitty = lib.mkForce {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    themeFile = "Nightfox";
    font.name = "JetBrainsMono Nerd Font Mono";
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      hide_window_decorations = true;
      mouse_hide_wait = "-1.0";
      cursor_stop_blinking_after = "5.0";
      cursor_trail = "1";
      cursor_trail_start_threshold = "0";
      cursor_blink_interval = "0.5 ease-in-out";
      window_padding_width = 10;
      font_size = 12;
      # dynamic_background_opacity = true;
      # background_opacity = "0.5";
      # background_blur = 5;
    };
  };
}

{ inputs, ... }:
{
  home.sessionVariables = {
    SUPABASE_DB_PASSWORD = "there is db pass";
    npm_config_prefix = "$HOME/.npm-global";
    ANDROID_SDK_ROOT = "$HOME/Android/Sdk";
    CHROME_EXECUTABLE = "${inputs.forkprince.packages.x86_64-linux.helium-nightly}/bin/helium";
    PATH = "$HOME/.npm-global/bin:$HOME/flutter/bin:$PATH";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "helium";
    TERMINAL = "ghostty";
  };
}

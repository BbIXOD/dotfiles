if status --is-interactive

    set -gx SUPABASE_DB_PASSWORD "there is db pass"
    set -gxa PATH $HOME/.npm-global/bin
    set -gx npm_config_prefix $HOME/.npm-global
    set -gx PATH $HOME/flutter/bin $PATH
    set -gx ANDROID_SDK_ROOT $HOME/Android/Sdk
    set -gx CHROME_EXECUTABLE $(which helium)
    # bind Y fish_clipboard_copy
    # bind p fish_clipboard_paste
    # bind -s --preset -M visual -m default Y "fish_clipboard_copy; commandline -f end-selection repaint-mode"

    starship init fish | source
    zoxide init fish | source
end

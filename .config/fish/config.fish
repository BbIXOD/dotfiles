source /usr/share/cachyos-fish-config/cachyos-config.fish

if status --is-interactive

    set -g fish_escape_delay_ms 50

    set -gx SUPABASE_DB_PASSWORD "there is db pass"
    # bind Y fish_clipboard_copy
    # bind p fish_clipboard_paste
    # bind -s --preset -M visual -m default Y "fish_clipboard_copy; commandline -f end-selection repaint-mode"

    starship init fish | source
    zoxide init fish | source
    alias cd="z"
    alias ssh="kitten ssh"
    alias yazi="y"
    alias vg="neovide . &; disown; kitty @ close-window"
end

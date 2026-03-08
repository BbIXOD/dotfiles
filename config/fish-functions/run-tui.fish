function run-tui
    kitty @ set-spacing padding=0
    command $argv
    kitty @ set-spacing padding=default
end

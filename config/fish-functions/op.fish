function op
    set file $argv[1]
    setsid xdg-open $file &>/dev/null
end

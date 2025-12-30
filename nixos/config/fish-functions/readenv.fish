function readenv
    set -f envfile "$argv"
    if not test -f "$envfile"
        echo "Unable to load $envfile"
        return 1
    end
    while read line
        if not string match -qr '^#|^$' "$line"
            if string match -qr '=' "$line"
                set line (string replace -r '^export\s+' '' $line)
                set item (string split -m 1 '=' $line)
                set item[2] (eval echo $item[2])
                set -gx $item[1] $item[2]
                echo "Exported key: $item[1]"
            end
        end
    end <"$envfile"
end

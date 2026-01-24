function rebuild
    if not test -n $NIX_DIR
        echo "NIX_DIR is not set"
        return 1
    end
    if not test -d $NIX_DIR
        echo "$NIX_DIR is not a directory"
        return 1
    end

    sudo -v
    git -C $NIX_DIR add .

    argparse u -- $argv
    if set -q _flag_u
        nh os switch --impure --refresh --update
    else
        nh os switch --impure
    end
end

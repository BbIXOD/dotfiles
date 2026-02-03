function rebuild
    if not test -n $NIX_DIR
        echo "NIX_DIR is not set"
        return 1
    end
    if not test -d $NIX_DIR
        echo "$NIX_DIR is not a directory"
        return 1
    end

    pushd $NIX_DIR
    sudo -v
    git add .

    argparse u -- $argv
    if set -q _flag_u
        nix flake update
        # nix run github:fzakaria/nix-auto-follow -- -i
    end
    sudo nixos-rebuild switch --flake . --impure 

    popd
end

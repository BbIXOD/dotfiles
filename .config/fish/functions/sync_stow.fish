function sync_stow
    set repo ~/dotfiles

    set packages (for d in $repo/*; if test -d $d; echo (basename $d); end; end)

    for pkg in $packages
        stow --dir $DOTFILES_DIR --target $HOME --delete $pkg
        stow --dir $DOTFILES_DIR --target $HOME $pkg
    end

    echo done
end

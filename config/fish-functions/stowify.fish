function stowify
    set target $argv[1]
    set repo ~/dotfiles

    set rel (realpath --relative-to=$HOME $target)
    set dest "$repo/$rel"

    mkdir -p (dirname $dest)
    mv $target $dest
    stow -d $repo -R .
    echo "done"
end


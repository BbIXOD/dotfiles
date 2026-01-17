function rebuild
    sudo -v
    cd ~/nixos/ || return
    git add .
    nh os switch --impure .
end

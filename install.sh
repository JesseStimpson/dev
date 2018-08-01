#!/bin/bash
readonly TGT=/tmp/home-test
readonly DIRS=".config .tmuxp bin .ssh"

install_dir() {
    local dir
    dir="$1"
    echo "==> rsync-ing $dir to $TGT"
    rsync -av "$dir" "$TGT"
}

main() {
    read -p "This may overwrite files in $TGT. Are you sure? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        for d in $DIRS
        do
            echo ""
            install_dir "$d"
        done
    fi
}

main

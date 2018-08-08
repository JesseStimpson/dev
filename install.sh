#!/bin/bash
readonly TGT=/home/jstimpson
readonly DIRS=".config .tmuxp bin .ssh"
readonly FILES=".tmux.conf"

install_dir() {
    local dir
    dir="$1"
    echo "==> rsync-ing $dir to $TGT"
    rsync -av "$dir" "$TGT"
}

install_file() {
    local file
    file="$1"
    echo "==> cp-ing $file to $TGT"
    cp "$file" "$TGT"/"$file"
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
        for f in $FILES
        do
            echo ""
            install_file "$f"
        done
    fi
}

main

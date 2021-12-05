#!/usr/bin/env bash

if git rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git rev-parse --abbrev-ref HEAD)
    gitDirectory=$(git rev-parse --show-toplevel)
    cd $gitDirectory
    git add .
    wait
    git commit -a -m "auto commit @ `date +'%Y-%m-%d %H:%M:%S'`"
    wait
    git push origin $branch
else
    printf "You are not inside a git repository!"
fi

#!/usr/bin/env bash

branch=$(git rev-parse --abbrev-ref HEAD)
gitDirectory=$(git rev-parse --show-toplevel)

cd $gitDirectory
git add .
wait
git commit -a -m "auto commit @ `date +'%Y-%m-%d %H:%M:%S'`"
wait
git push origin $branch

#!/usr/bin/env bash

printf "Enter the full directory address which will be automatically commited and pushed: "
read directory
printf "Enter the branch name: "
read branch
printf "Select the delay (in seconds) after each commit: "
read seconds

cd $directory
while :
do
    git add .
    wait
    git commit -a -m "auto commit @ `date +'%Y-%m-%d %H:%M:%S'`"
    wait
    git push origin $branch
    wait
    sleep $seconds
done

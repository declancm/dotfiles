#!/usr/bin/env bash

printf "Enter the directory location:"
read directory
printf "Enter the branch name:"
read branch

cd directory
while :
do
    git add .
    wait
    git commit -a -m "auto commit and push @ `date +'%Y-%m-%d %H:%M:%S'`"
    sleep 60
    git push origin $branch
    sleep 4m
done

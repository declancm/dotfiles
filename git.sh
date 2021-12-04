#!/usr/bin/env bash

currentwd=$PWD

printf "Enter the full directory address which will be automatically commited and pushed: "
read directory
printf "Enter the branch name: "
read branch
printf "Select the delay (in minutes) after each commit: "
read number

cd $directory
while :
do
    read userInput
    if [ $userInput == 'end']
    then
        cd $currentwd
        break
    else
        printf "test"
        sleep '$number'm
    fi
done

#!/bin/bash

#Note:- while running use  ./log-archive <//var/log  to get logs> <path2 to store result in this location>

path=$1

echo "Please enter your file path to archive: $path"

sudo tar -czvf "LogArchive-$(date +'%Y%m%d_%H-%M-%S').tar.gz" "$path"

echo "Please enter your location to save your archived file: $2"

sudo mv "$(sudo find ~/Projects -name *.tar.gz)" "$2"

echo "Your File is save in: $2  Location"

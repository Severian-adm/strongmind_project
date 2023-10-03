#!/usr/bin/bash

# Source directory
source_dir="/home/uadm/directory2"

# Destination directory
destination_dir="/home/uadm/gdrive/backup"

# Check if source directory exists
if [ ! -d "$source_dir" ]; then
    echo "Source directory '$source_dir' does not exist."
    exit 1
fi

# Check if destination directory exists; create it if it doesn't
if [ ! -d "$destination_dir" ]; then
    echo "Destination directory '$destination_dir' does not exist. Creating it..."
    mkdir -p "$destination_dir"
fi

# rsync archive/verbose/compress from src to dst
rsync -avz "$source_dir/" "$destination_dir/" --log-file=/home/uadm/rsync.log

# Check if successful
if [ $? -eq 0 ]; then
    echo "Files have been successfully copied from '$source_dir' to '$destination_dir'."
else
    echo "Error: Failed to copy files from '$source_dir' to '$destination_dir'."
fi
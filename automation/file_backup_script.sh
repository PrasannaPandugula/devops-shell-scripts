#!/bin/bash

#Configuration
source="/e/devops-shell-scripts/file-ops/testFiles"
destination="/e/devops-shell-scripts/file-ops/backup_files"
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
min_free=100 #min free space
log_file="$destination/backup_log.txt"

# Ensure destination exist

if [ ! -d "$destination" ]; then
	echo "destination folder does not exist"
	mkdir -p "$destination"
fi

# check source exist

if [ ! -d "$source" ]; then
	echo "Source folder not exists"
	exit 1
fi

# check disk space

free_space=$(df "$destination" --output=avail -m | tail -1)
if [ "$free_space" -lt "$min_free" ]; then
	echo "Not enough disk space. Required ${min_free}MB, avaliable ${free_space}"
	exit 1
fi

# perform backup

backup_path="$destination/${source}_$timestamp"
cp -a -v "$source/" "$backup_path/"

if [ $? -ne 0 ]; then
 echo "Backup failed"
 exit 1
fi

#log the backup

echo "Backup of $source complete at $(date) to $backup_path" >> "$log_file"
echo "Backup completed successfully! Details logged to $log_file"

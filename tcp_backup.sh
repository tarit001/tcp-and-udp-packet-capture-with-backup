#!/bin/bash

Src="/root/tcp.txt" #Here you can change your destination path

Dest="/opt" #Here you can change your source path

mkdir -p "$Dest"

bk_file="$Dest/tcp_$(date +'%Y:%m:%d:%H:%M:%S').sh"

cp "$Src" "$bk_file"

if [ $? -eq 0 ]; then
    echo "Backup completed successfully: $bk_file"
    echo "Backup completed at $(date)" >> /var/log/tcp_backup.log #Store log file
else
    echo "Backup failed!"
    echo "Backup failed at $(date)" >> /var/log/tcp_backup.log #Store log file
fi

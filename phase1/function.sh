#!/bin/bash

# Definisi function
sapa() {
    local NAMA=$1           # $1 = argumen pertama ke function
    echo "Halo, $NAMA!"
}

cek_disk() {
    local THRESHOLD=80
    local USAGE=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
    
    if [ $USAGE -ge $THRESHOLD ]; then
        echo "⚠️  PERINGATAN: Disk usage $USAGE%!"
    else
        echo "✅ Disk aman: $USAGE%"
    fi
}

# Panggil function
sapa "Glearn"
sapa "DevOps"
cek_disk

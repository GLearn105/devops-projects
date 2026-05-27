#!/bin/bash

# ============================================
# AUTO BACKUP SCRIPT — Phase 1 Mini Project
# Author: Glearn | DevOps Learning Journey
# ============================================

# === KONFIGURASI ===
SOURCE_DIR="$HOME/devops-projects"
BACKUP_DIR="$HOME/backup-destination"
LOG_DIR="$HOME/devops-projects/phase1/backup-project/logs"
LOG_FILE="$LOG_DIR/backup-$(date +%Y%m).log"
MAX_BACKUPS=7           # simpan maksimal 7 backup terakhir
DISK_THRESHOLD=80       # alert kalau disk usage di atas 80%

# === FUNCTION ===
log() {
    local MESSAGE="[$(date '+%Y-%m-%d %H:%M:%S')] $1"
    echo "$MESSAGE"
    echo "$MESSAGE" >> "$LOG_FILE"
}

cek_disk() {
    local USAGE=$(df "$BACKUP_DIR" | awk 'NR==2 {print $5}' | tr -d '%')
    if [ "$USAGE" -ge "$DISK_THRESHOLD" ]; then
        log "⚠️  PERINGATAN: Disk usage $USAGE% — mendekati batas!"
        return 1
    fi
    log "✅ Disk usage: $USAGE% — aman"
    return 0
}

hapus_backup_lama() {
    local JUMLAH=$(ls -d "$BACKUP_DIR"/backup_* 2>/dev/null | wc -l)
    if [ "$JUMLAH" -gt "$MAX_BACKUPS" ]; then
        local HAPUS=$((JUMLAH - MAX_BACKUPS))
        log "🗑️  Menghapus $HAPUS backup lama..."
        ls -dt "$BACKUP_DIR"/backup_* | tail -n "$HAPUS" | xargs rm -rf
        log "✅ Backup lama berhasil dihapus"
    fi
}

# === MAIN SCRIPT ===
log "========================================"
log "🚀 Backup dimulai"
log "========================================"

# Pastikan folder ada
mkdir -p "$BACKUP_DIR"
mkdir -p "$LOG_DIR"

# Cek disk
cek_disk

# Buat nama backup dengan timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="backup_$TIMESTAMP"
BACKUP_PATH="$BACKUP_DIR/$BACKUP_NAME"

log "📁 Source: $SOURCE_DIR"
log "📦 Destination: $BACKUP_PATH"

# Proses backup
if cp -r "$SOURCE_DIR" "$BACKUP_PATH"; then
    log "✅ Backup BERHASIL: $BACKUP_NAME"
    
    # Hitung ukuran backup
    SIZE=$(du -sh "$BACKUP_PATH" | cut -f1)
    log "📊 Ukuran backup: $SIZE"
else
    log "❌ Backup GAGAL!"
    exit 1
fi

# Hapus backup lama
hapus_backup_lama

log "========================================"
log "🎉 Backup selesai!"
log "========================================"

#!/bin/bash
BACKUP_DIR="../backups"
DATE_STAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="payment_config_backup_$DATE_STAMP.tar.gz"

# Create compressed backup archive of configurations and scripts
echo "=== Starting DR Backup and Synchronization ==="
echo "[*] Creating backup of configurations..."
mkdir -p "$BACKUP_DIR"
tar -czf"$BACKUP_DIR/$BACKUP_NAME" ./ 2>/dev/null

if [ $? -eq 0 ]; then
    echo "[SUCCESS] Backup created: $BACKUP_NAME"
else
    echo "[ERROR] Backup failed!"
    exit 1
fi

# Simulate synchronization of the backup file to the Disaster Recovery (DR) site directory
mkdir -p ~/dr_site_simulation
cp "$BACKUP_DIR/$BACKUP_NAME" ~/dr_site_simulation/
echo "[SUCCESS] DR Site synchronization completed successfully for version: $DATE_STAMP"
echo "=================================================="

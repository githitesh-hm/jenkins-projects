#!/bin/bash
BACKUP_DIR="/backup/config_backup"

find / -type f \( -name "*.sh" -o -name "*.conf" -o -name "*.cfg" -o -name "*.yaml" \) -exec cp --parents {} $BACKUP_DIR \; 2>/dev/null

tar -czvf /backup/config_backup_$(date +%F).tar.gz $BACKUP_DIR
echo "Backup completed: /backup/config_backup_$(date +%F).tar.gz"

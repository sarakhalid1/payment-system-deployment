#!/bin/bash

# Define the log file path with a timestamp
LOG_FILE="../system_audit_$(date +%Y%m%d).log"

echo "==========================================" | tee -a "$LOG_FILE"
echo " Payment Systems Deployment Audit Report" | tee -a "$LOG_FILE"
echo " Date: $(date)" | tee -a "$LOG_FILE"
echo "==========================================" | tee -a "$LOG_FILE"

# Check disk space usage to ensure the server is not running out of storage
echo echo "[*] Checking Disk Space..." | tee -a "$LOG_FILE"
df -h / | grep -v filesystem | tee -a "$LOG_FILE"

# Check system memory usage status
echo -e "\n[*] Checking Memory Status..." | tee -a "$LOG_FILE"
free -m | tee -a "$LOG_FILE"

# Check for active Oracle or database processes running on the system
echo -e "\n[*] Checking Running Processes..." | tee -a "$LOG_FILE"
ps -ef | grep -i ora_ | grep -v grep || echo "No active Oracle processes found or running as different user." | tee -a "$LOG_FILE"

echo -e "\n==========================================" | tee -a "$LOG_FILE"
echo " Audit Complete. Log saved to $LOG_FILE"

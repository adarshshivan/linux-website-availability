#!/bin/bash

# ------------------------------------------
# Linux Network Connectivity Checker
# Author: Adarsh Shivan
# ------------------------------------------

LOGFILE="/home/adarsh/linux-projects/linux-network-checker/network_log.txt"
DATE=$(date "+%Y-%m-%d %H:%M:%S")

echo "----------------------------------------" >> $LOGFILE
echo "Network check started at: $DATE" >> $LOGFILE

# List of sites to test connectivity
SITES=("google.com" "github.com" "amazon.com" "facebook.com")

# Function to check a single site
check_site() {
    SITE=$1
    if ping -c 2 "$SITE" &> /dev/null; then
        echo "✅ $SITE is reachable." | tee -a $LOGFILE
    else
        echo "❌ $SITE is NOT reachable." | tee -a $LOGFILE
    fi
}

# General Internet check
if ping -c 2 8.8.8.8 &> /dev/null; then
    echo "🌐 Internet connection is active." | tee -a $LOGFILE
else
    echo "🚫 No internet connection detected." | tee -a $LOGFILE
fi

# Check each website
echo "" >> $LOGFILE
for SITE in "${SITES[@]}"; do
    check_site $SITE
done

END_DATE=$(date "+%Y-%m-%d %H:%M:%S")
echo "Network check completed at: $END_DATE" >> $LOGFILE
echo "----------------------------------------" >> $LOGFILE
echo "✅ Log saved to: $LOGFILE"


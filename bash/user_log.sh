#!/usr/bin/bash

# Interactive prompt
read -p "Enter the username to search for: " username

# Define the log file
log_file="/var/log/auth.log"

# Use grep to search for the user's login activity
activity=$(grep -i "$username" "$log_file")

# Check for activity
if [ -n "$activity" ]; then
    echo "User activity for '$username' in $log_file:"
    echo "$activity"
else
    echo "No user activity found for '$username' in $log_file."
fi
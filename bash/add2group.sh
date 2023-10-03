#!/usr/bin/bash

# Interactive prompts
read -p "Enter the username: " username
read -p "Enter the group name: " groupname

# Check if user exists
if id "$username" &>/dev/null; then
        sudo usermod -a -G "$groupname" "$username"

        # Check if successful
        if [ $? -eq 0 ]; then
                echo "User '$username' has been added to group '$groupname' successfully."
        else
                echo "Failed to add user '$username' to group '$groupname'."
        fi
else
        echo "User '$username' does not exist."
fi
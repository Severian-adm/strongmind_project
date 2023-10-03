#!/usr/bin/bash

# Interactive prompt
read -p "Enter the name of the group: " groupname

# Check if group exists
if grep -q "^$groupname:" /etc/group; then
        echo "Group '$groupname' already exists."
else
        sudo groupadd "$groupname"

        if [ $? -eq 0 ]; then
                echo "Group '$groupname' has been created successfully."
        else
                echo "Failed to create group '$groupname'."
        fi
fi
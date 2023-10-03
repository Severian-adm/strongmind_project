#!/usr/bin/bash

# Interactive prompts
read -p "Enter the username: " username
read -p "Enter the full name of the user: " full_name
read -p "Enter a description for the user (optional): " description
read -s -p "Enter the password for the user: " password
echo #add line after prompts

sudo useradd -m -c "$full_name,$description" -p "$(echo $password | openssl passwd -1 -stdin)" "$username"

# check if successful
if [ $? -eq 0 ]; then
        echo "User '$username' has been created successfully."
else
        echo "Failed to create user '$username'."
fi
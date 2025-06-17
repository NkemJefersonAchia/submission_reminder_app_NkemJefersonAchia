#!/bin/bash

echo "Welcome to the copilot shell script"
echo "Enter the new assignment name:"
read assignment_name

# Find the config file
config_file=$(find . -path "*/submission_reminder_*/config/config.env" 2>/dev/null | head -n 1)

# Update the ASSIGNMENT value in config.env 
sed -i "2s/ASSIGNMENT=.*/ASSIGNMENT=\"$assignment_name\"/" "$config_file"

echo "Updated assignment name to: $assignment_name"

# Find and run the startup script
startup_script=$(find . -path "*/submission_reminder_*/startup.sh" 2>/dev/null | head -n 1)

# Change to the directory containing startup.sh before running it
cd "$(dirname "$startup_script")"
bash "./startup.sh"

echo "Press any key to exit..."
read -n 1 -s

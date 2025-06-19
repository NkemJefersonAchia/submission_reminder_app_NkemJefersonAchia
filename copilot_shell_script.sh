#!/bin/bash
#prompt the user for a name
echo "Welcome to the copilot shell script"
read -p "Enter the assignment name: " assignment_name

# Error handling 1: Check if assignment name is empty
if [[ -z "$assignment_name" ]]; then
    echo "ERROR: Assignment name cannot be empty"
    echo "Press any key to exit..."
    read -n 1 -s
    exit 1
fi

# Find the config file
config_file=$(find . -path "*/submission_reminder_*/config/config.env" 2>/dev/null | head -n 1)

# Error handling 2: Check if config file was found
if [[ -z "$config_file" ]]; then
    echo "ERROR: No submission reminder directory found. Please run the create environment  script first."
    echo "Press any key to exit..."
    read -n 1 -s
    exit 1
fi

# Update the ASSIGNMENT value in config.env 
sed -i "2s/ASSIGNMENT=.*/ASSIGNMENT=\"$assignment_name\"/" "$config_file"

echo "Updated assignment name to: $assignment_name"

# Find and run the startup script
startup_script=$(find . -path "*/submission_reminder_*/startup.sh" 2>/dev/null | head -n 1)

# Error handling 3: Check if startup script was found
if [[ -z "$startup_script" ]]; then
    echo "ERROR: No startup script found"
    echo "Press any key to exit..."
    read -n 1 -s
    exit 1
fi


# Change to the directory containing startup.sh before running it
cd "$(dirname "$startup_script")"

echo " Automatically running the startup.sh script from $startup_script"
sleep 2
clear
bash "./startup.sh"

echo " To check for other assignments, run the startup.sh script in $startup_script"
echo "Press any key to exit..."
read -n 1 -s

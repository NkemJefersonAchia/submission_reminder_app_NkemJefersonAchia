#!/usr/bin/bash

echo "This script creates the necessary directories and subdirectories"
read -p " Hello, please enter your name: " name
# Error handling 1: Check if name is empty
if [[ -z "$name" ]]; then
    echo "ERROR: Name cannot be empty"
    echo "Press any key to exit..."
    read -n 1 -s
    exit 1
fi

root_dir=submission_reminder_$name

# Error handling 2: Check if directory already exists
if [[ -d "$root_dir" ]]; then
    echo "ERROR: Directory '$root_dir' already exists"
    echo "Press any key to exit..."
    read -n 1 -s
    exit 1
fi
mkdir $root_dir


#create the app directory and populate with the reminder.sh script
mkdir -p $root_dir/app/
touch $root_dir/app/reminder.sh
chmod +x $root_dir/app/reminder.sh

#populating the reminder.sh script
{
	echo '#!/bin/bash'
	echo '# Source environment variables and helper functions'
	echo 'source ./config/config.env'
	echo 'source ./modules/functions.sh'
	echo '# Path to the submissions file'
	echo 'submissions_file="./assets/submissions.txt"'
	echo '# Print remaining time and run the reminder function'
	echo 'echo "Assignment: $ASSIGNMENT"'
	echo 'echo "Days remaining to submit: $DAYS_REMAINING days"'
	echo 'echo "--------------------------------------------"'
	echo 'check_submissions $submissions_file'
} >> $root_dir/app/reminder.sh

#create the modules directory and populate with the functions.sh script and make it executable
mkdir -p $root_dir/modules/
touch $root_dir/modules/functions.sh
chmod +x $root_dir/modules/functions.sh

{
	echo '#!/bin/bash'
	echo '# Function to read submissions file and output students who have not submitted'
	echo 'function check_submissions {'
		echo 'echo 'local submissions_file=$''
		echo 'echo "Checking submissions in $submissions_file"'
		echo '# Skip the header and iterate through the lines'
		echo 'while IFS=, read -r student assignment status; do'
			echo '# Remove leading and trailing whitespace'
			echo 'student=$(echo "$student" | xargs)'
			echo 'assignment=$(echo "$assignment" | xargs)'
			echo 'status=$(echo "$status" | xargs)'
			echo '# Check if assignment matches and status is 'not submitted''
			echo 'if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then'
				echo 'echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"'
			echo 'fi'
			echo 'done < <(tail -n +2 "$submissions_file") # Skip the header'
	echo '}'
} >> $root_dir/modules/functions.sh

#create the assets dir and populate with the submissions.txt file
mkdir -p $root_dir/assets/
touch $root_dir/assets/submissions.txt
#populating the submission.txt file

{
	echo "student, assignment, submission status"
	echo "Chinemerem, Shell Navigation, not submitted"
	echo "Chiagoziem, Git, submitted"
	echo "Divine, Shell Navigation, not submitted"
	echo "Anissa, Shell Basics, submitted"
	echo "Joseph, Git, Submitted"
	echo "Joshua, Shell Basics, not submitted"
	echo "Oke, Shell Navigation, not submitted"
	echo "Oluwatomi, Git, not submitted"
	echo "Nkem, Shell Navigation, not submitted"
} >> $root_dir/assets/submissions.txt


#create the config dir and populate with the config.env file 
mkdir -p $root_dir/config/
touch $root_dir/config/config.env

#populating the config.env file

{
	echo '# This is the config file'
	echo 'ASSIGNMENT="Shell Navigation"'
	echo 'DAYS_REMAINING=2'
} >> $root_dir/config/config.env


#create the startup.sh file and make it executable
touch $root_dir/startup.sh
chmod +x $root_dir/startup.sh

#populating the startup.sh script file 

{
	echo '#!/usr/bin/bash'
	echo 'source ./config/config.env'
	echo 'source ./modules/functions.sh'
	echo './app/reminder.sh'
} >> $root_dir/startup.sh 

#Error Handling 3: This part of the code verifies and checks if all files have been created or if a file is missing


echo "Verifying created structure..."
sleep 2

required_files=(
    "$root_dir/app/reminder.sh"
    "$root_dir/modules/functions.sh"
    "$root_dir/assets/submissions.txt"
    "$root_dir/config/config.env"
    "$root_dir/startup.sh"
)

for file in "${required_files[@]}"; do
    if [[ ! -f "$file" ]]; then
        echo "Verification failed: Missing file $file"
	sleep 2
	exit 1
    fi
done



echo " Environment created successfully"

#this part of the code was added just to make my code more beautiful and to learn how to close the display screen when you press a button on the keyboard

sleep 2

echo "Press any key to exit..."
read -n 1 -s

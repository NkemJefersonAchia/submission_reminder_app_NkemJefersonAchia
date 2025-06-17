# Submission Reminder System

**Author:** Nkem Jeferson Achia

## Overview

This project is an automated submission reminder system that helps track student assignment submissions. It consists of two main scripts that work together to create a complete environment for managing and checking assignment submissions.

## Scripts

### 1. create_environment.sh
Creates the entire project structure and generates all necessary files automatically.

### 2. copilot_shell_script.sh
Updates assignment information and runs the submission reminder system.

## Project Structure

When you run `create_environment.sh`, it creates a directory named `submission_reminder_[YourName]` with the following structure:

submission_reminder_[YourName]/
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── assets/
│   └── submissions.txt
├── config/
│   └── config.env
└── startup.sh

## Automatically Generated Files

The following files are **automatically created** by the `create_environment.sh` script:

- **config/config.env**: Contains assignment name and days remaining
- **assets/submissions.txt**: Sample student submission data with headers
- **modules/functions.sh**: Contains the `check_submissions` function
- **app/reminder.sh**: Main reminder script that checks submissions
- **startup.sh**: Entry point script that sources configs and runs the reminder

**Important**: Do not manually edit these files as they will be overwritten when you run the create environment script again.

## Usage Instructions

### Initial Setup
1. Run the create environment script:
    bash
   ./create_environment.sh
   
2. Enter your name when prompted
3. The script will create the complete directory structure

### Running the System
1. Execute the copilot script:
    bash
   ./copilot_shell_script.sh
   
2. Enter the assignment name when prompted
3. The system will automatically run `startup.sh` and display submission reminders

### Manual Verification (Optional)
You can manually check or run the startup script:
    bash
cd submission_reminder_[YourName]
./startup.sh
 

## Error Messages and Troubleshooting

### create_environment.sh Errors

**ERROR: Name cannot be empty**
- **Cause**: No name was entered when prompted
- **Solution**: Re-run the script and provide a valid name

**ERROR: Directory 'submission_reminder_[name]' already exists**
- **Cause**: A directory with that name already exists
- **Solution**: Remove the existing directory or use a different name

**Verification failed: Missing file [filename]**
- **Cause**: One of the required files wasn't created properly
- **Solution**: Check file permissions and disk space, then re-run the script

### copilot_shell_script.sh Errors

**ERROR: Assignment name cannot be empty**
- **Cause**: No assignment name was entered when prompted
- **Solution**: Re-run the script and provide a valid assignment name

**ERROR: No submission reminder directory found**
- **Cause**: The create environment script hasn't been run yet
- **Solution**: Run `create_environment.sh` first to create the necessary structure

**ERROR: No startup script found**
- **Cause**: The startup.sh file is missing from the submission reminder directory
- **Solution**: Re-run the create environment script to regenerate all files

## System Features

- **Automatic Environment Setup**: Creates complete directory structure and all necessary files
- **Dynamic Assignment Updates**: Easily change assignment names through the copilot script
- **Student Submission Tracking**: Monitors which students haven't submitted assignments
- **Error Prevention**: Comprehensive error checking for missing files and empty inputs
- **User-Friendly Interface**: Clear prompts and "Press any key to exit" functionality

## Technical Details

### Shebang Configuration
All scripts use the standard shebang format:
    bash
#!/usr/bin/bash


### File Permissions
The create environment script automatically sets execute permissions on:
- app/reminder.sh
- modules/functions.sh 
- startup.sh

### Sample Data
The system includes sample student data for testing:
- Students: Chinemerem, Chiagoziem, Divine, Anissa, Joseph, Joshua, Oke, Oluwatomi, Nkem
- Assignments: Shell Navigation, Git, Shell Basics
- Statuses: submitted, not submitted

## Automated Execution

The **copilot script automatically runs the startup.sh script**, so there is no need to run it manually. However, you can:
- Check the contents of `startup.sh` to review what will be executed
- Run the `startup.sh` script manually to verify functionality
- Navigate to the submission reminder directory and execute it directly

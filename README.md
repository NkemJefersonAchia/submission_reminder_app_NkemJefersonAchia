#Submission Reminder App

A shell-based application that helps track and remind students about pending assignment submissions.

# Project Overview

This application consists of two main shell scripts that work together to:
1. Set up a complete application environment with proper directory structure
2. Allow dynamic updating of assignment names and check submission status

## Repository Structure


submission_reminder_app_NkemJefersonAchia/
├── create_environment.sh          # Main setup script
├── copilot_shell_script.sh        # Assignment management script
└── README.md                      # This file


## Files Description

### 1. create_environment.sh
The main setup script that handles everything automatically:
- Prompts for user's name
- Creates a directory named `submission_reminder_{yourName}`
- Sets up the complete application structure with subdirectories and files
- **Automatically creates and populates**: `reminder.sh`, `functions.sh`, `config.env`, `submissions.txt`, and `startup.sh`
- Sets appropriate permissions for all executable files
- **No manual file creation needed** - the script handles all content generation

### 2. copilot_shell_script.sh
The assignment management script that:
- Prompts for a new assignment name
- Updates the configuration file with the new assignment
- Allows re-running the application with updated assignment data

## How to Run the Application

### Prerequisites
- Linux/Unix environment with bash shell
- Git (for version control)
- Text editor permissions for file creation

### Step 1: Clone the Repository
bash
git clone https://github.com/[YourUsername]/submission_reminder_app_[YourGithubUsername].git
cd submission_reminder_app_[YourGithubUsername]


### Step 2: Make Scripts Executable
bash
chmod +x create_environment.sh
chmod +x copilot_shell_script.sh


### Step 3: Run the Environment Setup
bash
./create_environment.sh

- When prompted, enter your name
- The script will create the complete application structure

### Step 4: Navigate to Your Application Directory
bash
cd submission_reminder_{yourName}  # Replace {yourName} with the name you entered


### Step 5: Test the Application
bash
./startup.sh

This will run the reminder application and show students with pending submissions.

## Application Directory Structure

After running `create_environment.sh`, the following structure is created:


submission_reminder_{yourName}/
├── app/
│   ├── reminder.sh           # Main reminder logic (auto-created)
│   └── functions.sh          # Helper functions (auto-created)
├── modules/
│   └── functions.sh          # Additional function modules (auto-created)
├── assets/
│   └── submissions.txt       # Student submission data (auto-created)
├── config/
│   └── config.env           # Application configuration (auto-created)
└── startup.sh               # Application startup script (auto-created)


**Note**: All files are automatically created and populated by the `create_environment.sh` script.

## Key Features

### Environment Setup
- **Fully Automated**: The `create_environment.sh` script creates all directories, files, and content automatically
- **Complete File Generation**: Automatically generates `reminder.sh`, `functions.sh`, `config.env`, `submissions.txt`, and `startup.sh` with proper content
- **Permission Management**: Sets executable permissions for all .sh files
- **Zero Manual Setup**: No need to manually create or edit any files - everything is handled by the script

#Troubleshooting

**Directory Already Exists**
- Remove existing directory or choose a different name
- The script will notify you if conflicts occur

**Configuration Update Issues**
- Ensure you're running `copilot_shell_script.sh` from the correct directory
- Verify the config file path is accessible


## Assignment Requirements Checklist

-  Created `create_environment.sh` with full automation
-  Implemented `copilot_shell_script.sh` for assignment management
-  Used proper Git branching workflow (feature → main)
-  Added comprehensive error handling
-  Followed all submission guidelines
-  Created detailed README.md documentation

## Author

**Nkem Jeferson Achia**  
*Individual Summative Lab - Linux Application Development* 


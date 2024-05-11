# 1.Linux System Installation and Basic Configuration



## Installtion of Ubuntu on VMware Workstation

* Downloaded the Ubuntu ISO file from the official site
* Created a new virtual machine with 2 CPU cores 8192GB RAM Memory and 60GB Disk storage
* Started the virtual machine with the ubuntu iso mounted
* Chose "Install Ubuntu"
* in the tab "Updates and other software" i chose download updates while install ubuntu and Normal installation
* in the installtion type i chose Earase Disk and install ubuntu
* Created a user with a password

### Installtion of Additional packages

After the basic configuration of the Linux system to preform this project i needed to install couple of things.
#### For updating the system packages and upgrade i used the following commands

```
sudo apt update
sudo apt upgrade -y
```
#### For git installation i used the following command
```
sudo apt install git
```
#### For Vim text editor installtion i used the following command
```
sudo apt install vim
```
# 2. Comprehensive File System Organization
```
Before we begin please make sure you are copying the script dircreation.sh to your local system
```
To start the script please enter ./dircreation.sh on the terminal

### Please follow the instructions for the other scripts to be work
* Open the dircreation script
* Press 1 (Add item)
* in the path field enter /home/usr
* in the name field enter education/courses
* in the item type field enter dir
#### The same process do for the folder development

# 3. Scripting Routine Tasks
```
Before we begin please make sure you are copying the script backupscript.sh to your local system
```
## After we created the directories education and development we need to backup them to do so follow the instructions below
* Copy the backupscript.sh file you your local system
* make sure that you created the education and development directories in your home folder for example: /home/usr/education
* then press ./backupscript.sh on the terminal it should write 2 outputs on the terminal that the archiev completed successfuly
* then go to /home/usr/backup and enter to the backup date folder
* there you will find 2 files "development.tar.gz" "education.tar.gz" those are the backups for the folders
* to run the script as cron press on the terminal crontab -e after the commends enter new line if you want to run the script every hour set the following value: 0 * * * * /path/to/backupscript.sh
* now the script will run every hour and will backup those folders


## Maintenance script
### The following script will remove tmp files  and old logs files(older than 90 days)
```
Before we begin please make sure you are copying the script maintenance.sh to your local system
```

```
To run the script please enter the following command sudo ./maintenance
To run the script as cron please write contab -e than enter a new line and enter this value for example: 0 * * * * /path/to/maintenance.sh to run this script every hour
```
#### The script taking the following actions
* Removing tmp files from /tmp
* Removing tmp files from /var/tmp
* Removing log files(older than 90 days) from /var/log


# 4. Process and User Management
## This script allows you to create a couple of users one for education one for development one for personal
```
Before we begin please make sure you are copying the script usermgmt.sh to your local system
```
```
To run the script please enter the following command sudo ./usermgmt
```
### This script is taking the following actions
* Adding a user for education/development/personal
* Allows to the user to create his own password
* Adding 3 groups: education,development,personal
* Adding the user to the group that he should be


## Monitor script
### The following script will monitors active processes and will send to the terminal an alert if: CPU/Memory/Diskspace is above 80% usage
```
Before we begin please make sure you are copying the script monitor.sh to your local system
```
```
To run the script please enter the following command ./monitor.sh
```
#### The script taking the following actions
* Checks if CPU/Memory/Diskspace is above 80% usage
* The script sends output to the terminal if something is above 80% usage
* for example if the cpu is above 80% it prints the cpu usage is above 80% etc...
# 5.Learning and Documentation
## This script asks 25 learning questions about linux subject and print score at the final of the quiz
```
Before we begin please make sure you are copying the script bash-quiz.sh and quiz.txt to your system
```
```
To run the script please enter the following command ./bash-quiz.sh
```
#### The script taking the following actions
* Asks the user 25 questions about linux subject
* At the final of the quiz prints the final score of the user
* Shuffling th questions every time when you start the script

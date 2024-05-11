#!/bin/bash
addgroup education
addgroup development
addgroup personal


###user for education##
education()
{
read -p "enter the username for education: " username
useradd $username -m -s /bin/bash -G education
echo "enter the password for the user"
passwd $username
}
####user for development####
development()
{
read -p "enter the username for development: " username
useradd $username -m -s /bin/bash -G development
echo "enter the password for the user"
passwd $username
}

###############user for personal#######
personal ()
{
read -p "enter the username for personal use: " username
useradd $username -m -s /bin/bash -G personal
echo "enter the password for the user"
passwd $username
}







PS3='choose what user you want to add: '
options=("user for education" "user for development" "user for personal" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "user for education")
              education;;
        "user for development")
            development;;
        "user for personal")
            personal;;
        "Quit")
            break
            ;;
        *) echo "you choose quit";;
    esac
done






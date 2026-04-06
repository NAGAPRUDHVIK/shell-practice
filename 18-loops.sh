#!/bin/bash

USERID=$(id -u)

R="\[31m"
G="\[32m"
Y="\[33m"
N="\[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME="$(echo $0 | cut -d "." -f1)"
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER

if [ $USERID -ne 0 ]; then
    echo "ERROR: Run the script with root previlage"
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2... $R FAILED $N"
        exit 1
    else
        echo -e "Installing $2... $G SUCCESS $N"
    fi
}

for package in $@
do
    #1->success, 2->failure, &->success (or) failure
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]; then
        dnf install package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "$package is already installed... $Y SKIPPING $N"
    fi
done

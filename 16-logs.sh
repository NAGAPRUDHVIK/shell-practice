#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/logs/shell-script"
SCRIPT_NAME="$( echo $0 | cut -d "." -f1 )"
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" #/var/logs/shell-script/15.colors.log

mkdir -p $LOGS_FOLDER #if we use -p it will re-write the folder if it exists.

if [ $USERID -ne 0 ]; then
    echo "ERROR::Run the script with root previlage"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2... $R FAILED $N"
        exit 1
    else
        echo -e "Installing $2... $G SUCCESS $N"
    fi
}

#1->success, 2->failure, &->success (or) failure
dnf list installed mysql & >> $LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y & >> $LOG_FILE
    VALIDATE $? "MYSQL"
else
    echo -e "MYSQL is already installed... $Y SKIPPING $N"
fi

dnf list installed python3 & >> $LOG_FILE
if [ $? -ne 0 ]; then
    dnf install python3 -y & >> $LOG_FILE
    VALIDATE $? "Python3"
else
    echo -e "Python3 is already installed... $Y SKIPPING $N"
fi

dnf list installed nginx & >> $LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y & >> $LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "nginx is already installed... $Y SKIPPING $N"
fi
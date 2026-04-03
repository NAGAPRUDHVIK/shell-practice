#!/bin/bash

USERID=$(id -u)

R="\e[31m]"
G="\e[32m]"
Y="\e[33m]"
N="\e[0m]"

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

dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install python3 -y
VALIDATE $? "PYTHON3"

dnf install nginx -y
VALIDATE $? "nginx"
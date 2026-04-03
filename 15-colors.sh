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
    if [ $1 -ne 0]; then
        echo "Installing $2... $R FAILED $N"
        exit 1
    else
        echo "Installing $2... $G SUCCESS $N"
    fi
}

dnf list installed mysql
if [ $? -ne 0]; then
    dnf install mysql -y
    VALIDATE $? "MYSQL"
else
    echo "MYSQL is already installed... $Y SKIPPING $N"
fi

dnf list installed python3
if [ $? -ne 0]; then
    dnf install python3 -y
    VALIDATE $? "Python3"
else
    echo "Python3 is already installed... $Y SKIPPING $N"
fi

dnf list installed ngnix
if [ $? -ne 0]; then
    dnf install ngnix -y
    VALIDATE $? "ngnix"
else
    echo "ngnix is already installed... $Y SKIPPING $N"
fi
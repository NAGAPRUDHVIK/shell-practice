#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR::Run the script with root previlage"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0]; then
        echo "ERROR::$2 is failed to install"
        exit 1
    else
        echo "$2 is installed succesfully"
    fi
}

dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install python3 -y
VALIDATE $? "PYTHON3"

dnf install ngnix -y
VALIDATE $? "NGNIX"
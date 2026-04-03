#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR::Run the script with root previlage"
    exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "MYSQL is failed to install"
    exit 1
else
    echo "MYSQL is installed succesfully"
fi
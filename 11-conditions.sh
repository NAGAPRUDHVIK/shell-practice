#!/bin/bash

NUMBER=$1

if [  $(($NUMBER%2==0)) -eq 0 ]; then
    echo "The given $NUMBER is even"
else 
    echo "The given $NUMBER is odd"
fi
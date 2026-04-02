#!/bin/bash

NUMBER=$1

IF [$NUMBER -lt 10]; then
    echo "The given number:$NUMBER is less than 10"
else
    echo "The given number:$NUMBER is greater than 10" 
fi
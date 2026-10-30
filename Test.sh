#!/bin/bash

echo "================================"
echo " Jenkins Freestyle Build Started"
echo "================================"

echo "Current Date:"
date

echo "Current User:"
whoami

echo "Current Directory:"
pwd

echo "Listing repository files:"
ls -l

echo "Checking system information:"
uname -a

echo "================================"
echo " Jenkins Build Completed Successfully"
echo "================================"

@echo off

echo ================================
echo Jenkins Build Started
echo ================================

echo Current Date:
date /t

echo Current User:
whoami

echo Repository Files:
dir

echo Executing Test.sh

bash Test.sh

echo ================================
echo Jenkins Build Completed
echo ================================

#! /bin/bash

echo "----------- Configuring Database for WordPress    -----------"
read -p "Enter the database hostname: " database_host
read -p "Enter the database user: " database_user
read -p "Enter the database password: " database_password

database_host_clean=$(echo $database_host | xargs)
database_user_clean=$(echo $database_user | xargs)
database_password_clean=$(echo $database_password | xargs)

# Validate inputs
echo "You have supplied the following values:"
echo "Database Host: '$database_host_clean'"
echo "Database User: '$database_user_clean'"
echo "Database Password: '$database_password_clean'"
read -p "Are these values correct? (y/n): " confirm

if [ "$confirm" != "y" ]; then
    echo "Please re-run the script and enter the correct values."
    exit 1
fi

# Create database
set +x
mysql -u $database_user_clean -p$database_password_clean -h $database_host_clean -e "CREATE DATABASE wordpress;"
echo "----------- Configuration complete    -----------"

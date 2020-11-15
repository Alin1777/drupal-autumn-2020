#!/bin/sh

echo "Copyright (C) <2020> <Mike Chase> "

#Check that argument is provided
if [ $# -eq 0 ]; then
    echo "No argument provided"
    echo "Please enter the settings file line number for trusted host and your codeanywhere site partial path which is the "
    echo " codeanywhere container name - username + port number "
    echo "Example site URL of http://mhcd8test3456-mikehchase309969.codeanyapp.com"
    echo " partial path is mhcd8test3456-mikehchase309969"
    exit 1
fi

#copy settings.php from sites/default to workspace
#delete original after making a copy
cd sites/default/
cp settings.php ../../
sudo rm settings.php
cd ../../

#Use Linix Editor Command to append the trusted_host_patterns settings
#-i means in-place command and 711 is the line number we want to move this to
#$1 is the first argument passed in is ht eline # in the settings file after the trusted host commented code
#$2 the second argument is the partial codeanywhere path 
#
sed -i $1i\ "\$settings[\'trusted_host_patterns\'] = array(\'^$2\.codeanyapp\.com\$\',);" settings.php


#Moving new settings.php to sites/default and setting permission 644
sudo mv settings.php sites/default
sudo chmod 644 sites/default/settings.php

#Changing .htaccess to allow lager file sizes
sudo echo "" >> .htaccess
sudo echo "php_value	upload_max_filesize	20M" >> .htaccess
sudo echo "php_value	post_max_size	50M" >> .htaccess

echo "settings.php was updated"
echo ".htaccess was updated to allow large file uploads"
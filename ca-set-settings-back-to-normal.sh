#!/bin/sh

echo "Copyright (C) <2020> <Mike Chase> "

echo "Return folders and settings to normal."


sudo chown www-data:www-data sites
sudo chown www-data:www-data sites/default
sudo chown www-data:www-data sites/default/settings.php

sudo chmod 555 sites/default/settings.php
sudo chmod 555 sites/default

echo "Folder and settings should be back to normal."
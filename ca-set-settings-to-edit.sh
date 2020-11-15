#!/bin/sh

echo "Copyright (C) <2020> <Mike Chase> "
echo "Set to edit settings file."

sudo chown cabox:cabox sites
sudo chown cabox:cabox sites/default
sudo chown cabox:cabox sites/default/settings.php
sudo chmod 755 sites/default
sudo chmod 755 sites/default/settings.php

echo "Settings file should be ok to edit and copy."

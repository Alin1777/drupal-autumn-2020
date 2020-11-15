#!/bin/sh

# Linux
echo " ca-drupal-v.x.y-minor-core-update-script.sh a Drupal Minor Core upgrade script "

#Check that argument is provided
if [ $# -eq 0 ]; then
    echo "ca-drupal-v.x.y-minor-core-update-script.sh a Drupal v.x.y Minor Core upgrade script"
    echo "Drupal v.y.z core version required argument"
    echo "Please enter the destination Drupal v.x.y Core Version number"
    echo "Example 9.0.3"
    exit 1
fi

 
echo " INSTRUCTIONS "
    
sleep 5s

DRUPAL_VERSION_ZIP="drupal-"$1".tar.gz"
DRUPAL_VERSION='drupal-'$1

cd $HOME 

# (1) Navigate into your Drupal installation.
#
cd $HOME/workspace

# (2) Remove the 'core' and 'vendor' directories.
#
rm  -rf core vendor

# (3) Remove all of the files in the top-level directory.
#
rm -f *.* .[a-z]*

cd $HOME 

wget https://ftp.drupal.org/files/projects/$DRUPAL_VERSION_ZIP

tar xzvf $DRUPAL_VERSION_ZIP

cd $DRUPAL_VERSION

cp -R core vendor $HOME/workspace

cp *.* .[a-z]* $HOME/workspace

echo " DONE "






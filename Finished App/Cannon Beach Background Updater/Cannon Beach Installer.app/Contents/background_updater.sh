#!/bin/bash
# Cannon Beach Background Updater for Mac
# Some features have been commented out for simplicity


#Create working directories if not already there
mkdir ~/Library/Application\ Support/background_updater/
#mkdir ~/Pictures/Desktop\ Photos\ Archive/Daily\ Archive/
mkdir /Users/Shared/Desktop\ Photos/

#Pause
sleep 1s

#Set old image as background to clear cache
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/Shared/Desktop Photos/cannon_beach_old.jpg"'

#CD to Desktop Photos directory
cd ~/Library/Application\ Support/background_updater/

#Download new image with date and 24H timestamp
curl -o cannon_beach.jpg http://wwc.instacam.com/instacamimg/CNHNB/CNHNB_l.jpg

#Pause for download to complete
sleep 2s

#Remove old desktop photo from Shared directory
rm /Users/Shared/Desktop\ Photos/cannon_beach_old.jpg

#Pause for 1 second
sleep 1s

#Copy to Shared folder for scalability
cp -a ~/Library/Application\ Support/background_updater/cannon_beach.jpg /Users/Shared/Desktop\ Photos/cannon_beach.jpg

#Set image as background
osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/Shared/Desktop Photos/cannon_beach.jpg"'

#Pause for image to be set as background
sleep 2s

#Copy image to the archive
#cp -a ~/Library/Application\ Support/background_updater/cannon_beach.jpg ~/Library/Application\ Support/background_updater/cannon_beach_$(date +%m-%d-%Y_%H-%M).jpg

#Remove initial downloaded image
rm cannon_beach.jpg

#Rename background photo for next iteration
mv /Users/Shared/Desktop\ Photos/cannon_beach.jpg /Users/Shared/Desktop\ Photos/cannon_beach_old.jpg

#Move latest image to archive directory
#mv ~/Library/Application\ Support/background_updater/cannon_*.jpg ~/Pictures/Desktop\ Photos\ Archive/Daily\ Archive/

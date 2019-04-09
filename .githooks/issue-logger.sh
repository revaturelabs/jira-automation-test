#!/bin/sh
# Allow for the reading of user input by binding keyboard to stin
exec < /dev/tty
echo "Please Enter the issue key for the feature you are working on (Empty will proceed with no work tracked)"
read ISSUE_KEY

# Trim it down to get the parts we're interested in
TRIMMED=$(echo $ISSUE_KEY | sed -e 's:^\([^-]*-[^-]*\)-.*:\1:' -e \
    'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/')

sed -i.bak -e "1s/^/$TRIMMED/" $1
sed -i '2s/^/# DO NOT REMOVE THE ISSUE KEY FROM ABOVE WRITE THE TITTLE OF YOUR COMMIT AFTER THE ISSUE KEY (SEPERATED BY A SPACE)\n\n/' $1
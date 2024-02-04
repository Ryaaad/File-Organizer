#!/bin/bash

directory_to_monitor="/home/ryad/Desktop"
Rename=false
# Use inotifywait to monitor create and modify events
inotifywait -m -e move --format '%f' "$directory_to_monitor" |
while read -r file_name; do

    if [ -e "$directory_to_monitor/$file_name" ]; then 
      echo "File was named to $file_name"
      Rename=true
     
    else  
     echo "File moved"
     Rename=false
    fi
echo "$Rename"
if [ "$Rename" == true ]; then
echo "Choose Directory you want to move the file to :"
echo "1. Web Projects"
echo "2. Script Projects"
read chosen < /dev/tty
      if [ "$chosen" == "1" ] ; then
      mv "/home/ryad/Desktop/$file_name" "/home/ryad/Desktop/Web Project" && echo "$file_name has been successfully moved to /home/ryad/Desktop/Web Project."
      fi
      if [ "$chosen" == "2" ]; then
      mv "/home/ryad/Desktop/$file_name" "/home/ryad/Desktop/Script Project" && echo "$file_name has been successfully moved to /home/ryad/Desktop/Script Project."
      fi
Rename=false
fi
done

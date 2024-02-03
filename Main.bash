#!/bin/bash

directory_to_monitor="/home/ryad/Desktop"
Rename=false
# Use inotifywait to monitor create and modify events
inotifywait -m -e move --format '%f' "$directory_to_monitor" |
while read -r file_name; do
    # Print a message for create or modify events
    echo "File was created or modified: $file_name"

    if [ -e "$directory_to_monitor/$file_name" ]; then 
      echo "File was named to $file_name"
      Rename=true
     
    else  
     echo "File moved"
     Rename=false
    fi
echo "$Rename"
if [ "$Rename" == true ]; then
 echo "Where Do you want to move it ? "
      echo " A "
      echo " B "
      read path </dev/tty 
      echo $path
      if [ "$path" == 'A' ] || [ "$path" == 'a' ]; then
      mv "/home/ryad/Desktop/$file_name" /home/ryad/Desktop/A
      fi
      if [ "$path" == 'B' ] || [ "$path" == 'b' ]; then
      mv "/home/ryad/Desktop/$file_name" /home/ryad/Desktop/B
      fi
Rename=false

fi
done

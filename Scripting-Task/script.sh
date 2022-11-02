#!/bin/bash
clear
echo "Start processing the file line by line"
echo "--------------------------------------"

cat file.txt | while read line
do
        # Check if the user has a valid complete data (username - email - ID)
        if [ "$(echo $line | awk '{print NF}')" == "3" ];
        then

                # Check if the user has valid fqdn
                if [ "$(echo $line |awk '{ print $2 }' | grep @)" ];
                then

                        # Check if the user has even ID number or odd ID number
                        if [ "$(( $(echo $line | awk '{print $3}') % 2 ))" == "0" ];
                        then
                                echo "The ID ( $(echo $line | awk '{ print $3 }') ) of the user ($(echo $line | awk '{ print $2 }')) is even number"
                        else
                                echo "The ID ( $(echo $line | awk '{ print $3 }') ) of the user ($(echo $line | awk '{ print $2 }')) is odd number"
                        fi

                fi
        fi
done

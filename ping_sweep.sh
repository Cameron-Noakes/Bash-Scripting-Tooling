#!/bin/bash

# A conditional if statement for if they leave out an IP
# print error message through echo.

if [ "$1" == ""]
then
echo "You forgot to include an IP address!"
echo "./ping_sweep.sh [IP]"

else
# A looping for statement to loop through
# all hosts 1-254 hosts (255 - 1 = 254)
# Ping all hosts once (-c 1) with $1 (1st argument) &
# .$ip (insert each iteration)
# for 64 bytes, split on spaces and 4th word (the IP only)
# the & sign is to run multiple instances of the for loop
# at once, making it much faster than adding a ;.

for ip in `seq 1 254`; do
ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done
fi # Finishes the if statement

# run in terminal with argument: ./ping_sweep.sh [IP Subnet]


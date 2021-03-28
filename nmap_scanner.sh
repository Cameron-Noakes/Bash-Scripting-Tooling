
#!/bin/bash

# A conditional if statement to make sure an IP
# is supplied.
if [ "$1" == ""]
then
echo "need to supply an IP address to nmap."

# if an IP is supplied then iterate through nmap scans for each IP.
# The for loop iterates through all the IP sin a network (255 - 1 for NIC = 254)
# $1 is the first argument which will be the IP and $ip is replaced
# with the actual ending IP address 1,2,3 etc...
else
for ip in `seq 1 254`; do
nmap $1.$ip ; #dont run with & instead of ; as it iterates too fast and crashes.

done
fi

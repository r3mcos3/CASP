#!/bin/bash

# Auto SSH-Keygen
# My try to make a usefull bash script,
# To Generate SSH key and place it on a host machine.

# Set a name for SSH file.

read -p "Set file name, default is 'id_rsa': " filename

# Set the destination user

read -p "type the name off the destination user: " dest_user

# Set the destination ip.

read -p "Now type the IP address off the destination: " dest_ip

# Check if there is a file name.

if [ -z "$filename" ]
then
    echo "You have not set a file name!"
    echo "Exiting!!!"
exit
else

echo "You're file name is: $filename"

fi

# Check if there is a destination user.
if [ -z "$dest_user" ]
then
    echo "You don't have set a username... Exiting!!!"
exit
else
    echo "Destination user is set $dest_user"
fi

# Check if destination ip is set.
if [ -z "dest_ip" ]
then
    echo "No ip is set... Exiting!!!"
exit
else
    echo "IP is set $dest_ip"
fi

# EXECUTION

#Create SSH keys.
ssh-keygen -t rsa -f /$USER/.ssh/$filename -N ""

#Put SSH keys in place.
cat /$USER/.ssh/$filename.pub | ssh $dest_user@$dest_ip "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys"

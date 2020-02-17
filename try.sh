#!/bin/bash

# Auto SSH-Keygen
# My try to make a usefull bash script,
# To Generate SSH key and place it on a host machine.
echo
echo Auto SSH-Keygen
echo My try to make a usefull bash script,
echo To generate SSH key and place it on a host machine.
echo

# Set a name for SSH file.

read -p "Set file name, default is 'id_rsa': " filename

# Check if there is a file name.

if [ -z "$filename" ]
then
    echo "You have not set a file name!"
    echo "Exiting!!!"
exit
else

echo "You're file name is: $filename"

fi

# EXECUTION

ssh-keygen -f /$USER/.ssh/$filename -N ""


# Succesfull Created SSH keys
echo
echo "Now we have created SSH keys,"
echo "Lets put them in the right place!"
echo "But first i need the destination user & ip address"
echo

read -p "type the name off the destination user: " dest_user

if [ -z "$dest_user" ]
then
    echo "You don't have set a username... Exiting!!!"
exit
else
    echo "Destination user is set $dest_user"
fi

read -p "Now type the IP address off the destination: " dest_ip

if [ -z "dest_ip" ]
then
    echo "No ip is set... Exiting!!!"
exit
else
    echo "IP is set $dest_ip"
fi


cat /$USER/.ssh/$filename.pub | ssh $dest_user@$dest_ip "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys"

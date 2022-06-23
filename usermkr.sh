s#!/bin/bash

# Navigate to the current user's home directory, generate a new directory
# called sbox2, and navigate to sbox2

cd; mkdir sbox2; cd sbox2

# Download a raw dictionary from repository server.

wget raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Keyboard-Combinations.txt

# Randomize dictionary, append 100 lines from now randomized dictionary to new file words.txt

shuf Keyboard-Combinations.txt | head -n 100 > words.txt

# Remove initial dictionary

rm Keyboard-Combinations.txt

# variable x is given integer value 0
x=0

# while loop using variable x

while [ $x -le 4 ]
do

# randomly select a string from words.txt

	passwordselect=$(shuf words.txt | head -n 1)

# add a user numbered after x

	useradd -m bot$x

# change the new users password to the random string

	echo bot$x:$passwordselect | chpasswd

# Print to terminal that the new user has been created. State the assigned password.

	echo "User:" bot$x "has been added to the network. Temp password is:" $passwordselect

# Increase the variable x by one

	x=$(($x+1))
done

# move back to current user home directory, navigate to sbox2, and copy the shadow file to
# sbox2 now that it has been updated w/ the users.
cd; cd sbox2; cp /etc/shadow shadow

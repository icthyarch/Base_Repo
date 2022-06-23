#!/bin/bash

# Remove the new folder and it's contents.

cd; rm -dr sbox2

# We add usrrmvr here 

# Remove batches of users 0-4.
x=0

while [ $x -le 4 ]
do
	deluser bot$x
	x=$(($x+1))
done

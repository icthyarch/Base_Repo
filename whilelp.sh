#!/bin/bash

# This is a while loop. It will run the code inside of the structure as long as a condition is
# met - hence While. This can be preformed with a true/false statement, or a variable counter.
# Both have their uses - this uses a variable counter.

x=1

while [ $x -le 5 ]
do
	echo $x
	x=$(($x+1))
done

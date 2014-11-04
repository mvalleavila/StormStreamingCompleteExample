#!/bin/bash

#FWPATH="`dirname \"$0\"`"
#FWPATH="`( cd \"$FWPATH\" && pwd )`"

startTime=`date +%s`
counter=0

if [ "$#" -lt 4 ]
then
   echo "Arguments less than 4"
   exit 1
fi

rm $2*

while true 
do
	sleep $3
	currentTime=`date +%s`
	elapsedTime=`expr $currentTime - $startTime`
	if [ $elapsedTime -ge $4 ]
	then
	  counter=`expr $counter + 1`
	  for (( i=$counter; i>0; i-- ))
	  do
	    mv $2.`expr $i - 1` $2.$i
	  done
	  mv $2 $2.0
	  startTime=`date +%s`
	fi
	cat $1 >> $2
done

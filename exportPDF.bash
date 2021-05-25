#!/bin/bash

# -- controlli di sicurezza
ARGC=$#

if [ $ARGC -ne 2 ]; then
	echo "Parametri aspettati 2, Ricevuti " $ARGC
	exit
fi


DIRINPUT=$1
DIROUTPUT=$2

if [[ -f $DIRINPUT ]]; then
	echo "Sono permesse solo cartelle"
	exit
fi

if [[ -f $DIROUTPUT ]]; then
	echo "Sono permesse solo cartelle"
	exit
fi

# -- controlli end


for file in $DIRINPUT*.xopp
do

basename=$(basename -- "$file")
filename="${basename%.*}"

xournalpp -p $DIROUTPUT$filename".pdf" $DIRINPUT$basename

done

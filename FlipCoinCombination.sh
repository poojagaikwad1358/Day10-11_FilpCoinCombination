#!/bin/bash -x
echo "Welcome To Flip Coin Combination Problem"

#UseCase1- As a Simulator start with Flipping a Coin to Display Heads or Tails
isHead=0;
randomCheck=$(( RANDOM%2 ))

if [[ isHead -eq randomCheck ]]
then
	echo "Head"
else
	echo "Tail"
fi

#UseCase2- As a simulator, loop through Multiple times of flipping a
           #coin store the Singlet Combination in a Dictionary.
           #Finally determine the percentage of the Singlet Combination.

echo "Enter Number: "
read n
tails=0;
heads=0;

declare -A SingletDict
for ((i=0;i<$n;i++))
do
	if [[ $((RANDOM%2)) -eq 1 ]]
	then
		tails=`expr $tails + 1`
	else
		heads=`expr $heads + 1`
	fi
done
headper=$((100*$heads/$n))
echo "Head Percentage ="$headper"%"
tailper=$((100*$tails/$n))
echo "Tail Percentage ="$tailper"%"

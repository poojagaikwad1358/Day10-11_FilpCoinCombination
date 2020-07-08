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

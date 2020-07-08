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

#UseCase3- As a simulator, loop to create a Doublet Combination.
           #Store the doublet combination as well as the percentage.

read -p "Enter number : " number

i=1
countHH=0
countHT=0
countTH=0
countTT=0

declare -A Doublet
while [ $i -ne $number ]
do
	randomCheck=$(( (RANDOM%4)+1 ))
	if [ $randomCheck -eq 1 ]
	then
		Doublet[$i]="HH"
		((countHH++))

	elif [ $randomCheck -eq 2 ]
	then
		Doublet[$i]="HT"
		((countHT++))
	elif [ $randomCheck -eq 3 ]
	then
		Doublet[$i]="TH"
		((countTH++))
	else [ $randomCheck -eq 4 ]

		Doublet[$i]="TT"
		((countTT++))
	fi
	((i++))
done
echo ${Doublet[*]}
dupletHHPer=`echo $countHH $number | awk -F" " '{ a=$1; b=$2; result1=(a/b*100); print result1 }'`
dupletTTPer=`echo $countTT $number | awk -F" " '{ a=$1; b=$2; result2=(a/b*100); print result2 }'`
dupletTHPer=`echo $countTH $number | awk -F" " '{ a=$1; b=$2; result3=(a/b*100); print result3 }'`
dupletHTPer=`echo $countHT $number | awk -F" " '{ a=$1; b=$2; result4=(a/b*100); print result4 }'`

echo Percentage of HH : $dupletHHPer%
echo Percentage of TT : $dupletTTPer%
echo Percentage of TH : $dupletTHPer%
echo Percentage of HT : $dupletHTPer%

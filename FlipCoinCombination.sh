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

#UseCase4- As a simulator,do the same for triplet combination.

read -p "Enter number : " number
echo case4
i=1
countHHH=0
countHHT=0
countHTH=0
countTHH=0
countTTT=0
countTTH=0
countTHT=0
countHTT=0

declare -A Triplet
while [ $i -ne $number ]
do
        randomCheck=$(( (RANDOM%8)+1 ))
        if [ $randomCheck -eq 1 ]
        then
                Triplet[$i]="HHH"
                ((countHHH++))

        elif [ $randomCheck -eq 2 ]
        then
                Triplet[$i]="HHT"
                ((countHHT++))
        elif [ $randomCheck -eq 3 ]
        then
                Triplet[$i]="HTH"
                ((countHTH++))
        elif [ $randomCheck -eq 4 ]
	then
                Triplet[$i]="THH"
                ((countTHH++))
	elif [ $randomCheck -eq 5 ]
        then
                Triplet[$i]="TTT"
                ((countTTT++))
	elif [ $randomCheck -eq 6 ]
        then
                Triplet[$i]="TTH"
                ((countTTH++))
	elif [ $randomCheck -eq 7 ]
        then
                Triplet[$i]="THT"
                ((countTHT++))
	else [ $randomCheck -eq 8 ]
                Triplet[$i]="HTT"
                ((countHTT++))
        fi
        ((i++))
done
echo ${Triplet[*]}

tripletHHHPer=`echo $countHHH $number | awk -F" " '{ a=$1; b=$2; result1=(a/b*100); print result1 }'`
tripletHHTPer=`echo $countHHT $number | awk -F" " '{ a=$1; b=$2; result2=(a/b*100); print result2 }'`
tripletHTHPer=`echo $countHTH $number | awk -F" " '{ a=$1; b=$2; result3=(a/b*100); print result3 }'`
tripletTHHPer=`echo $countTHH $number | awk -F" " '{ a=$1; b=$2; result4=(a/b*100); print result4 }'`
tripletTTTPer=`echo $countTTT $number | awk -F" " '{ a=$1; b=$2; result5=(a/b*100); print result5 }'`
tripletTTHPer=`echo $countTTH $number | awk -F" " '{ a=$1; b=$2; result6=(a/b*100); print result6 }'`
tripletTHTPer=`echo $countTHT $number | awk -F" " '{ a=$1; b=$2; result7=(a/b*100); print result7 }'`
tripletHTTPer=`echo $countHTT $number | awk -F" " '{ a=$1; b=$2; result4=(a/b*100); print result8 }'`

echo Percentage of HHH : $tripletHHHPer%
echo Percentage of HHT : $tripletHHTPer%
echo Percentage of HTH : $tripletHTHPer%
echo Percentage of THH : $tripletTHHPer%
echo Percentage of TTT : $tripletTTTPer%
echo Percentage of TTH : $tripletTTHPer%
echo Percentage of THT : $tripletTHTPer%
echo Percentage of HTT : $tripletHTTPer%

#UseCase5 - As a simulator, sort the Singlet, Doublet and
	    #Triplet combination and show the winning combination.

echo Doublet Sorting
arrayDoublet=($(for value in ${Doublet[@]}
do
    echo Values: $value
done | sort ))
max=${arrayDoublet[3]}

for key in ${!Doublet[@]}
do
    if [[ $max -eq ${Doublet[$key]} ]]
    then
    echo "win combo $key"
    fi
done

echo Triplet Sorting
arrayTriplet=($(for value in ${Triplet[@]}
do
    echo Values: $value
done | sort ))
max=${arrayTriplet[7]}

for key in ${!Triplet[@]}
do
    if [[ $max -eq ${Triplet[$key]} ]]
    then
    echo "win combo $key"
    fi
done

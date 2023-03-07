#! /bin/bash/

function Year_Type(){
	
	local year=$1
	local result=" "
	
	if [[ $year -lt 1582 ]]
	then
		result="Invalid Input"
		
	elif [[ $year%4 -ne 0 ]]
	then
		result="Common Year"
	
	elif [[ $year%100 -ne 0 ]]
	then
		result="Leap Year"
	
	elif [[ $year%400 -ne 0 ]]
	then
		result="Common Year"
	
	else
		result="Leap Year"
	fi
	
	echo $result
	
}

a="$(Year_Type $*)"
echo $a

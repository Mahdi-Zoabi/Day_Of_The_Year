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

function Days_In_Month(){

	local result=0
	local year=$1
	local month=$2
	local yearType="$(Year_Type $year)"
	
	if [[ $month -lt 1 || $month -gt 12 || $yearType == "Invalid Input" ]]
	then
		result="Invalid Input"
	
	elif [[ $month -eq 4 || $month -eq 6 || $month -eq 9 || $month -eq 11 ]]
	then
		result=30
	
	elif [[ $month -eq 2 ]]
	then
		if [[ $yearType == "Common Year" ]]
		then
			result=28
		else
			result=29
		fi
	
	else
		result=31
	fi
	
	echo $result
}

Days_In_Month $*

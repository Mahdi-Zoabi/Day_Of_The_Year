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

#Days_In_Month $*

function Days_Until_Month(){

	local result=0
	local year=$1
	local month=$2
	local check="$(Days_In_Month $year $month)"
	
	if [[ $check == "Invalid Input" ]]
	then
		result="Invalid Input"
	else	
		for (( i=1; i<$month ; i++ ))
		do
			local tmp_result="$(Days_In_Month $year $i)"
			let result=$result+$tmp_result
		done
	fi
	
	echo $result
}

function Day_Of_The_Year(){

	local result=0
	local year=$1
	local month=$2
	local day=$3
	local check="$(Days_Until_Month $year $month)"
	local checkDays="$(Days_In_Month $year $month)"
	
	if [[ $day -gt 31 || $day -lt 1 || $check == "Invalid Input" || $day -gt $checkDays ]]
	then
		result="Invalid Input"
	else
		local tmp_result="$(Days_Until_Month $year $month)"
		let result=$tmp_result+$day
	fi
	
	echo $result
}


function main(){

	local result=0
	local year=$1
	local month=$2
	local day=$3
	
	if [[ $# -eq 1 ]]
	then
		result="$(Year_Type $year)"
	elif [[ $# -eq 2 ]]
	then
		result="$(Days_In_Month $year $month)"
	elif [[ $# -eq 3 ]]
	then
		result="$(Day_Of_The_Year $year $month $day)"
	else
		result="Invalid Input"
	fi
	
	echo $result
}

main $*




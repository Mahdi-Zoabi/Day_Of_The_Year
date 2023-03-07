#! bin/bash/

add () {
	let sum=$1+$2
	echo $sum
}

subtract () {
	let sum=$1-$2
	echo $sum
}

multiply () {
	let sum=$1*$2
	echo $sum
}

divide () {
	let sum=$1/$2
	echo $sum
}

power-of () {
	let sum=$1**$2
	echo $sum
}

modulos () {
	let sum=$1%$2
	echo $sum
}

odd-even () {
	let even=$1%2
	if [[ $even -eq 0 ]]
	then
		echo "the answer is even"
	else
		echo "the answer is odd"
	fi
}

is_div_by_five () {
	let even=$1%5
	if [[ $even -eq 0 ]]
	then
		echo "the answer is divided by five"
	else
		echo "the answer isn't divided by five"
	fi
}

is_prime () {
	flag=1
	let num=$1
	for ((i=2; flag && i<=num/2; i++))
	do
	if [ $((num%i)) -eq 0 ]
	then
		echo "the answer is not a prime number."
		flag=0
	fi
	done
	if [[ flag -eq 1 ]]
	then
		echo "the answer is a prime number."‏
	fi
}

is_valid () {
	num1=$1
	num2=$2
	num3=$3
	if [[ ! $num1 =~ ^[0-9]+$ || ! $num2 =~ ^[0-9]+$ || ! $num3 == "" ]]
	then
		echo "not valid"
	else
		echo "valid"
	fi
}

main () {


select options in add subtract multiply divide power-of modulos Exit
do
case $options in
	add)
		echo "add"
		read -p "enter two numbers  " num1 num2 num3
		check="$(is_valid $num1 $num2 $num3)"
		if [[ $check == "not valid" ]]
		then
			echo "not valid"
		else 
		result="$(add $num1 $num2)"
		echo "return value $result"
		resultprime="$(is_prime $result)"
		echo "$resultprime"
		resulteven="$(odd-even $result)"
		echo "$resulteven"
		resultfive="$(is_div_by_five $result)"
		echo "$resultfive"
		fi
	;;
	subtract)
		echo "subtract"
		read -p "enter two numbers  " num1 num2 num3
		check="$(is_valid $num1 $num2 $num3)"
		if [[ $check == "not valid" ]]
		then
			echo "not valid"
		else 
		result="$(subtract $num1 $num2)"
		echo "return value $result"
		resultprime="$(is_prime $result)"
		echo "$resultprime"
		resulteven="$(odd-even $result)"
		echo "$resulteven"
		resultfive="$(is_div_by_five $result)"
		echo "$resultfive"
		fi
	;;
	multiply)
		echo "multiply"
		read -p "enter two numbers  " num1 num2 num3
		check="$(is_valid $num1 $num2 $num3)"
		if [[ $check == "not valid" ]]
		then
			echo "not valid"
		else 
		result="$(multiply $num1 $num2)"
		echo "return value $result"
		resultprime="$(is_prime $result)"
		echo "$resultprime"
		resulteven="$(odd-even $result)"
		echo "$resulteven"
		resultfive="$(is_div_by_five $result)"
		echo "$resultfive"
		fi
	;;
	divide)
		echo "divide"
		read -p "enter two numbers  " num1 num2 num3
		check="$(is_valid $num1 $num2 $num3)"
		if [[ $check == "not valid" ]]
		then
			echo "not valid"
		else 
		result="$(divide $num1 $num2)"
		echo "return value $result"
		resultprime="$(is_prime $result)"
		echo "$resultprime"
		resulteven="$(odd-even $result)"
		echo "$resulteven"
		resultfive="$(is_div_by_five $result)"
		echo "$resultfive"
		fi
	;;
	power-of)
		echo "power of"
		read -p "enter two numbers  " num1 num2 num3
		check="$(is_valid $num1 $num2 $num3)"
		if [[ $check == "not valid" ]]
		then
			echo "not valid"
		else 
		result="$(power-of $num1 $num2)"
		echo "return value $result"
		resultprime="$(is_prime $result)"
		echo "$resultprime"
		resulteven="$(odd-even $result)"
		echo "$resulteven"
		resultfive="$(is_div_by_five $result)"
		echo "$resultfive"
		fi
	;;
	modulos)
		echo "modulos"
		read -p "enter two numbers  " num1 num2 num3
		check="$(is_valid $num1 $num2 $num3)"
		if [[ $check == "not valid" ]]
		then
			echo "not valid"
		else 
		result="$(modulos $num1 $num2)"
		echo "return value $result"
		resultprime="$(is_prime $result)"
		echo "$resultprime"
		resulteven="$(odd-even $result)"
		echo "$resulteven"
		resultfive="$(is_div_by_five $result)"
		echo "$resultfive"
		fi
	;;
	Exit)
		echo "exit"
		exit
	;;
	*)
		echo "try again"
	;;
esac
done
}

main
#is_valid $*

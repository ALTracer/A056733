#!/bin/dash

count=0; iter=0;
LOW=0; HIGH=999;

message2(){
	printf "%3d^3 + " "$1"
	printf "%3d^3 + " "$2"
	printf "%3d^3 = " "$3"
	printf "%9d\n" "$4"
}

message3(){
	echo
	echo "Exiting at a=$a, b=$b, c=$c"
	echo "Found $count triplets in $iter iterations."
	exit
}
trap message3 INT TERM

main(){
	for a in $(seq $LOW $HIGH); do
		for b in $(seq $LOW $HIGH); do
			for c in $(seq $LOW $HIGH); do
				s=$((a*a*a + b*b*b + c*c*c))
#				s=$(bc <<< "$a^3+$b^3+$c^3")
				n=$((1000000*a + 1000*b + c))
#				n=$(bc <<< "$a*1000000 + $b*1000 + $c")
				if [ "$s" -eq "$n" ]; then
					message2 "$a" "$b" "$c" "$n"
					count=$((count+1))
				fi
				iter=$((iter+1))
				[ "$s" -gt 1000000000 ] && break
			done
		done
	done
#	message3 $count $iter
}

main

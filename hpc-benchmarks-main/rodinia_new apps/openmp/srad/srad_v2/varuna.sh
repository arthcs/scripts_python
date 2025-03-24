#!/bin/bash

export GOMP_CPU_AFFINITY=0,2,4,6,8,10,1,3,5,7,9,11,12,14,16,18,20,22,13,15,17,19,21,23
unset OMP_NUM_THREADS
unset OMP_GERAS
unset OMP_DYNAMIC

baseline_temp=45
echo "baseline temp: $baseline_temp"
sensors | grep "Package id 0" > aux.txt
cat aux.txt | awk '{print $4}' > aux2.txt
sed -i 's/+//g' aux2.txt
sed -i 's/°C//g' aux2.txt
sed -i 's/.0//g' aux2.txt
curr_temp=$(cat aux2.txt)
echo "curr_temp: $curr_temp"
if [ ! $curr_temp ]; then
    curr_temp=100
    echo "curr_temp: $curr_temp"
fi
while [ $curr_temp -gt $baseline_temp ]
do
    sleep 10s
    sensors | grep "Package id 0" > aux.txt
    cat aux.txt | awk '{print $4}' > aux2.txt
    sed -i 's/+//g' aux2.txt
    sed -i 's/.0//g' aux2.txt
    sed -i 's/°C//g' aux2.txt
    curr_temp=$(cat aux2.txt)
    echo "curr_temp: $curr_temp"
    if [ ! $curr_temp ]; then
    	curr_temp=100
    	echo "curr_temp: $curr_temp"
    fi
done


for iter in 2
do
	unset OMP_GERAS
	export OMP_NUM_THREADS=1566
	../../../../utils/count_freq.sh >> out/freq.$iter.varuna.txt &	
	../../../../utils/count_temp.sh >> out/temp.$iter.varuna.txt &	

	./srad 4096 4096 0 127 0 127 2 0.5 400 > out/varuna.txt

	id_freq=$(pgrep -f count_freq.sh)
	id_temp=$(pgrep -f count_temp.sh)

	kill $id_freq
	kill $id_temp

	sensors | grep "Package id 0" > aux.txt
        cat aux.txt | awk '{print $4}' > aux2.txt
	sed -i 's/+//g' aux2.txt
	sed -i 's/°C//g' aux2.txt
	sed -i 's/.0//g' aux2.txt
	curr_temp=$(cat aux2.txt)
	echo "curr_temp: $curr_temp"
	if [ ! $curr_temp ]; then
	     curr_temp=100
	     echo "curr_temp: $curr_temp"
	fi
	while [ $curr_temp -gt $baseline_temp ]
	do
	      sleep 10s
	      sensors | grep "Package id 0" > aux.txt
	      cat aux.txt | awk '{print $4}' > aux2.txt
	      sed -i 's/+//g' aux2.txt
	      sed -i 's/.0//g' aux2.txt
	      sed -i 's/°C//g' aux2.txt
	      curr_temp=$(cat aux2.txt)
	      echo "curr_temp: $curr_temp"
	      if [ ! $curr_temp ]; then
	           curr_temp=100
	           echo "curr_temp: $curr_temp"
	      fi
	done
done



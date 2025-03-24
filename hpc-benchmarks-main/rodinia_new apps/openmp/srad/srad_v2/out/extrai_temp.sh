#!/bin/bash


for nt in 1566 # 2 4 6 8 10 12 24 # aging energy edp performance regular dynamic varuna
do
#	cat freq.$1.$nt.txt | awk '{print $4}' > freq.txt
	cat temp.$nt.txt | awk '{print $3}' > temp.txt
	sed -i 's/+//g' temp.txt
        sed -i 's/°C//g' temp.txt
	./temp temp.txt

done

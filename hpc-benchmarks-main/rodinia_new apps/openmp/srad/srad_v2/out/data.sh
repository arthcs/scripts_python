#!/bin/bash


for nt in 2 4 6 8 10 12 24 # aging energy edp performance regular dynamic varuna
do
	egrep "Execution Time" $nt.txt | awk '{print $5}'
done

for nt in 2 4 6 8 10 12 24 # aging energy edp performance regular dynamic varuna
do
	egrep "Energy" $nt.txt | awk '{print $4}'
done

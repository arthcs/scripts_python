#!/bin/bash

export OMP_PROC_BIND=close
export OMP_PLACES=cores

./parboil clean bfs
./parboil compile bfs omp_base
./parboil clean lbm
./parboil compile lbm omp_cpu

for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
	echo "Running with $nt threads"
	export OMP_NUM_THREADS=$nt
	for iter in 1 2 3
	do
		echo "Running bfs with $nt threads"
		./parboil run bfs omp_base SF >> out/bfs.$nt.txt
		echo "Running lbm with $nt threads"
		./parboil run lbm omp_cpu long >> out/lbm.$nt.txt
	done
done

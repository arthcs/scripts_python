#!/bin/bash

export OMP_PROC_BIND=close
export OMP_PLACES=cores

python2 parboil clean bfs
python2 parboil compile bfs omp_base
python2 parboil clean lbm
python2 parboil compile lbm omp_cpu

for nt in 80 84 88
do
	echo "Running with $nt threads"
	export OMP_NUM_THREADS=$nt
	for iter in 1 2 3
	do
		echo "Running bfs with $nt threads"
		python2 parboil run bfs omp_base SF >> out/bfs.$nt.txt

		echo "Running histo with $nt threads"
		python2 parboil run histo omp_cpu long >> out/histo.$nt.txt

		echo "Running lbm with $nt threads"
		python2 parboil run lbm omp_cpu long >> out/lbm.$nt.txt

		echo "Running mrio with $nt threads"
		python2 parboil run mrio omp_cpu long >> out/mrio.$nt.txt

		echo "Running cutcp with $nt threads"
		python2 parboil run cutcp omp_cpu long >> out/cutcp.$nt.txt
	done
done

# BFS
# HISTO
# LBM
# MRIQ
# CUTCP

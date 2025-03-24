#!/bin/bash

export OMP_PROC_BIND=spread
export OMP_PLACES=cores
export LD_LIBRARY_PATH=/scratch/aflorenzon/IPDPS/cloud/gcc/build/lib64:$LD_LIBRARY_PATH


for threads in 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88
do
    export OMP_NUM_THREADS=$threads
    for uncore in 1.2 1.6 2.0 2.4 2.8
    do
         likwid-setFrequencies --umin $uncore --umax $uncore

        for governor in performance powersave ondemand
        do
		likwid-setFrequencies -g $governor
#    		for core in 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39
#                do
#                        echo "$governor" > /sys/devices/system/cpu/cpu$core/cpufreq/scaling_governor
#                done
                        vtune -collect hpc-performance ./kmeans_openmp/kmeans -n $threads -i ../../data/kmeans/kdd_cup >> resultados/$governor.$cpufreq.$threads.$uncore.txt
        done
    done
done

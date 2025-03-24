#!/bin/bash

bench=$1

for threads in 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88
do
        for governor in powersave ondemand performance
        do
                for uncore in 1.2 1.6 2.0 2.4 2.8
                do
#			 egrep "FIB - Execution Time" $governor..$threads.$uncore.txt | awk {'print $5'}
#                        egrep "FIB - Energy" $governor..$threads.$uncore.txt | awk {'print $4'}
#                       egrep "CPI Rate:" $governor..$threads.$uncore.txt | awk {'print $3}'
#                        egrep "Effective Logical Core" $governor..$threads.$uncore.txt | awk {'print $5}' | sed 's/%//'
#                        egrep "Memory Bound:" $governor..$threads.$uncore.txt | awk {'print $3}' | sed 's/%//'
#                        egrep "Cache Bound:" $governor..$threads.$uncore.txt | awk {'print $3}' | sed 's/%//'
                    #echo $governor.$threads.$uncore
                        egrep "NUMA:" $governor..$threads.$uncore.txt | awk {'print $6}' | sed 's/%//'
#                        egrep "DRAM Bandwidth Bound:" $governor..$threads.$uncore.txt | awk {'print $4}' | sed 's/%//'
                     #   egrep "FP Arith/Mem Rd Instr. Ratio" $governor..$threads.$uncore.$bench.txt | awk {'print $6}'
                     #   egrep "FP Arith/Mem Wr Instr. Ratio" $governor..$threads.$uncore.$bench.txt | awk {'print $6}'
                     #   egrep "Vectorization:" $governor..$threads.$uncore.$bench.txt | awk {'print $2}' | sed 's/%//'
#                        egrep "Elapsed Time:" $governor..$threads.$uncore.$bench.txt | awk {'print $3}' | sed 's/s//'
                     # egrep "DP GFLOPS:" $governor..$threads.$uncore.$bench.txt | awk {'print $3}' | sed 's/s//'
                done
        done
done

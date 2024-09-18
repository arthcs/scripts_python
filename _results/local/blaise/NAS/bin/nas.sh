#!/bin/bash

export OMP_PROC_BIND=close
export OMP_PLACES=cores

num_threads=$1
array_id=$2

for bench in bt.C.x cg.C.x ft.C.x mg.C.x sp.C.x ua.C.x
do

    echo "Running $bench"
    mkdir -p out_"$bench"
    ./script.sh "$num_threads" "$bench" >> out_$bench/log_bruto_$array_id.txt
#    ./$bench >> out/$bench.$nt.txt

done

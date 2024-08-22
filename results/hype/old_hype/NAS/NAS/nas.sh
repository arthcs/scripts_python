#!/bin/bash

export OMP_PROC_BIND=close
export OMP_PLACES=cores

for bench in bt.C.x cg.C.x ft.C.x mg.C.x sp.C.x ua.C.x
do

    echo "Running $bench"
    mkdir out_"$bench"
    ./script.sh  "$bench" >> out_"$bench"/log_bruto.txt
#    ./$bench >> out/$bench.$nt.txt

done
#!/bin/bash

export OMP_PROC_BIND=close
export OMP_PLACES=cores

for bench in bt.C.x cg.C.x ft.C.x mg.C.x sp.C.x ua.C.x
do

    echo "Running log_script.py"
    cd out_"$bench"
    python3 log_script.py
    cd ..

done

#!/bin/bash

var_date=$(date +'%Y-%m-%d_%H-%M-%S')
node=$1

if [[ "$node" = "phoenix" || "$node" = "all" ]];
then
    #phoenix
    echo ________
    echo get results PHOENIX
    mkdir -p phoenix
    mkdir -p phoenix/phoenix_$var_date
    mkdir -p phoenix/phoenix_$var_date/FFT
    mkdir -p phoenix/phoenix_$var_date/HPCG
    mkdir -p phoenix/phoenix_$var_date/JA
    mkdir -p phoenix/phoenix_$var_date/LULESH
    mkdir -p phoenix/phoenix_$var_date/PO
    mkdir -p phoenix/phoenix_$var_date/ST
    mkdir -p phoenix/phoenix_$var_date/NAS

    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/FFT/log_*.txt /home/gppd/arthur/scripts/_results/phoenix/phoenix_$var_date/FFT/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/HPCG/log_*.txt /home/gppd//arthur/scripts/_results/phoenix/phoenix_$var_date/HPCG/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/JA/log_*.txt /home/gppd//arthur/scripts/_results/phoenix/phoenix_$var_date/JA/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/LULESH/log_*.txt /home/gppd//arthur/scripts/_results/phoenix/phoenix_$var_date/LULESH/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/PO/log_*.txt /home/gppd//arthur/scripts/_results/phoenix/phoenix_$var_date/PO/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/ST/log_*.txt /home/gppd//arthur/scripts/_results/phoenix/phoenix_$var_date/ST/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/NAS/bin/out_* /home/gppd//arthur/scripts/_results/phoenix/phoenix_$var_date/NAS/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/phoenix_* /home/gppd//arthur/scripts/_results/phoenix/phoenix_$var_date/
fi

if [[ "$node" = "tupi" || "$node" = "all" ]];
then
    #Tupi
    echo ________
    echo get results TUPI
    mkdir -p tupi
    mkdir -p tupi/tupi_$var_date
    mkdir -p tupi/tupi_$var_date/FFT
    mkdir -p tupi/tupi_$var_date/HPCG
    mkdir -p tupi/tupi_$var_date/JA
    mkdir -p tupi/tupi_$var_date/LULESH
    mkdir -p tupi/tupi_$var_date/PO
    mkdir -p tupi/tupi_$var_date/ST
    mkdir -p tupi/tupi_$var_date/NAS

    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/FFT/log_*.txt /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/FFT/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/HPCG/log_*.txt /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/HPCG/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/JA/log_*.txt /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/JA/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/LULESH/log_*.txt /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/LULESH/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/PO/log_*.txt /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/PO/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/ST/log_*.txt /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/ST/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/NAS/bin/out_* /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/NAS/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/tupi* /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/
fi


if [[ "$node" = "blaise" || "$node" = "all" ]];
then
    # #blaise
    echo ________
    echo get results BLAISE
    mkdir -p blaise
    mkdir -p blaise/blaise_$var_date
    mkdir -p blaise/blaise_$var_date/FFT
    mkdir -p blaise/blaise_$var_date/HPCG
    mkdir -p blaise/blaise_$var_date/JA
    mkdir -p blaise/blaise_$var_date/LULESH
    mkdir -p blaise/blaise_$var_date/PO
    mkdir -p blaise/blaise_$var_date/ST
    mkdir -p blaise/blaise_$var_date/NAS

    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/FFT/log_*.txt /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/FFT/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/HPCG/log_*.txt /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/HPCG/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/JA/log_*.txt /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/JA/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/LULESH/log_*.txt /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/LULESH/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/PO/log_*.txt /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/PO/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/ST/log_*.txt /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/ST/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/NAS/bin/out_* /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/NAS/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/blaise* /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/
fi


if [[ "$node" = "hype" || "$node" = "all" ]];
then
    #hype
    echo ________
    echo get results HYPE
    mkdir -p hype
    mkdir -p hype/hype_$var_date
    mkdir -p hype/hype_$var_date/FFT
    mkdir -p hype/hype_$var_date/HPCG
    mkdir -p hype/hype_$var_date/JA
    mkdir -p hype/hype_$var_date/LULESH
    mkdir -p hype/hype_$var_date/PO
    mkdir -p hype/hype_$var_date/ST
    mkdir -p hype/hype_$var_date/NAS

    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/FFT/log_*.txt /home/gppd//arthur/scripts/_results/hype/hype_$var_date/FFT/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/HPCG/log_*.txt /home/gppd//arthur/scripts/_results/hype/hype_$var_date/HPCG/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/JA/log_*.txt /home/gppd//arthur/scripts/_results/hype/hype_$var_date/JA/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/LULESH/log_*.txt /home/gppd//arthur/scripts/_results/hype/hype_$var_date/LULESH/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/PO/log_*.txt /home/gppd//arthur/scripts/_results/hype/hype_$var_date/PO/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/ST/log_*.txt /home/gppd//arthur/scripts/_results/hype/hype_$var_date/ST/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/NAS/bin/out_* /home/gppd//arthur/scripts/_results/hype/hype_$var_date/NAS/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/hype* /home/gppd//arthur/scripts/_results/hype/hype_$var_date/
fi
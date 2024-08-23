#!/bin/bash

var_date=$(date +'%Y-%m-%d_%H-%M-%S')

#phoenix
echo ________
echo get results PHOENIX
mkdir phoenix
mkdir phoenix/phoenix_$var_date
mkdir phoenix/phoenix_$var_date/FFT
mkdir phoenix/phoenix_$var_date/HPCG
mkdir phoenix/phoenix_$var_date/JA
mkdir phoenix/phoenix_$var_date/LULESH
mkdir phoenix/phoenix_$var_date/PO
mkdir phoenix/phoenix_$var_date/ST
mkdir phoenix/phoenix_$var_date/NAS

scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/FFT/log_*.txt /home/gppd/arthur/scripts/_results/phoenix/phoenix_$var_date/FFT/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/HPCG/log_*.txt /home/gppd//arthur/scripts/_results/phoenix/phoenix_$var_date/HPCG/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/JA/log_*.txt /home/gppd//arthur/scripts/_results/phoenix/phoenix_$var_date/JA/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/LULESH/log_*.txt /home/gppd//arthur/scripts/_results/phoenix/phoenix_$var_date/LULESH/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/PO/log_*.txt /home/gppd//arthur/scripts/_results/phoenix/phoenix_$var_date/PO/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/ST/log_*.txt /home/gppd//arthur/scripts/_results/phoenix/phoenix_$var_date/ST/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/NAS/bin/out_* /home/gppd//arthur/scripts/_results/phoenix/phoenix_$var_date/NAS/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/phoenix_* /home/gppd//arthur/scripts/_results/phoenix/phoenix_$var_date/

#Tupi
echo ________
echo get results TUPI
mkdir tupi
mkdir tupi/tupi_$var_date
mkdir tupi/tupi_$var_date/FFT
mkdir tupi/tupi_$var_date/HPCG
mkdir tupi/tupi_$var_date/JA
mkdir tupi/tupi_$var_date/LULESH
mkdir tupi/tupi_$var_date/PO
mkdir tupi/tupi_$var_date/ST
mkdir tupi/tupi_$var_date/NAS

scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/FFT/log_*.txt /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/FFT/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/HPCG/log_*.txt /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/HPCG/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/JA/log_*.txt /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/JA/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/LULESH/log_*.txt /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/LULESH/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/PO/log_*.txt /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/PO/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/ST/log_*.txt /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/ST/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/NAS/bin/out_* /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/NAS/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/tupi* /home/gppd//arthur/scripts/_results/tupi/tupi_$var_date/

# #blaise
echo ________
echo get results BLAISE
mkdir blaise
mkdir blaise/blaise_$var_date
mkdir blaise/blaise_$var_date/FFT
mkdir blaise/blaise_$var_date/HPCG
mkdir blaise/blaise_$var_date/JA
mkdir blaise/blaise_$var_date/LULESH
mkdir blaise/blaise_$var_date/PO
mkdir blaise/blaise_$var_date/ST
mkdir blaise/blaise_$var_date/NAS

scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/FFT/log_*.txt /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/FFT/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/HPCG/log_*.txt /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/HPCG/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/JA/log_*.txt /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/JA/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/LULESH/log_*.txt /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/LULESH/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/PO/log_*.txt /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/PO/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/ST/log_*.txt /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/ST/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/NAS/bin/out_* /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/NAS/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/blaise* /home/gppd//arthur/scripts/_results/blaise/blaise_$var_date/


#hype
echo ________
echo get results HYPE
mkdir hype
mkdir hype/hype_$var_date
mkdir hype/hype_$var_date/FFT
mkdir hype/hype_$var_date/HPCG
mkdir hype/hype_$var_date/JA
mkdir hype/hype_$var_date/LULESH
mkdir hype/hype_$var_date/PO
mkdir hype/hype_$var_date/ST
mkdir hype/hype_$var_date/NAS

scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/FFT/log_*.txt /home/gppd//arthur/scripts/_results/hype/hype_$var_date/FFT/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/HPCG/log_*.txt /home/gppd//arthur/scripts/_results/hype/hype_$var_date/HPCG/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/JA/log_*.txt /home/gppd//arthur/scripts/_results/hype/hype_$var_date/JA/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/LULESH/log_*.txt /home/gppd//arthur/scripts/_results/hype/hype_$var_date/LULESH/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/PO/log_*.txt /home/gppd//arthur/scripts/_results/hype/hype_$var_date/PO/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/ST/log_*.txt /home/gppd//arthur/scripts/_results/hype/hype_$var_date/ST/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/NAS/bin/out_* /home/gppd//arthur/scripts/_results/hype/hype_$var_date/NAS/
scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/hype* /home/gppd//arthur/scripts/_results/hype/hype_$var_date/
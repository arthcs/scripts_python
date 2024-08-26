#!/bin/bash

    #phoenix
    echo ________
    echo UPDATE SCRIPTS PHOENIX
    scp -r /home/gppd/arthur/scripts/FFT/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/FFT/
    scp -r /home/gppd/arthur/scripts/HPCG/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/HPCG/
    scp -r /home/gppd/arthur/scripts/JA/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/JA/
    scp -r /home/gppd/arthur/scripts/LULESH/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/LULESH/
    scp -r /home/gppd/arthur/scripts/PO/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/PO/
    scp -r /home/gppd/arthur/scripts/ST/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/ST/
    scp -r /home/gppd/arthur/scripts/NAS/bin/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/NAS/bin/
    scp -r /home/gppd/arthur/scripts/NAS/config/suite.def acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/NAS/config/
    scp -r /home/gppd/arthur/scripts/execute_phoenix.slurm acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/
    scp -r /home/gppd/arthur/scripts/compile_phoenix.sh acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-phoenix/


# #Tupi
if [ "$node" = "tupi" ];
then
    echo ________
    echo UPDATE SCRIPTS TUPI
    scp -r /home/gppd/arthur/scripts/FFT/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/FFT/
    scp -r /home/gppd/arthur/scripts/HPCG/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/HPCG/
    scp -r /home/gppd/arthur/scripts/JA/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/JA/
    scp -r /home/gppd/arthur/scripts/LULESH/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/LULESH/
    scp -r /home/gppd/arthur/scripts/PO/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/PO/
    scp -r /home/gppd/arthur/scripts/ST/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/ST/
    scp -r /home/gppd/arthur/scripts/NAS/bin/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/NAS/bin/
    scp -r /home/gppd/arthur/scripts/NAS/config/suite.def acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/NAS/config/
    scp -r /home/gppd/arthur/scripts/execute_tupi.slurm acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/
    scp -r /home/gppd/arthur/scripts/compile_tupi.sh acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-tupi/
fi

# #blaise
    echo ________
    echo UPDATE SCRIPTS BLAISE
    scp -r /home/gppd/arthur/scripts/FFT/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/FFT/
    scp -r /home/gppd/arthur/scripts/HPCG/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/HPCG/
    scp -r /home/gppd/arthur/scripts/JA/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/JA/
    scp -r /home/gppd/arthur/scripts/LULESH/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/LULESH/
    scp -r /home/gppd/arthur/scripts/PO/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/PO/
    scp -r /home/gppd/arthur/scripts/ST/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/ST/
    scp -r /home/gppd/arthur/scripts/NAS/bin/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/NAS/bin/
    scp -r /home/gppd/arthur/scripts/NAS/config/suite.def acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/NAS/config/
    scp -r /home/gppd/arthur/scripts/execute_blaise.slurm acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/
    scp -r /home/gppd/arthur/scripts/compile_blaise.sh acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-blaise/

    #hype
    echo ________
    echo UPDATE SCRIPTS HYPE
    scp -r /home/gppd/arthur/scripts/FFT/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/FFT/
    scp -r /home/gppd/arthur/scripts/HPCG/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/HPCG/
    scp -r /home/gppd/arthur/scripts/JA/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/JA/
    scp -r /home/gppd/arthur/scripts/LULESH/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/LULESH/
    scp -r /home/gppd/arthur/scripts/PO/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/PO/
    scp -r /home/gppd/arthur/scripts/ST/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/ST/
    scp -r /home/gppd/arthur/scripts/NAS/bin/* acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/NAS/bin/
    scp -r /home/gppd/arthur/scripts/NAS/config/suite.def acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/NAS/config/
    scp -r /home/gppd/arthur/scripts/execute_hype.slurm acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/
    scp -r /home/gppd/arthur/scripts/compile_hype.sh acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/hpc-benchmarks-hype/

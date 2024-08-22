#!/bin/bash
# sudo chmod +x stats.sh

#SBATCH --job-name=disturbed
#SBATCH --partition=hype5
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --time=06:00:00
#SBATCH --output=%x_%j.out
#SBATCH --error=%x_%j.err


cd FFT
echo "Entrando -> FFT"
bash script.sh >> log_bruto.txt
echo "Saindo -> FFT"
cd ..
cd HPCG
echo "Entrando -> FPCG"
bash script.sh >> log_bruto.txt
echo "Saindo -> FPCG"
cd ..
cd JA
echo "Entrando -> JA"
bash script.sh >> log_bruto.txt
echo "Saindo -> JA"
cd ..
cd LULESH
echo "Entrando -> LULESH"
bash script.sh >> log_bruto.txt
echo "Saindo -> LULESH"
cd ..
cd PO
echo "Entrando -> PO"
bash script.sh >> log_bruto.txt
echo "Saindo -> PO"
cd ..
cd ST
echo "Entrando -> ST"
bash script.sh >> log_bruto.txt
echo "Saindo -> ST"
cd ..
cd NAS/bin
echo "Entrando -> NAS"
bash nas.sh
echo "Finalizando -> NAS"
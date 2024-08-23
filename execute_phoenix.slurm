#!/bin/bash

#SBATCH --job-name=ikki
#SBATCH --partition=phoenix
#SBATCH --nodes=1
#SBATCH --ntasks=48
#SBATCH --time=12:00:00
#SBATCH --output=phoenix_%x_%a.out
#SBATCH --error=phoenix_%x_%a.err
#SBATCH --array=1-10

echo "INICIO DO SCRIPR"
cd FFT
echo "Entrando -> FFT"
bash script.sh 48 >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> FFT"
cd ..
cd HPCG
echo "Entrando -> FPCG"
bash script.sh 48 >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> FPCG"
cd ..
cd JA
echo "Entrando -> JA"
bash script.sh 48 >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> JA"
cd ..
cd LULESH
echo "Entrando -> LULESH"
bash script.sh 48 >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> LULESH"
cd ..
cd PO
echo "Entrando -> PO"
bash script.sh 48 >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> PO"
cd ..
cd ST
echo "Entrando -> ST"
bash script.sh 48 >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> ST"
cd ..
cd NAS/bin
echo "Entrando -> NAS"
bash nas.sh 48 ${SLURM_ARRAY_TASK_ID}
echo "Finalizando -> NAS"
echo "FIM DO SCRIPT"

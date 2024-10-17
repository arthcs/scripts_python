#!/bin/bash

#SBATCH --job-name=oblivion
#SBATCH --partition=blaise
#SBATCH --nodes=1
#SBATCH --ntasks=88
#SBATCH --time=6:00:00
#SBATCH --output=blaise_%x_%a.out
#SBATCH --error=blaise_%x_%a.err
#SBATCH --array=1-10

echo "INICIO DO SCRIPT"
cd FFT
echo "Entrando -> FFT"
bash script.sh 88 >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> FFT"
cd ..
cd HPCG
echo "Entrando -> HPCG"
bash script.sh 88 >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> HPCG"
cd ..
cd JA
echo "Entrando -> JA"
bash script.sh 88 >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> JA"
cd ..
cd LULESH
echo "Entrando -> LULESH"
bash script.sh 88 >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> LULESH"
cd ..
cd PO
echo "Entrando -> PO"
bash script.sh 88 >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> PO"
cd ..
cd ST
echo "Entrando -> ST"
bash script.sh 88 >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> ST"
cd ..
cd NAS/bin
echo "Entrando -> NAS"
bash nas.sh 88 ${SLURM_ARRAY_TASK_ID}
echo "Finalizando -> NAS"
echo "FIM DO SCRIPT"
cd ../..

cd PARBOIL
bash script.sh 88 >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt

echo "FIM DO SCRIPT"

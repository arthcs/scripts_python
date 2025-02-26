#!/bin/bash

#SBATCH --job-name=rerun_ST_PO
#SBATCH --partition=blaise
#SBATCH --ntasks=88
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --output=out/ST_PO/blaise_st_po_%a.out
#SBATCH --error=out/ST_PO/blaise_st_po_%a.err
#SBATCH --array=1-10

export OMP_PROC_BIND=CLOSE
#export OMP_PLACES=CORES
#export OMP_DISPLAY_ENV=TRUE

# Pega o número de CPUs lógicos
num_threads=$(lscpu | grep "^CPU(s):" | awk '{print $2}')

# Pega o número de núcleos físicos
num_cores=$(lscpu | grep "^Core(s) per socket:" | awk '{print $4}')

rand=2
start=2

# Exibe as informações capturadas
echo "Numero de CPUs logicos (threads): $num_threads"
echo "Numero de núcleos fisicos: $num_cores"

echo "Start -> PO"

cd PO
echo "compilando PO..."
make
echo "___Executando PO___:"

# Loop para executar o script Python
for ((i=start; i <= num_threads; i+=rand));
do
    #export OMP_NUM_THREADS=$i
    echo "___PO com $i Treads___"
    python3 carbon.py "$i" | grep -E "Execution Time:|Time|Energy|CO2eq|travelled by car"
    echo "___PO com $i Treads_concluida___"
done
cd ..
printf "___Fim de PO___:\n\n"



echo "Start -> ST"

cd ST
echo "compilando ST..."
make
echo "___Executando ST___:"

# Loop para executar o script Python
for ((i=start; i <= num_threads; i+=rand));
do
    #export OMP_NUM_THREADS=$i
    echo "___ST com $i Treads___"
    python3 carbon.py "$i" | grep -E "Execution Time:|Time|Energy|CO2eq|travelled by car"
    echo "___ST com $i Treads_concluida___"
done
printf "___Fim de ST___:\n\n"

cd ..
exit

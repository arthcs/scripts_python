#!/bin/bash

#SBATCH --job-name=ikki
#SBATCH --partition=phoenix
#SBATCH --nodes=1
#SBATCH --ntasks=48
#SBATCH --time=5:00:00
#SBATCH --output=phoenix_%x_%a.out
#SBATCH --error=phoenix_%x_%a.err
#SBATCH --array=1-10

# Pega o número de CPUs lógicos
num_threads=$(lscpu | grep "^CPU(s):" | awk '{print $2}')

# Pega o número de núcleos físicos
num_cores=$(lscpu | grep "^Core(s) per socket:" | awk '{print $4}')

# Exibe as informações capturadas
echo "Número de CPUs lógicos (threads): $num_threads"
echo "Número de núcleos físicos: $num_cores"

echo "Entrando -> PARBOIL"
cd hpc-benchmarks/parboil

benchmarks_array=(
    "bfs omp_base SF"
    "histo omp_base default"
    "lmb omp_cpu short"
    "mri-q omp_base small"
    "cutcp omp_base small"
)

caminho_script="./carbon.py"

for benchmark in "${benchmarks_array[@]}"; 
do
    # Lê os valores do benchmark atual em três variáveis
    read -r name version data_set <<< "$benchmark"
    echo "___Executando $name ___:"
    # Loop para executar o script Python
    for ((i = 0; i <= num_threads; i+=2));
    do
        echo "___Execucao_com $i Treads___"
        #python3 "$caminho_script" "$i" "$name" "$version" "$data_set"
        echo "$caminho_script" "$i" "$name" "$version" "$data_set"
        echo "___Execucao_de $i Treads_concluida___"
    done
    printf "___Fim de $name ___:\n\n"
    #python3 log_script.py
done

echo "Finalizando -> PARBOIL"


println "Entrando -> RODINIA"
cd hpc-benchmarks-main/RODINIA/hotspot

benchmarks_array=(
    "bfs omp_base SF"
    "histo omp_base default"
    "lmb omp_cpu short"
    "mri-q omp_base small"
    "cutcp omp_base small"
)

caminho_script="./carbon.py"

for benchmark in "${benchmarks_array[@]}"; 
do
    # Lê os valores do benchmark atual em três variáveis
    read -r name version data_set <<< "$benchmark"

    echo "___Executando $name ___:"
    
    # Loop para executar o script Python
    for ((i = 0; i <= num_threads; i+=2));
    do
        echo "___Execucao_com $i Treads___"
        #python3 "$caminho_script" "$i" "$name" "$version" "$data_set"
        echo "$caminho_script" "$i" "$name" "$version" "$data_set"
        echo "___Execucao_de $i Treads_concluida___"
    done
    printf "___Fim de $name ___:\n\n"
    #python3 log_script.py
done

echo "Finalizando -> RODINIA"




exit

echo "INICIO DO SCRIPT"
cd FFT
echo "Entrando -> FFT"
bash script.sh ${num_threads} >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> FFT"
cd ..
cd HPCG
echo "Entrando -> HPCG"
bash script.sh ${num_threads} >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> HPCG"
cd ..
cd JA
echo "Entrando -> JA"
bash script.sh ${num_threads} >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> JA"
cd ..
cd LULESH
echo "Entrando -> LULESH"
bash script.sh ${num_threads} >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> LULESH"
cd ..
cd PO
echo "Entrando -> PO"
bash script.sh ${num_threads} >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> PO"
cd ..
cd ST
echo "Entrando -> ST"
bash script.sh ${num_threads} >> log_bruto_${SLURM_ARRAY_TASK_ID}.txt
echo "Saindo -> ST"
cd ..
cd NAS/bin
echo "Entrando -> NAS"
bash nas.sh ${num_threads} ${SLURM_ARRAY_TASK_ID}
echo "Finalizando -> NAS"
echo "FIM DO SCRIPT"

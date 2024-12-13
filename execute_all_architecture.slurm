#!/bin/bash

#SBATCH --job-name=ikki
#SBATCH --partition=phoenix
#SBATCH --nodes=1
#SBATCH --ntasks=48
#SBATCH --time=00:00:30
#SBATCH --output=out/phoenix_%x_%a.out
#SBATCH --error=out/phoenix_%x_%a.err
#SBATCH --array=1-10

export OMP_PROC_BIND=CLOSE
export OMP_PLACES=CORES

# Pega o número de CPUs lógicos
num_threads=$(lscpu | grep "^CPU(s):" | awk '{print $2}')

# Pega o número de núcleos físicos
num_cores=$(lscpu | grep "^Core(s) per socket:" | awk '{print $4}')

rand=40
start=40

# Exibe as informações capturadas
echo "Numero de CPUs logicos (threads): $num_threads"
echo "Numero de núcleos fisicos: $num_cores"

echo "Entrando -> PARBOIL"
cd parboil

benchmarks_array=(
    "bfs omp_base SF"
    "histo omp_base default"
    "lmb omp_cpu short"
    "mri-q omp_base small"
    "cutcp omp_base small"
)

caminho_script="carbon.py"

for benchmark in "${benchmarks_array[@]}"; 
do
    # Lê os valores do benchmark atual em três variáveis
    read -r name version data_set <<< "$benchmark"
    echo "___Executando $name ___:"
    # Loop para executar o script Python
    for ((i=start; i <= num_threads; i+=rand));
    do
        echo "___$name com $i Treads___"
        echo python3 "$caminho_script" "$i" "$name" "$version" "$data_set"
        echo "___$name com $i Treads_concluida___"
    done
done
exit
cd ..
echo "Finalizando -> PARBOIL"


printf "\n\nEntrando -> RODINIA\n\n"
cd RODINIA/

echo "compilando hotspot..."
cd hotspot/
make clean | grap "error"
make all | grap "error"
cd ..

echo "___Executando hotspot___:"
benchmark_argv="./hotspot/hotspot 1024 1024 100000 @ data/hotspot/temp_1024 data/hotspot/power_1024 output.out"
# Loop para executar o script Python
for ((i=start; i <= num_threads; i+=rand));
do
    export OMP_NUM_THREADS=$i
    argv=${benchmark_argv//@/$i}
    echo "___hotspot com $i Treads___"
    python3 carbon.py "$i" "$argv"
    echo "___hotspot com $i Treads_concluida___"
done
printf "___Fim de hotspot___:\n\n"

echo "compilando lud..."
cd lud/
make clean | grap "error"
make openmp | grap "error"
cd ..
echo "___Executando lud___:"
benchmark_argv="./lud/omp/lud_omp -s 16000"
# Loop para executar o script Python
for ((i=start; i <= num_threads; i+=rand));
do
    export OMP_NUM_THREADS=$i
    argv=${benchmark_argv//@/$i}
    echo "___lud com $i Treads___"
    python3 carbon.py "$i" "$argv"
    echo "___lud com $i Treads_concluida___"
done
printf "___Fim de lud___:\n\n"

echo "compilando streamcluster..."
cd streamcluster/
make clean | grap "error"
make all | grap "error"
cd ..
echo "___Executando streamcluster___:"
benchmark_argv="./streamcluster/sc_omp 10 20 5000 65536 65536 500 none output.out @"
# Loop para executar o script Python
for ((i=start; i <= num_threads; i+=rand));
do
    export OMP_NUM_THREADS=$i
    argv=${benchmark_argv//@/$i}
    echo "___streamcluster com $i Treads___"
    python3 carbon.py "$i" "$argv"
    echo "___streamcluster com $i Treads_concluida___"
done
printf "___Fim de streamcluster___:\n\n"
echo "Finalizando -> RODINIA"

cd ..
exit

# Usage: ./lud_omp [-v] [-n no. of threads] [-s matrix_size|-i input_file]

# Usage: ./hotspot <grid_rows> <grid_cols> <sim_time> <no. of threads><temp_file> <power_file>
#         <grid_rows>             - number of rows in the grid (positive integer)
#         <grid_cols>             - number of columns in the grid (positive integer)
#         <sim_time>              - number of iterations
#         <no. of threads>    - number of threads
#         <temp_file>             - name of the file containing the initial temperature values of each cell
#         <power_file>            - name of the file containing the dissipated power values of each cell

# PARSEC Benchmark Suite
# usage: ./sc_omp k1 k2 d n chunksize clustersize infile outfile nproc
#   k1:          Min. number of centers allowed
#   k2:          Max. number of centers allowed
#   d:           Dimension of each data point
#   n:           Number of data points
#   chunksize:   Number of data points to handle per step
#   clustersize: Maximum number of intermediate centers
#   infile:      Input file (if n<=0)
#   outfile:     Output file
#   nproc:       Number of threads to use
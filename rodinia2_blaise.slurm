#!/bin/bash

#SBATCH --job-name=rodinia
#SBATCH --partition=blaise
#SBATCH --ntasks=88
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --output=out/blaise_%a.out
#SBATCH --error=out/blaise_%a.err
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


#./kmeans_openmp/kmeans -n 88 -t 0.000001 -k 50 -i ../../data/kmeans/kdd_cup #funcionando
#grap: Time for process: 11.586420
echo "Start -> kmeans"
cd openmp/kmeans
echo "compilando kmeans..."
make clean
make
echo "___Executando kmeans___:"

# Loop para executar o script Python
for ((i=start; i <= num_threads; i+=rand));
do
    #export OMP_NUM_THREADS=$i
    echo "___kmeans com $i Treads___"
    python3 carbon.py "$i" | grep -E "Time for process:|Time|Energy|CO2eq|travelled by car"
    echo "___kmeans com $i Treads_concluida___"
done
cd ..
printf "___Fim de kmeans___:\n\n"


#./OpenMP/leukocyte 5 4 ../../data/leukocyte/testfile.avi
#grap: Total application run time: 3.21436 seconds
echo "Start -> leukocyte"
cd openmp/leukocyte
echo "compilando leukocyte..."
make clean
make
echo "___Executando leukocyte___:"

# Loop para executar o script Python
for ((i=start; i <= num_threads; i+=rand));
do
    #export OMP_NUM_THREADS=$i
    echo "___leukocyte com $i Treads___"
    python3 carbon.py "$i" | grep -E "Total application run time:|Time|Energy|CO2eq|travelled by car"
    echo "___leukocyte com $i Treads_concluida___"
done
cd ..
printf "___Fim de leukocyte___:\n\n"

#./backprop 50000000
#grap: backprop,adjust_weights,14.76259344,,nvcc,1,
echo "Start -> backprop"
cd openmp/backprop
echo "compilando backprop..."
make clean
make
echo "___Executando backprop___:"

# Loop para executar o script Python
for ((i=start; i <= num_threads; i+=rand));
do
    #export OMP_NUM_THREADS=$i
    echo "___backprop com $i Treads___"
    python3 carbon.py "$i" | grep -E "backprop,adjust_weights,|Time|Energy|CO2eq|travelled by car"
    echo "___backprop com $i Treads_concluida___"
done
cd ..
printf "___Fim de backprop___:\n\n"

exit #######################<- RETIRAR

#./euler3d_cpu ../../data/cfd/fvcorr.domn.193K
echo "Start -> cfd"
cd openmp/cfd
echo "compilando cfd..."
make clean
make
echo "___Executando cfd___:"

# Loop para executar o script Python
for ((i=start; i <= num_threads; i+=rand));
do
    #export OMP_NUM_THREADS=$i
    echo "___cfd com $i Treads___"
    #python3 carbon.py "$i" | grep -E "......|Time|Energy|CO2eq|travelled by car"
    echo "___cfd com $i Treads_concluida___"
done
cd ..
printf "___Fim de cfd___:\n\n"

#para o srad, o diretório é o srad_v2: ./srad 4096 4096 0 127 0 127 2 0.5 400
echo "Start -> srad"
cd openmp/srad
echo "compilando srad..."
make clean
make
echo "___Executando srad___:"

# Loop para executar o script Python
for ((i=start; i <= num_threads; i+=rand));
do
    #export OMP_NUM_THREADS=$i
    echo "___srad com $i Treads___"
    #python3 carbon.py "$i" | grep -E "......|Time|Energy|CO2eq|travelled by car"
    echo "___srad com $i Treads_concluida___"
done
cd ..
printf "___Fim de srad___:\n\n"
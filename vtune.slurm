#!/bin/bash
#SBATCH --job-name=snapshot
#SBATCH --partition=blaise
#SBATCH --time=02:00:00
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu= <- define a quantidade de memória usada por CPU
#SBATCH --output=vtune_%x_%a.out
#SBATCH --error=vtune_%x_%a.err

# set the number of threads based on --cpus-per-task
#export OMP_NUM_THREADS=88

# module load intel-oneapi-vtune (sem module)
. /home/intel/oneapi/vtune/2021.1.1/vtune-vars.sh

# exemplo de execuçãop
# srun vtune -collect performance-snapshot -- ./my_application

# ajustanto para a quantidade de threads que obteve a menor emissão de carbono
export OMP_NUM_THREADS=80
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_nas_bt -- ./NAS/bin/bt.C.x
export OMP_NUM_THREADS=88
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_nas_cg -- ./NAS/bin/cg.C.x
export OMP_NUM_THREADS=42
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_nas_ft -- ./NAS/bin/ft.C.x
export OMP_NUM_THREADS=42
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_nas_mg -- ./NAS/bin/mg.C.x
export OMP_NUM_THREADS=10
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_nas_sp -- ./NAS/bin/sp.C.x
export OMP_NUM_THREADS=88
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_nas_ua -- ./NAS/bin/ua.C.x
# export OMP_NUM_THREADS=
# srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_fft -- ./parboil/
export OMP_NUM_THREADS=14
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_PO -- ./PO/omp_po
# export OMP_NUM_THREADS=
# srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_fft -- ./RODINIA/
export OMP_NUM_THREADS=10
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_ST -- ./ST/stream
export OMP_NUM_THREADS=6
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_FFT -- ./FFT/fft_omp
export OMP_NUM_THREADS=16
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_HPCG -- ./HPCG/HPCCG_BIN 256 256 128
export OMP_NUM_THREADS=14
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_JA -- ./JA/omp_ja
export OMP_NUM_THREADS=16
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_LULESH -- ./LULESH/lulesh2.0 -i 5000 -s 50

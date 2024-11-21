#!/bin/bash
#SBATCH --job-name=vtune_snapshot
#SBATCH --partition=blaise
#SBATCH --time=00:15:00
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=4000
#SBATCH --output=vtune_%x_%a.out
#SBATCH --error=vtune_%x_%a.err

# set the number of threads based on --cpus-per-task
export OMP_NUM_THREADS=88

# module load intel-oneapi-vtune
. /home/intel/oneapi/vtune/2021.1.1/vtune-vars.sh

# srun vtune -collect performance-snapshot -- ./my_application
# srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_fft -- ./fft_omp

srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_FFT -- ./FFT/fft_omp
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_HPCG -- ./HPCG/HPCCG_BIN 256 256 128
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_JA -- ./JA/omp_ja
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_LULESH -- ./LULESH/lulesh2.0 -i 5000 -s 50
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_nas_bt -- ./NAS/bt.C.x
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_nas_cg -- ./NAS/cg.C.x
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_nas_ft -- ./NAS/ft.C.x
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_nas_mg -- ./NAS/mg.C.x
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_nas_sp -- ./NAS/sp.C.x
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_nas_ua -- ./NAS/ua.C.x
# srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_fft -- ./parboil/
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_PO -- ./PO/omp_po
# srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_fft -- ./RODINIA/
srun vtune -collect performance-snapshot --trace-mpi -r vtune_report/snapshot_ST -- ./ST/stream

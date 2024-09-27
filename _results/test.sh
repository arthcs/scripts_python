    var_date=$(date +'%Y-%m-%d_%H-%M-%S')
    node=$1
    
    
    echo ________
    echo get results BLAISE
    mkdir -p ssd_SCRATCH/blaise
    mkdir -p ssd_SCRATCH/blaise/blaise_$var_date
    mkdir -p ssd_SCRATCH/blaise/blaise_$var_date/FFT
    mkdir -p ssd_SCRATCH/blaise/blaise_$var_date/HPCG
    mkdir -p ssd_SCRATCH/blaise/blaise_$var_date/JA
    mkdir -p ssd_SCRATCH/blaise/blaise_$var_date/LULESH
    mkdir -p ssd_SCRATCH/blaise/blaise_$var_date/PO
    mkdir -p ssd_SCRATCH/blaise/blaise_$var_date/ST
    mkdir -p ssd_SCRATCH/blaise/blaise_$var_date/NAS

    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:ssd1/acsilveira/hpc-benchmarks-blaise/FFT/log_*.txt /home/gppd/arthur/scripts/_results/blaise/blaise_$var_date/FFT/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:ssd1/acsilveira/hpc-benchmarks-blaise/HPCG/log_*.txt /home/gppd/arthur/scripts/_results/blaise/blaise_$var_date/HPCG/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:ssd1/acsilveira/hpc-benchmarks-blaise/JA/log_*.txt /home/gppd/arthur/scripts/_results/blaise/blaise_$var_date/JA/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:ssd1/acsilveira/hpc-benchmarks-blaise/LULESH/log_*.txt /home/gppd/arthur/scripts/_results/blaise/blaise_$var_date/LULESH/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:ssd1/acsilveira/hpc-benchmarks-blaise/PO/log_*.txt /home/gppd/arthur/scripts/_results/blaise/blaise_$var_date/PO/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:ssd1/acsilveira/hpc-benchmarks-blaise/ST/log_*.txt /home/gppd/arthur/scripts/_results/blaise/blaise_$var_date/ST/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:ssd1/acsilveira/hpc-benchmarks-blaise/NAS/bin/out_* /home/gppd/arthur/scripts/_results/blaise/blaise_$var_date/NAS/
    scp -r acsilveira@gppd-hpc.inf.ufrgs.br:ssd1/acsilveira/hpc-benchmarks-blaise/blaise* /home/gppd/arthur/scripts/_results/blaise/blaise_$var_date/
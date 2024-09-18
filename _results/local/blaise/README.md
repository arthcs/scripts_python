# HPC Benchmarks

This repository holds a set of High Performance Computing (HPC) benchmarks and instructions on executing them.

## Dependencies

```shell
git clone https://github.com/wbmaas/hpc-benchmarks.git &&
sudo apt update &&
sudo apt -y install make &&
sudo apt -y install gcc &&
sudo apt -y install mpich &&
sudo apt -y install python2 &&
sudo ln -s /usr/bin/python2 /usr/bin/python
```

### Install python2.7 on Ubuntu 23.04 as "python"
```shell
wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz
tar xzf Python-2.7.18.tgz
cd Python-2.7.18
sudo ./configure --enable-optimizations
sudo make altinstall
sudo ln -s "/usr/local/bin/python2.7" "/usr/bin/python"
```

## Run

```shell
# For each benchmark navigate to its folder
cd FFT
make clean
make

# For the NAS benchmarks
make BT CLASS=B
make CG CLASS=B
make FT CLASS=B
make LU CLASS=B
make MG CLASS=B
make SP CLASS=B
make UA CLASS=B

# Edit the execute.sh with the desired number of cores
./execute.sh &
```

## Save execution data

```shell
# compress the results
tar cfJ intel-32-out.tar.xz FFT/out HPCG/out JA/out LULESH/out PO/out ST/out NAS/bin/out RODINIA/hotspot/out RODINIA/lud/out RODINIA/streamcluster/out parboil/out
# Copy files from VM
scp ubuntu@<server-ip>:/home/ubuntu/hpc-benchmarks/<instance>-<cores>-out.tar.xz /home/<username>/Documents
```

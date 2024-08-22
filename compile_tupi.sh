#!/bin/bash

echo "INICIO DO SCRIPR"
cd FFT
echo "Compilando -> FFT"
make
echo "Saindo -> FFT"
cd ..
cd HPCG
echo "Compilando -> FPCG"
make
echo "Saindo -> FPCG"
cd ..
cd JA
echo "Compilando -> JA"
make
echo "Saindo -> JA"
cd ..
cd LULESH
echo "Compilando -> LULESH"
make
echo "Saindo -> LULESH"
cd ..
cd PO
echo "Compilando -> PO"
make
echo "Saindo -> PO"
cd ..
cd ST
echo "Compilando -> ST"
make
echo "Saindo -> ST"
cd ..
cd NAS
echo "Compilando -> NAS"
make suite
echo "Finalizando -> NAS"
echo "FIM DO SCRIPT"

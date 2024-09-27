#!/bin/sh
# sudo chmod +x stats.sh
# ./stats.sh e2-highcpu-16-out

echo "Stats for CPU: $1"

echo "\nProgram: FFT"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Execution Time:" $1/FFT/out/fft.$nt.txt | awk '{sum += $3} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: HPCG"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Execution time:" $1/HPCG/out/hpcg.$nt.txt | awk '{sum += $3} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: JA"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Execution Time:" $1/JA/out/fft.$nt.txt | awk '{sum += $3} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: LULESH"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Elapsed time" $1/LULESH/out/lulesh.$nt.txt | awk '{sum += $4} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: PO"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Execution Time:" $1/PO/out/po.$nt.txt | awk '{sum += $3} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: ST"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Execution Time:" $1/ST/out/stream.$nt.txt | awk '{sum += $3} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: BT"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Time in seconds" $1/NAS/bin/out/bt.B.x.$nt.txt | awk '{sum += $5} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: CG"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Time in seconds" $1/NAS/bin/out/cg.B.x.$nt.txt | awk '{sum += $5} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: FT"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Time in seconds" $1/NAS/bin/out/ft.B.x.$nt.txt | awk '{sum += $5} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: LU"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Time in seconds" $1/NAS/bin/out/lu.B.x.$nt.txt | awk '{sum += $5} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: MG"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
grep -s -E "Time in seconds" $1/NAS/bin/out/mg.B.x.$nt.txt | awk '{sum += $5} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: SP"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Time in seconds" $1/NAS/bin/out/sp.B.x.$nt.txt | awk '{sum += $5} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: UA"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Time in seconds" $1/NAS/bin/out/ua.B.x.$nt.txt | awk '{sum += $5} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: HOTSPOT"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Total time:" $1/RODINIA/hotspot/out/hotspot.$nt.txt | awk '{sum += $3} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: LUD"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Time consumed" $1/RODINIA/lud/out/lud.$nt.txt | awk '{sum += $3/1000} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: STREAMCLUSTER"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "time =" $1/RODINIA/streamcluster/out/sc.$nt.txt | awk '{sum += $3} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: BFS"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Timer Wall Time" $1/parboil/out/bfs.$nt.txt | awk '{sum += $4} END {if (NR > 0) print sum / NR}'
done

echo "\nProgram: LBM"
for nt in 1 2 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120 124 128
do
    grep -s -E "Timer Wall Time" $1/parboil/out/lbm.$nt.txt | awk '{sum += $4} END {if (NR > 0) print sum / NR}'
done

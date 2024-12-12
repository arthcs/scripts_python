#!/bin/bash

# Número de vezes que você deseja executar o script Python
num_execucoes=$1
benchmark=$2
version=$3
data_set=$4

# Caminho para o script Python que você deseja executar
caminho_script="./carbon.py"

# Loop para executar o script Python várias vezes sequencialmente
for ((i = 80; i <= num_execucoes; i+=2)); do
    echo "___Execucao_com $i Treads___:"
    python3 "$caminho_script" "$i" "$bechmark" "$version" "$data_set"&& echo "___Execucao_de $i Treads_concluida___"
done
python3 log_script.py

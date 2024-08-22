#!/bin/bash

# Número de vezes que você deseja executar o script Python
num_execucoes=40

# Caminho para o script Python que você deseja executar
caminho_script="./carbon.py"

# Loop para executar o script Python várias vezes sequencialmente
for ((i = 1; i <= num_execucoes; i+=1)); do
    echo "___Execucao_com $i Treads___:"
    python3 "$caminho_script" "$i" && echo "___Execucao_de $i Treads_concluida_$
done
python3 log_script.py
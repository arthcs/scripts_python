#!/bin/bash

# Número de vezes que você deseja executar o script Python
num_execucoes=$1

# Caminho para o script Python que você deseja executar
caminho_script="./carbon.py"
echo "até aqui!"
name_application=$2

# Loop para executar o script Python várias vezes sequencialmente
for ((i = 2; i <= num_execucoes; i+=2)); do
    echo "___Execucao $name_application_com $i Treads___:"
    python3 $caminho_script $i $name_application && echo "___Execucao_de $i Treads_concluida___"
done
#python3 log_script.py

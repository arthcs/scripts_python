#!/bin/bash

# Número de vezes que você deseja executar o script Python
num_execucoes=40

# Caminho para o script Python que você deseja executar
caminho_script="./carbon.py"
echo "até aqui!"
name_application=$1

# Loop para executar o script Python várias vezes sequencialmente
for ((i = 4; i <= num_execucoes; i+=4)); do
    echo "___Execucao $name_application_com $i Treads___:"
    python3 $caminho_script $i $name_application && echo "___Execucao_de $i Treads_concluida___"
    #python3 "$caminho_script" 10 && echo "Execução com $i Treads concluída."
done
#python3 log_script.py

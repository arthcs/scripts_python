# Benchmarks 

Cada pasta com nome de aplicação (FFT, HPCG, JA, LULESH, NAS, PO, ST) contém os scripts para executar na raiz de cada aplicação. 

Os scritps são: script.sh, carbon.py, log_script.py. 

**script.sh**: É responsável por executar os outros 2 scripts. Nele também é definido o número de execuções e o número de threads máximo que a aplicação iniciará. (Todas as execuções aumentam a a quantidade de threads de 2 em 2, menos os scripts para a arquitetura da máquina Tupi, por ter somente 16 threads) 

**carbon.py**: É responsável pela execução da aplicação que irá coletar as informações sobre o a emissão de carbono. 

**log_script.py**: É responsável pela organização dos dados gerado pela aplicação carbon.py. gerando o arquivo log_result.txt. 

**Benchmark NAS**: A pasta contem scripts para executar e trabalhar os resultados para os benchmarks NAS, nela contem duas pastas **bin** e **config**. Na pasta config esta o suite para complicar as aplicações NAS com a classe de entra C. Na pasta bin encontra-se os memos scripts anteriores. Porem o script nas.sh que deve ser executado. 

```shell 

    #na raiz da pasta config irá compilar todos os Benchmark NAS 

    make suite 

``` 

Pasta **_result**: Armazena os resultados por data. São adicionados ao executar o comando: 

```shell 

bash update_results.sh all //busca todos os resultados 

bash update_results.sh $nome_da_arquitetura //Busca somente o resultado da arquitetura especificada 

```

**clear_result.sh** : Para limpar os resultados na arquitetura. (O script deve está na raiz da pasta que contém os benchmarks) 

**compile_$nome_  
da_arquitetura.sh** : Irá compilar todos os benchmarks. (O script deve está na raiz da pasta que contém os benchmarks)

**execute_$nome_da_arquitetura.slurm**: Script para executar na arquitetura especifica (O script deve está na raiz da pasta que contém os benchmarks) 

**update_scripts.sh**: Script responsável pelo update de todos os outros scripts para as determinadas pastas (exceto os scripts para a arquitetura da máquina Tupi) 

#Dependencias: 

Paython3,
CarbonTracker,
Pandas,
Regular Expression,

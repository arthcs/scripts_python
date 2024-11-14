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

###### Alguns resultados ficaram com alguns problemas, por esse motivo foi criado o *script fix_log.py*.  Para manipular os dados usando a linguagem R é preciso converter dados em csv. Por esse motivo foi criado o *to_csv.py*.  Esses dois scrits podem sem executados usando o* run_for_all.sh* 

### Ordem dos scripts em R
Apos os resultados serem convertidos em CSV, Usamos a linguagem R manipular todos os dadosgerados. Os scripts precisam ser executados seguindo essa ordem. 

**inserir_dataframes.R:** irá buscar nas pastas da sua raiz todos os CSV de todas as arquiteturas e Irá organizar listas de dataframes para cada arquiteturas. Dentro dessas listas terá o resultado de cada aplicação todas as vezes que ela foi excetuada. (As aplicações foram executadas 10x)

**arcs_average.R :** Irá calcular a média dos resultados das 10 execuções. Irá salvar uma nova lista com um datafreme para cada aplicação com os valores médio de cada execução. 

**make_df_co2.R**: Irá criar um dataframe com os dados das execuções que obtiveram a menor média de emissão de carbono. 

**bar_co2eq.R e bar_threads.R:** Criar um gráfico mostrando as menores emissões de carbono, um mostra as menores emissões e outro mostra a quantidade de threads que que obteve a menor emissão. 

**ggplot2_average.R:** Cria duas listas para cada arquitetura, contento os gráficos relacionando o número de threads com a emissão de carbono e outro relacionando o número de threads com o tempo de execução de cada aplicação. 

**bar_theads.R e bar_co2.R:** monta um gráfico de barras mostrando a quantidade de threads que alcançou a menor emissão de carbono. O outro mostra a menor emissão de carbono para cada aplicação. 


##Dependencias: 
Paython3,
CarbonTracker,
Pandas,
Regular Expression,
R
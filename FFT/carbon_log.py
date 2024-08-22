from carbontracker.tracker import CarbonTracker
import os
import sys
import pandas as pd
import re

def buscar_palavras(arquivo, palavras, arquivo_saida):
    try:
        with open(arquivo, 'r') as arquivo_txt, open(arquivo_saida, 'w') as arquivo_saida_txt:
            linhas = arquivo_txt.readlines()
            for num_linha, linha in enumerate(linhas, start=1):
                for palavra in palavras:
                    if palavra in linha:
                        # arquivo_saida_txt.write(f"A palavra '{palavra}' foi encontrada na linha {num_linha}:\n")
                        arquivo_saida_txt.write(linha)
                        #print(linha)
    except FileNotFoundError:
        print(f"O arquivo '{arquivo}' não foi encontrado.")
    except Exception as e:
        print("Ocorreu um erro:", e)

def extract_number(line):
    match = re.search(r'Execucao_com (\d+) Treads', line)
    if match:
        return int(match.group(1))
    return None

def process_data(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    data = []
    entry = {}
    for line in lines:
        line = line.strip()
        if line.startswith("___Execucao_com") and "Treads___" in line:
            if entry:  # Save the previous entry if it exists
                data.append(entry)
            entry = {}  # Start a new entry
            entry['Treads'] = extract_number(line)
        #elif line.startswith("Elapsed time"):
            # match = re.search(r"Elapsed time\s*=\s*([0-9.]+)\s*\(s\)", line)
            # if match:
            #     entry['Elapsed time'] = float(match.group(1))
        elif line.startswith("Execution Time"):
            entry['Execution Time'] = float(line.split(':')[1].strip())
        elif line.startswith("Time:"):
            entry['Time'] = line.split('\t')[1].strip()
        elif line.startswith("Energy:"):
            match = re.search(r"([0-9.]+) kWh", line)
            if match:
                entry['Energy'] = float(match.group(1))
        elif line.startswith("CO2eq:"):
            match = re.search(r"([0-9.]+) g", line)
            if match:
                entry['CO2eq'] = float(match.group(1))
        elif line.endswith("km travelled by car"):
            match = re.search(r"([0-9.]+) km", line)
            if match:
                entry['km travelled by car'] = float(match.group(1))


    # Add the last entry
    if entry:
        data.append(entry)

    # Create DataFrame
    df = pd.DataFrame(data)
    return df

max_epochs = 1
num_application = 0
#application = ['Castro','Nyx','CCN','CCR','DFT','DJ','FFT','GL','GS','HS','JA','LU','MC','MM','OE','PO']
threads_num = sys.argv[1] #parâmetro do bash
log_dir = './out/'

tracker = CarbonTracker(
        epochs=1,
        decimal_precision=4,
        verbose=1,
        log_dir=str(log_dir),
        log_file_prefix='fft_'+str(threads_num)+'T',
        ignore_errors=True
)

# Training loop.
for epoch in range(max_epochs):
    tracker.epoch_start()

    os.system('OMP_NUM_THREADS='+str(threads_num)+' ./fft_omp')

    tracker.epoch_end()

# Optional: Add a stop in case of early termination before all monitor_epochs has
# been monitored to ensure that actual consumption is reported.

tracker.stop()

# scp /home/users/acsilveira/carbontracker/CTlog gppd@gppd-209-8:/home/gppd/Desktop/Arthur/carbon>
# scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/carbontracker/CTlog /home/gppd/D>
# scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/carbontracker/CTlog /home/users/>



palavras = ['Run time = ','Time:','Energy:','CO2eq:','km travelled by car', 'Run time without initialization =','___Execucao_com','Execution time', 'Elapsed time']
arquivo = 'log_bruto.txt'
arquivo_saida = 'log_limpo.txt'

buscar_palavras(arquivo, palavras, arquivo_saida)

#para várias aplicações
# for app in application:

#     #for Blaise
#     arquivo = 'logBruto.txt'
#     arquivo_saida = 'log_limpo.txt'

#     #for hype
#     # arquivo = 'applications_hype/'+app+'/log_bruto.txt'
#     # arquivo_saida = 'logs_hype/'+app+'_saida.txt'

#     buscar_palavras(arquivo, palavras, arquivo_saida)


############ Organiza os dados
# Caminho para o arquivo de dados
file_path = 'log_limpo.txt'

# Processar os dados e criar a tabela
df = process_data(file_path)

# Exibir a tabela
#print(df)

# Converter pontos em vírgulas
df_str = df.to_string(index=False)
df_str = df_str.replace('.', ',')

# Salvar a tabela em um arquivo txt
output_file = 'log_result.txt'
with open(output_file, 'w') as file:
    file.write(df_str)

print(f"Os resultados foram salvos em {output_file}")


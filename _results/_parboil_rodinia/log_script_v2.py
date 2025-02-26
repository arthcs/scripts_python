import pandas as pd
import re
import os

# def buscar_palavras(arquivo, palavras, arquivo_saida):
#     try:
#         with open(arquivo, 'r') as arquivo_txt, open(arquivo_saida, 'w') as arquivo_saida_txt:
#             linhas = arquivo_txt.readlines()
#             for num_linha, linha in enumerate(linhas, start=1):
#                 for palavra in palavras:
#                     if palavra in linha:
#                         # arquivo_saida_txt.write(f"A palavra '{palavra}' foi encontrada na linha {num_linha}:\n")
#                         arquivo_saida_txt.write(linha)
#                         #print(linha)
#     except FileNotFoundError:
#         print(f"O arquivo '{arquivo}' não foi encontrado.")
#     except Exception as e:
#         print("Ocorreu um erro:", e)

def extract_number(line):
    match = re.search(r'com (\d+) Treads', line)
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
        if line.startswith("___") and "Treads___" in line:
            if entry:  # Save the previous entry if it exists
                data.append(entry)
            entry = {}  # Start a new entry
            entry['Treads'] = extract_number(line)
            if line.startswith("___Executando "):
                match = re.search(r"___Executando ([a-zA-Z]+)", line).group(1)
            else:
                match = re.search(r"___([a-zA-Z]+)", line).group(1)
            if match:
                entry['App'] = match

            #resultado = re.search(regex, texto)
        # pega os dados para Time
        elif line.startswith("Timer Wall Time"): #Parboil milisegundos
            entry['Time'] = float(line.split(':')[1].strip())
        elif line.startswith("Total time:"): #rodinia segundos
            entry['Time'] = float(line.split(':')[1].replace('seconds', '').strip())
        elif line.startswith("Time consumed(ms):"): #rodinia milisegundos
            entry['Time'] = float(line.split(':')[1].strip())
        elif line.startswith("time ="): #rodinia segundos
            entry['Time'] = float(line.split('=')[1].strip())
        # paga os dados de Time CT
        elif line.startswith("Time:"):
            entry['Time CT'] = line.split('\t')[1].strip()
        # paga os dados de Energy
        elif line.startswith("Energy:"):
            match = re.search(r"([0-9.]+) kWh", line)
            if match:
                entry['Energy'] = float(match.group(1))
        # paga os dados de Time CO2eq
        elif line.startswith("CO2eq:"):
            match = re.search(r"([0-9.]+) g", line)
            if match:
                entry['CO2eq'] = float(match.group(1))
        # paga os dados de Time travelled
        elif line.endswith("km travelled by car"):
            match = re.search(r"([0-9.]+) km", line)
            if match:
                entry['km travelled by car'] = float(match.group(1))
        #print(entry)


    # Add the last entry
    if entry:
        data.append(entry)

    # Create DataFrame
    df = pd.DataFrame(data)
    return df

#palavras = ['Run time = ','Time:','Energy:','CO2eq:','km travelled by car', 'Run time without initialization =','___Execucao_com','Execution time', 'Elapsed time']

# busca o nome dos arquivos que terminam com .out
#folder = os.path.join(os.getcwd(), "resultados_01")
files_out = [arquivo for arquivo in os.listdir("resultados_01") if arquivo.startswith('tupi') and arquivo.endswith('.out')]
print(files_out)
exit()

for file in files_out:
    #print("Processando arquivo: "+file)

    #####Organiza os dados
    # Caminho para o arquivo de dados
    file_path = file
    #file_path = 'log_limpo_'+ str(num+1) + '.txt'

    # Processar os dados e criar a tabela
    df = process_data(file_path)

    # Exibir a tabela
    #print(df)

    # Converter pontos em vírgulas
    df_str = df.to_string(index=False)
    df_str = df_str.replace('.', ',')

    # Salvar a tabela em um arquivo txt
    output_file = 'process_data/log_'+ file_path

    with open(output_file, 'w') as file:
        file.write(df_str)

    print(f"Os resultados foram salvos em {output_file}")

#files_one = [arquivo for arquivo in os.listdir('process_data/.') if arquivo.startswith('tupi') and arquivo.endswith('.out')]
pasta = os.path.join(os.getcwd(), "process_data")
files_one = [f for f in os.listdir(pasta) if os.path.isfile(os.path.join(pasta, f) and f.startswith('log_tupi'))]
print(files_one)
import pandas as pd
import re
import os

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

def run(path):
    for num in range(10):
        #print(num+1)
        arquivo = path+'/'+'log_bruto_'+ str(num+1) + '.txt'
        arquivo_saida = path+'/'+'log_limpo_'+str(num+1)+'.txt'
        #print(arquivo)

        buscar_palavras(arquivo, palavras, arquivo_saida)

        ############ Organiza os dados
        # Caminho para o arquivo de dados
        file_path = path+'/'+'log_limpo_'+ str(num+1) + '.txt'

        # Processar os dados e criar a tabela
        df = process_data(file_path)

        # Exibir a tabela
        #print(df)

        # Converter pontos em vírgulas
        df_str = df.to_string(index=False)
        df_str = df_str.replace('.', ',')

        # Salvar a tabela em um arquivo txt
        output_file = path+'/'+'log_result_'+ str(num+1) + '.txt'

        with open(output_file, 'w') as file:
            file.write(df_str)

        print(f"{output_file} Salvo!")


palavras = ['Run time = ','Time:','Energy:','CO2eq:','km travelled by car', 'Run time without initialization =','___Execucao_com','Execution time', 'Elapsed time']

# Conta o número de arquivos que começam com "log_bruto_" e terminam com ".txt" na pasta atual
# contador_txt = len([arquivo for arquivo in os.listdir('.') if arquivo.startswith('log_bruto_') and arquivo.endswith('.txt')])

folders = [nome for nome in os.listdir('.') if os.path.isdir(os.path.join('.', nome))]
print(folders)

for folder in folders:
    for app_folder in ['FFT', 'HPCG', 'JA', 'LULESH', 'NAS', 'PO', 'ST']:
        if app_folder == 'NAS':
            path = folder+"/"+app_folder
            nas_folders = [nome for nome in os.listdir(path) if os.path.isdir(os.path.join(path, nome))]
            for nas in nas_folders:
                path = folder+"/"+app_folder+"/"+nas
                run(path)
        else:
            path = folder+"/"+app_folder
            run(path)
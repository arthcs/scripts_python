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
    match = re.search(r'___Execucao_de (\d+) Treads_concluida___', line)
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
        if line.startswith("Time in seconds"):
            if entry:  # Save the previous entry if it exists
                data.append(entry)
            entry = {}  # Start a new entry
            entry['Time in seconds'] = float(line.split('=')[1].strip())
        elif line.startswith("Run time without initialization ="):
            entry['Run time without initialization'] = float(line.split('=')[1].strip())
        #elif line.startswith('___Execucao_com'):
            #entry['Treads'] = float((line.split('m')[1]).split('T').strip())
        elif line.startswith("Time:"):
            entry['Time'] = line.split('\t')[1].strip()
        elif line.startswith("Energy:"):
            entry['Energy'] = float(re.search(r"([0-9.]+) kWh", line).group(1))
        elif line.startswith("CO2eq:"):
            entry['CO2eq'] = float(re.search(r"([0-9.]+) g", line).group(1))
        elif line.endswith("km travelled by car"):
            entry['km travelled by car'] = float(re.search(r"([0-9.]+) km", line).group(1))
        elif "___Execucao_de" in line and "Treads" in line:
            entry['Treads'] = extract_number(line)

    # Add the last entry
    if entry:
        data.append(entry)

    # Create DataFrame
    df = pd.DataFrame(data)
    return df

# Exemplo de uso
#application = ['CCN','CCR','DFT','DJ','FFT','GL','GS','HS','JA','LU','MC','MM','OE','PO']
palavras = ['Run time = ','Time:','Energy:','CO2eq:','km travelled by car', 'Run time without initialization =','Time in seconds','___Execucao_de']
arquivo = 'log_bruto.txt'
arquivo_saida = 'log_limpo.txt'
# arquivo = 'arquivo.txt'  # Nome do arquivo a ser buscado
# palavras = ['palavra1', 'palavra2', 'palavra3']  # Lista de palavras a serem buscadas
# arquivo_saida = 'saida.txt'  # Nome do arquivo de saída

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

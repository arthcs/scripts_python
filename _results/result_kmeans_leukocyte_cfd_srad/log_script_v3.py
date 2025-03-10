import pandas as pd
import re
import os

def extract_number(line):
    match = re.search(r'com (\d+) Treads', line)
    if match:
        return int(match.group(1))
    return None

# Função para substituir múltiplos espaços por '|'
def substituir_espacos(texto):
    linhas = texto.splitlines()  # Separar o texto por linhas
    linhas_modificadas = [','.join(linha.split()) for linha in linhas]  # Substituir espaços por '|' em cada linha
    return '\n'.join(linhas_modificadas)  # Reunir as linhas com quebra de linha

def process_data(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()

    data_per_app = {}  # Dicionário para armazenar os dataframes separados por App
    entry = {}

    for line in lines:
        line = line.strip()
        if line.startswith("___") and "Treads___" in line:
            if entry:  # Salva a entrada anterior no dicionário
                app_name = entry.get('App', 'Unknown')
                if app_name not in data_per_app:
                    data_per_app[app_name] = []
                data_per_app[app_name].append(entry)

            entry = {}  # Inicia uma nova entrada
            entry['Treads'] = extract_number(line)

            if line.startswith("___Executando "):
                match = re.search(r"___Executando ([a-zA-Z]+)", line)
            else:
                match = re.search(r"___([a-zA-Z]+)", line)

            if match:
                entry['App'] = match.group(1)
        # EDITAR: encorar o tempo retornado pelo app
        elif line.startswith("Timer Wall Time"):  # Parboil milisegundos
            entry['Time'] = float(line.split(':')[1].strip())
        elif line.startswith("Total time:"):  # Rodinia segundos
            entry['Time'] = float(line.split(':')[1].replace('seconds', '').strip())
        elif line.startswith("Time consumed(ms):"):  # Rodinia milisegundos
            entry['Time'] = float(line.split(':')[1].strip())
        elif line.startswith("Total application run time: "):  # leukocyte
            entry['Time'] = float(line.split(':')[1].strip())
        elif line.startswith("Time for process: "): # kmeans
            entry['Time'] = float(line.split(':')[1].strip())

        #Carbon Tracker
        elif line.startswith("Time:"):  # Time CT
            entry['TimeCT'] = line.split('\t')[1].strip()
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

    # Adiciona a última entrada ao dicionário
    if entry:
        app_name = entry.get('App', 'Unknown')
        if app_name not in data_per_app:
            data_per_app[app_name] = []
        data_per_app[app_name].append(entry)

    # Criar um dicionário com DataFrames para cada app
    df_per_app = {app: pd.DataFrame(entries) for app, entries in data_per_app.items()}

    return df_per_app

if not os.path.exists("data"):
    print(f"Erro: Pasta data não encontrada!")
    exit()


if not os.path.exists("process_data"):
    os.makedirs("process_data")
    print(f"Pasta process_data criada.")
else:
    print(f"Pasta process_data já existe.")

# busca o nome dos arquivos que terminam com .out
files_out = [arquivo for arquivo in os.listdir("./data") if arquivo.endswith('.out')]
print(files_out)
#exit()

for file in files_out:
    #print("Processando arquivo: "+file)

    #####Organiza os dados
    # Caminho para o arquivo de dados
    file_name = file
    print(file)
    #file_name = 'log_limpo_'+ str(num+1) + '.txt'

    # Processar os dados e criar a tabela
    #df = process_data('data/'+file_name)
    df_per_app = process_data('data/'+file_name)

    for app, df in df_per_app.items():
        print(f"DataFrame para {app}:")
        #print(df)
        df_str = df.to_string(index=False)
        csv = substituir_espacos(df_str)
        csv = csv.replace("km,travelled,by,car", "travelled")

        # Verifica a pasta da arquitetura ou cria a pasta
        pasta = re.match(r"^[a-zA-Z]+", file_name)
        pasta = pasta.group()
        if not os.path.exists("process_data/" + pasta):
            os.makedirs("process_data/" + pasta)
            print(f"Pasta '{pasta}' criada.")

        num = re.search(r"\d+", file_name)
        output_file = 'process_data/' + pasta + '/' + app + "_" + num.group()+".csv"

        with open(output_file, 'w') as f:
            f.write(csv)

        print(f"Os resultados foram salvos em {output_file}")

print("Finalizado process_data")
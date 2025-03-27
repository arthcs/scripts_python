import pandas as pd
import glob

def do_average(arc, app):
    # Lista todos os arquivos CSV no diretório atual
    csv_files = glob.glob("process_data/"+arc+"/"+app+"*.csv")[:10]  # Garante que apenas 10 arquivos sejam usados
    #print(csv_files)

    if csv_files:
        dataframes = []

        # Lê todos os arquivos CSV e os armazena em uma lista
        to_average_columns = ["Time", "Energy", "CO2eq", "travelled"]

        for file in csv_files:
            df = pd.read_csv(file)
            dataframes.append(df)

        # Concatena todos os DataFrames
        combined_df = pd.concat(dataframes)

        # Divide a coluna Time por 1000 para converter milissegundos em segundos
        combined_df["Time"] /= 1000

        # Calcula a média dos valores numéricos
        mean_df = combined_df.groupby(["Treads", "App"])[to_average_columns].mean().round(4).reset_index()

        # Salva o resultado em um novo arquivo CSV
        mean_df.to_csv("process_data/"+arc+"/average_"+app+".csv", index=False)

        print("Arquivo 'average_"+app+".csv' gerado com sucesso! Salvo em "+arc)
    else:
        print("Nenhum arquivo encontrado para "+arc+" e "+app)

arc = ["blaise", "hype", "phoenix", "tupi"]
app = ["PO", "ST", "bfs", "cutcp", "histo", "lbm", "mri"]

for a in arc:
    for ap in app:
        do_average(a, ap)
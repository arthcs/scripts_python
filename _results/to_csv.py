import sys
import os

# Função para substituir múltiplos espaços por '|'
def substituir_espacos(texto):
    linhas = texto.splitlines()  # Separar o texto por linhas
    linhas_modificadas = ['|'.join(linha.split()) for linha in linhas]  # Substituir espaços por '|' em cada linha
    return '\n'.join(linhas_modificadas)  # Reunir as linhas com quebra de linha

def travelled(texto):
    # Substituir a frase exata por "travelled"
    texto_modificado = texto.replace("km|travelled|by|car", "travelled")
    texto_modificado = texto_modificado.replace("Execution|Time", "Execution Time")
    return texto_modificado

def fix(path):
            for num in range(10):
                with open(path+'/log_result_'+str(num+1)+'.txt', 'r') as arquivo:
                    conteudo = arquivo.read()

                # Substituir os espaços
                conteudo_modificado = substituir_espacos(conteudo)
                conteudo_modificado = travelled(conteudo_modificado)

                # Escrever o conteúdo modificado em um novo arquivo de saída
                with open(path+'/log_ajustado_'+str(num+1)+'.csv', 'w') as arquivo:
                    arquivo.write(conteudo_modificado)

                print(path+"/log_ajustado_"+str(num+1)+".csv Ajuste concluido!")


if sys.argv[1]:
    arch = sys.argv[1]
else:
    print('no argument for arch.')

path = arch+"/"
folders = [nome for nome in os.listdir(path) if os.path.isdir(os.path.join(path, nome))]
print("find "+str(len(folders))+" foldes in arch")

for folder in folders:

    for app_folder in ['FFT', 'HPCG', 'JA', 'LULESH', 'NAS', 'PO', 'ST']:
        #print(app_folder)
        
        if app_folder == 'NAS':
            path = arch+"/"+folder+"/"+app_folder
            nas_folders = [nome for nome in os.listdir(path) if os.path.isdir(os.path.join(path, nome))]
            for nas in nas_folders:
                path = arch+"/"+folder+"/"+app_folder+"/"+nas
                fix(path)
        else:
            path = arch+"/"+folder+"/"+app_folder
            fix(path)
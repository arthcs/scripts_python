# Definir o caminho base onde as pastas estão localizadas
base_path <- "arthur/scripts/_results/blaise/"

# Listar todas as pastas disponíveis dentro do caminho base
pastas <- list.dirs(base_path, full.names = TRUE, recursive = FALSE)

apps_list <- c('FFT', 'HPCG', 'JA', 'LULESH', 'NAS', 'PO', 'ST')

# Inicializar uma lista para armazenar os data frames
lista_data_frames <- list()

# Contador para os data frames
contador <- 1

# Loop para percorrer cada pasta e buscar os arquivos CSV
for (pasta in pastas) {
    for (app in apps_list) {
        # Listar os arquivos CSV na pasta
        path = pasta+"/"+app
        arquivos_csv <- list.files(path, pattern = "*.csv", full.names = TRUE)
        
        # Ler cada arquivo CSV encontrado e armazená-lo como um data frame na lista
        for (arquivo in arquivos_csv) {
            lista_data_frames_[[app]]_[[contador]] <- read.table(arquivo, sep = "|", header = TRUE)
            contador <- contador + 1
        }
    }
}

# Ver os data frames carregados
print(lista_data_frames)
# Definir o caminho base onde as pastas estão localizadas
base_path <- "arthur/scripts/_results/blaise"

# Listar todas as pastas disponíveis dentro do caminho base
pastas <- list.dirs(base_path, full.names = TRUE, recursive = FALSE)

apps_list <- c('NAS', 'PO', 'ST','FFT', 'HPCG', 'JA', 'LULESH')
#apps_list <- c('NAS')
apps_nas <- c('out_bt.C.x', 'out_cg.C.x', 'out_ft.C.x', 'out_mg.C.x', 'out_sp.C.x', 'out_ua.C.x')

# Inicializar uma lista para armazenar os data frames
blaise_data_frames <- list()

#print(pastas)

# Contador para os data frames
contador <- 1

# Loop para percorrer cada pasta e buscar os arquivos CSV
for (pasta in pastas) {
    for (app in apps_list) {
      path = paste(pasta, app, sep = "/")
      if(app == 'NAS'){
        for(nas in apps_nas){
          path_nas = paste(path, nas, sep = "/")
          print(path_nas)

          arquivos_csv <- list.files(path_nas, pattern = "*.csv", full.names = TRUE)
          # Ler cada arquivo CSV encontrado e armazená-lo como um data frame na lista
          for (arquivo in arquivos_csv) {
            nome_df <- paste(nas, contador, sep = "_")
            #print(nome_df)
            blaise_data_frames[[nome_df]] <- read.table(arquivo, sep = ",", header = TRUE)
            contador <- contador + 1
            #print(blaise_data_frames[[nome_df]])
          }
          contador <- 1
        }
      }else{
        # Listar os arquivos CSV na pasta
        arquivos_csv <- list.files(path, pattern = "*.csv", full.names = TRUE)
        print(path)
        
        # Ler cada arquivo CSV encontrado e armazená-lo como um data frame na lista
        for (arquivo in arquivos_csv) {
          nome_df <- paste(app, contador, sep = "_")
          #print(nome_df)
          blaise_data_frames[[nome_df]] <- read.table(arquivo, sep = ",", header = TRUE)
          contador <- contador + 1
          #print(blaise_data_frames[[nome_df]])
        }
        contador <- 1
      }
    }
}

# Ver os data frames carregados
#print(blaise_data_frames)
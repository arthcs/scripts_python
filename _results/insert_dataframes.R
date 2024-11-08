# Definir o caminho base onde as pastas estão localizadas
base_path <- "arthur/scripts/_results"

# Listar todas as pastas disponíveis dentro do caminho base
all_folders_path <- list.dirs(base_path, full.names = TRUE, recursive = FALSE)

# Seleciona somente as pastas com esses nomes
folders_select <- c(
  grep("blaise", all_folders_path),
  grep("hype", all_folders_path),
  grep("phoenix", all_folders_path),
  grep("tupi", all_folders_path)
)
# filtra as pastas do diertório
folders <- all_folders_path[folders_select]
print(folders)

arcs_folders <- c('blaise', 'hype', 'phoenix', 'tupi')
apps_list <- c('PO', 'ST','FFT', 'HPCG', 'JA', 'LULESH', 'NAS')
apps_nas <- c('out_bt.C.x', 'out_cg.C.x', 'out_ft.C.x', 'out_mg.C.x', 'out_sp.C.x', 'out_ua.C.x')

# Inicializar as listas para armazenar os data frames
blaise_data_frames <- list()
hype_data_frames <- list()
phoenix_data_frames <- list()
tupi_data_frames <- list()

# Contador para os data frames
contador <- 1

# Loop para percorrer cada pasta e buscar os arquivos CSV
for(folder in folders){
  arc_path <- list.dirs(folder, full.names = TRUE, recursive = FALSE)
  print(arc_path)
  for(path in arc_path)
    for (app in apps_list) {
      app_path = paste(path, app, sep = "/")
      if(app == 'NAS'){
        for(nas in apps_nas){
          path_nas = paste(app_path, nas, sep = "/")
          print(path_nas)
          
          arquivos_csv <- list.files(path_nas, pattern = "*.csv", full.names = TRUE)
          # Ler cada arquivo CSV encontrado e armazená-lo como um data frame na lista
          for (arquivo in arquivos_csv) {
            nome_df <- paste(nas, contador, sep = "_")
            print(nome_df)
            if (grepl('blaise', path_nas)){
              blaise_data_frames[[nome_df]] <- read.table(arquivo, sep = ",", header = TRUE)
            }else if (grepl("hype", path_nas)) {
              hype_data_frames[[nome_df]] <- read.table(arquivo, sep = ",", header = TRUE)
            }else if (grepl("phoenix", path_nas)) {
              phoenix_data_frames[[nome_df]] <- read.table(arquivo, sep = ",", header = TRUE)
            }else if (grepl("tupi", path_nas)) {
              tupi_data_frames[[nome_df]] <- read.table(arquivo, sep = ",", header = TRUE)
            }
            contador <- contador + 1
          }
          contador <- 1
        }
      }else{
        # Listar os arquivos CSV na pasta
        arquivos_csv <- list.files(app_path, pattern = "*.csv", full.names = TRUE)
        print(app_path)
        
        # Ler cada arquivo CSV encontrado e armazená-lo como um data frame na lista
        for (arquivo in arquivos_csv) {
          nome_df <- paste(app, contador, sep = "_")
          print(nome_df)
          if (grepl('blaise', app_path)){
            blaise_data_frames[[nome_df]] <- read.table(arquivo, sep = ",", header = TRUE)
          }else if (grepl("hype", app_path)) {
            hype_data_frames[[nome_df]] <- read.table(arquivo, sep = ",", header = TRUE)
          }else if (grepl("phoenix", app_path)) {
            phoenix_data_frames[[nome_df]] <- read.table(arquivo, sep = ",", header = TRUE)
          }else if (grepl("tupi", app_path)) {
            tupi_data_frames[[nome_df]] <- read.table(arquivo, sep = ",", header = TRUE)
          }
          #funciona, pois entra em uma pasta de cada vez.
          contador <- contador + 1
        }
        contador <- 1
      }
    }
  }


# Ver os data frames carregados
#print(blaise_data_frames)
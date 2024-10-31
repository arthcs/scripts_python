calcular_media_sd <- function(x) {
  c(Media = mean(x, na.rm = TRUE), SD = sd(x, na.rm = TRUE))  # Calcula a média e o desvio padrão
}

list_df_cache <- list()
df_combined <- data.frame()
save_average <- list()

#nas_selected <- grep("^out_bt\\.C\\.x_[1-9]$|^out_bt\\.C\\.x_10$", names(blaise_data_frames), value = TRUE)
#print(blaise_data_frames$grep("^out_bt\\.C\\.x_[1-9]$|^out_bt\\.C\\.x_10$", names(blaise_data_frames), value = TRUE))

apps_list <- c('out_bt.C.x', 'out_cg.C.x', 'out_ft.C.x', 'out_mg.C.x', 'out_sp.C.x', 'out_ua.C.x', 'PO', 'ST','FFT', 'HPCG', 'JA', 'LULESH')
#apps_list <- c('out_bt.C.x')

for (app in apps_list) {
  for (i in 1:10) {
    aux <- paste0(app, '_',i)
    print(aux)
    list_df_cache[[aux]] <- blaise_data_frames[[aux]]
    #print(list_df_cache)
  }
  
  print(list_df_cache)
  df_combined <- do.call(rbind, list_df_cache)
  list_df_cache <- list()
  print(list_df_cache)
  
  
  # Substituir as vírgulas por pontos e converter para numérico
  #df_combined$CO2eq <- as.numeric(gsub(",", ".", df_combined$CO2eq))
  #df_combined$Execution.Time <- as.numeric(gsub(",", ".", df_combined$Execution.Time))
  #result[[app]] <- aggregate(cbind(Execution.Time, CO2eq) ~ Treads, data = df_combined, FUN = calcular_media_sd)
  
  result <- aggregate(cbind(time_seconds, CO2eq) ~ Treads, data = df_combined, FUN = calcular_media_sd)
  save_average[[app]] <- result
  
  print(save_average[[app]])
}
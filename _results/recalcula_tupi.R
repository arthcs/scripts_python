calcular_media_sd <- function(x) {
  c(Media = mean(x, na.rm = TRUE), SD = sd(x, na.rm = TRUE))  # Calcula a média e o desvio padrão
}

list_df_cache <- list()
df_combined <- data.frame()
blaise_save_average <- list()
hype_save_average <- list()
phoenix_save_average <- list()
tupi_save_average <- list()

apps_list <- c('out_bt.C.x', 'out_cg.C.x', 'out_ft.C.x', 'out_mg.C.x', 'out_sp.C.x', 'out_ua.C.x', 'PO', 'ST','FFT', 'HPCG', 'JA', 'LULESH')

#tupi
for (app in apps_list) {
  for (i in 1:10) {
    aux <- paste0(app, '_',i)
    print(aux)
    list_df_cache[[aux]] <- tupi_data_frames[[aux]]
  }
  
  print(list_df_cache)
  df_combined <- do.call(rbind, list_df_cache)
  list_df_cache <- list()
  print(list_df_cache)
  
  result <- aggregate(cbind(time_seconds, CO2eq) ~ Threads, data = df_combined, FUN = calcular_media_sd)
  tupi_save_average[[app]] <- result
  
  print(tupi_save_average[[app]])
}

rm(list_df_cache)
rm(df_combined)
rm(result)
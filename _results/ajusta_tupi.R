#for (i in seq_along(tupi_data_frames)) {
#  if (nrow(tupi_data_frames[[i]]) == 9) {  # Verifica se o data frame tem 15 linhas
    # Remove as linhas impares do dataframe
    #tupi_data_frames[[i]] <- tupi_data_frames[[i]][seq(2, nrow(tupi_data_frames[[i]]), by = 2), ]
    
    # Remove todas as linhas que contenham NaN em qualquer coluna
   # tupi_data_frames[[i]] <- tupi_data_frames[[i]][rowSums(is.nan(tupi_data_frames[[i]])) == 0, ]
#  }
#}

for (i in seq_along(tupi_data_frames)) {
  if (nrow(tupi_data_frames[[i]]) == 9) {  # Verifica se o data frame tem 9 linhas
    tupi_data_frames[[i]] <- tupi_data_frames[[i]][-1, ]
  }
}



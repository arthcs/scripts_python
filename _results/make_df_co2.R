# 3°
# Suponha que lista_dfs é a lista que contém os 12 data frames
# E que os nomes dos data frames na lista estão armazenados nos nomes da lista

# Criando uma lista para armazenar os resultados
resultados <- list()

# Blaise
for (nome_df in names(blaise_save_average)) {
  df <- blaise_save_average[[nome_df]]  # Acessa o data frame atual
  # Encontra a linha com o menor valor de CO2eq
  linha_menor_CO2eq <- df[which.min(df$CO2eq[,1]), ]
  # Armazena o nome do data frame e a linha completa na lista de resultados
  resultados[[nome_df]] <- cbind(DataFrame = nome_df, linha_menor_CO2eq)
}
# Convertendo os resultados em um único data frame (opcional)
blaise_co2 <- do.call(rbind, resultados)

# Hype
for (nome_df in names(hype_save_average)) {
  df <- hype_save_average[[nome_df]]  # Acessa o data frame atual
  # Encontra a linha com o menor valor de CO2eq
  linha_menor_CO2eq <- df[which.min(df$CO2eq[,1]), ]
  # Armazena o nome do data frame e a linha completa na lista de resultados
  resultados[[nome_df]] <- cbind(DataFrame = nome_df, linha_menor_CO2eq)
}
# Convertendo os resultados em um único data frame (opcional)
hype_co2 <- do.call(rbind, resultados)

# phoenix
for (nome_df in names(phoenix_save_average)) {
  df <- phoenix_save_average[[nome_df]]  # Acessa o data frame atual
  # Encontra a linha com o menor valor de CO2eq
  linha_menor_CO2eq <- df[which.min(df$CO2eq[,1]), ]
  # Armazena o nome do data frame e a linha completa na lista de resultados
  resultados[[nome_df]] <- cbind(DataFrame = nome_df, linha_menor_CO2eq)
}
# Convertendo os resultados em um único data frame (opcional)
phoenix_co2 <- do.call(rbind, resultados)


# tupi
for (nome_df in names(tupi_save_average)) {
  df <- tupi_save_average[[nome_df]]  # Acessa o data frame atual
  # Encontra a linha com o menor valor de CO2eq
  linha_menor_CO2eq <- df[which.min(df$CO2eq[,1]), ]
  # Armazena o nome do data frame e a linha completa na lista de resultados
  resultados[[nome_df]] <- cbind(DataFrame = nome_df, linha_menor_CO2eq)
}
# Convertendo os resultados em um único data frame (opcional)
tupi_co2 <- do.call(rbind, resultados)


rm(resultados)
rm(df)
rm(linha_menor_CO2eq)
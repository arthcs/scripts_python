fft_1 <- read.table("arthur/scripts/_results/blaise/blaise_2024-09-04_10-33-13/FFT/log_ajustado_1.csv", sep = "|", header = TRUE)
fft_2 <- read.table("arthur/scripts/_results/blaise/blaise_2024-09-04_10-33-13/FFT/log_ajustado_2.csv", sep = "|", header = TRUE)
fft_3 <- read.table("arthur/scripts/_results/blaise/blaise_2024-09-04_10-33-13/FFT/log_ajustado_3.csv", sep = "|", header = TRUE)
fft_4 <- read.table("arthur/scripts/_results/blaise/blaise_2024-09-04_10-33-13/FFT/log_ajustado_4.csv", sep = "|", header = TRUE)
fft_5 <- read.table("arthur/scripts/_results/blaise/blaise_2024-09-04_10-33-13/FFT/log_ajustado_5.csv", sep = "|", header = TRUE)
fft_6 <- read.table("arthur/scripts/_results/blaise/blaise_2024-09-04_10-33-13/FFT/log_ajustado_6.csv", sep = "|", header = TRUE)
fft_7 <- read.table("arthur/scripts/_results/blaise/blaise_2024-09-04_10-33-13/FFT/log_ajustado_7.csv", sep = "|", header = TRUE)
fft_8 <- read.table("arthur/scripts/_results/blaise/blaise_2024-09-04_10-33-13/FFT/log_ajustado_8.csv", sep = "|", header = TRUE)
fft_9 <- read.table("arthur/scripts/_results/blaise/blaise_2024-09-04_10-33-13/FFT/log_ajustado_9.csv", sep = "|", header = TRUE)
fft_10 <- read.table("arthur/scripts/_results/blaise/blaise_2024-09-04_10-33-13/FFT/log_ajustado_10.csv", sep = "|", header = TRUE)

calcular_media <- function(x) {
  mean(x, na.rm = TRUE)  # Ignorar valores NA
  # sd(x, na.rm = TRUE)
}

# Combinar os data frames em um único (substitua pelos seus data frames reais)
df_combined <- rbind(fft_1,fft_2,fft_3,fft_4,fft_5,fft_6,fft_7,fft_8,fft_9,fft_10)

# Substituir as vírgulas por pontos e converter para numérico
df_combined$CO2eq <- as.numeric(gsub(",", ".", df_combined$CO2eq))

# Calcular a média de CO2eq agrupada por Treads, ignorando NA
co2_average <- aggregate(CO2eq ~ Treads, data = df_combined, FUN = calcular_media)

View(co2_average)
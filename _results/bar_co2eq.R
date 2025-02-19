library(forcats)
library(cowplot)

#blaise_co2$DataFrame <- fct_inorder(blaise_co2$DataFrame)
#hype_co2$DataFrame <- fct_inorder(hype_co2$DataFrame)
#phoenix_co2$DataFrame <- fct_inorder(phoenix_co2$DataFrame)
#tupi_co2$DataFrame <- fct_inorder(tupi_co2$DataFrame)

# para ordenar o eixo X
levels(blaise_co2$DataFrame)
levels(hype_co2$DataFrame)
levels(phoenix_co2$DataFrame)
levels(tupi_co2$DataFrame)

blaise_co2$DataFrame <- factor(blaise_co2$DataFrame, levels = unique(blaise_co2$DataFrame))
hype_co2$DataFrame <- factor(hype_co2$DataFrame, levels = unique(hype_co2$DataFrame))
phoenix_co2$DataFrame <- factor(phoenix_co2$DataFrame, levels = unique(phoenix_co2$DataFrame))
tupi_co2$DataFrame <- factor(tupi_co2$DataFrame, levels = unique(tupi_co2$DataFrame))

blaise_co2_plot <- ggplot(blaise_co2, aes(x = DataFrame, y = CO2eq[,1], fill = DataFrame)) +
  geom_bar(stat = "identity", fill = "steelblue", width = 0.5) +  # Define a cor das barras
  labs(x = "Applications", y = "CO2eq Emissions", title = 'Blaise Partition') +
  expand_limits(y = c(0, 2))+
  #scale_y_continuous(breaks = seq(0, 2, by = 1)) +
  theme_minimal()+
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),  # Inclina os rótulos do eixo X
    legend.position = "none",  # Remove a legenda
    panel.grid.major = element_blank(),  # Ativa a grid principal (linhas maiores)
    panel.grid.minor = element_line(color = "lightgray", size = 0.25)   # Ativa a grid secundária (linhas menores)
  )

hype_co2_plot <- ggplot(hype_co2, aes(x = DataFrame, y = CO2eq[,1], fill = DataFrame)) +
  geom_bar(stat = "identity", fill = "steelblue", width = 0.5) +  # Define a cor das barras
  labs(x = "Applications", y = "CO2eq Emissions", title = 'Hype Partition') +
  expand_limits(y = c(0, 2))+
  #scale_y_continuous(breaks = seq(0, 40, by = 5)) +
  theme_minimal()+
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),  # Inclina os rótulos do eixo X
    legend.position = "none",  # Remove a legenda
    panel.grid.major = element_blank(),  # Ativa a grid principal (linhas maiores)
    panel.grid.minor = element_line(color = "lightgray", size = 0.25)   # Ativa a grid secundária (linhas menores)
  )

phoenix_co2_plot <- ggplot(phoenix_co2, aes(x = DataFrame, y = CO2eq[,1], fill = DataFrame)) +
  geom_bar(stat = "identity", fill = "steelblue", width = 0.5) +  # Define a cor das barras
  labs(x = "Applications", y = "CO2eq Emissions", title = 'Phoenix Partition') +
  expand_limits(y = c(0, 2))+
  #scale_y_continuous(breaks = seq(0, 50, by = 5)) +
  theme_minimal()+
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),  # Inclina os rótulos do eixo X
    legend.position = "none",  # Remove a legenda
    panel.grid.major = element_blank(),  # Ativa a grid principal (linhas maiores)
    panel.grid.minor = element_line(color = "lightgray", size = 0.25)   # Ativa a grid secundária (linhas menores)
  )

tupi_co2_plot <- ggplot(tupi_co2, aes(x = DataFrame, y = CO2eq[,1], fill = DataFrame)) +
  geom_bar(stat = "identity", fill = "steelblue", width = 0.5) +  # Define a cor das barras
  labs(x = "Applications", y = "CO2eq Emissions", title = 'Tupi Partition') +
  expand_limits(y = c(0, 2))+
  #scale_y_continuous(breaks = seq(0, 20, by = 5)) +
  theme_minimal()+
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),  # Inclina os rótulos do eixo X
    legend.position = "none",  # Remove a legenda
    panel.grid.major = element_blank(),  # Ativa a grid principal (linhas maiores)
    panel.grid.minor = element_line(color = "lightgray", size = 0.25)   # Ativa a grid secundária (linhas menores)
  )

plot_arc_co2 <- plot_grid(blaise_co2_plot, hype_co2_plot, phoenix_co2_plot, tupi_co2_plot,
                              ncol = 2,
                              #labels = c('PO','ST','FFT','HPCG','JA','LULESH'),
                              rel_widths = c(1, 1, 1, 1))

print(plot_arc_co2)

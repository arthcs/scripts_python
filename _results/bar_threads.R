library(forcats)

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

blaise_threads_plot <- ggplot(blaise_co2, aes(x = DataFrame, y = Threads, fill = DataFrame)) +
  geom_bar(stat = "identity", fill = "steelblue", width = 0.5) +  # Define a cor das barras
  labs(x = "Applications", y = "Number of Threads", title = 'Blaise Partition') +
  expand_limits(y = c(0, 88))+
  scale_y_continuous(breaks = seq(0, 90, by = 10)) +
  theme_minimal()+
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),  # Inclina os rótulos do eixo X
    legend.position = "none",  # Remove a legenda
    panel.grid.major = element_blank(),  # Ativa a grid principal (linhas maiores)
    panel.grid.minor = element_line(color = "lightgray", size = 0.25)   # Ativa a grid secundária (linhas menores)
  )

hype_threads_plot <- ggplot(hype_co2, aes(x = DataFrame, y = Threads, fill = DataFrame)) +
  geom_bar(stat = "identity", fill = "steelblue", width = 0.5) +  # Define a cor das barras
  labs(x = "Applications", y = "Number of Threads", title = 'Hype Partition') +
  expand_limits(y = c(0, 40))+
  scale_y_continuous(breaks = seq(0, 40, by = 5)) +
  theme_minimal()+
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),  # Inclina os rótulos do eixo X
    legend.position = "none",  # Remove a legenda
    panel.grid.major = element_blank(),  # Ativa a grid principal (linhas maiores)
    panel.grid.minor = element_line(color = "lightgray", size = 0.25)   # Ativa a grid secundária (linhas menores)
  )

phoenix_threads_plot <- ggplot(phoenix_co2, aes(x = DataFrame, y = Threads, fill = DataFrame)) +
  geom_bar(stat = "identity", fill = "steelblue", width = 0.5) +  # Define a cor das barras
  labs(x = "Applications", y = "Number of Threads", title = 'Phoenix Partition') +
  expand_limits(y = c(0, 48))+
  scale_y_continuous(breaks = seq(0, 50, by = 5)) +
  theme_minimal()+
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),  # Inclina os rótulos do eixo X
    legend.position = "none",  # Remove a legenda
    panel.grid.major = element_blank(),  # Ativa a grid principal (linhas maiores)
    panel.grid.minor = element_line(color = "lightgray", size = 0.25)   # Ativa a grid secundária (linhas menores)
  )

tupi_threads_plot <- ggplot(tupi_co2, aes(x = DataFrame, y = Threads, fill = DataFrame)) +
  geom_bar(stat = "identity", fill = "steelblue", width = 0.5) +  # Define a cor das barras
  labs(x = "Applications", y = "Number of Threads", title = 'Tupi Partition') +
  expand_limits(y = c(0, 16))+
  scale_y_continuous(breaks = seq(0, 20, by = 5)) +
  theme_minimal()+
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),  # Inclina os rótulos do eixo X
    legend.position = "none",  # Remove a legenda
    panel.grid.major = element_blank(),  # Ativa a grid principal (linhas maiores)
    panel.grid.minor = element_line(color = "lightgray", size = 0.25)   # Ativa a grid secundária (linhas menores)
  )

plot_arc_threads <- plot_grid(blaise_threads_plot, hype_threads_plot, phoenix_threads_plot, tupi_threads_plot,
                      ncol = 2,
                      #labels = c('PO','ST','FFT','HPCG','JA','LULESH'),
                      rel_widths = c(1, 1.2, 1.2))

print(plot_arc_threads)

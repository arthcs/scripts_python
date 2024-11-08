library(ggplot2)
library(cowplot)

benchmark <- c('out_bt.C.x','out_cg.C.x','out_ft.C.x','out_mg.C.x','out_sp.C.x','out_ua.C.x','PO','ST','FFT','HPCG','JA','LULESH')

blaise_plot_co2 <-list()
hype_plot_co2 <-list()
phoenix_plot_co2 <-list()
tupi_plot_co2 <-list()

blaise_plot_time <-list()
hype_plot_time <-list()
phoenix_plot_time <-list()
tupi_plot_time <-list()

for(app in benchmark){
  blaise_plot_co2[[app]] <- ggplot(blaise_save_average[[app]], aes(x = Threads, y = CO2eq[,1])) + geom_point()
  hype_plot_co2[[app]] <- ggplot(hype_save_average[[app]], aes(x = Threads, y = CO2eq[,1])) + geom_point()
  phoenix_plot_co2[[app]] <- ggplot(phoenix_save_average[[app]], aes(x = Threads, y = CO2eq[,1])) + geom_point()
  tupi_plot_co2[[app]] <- ggplot(tupi_save_average[[app]], aes(x = Threads, y = CO2eq[,1])) + geom_point()
}
for(app in benchmark){
  blaise_plot_time[[app]] <- ggplot(blaise_save_average[[app]], aes(x = Threads, y = time_seconds[,1])) + geom_point()
  hype_plot_time[[app]] <- ggplot(hype_save_average[[app]], aes(x = Threads, y = time_seconds[,1])) + geom_point()
  phoenix_plot_time[[app]] <- ggplot(phoenix_save_average[[app]], aes(x = Threads, y = time_seconds[,1])) + geom_point()
  tupi_plot_time[[app]] <- ggplot(tupi_save_average[[app]], aes(x = Threads, y = time_seconds[,1])) + geom_point()
}

#grafico1 <- ggplot(blaise_save_average$LULESH, aes(x = Threads, y = CO2eq[,1])) + geom_point()
#grafico2 <- ggplot(blaise_save_average$PO, aes(x = Threads, y = CO2eq[,1], colour = Threads)) + geom_point()
#grafico3 <- ggplot(blaise_save_average$JA, aes(x = Threads, y = CO2eq[,1], colour = Threads)) + geom_point()

aux <- plot_grid(tupi_plot_time[['out_bt.C.x']],tupi_plot_time[['out_cg.C.x']], tupi_plot_time[['out_ft.C.x']],
          ncol = 3,
          labels = c("p1", "p2", "p3"),
          rel_widths = c(1, 1.2, 1.2))

print(aux)
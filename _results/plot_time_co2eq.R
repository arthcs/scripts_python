#Alterar nome dos dadaframes para tirar fazer o gráfico de cada arquitetura.
plot_co1 <- plot_grid(tupi_plot_co2[['out_bt.C.x']],tupi_plot_co2[['out_cg.C.x']],tupi_plot_co2[['out_ft.C.x']],tupi_plot_co2[['out_mg.C.x']],tupi_plot_co2[['out_sp.C.x']],tupi_plot_co2[['out_ua.C.x']],
                      ncol = 3,
                      labels = c('NAS BT','NAS CG','NAS FT','NAS MG','NAS SP','NAS UA'),
                      rel_widths = c(1, 1.2, 1.2))

plot_co2 <- plot_grid(tupi_plot_co2[['PO']],tupi_plot_co2[['ST']],tupi_plot_co2[['FFT']],tupi_plot_co2[['HPCG']],tupi_plot_co2[['JA']],tupi_plot_co2[['LULESH']],
                      ncol = 3,
                      labels = c('PO','ST','FFT','HPCG','JA','LULESH'),
                      rel_widths = c(1, 1.2, 1.2))

#print(plot_co1)

plot_time1 <- plot_grid(tupi_plot_time[['out_bt.C.x']],tupi_plot_time[['out_cg.C.x']],tupi_plot_time[['out_ft.C.x']],tupi_plot_time[['out_mg.C.x']],tupi_plot_time[['out_sp.C.x']],tupi_plot_time[['out_ua.C.x']],
                        ncol = 3,
                        labels = c('NAS BT','NAS CG','NAS FT','NAS MG','NAS SP','NAS UA'),
                        rel_widths = c(1, 1.2, 1.2))

plot_time2 <- plot_grid(tupi_plot_time[['PO']],tupi_plot_time[['ST']],tupi_plot_time[['FFT']],tupi_plot_time[['HPCG']],tupi_plot_time[['JA']],tupi_plot_time[['LULESH']],
                        ncol = 3,
                        labels = c('PO','ST','FFT','HPCG','JA','LULESH'),
                        rel_widths = c(1, 1.2, 1.2))

print(plot_co1)
print(plot_co2)
print(plot_time1)
print(plot_time2)
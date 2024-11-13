plot_co1 <- plot_grid(blaise_plot_co2[['out_bt.C.x']],blaise_plot_co2[['out_cg.C.x']],blaise_plot_co2[['out_ft.C.x']],blaise_plot_co2[['out_mg.C.x']],blaise_plot_co2[['out_sp.C.x']],blaise_plot_co2[['out_ua.C.x']],
                       ncol = 3,
                       labels = c('NAS BT','NAS CG','NAS FT','NAS MG','NAS SP','NAS UA'),
                       rel_widths = c(1, 1.2, 1.2))

plot_co2 <- plot_grid(blaise_plot_co2[['PO']],blaise_plot_co2[['ST']],blaise_plot_co2[['FFT']],blaise_plot_co2[['HPCG']],blaise_plot_co2[['JA']],blaise_plot_co2[['LULESH']],
                      ncol = 3,
                      labels = c('PO','ST','FFT','HPCG','JA','LULESH'),
                      rel_widths = c(1, 1.2, 1.2))

print(plot_co1)
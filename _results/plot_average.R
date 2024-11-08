plot(blaise_save_average$out_cg.C.x$time_seconds[, 1], blaise_save_average$out_cg.C.x$Threads,
     type = "p",
     xlab = "Time/ms", 
     ylab = "Threads", 
     main = "Gráfico de Threads vs Time", 
     lwd = 2,# pch=19 é para pontos sólidos,
     col = "blue"
     )   #col="blue" define a cor dos pontos
#Linha de tendencia
#abline(lm(blaise_save_average$out_cg.C.x$Threads ~ blaise_save_average$out_cg.C.x$CO2eq[, 1]), col = "red", lwd = 2)
#lines(df2$x, df2$y, col = "red")
grid(col="darkgray")
opt<-c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
for(blaise in blaise_save_average){
  #print(blaise)
  lines(blaise$time_seconds[, 1], blaise$Threads, col=opt,pch=opt,cex=10)
}

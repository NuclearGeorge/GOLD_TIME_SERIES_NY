#*********************************************************************
# ANALISIS DE GRAFICAS DE SERIE DE TIEMPO DEL ORO    
#
# Por: Dr. Jorge Chávez
#*********************************************************************
Lista = read.csv("https://raw.githubusercontent.com/NuclearGeorge/ORO/master/oro_datos/181126.csv", header = FALSE)

plot(Lista, lwd=2, type = "l", col="red", xlab = "Hora", ylab = "USD/oz", main="NY-Gold", cex=0.5, cex.main=1.75, cex.lab=1.5, cex.axis=1.0)


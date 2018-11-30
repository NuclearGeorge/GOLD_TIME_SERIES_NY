#*********************************************************************
# ANALISIS DE GRAFICAS DE SERIE DE TIEMPO DEL ORO    
#
# Por: Mat. Irlanda GarcÍa y Dr. Jorge Chávez
#*********************************************************************
Lista = read.csv("https://raw.githubusercontent.com/NuclearGeorge/ORO/master/oro_datos/181126.csv", header = FALSE)

plot(Lista, lwd=2, type = "l", col="red", xlab = "Hora", ylab = "USD/oz", main="NY-Gold", cex=0.5, cex.main=1.75, cex.lab=1.5, cex.axis=1.0)
min(Lista$V2)
max(Lista$V2)

#plot(Lista, las=1, bty="l", col="red", pch=19, main="Title", cex=0.5, cex.main=2.5, cex.lab=1.5, cex.axis=1.0)
#Lista$hr <- Lista$V1
#Lista$costo <- Lista$V2

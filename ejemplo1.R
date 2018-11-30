#*********************************************************************
# ANALISIS DE GRAFICAS DE SERIE DE TIEMPO DEL ORO    
#
# Por: Dr. Jorge Chávez
#*********************************************************************
Lista = read.csv("https://raw.githubusercontent.com/NuclearGeorge/ORO/master/oro_datos/181126.csv", header = FALSE)

plot(Lista, lwd=2, type = "l", col="red", xlab = "Hora", ylab = "USD/oz", main="NY-Gold", cex=0.5, cex.main=1.75, cex.lab=1.5, cex.axis=1.0)
cm = min(datos$V2)
cM = max(datos$V2)
cP = mean(datos$V2)
tm = which(datos$V2==cm)
tM = which(datos$V2==cM)
datos$V1[tm]
datos$V1[tM]

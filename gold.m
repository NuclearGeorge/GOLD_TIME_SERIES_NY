(* ::Package:: *)

Off[CreateDirectory::ioerr];
Print[StyleForm["=====================================================","Section",FontSize->14]]
Print[StyleForm["PACKAGE:","Section",FontSize->14],StyleForm[" IMAGE-DATA-GOLD ","Section",FontSize->14] ]
Print[StyleForm["BY: Dr. Jorge Ch\[AAcute]vez Carlos, (2018)","Section",FontSize->12]]
Print[StyleForm["=====================================================","Section",FontSize->14]]
Print[StyleForm["Este paquete adquiere e importa datos CSV de cotizaci\[OAcute]n de oro,","Section",FontSize->12]]
Print["-----------------------------------------------------"];
Print["El paquete fu\[EAcute] cargado exitosamente"];
Print[StyleForm["=====================================================","Section",FontSize->14]]

(** DATA ANALYSIS **)

indice = Import["rangos.xlsx"][[1]];
files = FileNames["*.png"];
imgs = Import[#] & /@ files;
Do[
param = indice[[1 + n]];
im = imgs[[n]];
imdat0 = ImageData[im];
imdat = imdat0[[28 ;; -1, 1 ;; -1]];
(*Print["Las dimensiones de la imagen son: ", Dimensions[imdat0]]*)
verde = {0.`, 1.`, 0.`};
puntos = Table[{i, Position[imdat[[i]], verde]}, {i, 1, 258 - 28}];
index = Select[
   Table[{i, Length[puntos[[i, 2]]]}, {i, 1, 258 - 28}], #[[2]] > 0 &];
ind = Sort[
   Flatten[Table[
     Table[{puntos[[index[[j]][[1]]]][[2]][[i, 1]], 
       258 - 28 - index[[j]][[1]]}, {i, 1, index[[j]][[2]]}], {j, 1, 
      Length[index]}], 1]];
data = Table[
   N[Mean[Select[ind[[1 ;; -1]], #[[1]] == i &]]], {i, ind[[1, 1]], 
    ind[[-1, 1]], 1}];
(*Renormalizando datos a escala verdadera*)
xi = ind[[1, 1]];
xf = ind[[-1, 1]];
yM = 258 - 28;(*Leido de tabla 1227*)

ym = 258 - 226;(*Leido de tabla 1220*)

cte = N[(param[[3]] - param[[2]])/(yM - ym)];
cte2 = N[(17.25 - 8)/(xf - xi)];
datCal = Table[{8 + cte2 ((data[[i, 1]]) - xi), 
    param[[2]] + cte ((data[[i, 2]]) - ym)}, {i, 1, Length[data]}];
Export[ToString[indice[[1 + n, 1]]] <> "csv", datCal];,{n,1,Length[files]}];
Exit[]

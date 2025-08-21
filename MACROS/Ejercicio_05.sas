/*
Algoritmo
1. crear la macro y darle parametros
2. procedimiento para imprimir las tablas (proc print)
  2.1 llamar a data para especificar la tabla que se va a usar
3. filtrar los datos buscados
4. crear un titulo tabla
5. cerrar macro (%mend)
6. llamar a la macro con los parametros buscados
*/

/*
Ejercicio: Filtrar y Mostrar Datos
Usando la tabla sashelp.cars, 
crea un reporte que muestre solo los autos con motor de 6 cilindros (Cylinders = 6). 
El reporte debe incluir un título que diga "Autos de 6 Cilindros".
*/

%macro mostrar_auto(cylinders);

proc print data=sashelp.cars;

where cylinders=&cylinders;

title "Autos de &cylinders Cilindros";

run;

title;

%mend mostrar_auto;

%mostrar_auto(6)
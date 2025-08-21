%macro mostrar_vehiculo (make, type);

proc print data = sashelp.cars LABEL; 
	where Make = "&make" and Type = "&type";
	title "Mostrando Marca=&make y Tipo=&type de autos";
run;

title;

%mend mostrar_vehiculo;

%mostrar_vehiculo(Toyota,SUV);  /*llamamos a la macro(funcion)*/

*%mostrar_tabla(sashelp.class);


/*
1. macro -> inicia la funcion y declara dos parametros que la macro espera recibir.

2. proc print -> procedimiento que se usa para imprimir los datos de una tabla.

3. data = especifica que tabla se va a usar

4. LABEL -> le está pidiendo a SAS que utilice las etiquetas descriptivas de las 
columnas en el reporte, en lugar de los nombres más técnicos como Make o Type, 
para que el reporte final sea más fácil de entender

5. where filtra los datos

6. make = "&make"
Compara el valor de la columna Make con el valor que se le pase a la macro. 
Las comillas dobles alrededor de &make son necesarias para que SAS interprete el valor del parámetro como texto literal

7. title 2 -> Borra el título, para que no aparezca en futuros reportes.

8. %mend -> comando que marca el final de la deficion de una macro.
le dice a SAS que el bloque de código que compone la macro ha terminado

9. %mostrar_vehiculo (Toyota,SUV) -> llama a la macro.
Toyota es el valor asignado al parametro make
SUV es el valor asignado al parametro type.

*/

/*llamo a todos los datos de la tabla*/
*proc print data = sashelp.cars; 
*run;
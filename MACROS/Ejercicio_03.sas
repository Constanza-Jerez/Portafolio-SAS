%macro crear_segmento (tabla_in=, tabla_out=, region=, ventas_min=0);

data &tabla_out; /*tabla de salida*/
	set &tabla_in; /*tabla de donde se leen los datos*/
	where Region="&region" and Sales>=&ventas_min;
run;

proc print data=&tabla_out;
	title "Tabla Creada: &tabla_out (Región=&region, Ventas Mínimas=&ventas_min)";
run;
title;

%mend crear_segmento; /*finaliza la definicion de la macro*/

/*llamada de las macros*/

%crear_segmento(
  tabla_in=sashelp.shoes, 
  tabla_out=work.africa_top_ventas, 
  region=Africa, 
  ventas_min=100000
);

%crear_segmento(
  tabla_in=sashelp.shoes, 
  tabla_out=work.canada_todas_ventas, 
  region=Canada
  );
  
/*
Definicion de la macro

1. definimos la macro
2. definimos los parametros
3. El signo = despues de cada nombre del parametro, indica que estos son de tipo
"palabra clave", esto quiere decir que al llamar a la macro, podemos pasar los valores
en cualquier orden.
tabla_in =: es el nombre de la tabla de entrada que se va a usar
tabla_out =: nombre de la nueva tabla que se va a crear
region =: el valor de la region con el que se filtrara
ventas_min =0: valor minimo de las ventas. El =0 es un valor predeterminado.

Contenido de la macro

4. data=&tabla_out : (data) inicia in DATA STEP para crear una tabla nueva de datos. 
El nombre de la nueva tabla es el que se le pase a la macro, 
por ejemplo, work.africa_top_ventas.

5. set &tabla_in : (set) Lee las filas de la tabla de entrada (sashelp.shoes).

6. where Region="&region" and Sales>=&ventas_min: Filtra los datos de la tabla de entrada.

Donde:
Region="&region": Selecciona solo las filas donde la 
columna Region coincida con el valor del parámetro region que se pasó. 
Las comillas alrededor de &region son cruciales para que SAS 
lo trate como un valor de texto.

and Sales>=&ventas_min: Filtra aún más las filas para incluir 
solo aquellas donde el valor en la columna Sales sea mayor 
o igual al valor del parámetro ventas_min.

7. run: Ejecuta el DATA Step y crea la nueva tabla.

8. proc print data=&tabla_out: (proc print) Muestra los resultados 
de la nueva tabla que se acaba de crear.

9. title: Crea un título dinámico para el reporte, 
que incluye los nombres de las tablas y los criterios de filtrado.

10. run : Ejecuta el proc print.

11. title: este 2do title borra el título para evitar que se 
aplique a los siguientes reportes en tu sesión.

12. %mend crear_segmento: Finaliza la definición de la macro.

Llamadas de la macro

1. %crear_segmento( tabla_in=sashelp.shoes, tabla_out=work.africa_top_ventas, 
					region=Africa, ventas_min=100000 );

Esta llamada crea una nueva tabla llamada work.africa_top_ventas.

Filtra la tabla original (sashelp.shoes) para incluir solo los registros 
donde la Region es Africa y las Sales son mayores o iguales a 100,000.
  
  
2. %crear_segmento( tabla_in=sashelp.shoes, tabla_out=work.canada_todas_ventas, 
					region=Canada );

Esta llamada crea una nueva tabla llamada work.canada_todas_ventas.

Filtra la tabla original (sashelp.shoes) para incluir solo los registros de la Region Canada.

Como no se especificó un valor para ventas_min, la macro usa su valor predeterminado de 0, 
por lo que incluirá todas las ventas de Canadá.

*/
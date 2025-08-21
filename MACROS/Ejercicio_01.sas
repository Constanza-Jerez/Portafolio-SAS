%macro mostrar_tabla (tabla); /*nombre de la funcion*/

proc print data = &tabla (obs=15); 
	title "Mostrando las primeras 15 filas de &tabla";
run;

title;

%mend mostrar_tabla;

%mostrar_tabla(sashelp.cars); /*llamamos a la macro(funcion)*/

%mostrar_tabla(sashelp.class);


/*
1. proc print -> imprime los datos de la tabla 

2. (obs) opcion que limita el numero de observaciones, 
entonces limita al proc print a mostrar las primeras 15 filas de la tabla

3. data = &tabla: dice a proc print que tabla debe usar. 
El & antes de tabla es crucial: le dice a SAS que use el valor 
del parámetro que se pasó a la macro. 
Por ejemplo, en la primera llamada, se convierte en data = sashelp.cars.

4. Title establece un titulo para el reporte,
&tabla: De nuevo, la macrovariable se reemplaza 
por el nombre de la tabla que estás imprimiendo.

5. title;
Esta línea borra el título establecido en la línea anterior. 
Sin esto, el título de "Mostrando..." 
se mantendría en todos los futuros reportes que se generen en tu sesión de SAS.

6. %mend: Es la instrucción que le dice a SAS que la definición de la macro ha terminado.
*/
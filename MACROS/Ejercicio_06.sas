/*Crear un Nuevo Conjunto de Datos
Usando la tabla sashelp.class, 
crea un nuevo conjunto de datos llamado work.adolescentes 
que contenga solo a los estudiantes que tienen 15 años o más.

Algoritmo:
1. crear la macro variable con sus parametros
2. procedimiento para imprimir las tablas (proc print)
  2.1 llamar a data para especificar la tabla que se va a usar
3. filtrar los datos buscados
4. crear un titulo tabla
5. cerrar macro (%mend)
6. llamar a la macro con los parametros buscados
*/

*proc print data=sashelp.class;
	*title "Hoy es &SYSday";
*run;

%macro estudiantes(age);

proc print data=sashelp.class;

where age >= &age;

title "Estudiantes mayores a &age años";

run;

title;

%mend estudiantes;

%estudiantes(15);
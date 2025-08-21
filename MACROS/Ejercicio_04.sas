/*1. Definicion de la macro*/
%macro analisis_demografico(agrupar_por);

/*2. estandarizar el parámetro*/
/*crea una macrovariable llamada grupo_std
%upcase(): Es una función de macro que 
convierte el valor de su argumento a mayúsculas.
*/

  %let grupo_std = %upcase(&agrupar_por);
  

  title "Análisis Demográfico Agrupado por: &grupo_std";

/* Aquí empieza la lógica condicional */

/*%if &grupo_std = sex %then %do;: 
Si el valor de la macrovariable grupo_std es "SEX" 
(recuerda, ya estandarizado a mayúsculas), 
entonces ejecuta el bloque de código que sigue.*/
  %if &grupo_std = sex %then %do;
  
/*proc means data=sashelp.heart N MEAN STD;: 
Este procedimiento calcula estadísticas descriptivas como 
el número de observaciones (N), el promedio (MEAN) y la desviación estándar (STD).*/

    proc means data=sashelp.heart N MEAN STD; /*analisis estadistico*/
  
/*class Sex;: Le dice a PROC MEANS que agrupe los cálculos por los valores 
únicos de la columna Sex. 
Por ejemplo, calculará el promedio para "Hombres" y "Mujeres" por separado.*/
      class Sex;
      
/*var Cholesterol Weight;: 
Especifica las variables para las que se calcularán las estadísticas.*/
      var Cholesterol Weight;
      
/*run;: Ejecuta el procedimiento.*/
    run;

/*%end;: Finaliza el bloque de código asociado a la condición %if.*/ 
  %end;
  
/*%else %if &grupo_std = STATUS %then %do;: 
Si la primera condición (&grupo_std = sex) es falsa, 
el programa evalúa esta segunda condición. 
Si el valor es "STATUS", ejecuta el siguiente bloque de código.*/  
  %ELSE %IF &grupo_std = STATUS %THEN %DO;
  
/*proc means ... class Status;: 
Es similar al bloque anterior, 
pero esta vez agrupa los resultados por la columna Status 
(que podría tener valores como "Alive", "Dead", etc.).*/
    PROC MEANS DATA=sashelp.heart N MEAN STD;
      CLASS Status;
      VAR Cholesterol Weight;

    RUN;

/*finaliza el 2do bloque*/
  %END;

/*%else %do;: Si ninguna de las condiciones anteriores es verdadera 
(es decir, el parámetro no es "SEX" ni "STATUS"), este bloque se ejecuta.*/
  %ELSE %DO;
  
/* Mensaje de error si el parámetro no es válido */
    %PUT ERROR: El parámetro "agrupar_por" debe ser SEX o STATUS.;
  %END;

/*Borra el título para evitar que se aplique a los siguientes reportes en tu sesión.*/
  TITLE;

/*finaliza la deficiion de la macro*/
%MEND analisis_demografico;


/*Llamada de la macro*/


/*%analisis_demografico(agrupar_por=sex);: 
Llama a la macro y le pasa "sex". 
Gracias a %upcase(), el código agrupará por la columna Sex.*/

%analisis_demografico(agrupar_por=sex);

/*%analisis_demografico(agrupar_por=Status);: Llama a la macro con el valor "Status". 
La macro ejecutará la segunda condición y agrupará por la columna Status.*/

%analisis_demografico(agrupar_por=Status);

/*%analisis_demografico(agrupar_por=Edad);: Llama a la macro con el valor "Edad". 
Como este valor no es ni "SEX" ni "STATUS", 
el programa ejecutará el bloque %ELSE y mostrará el mensaje de error en el log.*/

%analisis_demografico(agrupar_por=Edad);
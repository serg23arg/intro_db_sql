-- Ejercicio 1

/*1. Generar una lista en la que se muestren todos los artistas y las canciones de la tabla TOP
SPOTIFY. El nombre de cada artista y el título de la canción deben mostrarse separados con
un guión, en una columna llamada CANCIÓN. Utilizar la función CONCAT para llevar a cabo
este ejercicio. Ordenar la lista resultante de forma alfabética, por la columna CANCIÓN.
Esta consulta, además, debe mostrar el campo GENERO.*/

use bonus_track;
select concat(ARTISTA,' - ',TITULO) CANCIÓN, GENERO from top_spotify order by CANCIÓN;

/*2. Modificar la consulta anterior para obtener el mismo resultado con la función CONCAT_WS.*/

select concat_ws(' - ',ARTISTA,TITULO) CANCIÓN, GENERO from top_spotify order by CANCIÓN;

/*3. Modificar la consulta anterior para mostrar los géneros en mayúsculas.*/

select concat_ws(' - ',ARTISTA,TITULO) CANCIÓN, UPPER(GENERO) from top_spotify order by CANCIÓN;

/*4. Agregar a la consulta anterior una columna con el nombre AÑOS en la que se calcule la
cantidad de años transcurridos desde que se lanzó cada una de las canciones al año actual.*/

select concat_ws(' - ',ARTISTA,TITULO) CANCIÓN, UPPER(GENERO), (year(curdate()) - ANO) AÑOS from top_spotify order by CANCIÓN;

/*5. Generar una consulta que calcule la cantidad de registros que figuran en la tabla TOP
SPOTIFY. El resultado debe mostrarse en una columna con el nombre CANCIONES.*/

select count(*) CANCIONES from top_spotify;

/*6. Generar una consulta que muestre la cantidad de canciones lanzadas al mercado por año.*/

select ANO, count(*) CANCIONES from top_spotify group by ANO;

/*7. Modificar la consulta anterior para NO mostrar aquellos años en los que se hayan lanzado menos de 50 canciones.*/

select ANO, count(*) CANCIONES from top_spotify group by ANO having CANCIONES >= 50;

-- Ejercicio 2

/* 1. Utilizar la base de datos LIBRERIA y generar una lista en la que se muestren todos los
autores y la provincia en la que nacieron. El apellido y el nombre de cada autor deben
mostrarse separados con una coma y un espacio en una columna llamada AUTOR.
Utilizar la función CONCAT para llevar a cabo este ejercicio. Ordenar alfabéticamente los apellidos resultantes.*/

use libreria;
select concat(apellido,', ',nombre) AUTOR, provincia from autores order by apellido;

/* 2. Modificar la consulta anterior para obtener el mismo resultado con la función CONCAT_WS.*/

select concat_ws(', ',apellido,nombre) AUTOR, provincia from autores order by apellido;

/* 3. Modificar la consulta anterior para mostrar los nombres de los autores en mayúsculas.*/

select concat_ws(', ',apellido,upper(nombre)) AUTOR, provincia from autores order by apellido;

/* 4. Modificar la consulta anterior para mostrar únicamente la inicial del nombre del autor y su apellido.*/

select concat_ws(', ',apellido,LEFT(upper(nombre),1)) AUTOR, provincia from autores order by apellido;

/* 5. Generar una columna con el nombre INGRESO en la que se muestren todos los empleados y el año en el
que ingresaron a trabajar a la empresa. El apellido y el nombre de cada empleado deben mostrarse separados
con una coma y un espacio en una columna con el nombre EMPLEADO. Utilizar la función CONCAT para
llevar a cabo este ejercicio. Ordenar el resultado de la consulta de mayor a menor según los años de ingreso de cada empleado.*/

select concat(apellido,', ',nombre) EMPLEADO, year(fecha_ingreso) INGRESO from empleados order by INGRESO desc;

-- Ejercicio 3

/*1. Modificar la consulta anterior para agregar una columna con el nombre ANTIGÜEDAD.
Esta deberá calcular la cantidad de años de antigüedad de cada empleado dentro de la empresa al día de hoy.*/

select concat(apellido,', ',nombre) EMPLEADO, year(fecha_ingreso) INGRESO, (year(curdate()) - year(fecha_ingreso)) ANTIGÜEDAD from empleados order by INGRESO desc;

/*2. Generar una consulta que permita obtener el precio más bajo de la tabla LIBROS. El
resultado se debe mostrar en una columna con el nombre MENOR PRECIO.*/

select min(precio) 'MENOR PRECIO' from libros;

/*3. Modificar la consulta anterior para agregar una columna que calcule el precio más alto
de la tabla LIBROS. Mostrar el resultado en una columna con el nombre MAYOR PRECIO.*/

select min(precio) 'MENOR PRECIO', max(precio) 'MAYOR PRECIO' from libros;

/*4. Modificar la consulta anterior para agregar una columna que calcule el precio promedio
de todos los libros. Mostrar el resultado en una columna con el nombre PRECIO
PROMEDIO. El promedio resultante debe mostrar 2 decimales como máximo.*/

select min(precio) 'MENOR PRECIO', max(precio) 'MAYOR PRECIO', round(avg(precio),2) 'PRECIO PROMEDIO' from libros;

/*5. Generar una consulta que permita obtener el precio más bajo, el más alto y el promedio de los libros
pertenecientes a cada categoría.*/

select categoria, min(precio) 'MENOR PRECIO', max(precio) 'MAYOR PRECIO', round(avg(precio),2) 'PRECIO PROMEDIO' from libros group by categoria;

/*6. Modificar la consulta anterior para no mostrar la categoría “SIN ASIGNAR”.*/

select categoria, min(precio) 'MENOR PRECIO', max(precio) 'MAYOR PRECIO', round(avg(precio),2) 'PRECIO PROMEDIO' from libros where categoria <> 'Sin asignar' group by categoria;
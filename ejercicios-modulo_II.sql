-- Ejercicio 1

/*1. Importar el archivo CSV llamado TOP_SPOTIFY a la base de datos con el nombre BONUS_TRACK.
*/
# Material de trabajo: https://drive.google.com/file/d/1PDak5WGgUw_-UTX1K-brS3lXAAj56Z4Q/view?usp=sharing

use bonus_track;

/*2. Luego, debes mostrar todo el contenido de la tabla TOP_SPOTIFY importada en el paso anterior.
En el resultado de la consulta, sólo se deben observar las columnas ARTISTA, TÍTULO y GÉNERO.
Ordenar alfabéticamente el resultado de la consulta según los géneros musicales.
En el caso de aquellos géneros que se repiten, ordenar alfabéticamente los nombres de los artistas.*/

select ARTISTA, TITULO, GENERO from top_spotify order by GENERO,ARTISTA; 

-- Ejercicio 2

/*1. En base al ejercicio anterior, mostrar todos los registros de la tabla TOP_SPOTIFY. En
el resultado, sólo se deben observar las columnas ARTISTA, TÍTULO y GÉNERO.
Ordenar el resultado alfabéticamente según los nombres de los artistas y el nombre de
las canciones. Mostrar únicamente las 10 primeras canciones.*/

select ARTISTA, TITULO, GENERO from top_spotify order by ARTISTA,TITULO LIMIT 10; 

/*2. Modificar la consulta anterior para mostrar únicamente las canciones ubicadas desde
la posición 11 hasta la 15 inclusive.*/

select ARTISTA, TITULO, GENERO from top_spotify order by ARTISTA,TITULO LIMIT 5 OFFSET 10; 

/*3. Dada la tabla TOP_SPOTIFY, obtener una lista de todas aquellas canciones pertenecientes
a la cantante Madonna. Debes mostrar todos los campos de la tabla en el resultado de la consulta.*/

select * from top_spotify where ARTISTA = 'Madonna';

/*4. A partir de la tabla TOP_SPOTIFY, obtener una lista de todas aquellas canciones pertenecientes
al género Pop. Mostrar todos los campos de la tabla en el resultado de la consulta y ordenar alfabéticamente el
resultado según el nombre de las canciones.*/

select * from top_spotify where GENERO = 'Pop' order by TITULO;

/*5. De la tabla TOP_SPOTIFY, obtener una lista de todas las canciones pertenecientes al
género Pop lanzadas durante el año 2015. Mostrar todos los campos de la tabla en el
resultado de la consulta y ordenar dicho resultado alfabéticamente según los nombres de
los artistas y los nombres de las canciones.*/

select * from top_spotify where GENERO = 'Pop' and ANO = 2015 order by ARTISTA,TITULO;

/*6. A partir de la tabla TOP_SPOTIFY, obtener una lista de todas aquellas canciones lanzadas
antes del año 2011 y que pertenezcan al género Dance Pop. Mostrar todos los campos
de la tabla en el resultado de la consulta y ordenar dicho resultado alfabéticamente
según los nombres de las canciones.*/

select * from top_spotify where ANO < 2011 and GENERO = 'Dance Pop' order by TITULO;

-- Ejercicio 3

/*1. Generar una lista que muestre todos los datos de los autores nacidos en la Ciudad de Buenos Aires.*/

use libreria;
select * from autores where ciudad = 'Buenos Aires';

/*2. Crear una lista que muestre todos los datos de los libros con precio mayor a 30 dólares.
Ordenar los precios de mayor a menor.*/

select * from libros where precio > 30 order by precio desc;

/*3. Crear una lista que muestre todos los datos de los autores que no residen en la Provincia
de Buenos Aires (BA). Ordenar las provincias resultantes alfabéticamente.*/

select * from autores where provincia <> 'BA' order by provincia;

/*4. Generar una lista que muestre todos los datos de los libros que pertenezcan a la
categoría cuentos y cuyo precio sea inferior a 20 dólares. Ordenar alfabéticamente los títulos resultantes.*/

select * from libros where categoria = 'Cuentos' and precio < 20 order by titulo;

/*5. Generar una lista que muestre todos los datos de los libros que pertenezcan a las
categorías novelas o ensayos. Ordenar alfabéticamente los títulos de los libros obtenidos.*/

select * from libros where categoria IN ('Novelas','Ensayos') order by titulo;

/*6. Generar una lista que muestre todos los datos de los libros cuyo precio oscile entre
20 y 35 dólares inclusive. Ordenar los precios resultantes de menor a mayor.*/

select * from libros where precio between 20 and 30 order by precio;

/*7. Crear una lista que muestre todos los datos de los autores cuyo nombre sea Jorge Luis,
Victoria, Ernesto o Adolfo. Ordenar los resultados por nombre en orden alfabético.*/

select * from autores where nombre IN('Jorge Luis','Victoria','Ernesto','Adolfo') order by nombre;

/*8. Generar una lista que muestre todos los datos de los libros cuyo título contenga la palabra
mundo. Ordenar los títulos alfabéticamente.*/

select * from libros where titulo LIKE '%mundo%' order by titulo;

/*9. Crear una lista que muestre todos los datos de los libros cuyo título contenga la
preposición “de”. Ordenar alfabéticamente los resultados.*/

select * from libros where titulo LIKE '%de %' order by titulo;

/*10. Generar una lista que muestre todos los datos de los libros que no tengan cargado su
precio. Luego, ordenar alfabéticamente los resultados por titulo.*/

select * from libros where precio IS NULL order by titulo;
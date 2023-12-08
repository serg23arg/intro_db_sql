-- Ejercicio 1

use bonus_track;

/*1. Generar una consulta de actualización para lograr que todos los títulos de las canciones y los nombres de los artistas de la tabla
TOP_SPOTIFY queden cargados en la tabla en mayúsculas.*/

SET SQL_SAFE_UPDATES = 0;
update top_spotify set TITULO = upper(TITULO), ARTISTA = upper(ARTISTA);
select * from top_spotify;

/*2. Agregar a la tabla TOP_SPOTIFY una columna llamada PERMANENCIA. Completar la columna con la cantidad de años (al año
actual) de permanencia de cada canción dentro de la plataforma digital.*/

alter table top_spotify add column PERMANENCIA int;
update top_spotify set PERMANENCIA = (year(curdate()) - ANO);
select * from top_spotify;

/*3. Crear una tabla nueva con el nombre ÚLTIMOS_LANZAMIENTOS a partir de la tabla TOP_SPOTIFY tomando todos los campos 
de la tabla original. Volcar en la tabla nueva todas aquellas canciones que tengan 10 años o menos de permanencia en la plataforma digital.
Una vez copiados los registros correspondientes en la tabla nueva, eliminarlos de la tabla original (TOP_SPOTIFY).*/

create table ULTIMOS_LANZAMIENTOS select * from top_spotify where PERMANENCIA <= 10;
delete from top_spotify where PERMANENCIA <= 10;

/*4. Agregar el siguiente registro a la tabla TOP_SPOTIFY: 

	ID: 610
	Título: GOD CONTROL
	Artista: MADONNA
	Género: POP
	Año: 2018
	Permanencia: 10 */

insert into top_spotify values
(610,'GOD CONTROL','MADONNA','Pop',2018,10);

/*5. Copiar a la tabla ÚLTIMOS_LANZAMIENTOS todas aquellas canciones que tengan 3 años o menos de permanencia en la plataforma
digital. Una vez copiados los registros en la tabla nueva, eliminarlos de la tabla original (TOP_SPOTIFY).*/

insert into ultimos_lanzamientos select * from top_spotify where PERMANENCIA <= 10;
delete from top_spotify where PERMANENCIA <= 10;

-- Ejercicio 2

use libreria;

/*1. Generar una consulta de actualización en la que se modifique el nombre del autor de apellido ECHEVERRÍA por Esteban. Tener
en cuenta que se debe modificar el nombre de este autor y no su apellido.*/

update autores set nombre = 'Esteban' where apellido = 'ECHEVERRÍA';

/*2. Agregar a la tabla EMPLEADOS una columna con el nombre PERMANENCIA. Completar la columna con la antigüedad (expresada en
años) de cada empleado, tomando como base la fecha de ingreso de cada uno de ellos.*/

alter table empleados add column PERMANENCIA int(2);
update empleados set PERMANENCIA = year(curdate()) - year(fecha_ingreso);
select * from empleados;

/*3. Agregar a la tabla LIBROS una columna con el nombre PRECIO_PUBLICO. A continuación, completar la columna con el precio de venta
al público de cada libro agregándole un 21% en concepto de IVA a los precios originales. Mantener un máximo de 2 decimales.*/

alter table libros add column PRECIO_PUBLICO double;
update libros set PRECIO_PUBLICO = precio * 1.21;
select * from libros;

-- Ejercicio 3

/*1. Generar una tabla nueva y nombrarla como EMPLEADOS_ANTERIORES, a partir de la tabla EMPLEADOS. Tomar todos los campos
de la tabla original. Luego, volcar en la tabla nueva los empleados cuyos apellidos sean THOMAS, PEREIRA y DEVO. Una vez
copiados estos 3 empleados en la tabla nueva, eliminarlos de la tabla original (EMPLEADOS).*/

create table EMPLEADOS_ANTERIORES select * from empleados where apellido in ('THOMAS','PEREIRA','DEVO');
delete from empleados where apellido in ('THOMAS','PEREIRA','DEVO');

/*2. Copiar a la tabla EMPLEADOS_ANTERIORES al empleado de apellido CRUZ desde la tabla EMPLEADOS. Una vez copiado a la tabla
nueva, eliminarlo de la original.*/

insert into EMPLEADOS_ANTERIORES select * from empleados where apellido = 'CRUZ';
delete from empleados where apellido = 'CRUZ';
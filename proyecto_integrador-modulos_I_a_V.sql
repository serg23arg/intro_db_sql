/*PROYECTO INTEGRADOR

Consigna:
Una empresa de tecnología decide utilizar SQL para generar una base de datos en la que va a
almacenar información sobre sus clientes, los artículos que comercializa y las ventas que
realiza. Para ello, se generarán tablas en las cuales se almacenará la información solicitada.
Luego, se llevarán a cabo modificaciones en su estructura y se cargarán datos en ellas.*/


# PARTE 1 / MÓDULO 1

-- Etapa 1.1: Crear bases de datos

/*1. Crear una base de datos con el nombre LABORATORIO.*/

create database laboratorio;

/*2. Poner en uso la base de datos generada en el paso anterior.*/

use laboratorio;

/*3. Crear las tablas FACTURAS, ARTICULOS y CLIENTES dentro de la base de datos con las estructuras indicadas en el siguiente documento:
https://drive.google.com/file/d/1-Wmy5BfjxjL0lOfgRleR96pZ-hu4hE6_/view?usp=sharing
*/

create table facturas (Letra char,
					   Número int,
					   ClienteID int,
					   ArticuloID int,
					   Fecha date,
					   Monto double,
                       Primary Key(Letra,Número));
create table articulos (ArticuloID int Primary Key,
						Nombre varchar(50),
						Precio double,
						Stock int);
create table clientes (ClienteID int Primary Key,
					   Nombre varchar(25),
					   Apellido varchar(25),
					   CUIT char(16),
					   Dirección varchar(50),
					  Comentarios varchar(50));

/*4. Mostrar un listado de todas las bases de datos alojadas en el servidor.*/

show databases;

/*5. Mostrar un listado de todas las tablas generadas anteriormente dentro de la base de datos con el nombre LABORATORIO.*/

use laboratorio;
show tables;

/*6. Describir la estructura de la tabla CLIENTES.*/

desc clientes;

-- Etapa 1.2: Modificar estructuras

/*1. Modificar la tabla FACTURAS tomando en cuenta las siguientes consideraciones:

	a. Cambiar el nombre del campo ClienteID por IDCliente, manteniendo su tipo de dato y restricciones ya definidas.
	b. Cambiar el nombre del campo ArticuloID por IDArticulo, manteniendo su tipo de dato y restricciones ya definidas.
	c. Asignar la restricción UNSIGNED al campo Monto, manteniendo el tipo de dato ya definido para el campo.*/

alter table facturas
change ClienteID IDCliente int,
change ArticuloID IDArticulo int,
modify Monto double unsigned;

/*2. Modificar la tabla ARTICULOS tomando en cuenta las siguientes consideraciones:

	a. Cambiar el nombre del campo ArticuloID por IDArticulo, manteniendo su tipo de dato y restricciones ya definidas.
	b. Cambiar el tipo de dato del campo Nombre para que admita hasta 75 caracteres.
	c. Asignar las restricciones UNSIGNED y NOT NULL al campo Precio, manteniendo el tipo de dato ya definido para el campo.
	d. Asignar las restricciones UNSIGNED y NOT NULL al campo Stock, manteniendo el tipo de dato ya definido para el campo.*/

alter table articulos
change ArticuloID IDArticulo int,
modify Nombre varchar(75),
modify Precio double unsigned not null,
modify Stock int unsigned not null;

/*3. Modificar la tabla CLIENTES. Tomar en cuenta las siguientes consideraciones:

	a. Cambiar el nombre del campo ClienteID por IDCliente, manteniendo su tipo de dato
	   y restricciones ya definidas.
	b. Cambiar el tipo de dato del campo Nombre para que admita hasta 30 caracteres y
	   asigne la restricción correspondiente para que su carga sea obligatoria.
	c. Cambiar el tipo de dato del campo Apellido para que admita hasta 35
	   caracteres y asigne la restricción correspondiente para que su carga sea obligatoria.
	d. Cambiar el nombre del campo Comentarios por Observaciones y su tipo de dato para que admita hasta
	   255 caracteres.*/

alter table clientes
change ClienteID IDCliente int,
modify Nombre varchar(30) not null,
modify Apellido varchar(35) not null,
change Comentarios Observaciones tinytext;

-- Etapa 1.3: Insertar registros

/* 1. Cargar 5 registros en la tabla FACTURAS, tal como se detallan en el siguiente documento:
https://drive.google.com/file/d/1acxulJAerFPqkm_hCe7DSNQTRESWedvP/view?usp=sharing
*/

insert into facturas values
('A',28,14,335,'2021-03-18',1589.50),
('A',39,26,157,'2021-04-12',979.75),
('B',8,17,95,'2021-04-25',513.35),
('B',12,5,411,'2021-05-03',2385.70),
('B',19,50,157,'2021-05-26',979.75);

/* 2. Cargar 4 registros en la tabla ARTÍCULOS, tal como se detallan en el siguiente documento:
https://drive.google.com/file/d/1Jg-u1uVodPb5xB3CuJFdNxu5IVxtp9zW/view?usp=sharing
*/

insert into articulos values
(95,'Webcam con Micrófono Plug & Play',513.35,39),
(157,'Apple AirPods Pro',979.75,152),
(335,'Lavasecarropas Automático Samsung',1589.50,12),
(411,'Gloria Trevi / Gloria / CD+DVD',2385.70,2);

/*3. Cargar 5 registros en la tabla CLIENTES, tal como se detallan en el siguiente documento:
https://drive.google.com/file/d/1qJm34KWKxkdGVib-XVUD-wXw9QcmcTF1/view?usp=sharing
*/

insert into clientes values
(5,'Santiago','González','23-24582359-9','Uriburu 558 - 7ºA','VIP'),
(14,'Gloria','Fernández','23-35965852-5','Constitución 323','GBA'),
(17,'Gonzalo','López','23-33587416-0','Arias 2624','GBA'),
(26,'Carlos','García','23-42321230-9','Pasteur 322 - 2ºC','VIP'),
(50,'Micaela','Altieri','23-22885566-5','Santamarina 1255','GBA');


# PARTE 2 / MÓDULO 2

-- Etapa 2.1: Importar tablas externas

/*1. Importar el archivo CSV con el nombre CLIENTES_NEPTUNO a la base de datos con el nombre LABORATORIO.*/

use laboratorio;

/*Material de trabajo - PARTE 2:
https://drive.google.com/file/d/1sHy55bXiiHHd4XEMUEDY7AJ6P6OzliMu/view?usp=sharing
*/

desc clientes_neptuno;

/*2. Llevar a cabo los siguientes cambios en la tabla CLIENTES_NEPTUNO importada anteriormente:

	a. Campo IDCliente: debe ser de tipo VARCHAR, debe admitir hasta 5 caracteres
	   como máximo y debe ser el campo PRIMARY KEY de la tabla.               
	b. Campo NombreCompania: debe ser de tipo VARCHAR, debe admitir hasta 100
	   caracteres como máximo y no puede quedar vacío.   
	c. Campo Pais: debe ser de tipo VARCHAR, debe admitir hasta 15 caracteres como
	   máximo y no puede quedar vacío.*/

alter table clientes_neptuno 
modify IDCliente varchar(5) primary key,
modify NombreCompania varchar(100) not null,
modify Pais varchar(15) not null;

/*3. Cambiar el nombre de la tabla CLIENTES por CONTACTOS.*/

rename table clientes to contactos;

/*4. Importar el archivo CSV con el nombre CLIENTES a la base de datos LABORATORIO.*/

desc clientes;

/*5. Llevar a cabo los siguientes cambios en la tabla CLIENTES importada anteriormente:

	a. Campo Cod_Cliente: debe ser de tipo VARCHAR, debe admitir hasta 7 caracteres
	   como máximo y debe ser el campo PRIMARY KEY de la tabla.          
	b. Campo Empresa: debe ser de tipo VARCHAR, debe admitir hasta 100
	   caracteres como máximo y no puede quedar vacío.   
	c. Campo Ciudad: debe ser de tipo VARCHAR, debe admitir hasta 25 caracteres
	   como máximo y no puede quedar vacío.   
	d. Campo Telefono: debe ser de tipo INT y no debe admitir valores numéricos negativos.
	e. Campo Responsable: debe ser de tipo VARCHAR y debe admitir como máximo hasta 30 caracteres.*/

alter table clientes
modify COD_CLIENTE varchar(7) primary key,
modify EMPRESA varchar(100) not null,
modify CIUDAD varchar(25) not null,
modify TELEFONO INT UNSIGNED,
modify RESPONSABLE varchar(30);

/*6. Importar el archivo CSV con el nombre PEDIDOS a la base de datos LABORATORIO.*/

desc pedidos;

/*7. Llevar a cabo los siguientes cambios en la tabla PEDIDOS importada anteriormente:

	a. Campo Numero_Pedido: debe ser de tipo INT, sólo debe aceptar valores numéricos
	   positivos y debe ser el campo PRIMARY KEY de la tabla.  
	b. Campo Codigo_Cliente: debe ser de tipo VARCHAR, debe admitir hasta 7 caracteres
	   como máximo y no puede quedar vacío. 
	c. Campo Fecha_Pedido: debe ser de tipo DATE y su carga es obligatoria.
	d. Campo Forma_Pago: sólo debe admitir la carga de los valores APLAZADO, CONTADO o TARJETA.
	e. Campo Enviado: sólo debe admitir la carga de los valores SI o NO.*/
	
alter table pedidos 
modify NUMERO_PEDIDO int unsigned primary key,
modify CODIGO_CLIENTE varchar(7) not null,
modify FECHA_PEDIDO date not null,
modify FORMA_PAGO enum ('APLAZADO','CONTADO','TARJETA') not null,
modify ENVIADO enum ('SI','NO') not null default 'NO';

/*8. Importar el archivo CSV: PRODUCTOS a la base de datos LABORATORIO.*/

desc productos;

/*9. Llevar a cabo los siguientes cambios en la tabla PRODUCTOS importada en el paso anterior:

	a. Campo Cod_Producto: debe ser de tipo INT, sólo debe aceptar valores numéricos
	   positivos y debe ser el campo PRIMARY KEY de la tabla.  
	b. Campo Seccion: debe ser de tipo VARCHAR, debe admitir hasta 20 caracteres como máximo y no puede quedar vacío.   
	c. Campo Nombre: debe ser de tipo VARCHAR, debe admitir hasta 40 caracteres como máximo y no puede quedar vacío.   
	d. Campo Importado: sólo debe admitir la carga de los valores VERDADERO o FALSO.
	e. Campo Origen: debe ser de tipo VARCHAR, admitir hasta 25 caracteres y ser de carga obligatoria.
	f. Campos Dia, Mes y Ano: deben ser de tipo INT, positivos y de carga obligatoria.*/

alter table productos 
modify COD_PRODUCTO int unsigned primary key,
modify SECCION varchar(20) not null,
modify NOMBRE varchar(40) not null,
modify IMPORTADO enum ('VERDADERO','FALSO') not null,
modify ORIGEN varchar(25) not null,
modify DIA int unsigned not null,
modify MES int unsigned not null,
modify ANO int unsigned not null;

-- Etapa 2.2: Generar tablas desde scripts

/*1. Abrir el archivo con formato SQL con el nombre NACIMIENTOS y ejecutar el código
   para generar la tabla NACIMIENTOS dentro de la base de datos LABORATORIO.*/

desc nacimientos;

/*2. Abrir el archivo con formato SQL con el nombre PEDIDOS_NEPTUNO y ejecutar el código para crear la tabla.*/

desc pedidos_neptuno;

/*3. Abrir el archivo con formato SQL con el nombre TABLAS_EXTRAS y ejecutar el código.*/

desc empleados;
desc productos_neptuno;
desc proveedores;

-- Etapa 2.3: Consultar tablas

/*1. Mostrar todos los registros de la tabla CLIENTES_NEPTUNO. En el resultado de la consulta sólo se deben observar
las columnas NOMBRECOMPANIA, CIUDAD y PAIS, y ordenar alfabéticamente el resultado de la consulta por los nombres 
de los países. Para aquellos países que se repiten, ordenar las ciudades alfabéticamente. */

select NombreCompania, Ciudad, Pais from clientes_neptuno order by Pais,Ciudad;

/*2. Repetir la consulta del ítem 1 pero mostrando únicamente los 10 primeros clientes.*/

select NombreCompania, Ciudad, Pais from clientes_neptuno order by Pais,Ciudad limit 10;

/*3. Repetir la consulta del ítem 1 pero mostrando únicamente los clientes ubicados desde la posición 11 hasta la 15 inclusive.*/

select NombreCompania, Ciudad, Pais from clientes_neptuno order by Pais,Ciudad limit 5 offset 10;

-- Etapa 2.4: Predicado de consultas

/*1. De la tabla NACIMIENTOS, obtener una lista de todos aquellos bebés nacidos de madres
extranjeras. Mostrar todos los campos de la tabla en el resultado de la consulta.*/

select * from nacimientos where NACIONALIDAD = 'Extranjera';

/*2. De la tabla NACIMIENTOS, obtener una lista de todos aquellos bebés nacidos de madres
menores de edad. Mostrar todos los campos de la tabla en el resultado de la consulta y
ordenar el resultado de menor a mayor por la edad de las madres.*/

select * from nacimientos where EDAD_MADRE < 18 order by EDAD_MADRE;

/*3. De la tabla NACIMIENTOS, obtener una lista de todos aquellos bebés nacidos de madres
que tengan la misma edad que el padre. Mostrar todos los campos de la tabla en el resultado de la consulta.*/

select * from nacimientos where EDAD_MADRE = EDAD_PADRE;

/*4. De la tabla NACIMIENTOS, obtener una lista de todos aquellos bebés nacidos de madres
que, con respecto al padre, tengan 40 o más años menos que el padre.*/

select * from nacimientos where EDAD_MADRE <= EDAD_PADRE - 40;

/*5. De la tabla CLIENTES_NEPTUNO, obtener una lista de todos aquellos clientes que
residen en Argentina. Mostrar todos los campos de la tabla en el resultado de la consulta.*/

select * from clientes_neptuno where Pais = 'Argentina';

/*6. De la tabla CLIENTES_NEPTUNO, obtener una lista de todos los clientes, con excepción
de los que residen en Argentina. Mostrar todos los campos de la tabla en el resultado
de la consulta y ordenar alfabéticamente dicho resultado por los nombres de los países.*/

select * from clientes_neptuno where Pais <> 'Argentina' order by Pais;

/*7. De la tabla NACIMIENTOS, obtener una lista de todos aquellos bebés que nacieron con
menos de 20 semanas de gestación. Mostrar todos los campos de la tabla en el resultado
de la consulta y ordenar dicho resultado de mayor a menor, por los valores de la columna SEMANAS.*/

select * from nacimientos where SEMANAS < 20 order by SEMANAS desc;

/*8. De la tabla NACIMIENTOS, obtener una lista de todos los bebés de sexo femenino,
nacidos de madres extranjeras solteras, de más de 40 años. Mostrar todos los campos
de la tabla en el resultado de la consulta.*/

select * from nacimientos where SEXO = 'Femenino' and NACIONALIDAD = 'Extranjera' and ESTADO_CIVIL_MADRE = 'Soltera' and EDAD_MADRE > 40;

/*9. De la tabla CLIENTES_NEPTUNO, obtener una lista de todos aquellos clientes que
residan en países sudamericanos (Los países sudamericanos que figuran en esta tabla son Argentina, Brasil y Venezuela).
Mostrar todos los campos de la tabla en el resultado de la consulta y ordenar de manera
alfabética los registros, por los nombres de los países y las ciudades.*/

select * from clientes_neptuno where Pais IN ('Argentina','Brasil','Venezuela') order by Pais,Ciudad;

/*10. De la tabla NACIMIENTOS, obtener una lista de todos aquellos bebés que hayan nacido
con una cantidad de semanas de gestación de entre 20 y 25 semanas, inclusive. Mostrar
todos los campos de la tabla en el resultado de la consulta y ordenar el resultado según
las semanas de gestación de los recién nacidos, de menor a mayor.*/

select * from nacimientos where SEMANAS between 20 and 25 order by SEMANAS;

/*11. De la tabla NACIMIENTOS, utilizar el operador IN y obtener una lista de todos los bebés
que nacieron en las comunas 1101, 3201, 5605, 8108, 9204, 13120 y 15202. Mostrar
todos los campos de la tabla en el resultado de la consulta y ordenar de menor a mayor
los registros, por los números de comuna.*/

select * from nacimientos where COMUNA in (1101, 3201, 5605, 8108, 9204, 13120, 15202) order by COMUNA;

/*12. De la tabla CLIENTES_NEPTUNO, obtener una lista de todos aquellos clientes cuyo ID comience con la letra C.
Mostrar todos los campos de la tabla, en el resultado de la consulta.*/

select * from clientes_neptuno where IDCliente LIKE 'C%';

/*13. De la tabla CLIENTES_NEPTUNO, obtener una lista de todos aquellos clientes que residan en una ciudad que
comience con la letra B y en total posea 5 caracteres. Mostrar todos los campos de la tabla en el resultado de la consulta.*/

select * from clientes_neptuno where Ciudad LIKE 'B____';

/*14. De la tabla NACIMIENTOS, obtener una lista de aquellos registros en donde la cantidad total de hijos sea superior a 10.*/

select * from nacimientos where HIJOS_TOTAL > 10;


# PARTE 3 / MÓDULO 3

-- Etapa 3.1: Respaldar Base de Datos

/*1. Generar un backup de la base de datos LABORATORIO (completa) en un único archivo llamado BACKUP LABORATORIO
BD. Este archivo de respaldo debe generarse en el Escritorio de Windows. Finalizado el proceso, verificar que el archivo
de respaldo se haya generado antes de continuar con los siguientes puntos.*/

-- https://drive.google.com/file/d/19B3xInMuPbdyFomfGJ9Z4bJ0OctUyhRk/view?usp=sharing 

/*2. Eliminar la base de datos LABORATORIO.*/

-- drop database laboratorio;

/*3. Restaurar el archivo BACKUP LABORATORIO BD. Verificar, después de la restauración, que se haya generado la base de datos.*/

-- https://drive.google.com/file/d/1X7sXApWsSzHEL1lOp6nyWBShlT1iFoCe/view?usp=sharing

-- Etapa 3.2: Funciones integradas de texto

/*1. Utilizar la tabla CLIENTES_NEPTUNO y generar una consulta que muestre las columnas IDCLIENTE y NOMBRECOMPANIA.
En el resultado de la consulta, se debe mostrar una nueva columna llamada UBICACION que concatene las columnas
DIRECCION, CIUDAD y PAIS, separando los valores de estos campos por un guión. Para este primer ejercicio, utilizar la función
CONCAT.*/

use laboratorio;
select IDCliente, NombreCompania, concat(Direccion,' - ',Ciudad,' - ',Pais) Ubicacion from clientes_neptuno;

/*2. Repetir el ejercicio anterior, utilizando la función CONCAT_WS.*/

select IDCliente, NombreCompania, concat_ws(' - ',Direccion, Ciudad,Pais) Ubicacion from clientes_neptuno;

/*3. Modificar el ejercicio anterior para mostrar en mayúsculas los valores cargados en el campo
NOMBRECOMPANIA. Esta columna debe mostrarse con el nombre EMPRESA.*/

select IDCliente, upper(NombreCompania) Empresa, concat_ws(' - ',Direccion, Ciudad,Pais) Ubicacion from clientes_neptuno;

/*4. Modificar el ejercicio anterior para mostrar los valores cargados en el campo IDCLIENTE en
minúsculas. Esta columna debe mostrarse con el nombre CODIGO.*/

select lower(IDCliente) Codigo, upper(NombreCompania) Empresa, concat_ws(' - ',Direccion, Ciudad,Pais) Ubicacion from clientes_neptuno;

/*5. Utilizar la tabla NACIMIENTOS y generar una consulta que muestre la columna FECHA. En
el resultado de la consulta, se debe mostrar una nueva columna con el nombre SEXO que
muestre la inicial de los datos cargados en el campo SEXO y otra columna con el nombre
TIPO que muestre la inicial de los datos cargados en el campo TIPO_PARTO.*/

select FECHA, left(SEXO,1) SEXO, left(TIPO_PARTO,1) TIPO from nacimientos;

/*6. Utilizar la tabla CLIENTES_NEPTUNO y genera una consulta que muestre todos los
campos de la tabla. Agregar una nueva columna a la consulta con el nombre
CODIGO. La misma, debe concatenar la primera letra del campo CIUDAD y la
primera y las 2 últimas letras del campo PAIS. Los datos de esta nueva columna se deben mostrar en mayúsculas.*/

select *, upper(concat(left(Ciudad,1),left(Pais,1),right(Pais,2))) CODIGO from clientes_neptuno;

/*7. Utilizar la tabla NACIMIENTOS y generar una consulta que muestre las 5 primeras columnas de la tabla.
Agregar una nueva columna a la consulta con el nombre MES que tome el mes de nacimiento de los
bebés del campo FECHA. Ordenar el resultado de menor a mayor por los valores de la columna MES.*/

select SEXO,FECHA,TIPO_PARTO,ATENC_PART,LOCAL_PART, substring(FECHA,4,2) MES from nacimientos order by MES;

/*8. Utilizar la tabla NACIMIENTOS y generar una consulta que muestre las siguientes columnas: SEXO, FECHA y
TIPO_PARTO. En el resultado de la consulta, se debe mostrar una nueva columna llamada NACIONALIDAD
donde se reemplazan los valores Chilena de la columna NACIONALIDAD original por Ciudadana.*/

select SEXO,FECHA,TIPO_PARTO, replace(NACIONALIDAD,'Chilena','Ciudadana') NACIONALIDAD from nacimientos;

-- Etapa 3.3: Funciones integradas de fecha

/*1. Utilizando la tabla PEDIDOS_NEPTUNO, obtener una lista de todos aquellos pedidos efectuados a lo largo del año 1998.*/

select * from pedidos_neptuno where year(FechaPedido) = 1998;

/*2. Utilizando la tabla PEDIDOS_NEPTUNO, obtener una lista de todos aquellos pedidos
efectuados durante los meses de agosto y septiembre del año 1997.*/

select * from pedidos_neptuno where month(FechaPedido) in (08, 09) and year(FechaPedido) = 1997;

/*3. Utilizando la tabla PEDIDOS_NEPTUNO, obtener una lista de todos aquellos pedidos
efectuados el primer día de cada mes de cualquier año.*/

select * from pedidos_neptuno where day(FechaPedido) = 1;

/*4. Utilizar la tabla PEDIDOS_NEPTUNO y obtener una lista de todos los registros
contenidos en la tabla. En una nueva columna llamada DIAS TRANSCURRIDOS,
mostrar la cantidad de días transcurridos desde la fecha en que fue realizado cada pedido, al día de hoy.*/

select *, datediff(curdate(),FechaPedido) 'DÍAS TRANSCURRIDOS' from pedidos_neptuno;

/*5. Modifica la consulta anterior y agregar otra columna con el nombre DIA, que refleje el
nombre del día en el que se efectuó cada uno de los pedidos.*/

select *, datediff(curdate(),FechaPedido) 'DÍAS TRANSCURRIDOS', dayname(FechaPedido) DIA from pedidos_neptuno;

/*6. Modificar la consulta anterior, agregando otra columna con el nombre DIA DEL AÑO, que
refleje el número del día del año en el que se efectuó cada uno de los pedidos.*/

select *, datediff(curdate(),FechaPedido) 'DÍAS TRANSCURRIDOS', dayname(FechaPedido) DIA, dayofyear(FechaPedido)
 'DÍA DEL AÑO' from pedidos_neptuno;

/*7. Modificar la consulta anterior y agregar otra columna con el nombre MES, que refleje el
nombre del mes del año en el que se efectuó cada uno de los pedidos.*/

select *, datediff(curdate(),FechaPedido) 'DÍAS TRANSCURRIDOS', dayname(FechaPedido) DIA, dayofyear(FechaPedido)
 'DÍA DEL AÑO', monthname(FechaPedido) MES from pedidos_neptuno;

/*8. Modificar la consulta anterior y agregar otra columna llamada PRIMER VENCIMIENTO
que calcule el primer vencimiento de cada factura, suponiendo que dicho vencimiento
es a los 30 días de haber sido emitida, en la fecha de pedido.*/

select *, datediff(curdate(),FechaPedido) 'DÍAS TRANSCURRIDOS', dayname(FechaPedido) DIA, dayofyear(FechaPedido)
 'DÍA DEL AÑO', monthname(FechaPedido) MES, adddate(FechaPedido, interval 30 day) 'PRIMER_VENCIMIENTO' from pedidos_neptuno;

/*9. Modificar la consulta anterior y agregar otra columna llamada SEGUNDO VENCIMIENTO
que calcule el segundo vencimiento de cada factura, suponiendo que dicho vencimiento
es a los 2 meses de haber sido emitida.*/

select *, datediff(curdate(),FechaPedido) 'DÍAS TRANSCURRIDOS', dayname(FechaPedido) DIA, dayofyear(FechaPedido) 
'DÍA DEL AÑO', monthname(FechaPedido) MES, adddate(FechaPedido, interval 30 day) 'PRIMER_VENCIMIENTO', 
 adddate(FechaPedido, interval 2 month) 'SEGUNDO VENCIMIENTO'
 from pedidos_neptuno;

-- Etapa 3.4: Funciones matemáticas integradas

/*1. Utilizar la tabla PEDIDOS_NEPTUNO y obtener una lista de todos los registros cargados en la tabla. Generar una nueva
columna con el nombre IVA que calcule el 21% del cargo de cada pedido, obteniendo un valor numérico que, como máximo,
contenga 2 decimales.*/

select *, round((Cargo * 0.21),2) IVA from pedidos_neptuno;

/*2. Modificar la consulta anterior, agregando una nueva columna con el nombre NETO, que calcule el total a pagar por cada cliente por
las compras realizadas (es decir, sumándole el IVA al cargo original, manteniendo como máximo 2 decimales).*/

select *, round((Cargo * 0.21),2) IVA, round((Cargo * 1.21),2) NETO from pedidos_neptuno;

/*3. Modificar la consulta anterior, agregando una nueva columna con el nombre REDONDEO A FAVOR CLIENTE que devuelva el valor entero
inferior del neto calculado anteriormente.*/

select *, round((Cargo * 0.21),2) IVA, round((Cargo * 1.21),2) NETO, floor(Cargo * 1.21) 'REDONDEO A FAVOR CLIENTE' from pedidos_neptuno;

/*4. Modificar la consulta anterior, agregando una nueva columna con el nombre REDONDEO A FAVOR EMPRESA que devuelva el valor
entero superior del neto antes calculado.*/

select *, round((Cargo * 0.21),2) IVA, round((Cargo * 1.21),2) NETO, floor(Cargo * 1.21) 'REDONDEO A FAVOR CLIENTE',
ceil(Cargo * 1.21) 'REDONDEO A FAVOR EMPRESA' from pedidos_neptuno;

-- Etapa 3.5: Funciones de agregado - agrupamiento

/*1. Calcular la cantidad de registros cargados en la tabla PEDIDOS_NEPTUNO.*/

select count(*) 'Cant. registros' from pedidos_neptuno;

/*2. Calcular la cantidad de pedidos cargados en la tabla PEDIDOS_NEPTUNO que hayan sido
entregados por el transportista con el nombre SPEEDY EXPRESS. La columna en la que se
obtiene el resultado debe mostrarse con el nombre ENTREGAS SPEEDY EXPRESS.*/

select count(*) 'ENTREGAS SPEEDY EXPRESS' from pedidos_neptuno where Transportista = 'Speedy Express';

/*3. Calcular la cantidad de pedidos cargados en la tabla PEDIDOS_NEPTUNO que hayan sido atendidos por empleados cuyo apellido
comience con la letra C. La columna en la que se obtiene el resultado debe mostrarse con el nombre VENTAS.*/

select count(*) 'VENTAS' from pedidos_neptuno where Empleado LIKE 'C%';

/*4. Calcular el precio promedio de todos los productos cargados en la tabla llamada PRODUCTOS_NEPTUNO. La columna del
resultado, debe mostrarse con el nombre PRECIO PROMEDIO. El resultado debe mostrar, como máximo, sólo 2 decimales.*/

select round(avg(PrecioUnidad),2) 'PRECIO PROMEDIO' from productos_neptuno;

/*5. Modificar la consulta anterior para obtener el precio más bajo de la tabla. La columna en
la que se obtiene el resultado debe mostrarse con el nombre PRECIO INFERIOR.*/

select min(PrecioUnidad) 'PRECIO INFERIOR' from productos_neptuno;

/*6. Modificar la consulta anterior para obtener el precio más alto de la tabla. La nueva
columna debe mostrarse con el nombre PRECIO MAXIMO.*/

select max(PrecioUnidad) 'PRECIO MÁXIMO' from productos_neptuno;

/*7. Generar una consulta en base a la tabla PRODUCTOS_NEPTUNO que muestre el precio más alto correspondiente a cada
categoría. La columna en la que se obtiene dicho precio debe mostrarse con el nombre PRECIO MAXIMO. La columna que muestra
las categorías debe mostrarse con el nombre CATEGORIA.*/

select NombreCategoria CATEGORIA, max(PrecioUnidad) 'PRECIO MÁXIMO' from productos_neptuno group by CATEGORIA;

/*8. Calcular la cantidad de entregas efectuadas por cada transportista, utilizando la tabla PEDIDOS_NEPTUNO. La columna en la que
se obtienen los resultados debe mostrarse con el nombre ENTREGAS.*/

select Transportista, count(*) ENTREGAS from pedidos_neptuno group by Transportista;

/*9. Utilizar la tabla NACIMIENTOS y calcular la cantidad de nacimientos según el sexo de los bebés. La columna en la que se obtienen
los resultados debe mostrarse con el nombre NACIMIENTOS.*/

select SEXO, count(*) NACIMIENTOS from nacimientos group by SEXO;

/*10. Utilizando la tabla PEDIDOS_NEPTUNO, calcular el total de gastos por cliente. La columna en la que se obtienen los resultados
debe mostrarse con el nombre TOTAL GASTOS y debe mostrar como máximo 2 decimales. La columna en la que figuran los
nombres de los clientes debe tener el título CLIENTE.*/

select NombreCompania CLIENTE, round(sum(Cargo),2) 'TOTAL GASTOS' from pedidos_neptuno group by CLIENTE;

/*11. Utilizando la tabla PRODUCTOS, calcular la cantidad de productos pertenecientes a cada
sección. La columna en la que se obtienen los resultados debe mostrarse con el nombre CANTIDAD. Ordenar la consulta de mayor
a menor según los valores de la columna CANTIDAD.*/

select SECCION, count(*) CANTIDAD from productos group by SECCION order by CANTIDAD desc;

/*12. Utilizar la tabla PEDIDOS_NEPTUNO y calcular la cantidad de ventas efectuadas por mes y año. Las columnas deben
mostrarse con los nombres AÑO, MES y VENTAS respectivamente. Ordenar el resultado por año y mes, para obtener
un listado cronológico de las ventas.*/

select year(FechaPedido) AÑO, month(FechaPedido) MES, count(*) VENTAS from pedidos_neptuno group by AÑO, MES order by AÑO,MES;

/*13. Utilizar la tabla PEDIDOS_NEPTUNO y calcular las siguientes estadísticas:

	a. El total facturado por empleado.
	b. El promedio de facturación por empleado.
	c. La mejor venta efectuada por cada empleado.
	d. La peor venta efectuada por cada empleado.
	e. La cantidad de ventas efectuadas por cada empleado.
	f. Tener en cuenta las siguientes especificaciones: las columnas deben recibir los nombres FACTURACION, PROMEDIO,
	   MEJOR VENTA, PEOR VENTA y VENTAS. Las columnas llamadas FACTURACION y PROMEDIO deben mostrar, como máximo, 2 decimales.*/
       
select Empleado, round(sum(Cargo),2) 'FACTURACION' from pedidos_neptuno group by Empleado;
select Empleado, round(avg(Cargo),2) 'PROMEDIO' from pedidos_neptuno group by Empleado;
select Empleado,  max(Cargo) 'MEJOR VENTA' from pedidos_neptuno group by Empleado;
select Empleado,  min(Cargo) 'PEOR VENTA' from pedidos_neptuno group by Empleado;
select Empleado,  count(*) 'VENTAS' from pedidos_neptuno group by Empleado;


# PARTE 4 / MÓDULO 4

-- Etapa 4.1: Consulta de creación de tabla

use laboratorio;

/*1. Generar, a partir de la tabla NACIMIENTOS, una nueva tabla con el nombre VARONES con todos los campos de la tabla original y
copia en esta nueva tabla todos los registros en los que figure el sexo MASCULINO. Al ejecutar la consulta, debería generarse la
tabla con 98.397 filas. No olvidar actualizar los esquemas para verificar la creación de la tabla dentro de la base de datos.*/

create table VARONES select * from nacimientos where SEXO = 'Masculino';

/*2. Generar, a partir de la tabla NACIMIENTOS, una nueva tabla con el nombre MUJERES con todos los campos de la tabla original y copiar
en esta nueva tabla todos los registros en los que figure el sexo FEMENINO. Al ejecutar la consulta, debería generarse la tabla con
94.763 filas. Actualizar los esquemas para verificar la creación de la tabla dentro de la base de datos.*/

create table MUJERES select * from nacimientos where SEXO = 'Femenino';

/*3. Generar, a partir de la tabla NACIMIENTOS, una nueva tabla con el nombre INDETERMINADOS con todos los
campos de la tabla original y copiar en esta nueva tabla todos los registros en los que figure el sexo
INDETERMINADO. Al ejecutar la consulta, debería generarse la tabla con 24 filas. No olvidar actualizar
los esquemas para verificar la creación de la tabla dentro de la base de datos.*/

create table INDETERMINADOS select * from nacimientos where SEXO = 'Indeterminado';

/*4. Eliminar la tabla NACIMIENTOS.*/

drop table nacimientos;

-- Etapa 4.2: Consulta de actualización

SET SQL_SAFE_UPDATES = 0;

/*1. Actualizar la tabla CLIENTES_NEPTUNO. Cuando figure el valor ESTADOS UNIDOS en el campo PAIS, cambiar dicho valor por USA.
Para verificar el cambio realizado, mostrar el contenido de la tabla CLIENTES_NEPTUNO.*/

update clientes_neptuno set Pais = 'USA' where Pais = 'Estados Unidos';
select * from clientes_neptuno;

/*2. Actualizar la tabla CLIENTES_NEPTUNO para mostrar todos los valores del campo NOMBRECOMPANIA en mayúsculas. Para
verificar el cambio realizado, mostrar el contenido de la tabla CLIENTES_NEPTUNO.*/

update clientes_neptuno set NombreCompania = upper(NombreCompania);
select * from clientes_neptuno;

/*3. Actualizar la tabla CLIENTES_NEPTUNO para mostrar todos los valores de los campos CIUDAD y PAIS en mayúsculas. Mostrar el
contenido de la tabla CLIENTES_NEPTUNO para verificar el cambio llevado a cabo.*/

update clientes_neptuno set Ciudad = upper(Ciudad), Pais = upper(Pais);
select * from clientes_neptuno;

/*4. En la tabla EMPLEADOS generar una nueva columna llamada NOMBRE_EMPLEADO que admita cadenas de texto con un máximo
de 30 caracteres. Ubica esta columna a la derecha del campo IDEMPLEADO. Completar esta nueva columna concatenando los
valores cargados en los campos APELLIDOS y NOMBRE, separando dichos valores por una coma y un espacio. Eliminar las
columnas APELLIDOS y NOMBRE. Mostrar el contenido de la tabla EMPLEADOS para verificar el cambio llevado a cabo.*/

alter table empleados add column NOMBRE_EMPLEADO varchar(30) after IdEmpleado;
update empleados set NOMBRE_EMPLEADO = concat(apellidos,', ',nombre);
alter table empleados drop column apellidos, drop column nombre;
select * from empleados;

/*5. En la tabla CLIENTES generar una nueva columna con el nombre TIPO que admita cadenas de texto con un máximo de 3
caracteres. Esta columna debe ubicarse al final de la tabla. Completar esta nueva columna estableciendo el valor VIP para
todos aquellos clientes que residan en la ciudad de MADRID. Para verificar el cambio llevado a cabo, mostrar el contenido de la
tabla CLIENTES.*/

alter table clientes add column TIPO varchar(3);
update clientes set TIPO = 'VIP' where CIUDAD = 'MADRID';
select * from clientes;

/*6. Dado que todos los clientes que figuran en la tabla CLIENTES residen en España, agregar el prefijo '+34 ' a cada uno de los teléfonos
que figuran en el campo TELEFONO. En caso de que un cliente no tuviera el teléfono cargado, a ese teléfono no se le debería
agregar el prefijo. Mostrar el contenido de la tabla CLIENTES para verificar el cambio realizado (Este campo es de tipo INT, por lo tanto,
no admitirá el agregado del prefijo, tal como se especifica en el ejercicio. Deberás cambiar el tipo de dato de este campo).*/

alter table clientes modify TELEFONO varchar(13);
update clientes set TELEFONO = concat('+34 ',TELEFONO) where TELEFONO IS NOT NULL;
select * from clientes;

/*7. En la tabla PRODUCTOS generar una nueva columna con el nombre FECHA que admita la carga de fechas. Completar la nueva columna
con fechas coherentes, concatenando los campos DIA, MES y ANO. Cargados los datos en la nueva columna, eliminar las columnas
originales (DIA, MES y ANO). Además, actualizar el campo ORIGEN de manera que, donde figure el valor ESPANA, sea reemplazado
por ESPAÑA. Mostrar el contenido de la tabla PRODUCTOS para verificar el cambio llevado a cabo.*/

alter table productos add column FECHA date;
update productos set FECHA = concat_ws('-',ANO,MES,DIA);
alter table productos drop column DIA, drop column MES, drop column ANO;
update productos set ORIGEN = 'ESPAÑA' where ORIGEN = 'ESPANA';
select * from productos;

/* 8. Actualizar el campo SUSPENDIDO de la tabla PRODUCTOS_NEPTUNO de manera que:

	a. Donde figure el valor 0, éste se reemplace por la palabra NO.
	b. Donde figure el valor 1, éste se reemplace por la palabra SI.
	c. Tener en cuenta que el campo SUSPENDIDO es de tipo INT actualmente. Cambiar el tipo de dato para
	   que admita el reemplazo.
	d. Para verificar el cambio llevado a cabo, mostrar el contenido de la tabla PRODUCTOS_NEPTUNO.*/

alter table productos_neptuno modify Suspendido char(2);
update productos_neptuno set Suspendido = if(Suspendido = '0', 'NO', 'SI');
select * from productos_neptuno;

/*9. Actualizar los precios de todos los productos de la tabla PRODUCTOS_NEPTUNO, recargándolos un 10% y manteniendo un
total de 2 decimales para cada uno de los precios. Mostrar el contenido de la tabla PRODUCTOS_NEPTUNO para verificar el
cambio llevado a cabo.*/

update productos_neptuno set PrecioUnidad = round(PrecioUnidad * 1.10,2);
select * from productos_neptuno;

/*10. Observar la tabla PROVEEDORES y su contenido. Para todos aquellos proveedores que no tengan cargado un valor en el campo
REGION, mostrar el valor NULL en dicho campo. Mostrar el contenido de la tabla PROVEEDORES para verificar el cambio llevado a cabo.*/

update proveedores set Region = null where Region = '';
select * from proveedores;

/*11. Observar el contenido de la tabla CLIENTES. Actualizar el campo CIUDAD de manera que todos los valores cargados en esta columna
muestren la primera letra en mayúsculas y el resto en minúsculas. Mostrar el contenido de la tabla CLIENTES para verificar el
cambio llevado a cabo.*/

update clientes set ciudad = concat(upper(left(ciudad,1)), lower(substring(ciudad, 2, length(ciudad))));
select * from clientes;

/*12. Generar una nueva tabla con el nombre PRODUCTOS_SUSPENDIDOS a partir de la tabla PRODUCTOS_NEPTUNO. Volcar en esta nueva tabla
todos los campos de la tabla PRODUCTOS_NEPTUNO, pero sólo aquellos registros en los que en el campo SUSPENDIDO figure la palabra SI.
Mostrar el contenido de la tabla PRODUCTOS_SUSPENDIDOS una vez generada. La nueva tabla debería contener 8 productos (registros).*/

create table PRODUCTOS_SUSPENDIDOS select * from productos_neptuno where Suspendido = 'SI';
select * from PRODUCTOS_SUSPENDIDOS;

-- Etapa 4.3: Consulta de datos anexados

/*1. Desde ahora, todos los productos provistos por el proveedor 1 pasan a estar suspendidos por tiempo indeterminado. Por lo tanto:

	a. Ejecutar una consulta de actualización por la que, todos los productos de la tabla PRODUCTOS_NEPTUNO que pertenecen
	   al proveedor cuyo IDPROVEEDOR sea el número 1 pasen a mostrar el valor SI en el campo SUSPENDIDO.
	b. Ejecutar una consulta de datos anexados por la que, todos los productos que ahora se encuentran suspendidos en la tabla
	   PRODUCTOS_NEPTUNO se copien en la tabla PRODUCTOS_SUSPENDIDOS.   
	c. Ejecutar una consulta de eliminación por la que, todos los productos de la tabla PRODUCTOS_NEPTUNO que fueron
	   copiados, se eliminen de la tabla PRODUCTOS_SUSPENDIDOS.*/

update productos_neptuno set Suspendido = 'SI' where IdProveedor = 1;
insert into productos_suspendidos select * from productos_neptuno where IdProveedor = 1;
select * from productos_suspendidos;

-- Etapa 4.4: Consulta de eliminación

/*1. En la etapa anterior, se creó una tabla nueva con el nombre PRODUCTOS_SUSPENDIDOS y se copió en ella, todos los productos que se
encontraban suspendidos de la tabla PRODUCTOS_NEPTUNO. Sin embargo, estos registros se copiaron de una tabla a la otra;
es decir, aún se encuentran cargados en la tabla PRODUCTOS_NEPTUNO. Por lo tanto, llevar a cabo una consulta
de eliminación por la que los productos suspendidos se eliminen de la tabla PRODUCTOS_NEPTUNO. Al ejecutar esta
consulta deberían eliminarse de la tabla PRODUCTOS_NEPTUNO 11 registros.*/

delete from productos_neptuno where Suspendido = 'SI';

# PARTE 5 / MÓDULO 5

-- Etapa 5.1: Subconsultas

/*1. Utilizando la tabla PRODUCTOS_NEPTUNO, obtener una lista de todos aquellos productos cuyo precio supere el precio promedio. Esta
debe contener todos los campos de la tabla. Por último, ordenar alfabéticamente el resultado según los nombres de los productos.*/

select * from productos_neptuno where PrecioUnidad > (select avg(PrecioUnidad) from productos_neptuno) order by NombreProducto;

/*2. Tomando la tabla PRODUCTOS_NEPTUNO, obtener una lista de todos aquellos productos cuyo precio sea superior al producto más
caro de la tabla PRODUCTOS_SUSPENDIDOS. Esta debe contener todos los campos de la tabla. Luego, ordenar el resultado de mayor a
menor de acuerdo con los precios obtenidos.*/ 

select * from productos_neptuno where PrecioUnidad > (select max(PrecioUnidad) from productos_suspendidos) order by PrecioUnidad desc;

/*3. Utilizando la tabla VARONES, obtener una lista de todos aquellos bebés que hayan nacido con una cantidad de semanas de
gestación menor que el bebé de sexo indeterminado con menor gestación. La lista debe mostrar todos los campos de la tabla.*/

select * from varones where SEMANAS < (select min(SEMANAS) from indeterminados);

/*4. Dada la tabla PRODUCTOS_NEPTUNO, obtener una lista de todos los productos cuyo nombre comience con la inicial del apellido
del empleado cuyo IDEMPLEADO es el número 8. Esta debe mostrar todos los campos de la tabla PRODUCTOS_NEPTUNO
y se debe ordenar alfabéticamente según los nombres de los productos.*/

select * from productos_neptuno where NombreProducto like concat((select left(NOMBRE_EMPLEADO,1) from empleados where IdEmpleado = 8),'%')
order by NombreProducto;

/*5. Utilizando la tabla PRODUCTOS_NEPTUNO, obtener una lista de todos los productos que pertenezcan al proveedor con el ID más alto.
La lista debe mostrar todos los campos de la tabla PRODUCTOS_NEPTUNO y debe ordenarse alfabéticamente por los nombres de los productos.*/

select * from productos_neptuno where IdProveedor = (select max(IdProveedor) from productos_neptuno) order by NombreProducto;

/*6. Dada la tabla PRODUCTOS_NEPTUNO, extraer una lista de todos aquellos productos que pertenezcan a la categoría BEBIDAS y
cuyo precio sea superior al producto más caro de la categoría CONDIMENTOS. La lista debe mostrar todos los campos de la tabla.*/

select * from productos_neptuno where NombreCategoria = 'Bebidas' and PrecioUnidad > (select max(PrecioUnidad) from productos_neptuno
where NombreCategoria = 'Condimentos');

/*7. A partir de la tabla MUJERES, obtener una lista de todas aquellas bebas que hayan nacido de madres con una edad superior a
la madre más longeva que figure en la tabla VARONES. La lista debe mostrar todos los campos de la tabla MUJERES.*/

select * from mujeres where EDAD_MADRE > (select max(EDAD_MADRE) from varones);

/*8. Utilizando la tabla CLIENTES_NEPTUNO, extraer una lista de todos los clientes que hayan realizado compras
por un cargo superior a 500 dólares. La lista debe mostrar los campos NOMBRECOMPANIA, CIUDAD y
PAÍS y debe estar ordenada alfabéticamente por los nombres de las compañías.*/

select NombreCompania, Ciudad, Pais from clientes_neptuno where NombreCompania in (select distinct NombreCompania from pedidos_neptuno where Cargo > 500)
order by Nombrecompania;

-- Etapa 5.2: Condicional CASE

/*1. Utilizando la tabla CLIENTES_NEPTUNO, generar una consulta que muestre los campos IDCLIENTE, NOMBRECOMPANÍA, CIUDAD
y PAÍS. Agregar una columna cuyo nombre sea CONTINENTE, en la que se muestren los siguientes valores:

a. América del Norte si el cliente está radicado en México, Canadá o USA.
b. América del Sur si el cliente está radicado en Argentina, Brasil o Venezuela.
c. Europa en el caso de que no se cumplan ninguna de las condiciones anteriores.

Ordenar el resultado alfabéticamente por los campos CONTINENTE y PAÍS.*/

select IDCliente, NombreCompania, Ciudad, Pais, case
													when Pais in('México', 'Canadá', 'USA') then 'América del Norte'
                                                    when Pais in('Argentina', 'Brasil', 'Venezuela') then 'América del Sur'
                                                    else 'Europa' end
                                                    CONTINENTE from clientes_neptuno order by CONTINENTE, Pais;

/*2. Utilizar la tabla PEDIDOS_NEPTUNO, generar una consulta que muestre los campos IDPEDIDO, NOMBRECOMPAÑÍA,
FECHAPEDIDO y CARGO. Luego, agregar una columna llamada EVALUACIÓN en la que se muestren los siguientes valores:

a. EXCELENTE si el cargo supera los 700 dólares.
b. MUY BUENO si el cargo oscila entre 500 y 700 dólares.
c. BUENO si el cargo oscila entre 250 y 500 dólares.
d. REGULAR si el cargo oscila entre 50 y 250 dólares.
e. MALO si el cargo es inferior a 50 dólares.

Por último, ordenar el resultado de mayor a menor según los cargos de cada pedido.*/

select IdPedido, NombreCompania, FechaPedido, Cargo, case
														when Cargo > 700 then 'EXCELENTE'
                                                        when Cargo between 500 and 700 then 'MUY BUENO'
                                                        when Cargo between 250 and 500 then 'BUENO'
                                                        when Cargo between 50 and 250 then 'REGULAR'
                                                        else 'MALO' end
                                                        EVALUACIÓN from pedidos_neptuno order by Cargo desc;

/*3. Utilizando la tabla PRODUCTOS_NEPTUNO, generar una consulta que muestre los campos IDPRODUCTO, NOMBREPRODUCTO,
NOMBRECATEGORÍA y PRECIOUNIDAD. Agregar una columna con el nombre TIPO en la que se muestren los siguientes valores:

a. DELUXE si el precio del producto supera los 100 dólares.
b. REGULAR si el precio del producto oscila entre 10 y 100 dólares.
c. ECONÓMICO si el precio del producto es inferior a los 10 dólares.

Por último, ordenar los productos de mayor a menor según sus precios.*/

select IdProducto, NombreProducto, NombreCategoria, PrecioUnidad, case
																	when PrecioUnidad > 100 then 'DELUXE'
                                                                    when PrecioUnidad between 10 and 100 then 'REGULAR'
                                                                    else 'ECONÓMICO' end
                                                                    TIPO from productos_neptuno order by PrecioUnidad desc;

-- Etapa 5.3: Combinación de consultas

/*1. Obtener una lista de todos aquellos bebés nacidos con menos de 20 semanas de gestación. La lista mostrará los bebés de
cualquier sexo, por lo tanto, la consulta se debe llevar a cabo en las tablas VARONES, MUJERES e INDETERMINADOS.*/

select * from varones where SEMANAS < 20 union select * from mujeres where SEMANAS < 20 union select * from indeterminados where SEMANAS < 20; 

/*2. Luego, obtener una lista de todos aquellos bebés nacidos durante el mes de septiembre, con más de 40 semanas de gestación y
nacidos de madres chilenas casadas. La lista debe mostrar los bebés de cualquier sexo, por lo tanto, debe llevar adelante la
consulta en las tablas VARONES, MUJERES e INDETERMINADOS.*/

select * from varones where substring(FECHA,4,2) = 09 and SEMANAS > 40 and NACIONALIDAD = 'Chilena' and ESTADO_CIVIL_MADRE = 'Casada'
union
select * from mujeres where substring(FECHA,4,2) = 09 and SEMANAS > 40 and NACIONALIDAD = 'Chilena' and ESTADO_CIVIL_MADRE = 'Casada'
union
select * from indeterminados where substring(FECHA,4,2) = 09 and SEMANAS > 40 and NACIONALIDAD = 'Chilena' and ESTADO_CIVIL_MADRE = 'Casada';

/*3. Obtener una lista de todos aquellos productos (a la venta y suspendidos) cuyo precio supere los 80 dólares. La búsqueda se
debe llevar a cabo en las tablas PRODUCTOS_NEPTUNO y PRODUCTOS_SUSPENDIDOS. Después, ordenar el resultado alfabéticamente según
los nombres de los productos.*/

select * from productos_neptuno where PrecioUnidad > 80 union select * from productos_suspendidos where PrecioUnidad > 80 
order by NombreProducto;

/*4. Modificar la consulta anterior y agregar una columna con el nombre CONDICIÓN en la que se muestre el texto “A LA VENTA” en el
caso de que el registro provenga de la tabla PRODUCTOS_NEPTUNO; o que se muestre el texto SUSPENDIDO si el registro proviene
de la tabla PRODUCTOS_SUSPENDIDOS.*/

select *, 'A LA VENTA' CONDICIÓN from productos_neptuno where PrecioUnidad > 80 union select *,'SUSPENDIDO' CONDICIÓN from productos_suspendidos where PrecioUnidad > 80 
order by NombreProducto;

/*5. Generar una lista de todos los productos que pertenezcan a la categoría BEBIDAS, sin importar si los mismos se encuentran a
la venta o suspendidos (la búsqueda se debe hacer en las tablas PRODUCTOS_NEPTUNO y la tabla PRODUCTOS_SUSPENDIDOS).
Luego, ordenar la lista alfabéticamente según los nombres de los productos.*/

select * from productos_neptuno where NombreCategoria = 'Bebidas' union select * from productos_suspendidos where NombreCategoria = 'Bebidas' 
order by NombreProducto;

/*6. Duplicar el producto cuyo ID es el número 43 de la tabla PRODUCTOS_NEPTUNO en la tabla PRODUCTOS_SUSPENDIDOS a
través de una consulta de datos anexados.*/

insert into productos_suspendidos select * from productos_neptuno where IdProducto = 43;
insert into productos_suspendidos select * from productos_neptuno where IdProducto = 43;

/*7. Repetir la consulta generada en el paso 5 (cinco) para observar que la cantidad de productos obtenida siga siendo la misma.*/

select * from productos_neptuno where NombreCategoria = 'Bebidas' union select * from productos_suspendidos where NombreCategoria = 'Bebidas' 
order by NombreProducto;

/*8. Modificar la consulta del paso 5 (cinco) para mostrar el producto duplicado.*/

select * from productos_neptuno where NombreCategoria = 'Bebidas' union all select * from productos_suspendidos where NombreCategoria = 'Bebidas' 
order by NombreProducto;

/*9. Eliminar el producto cuyo ID es el número 43 de la tabla PRODUCTOS_SUSPENDIDOS.*/

delete from productos_suspendidos where IdProducto = 43;

-- Etapa 5.4: Consultas relacionadas

/*1. Generar una tabla con el nombre EQUIPOS, en la que sólo se cree un campo cuyo nombre sea EQUIPO. Este campo debe ser de tipo
VARCHAR, almacenar hasta 20 caracteres y debe ser PRIMARY KEY de la tabla.*/

create table EQUIPOS (EQUIPO varchar(20) Primary Key);

/*2. Luego, cargar los nombres de las siguientes selecciones en la tabla EQUIPOS: ARGENTINA, BRASIL, PARAGUAY, CHILE,
URUGUAY, COLOMBIA, ECUADOR, PERÚ, BOLIVIA, VENEZUELA.*/

insert into equipos values ('ARGENTINA'),('BRASIL'),('PARAGUAY'),('CHILE'),('URUGUAY'),('COLOMBIA'),('ECUADOR'),('PERÚ'), ('BOLIVIA'),('VENEZUELA');

/*3. Generar un producto cartesiano en base a la misma tabla, para lograr un fixture en el cual cada selección juegue con las otras
selecciones (un partido como local y otro como visitante). Ordenar alfabéticamente el resultado, según el nombre del equipo local.*/

select * from equipos L, equipos V where L.equipo <> V.equipo order by L.equipo;

/*4. Crear un producto cartesiano restringido por el que se unan las tablas PRODUCTOS NEPTUNO y EMPLEADOS. Luego, mostrar
en el resultado de la consulta los siguientes campos IDPRODUCTO, NOMBREPRODUCTO y NOMBRE_EMPLEADO y sólo aquellas filas
en las que el IDPRODUCTO coincida con el IDEMPLEADO.*/

select productos_neptuno.IdProducto, productos_neptuno.NombreProducto, empleados.NOMBRE_EMPLEADO from productos_neptuno, empleados
where productos_neptuno.IdProducto = empleados.IdEmpleado;

-- Etapa 5.5: Otros tipos de JOIN

/*1. Generar un listado en el que se muestre el campo NOMBRECONTACTO de la tabla PROVEEDORES y los campos IDPRODUCTO,
NOMBREPRODUCTO y PRECIOUNIDAD de la tabla PRODUCTOS NEPTUNO. Generar el JOIN a través de la cláusula FROM. Después,
ordenar el resultado alfabéticamente por los nombres de los contactos y cuando el nombre del contacto (nombre del proveedor) se repita,
ordena los productos, también de manera alfabética, provistos por el proveedor.*/

select proveedores.NombreContacto, productos_neptuno.IdProducto, productos_neptuno.NombreProducto, productos_neptuno.PrecioUnidad
from proveedores join productos_neptuno on proveedores.IdProveedor = productos_neptuno.IdProveedor
order by proveedores.NombreContacto, productos_neptuno.NombreProducto;

/*2. Modificar la consulta anterior para generar el JOIN a través de la cláusula WHERE.*/

select proveedores.NombreContacto, productos_neptuno.IdProducto, productos_neptuno.NombreProducto, productos_neptuno.PrecioUnidad
from proveedores, productos_neptuno where proveedores.IdProveedor = productos_neptuno.IdProveedor
order by proveedores.NombreContacto, productos_neptuno.NombreProducto;

/*3. Crear un listado en la que se muestre el campo EMPRESA de la tabla CLIENTES y los campos NUMERO_PEDIDO, FECHA_PEDIDO
y FORMA_PAGO de la tabla PEDIDOS. Generar el JOIN a través de la cláusula FROM. Luego, ordenar el listado alfabéticamente por
los nombres de las empresas.*/

select clientes.EMPRESA, pedidos.NUMERO_PEDIDO, pedidos.FECHA_PEDIDO, pedidos.FORMA_PAGO from clientes join pedidos on
clientes.COD_CLIENTE = pedidos.CODIGO_CLIENTE order by clientes.EMPRESA;

/*4. Modificar la consulta anterior para mostrar únicamente aquellos clientes que no hayan efectuado ningún pedido.*/

select clientes.EMPRESA, pedidos.NUMERO_PEDIDO, pedidos.FECHA_PEDIDO, pedidos.FORMA_PAGO from clientes left join pedidos on
clientes.COD_CLIENTE = pedidos.CODIGO_CLIENTE where pedidos.NUMERO_PEDIDO IS NULL order by clientes.EMPRESA;

/*5. ¿Existe algún proveedor que en este momento no le esté vendiendo ningún producto a nuestra empresa? Responder esta pregunta
a través de una consulta en la que utilices las tablas PROVEEDORES y PRODUCTOS NEPTUNO. Mostrar todos los campos de
ambas tablas en el resultado de la consulta.*/

select * from proveedores left join productos_neptuno on proveedores.IdProveedor = productos_neptuno.IdProveedor where productos_neptuno.IdProveedor is null;

-- Existen 2 proveedores que no están vendiendo productos a la empresa actualmente, el proveedor de Id 1, y el de Id 10.

/*6. ¿Existe algún producto que no se sepa quién es el proveedor que lo provee a nuestra empresa? Responder esta pregunta a través
de una consulta en la que utilices las tablas PROVEEDORES y PRODUCTOS NEPTUNO. Puedes mostrar todos los campos de ambas
tablas en el resultado de la consulta.*/

select * from proveedores right join productos_neptuno on proveedores.IdProveedor = productos_neptuno.IdProveedor where proveedores.IdProveedor is null;

-- Existen 5 productos de los que no se tiene información sobre el proveedor. Los Id de los mismos son 31, 32, 45, 46 y 72.
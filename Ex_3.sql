DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

#1
SELECT nombre FROM Producto;

#2
SELECT nombre, precio FROM Producto;

#3
SELECT * FROM Producto;

#4
SELECT nombre,ROUND(precio) Precio FROM Producto;

#5 
SELECt P.codigo_fabricante FROM Producto P;

#6
SELECT DISTINCT P.codigo_fabricante FROM Producto P;

#7
SELECT nombre FROM Fabricante 
ORDER BY nombre ASC;

#8
SELECT nombre, precio FROM Producto
ORDER BY nombre ASC, precio DESC;

#9
SELECT * FROM Fabricante LIMIT 5;

#10
SELECT nombre, precio PrecioBarato FROM Producto
ORDER BY precio ASC LIMIT 1;

#11
SELECT nombre, precio PrecioCaro FROM Producto
ORDER BY precio DESC LIMIT 1;

#12
SELECT nombre, precio FROM Producto
WHERE precio <= 120;

#13
SELECT nombre, precio FROM Producto
WHERE precio BETWEEN 60 AND 200;

#14
SELECT * FROM Producto
WHERE codigo_fabricante IN(1,3,5);

#15
SELECT nombre, precio FROM Producto
WHERE nombre like 'Portatil%';

#16
SELECT P.codigo, P.nombre, F.codigo, F.nombre FROM Producto P
INNER JOIN Fabricante F ON F.codigo = P.codigo_fabricante
ORDER BY P.codigo;

#17
SELECT P.nombre, P.precio, F.nombre FROM Producto P
INNER JOIN Fabricante F ON F.codigo = P.codigo_fabricante
ORDER BY F.nombre;

#18
SELECT P.nombre, P.precio, F.nombre FROM Producto P
INNER JOIN Fabricante F ON F.codigo = P.codigo_fabricante
ORDER BY precio ASC LIMIT 1;

#19
SELECT P.*, F.nombre FROM Producto P
INNER JOIN Fabricante F ON F.codigo = P.codigo_fabricante
WHERE F.nombre = 'Crucial' AND P.precio > 200;

#20
SELECT P.*, F.nombre FROM Producto P
INNER JOIN Fabricante F ON F.codigo = P.codigo_fabricante
WHERE F.nombre IN('Asus', 'Hewlett-Packard');

#21
SELECT P.nombre, P.precio, F.nombre FROM Producto P
INNER JOIN Fabricante F ON F.codigo = P.codigo_fabricante
WHERE P.precio >= 180
ORDER BY P.precio DESC, P.nombre ASC; 

#22
SELECT F.*, P.* FROM Producto P
RIGHT JOIN Fabricante F ON  F.codigo = P.codigo_fabricante;

#23
SELECT F.* FROM Fabricante F
LEFT JOIN Producto P ON  F.codigo = P.codigo_fabricante
WHERE P.codigo_fabricante IS NULL;

#24
SELECT * FROM Producto
WHERE codigo_fabricante = (SELECT codigo FROM Fabricante WHERE nombre = 'Lenovo');

#25
SELECT * FROM Producto
WHERE precio = (SELECT MAX(precio) FROM Producto WHERE codigo_fabricante = (SELECT codigo FROM Fabricante WHERE nombre = 'Lenovo'));

#26
SELECT * FROM Producto
WHERE precio > (SELECT AVG(precio) FROM Producto WHERE codigo_fabricante = (SELECT codigo FROM Fabricante WHERE nombre = 'Asus'));

#27
SELECT nombre FROM Fabricante 
WHERE codigo IN (SELECT codigo_fabricante FROM Producto);

#28
SELECT nombre FROM Fabricante 
WHERE codigo NOT IN (SELECT codigo_fabricante FROM Producto);

#29
SELECT F.nombre, COUNT(P.codigo) CantProductos FROM Fabricante F
INNER JOIN Producto P ON F.codigo = codigo_fabricante 
GROUP BY F.nombre 
HAVING COUNT(P.codigo) >= ( SELECT COUNT(P.codigo) FROM Fabricante F
INNER JOIN Producto P ON F.codigo = codigo_fabricante  WHERE F.nombre = 'Lenovo');

SET GLOBAL time_zone = '-3:00';
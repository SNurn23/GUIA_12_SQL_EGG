DROP DATABASE IF EXISTS personal;
CREATE DATABASE personal CHARACTER SET utf8mb4;
USE personal;

CREATE TABLE departamentos (
id_depto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nombre_depto VARCHAR(20) NOT NULL,
  ciudad VARCHAR(15) NULL,
  cod_director VARCHAR(12) NULL
);


CREATE TABLE empleados (
  id_emp INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre CHAR(30) NOT NULL,
  sex_emp CHAR(1) NOT NULL,
  fec_nac DATE NOT NULL,
  fec_incorporacion DATE NOT NULL,
  sal_emp FLOAT NOT NULL,
  comision_emp FLOAT NOT NULL,
  cargo_emp VARCHAR(15) NOT NULL,
  cod_jefe VARCHAR(12) NULL,  
	id_depto INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_depto) REFERENCES departamentos(id_depto)
  );


-- Insertar datos en la tabla `departamentos`

INSERT INTO `departamentos` VALUES (1000,'GERENCIA','CIUDAD REAL','31.840.269');
INSERT INTO `departamentos` VALUES (1500,'PRODUCCIÓN','CIUDAD REAL','16.211.383');
INSERT INTO `departamentos` VALUES (2000,'VENTAS','CIUDAD REAL','31.178.144');
INSERT INTO `departamentos` VALUES (2100,'VENTAS','BARCELONA','16.211.383');
INSERT INTO `departamentos` VALUES (2200,'VENTAS','VALENCIA','16.211.383');
INSERT INTO `departamentos` VALUES (2300,'VENTAS','MADRID','16.759.060');
INSERT INTO `departamentos` VALUES (3000,'INVESTIGACIÓN','CIUDAD REAL','16.759.060');
INSERT INTO `departamentos` VALUES (3500,'MERCADEO','CIUDAD REAL','22.222.222');
INSERT INTO `departamentos` VALUES (4000,'MANTENIMIENTO','CIUDAD REAL','333.333.333');
INSERT INTO `departamentos` VALUES (4100,'MANTENIMIENTO','BARCELONA','16.759.060');
INSERT INTO `departamentos` VALUES (4200,'MANTENIMIENTO','VALENCIA','16.759.060');
INSERT INTO `departamentos` VALUES (4300,'MANTENIMIENTO','MADRID','16.759.060');

-- Insertar datos en la tabla `empleados`

INSERT INTO `empleados` VALUES (222,'José Giraldo','M','1985-01-20','2000-11-01',1200000,400000,'Asesor','22.222.222',3500);
INSERT INTO `empleados` VALUES (333,'Pedro Blanco','M','1987-10-28','2000-10-01',800000,3000000,'Vendedor','31.178.144',2000);
INSERT INTO `empleados` VALUES (444,'Jesús Alfonso','M','1988-03-14','2000-10-01',800000,3500000,'Vendedor','31.178.144',2000);
INSERT INTO `empleados` VALUES (555,'Julián Mora','M','1989-07-03','2000-10-01',800000,3100000,'Vendedor','31.178.144',2200);
INSERT INTO `empleados` VALUES (666,'Manuel Millán','M','1990-12-08','2004-06-01',800000,3700000,'Vendedor','31.178.144',2300);
INSERT INTO `empleados` VALUES (777,'Marcos Cortez','M','1986-06-23','2000-04-16',2550000,500000,'Mecánico','333.333.333',4000);
INSERT INTO `empleados` VALUES (782,'Antonio Gil','M','1980-01-23','2010-04-16',850000,1500000,'Técnico','16.211.383',1500);
INSERT INTO `empleados` VALUES (219,'Melissa Roa','F','1960-06-19','2001-03-16',2250000,2500000,'Vendedor','31.178.144',2100);
INSERT INTO `empleados` VALUES (111,'Irene Díaz','F','1979-09-28','2004-06-01',1050000,200000,'Mecánico','333.333.333',4200);
INSERT INTO `empleados` VALUES (383,'Luis Pérez','M','1956-02-25','2000-01-01',5050000,0,'Director','31.840.269',1500);
INSERT INTO `empleados` VALUES (060,'Darío Casas','M','1960-04-05','1992-11-01',4500000,500000,'Investigador','31.840.269',3000);
INSERT INTO `empleados` VALUES (802,'William Daza','M','1982-10-09','1999-12-16',2250000,1000000,'Investigador','16.759.060',3000);
INSERT INTO `empleados` VALUES (221,'Carla López','F','1975-05-11','2005-07-16',4500000,500000,'Jefe Mercadeo','31.840.269',3500);
INSERT INTO `empleados` VALUES (331,'Carlos Rozo','M','1975-05-11','2001-09-16',750000,500000,'Vigilante','31.840.269',3500);
INSERT INTO `empleados` VALUES (099,'Diana Solarte','F','1957-11-19','1990-05-16',1250000,500000,'Secretaria','31.840.269',1000);
INSERT INTO `empleados` VALUES (144,'Rosa Angulo','F','1957-03-15','1998-08-16',3250000,3500000,'Jefe Ventas','31.840.269',2000);
INSERT INTO `empleados` VALUES (269,'María Rojas','F','1959-01-15','1990-05-16',6250000,1500000,'Gerente',NULL,1000);
INSERT INTO `empleados` VALUES (343,'Elisa Rojas','F','1979-09-28','2004-06-01',3000000,1000000,'Jefe Mecánicos','31.840.269',4000);
INSERT INTO `empleados` VALUES (334,'Marisol Pulido','F','1979-10-01','1990-05-16',3250000,1000000,'Investigador','16.759.060',3000);
INSERT INTO `empleados` VALUES (335,'Ana Moreno','F','1992-01-05','2004-06-01',1200000,400000,'Secretaria','16.759.060',3000);
INSERT INTO `empleados` VALUES (336,'Carolina Ríos','F','1992-02-15','2000-10-01',1250000,500000,'Secretaria','16.211.383',1500);
INSERT INTO `empleados` VALUES (337,'Edith Muñoz','F','1992-03-31','2000-10-01',800000,3600000,'Vendedor','31.178.144',2100);
INSERT INTO `empleados` VALUES (338,'Abel Gómez','M','1939-12-24','2000-10-01',1050000,200000,'Mecánico','333.333.333',4300);
INSERT INTO `empleados` VALUES (689,'Mario Llano','M','1945-08-30','1990-05-16',2250000,2500000,'Vendedor','31.178.144',2300);
INSERT INTO `empleados` VALUES (785,'Joaquín Rosas','M','1947-07-07','1990-05-16',2250000,2500000,'Vendedor','31.178.144',2200);
INSERT INTO `empleados` VALUES (898,'Iván Duarte','M','1955-08-12','1998-05-16',1050000,200000,'Mecánico','333.333.333',4100);

#1
SELECT * FROM EMPLEADOS;

#2
SELECT * FROM DEPARTAMENTOS;

#3
SELECT nombre_depto Departamento FROM DEPARTAMENTOS;

#4
SELECT nombre Empleado, sal_emp Salario FROM EMPLEADOS;

#5
SELECT comision_emp Comisiones FROM EMPLEADOS;

#6
SELECT * FROM EMPLEADOS
WHERE cargo_emp = 'Secretaria';

#7
SELECT * FROM EMPLEADOS
WHERE cargo_emp = 'Vendedor'
ORDER BY nombre ASC;

#8
SELECT nombre, cargo_emp FROM EMPLEADOS
ORDER BY sal_emp ASC;

#9
SELECT 'Nombre: ', nombre, 'Cargo: ',cargo_emp  FROM EMPLEADOS;

#10
SELECT sal_emp, comision_emp FROM EMPLEADOS
WHERE id_depto = 2000
ORDER BY comision_emp ASC;

#11
SELECT nombre Nombre, (sal_emp+comision_emp+500) TotalAPagar FROM EMPLEADOS
WHERE id_depto = 3000
ORDER BY nombre ASC;

#12
SELECT * FROM EMPLEADOS
WHERE nombre LIKE 'J%';

#13
SELECT sal_emp, comision_emp, (sal_emp + comision_emp) SalarioTotal, nombre FROM EMPLEADOS
WHERE comision_emp > 1000;

#14
SELECT sal_emp, comision_emp, (sal_emp + comision_emp) SalarioTotal, nombre FROM EMPLEADOS
WHERE comision_emp is null or comision_emp = 0;

#15
SELECT * FROM EMPLEADOS
WHERE comision_emp > sal_emp;

#16
SELECT *  FROM EMPLEADOS
WHERE comision_emp <= (sal_emp*0.30);

#17
SELECT * FROM EMPLEADOS
WHERE nombre NOT LIKE '%MA%';

#18
SELECT DISTINCT nombre_depto FROM Departamentos
WHERE nombre_depto NOT IN ('Investigacion','Mantenimiento');

#19
SELECT DISTINCT nombre_depto FROM Departamentos
WHERE nombre_depto NOT IN ('Ventas','Investigacion','Mantenimiento');

#20
SELECT nombre Empleado, sal_emp SalarioMasAlto FROM EMPLEADOS
GROUP BY nombre
HAVING sal_emp = (SELECT MAX(sal_emp)  FROM EMPLEADOS);

#21
SELECT MAX(nombre) Empleado FROM EMPLEADOS;

#22
SELECT MAX(sal_emp) Salario_Maximo , MIN(sal_emp) Salario_Minimo , (MAX(sal_emp) - MIN(sal_emp)) Diferencia 
FROM EMPLEADOS;

#23
SELECT id_depto, ROUND(AVG(sal_emp)) Salario_Promedio FROM EMPLEADOS
GROUP BY id_depto; 

#24
SELECT D.id_depto, D.nombre_depto, count(E.id_depto) N°_Empleados FROM DEPARTAMENTOS D
JOIN EMPLEADOS E 
USING(id_depto)
GROUP BY D.id_depto, D.nombre_depto
HAVING count(E.id_depto) > 3;

#25
SELECT E.cod_jefe , E.nombre, E.cargo_emp, count(D.id_depto) N°_Empleados FROM EMPLEADOS E 
JOIN DEPARTAMENTOS D
USING(id_depto)
WHERE E.cod_jefe  = D.cod_director
GROUP BY  E.cod_jefe , E.nombre, E.cargo_emp
HAVING count(D.id_depto) >= 2;

#26
SELECT D.id_depto, D.nombre_depto FROM DEPARTAMENTOS D
JOIN EMPLEADOS E 
USING(id_depto)
GROUP BY D.id_depto, D.nombre_depto
HAVING count(E.id_depto) = 0;

#27
SELECT * FROM EMPLEADOS E
WHERE E.sal_emp  >= (SELECT AVG(sal_emp) Salario_Promedio FROM EMPLEADOS)
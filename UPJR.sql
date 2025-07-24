/*Creamos la base de datos*/
create database UPJR
/*seleccionamos la BD's para uso*/
use UPJR

create table carrera(
idCarrera varchar(3) primary key not null,
nomCarrera varchar (65))

create table alumno(
matricula varchar (9) primary key not null,
nomAlumno varchar (30),
apPaterno varchar (15),
apMaterno varchar (15),
correo varchar (21),
carrera varchar (3)
)

create table materia
(idMateria varchar (5)primary key not null,
nomMateria varchar (65),
cuatri int,
carrera varchar (3)
);

create table historial(
alumno varchar (9),
materia varchar (5),
calif int,
periodo int
);

create table periodo(
idPeriodo int primary key not null,
nomPeriodo varchar (30))

/*Modificaciones a las tablas*/

/*Agregar el campo carrera a la tabla materia*/

alter table Materia
add carrera varchar (3)

/*Relacion de llave forranea entre carrera y alumno*/

alter table alumno
add constraint FK_CaAl
foreign key (carrera)
references carrera(idcarrera)

/*Relacion de llave forranea entre carrera y materia*/

alter table materia
add constraint FK_CaMa
foreign key (carrera)
references carrera(idcarrera)

/*Relacion de llave forranea entre historial y alumno*/

alter table historial
add constraint FK_HiAl
foreign key (alumno)
references alumno(matricula)

/*Relacion de llave forranea 
entre historial y materia*/

alter table historial
add constraint FK_HiMa
foreign key (materia)
references materia(idMateria)

/*Relacion de llave forranea
entre historial y periodo*/

alter table historial
add constraint FK_HiPe
foreign key (periodo)
references periodo(idPeriodo)

/*insertar informacion en la tabla carrera*/
insert into carrera
(idCarrera,nomCarrera)
values
('A01', 'Ingeneria en Tecnologias de la Informacion e Innovacion Digital'),
('A02', 'Ingeneria en Mecatronica'),
('A03', 'Ingeneria en Financiera'),
('A04', 'Ingenieria de Metalúrgica'),
('A05', 'Ingenieria de Metalúrgica'),
('A06', 'Ingenieria de Industrial'),
('A07', 'Ingenieria de Sistemas Automotrices'),
('A08', 'Ingenieria de Administracion'),
('A01', 'Ingenieria de Manufactura Avanzada')

select * from carrera

insert into alumno
(matricula,nomAlumno,apPaterno,
apMaterno,correo,carrera)
values
('324030159', 'Enrique','Presa', 'Gutierrez','324030159@upjr.edu.mx','A01')

insert into alumno
(matricula,nomAlumno,apPaterno,
apMaterno,correo,carrera)
values
('324030188', 'Cecilia','Butanda', 'Hernandez','324030188@upjr.edu.mx','A08'),
('324030079', 'Diego Imanol','Landeros', 'Cano','324030079@upjr.edu.mx','A02'),
('324030111', 'Jorge Emilio','Granados', 'Duran','324030111@upjr.edu.mx','A03'),
('324030027', 'Fernando','Gutierrez', 'Enriquez','324030027@upjr.edu.mx','A02'),
('324030043', 'Ismael','Ramirez', 'Almanza','324030043@upjr.edu.mx','A06'),
('324030049', 'Alexis','Enriquez', 'Garcia','324030049@upjr.edu.mx','A07'),
('324030115', 'Gael Emiliano','Frias', 'Moreno','324030115@upjr.edu.mx','A01'),
('324030048', 'Osvaldo','Garcia', 'Cano','324030048@upjr.edu.mx','A04'),
('324030085', 'Tadeo Jesús','Peguero', 'Alvarado','324030159@upjr.edu.mx','A05')
AS nuevos(matricula, nomAlumno, apPaterno, apMaterno, correo, carrera)
WHERE NOT EXISTS (
    SELECT 1 FROM alumno a WHERE a.matricula = nuevos.matricula



/*Hacer una consulta donde muestre
nombre del alumno y el nombre de la  carrera,
de los alumnos de ITR*/

select alumno.nomAlumno, alumno.apPaterno, alumno.apMaterno ,carrera.nomCarrera
from alumno inner join carrera
on alumno.carrera = carrera.idCarrera
where idCarrera= 'A01'

select x.nomAlumno, x.apPaterno, x.apMaterno ,y.nomCarrera
from alumno x inner join carrera y
on x.carrera = y.idCarrera
where idCarrera= 'A01'

select * from materia

insert into materia
(idMateria, nomMateria, cuatri,carrera)
values
('ITR01','Fundamentos matemáticos',1,'A01'),
('IMT01','Fundamentos matemáticos',1,'A02'),
('IFI01','Fundamentos matemáticos',1,'A03'),
('IME01','Fundamentos matemáticos',1,'A04'),
('IPL01','Fundamentos matemáticos',1,'A05'),
('ISA01','Fundamentos matemáticos',1,'A06'),
('LAG01','Fundamentos matemáticos',1,'A07'),
('IMA01','Fundamentos matemáticos',1,'A08')

insert into materia
(idMateria, nomMateria, cuatri,carrera)
values
('ITR02','Inglés I',1,'A01'),
('IMT02','Inglés I',1,'A02'),
('IFI02','Inglés I',1,'A03'),
('IME02','Inglés I',1,'A04'),
('IPL02','Inglés I',1,'A05'),
('ISA02','Inglés I',1,'A06'),
('LAG02','Inglés I',1,'A07'),
('IMA02','Inglés I',1,'A08')

insert into materia
(idMateria, nomMateria, cuatri,carrera)
values
('ITR03','Desarrollo Humano y valores',1,'A01'),
('IMT03','Desarrollo Humano y valores',1,'A02'),
('IFI03','Desarrollo Humano y valores',1,'A03'),
('IME03','Desarrollo Humano y valores',1,'A04'),
('IPL03','Desarrollo Humano y valores',1,'A05'),
('ISA03','Desarrollo Humano y valores',1,'A06'),
('LAG03','Desarrollo Humano y valores',1,'A07'),
('IMA03','Desarrollo Humano y valores',1,'A08')

insert into materia
(idMateria, nomMateria, cuatri,carrera)
values
('ITR04','Comunicación y Habilidades Digitales ',1,'A01'),
('IMT04','Comunicación y Habilidades Digitales',1,'A02'),
('IFI04','Comunicación y Habilidades Digitales',1,'A03'),
('IME04','Comunicación y Habilidades Digitales',1,'A04'),
('IPL04','Comunicación y Habilidades Digitales',1,'A05'),
('ISA04','Comunicación y Habilidades Digitales',1,'A06'),
('LAG04','Comunicación y Habilidades Digitales',1,'A07'),
('IMA04','Comunicación y Habilidades Digitales',1,'A08')

select * from materia
where carrera ='A01'

select * from periodo

/*Agregar informacion a la tabla Periodo*/
insert into periodo
(idPeriodo,nomPeriodo)
values
(2403,'Septiembre Diciembre 2024'),
(2501,'Enero Abril 2025'),
(2502,'Mayo Agosto 2025'),
(2503,'Septiembre Diciembre 2025')

select * from periodo
select * from materia
select * from alumno
where matricula='324030027';


/*Hacer una consulta que permita que a fernando Gutierrez 
se le carguen sus materias correspondientes del periodo
septiembre diciembre 2024*/
insert into historial (alumno,materia,periodo)
select a.matricula,a.carrera, m.idMateria,2403
from alumno a 
join carrera c on a.carrera = c.idCarrera 
join materia m on c.idCarrera = m.carrera
where a.matricula='324030027' and m.carrera='A02'

/*Hacer una consulta donde muestre
la matricula, el nombre completo,
las materias que ha cursado Fernando
Gutierrez*/

select a.matricula,a.nomAlumno,a.apPaterno,a.apMaterno, 
p.nomPeriodo,m.nomMateria
from alumno a join historial h
on a.matricula= h.alumno
join materia m
on h.materia = m.idMateria
join periodo p
on h.periodo = p.idPeriodo
where a.matricula = '324030027'

select idMateria
from materia
where carrera='A02'
select  matricula
from alumno


select * from historial 
where matricula='324030027'




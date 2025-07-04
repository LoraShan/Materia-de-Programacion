-- Base de datos y uso
Create database UniversidadDB;
use UniversidadDB;

-- Tabla de estudiantes
CREATE TABLE Estudiante (
    EstudianteID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    FechaNacimiento DATE,
    Email VARCHAR(100),
    DepartamentoID INT
);

-- Tabla de departamentos
CREATE TABLE Departamento (
    DepartamentoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100)
);

-- Tabla de profesores
CREATE TABLE Profesor (
    ProfesorID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Email VARCHAR(100),
    DepartamentoID INT
);

-- Tabla de cursos
CREATE TABLE Curso (
    CursoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Creditos INT,
    DepartamentoID INT
);

-- Tabla de clases (qué curso dicta cada profesor)
CREATE TABLE Clase (
    ClaseID INT PRIMARY KEY AUTO_INCREMENT,
    CursoID INT,
    ProfesorID INT,
    Año INT,
    Semestre VARCHAR(20)
);

-- Tabla de inscripciones
CREATE TABLE Inscripcion (
    InscripcionID INT PRIMARY KEY AUTO_INCREMENT,
    EstudianteID INT,
    ClaseID INT,
    FechaInscripcion DATE
);

-- Tabla de calificaciones
CREATE TABLE Calificacion (
    CalificacionID INT PRIMARY KEY AUTO_INCREMENT,
    InscripcionID INT,
    Nota DECIMAL(4,2)
);

-- Asegurarnos de usar la base correcta
USE UniversidadDB;

-- Tabla Estudiante → Departamento
ALTER TABLE Estudiante
  ADD CONSTRAINT FK_Estudiante_Departamento
  FOREIGN KEY (DepartamentoID)
  REFERENCES Departamento(DepartamentoID)
  ON UPDATE CASCADE
  ON DELETE SET NULL;

-- Tabla Profesor → Departamento
ALTER TABLE Profesor
  ADD CONSTRAINT FK_Profesor_Departamento
  FOREIGN KEY (DepartamentoID)
  REFERENCES Departamento(DepartamentoID)
  ON UPDATE CASCADE
  ON DELETE SET NULL;

-- Tabla Curso → Departamento
ALTER TABLE Curso
  ADD CONSTRAINT FK_Curso_Departamento
  FOREIGN KEY (DepartamentoID)
  REFERENCES Departamento(DepartamentoID)
  ON UPDATE CASCADE
  ON DELETE SET NULL;

-- Tabla Clase → Curso
ALTER TABLE Clase
  ADD CONSTRAINT FK_Clase_Curso
  FOREIGN KEY (CursoID)
  REFERENCES Curso(CursoID)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

-- Tabla Clase → Profesor
ALTER TABLE Clase
  ADD CONSTRAINT FK_Clase_Profesor
  FOREIGN KEY (ProfesorID)
  REFERENCES Profesor(ProfesorID)
  ON UPDATE CASCADE
  ON DELETE SET NULL;

-- Tabla Inscripcion → Estudiante
ALTER TABLE Inscripcion
  ADD CONSTRAINT FK_Inscripcion_Estudiante
  FOREIGN KEY (EstudianteID)
  REFERENCES Estudiante(EstudianteID)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

-- Tabla Inscripcion → Clase
ALTER TABLE Inscripcion
  ADD CONSTRAINT FK_Inscripcion_Clase
  FOREIGN KEY (ClaseID)
  REFERENCES Clase(ClaseID)
  ON UPDATE CASCADE
  ON DELETE CASCADE;

-- Tabla Calificacion → Inscripcion
ALTER TABLE Calificacion
  ADD CONSTRAINT FK_Calificacion_Inscripcion
  FOREIGN KEY (InscripcionID)
  REFERENCES Inscripcion(InscripcionID)
  ON UPDATE CASCADE
  ON DELETE CASCADE;
  
  SELECT 'Departamento'   AS Tabla, COUNT(*) AS Total FROM Departamento;
SELECT 'Estudiante'     AS Tabla, COUNT(*) AS Total FROM Estudiante;
SELECT 'Profesor'       AS Tabla, COUNT(*) AS Total FROM Profesor;
SELECT 'Curso'          AS Tabla, COUNT(*) AS Total FROM Curso;
SELECT 'Clase'          AS Tabla, COUNT(*) AS Total FROM Clase;
SELECT 'Inscripcion'    AS Tabla, COUNT(*) AS Total FROM Inscripcion;
SELECT 'Calificacion'   AS Tabla, COUNT(*) AS Total FROM Calificacion;

-- Insertar Departamentos
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (1, 'Ingeniería');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (2, 'Matemáticas');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (3, 'Historia');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (4, 'Biología');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (5, 'Filosofía');
INSERT INTO Departamento (DepartamentoID, Nombre) VALUES (6, 'Economía');

-- Insertar Estudiantes
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (1, 'Casemiro', 'Manrique', '1994-11-02', 'pferreras@hotmail.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (2, 'Che', 'Tovar', '2001-08-11', 'ireneperello@pont.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (3, 'Epifanio', 'Pou', '2002-12-27', 'sanchopio@duarte.es', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (4, 'Pepito', 'Campoy', '2004-09-12', 'castillofrancisco-javier@villar-hervas.es', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (5, 'Santiago', 'España', '2002-02-03', 'roman05@ferrandez.es', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (6, 'Encarnacion', 'Alsina', '2004-04-11', 'apina@yahoo.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (7, 'Nacho', 'Mariño', '2000-03-06', 'jsuarez@saldana.es', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (8, 'Lupe', 'Villar', '2001-11-23', 'tomasmanzano@yahoo.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (9, 'Iker', 'Piñol', '1995-03-02', 'ciprianocepeda@casas-galvan.es', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (10, 'Anna', 'Blanes', '1997-09-01', 'jorgetome@azcona.es', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (11, 'José', 'Pérez', '1999-10-01', 'yaiza77@abellan-sanmartin.es', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (12, 'Lorena', 'Torrecilla', '2004-06-28', 'angulojulian@yahoo.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (13, 'Reyna', 'Bustamante', '2006-08-04', 'angelinodavila@hotmail.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (14, 'Violeta', 'Arranz', '2004-03-10', 'kcastellanos@rey.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (15, 'Espiridión', 'Reguera', '2006-01-05', 'hasensio@hotmail.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (16, 'Ariadna', 'Iriarte', '1998-02-20', 'dionisiaalfonso@llado-moraleda.es', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (17, 'Ascensión', 'Llopis', '1999-09-29', 'manupalacios@gmail.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (18, 'Aroa', 'Cabañas', '2000-10-15', 'poncioquero@gmail.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (19, 'Albano', 'Pereira', '1995-01-06', 'mmascaro@sierra-dominguez.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (20, 'Emelina', 'Morell', '1999-10-24', 'rosseve@cardona-carpio.es', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (21, 'Consuelo', 'Pujol', '1998-01-22', 'rcalzada@gmail.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (22, 'Griselda', 'Sancho', '1998-06-07', 'ezequielvinas@hotmail.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (23, 'Amaro', 'Aramburu', '1997-08-22', 'alcantaracasemiro@llanos-isern.es', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (24, 'Carmina', 'Pina', '2001-11-12', 'ainoa23@gmail.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (25, 'Leocadio', 'Acedo', '1995-01-08', 'mateo16@jimenez.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (26, 'Leoncio', 'Acosta', '1998-03-01', 'paredesimelda@ocana.es', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (27, 'Ángel', 'Herranz', '2003-06-29', 'ascensionjaume@hotmail.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (28, 'Mateo', 'Vélez', '1996-12-22', 'rverdugo@gmail.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (29, 'Carina', 'Artigas', '2005-03-16', 'monica23@yahoo.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (30, 'Eutropio', 'Mayo', '2000-02-04', 'ycamino@alarcon.es', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (31, 'Amando', 'Lerma', '1994-07-13', 'mauriciosevilla@gmail.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (32, 'Sosimo', 'Luna', '2002-04-18', 'jcollado@yahoo.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (33, 'Pánfilo', 'Tovar', '1996-03-16', 'pineirorodrigo@gomila.net', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (34, 'Moisés', 'Rivas', '1999-06-26', 'hsaenz@yahoo.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (35, 'Eligio', 'Oliver', '1999-06-28', 'torrentshernando@mateu.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (36, 'Adolfo', 'Rebollo', '1999-07-20', 'aristides30@pou.org', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (37, 'Rico', 'Cabo', '1995-10-12', 'anabelcarbo@gmail.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (38, 'Adelardo', 'Galindo', '1998-10-03', 'gibertgodofredo@hotmail.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (39, 'Nuria', 'Arnaiz', '2005-04-10', 'socorro51@hotmail.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (40, 'Celestino', 'Sarmiento', '1995-02-04', 'moreno01@yahoo.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (41, 'Mar', 'Almazán', '1996-04-30', 'olivaressaturnina@llobet.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (42, 'Débora', 'Higueras', '2007-03-18', 'canascalixto@hotmail.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (43, 'Eustaquio', 'Goicoechea', '2000-02-06', 'cruz05@campo.es', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (44, 'Gertrudis', 'Blanch', '2001-07-05', 'ruysanjuan@nicolau.es', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (45, 'Eugenio', 'Casals', '1997-04-14', 'garcesmohamed@robles.es', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (46, 'Pacífica', 'Feijoo', '2005-02-22', 'snicolas@gmail.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (47, 'Fabio', 'Núñez', '2000-10-01', 'ruanocelia@yahoo.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (48, 'Teo', 'Bayón', '2005-01-17', 'javiblazquez@landa.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (49, 'Rosario', 'Llabrés', '1998-08-07', 'montserratana-sofia@garcia.es', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (50, 'Fernando', 'Gomis', '2005-10-05', 'ymontesinos@carreno.es', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (51, 'Valero', 'Gaya', '2004-01-02', 'eustaquio86@rodrigo.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (52, 'Yago', 'Vaquero', '2004-12-04', 'octaviaalmeida@arranz.es', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (53, 'Plinio', 'Marín', '1997-04-29', 'zfrutos@montalban-anguita.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (54, 'Jorge', 'Rocamora', '2001-04-17', 'xibarra@quintana.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (55, 'Perlita', 'Santana', '1997-12-11', 'tsimo@gmail.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (56, 'Brunilda', 'Naranjo', '2003-01-17', 'javiera23@olmo.es', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (57, 'Agapito', 'Batlle', '2000-07-12', 'pedro32@diez.es', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (58, 'Amancio', 'Yáñez', '2005-09-26', 'quintanamatias@carbonell.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (59, 'Evita', 'Leon', '2006-12-06', 'eligiaarenas@palacio.es', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (60, 'Imelda', 'Guillen', '1998-02-05', 'cornejoeva-maria@gmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (61, 'Sara', 'Redondo', '1995-09-24', 'qabad@arco.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (62, 'Vicente', 'Conde', '1999-11-21', 'macario01@hotmail.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (63, 'Trinidad', 'Castell', '1998-04-06', 'salvadorfidel@yahoo.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (64, 'Rosalía', 'Cañizares', '2005-12-27', 'adelanavarrete@prieto-andreu.es', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (65, 'Fabián', 'Pino', '2004-11-08', 'natanaelmesa@hotmail.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (66, 'Marcelino', 'González', '2001-06-30', 'amanciocabo@gmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (67, 'Luisina', 'Méndez', '2006-09-02', 'hcanales@mateo.net', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (68, 'Rosalía', 'Abril', '1995-02-19', 'garridomaria-angeles@gmail.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (69, 'Cesar', 'Gárate', '1998-03-08', 'nilotamayo@hotmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (70, 'Mariana', 'Fuster', '1996-04-08', 'torremarcial@hotmail.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (71, 'Ariel', 'Olivera', '1994-12-22', 'perlamarti@hotmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (72, 'Felipe', 'Cañizares', '1997-11-30', 'luz63@hotmail.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (73, 'Luciana', 'Mayoral', '1998-10-06', 'durannarciso@hotmail.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (74, 'Desiderio', 'Sastre', '1996-12-24', 'isernnadia@yahoo.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (75, 'Carolina', 'Chamorro', '2006-06-25', 'nievesespinosa@sole-leon.es', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (76, 'Evaristo', 'Barragán', '2003-10-22', 'german20@hotmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (77, 'Leyre', 'Estevez', '1996-12-29', 'jcriado@gmail.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (78, 'Carmelita', 'Sebastián', '2002-10-28', 'iglesianoe@torrijos.es', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (79, 'Calisto', 'Cuesta', '2007-04-22', 'sosimodelgado@hotmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (80, 'Dionisia', 'Lobo', '2002-04-19', 'gquiros@gmail.com', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (81, 'Dolores', 'Gallego', '2000-02-29', 'hilario82@pera.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (82, 'Alondra', 'Ochoa', '1997-06-12', 'nverdejo@hotmail.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (83, 'Aroa', 'Ferrera', '2003-05-09', 'fnicolas@hotmail.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (84, 'José', 'Goicoechea', '2003-12-12', 'zmesa@vives.es', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (85, 'María Teresa', 'Amaya', '1997-05-04', 'carlos85@luz.org', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (86, 'Isidora', 'Campoy', '1997-08-25', 'ritaroman@lujan.es', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (87, 'Oriana', 'Lobo', '1999-06-27', 'cifuentesanacleto@gil.org', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (88, 'Jose', 'Vidal', '2004-11-02', 'leonor27@gmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (89, 'Luna', 'Reig', '2005-10-01', 'sreal@alcazar.es', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (90, 'Onofre', 'Bru', '2007-03-06', 'jovitaguerra@borrego.com', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (91, 'Rolando', 'Valenciano', '2000-01-11', 'eligio44@vendrell.es', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (92, 'Lourdes', 'Donaire', '2000-10-05', 'miriamaviles@carrillo-salom.com', 2);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (93, 'Maura', 'Escobar', '2000-02-22', 'vinacristian@crespi-corbacho.org', 1);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (94, 'Gil', 'Montalbán', '2003-03-19', 'amorgilabert@yahoo.com', 5);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (95, 'Edelmiro', 'Cabeza', '2005-07-01', 'vicente66@quiroga.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (96, 'Raquel', 'Carbonell', '2005-11-21', 'sexposito@gmail.com', 3);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (97, 'Lorenzo', 'Laguna', '1997-03-28', 'molinerflorentino@dalmau-sevilla.org', 4);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (98, 'Natividad', 'Morera', '2005-08-08', 'sofia45@hotmail.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (99, 'Felix', 'Taboada', '2006-07-26', 'ysegura@valbuena.com', 6);
INSERT INTO Estudiante (EstudianteID, Nombre, Apellido, FechaNacimiento, Email, DepartamentoID) VALUES (100, 'Alma', 'Abascal', '2000-02-09', 'nogueraeutimio@benavente.es', 1);

-- Insertar Profesores
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (1, 'David', 'Pedraza', 'jennifer05@yahoo.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (2, 'Fernanda', 'Morán', 'zsaenz@hotmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (3, 'Dominga', 'Cueto', 'tarmas@hotmail.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (4, 'Emiliana', 'Pedrero', 'bernardita35@gmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (5, 'Asdrubal', 'Guillén', 'nadia62@hotmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (6, 'Nicolasa', 'Guerra', 'mariano35@sanjuan-paniagua.net', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (7, 'Azucena', 'Ferrán', 'curro95@hotmail.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (8, 'Víctor', 'Soriano', 'araceli64@yahoo.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (9, 'Damián', 'Tamayo', 'baltasarsala@gmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (10, 'Albina', 'Múgica', 'josepmorcillo@vara-gallego.es', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (11, 'Elvira', 'Gelabert', 'herrerainocencio@barbero-salas.net', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (12, 'Pánfilo', 'Elorza', 'german89@amat.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (13, 'Donato', 'Tello', 'abelpoza@vall.es', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (14, 'Nazario', 'Ibarra', 'avilapastora@maldonado.org', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (15, 'Chelo', 'Haro', 'fabramacario@hotmail.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (16, 'Leonardo', 'Villalba', 'aadadia@hotmail.com', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (17, 'Elisa', 'Cerro', 'xcid@gmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (18, 'Roque', 'Checa', 'leocadia68@santamaria.es', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (19, 'Cleto', 'Aller', 'maria-luisacorominas@ribera.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (20, 'Baltasar', 'Badía', 'samuplanas@colom.org', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (21, 'Ana', 'Fuertes', 'arrietaamaya@serrano.es', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (22, 'Chelo', 'Prado', 'damian06@gmail.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (23, 'Belén', 'Guzmán', 'rodavalentina@mateo.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (24, 'Angelita', 'Paredes', 'rgibert@elias.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (25, 'Jerónimo', 'Valls', 'wmoreno@olmedo.net', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (26, 'Odalys', 'Cuevas', 'marcoberenguer@vargas.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (27, 'Ángeles', 'Egea', 'fabricioespejo@hotmail.com', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (28, 'Esmeralda', 'Martínez', 'lucho35@marino.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (29, 'Tristán', 'Calderón', 'kmoya@boada-vilanova.com', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (30, 'Clemente', 'Chico', 'yparejo@avila-camps.es', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (31, 'Mónica', 'Morante', 'loretopaniagua@yahoo.com', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (32, 'Heliodoro', 'Marin', 'eusebiocardenas@real.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (33, 'Agapito', 'Dávila', 'lduarte@gmail.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (34, 'Severiano', 'Vallejo', 'casasesther@gmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (35, 'Narcisa', 'Calvet', 'albina39@hotmail.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (36, 'Ariel', 'Prat', 'mamigo@lasa.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (37, 'Vilma', 'Fuentes', 'javi35@gmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (38, 'Esteban', 'Ledesma', 'ycampoy@gmail.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (39, 'Saturnina', 'Moliner', 'narevalo@coronado-bueno.org', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (40, 'Ruperta', 'Porras', 'octaviolamas@hotmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (41, 'Cayetano', 'Salamanca', 'xnogues@gmail.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (42, 'Arturo', 'Río', 'custodio23@yahoo.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (43, 'Herminio', 'Baró', 'amalia61@calzada-macias.es', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (44, 'Eva María', 'Coronado', 'quintanadesiderio@perera.es', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (45, 'Alejo', 'Barba', 'cleon@yahoo.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (46, 'Teresita', 'Lledó', 'esainz@corral.es', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (47, 'Joaquina', 'Belda', 'piedad22@yahoo.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (48, 'Eutropio', 'Rebollo', 'hrebollo@hotmail.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (49, 'Anna', 'Barbero', 'xcanellas@marques.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (50, 'Angelita', 'Valero', 'francisco-javier78@yahoo.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (51, 'Cecilio', 'Martinez', 'maria-del-carmenolivares@hotmail.com', 1);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (52, 'Glauco', 'Hernandez', 'upinol@linares.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (53, 'Bonifacio', 'Sosa', 'vilaplanaluis@jordan-tello.net', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (54, 'Maribel', 'Juárez', 'carmelo52@oliva.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (55, 'Begoña', 'Soler', 'eadan@mata.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (56, 'Feliciano', 'Llobet', 'adrianserra@hotmail.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (57, 'Encarnacion', 'Valle', 'palmaamando@pardo-briones.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (58, 'Juan Pablo', 'Galiano', 'carlos85@perez.net', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (59, 'José Ángel', 'Villegas', 'irosado@montesinos.net', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (60, 'Isabela', 'Expósito', 'desparza@hotmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (61, 'José', 'Carrasco', 'lucenamodesto@beltran.es', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (62, 'Diana', 'Martorell', 'korozco@lluch.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (63, 'Isidro', 'Valdés', 'julie01@hotmail.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (64, 'Nando', 'Fuente', 'iglesiasimon@hotmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (65, 'Máxima', 'Vazquez', 'mgras@hotmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (66, 'Filomena', 'Pla', 'halfaro@morante.es', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (67, 'Victorino', 'Gras', 'bbenet@quintanilla.es', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (68, 'Ángeles', 'Oliva', 'ngarcia@yahoo.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (69, 'Verónica', 'Arellano', 'josue82@cespedes.net', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (70, 'Rosario', 'Cruz', 'fbosch@yahoo.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (71, 'Hilda', 'Andres', 'juan-luispolo@yahoo.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (72, 'Eusebio', 'Cuadrado', 'galvanluz@jorda.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (73, 'Joaquina', 'Cazorla', 'vicentemorata@yahoo.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (74, 'Ruth', 'Camps', 'miguelgaspar@hotmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (75, 'Reinaldo', 'Águila', 'camaramarita@hotmail.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (76, 'Calisto', 'Delgado', 'eugenioalemany@gmail.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (77, 'Ezequiel', 'Villar', 'cnadal@gallo-palma.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (78, 'Jimena', 'Román', 'cvillalba@hotmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (79, 'Teodosio', 'Blanes', 'edmundo05@cuenca-alba.org', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (80, 'Gilberto', 'Carreras', 'ingrid94@falco.net', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (81, 'Rogelio', 'Iriarte', 'uginer@frutos-revilla.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (82, 'Alba', 'Noriega', 'diegodelia@sainz-berrocal.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (83, 'Ildefonso', 'Lasa', 'isidoracervera@aguado-carpio.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (84, 'Irene', 'Pozo', 'xavier55@hotmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (85, 'Berta', 'Arnau', 'mfranch@yahoo.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (86, 'Santos', 'Almagro', 'pizarrofito@gmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (87, 'Augusto', 'Coll', 'valentin51@gmail.com', 4);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (88, 'Esther', 'Castellanos', 'lunamariano@yahoo.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (89, 'Adelardo', 'Santana', 'estevedorita@hotmail.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (90, 'Palmira', 'Morales', 'elenahervas@salmeron-sales.es', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (91, 'Edelmiro', 'Bernat', 'bienvenidaferrer@yahoo.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (92, 'Cintia', 'Caballero', 'gracielacorral@gmail.com', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (93, 'Cirino', 'Herrero', 'rverdugo@yahoo.com', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (94, 'Fabricio', 'Pereira', 'rayazaira@gmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (95, 'Onofre', 'Godoy', 'anibalsantana@crespo-ayllon.org', 2);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (96, 'Eusebia', 'Murcia', 'heriberto54@gmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (97, 'Candelas', 'Duarte', 'olgamontes@gmail.com', 5);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (98, 'Angélica', 'Fuente', 'vpujadas@gmail.com', 6);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (99, 'Octavio', 'Leon', 'tomedaniela@roldan.net', 3);
INSERT INTO Profesor (ProfesorID, Nombre, Apellido, Email, DepartamentoID) VALUES (100, 'Anselma', 'Cuevas', 'rochabenigna@ugarte.com', 5);

-- Insertar Cursos
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (1, 'Curso Minus 1', 5, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (2, 'Curso Voluptas 2', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (3, 'Curso Qui 3', 5, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (4, 'Curso Omnis 4', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (5, 'Curso Cum 5', 5, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (6, 'Curso Harum 6', 1, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (7, 'Curso Quisquam 7', 5, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (8, 'Curso Vel 8', 1, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (9, 'Curso Distinctio 9', 4, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (10, 'Curso Expedita 10', 4, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (11, 'Curso Illum 11', 2, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (12, 'Curso Tenetur 12', 3, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (13, 'Curso Quis 13', 2, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (14, 'Curso Est 14', 5, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (15, 'Curso Corrupti 15', 3, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (16, 'Curso Magnam 16', 5, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (17, 'Curso Temporibus 17', 3, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (18, 'Curso Mollitia 18', 4, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (19, 'Curso Minima 19', 2, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (20, 'Curso Architecto 20', 2, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (21, 'Curso Maiores 21', 5, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (22, 'Curso Eveniet 22', 1, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (23, 'Curso Aliquid 23', 4, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (24, 'Curso Omnis 24', 5, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (25, 'Curso Id 25', 4, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (26, 'Curso Voluptas 26', 4, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (27, 'Curso Ipsum 27', 2, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (28, 'Curso Reiciendis 28', 5, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (29, 'Curso Aut 29', 3, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (30, 'Curso Sit 30', 1, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (31, 'Curso Cumque 31', 5, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (32, 'Curso Inventore 32', 2, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (33, 'Curso Veniam 33', 4, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (34, 'Curso Veritatis 34', 2, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (35, 'Curso Aliquam 35', 1, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (36, 'Curso A 36', 5, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (37, 'Curso Dolore 37', 5, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (38, 'Curso Vel 38', 4, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (39, 'Curso Excepturi 39', 2, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (40, 'Curso Velit 40', 1, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (41, 'Curso Numquam 41', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (42, 'Curso Aperiam 42', 1, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (43, 'Curso Incidunt 43', 2, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (44, 'Curso Saepe 44', 1, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (45, 'Curso Neque 45', 1, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (46, 'Curso Aut 46', 2, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (47, 'Curso Eos 47', 3, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (48, 'Curso Labore 48', 2, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (49, 'Curso Dolor 49', 4, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (50, 'Curso Non 50', 1, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (51, 'Curso Molestias 51', 4, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (52, 'Curso Inventore 52', 3, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (53, 'Curso Eveniet 53', 2, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (54, 'Curso Debitis 54', 1, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (55, 'Curso Assumenda 55', 4, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (56, 'Curso Unde 56', 1, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (57, 'Curso Blanditiis 57', 3, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (58, 'Curso Pariatur 58', 2, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (59, 'Curso Nihil 59', 4, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (60, 'Curso Vero 60', 1, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (61, 'Curso Laboriosam 61', 1, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (62, 'Curso Dignissimos 62', 1, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (63, 'Curso Cum 63', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (64, 'Curso Qui 64', 5, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (65, 'Curso Error 65', 5, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (66, 'Curso Quo 66', 4, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (67, 'Curso Minus 67', 5, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (68, 'Curso Esse 68', 1, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (69, 'Curso Totam 69', 3, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (70, 'Curso Debitis 70', 5, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (71, 'Curso Autem 71', 5, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (72, 'Curso Ea 72', 2, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (73, 'Curso Voluptatibus 73', 4, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (74, 'Curso Molestiae 74', 1, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (75, 'Curso Suscipit 75', 1, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (76, 'Curso Alias 76', 5, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (77, 'Curso Voluptate 77', 2, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (78, 'Curso Adipisci 78', 5, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (79, 'Curso Beatae 79', 4, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (80, 'Curso Saepe 80', 3, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (81, 'Curso Error 81', 2, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (82, 'Curso Laboriosam 82', 1, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (83, 'Curso Totam 83', 2, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (84, 'Curso Assumenda 84', 2, 5);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (85, 'Curso Cupiditate 85', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (86, 'Curso Voluptates 86', 1, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (87, 'Curso Eligendi 87', 1, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (88, 'Curso Aliquid 88', 3, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (89, 'Curso Repudiandae 89', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (90, 'Curso Reiciendis 90', 1, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (91, 'Curso Dolor 91', 5, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (92, 'Curso Tempora 92', 2, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (93, 'Curso Debitis 93', 4, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (94, 'Curso Eos 94', 3, 3);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (95, 'Curso Deserunt 95', 5, 2);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (96, 'Curso Error 96', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (97, 'Curso Quia 97', 5, 1);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (98, 'Curso At 98', 1, 4);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (99, 'Curso Rem 99', 2, 6);
INSERT INTO Curso (CursoID, Nombre, Creditos, DepartamentoID) VALUES (100, 'Curso Sed 100', 4, 4);

-- Insertar Clases
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (1, 83, 49, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (2, 11, 99, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (3, 98, 70, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (4, 32, 84, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (5, 4, 57, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (6, 12, 44, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (7, 13, 47, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (8, 24, 57, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (9, 89, 15, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (10, 74, 40, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (11, 71, 35, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (12, 6, 58, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (13, 36, 51, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (14, 30, 96, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (15, 88, 40, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (16, 74, 30, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (17, 92, 62, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (18, 34, 88, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (19, 9, 100, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (20, 95, 65, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (21, 66, 38, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (22, 20, 22, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (23, 20, 84, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (24, 16, 13, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (25, 72, 62, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (26, 48, 36, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (27, 6, 59, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (28, 50, 56, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (29, 50, 13, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (30, 48, 52, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (31, 99, 62, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (32, 73, 63, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (33, 79, 44, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (34, 55, 83, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (35, 62, 77, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (36, 88, 8, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (37, 50, 32, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (38, 67, 46, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (39, 93, 59, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (40, 76, 28, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (41, 42, 17, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (42, 72, 67, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (43, 76, 72, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (44, 63, 99, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (45, 93, 31, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (46, 71, 12, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (47, 87, 3, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (48, 38, 76, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (49, 54, 83, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (50, 10, 96, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (51, 53, 96, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (52, 68, 93, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (53, 16, 80, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (54, 19, 91, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (55, 25, 48, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (56, 85, 72, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (57, 55, 92, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (58, 81, 38, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (59, 96, 53, 2025, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (60, 62, 73, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (61, 10, 42, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (62, 67, 86, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (63, 49, 29, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (64, 92, 87, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (65, 23, 36, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (66, 1, 19, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (67, 18, 10, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (68, 57, 92, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (69, 4, 72, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (70, 75, 47, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (71, 84, 61, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (72, 75, 66, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (73, 22, 39, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (74, 53, 95, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (75, 78, 62, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (76, 73, 35, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (77, 96, 52, 2025, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (78, 29, 16, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (79, 60, 45, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (80, 79, 46, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (81, 79, 8, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (82, 63, 79, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (83, 32, 26, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (84, 77, 94, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (85, 90, 43, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (86, 63, 34, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (87, 88, 58, 2024, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (88, 21, 75, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (89, 68, 96, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (90, 23, 82, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (91, 25, 78, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (92, 40, 23, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (93, 74, 22, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (94, 62, 86, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (95, 19, 93, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (96, 43, 57, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (97, 67, 99, 2023, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (98, 7, 38, 2024, 'Otoño');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (99, 66, 77, 2023, 'Primavera');
INSERT INTO Clase (ClaseID, CursoID, ProfesorID, Año, Semestre) VALUES (100, 85, 32, 2024, 'Otoño');

-- Insertar Inscripciones
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (1, 45, 20, '2024-04-27');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (2, 48, 9, '2024-07-07');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (3, 41, 28, '2024-11-21');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (4, 51, 86, '2025-03-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (5, 30, 31, '2024-10-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (6, 2, 22, '2024-05-08');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (7, 12, 70, '2025-01-15');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (8, 17, 67, '2025-03-18');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (9, 63, 16, '2024-05-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (10, 46, 57, '2024-05-29');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (11, 23, 55, '2025-04-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (12, 61, 53, '2024-08-21');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (13, 46, 82, '2024-07-17');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (14, 98, 40, '2024-05-05');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (15, 57, 78, '2025-01-31');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (16, 96, 89, '2024-07-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (17, 75, 79, '2024-08-15');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (18, 32, 100, '2024-12-07');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (19, 41, 49, '2024-12-19');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (20, 86, 70, '2024-06-08');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (21, 87, 31, '2024-09-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (22, 50, 53, '2025-01-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (23, 50, 58, '2025-04-01');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (24, 5, 76, '2024-07-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (25, 83, 80, '2025-04-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (26, 50, 34, '2024-06-10');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (27, 26, 62, '2024-12-19');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (28, 94, 11, '2025-02-07');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (29, 79, 74, '2025-03-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (30, 35, 35, '2025-02-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (31, 17, 65, '2025-01-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (32, 27, 31, '2024-10-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (33, 98, 3, '2024-11-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (34, 46, 39, '2024-05-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (35, 84, 11, '2024-06-03');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (36, 88, 93, '2024-10-20');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (37, 42, 56, '2024-08-31');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (38, 82, 25, '2024-09-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (39, 70, 19, '2024-08-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (40, 19, 54, '2025-02-14');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (41, 97, 66, '2024-06-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (42, 78, 42, '2025-03-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (43, 53, 48, '2024-11-19');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (44, 14, 79, '2024-05-31');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (45, 11, 95, '2024-09-29');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (46, 25, 12, '2025-04-04');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (47, 100, 31, '2024-08-22');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (48, 52, 48, '2025-01-28');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (49, 23, 86, '2024-11-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (50, 30, 84, '2024-09-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (51, 19, 47, '2025-01-18');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (52, 47, 64, '2024-11-12');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (53, 54, 38, '2025-01-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (54, 28, 61, '2024-12-27');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (55, 13, 50, '2024-09-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (56, 37, 18, '2024-06-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (57, 81, 26, '2024-05-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (58, 35, 60, '2024-12-07');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (59, 81, 48, '2024-08-22');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (60, 7, 41, '2025-02-01');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (61, 84, 18, '2025-03-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (62, 43, 51, '2024-06-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (63, 97, 92, '2025-02-17');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (64, 67, 28, '2024-08-27');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (65, 44, 50, '2024-08-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (66, 63, 27, '2024-12-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (67, 84, 86, '2024-08-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (68, 54, 26, '2024-07-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (69, 26, 77, '2024-07-11');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (70, 73, 95, '2025-01-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (71, 71, 48, '2025-01-14');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (72, 10, 17, '2024-12-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (73, 21, 44, '2024-07-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (74, 81, 27, '2024-04-28');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (75, 56, 95, '2024-05-14');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (76, 36, 37, '2024-11-13');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (77, 94, 37, '2024-10-30');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (78, 84, 3, '2024-09-22');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (79, 89, 20, '2024-05-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (80, 53, 97, '2024-10-19');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (81, 49, 24, '2024-05-13');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (82, 31, 10, '2025-04-11');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (83, 77, 67, '2024-10-03');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (84, 11, 41, '2025-02-25');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (85, 85, 24, '2025-03-09');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (86, 19, 45, '2025-02-14');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (87, 64, 64, '2025-03-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (88, 40, 97, '2024-11-02');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (89, 60, 34, '2024-10-06');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (90, 64, 39, '2024-07-23');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (91, 25, 77, '2024-10-28');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (92, 30, 4, '2024-09-19');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (93, 65, 78, '2024-09-03');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (94, 86, 96, '2024-12-26');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (95, 31, 42, '2024-11-07');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (96, 46, 42, '2024-11-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (97, 82, 35, '2025-03-02');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (98, 48, 9, '2024-12-24');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (99, 47, 7, '2024-07-16');
INSERT INTO Inscripcion (InscripcionID, EstudianteID, ClaseID, FechaInscripcion) VALUES (100, 30, 61, '2024-11-16');

-- Insertar Calificaciones
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (1, 1, 64.2);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (2, 2, 73.19);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (3, 3, 69.16);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (4, 4, 78.37);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (5, 5, 76.96);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (6, 6, 71.71);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (7, 7, 68.25);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (8, 8, 97.67);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (9, 9, 94.78);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (10, 10, 60.24);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (11, 11, 76.41);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (12, 12, 75.67);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (13, 13, 86.44);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (14, 14, 94.13);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (15, 15, 92.15);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (16, 16, 96.35);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (17, 17, 89.19);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (18, 18, 99.55);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (19, 19, 67.61);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (20, 20, 66.61);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (21, 21, 83.88);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (22, 22, 86.69);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (23, 23, 99.43);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (24, 24, 79.9);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (25, 25, 66.72);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (26, 26, 60.09);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (27, 27, 99.07);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (28, 28, 80.39);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (29, 29, 67.1);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (30, 30, 79.35);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (31, 31, 92.12);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (32, 32, 62.45);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (33, 33, 70.3);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (34, 34, 67.23);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (35, 35, 61.38);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (36, 36, 65.29);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (37, 37, 92.85);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (38, 38, 60.06);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (39, 39, 63.67);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (40, 40, 74.26);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (41, 41, 90.3);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (42, 42, 91.39);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (43, 43, 72.58);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (44, 44, 93.69);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (45, 45, 92.76);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (46, 46, 74.6);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (47, 47, 78.85);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (48, 48, 71.73);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (49, 49, 68.47);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (50, 50, 95.19);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (51, 51, 99.95);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (52, 52, 73.6);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (53, 53, 78.32);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (54, 54, 78.22);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (55, 55, 74.36);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (56, 56, 85.92);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (57, 57, 88.61);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (58, 58, 72.68);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (59, 59, 99.49);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (60, 60, 88.27);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (61, 61, 89.49);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (62, 62, 60.74);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (63, 63, 87.54);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (64, 64, 75.22);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (65, 65, 67.54);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (66, 66, 91.39);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (67, 67, 87.53);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (68, 68, 71.88);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (69, 69, 72.82);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (70, 70, 82.47);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (71, 71, 89.47);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (72, 72, 76.77);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (73, 73, 79.81);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (74, 74, 90.67);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (75, 75, 69.17);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (76, 76, 86.01);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (77, 77, 92.4);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (78, 78, 95.39);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (79, 79, 84.61);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (80, 80, 73.01);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (81, 81, 92.48);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (82, 82, 67.96);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (83, 83, 72.43);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (84, 84, 60.58);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (85, 85, 99.88);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (86, 86, 84.82);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (87, 87, 67.69);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (88, 88, 93.27);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (89, 89, 83.7);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (90, 90, 62.49);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (91, 91, 67.68);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (92, 92, 82.57);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (93, 93, 73.45);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (94, 94, 73.89);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (95, 95, 90.83);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (96, 96, 68.51);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (97, 97, 70.82);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (98, 98, 63.06);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (99, 99, 82.72);
INSERT INTO Calificacion (CalificacionID, InscripcionID, Nota) VALUES (100, 100, 94.6);




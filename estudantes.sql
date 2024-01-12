CREATE DATABASE estudantes;

USE estudantes;

CREATE TABLE cursos(
  id_curso INT PRIMARY KEY AUTO_INCREMENT,
  curso VARCHAR(50) NOT NULL
);

CREATE TABLE disciplinas(
  id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
  disciplina VARCHAR(50) NOT NULL
);

CREATE TABLE cursos_disciplinas(
  id_curso INT NOT NULL,
  id_disciplina INT NOT NULL,
  PRIMARY KEY (id_curso, id_disciplina),
  FOREIGN KEY (id_curso) REFERENCES cursos (id_curso),
  FOREIGN KEY (id_disciplina) REFERENCES disciplinas (id_disciplina)
);

CREATE TABLE estudantes(
  id_estudante INT PRIMARY KEY AUTO_INCREMENT,
  primeiro_nome VARCHAR(30),
  ultimo_nome VARCHAR(30),
  id_curso INT,
  nota_media NUMERIC(2, 1),
  FOREIGN KEY (id_curso) REFERENCES cursos (id_curso)
);

INSERT INTO cursos (curso) 
VALUES ('Database Administration'), 
('Web Development'), 
('Data Science');

INSERT INTO disciplinas (disciplina) 
VALUES ('Data Structures and Algorithms'), 
('Web Programming'), 
('Object-Oriented Programming'),
('Web Applications');

INSERT INTO cursos_disciplinas (id_curso, id_disciplina) 
VALUES (1, 1), 
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1);

INSERT INTO estudantes (primeiro_nome, ultimo_nome, id_curso, nota_media) 
VALUES ('Rhea', 'Kellems', 1, 2.5), 
('Emma', 'Gilbert', NULL, NULL), 
('Kimberly', 'Whitley', 2, 3.8), 
('Jimmy', 'Felipe', 1, 3.7), 
('Kyle', 'Stimson', NULL, 2.8), 
('Casares', 'Hijo', 3, 4.0), 
('Noe', 'Savage', NULL, 3.6), 
('Sterling', 'Boss', 3, 3.9), 
('Brian', 'Davis', NULL, 2.3), 
('Kaija', 'Uronen', 3, 3.7), 
('Faye', 'Conn', 3, 2.1), 
('Efren', 'Reilly', 2, 3.9), 
('Danh', 'Nhung', NULL, 2.4);

SELECT estudantes.*, cursos.curso
FROM estudantes 
LEFT JOIN cursos
ON estudantes.id_curso = cursos.id_curso
ORDER BY cursos.id_curso DESC;

SELECT cursos.*, disciplinas.*
FROM cursos_disciplinas
JOIN cursos 
ON cursos_disciplinas.id_curso = cursos.id_curso
JOIN disciplinas
ON cursos_disciplinas.id_disciplina = disciplinas.id_disciplina
ORDER BY cursos.id_curso;

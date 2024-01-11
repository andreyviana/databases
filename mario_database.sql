CREATE DATABASE mario_database;

USE mario_database;

CREATE TABLE personagens (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome_personagem VARCHAR(30) NOT NULL,
  terra_natal VARCHAR(60),
  cor_favorita VARCHAR(20)
);

CREATE TABLE acoes (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  acao VARCHAR(20)
);

CREATE TABLE personagem_acoes (
  id_personagem INT NOT NULL,
  id_acao INT NOT NULL,
  PRIMARY KEY(id_personagem, id_acao),
  FOREIGN KEY (id_personagem) REFERENCES personagens (id),
  FOREIGN KEY (id_acao) REFERENCES acoes (id)
);

CREATE TABLE informacoes (
  id INT AUTO_INCREMENT UNIQUE NOT NULL REFERENCES personagens (id),
  data_nascimento DATE,
  altura_em_cm INT,
  peso_em_kg NUMERIC(4, 1)
);

CREATE TABLE sons (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  id_personagem INT,
  nome_arquivo VARCHAR(20) NOT NULL,
  FOREIGN KEY (id_personagem) REFERENCES personagens (id)
);

INSERT INTO personagens (nome_personagem, terra_natal, cor_favorita) 
VALUES ('Mario', 'Mushroom Kingdom', 'Red'),
  ('Luigi', 'Mushroom Kingdom', 'Green'),
  ('Peach', 'Mushroom Kingdom', 'Pink'),
  ('Toad', 'Mushroom Kingdom', 'Blue'),
  ('Bowser', 'Koopa Kingdom', 'Yellow'),
  ('Daisy', 'Sarasaland', 'Orange'),
  ('Yoshi', 'Dinosaur Land', 'Green');

INSERT INTO informacoes (data_nascimento, altura_em_cm, peso_em_kg, id) 
VALUES ('1981-07-09', 155, 64.5, 1),
  ('1983-07-14', 175, 48.8, 2),
  ('1985-10-18', 173, 52.2, 3),
  ('1950-01-10', 66, 35.6, 4),
  ('1990-10-29', 258, 300.0, 5),
  ('1989-07-31', NULL, NULL, 6),
  ('1990-04-13', 162, 59.1, 7);

INSERT INTO acoes (acao) 
VALUES ('correr'),
  ('pular'),
  ('agachar');

INSERT INTO personagem_acoes (id_personagem, id_acao) 
VALUES (7, 1),
  (7, 2),
  (7, 3),
  (6, 1),
  (6, 2),
  (6, 3),
  (5, 1),
  (5, 2),
  (5, 3),
  (4, 1),
  (4, 2),
  (4, 3),
  (3, 1),
  (3, 2),
  (3, 3),
  (2, 1),
  (2, 2),
  (2, 3),
  (1, 1),
  (1, 2),
  (1, 3);

INSERT INTO sons (id_personagem, nome_arquivo) 
VALUES (1, 'its-a-me.wav'),
  (1, 'yippee.wav'),
  (1, 'yahoo.wav'),
  (2, 'ha-ha.wav'),
  (2, 'oh-yeah.wav'),
  (3, 'yay.wav'),
  (3, 'woo-hoo.wav'),
  (3, 'mm-hmm.wav');

SELECT * 
FROM personagens
RIGHT JOIN informacoes
ON personagens.id = informacoes.id;

/* 
// FULL JOIN MYSQL

SELECT * 
FROM personagem_acoes
LEFT JOIN personagens
ON personagem_acoes.id_personagem = personagens.id 
LEFT JOIN acoes
ON personagem_acoes.id_acao = acoes.id
UNION ALL
SELECT * 
FROM personagem_acoes
RIGHT JOIN personagens
ON personagem_acoes.id_personagem = personagens.id
RIGHT JOIN acoes
ON personagem_acoes.id_acao = acoes.id; */

SELECT personagens.id, personagens.nome_personagem, acoes.*
FROM personagem_acoes
JOIN personagens
ON personagem_acoes.id_personagem = personagens.id
JOIN acoes
ON personagem_acoes.id_acao = acoes.id
ORDER BY personagens.id;

SELECT personagens.nome_personagem, sons.*
FROM personagens
LEFT JOIN sons
ON personagens.id = sons.id_personagem
WHERE sons.id_personagem IS NOT NULL;
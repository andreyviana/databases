CREATE DATABASE universo;

USE universo;

CREATE TABLE galaxia (
  id_galaxia INT AUTO_INCREMENT NOT NULL,
  nome_galaxia VARCHAR(255) NOT NULL UNIQUE,
  tipo_galaxia VARCHAR(30) NOT NULL,
  descricao_galaxia TEXT,
  PRIMARY KEY (id_galaxia)
);

CREATE TABLE estrela (
  id_estrela INT AUTO_INCREMENT NOT NULL,
  id_galaxia INT NOT NULL,
  nome_estrela VARCHAR(255) NOT NULL UNIQUE,
  descricao_estrela TEXT,
  PRIMARY KEY (id_estrela),
  FOREIGN KEY (id_galaxia) REFERENCES galaxia (id_galaxia)
);

CREATE TABLE planeta (
  id_planeta INT AUTO_INCREMENT NOT NULL,
  id_estrela INT,
  nome_planeta VARCHAR(255) UNIQUE,
  tipo_planeta VARCHAR(30),
  descricao_planeta TEXT,
  distancia_da_terra NUMERIC,
  PRIMARY KEY (id_planeta),
  FOREIGN KEY (id_estrela) REFERENCES estrela (id_estrela)
);

CREATE TABLE lua (
  id_lua INT AUTO_INCREMENT NOT NULL,
  id_planeta INT NOT NULL,
  nome_lua VARCHAR(255) NOT NULL UNIQUE,
  descricao_lua TEXT,
  PRIMARY KEY (id_lua),
  FOREIGN KEY (id_planeta) REFERENCES planeta (id_planeta)
);

INSERT INTO galaxia (nome_galaxia, tipo_galaxia, descricao_galaxia) 
VALUES 
  ('Via Láctea', 'espiral', 'A Via Láctea é a galáxia em que estamos localizados'),
  ('Messier 87 (M87)', 'elíptica', 'Messier 87 é uma galáxia elíptica gigante localizada no aglomerado de galáxias Virgo'),
  ('Grande Nuvem de Magalhães (LMC)', 'irregular', 'A Grande Nuvem de Magalhães é uma galáxia irregular que orbita a Via Láctea como uma de suas galáxias satélites'),
  ('Galáxia do Redemoinho (M51)', 'espiral', 'Uma galáxia espiral localizada na constelação de Canes Venatici'),
  ('Galáxia do Sombrero (M104)', 'Elíptica', 'Uma galáxia espiral localizada na constelação de Virgem'),
  ('Galáxia do Bode', 'Espiral', 'Uma galáxia espiral localizada na constelação de Ursa Maior');

INSERT INTO estrela (id_galaxia, nome_estrela, descricao_estrela) 
VALUES 
  (1, 'Sol', 'Estrela-mãe do sistema solar'),
  (1, 'Próxima Centauri', 'Estrela mais próxima do sistema solar'),
  (1, 'Sirius (Alpha Canis Major)', 'Uma das estrelas mais brilhantes do céu noturno'),
  (1, 'Betelgeuse (Alpha Orionis)', 'Uma estrela supergigante vermelha na constelação de Orion'),
  (1, 'Rigel (Beta Orionis)', 'Supergigante azul situada na constelação de Orion'),
  (1, 'Vega (Alpha Lyrae)', 'Uma estrela brilhante na constelação de Lyra');

INSERT INTO planeta (id_estrela, nome_planeta, tipo_planeta, descricao_planeta, distancia_da_terra)
VALUES 
  (1, 'Mercúrio', 'Rochoso', 'Planeta rochoso mais próximo do Sol.', 57910000),
  (1, 'Vênus', 'Rochoso', 'Gêmeo da Terra com uma atmosfera densa.', 108200000),
  (1, 'Terra', 'Rochoso', 'Nosso planeta, único conhecido com vida.', 0),
  (1, 'Marte', 'Rochoso', 'Planeta vermelho com características rochosas.', 227900000),
  (1, 'Júpiter', 'Gasoso', 'Gigante gasoso com atmosfera turbulenta.', 778500000),
  (1, 'Saturno', 'Gasoso', 'Conhecido por seus impressionantes anéis.', 1427000000),
  (1, 'Urano', 'Gasoso', 'Gigante gasoso inclinado em seu eixo.', 2871000000),
  (1, 'Netuno', 'Gasoso', 'Planeta azul com ventos muito fortes.', 4504000000),
  (2, 'Proxima c', 'Rochoso', 'Executa uma órbita mais longa de cinco anos em torno da estrela', 700000),
  (2, 'Proxima b', 'Rochoso', 'Planeta com uma massa comparável à da Terra', NULL);

INSERT INTO lua (id_planeta, nome_lua, descricao_lua)
VALUES 
  (5, 'Io', 'Lua vulcânica com atividade geológica intensa.'),
  (5, 'Europa', 'Lua gelada com uma crosta de gelo e um oceano subsuperficial.'),
  (5, 'Ganimedes', 'A maior lua do Sistema Solar, com características geológicas variadas.'),
  (5, 'Calisto', 'Lua com uma superfície coberta por crateras antigas.'),
  (5, 'Amalteia', 'Lua irregular e pequena, situada próxima ao anel de Júpiter.'),
  (5, 'Himalia', 'Lua irregular e uma das maiores luas irregulares de Júpiter.'),
  (5, 'Elara', 'Lua irregular que orbita a uma grande distância de Júpiter.'),
  (5, 'Leda', 'Lua irregular e pequena, situada próxima ao anel de Júpiter.'),
  (3, 'Lua', 'Nosso satélite natural, influenciando as marés e sendo objeto de exploração espacial.'),
  (4, 'Fobos', 'Uma das luas de Marte, com órbita muito próxima ao planeta.'),
  (4, 'Deimos', 'A lua menor de Marte, com uma órbita mais distante do planeta.'),
  (6, 'Titã', 'A maior lua de Saturno, com uma atmosfera espessa e lagos de metano e etano.'),
  (6, 'Reia', 'Uma das luas maiores de Saturno, com uma superfície coberta por gelo.'),
  (6, 'Jápeto', 'Lua com uma parte da superfície extremamente escura, conhecida como "Cassini Regio".'),
  (6, 'Dione', 'Lua com uma superfície coberta por gelo e características geológicas variadas.'),
  (8, 'Tritão', 'A maior lua de Netuno, com geisers de nitrogênio e uma atmosfera fina.'),
  (8, 'Nereida', 'Lua irregular de Netuno, com órbita distante e irregular.'),
  (8, 'Proteu', 'A segunda maior lua de Netuno, com uma forma irregular.'),
  (8, 'Larissa', 'Lua de Netuno com uma órbita próxima e um formato irregular.'),
  (7, 'Titânia', 'A maior lua de Urano, com uma superfície coberta por crateras e fissuras.'),
  (7, 'Óberon', 'A segunda maior lua de Urano, com uma superfície acidentada e crateras antigas.'),
  (7, 'Umbriel', 'Lua de Urano com uma superfície escura e poucas características de impacto visíveis.'),
  (7, 'Ariel', 'Lua de Urano com uma superfície brilhante e algumas fissuras.');

SELECT * 
FROM galaxia;

SELECT galaxia.nome_galaxia, estrela.*
FROM estrela
LEFT JOIN galaxia
ON estrela.id_galaxia = galaxia.id_galaxia;

SELECT estrela.nome_estrela, planeta.*
FROM planeta
LEFT JOIN estrela
ON planeta.id_estrela = estrela.id_estrela; 

SELECT planeta.nome_planeta, lua.*
FROM lua
LEFT JOIN planeta
ON lua.id_planeta = planeta.id_planeta;
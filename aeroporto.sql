-- Create Table: aeroporto
CREATE TABLE aeroporto
(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50),
	cidade VARCHAR(50),
	estado VARCHAR(50),
	tamanho DECIMAL(2),
);

-- Create Table: instancia_trecho
CREATE TABLE Instancia_trecho
(
	id_aviao INT AUTO_INCREMENT, 
	datavoo DATETIME, 
	PRIMARY KEY (id_aviao, datavoo)
	num_poltronas INT,
	codigo_aeroporto INT,
	FOREIGN KEY (codigo_aeroporto) REFERENCES aeroporto(codigo)
);

-- Populando aeroporto
INSERT INTO aeroporto (nome, cidade, estado, tamanho) VALUES ('Viracopos','Campinas','SP',3240);
INSERT INTO aeroporto (nome, cidade, estado, tamanho) VALUES ('Guarulhos','Sao Paulo','SP',3700);
INSERT INTO aeroporto (nome, cidade, estado, tamanho) VALUES ('Congonhas','Sao Paulo','SP',1940);
INSERT INTO aeroporto (nome, cidade, estado, tamanho) VALUES ('Santos Dumont','Rio da Janeiro','RJ',1240);
INSERT INTO aeroporto (nome, cidade, estado, tamanho) VALUES ('Jacarépagua','Rio da Janeiro','RJ',900);

-- Populando instancia_trecho
INSERT INTO instancia_trecho (datavoo, num_poltronas, codigo_aeroporto) VALUES ('2013-10-04',340,1);
INSERT INTO instancia_trecho (datavoo, num_poltronas, codigo_aeroporto) VALUES ('2013-10-05',360,1);
INSERT INTO instancia_trecho (datavoo, num_poltronas, codigo_aeroporto) VALUES ('2013-10-06',400,1);
INSERT INTO instancia_trecho (datavoo, num_poltronas, codigo_aeroporto) VALUES ('2013-10-04',250,2);
INSERT INTO instancia_trecho (datavoo, num_poltronas, codigo_aeroporto) VALUES ('2013-10-05',300,2);
INSERT INTO instancia_trecho (datavoo, num_poltronas, codigo_aeroporto) VALUES ('2013-10-04',350,3);
INSERT INTO instancia_trecho (datavoo, num_poltronas, codigo_aeroporto) VALUES ('2013-10-05',350,4);
INSERT INTO instancia_trecho (datavoo, num_poltronas, codigo_aeroporto) VALUES ('2013-10-05',370,4);

-- Mostrando todos os voos
SELECT * FROM instancia_trecho;

-- Mostrando os aeroportos em ordem alfabética
SELECT * FROM aeroporto ORDER BY nome;

-- Mostrando somente os aeroportos de 'São Paulo'
SELECT * FROM aeroporto WHERE estado = 'SP';

-- Mostrando somente os voos com mais de 340 poltronas
SELECT * FROM instancia_trecho WHERE num_poltronas > 340;
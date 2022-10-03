-- DDL

--CREATE
CREATE DATABASE secao4;

CREATE TABLE tipos_produtos(
	id SERIAL PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL
);

CREATE TABLE produtos(
	id SERIAL PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL,
	preco MONEY NOT NULL,
	id_tipo_produto INT NOT NULL
);

CREATE TABLE pacientes(
	id SERIAL PRIMARY KEY,
	nome CHARACTER VARYING(50) NOT NULL,
	endereco CHARACTER VARYING(50) NOT NULL,
	bairro CHARACTER VARYING(40) NOT NULL,
	cidade VARCHAR(40) NOT NULL,
	estado VARCHAR(2) NOT NULL,
	cep VARCHAR(9) NOT NULL,
	data_nascimento DATE NOT NULL
);

-- DML
-- INSERT 
-- tipos_produtos
INSERT INTO tipos_produtos (descricao) VALUES ('Computadores');
INSERT INTO tipos_produtos (descricao) VALUES ('Impressoras');
INSERT INTO tipos_produtos (descricao) VALUES ('Diversos');
--produtos
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Notebook Dell 1544', 2345.67, 1);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Impressora Jato de tinta', 456, 2);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Mouse sem fio', 45, 3);
--pacientes
INSERT INTO pacientes (nome, endereco, bairro, cidade, estado, cep, data_nascimento) 
VALUES ('Angelina Jolie', 'Rua da Paz, 44', 'Nova Lima', 'Santos', 'SP', '121212123', '1978-01-01');
-- UPDATE
UPDATE tipos_produtos SET descricao = 'NoBreak' WHERE id = 2;
-- DELETE 
DELETE FROM produtos WHERE id >= 2;

-- DQL
-- SELECT
SELECT * from tipos_produtos;
SELECT * from produtos;

SELECT
	p.descricao AS Produto, p.preco AS Preço, t.id AS Categoria 
FROM
	produtos AS p, tipos_produtos AS t
WHERE
	p.id_tipo_produto = t.id;

-- DDL
-- ALTER
ALTER TABLE tipos_produtos ADD peso DECIMAL(8,2);
-- DROP
DROP TABLE pacientes;

-- DCL
--  COMANDOS FEITOS NO SERVER CURSO
CREATE USER estagiario WITH PASSWORD '123456';
CREATE TABLE empresas(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	funcionario INT NOT NULL,
	cidade VARCHAR(50) NOT NULL
);
INSERT INTO empresas (nome, funcionario, cidade) VALUES ('Empresa 1', 10, 'Goiânia');
-- GRANT 
GRANT ALL ON empresas TO estagiario;
GRANT USAGE, SELECT ON SEQUENCE empresas_id_seq TO estagiario;
--  COMANDOS FEITOS NO SERVER ESTAGIARIO
INSERT INTO empresas (nome, funcionario, cidade) VALUES ('Empresa 2', 5, 'São Paulo');
INSERT INTO empresas (nome, funcionario, cidade) VALUES ('Empresa 3', 8, 'Salvador');

SELECT * FROM empresas;

UPDATE empresas SET funcionario = 7 WHERE id = 3;

DELETE FROM empresas WHERE cidade = 'São Paulo';

--  COMANDOS FEITOS NO SERVER CURSO
-- REVOKE
REVOKE ALL ON empresas FROM  estagiario;

--  COMANDOS FEITOS NO SERVER ESTAGIARIO : PERMISSÕES NEGADAS

INSERT INTO empresas (nome, funcionario, cidade) VALUES ('Empresa 2', 5, 'São Paulo');

SELECT * FROM empresas;

UPDATE empresas SET funcionario = 6 WHERE id = 3;

DELETE FROM empresas WHERE cidade = 'São Paulo';

--  COMANDOS FEITOS NO SERVER CURSO : CONCEDENDO PERMISSÃO DE LEITURA
GRANT SELECT ON empresas TO estagiario;

--  COMANDOS FEITOS NO SERVER ESTAGIARIO : APENAS SELECT FUNCIONANDO

INSERT INTO empresas (nome, funcionario, cidade) VALUES ('Empresa 2', 5, 'São Paulo');

SELECT * FROM empresas;

UPDATE empresas SET funcionario = 6 WHERE id = 3;

DELETE FROM empresas WHERE cidade = 'São Paulo';

--  COMANDOS FEITOS NO SERVER CURSO
-- DROP
REVOKE ALL ON empresas FROM  estagiario;
REVOKE USAGE, SELECT ON SEQUENCE empresas_id_seq FROM estagiario;
DROP USER estagiario;

-- DTL
-- BEGIN TRANSACTION
BEGIN TRANSACTION;
INSERT INTO tipos_produtos (descricao) VALUES ('Placas de vídeo');
INSERT INTO tipos_produtos (descricao) VALUES ('RAM, HD e SSD');
INSERT INTO tipos_produtos (descricao) VALUES ('Acessórios');
-- COMMIT
COMMIT;

SELECT * FROM tipos_produtos;

BEGIN TRANSACTION;
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('PNY GeForce RTX 3050', 1759.99, 4);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Kingstone 240Gb SATA3 A400', 140, 5);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('JBL Quantum 100', 169.99, 6);

SELECT * FROM produtos;

-- ROLLBACK
ROLLBACK;

SELECT * FROM produtos;

-- Quando fazemos o COMMIT, o ROLLBACK não funciona pois já foi salvo no DB. Ex:
BEGIN TRANSACTION;
INSERT INTO tipos_produtos (descricao) VALUES ('Impressoras');
INSERT INTO tipos_produtos (descricao) VALUES ('Monitores');
COMMIT;
SELECT * FROM tipos_produtos;

ROLLBACK;
SELECT * FROM tipos_produtos;
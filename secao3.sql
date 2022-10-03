-- CREATE DATABASE secao3;

-- SERIAL = INT AUTO_INCREMENT
-- CHARACTER VARYING() = VARCHAR()

CREATE TABLE tipos_produtos(
	id SERIAL PRIMARY KEY,
 descricao CHARACTER VARYING(50) NOT NULL
);

CREATE TABLE produtos (
	id SERIAL PRIMARY KEY,
	descricao CHARACTER VARYING(50) NOT NULL,
	preco MONEY NOT NULL,
	id_tipo_produto INT REFERENCES tipos_produtos(id) NOT NULL
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

CREATE TABLE professores(
 	id SERIAL PRIMARY KEY,
 	telefone INT NOT NULL,
 	nome VARCHAR(50) NOT NULL
);

CREATE TABLE turmas(
 	id SERIAL PRIMARY KEY,
	capacidade INT NOT NULL,
	id_professor INT NOT NULL REFERENCES professores(id) NOT NULL
);

-- INSERTS

-- tipos_produtos
INSERT INTO tipos_produtos (descricao) VALUES ('Computadores');
INSERT INTO tipos_produtos (descricao) VALUES ('Impressoras');
INSERT INTO tipos_produtos (descricao) VALUES ('Diversos');

-- produtos
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Notebook Dell 1544', 2345.67, 1);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Impressora Jato de tinta', 456, 2);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Mouse sem fio', 45, 3);

-- pacientes
INSERT INTO pacientes (nome, endereco, bairro, cidade, estado, cep, data_nascimento)
VALUES ('Angelina Jolie', 'Rua da Paz, 44', 'Nova Lima', 'Santos', 'SP', '121212123', '1978-01-01');

-- SELECTS
SELECT * FROM tipos_produtos;
SELECT * FROM produtos;
SELECT * FROM pacientes;

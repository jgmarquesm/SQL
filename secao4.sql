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


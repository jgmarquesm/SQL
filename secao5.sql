--CREATE DATABASE secao5;

CREATE TABLE tipos_produtos(
	id SERIAL PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL
);

CREATE TABLE produtos(
	id SERIAL PRIMARY KEY,
	descricao VARCHAR(50) NOT NULL,
	preco MONEY NOT NULL,
	id_tipo_produto INT REFERENCES tipos_produtos(id) NOT NULL
);

INSERT INTO tipos_produtos (descricao) VALUES ('Computadores');
INSERT INTO tipos_produtos (descricao) VALUES ('Impressoras');
INSERT INTO tipos_produtos (descricao) VALUES ('Notebook');
INSERT INTO tipos_produtos (descricao) VALUES ('Placas de vídeo');
INSERT INTO tipos_produtos (descricao) VALUES ('RAM, HD e SSD');
INSERT INTO tipos_produtos (descricao) VALUES ('Acessórios');
INSERT INTO tipos_produtos (descricao) VALUES ('Monitores');

INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Desktop', 2000, 1);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Notebook Dell 1544', 2345.67, 3);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Impressora Jato de tinta', 456, 2);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Mouse sem fio', 45, 6);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('PNY GeForce RTX 3050', 1759.99, 4);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Kingstone 240Gb SATA3 A400', 140, 5);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('JBL Quantum 100', 169.99, 6);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Odyssey G9 49" Curvo 240 Hz', 9999.99, 7);

SELECT * FROM tipos_produtos;
SELECT * FROM produtos;

-- Filtro com WHERE
SELECT * FROM tipos_produtos WHERE id = 1;
SELECT * FROM produtos WHERE descricao = 'Desktop';
SELECT * FROM produtos WHERE preco < 'R$ 500';

-- SELECT com multiplas tabelas
SELECT
	p.descricao AS produto, p.preco AS preço, t.descricao AS categoria 
FROM
	produtos AS p, tipos_produtos AS t
WHERE
	p.id_tipo_produto = t.id;
	
-- Junção de tabelas
-- INNER JOIN
SELECT
	p.descricao AS produto, p.preco AS preço, t.descricao AS categoria 
FROM
	produtos AS p INNER JOIN tipos_produtos AS t
ON
	p.id_tipo_produto = t.id;
	
-- LEFT OUTER JOIN
SELECT
	*
FROM
	produtos AS p LEFT OUTER JOIN tipos_produtos AS t
ON
	p.id_tipo_produto = t.id;
	
-- RIGHT OUTER JOIN
SELECT
	* 
FROM
	produtos AS p RIGHT OUTER JOIN tipos_produtos AS t
ON
	p.id_tipo_produto = t.id;
	
-- FULL OUTER JOIN
SELECT
	* 
FROM
	produtos AS p RIGHT OUTER JOIN tipos_produtos AS t
ON
	p.id_tipo_produto = t.id;
	
-- CROSS JOIN
SELECT
	* 
FROM 
	produtos AS p CROSS JOIN tipos_produtos AS t
ON
	p.id_tipo_produto = t.id;

-- SELF JOIN
SELECT
	* 
FROM 
	produtos AS p INNER JOIN tipos_produtos AS t
ON
	p.preco < 'R$ 500';
	
-- Funçoes de Agreção
-- MAX
SELECT MAX(preco) AS valor FROM produtos;
-- MIN
SELECT MIN(preco) AS valor FROM produtos;
-- SELECT AVG(preco) AS valor FROM produtos; -- ERRO PROPOSITAL
-- AVG
SELECT AVG(preco) AS valor FROM produtos;
-- TO_CHAR
SELECT TO_CHAR(AVG(preco::numeric), '999999099') AS Média FROM produtos; -- To_Char
-- ROUND
SELECT ROUND(AVG(preco::numeric), 2) AS Média FROM produtos; -- CAST de tipos e round
-- COUNT
SELECT COUNT(*) AS Qtd FROM produtos;
-- GROUP BY
SELECT id, MAX(preco) FROM produtos GROUP BY id;
-- HAVING
SELECT id, MAX(preco) FROM produtos GROUP BY id HAVING MAX(preco) > 'R$ 500';

-- Agrupamento e Ordenação

CREATE TABLE tipos(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL
);

CREATE TABLE fabricante(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL
);

CREATE TABLE produto(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	id_fabricante INT REFERENCES fabricante(id) NOT NULL,
	quantidade INT NOT NULL,
	id_tipo INT REFERENCES tipos(id) NOT NULL
);

INSERT INTO tipos (nome) VALUES ('Console');
INSERT INTO tipos (nome) VALUES ('Notebook');
INSERT INTO tipos (nome) VALUES ('Celular');
INSERT INTO tipos (nome) VALUES ('Smartphone');
INSERT INTO tipos (nome) VALUES ('Sofá');
INSERT INTO tipos (nome) VALUES ('Armário');
INSERT INTO tipos (nome) VALUES ('Refrigerador');

INSERT INTO fabricante (nome) VALUES ('Sony');
INSERT INTO fabricante (nome) VALUES ('Dell');
INSERT INTO fabricante (nome) VALUES ('Microsoft');
INSERT INTO fabricante (nome) VALUES ('Samsung');
INSERT INTO fabricante (nome) VALUES ('Apple');
INSERT INTO fabricante (nome) VALUES ('Beline');
INSERT INTO fabricante (nome) VALUES ('Magno');
INSERT INTO fabricante (nome) VALUES ('CCE');
INSERT INTO fabricante (nome) VALUES ('Nintendo');

INSERT INTO produto (nome, id_fabricante, quantidade, id_tipo) VALUES ('Playsation 3', 1, 100, 1);
INSERT INTO produto (nome, id_fabricante, quantidade, id_tipo) VALUES ('Core 2 Duo 4GB RAM 500GB HD', 2, 200, 2);
INSERT INTO produto (nome, id_fabricante, quantidade, id_tipo) VALUES ('Xbox360 120GB', 3, 350, 1);
INSERT INTO produto (nome, id_fabricante, quantidade, id_tipo) VALUES ('GT-IG220QUAD BAND', 4, 300, 3);
INSERT INTO produto (nome, id_fabricante, quantidade, id_tipo) VALUES ('iPhone 4 32GB', 5, 50, 4);
INSERT INTO produto (nome, id_fabricante, quantidade, id_tipo) VALUES ('Playstation 2', 1, 100, 1);
INSERT INTO produto (nome, id_fabricante, quantidade, id_tipo) VALUES ('Sofá estofado', 6, 200, 5);
INSERT INTO produto (nome, id_fabricante, quantidade, id_tipo) VALUES ('Ármario de serviço', 7, 50, 6);
INSERT INTO produto (nome, id_fabricante, quantidade, id_tipo) VALUES ('Refrigerador 420L', 8, 200, 7);
INSERT INTO produto (nome, id_fabricante, quantidade, id_tipo) VALUES ('Wii 120GB', 8, 250, 1);

-- GROUP BY
SELECT 
	t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS Quantidade_Em_Estoque
FROM
	tipos AS t, fabricante AS f, produto AS p 
WHERE
	t.id = p.id_tipo AND f.id = p.id_fabricante
GROUP BY 
	t.nome, f.nome;
	
-- HAVING 
SELECT 
	t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS Quantidade_Em_Estoque
FROM
	tipos AS t, fabricante AS f, produto AS p 
WHERE
	t.id = p.id_tipo AND f.id = p.id_fabricante
GROUP BY 
	t.nome, f.nome
HAVING 
	SUM(P.quantidade) > 200;
	
-- ORDER BY ASC
SELECT 
	t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS Quantidade_Em_Estoque
FROM
	tipos AS t, fabricante AS f, produto AS p 
WHERE
	t.id = p.id_tipo AND f.id = p.id_fabricante
GROUP BY 
	t.nome, f.nome
HAVING 
	SUM(P.quantidade) > 200;
--ou
SELECT 
	t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS Quantidade_Em_Estoque
FROM
	tipos AS t, fabricante AS f, produto AS p 
WHERE
	t.id = p.id_tipo AND f.id = p.id_fabricante
GROUP BY 
	t.nome, f.nome
HAVING 
	SUM(P.quantidade) > 200
ORDER BY 
	f.nome ASC;

-- ORDER BY DESC
SELECT 
	t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS Quantidade_Em_Estoque
FROM
	tipos AS t, fabricante AS f, produto AS p 
WHERE
	t.id = p.id_tipo AND f.id = p.id_fabricante
GROUP BY 
	t.nome, f.nome
HAVING 
	SUM(P.quantidade) > 200
ORDER BY 
	f.nome DESC;

-- LIMIT
SELECT 
	t.nome AS Tipo, f.nome AS Fabricante, SUM(p.quantidade) AS Quantidade_Em_Estoque
FROM
	tipos AS t, fabricante AS f, produto AS p 
WHERE
	t.id = p.id_tipo AND f.id = p.id_fabricante
GROUP BY 
	t.nome, f.nome
HAVING 
	SUM(P.quantidade) > 200
ORDER BY 
	f.nome DESC
LIMIT
	2;
	
-- Funções de Data e Hora
-- Data atual
SELECT Current_DATE AS Data_atual;

-- Hora atual
SELECT CURRENT_TIME AS Hora_atual;

-- Calcular data futura
SELECT CURRENT_DATE + INTERVAL '3 DAY'	AS Data_de_Vencimento;
SELECT CURRENT_DATE + INTERVAL '4 WEEK'	AS Data_de_Vencimento;
SELECT CURRENT_DATE + INTERVAL '1 MONTH' AS Data_de_Vencimento;
SELECT CURRENT_DATE + INTERVAL '2 YEAR'	AS Data_de_Vencimento;

-- Calcular data passada 
SELECT CURRENT_DATE - INTERVAL '3 DAY'	AS Data_de_Vencimento;
SELECT CURRENT_DATE - INTERVAL '4 WEEK'	AS Data_de_Vencimento;
SELECT CURRENT_DATE - INTERVAL '1 MONTH' AS Data_de_Vencimento;
SELECT CURRENT_DATE - INTERVAL '2 YEAR'	AS Data_de_Vencimento;

-- Diferença entre datas
-- Em anos
SELECT DATE_PART('year', '2019-01-01'::date) - DATE_PART('year', '2011-10-02'::date) AS Em_Anos;
-- Em meses
SELECT (DATE_PART('year', '2019-01-01'::date) - DATE_PART('year', '2011-10-02'::date)) * 12 +
(DATE_PART('month', '2019-01-01'::date) - DATE_PART('month', '2011-10-02'::date)) AS Em_Meses;
-- Em semanas
SELECT TRUNC(DATE_PART('day', '2019-01-01'::timestamp - '2011-10-02'::timestamp)/7) AS Em_Semanas;
-- Em dias
SELECT DATE_PART('day', '2019-01-01'::timestamp - '2011-10-02'::timestamp) AS Em_Dias;
--- Em horas
SELECT DATE_PART('day', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) * 24 +
DATE_PART('hour', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) AS Em_Horas;
-- Em minutos
SELECT (DATE_PART('day', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) * 24 +
DATE_PART('hour', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp)) * 60 +
DATE_PART('minute', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) AS Em_Minutos;
-- Em segundos
SELECT (DATE_PART('day', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) * 24 +
DATE_PART('hour', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) * 60 +
DATE_PART('minute', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp)) * 60 +
DATE_PART('second', '2019-01-01 11:55'::timestamp - '2019-01-01 09:55'::timestamp) AS Em_Segundos;

-- Formatação
SELECT TO_CHAR(CURRENT_DATE, 'dd/mm/YYYY') AS data_atual;

SELECT TO_CHAR(NOW(), 'dd/mm/YYYY HH24:MM:SS') AS agora;

SELECT TO_CHAR(CURRENT_TIMESTAMP, 'DAY') AS Dia_da_semana;
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'Day') AS Dia_da_semana;
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'day') AS Dia_da_semana;
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'DY') AS Dia_da_semana;
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'Dy') AS Dia_da_semana;
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'dy') AS Dia_da_semana;
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'MONTH') AS Mes;
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'Month') AS Mes;
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'month') AS Mes;
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'MON') AS Mes;
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'Mon') AS Mes;
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'mon') AS Mes;

SHOW lc_time;

-- Dia da semana em Portugues
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'TMDay') AS Dia_da_semana;
SELECT TO_CHAR(CURRENT_TIMESTAMP, 'TMMonth') AS Mes_do_ano;

-- Extraindo partes de uma data
SELECT EXTRACT(MONTH FROM CURRENT_TIMESTAMP) AS Numero_do_Mes;
SELECT EXTRACT(DAY FROM CURRENT_TIMESTAMP) AS Dia_do_Mes;
SELECT EXTRACT(YEAR FROM CURRENT_TIMESTAMP) AS Ano;
SELECT EXTRACT(WEEK FROM CURRENT_TIMESTAMP) AS Numero_da_Semana;
SELECT EXTRACT(HOUR FROM CURRENT_TIMESTAMP) AS Hora;
SELECT EXTRACT(MINUTE FROM CURRENT_TIMESTAMP) AS Minuto;
SELECT EXTRACT(SECOND FROM CURRENT_TIMESTAMP) AS Segundo;
SELECT EXTRACT(MILLISECOND FROM CURRENT_TIMESTAMP) AS Milisegundo;
SELECT EXTRACT(MICROSECOND FROM CURRENT_TIMESTAMP) AS Microsegundo;

-- Data Atual
SELECT NOW() AS data_atual;

--Converter segundo para hora
SELECT TO_CHAR((3600 || 'seconds')::interval, 'HH24:MM:SS') AS Tempo_Total;

--Converter hora para segundo
SELECT EXTRACT(EPOCH FROM CURRENT_TIMESTAMP::time) AS Segundos;

-- SubQuery

CREATE TABLE escritorios(
	id SERIAL PRIMARY KEY,
	pais VARCHAR(30) NOT NULL
);

CREATE TABLE funcionarios(
	id SERIAL PRIMARY KEY, 
	nome VARCHAR(20) NOT NULL,
	sobrenome VARCHAR(20) NOT NULL,
	id_escritorio INT REFERENCES escritorios(id) NOT NULL
);

CREATE TABLE pagamentos(
	id SERIAL PRIMARY KEY,
	id_funcionario INT REFERENCES funcionarios(id) NOT NULL,
	salario DECIMAL(8,2) NOT NULL,
	data DATE NOT NULL
);


INSERT INTO escritorios (pais) VALUES ('Brasil');
INSERT INTO escritorios (pais) VALUES ('Estados Unidos');
INSERT INTO escritorios (pais) VALUES ('Alemanha');
INSERT INTO escritorios (pais) VALUES ('França');

INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Pedro', 'Souza', 1);
INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Sandra', 'Rubin', 2);
INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Mikail', 'Schumer', 3);
INSERT INTO funcionarios (nome, sobrenome, id_escritorio) VALUES ('Olivier', 'Gloçan', 4);

INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (1, '5347.55', '2019-03-17');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (2, '9458.46', '2019-03-17');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (3, '4669.67', '2019-03-17');
INSERT INTO pagamentos (id_funcionario, salario, data) VALUES (4, '2770.32', '2019-03-17');

-- Com SubQuery
SELECT nome, sobrenome FROM funcionarios WHERE id_escritorio IN (SELECT id FROM escritorios WHERE pais = 'Brasil');
-- Sem SubQuery
SELECT nome, sobrenome FROM funcionarios, escritorios AS e WHERE id_escritorio = e.id AND e.pais = 'Brasil';

SELECT f.nome, f.sobrenome, e.pais, p.salario 
	FROM pagamentos AS p, funcionarios AS f, escritorios AS e
	WHERE f.id_escritorio = e.id 
		AND f.id = p.id_funcionario
		AND salario = (SELECT MAX(salario) FROM pagamentos);

SELECT f.nome, f.sobrenome, e.pais, p.salario 
	FROM pagamentos AS p, funcionarios AS f, escritorios AS e
	WHERE f.id_escritorio = e.id 
		AND f.id = p.id_funcionario
		AND salario < (SELECT AVG(salario) FROM pagamentos);
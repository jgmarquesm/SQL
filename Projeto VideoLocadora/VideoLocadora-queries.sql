 -- Consultas
 
 -- Query em cada Tabela
SELECT * FROM atores;
SELECT * FROM generos;
SELECT * FROM filmes;
SELECT * FROM atores_filme;
SELECT * FROM dvds;
SELECT * FROM clientes;
SELECT * FROM emprestimos;
SELECT * FROM filmes_emprestimo;
SELECT * FROM devolucoes;
SELECT * FROM filmes_devolucao;

-- Query: Filmes com gênero Fantasia.
SELECT 
	f.titulo, g.genero, f.valor 
FROM 
	filmes AS f, generos AS g 
WHERE 
	f.id_genero = g.id AND g.genero = 'Fantasia';

-- Query: Atores com seu personagem em um filme (com seu gênero) que está para alugar por valor.
SELECT 
	a.nome, af.personagem, f.titulo, g.genero, f.valor
FROM 
	atores AS a, atores_filme AS af, filmes AS f, generos AS g
WHERE  
	a.id = af.id_ator AND f.id = af.id_filme AND g.id = f.id_genero;

-- Filmes por gênero
SELECT 
	g.genero, COUNT(f.id_genero) AS quantidade 
FROM 
	filmes AS f, generos AS g 
WHERE 
	f.id_genero = g.id 
GROUP BY 
	g.genero;

-- Filmes valor de alguel mais alto
SELECT 
	titulo, valor 
FROM 
	filmes 
WHERE 
	valor 
IN 
	(SELECT MAX(valor) FROM filmes);

-- Query: Selecionar filmes com base no ator (Brad Pitt, nesse caso)
SELECT 
	f.titulo, g.genero, af.personagem 
FROM 
	filmes AS f, atores_filme AS af, generos AS g, atores AS a 
WHERE 
	f.id_genero = g.id AND af.id_filme = f.id AND af.id_ator = a.id AND a.nome = 'Brad Pitt';

-- Query: Selecionar filmes com base no ator (Brad Pitt, nesse caso) e no genero
SELECT 
	a.nome, f.titulo, af.personagem 
FROM 
	filmes AS f, atores_filme AS af, generos AS g, atores AS a 
WHERE 
	f.id_genero = g.id AND af.id_filme = f.id AND af.id_ator = a.id 
	AND a.nome = 'Brad Pitt' AND g.genero = 'Suspense';

-- Query: Algueis por cliente
SELECT 
	e.id AS cod, c.nome, c.sobrenome, f.titulo, e.data AS emprestimo, 
	dev.data AS devolucao
FROM
	filmes AS f, emprestimos AS e, clientes AS c, dvds AS d,
	filmes_emprestimo AS fe, devolucoes AS dev, filmes_devolucao AS fd 
WHERE
	c.id = e.id_cliente AND fe.id_emprestimo = e.id AND fe.id_dvd = d.id
	AND f.id = d.id_filme AND dev.id = fd.id_devolucao 
	AND fd.id_filme_emprestimo = fe.id AND dev.id_emprestimo = e.id;

-- Query: Quando cada cliente pagou
SELECT 
	c.nome, c.sobrenome, SUM(f.valor) AS valor
FROM 
	emprestimos AS e, clientes AS c, filmes AS f, dvds AS d, devolucoes AS dev,
	filmes_emprestimo AS fe, filmes_devolucao AS fd
WHERE
	e.id_cliente = c.id AND dev.id_emprestimo = e.id AND fd.id_devolucao = dev.id
	AND fd.id_filme_emprestimo = fe.id AND fe.id_emprestimo = e.id AND fe.id_dvd = d.id
	AND d.id_filme = f.id
GROUP BY
	e.id, c.nome, c.sobrenome;
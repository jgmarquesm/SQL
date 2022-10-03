-- CREATE DATABASE Videolocadora;

CREATE TABLE generos (
  id SERIAL PRIMARY KEY,
  genero VARCHAR(50) NOT NULL
);

CREATE TABLE filmes (
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(50) NOT NULL,
  id_genero INT REFERENCES generos(id) NOT NULL,
  valor DECIMAL(8, 2) NOT NULL
);

CREATE TABLE dvds (
  id SERIAL PRIMARY KEY,
  id_filme INT REFERENCES filmes(id) NOT NULL,
  quantidade INT NOT NULL
);

CREATE TABLE atores (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(60) NOT NULL
);

CREATE TABLE clientes (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(30) NOT NULL,
  sobrenome VARCHAR(30) NOT NULL,
  telefone VARCHAR(14) NOT NULL,
  endereco VARCHAR(80) NOT NULL
);

CREATE TABLE emprestimos (
  id SERIAL PRIMARY KEY,
  id_cliente INT REFERENCES clientes(id) NOT NULL,
  data DATE NOT NULL
);

CREATE TABLE devolucoes (
  id SERIAL PRIMARY KEY,
  id_emprestimo INT REFERENCES emprestimos(id) NOT NULL,
  data DATE NOT NULL
);

CREATE TABLE atores_filme (
  id SERIAL PRIMARY KEY,
  id_filme INT REFERENCES filmes(id) NOT NULL,
  id_ator INT REFERENCES atores(id) NOT NULL,
  personagem VARCHAR(50) NOT NULL
);

CREATE TABLE filmes_emprestimo (
  id SERIAL PRIMARY KEY,
  id_emprestimo INT REFERENCES emprestimos(id) NOT NULL,
  id_dvd INT REFERENCES dvds(id) NOT NULL
);

CREATE TABLE filmes_devolucao (
  id SERIAL PRIMARY KEY,
  id_devolucao INT REFERENCES devolucoes(id) NOT NULL,
  id_filme_emprestimo INT REFERENCES filmes_emprestimo(id) NOT NULL
);
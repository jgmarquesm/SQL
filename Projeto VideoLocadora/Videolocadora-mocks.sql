-- Inserindo Dados de teste

INSERT INTO atores (nome) VALUES ('Brad Pitt');
INSERT INTO atores (nome) VALUES ('Angelina Jolie');
INSERT INTO atores (nome) VALUES ('Felicity Jones');
INSERT INTO atores (nome) VALUES ('Mark Hamill');
INSERT INTO atores (nome) VALUES ('Steven Guttenberg');
INSERT INTO atores (nome) VALUES ('Christopher Lloyd');

INSERT INTO generos (genero) VALUES ('Comédia');
INSERT INTO generos (genero) VALUES ('Terror');
INSERT INTO generos (genero) VALUES ('Ação');
INSERT INTO generos (genero) VALUES ('Aventura');
INSERT INTO generos (genero) VALUES ('Romance');
INSERT INTO generos (genero) VALUES ('Suspense');
INSERT INTO generos (genero) VALUES ('Fantasia');
INSERT INTO generos (genero) VALUES ('Sci-Fi');

INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Tomb Raider', 19, 6.99);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('O Clube da Luta', 22, 7.99);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Star Wars', 23, 11.99);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Loucademia de polícia', 17, 4.99);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('De volta para o Futuro', 24, 11.99);
INSERT INTO filmes (titulo, id_genero, valor) VALUES ('Rogue One: Uma história Star Wars', 23, 10.99);

INSERT INTO atores_filme (id_filme, id_ator, personagem) VALUES ( 9, 13, 'Tyler Durden');
INSERT INTO atores_filme (id_filme, id_ator, personagem) VALUES ( 8, 14, 'Lara Croft');
INSERT INTO atores_filme (id_filme, id_ator, personagem) VALUES ( 13, 15, 'Jyn Erso');
INSERT INTO atores_filme (id_filme, id_ator, personagem) VALUES ( 10, 16, 'Luke Skywalker');
INSERT INTO atores_filme (id_filme, id_ator, personagem) VALUES ( 11, 17, 'Carey Mahoney');
INSERT INTO atores_filme (id_filme, id_ator, personagem) VALUES ( 12, 18, 'Dr. Emmett Brown');

INSERT INTO dvds (id_filme, quantidade) VALUES (8, 5);
INSERT INTO dvds (id_filme, quantidade) VALUES (9, 5);
INSERT INTO dvds (id_filme, quantidade) VALUES (10, 10);
INSERT INTO dvds (id_filme, quantidade) VALUES (11, 3);
INSERT INTO dvds (id_filme, quantidade) VALUES (12, 10);
INSERT INTO dvds (id_filme, quantidade) VALUES (13, 10);

INSERT INTO clientes (nome, sobrenome, telefone, endereco) VALUES ('Cliente1', 'UM', '11111111111', 'Rua 1');
INSERT INTO clientes (nome, sobrenome, telefone, endereco) VALUES ('Cliente2', 'DOIS', '22222222222', 'Rua 2');
INSERT INTO clientes (nome, sobrenome, telefone, endereco) VALUES ('Cliente3', 'TRES', '33333333333', 'Rua 3');

INSERT INTO emprestimos (id_cliente, data) VALUES ( 1, '2022-09-28');
INSERT INTO emprestimos (id_cliente, data) VALUES ( 2, '2022-10-01');
INSERT INTO emprestimos (id_cliente, data) VALUES ( 3, '2022-10-03');

INSERT INTO filmes_emprestimo (id_emprestimo, id_dvd) VALUES (4, 5);
INSERT INTO filmes_emprestimo (id_emprestimo, id_dvd) VALUES (4, 3);
INSERT INTO filmes_emprestimo (id_emprestimo, id_dvd) VALUES (5, 6);
INSERT INTO filmes_emprestimo (id_emprestimo, id_dvd) VALUES (6, 2);

INSERT INTO devolucoes (id_emprestimo, data) VALUES (4, '2022-10-03');
INSERT INTO devolucoes (id_emprestimo, data) VALUES (4, '2022-10-03');
INSERT INTO devolucoes (id_emprestimo, data) VALUES (5, '2022-10-06');
INSERT INTO devolucoes (id_emprestimo, data) VALUES (6, '2022-10-08');

INSERT INTO filmes_devolucao (id_devolucao, id_filme_emprestimo) VALUES (1, 1);
INSERT INTO filmes_devolucao (id_devolucao, id_filme_emprestimo) VALUES (1, 4);
INSERT INTO filmes_devolucao (id_devolucao, id_filme_emprestimo) VALUES (2, 2);
INSERT INTO filmes_devolucao (id_devolucao, id_filme_emprestimo) VALUES (3, 3);
# SQL - Structure Query Language
Eh dividida em 5 subgrupos:
-  DQL - Data Query Language;
-  DML - Data Manipulation Language;
-  DDL - Data Definition Language;
-  DCL - Data Control Language;
-  DTL - Data Transaction Language;

## DQL
Usado para fazer consultas ao DB.
O subgrupo DQL tem apenas um comando: **SELECT**. Segue a seguinte sintaxe:
`SELECT * FROM nome_da_tabela;` onde o `*` significa que esta pegando todo conteudo da tabela. 
Eh possivel ainda especificar quais colunas da tabela voce quer:
`SELECT nome_da_coluna1, nome_da_coluna2, ... FROM nome_da_tabela;`
Tamebm eh possivel trazer essas informaçoes aplicando um alias:
`SELECT t.nome_da_coluna1 AS col1, t.nome_da_coluna2 AS col2, ... FROM nome_da_tabela AS t;`

## DML
Usado para realizar inclusoes, alteracoes e exclusoes de dados de registros em uma tabela.
O subgrupo tem os seguintes comando: **INSERT**, **UPDATE** e **DELETE**.
- **INSERT**: Usado para inserir um novo registro em uma tabela ja existente
Sintaxe:
`INSERT INTO nome_da_tabela (nome_da_coluna1, nome_da_coluna2) VALUES (valor1, valor2);`
- **UPDATE**: Usado para atualizar valores de atributos de um ou mais registros em uma tabela ja existente
Sintaxe:
`UPDATE nome_da_tabela SET nome_da_coluna1 = novo_valor1 WHERE condiçao;`
- **DELETE**: Usado para deletar um registro em uma tabela ja existente
Sintaxe:
`DELETE FROM nome_da_tabela WHERE condiçao;`

Cuidado com os comandos **UPDATE** e **DELETE**, caso sejam feitos sem condiçao, as alteraçoes serao feitas em toda tabela e 
a unica maneira de recuperar eh com backup do DB.

## DDL
Usado para criar, alterar e excluir DB, tabelas e outros objetos.
O subgrupo tem os seguintes comando: CREATE, ALTER e DROP.
- **CREATE**: Usado para criar um DB, uma Tabela e outros objetos.
Sintaxe:
`CREATE DATABASE nome_do_db;`
`CREATE TABLE nome_da_tabela (id INT PRIMARY KEY, coluna1 TIPO_DE_DADO, coluna2 TIPO_DE_DADO);`
- **ALTER**: Usado para alterar a estrutura de tabelas e outros objetos no DB => Diferente do **UPDATE**.
Sintaxe:
`ALTER table nome_da_tabela ADD coluna3 TIPO_DE_DADO;`
- **DROP**: Usado para excluir DB, tabelas, indice e visao.
Sintaxe:
`DROP TABLE nome_da_tabela;`
`DROP DATABASE nome_do_db;`

## DCL
Usado para controlar os aspectos de autorizacao de dados e licencas de usuarios para controlar quem tem acesso a manipular
os dados dentro do DB.
O subgrupo tem os seguintes comando: GRANT e REVOKE.
- **GRANT**: Usado para autorizar usuarios a executar ou setar operacoes no DB.
Sintaxe:
`GRANT SELECT ON nome_da_tabela TO username;` - Permissao para user realizar consultas.
- **REVOKE**: Usado para remover ou restringir usuarios a executar operacoes no DB.
Sintaxe:
`REVOKE CREATE TABLE FROM username;` Removendo permissao de criacao de tabelas.

## DTL
O subgrupo tem os seguintes comando: BEGIN (ou START TRASACTION - depende do SGBD), COMMIT e ROLLBACK.
- **BEGIN**: Usado para marcar o inicio de uma transacao que pode ou nao ser completada.
- **COMMIT**: Usado para finalizar a transicao.
Sintaxe com COMMIT:
`CREATE TABLE nome_da_tabela (id INT PRIMARY KEY, coluna1 TIPO_DE_DADO, coluna2 TIPO_DE_DADO);`
`BEGIN TRANSACTION;`
`   INSERT INTO nome_da_tabela (nome_da_coluna1, nome_da_coluna2) VALUES (valor1, valor2);`
`   INSERT INTO nome_da_tabela (nome_da_coluna1, nome_da_coluna2) VALUES (valor11, valor22);`
`COMMIT;`
- **ROLLBACK**: Usado para descartar mudancas existentes desde o ultimo COMMIT.
Sintaxe com ROLLBACK:
`CREATE TABLE nome_da_tabela (id INT PRIMARY KEY, coluna1 TIPO_DE_DADO, coluna2 TIPO_DE_DADO);`
`BEGIN TRANSACTION;`
`   INSERT INTO nome_da_tabela (nome_da_coluna1, nome_da_coluna2) VALUES (valor1, valor2);`
`   INSERT INTO nome_da_tabela (nome_da_coluna1, nome_da_coluna2) VALUES (valor11, valor22);`
`ROLLBACK;`

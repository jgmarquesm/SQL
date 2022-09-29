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


### Filtro com WHERE
Alem de aplicar uma condiçao no **UPDATE** e no **DELETE**, tambem eh possivel filtrar o resultado das consultas usando 
**WHERE**. Quando usamos o **WHERE**, o retorno da consulta eh filtrado com base em uma condiçao e a consulta retornada traz
apenas os registros que que satisfazem a condiçao passada.
Sintaxe:
`SELECT nome_da_coluna1, nome_da_coluna2, ... FROM nome_da_tabela WHERE condiçao;`

### Consulta em multiplas Tabelas
Alem de consultas simples, em apenas uma tabela, podemos usar as relaçoes entre os dados de 2 ou mais tabelas para fazer uma
consulta. Para isso temos alguns recursos como o Produto Cartesiano entre tabelas, cuja sintaxe eh:
`SELECT tabela_1.colunaS, tabela_2.colunaS FROM tabela_1, tabela_2 WHERE tabela_1.coluna = tabela_2.coluna;`

## Junçoes
As Junçoes criam uma pseudo-tabela com base nas outras duas tabelas usando conceitos de **Teoria de Conjuntos**.

- **Produto Cartesiano**:
    - Sem o filtro **WHERE**, o produto cartesiano faz uma consulta identica ao **CROSS JOIN**.
    - Com o filtro ***WHERE**, o produto cartesiano faz a mesma consulta que o **INNER JOIN**.
- **INNER JOIN**: O Inner Join (Junçao interna) eh caracterizada por uma consulta que retorna apenas os dados que atender as condiçoes de junçao, isto e, os registros de uma tabela que tem relaçao com outra tabela.
Sintaxe:
`SELECT tabela_1.colunaS, tabela_2.colunaS FROM tabela_1 INNER JOIN tabela_2 ON tabela_1.coluna = tabela_2.coluna;`
- **OUTER JOIN**: Uma junçao externa eh um consulta que nao requer que os registros de uma tabela possuam registros equivalentes. Pode ser subdividida em **LEFT OUTER JOIN** e **RIGHT OUTER JOIN**.
    - **LEFT OUTER JOIN**: O resultado dessa consulta sempre contem os registros da tabela esquerda, mesmo quando nao exista registros correspondentes na tabela direita. Quando nao sao encontrados registros correspondentes na tabela direita os valores nao encontrados retornam como **null**.
    Sintaxe:
    `SELECT tabela_1.colunaS, tabela_2.colunaS FROM tabela_1 LEFT OUTER JOIN tabela_2 ON tabela_1.coluna = tabela_2.coluna;`
    - **RIGHT OUTER JOIN**: O resultado dessa consulta sempre contem os registros da tabela direita, mesmo quando nao exista registros correspondentes na tabela esquerda. Quando nao sao encontrados registros correspondentes na tabela esquerda os valores nao encontrados retornam como **null**.
    Sintaxe:
    `SELECT tabela_1.colunaS, tabela_2.colunaS FROM tabela_1 RIGHT OUTER JOIN tabela_2 ON tabela_1.coluna = tabela_2.coluna;`
    - **FULL OUTER JOIN**: Essa consulta apresenta todos os dados das tabelas a direita e a esquerda, mesmo que nao possuam correspondencia em outra tabela. A tabela combinada possuira assim todos os registros de ambas as tabelas e apresentara os valores nulos para os registros sem correspondencias.
    Sintaxe:
    `SELECT tabela_1.colunaS, tabela_2.colunaS FROM tabela_1 FULL OUTER JOIN tabela_2 ON tabela_1.coluna = tabela_2.coluna;`

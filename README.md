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

- **INNER JOIN**: O Inner Join (Junçao interna) eh caracterizada por uma consulta que retorna apenas os dados que atender as condiçoes de junçao, isto e, os registros 
de uma tabela que tem relaçao com outra tabela.

Sintaxe:

`SELECT tabela_1.colunaS, tabela_2.colunaS FROM tabela_1 INNER JOIN tabela_2 ON tabela_1.coluna = tabela_2.coluna;`

- **OUTER JOIN**: Uma junçao externa eh um consulta que nao requer que os registros de uma tabela possuam registros equivalentes. Pode ser subdividida em **LEFT OUTER
JOIN** e **RIGHT OUTER JOIN**.
    
    - **LEFT OUTER JOIN**: O resultado dessa consulta sempre contem os registros da tabela esquerda, mesmo quando nao exista registros correspondentes na tabela 
    direita. Quando nao sao encontrados registros correspondentes na tabela direita os valores nao encontrados retornam como **null**.
    
    Sintaxe:
    
    `SELECT tabela_1.colunaS, tabela_2.colunaS FROM tabela_1 LEFT OUTER JOIN tabela_2 ON tabela_1.coluna = tabela_2.coluna;`
    
    - **RIGHT OUTER JOIN**: O resultado dessa consulta sempre contem os registros da tabela direita, mesmo quando nao exista registros correspondentes na tabela 
    esquerda. Quando nao sao encontrados registros correspondentes na tabela esquerda os valores nao encontrados retornam como **null**.
   
    Sintaxe:
    
    `SELECT tabela_1.colunaS, tabela_2.colunaS FROM tabela_1 RIGHT OUTER JOIN tabela_2 ON tabela_1.coluna = tabela_2.coluna;`
    
    - **FULL OUTER JOIN**: Essa consulta apresenta todos os dados das tabelas a direita e a esquerda, mesmo que nao possuam correspondencia em outra tabela. A tabela 
    combinada possuira assim todos os registros de ambas as tabelas e apresentara os valores nulos para os registros sem correspondencias.
    
    Sintaxe:
    
    `SELECT tabela_1.colunaS, tabela_2.colunaS FROM tabela_1 FULL OUTER JOIN tabela_2 ON tabela_1.coluna = tabela_2.coluna;`

- **CROSS JOIN**: Essa consulta eh usada quando queremos juntar duas ou mais tabelas por cruzamento. Ou seja, para cada linha de uma tabela queremos todos os dados da 
outra tabela ou vice-versa.

Sintaxe:

`SELECT tabela_1.colunaS, tabela_2.colunaS FROM tabela_1 CROSS JOIN tabela_2;`

- **SELF JOIN**: Essa consulta eh uma junçao interna de uma tabela consigo mesma.

Sintaxe:

`SELECT tabela_1.colunaS, tabela_2.colunaS FROM tabela_1 INNER JOIN tabela_2 ON condiçao1 AND condiçao2;`

- **EQUI-JOIN** (**JOIN**): Junçao baseada em comparador, que usa APENAS comparaçoes de igualdade na junçao.

- EQUI JOIN e outros JOINs:
    - INNER JOIN pode ter as seguintes comparaçoes =, <, > e <>, enquanto o EQUI JOIN nao;
    - INNER JOIN, LEFT OUTER JOIN e RIGHT OUTER JOIN podem ser consideradas EQUI JOIN desde que usem apenas o sinal de igualdade. 

-  **NATURAL JOIN**: Eh um caso especial da **EQUI JOIN**. O resultado dessa junçao eh o connunto de todas as combinaçoes que sao iguais em seus nomes de atributos 
comum. 

Exemplo: Ignora a PK e as FK e faz o JOIN usando o uma coluna da tabela 1 que tem o mesmo nome de uma coluna na tabela 2. 

ISSO PODE LEVAR A ERROS SE NAO FOREM TOMADOS OS DEVIDOS CUIDADOS.

## Funçoes de agregaçao
Uma função de agregação processa um conjunto de valores contidos em uma única coluna de uma tabela e retorna um único valor como resultado.

- **MAX**( ): A função MAX() analisa um conjunto de valores e retorna o maior entre eles.

Sintaxe:

`SELECT MAX(coluna_1) FROM tabela_1;`

`SELECT coluna_1, MAX(coluna_2) FROM tabela_1 GROUP BY coluna_1;`

`SELECT coluna_1, MAX(coluna_2) FROM tabela_1 GROUP BY coluna_1; HAVING condiçao`

- **MIN**( ): A função MIN() analisa um conjunto de valores e retorna o menor entre eles.

Sintaxe:

`SELECT MIN(coluna_1) FROM tabela_1;`

`SELECT coluna_1, MIN(coluna_2) FROM tabela_1 GROUP BY coluna_1;`

`SELECT coluna_1, MIN(coluna_2) FROM tabela_1 GROUP BY coluna_1 HAVING condiçao;`

- **SUM**( ): A função SUM() realiza a soma dos valores em uma única coluna e retorna esse resultado.

Sintaxe:

`SELECT SUM(coluna_1) FROM tabela_1 WHERE condiçao;`

- **AVG**( ): Com a função AVG() podemos calcular a média aritmética dos valores em uma única coluna.

Sintaxe:

`SELECT AVG(coluna_1) FROM tabela_1 WHERE condiçao;`

- **ROUND**( ): Utilizamos a função ROUND() para arredondar valores e desta forma especificar quantascasasdecimais queremos apresentar o valor.

Sintaxe:

`SELECT ROUND(coluna_1, n) FROM tabela_1;`

- **COUNT**( ): A função count() retorna o total de linhas selecionadas. Podemos passar por parâmetro o nome da coluna ou um asterisco. Por padrão, quando informado o
nome de uma coluna, valores do tipo NULL são ignorados, mas quando informado um asterisco (*) todas as linhas serão contabilizadas.

Sintaxe:

`SELECT COUNT(coluna_1) FROM tabela_1;`

`SELECT COUNT(*) FROM tabela_1;`

Esses foram apenas alguns exemplos. Podemos construir queries mais complexas usando as funçoes de agregaçao.
Quando utilizamos uma função de agregação em uma consulta juntamente com outros campos devemos sempre utilizar o agrupamento (**GROUP BY**) por algum elemento da
consulta.
A cláusula **HAVING** funciona quase como um **WHERE**, mas é geralmente utilizada em conjunto com funções de agregação enquanto o WHERE é utilizado como **SELECT**.

## Agrupamentos e Ordenaçao
- **GROUP BY**: Utilizamos a cláusula GROUP BY para agrupar elementos do mesmo tipo.

Exemplo:

`SELECT coluna_1, MIN(coluna_2) FROM tabela_1 GROUP BY coluna_1;`

- **ORDER BY**: A cláusula ORDER BY organiza os dados em ordem alfabética ou numérica. A ordenação pode ser **ASC** (Ascendente) ou **DESC** (Descendente). Por padrão,
a ordenação é ascendente, ou seja, do menor para o maior.

Exemplo:

`SELECT * FROM tabela_1;`

`SELECT coluna_1, coluna_2, ... FROM tabela_1 ORDER BY coluna_2 ASC;`

`SELECT coluna_1, coluna_2, ... FROM tabela_1 ORDER BY coluna_1 DESC;`

Esses foram apenas alguns exemplos. Podemos construir queries mais complexas usando as funçoes de agregaçao.
Quando queremos explicitar o ordenamento nao podemos fazer a consulta usando o *, apenas passando o nome dos campos desejados, uma ves que vamos ordenar por algum
deles.

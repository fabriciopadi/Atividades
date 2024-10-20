

--- 2.1 Na tabela “T_SLV_CATEGORIA”, crie a instrução SQL, comando DDL para alterar o nome da coluna “ds_sigla_categoria” para “ds_sigla_categ”.
ALTER TABLE T_SLV_CATEGORIA RENAME COLUMN DS_SIGLA_CATEGORIA TO DS_SIGLA_CATEG;
DESC T_SLV_CATEGORIA;

---2.2 Na tabela “T_SLV_CATEGORIA”, crie a instrução SQL, comando DDL para alterar o nome da UNIQUE constraint “UN_SLV_CATEGORIA_DESC” para “UN_SLV_CATEG_DESC”
ALTER TABLE T_SLV_CATEGORIA RENAME CONSTRAINT UN_SLV_CATEGORIA_DESC TO UN_SLV_CATEG_DESC;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'T_SLV_CATEGORIA';

---2.3 Na tabela “T_SLV_AUTOR”, crie a instrução SQL, comando DDL para alterar o tamanho da coluna “nm_segundo_autor” para 30 caracteres.
ALTER TABLE T_SLV_AUTOR MODIFY NM_SEGUNDO_AUTOR VARCHAR2(30);
DESC T_SLV_AUTOR;

--- 2.4 Na tabela “T_SLV_AUTOR”, crie a instrução SQL, comando DDL paraadicionar coluna “ds_email”, com tipo de dado VARCHAR2, tamanho 40 caracteres e obrigatória.
ALTER TABLE T_SLV_AUTOR ADD DS_EMAIL VARCHAR2(40) NOT NULL;
DESC T_SLV_AUTOR;

---2.5 Na tabela “T_SLV_AUTOR”, crie a instrução SQL, comando DDL paraalterar o tamanho da coluna “ds_email” para 60 caracteres e elimine a constraint NOT NULL da coluna “ds_email”, utilizando uma única instrução.
ALTER TABLE T_SLV_AUTOR MODIFY DS_EMAIL VARCHAR2(60) NULL;
DESC T_SLV_AUTOR;

---2.6 Na tabela “T_SLV_AUTOR_LIVRO”, crie a instrução SQL, comando DDL para alterar o tamanho da coluna “nr_isbn” para 13 dígitos.
ALTER TABLE T_SLV_AUTOR_LIVRO DROP CONSTRAINT FK_SLV_AUTOR_LIVRO_LIVRO CASCADE;
ALTER TABLE T_SLV_AUTOR_LIVRO MODIFY NR_ISBN NUMBER(13);
DESC T_SLV_AUTOR_LIVRO;

---2.7 Na tabela “T_SLV_LIVRO”, crie a instrução SQL, comando DDL para alteraro tamanho da coluna “nr_isbn” para 13 dígitos. Observe que esta coluna é uma chave primária, uma vez alterada, se faz necessário alterar a chave estrangeira também, como feito primeiramente no item 2.6.
ALTER TABLE T_SLV_LIVRO       MODIFY NR_ISBN NUMBER(13);
ALTER TABLE T_SLV_AUTOR_LIVRO ADD CONSTRAINT FK_SLV_AUTOR_LIVRO_LIVRO FOREIGN KEY(NR_ISBN)  REFERENCES T_SLV_LIVRO(NR_ISBN);


SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'T_SLV_AUTOR_LIVRO';
DESC T_SLV_LIVRO;


---2.8 Na tabela “T_SLV_AUTOR”, crie a instrução SQL, comando DDL para alterar adicionar a coluna “nm_pais_origem” (nome do país de origem do autor), com tipo de dado VARCHAR2, tamanho 30 caracteres e não obrigatório (opcional).
ALTER TABLE T_SLV_AUTOR ADD NM_PAIS_ORIGEM VARCHAR2(30) NULL;
DESC T_SLV_AUTOR;

---2.9 Na tabela “T_SLV_LIVRO”, crie a instrução SQL, comando DDL para alterar adicionar a constraint UNIQUE para a coluna “nm_titulo”. Nomeie a constraint como: “UN_SLV_LIVRO_TITULO”
ALTER TABLE T_SLV_LIVRO ADD CONSTRAINT UN_SLV_LIVRO_TITULO UNIQUE(NM_TITULO);

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'T_SLV_LIVRO';

---2.10 Na tabela “T_SLV_AUTOR_LIVRO”, crie a instrução SQL, comando DDL para eliminar a constraint chave estrangeira “FK_SLV_AUTOR_LIVRO_AUTOR”.
ALTER TABLE T_SLV_AUTOR_LIVRO DROP CONSTRAINT FK_SLV_AUTOR_LIVRO_AUTOR;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'T_SLV_AUTOR_LIVRO';

---2.11 Na tabela “T_SLV_LIVRO”, crie a instrução SQL, comando DDL para eliminar a constraint chave primária “PK_SLV_LIVRO”, com a opção “CASCADE”, que elimina o relacionamento existente.
ALTER TABLE T_SLV_LIVRO DROP CONSTRAINT PK_SLV_LIVRO CASCADE;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'T_SLV_LIVRO';

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'T_SLV_AUTOR_LIVRO';

---2.12 Na tabela “T_SLV_CATEGORIA”, crie a instrução SQL, comando DDL para desabilitar a constraint UNIQUE “UN_SLV_CATEGORIA_SIGLA” associada a coluna “ds_sigla_categ”.
ALTER TABLE T_SLV_CATEGORIA DISABLE CONSTRAINT UN_SLV_CATEGORIA_SIGLA;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION, STATUS
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'T_SLV_CATEGORIA';
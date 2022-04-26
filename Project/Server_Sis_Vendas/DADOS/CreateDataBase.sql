-- usuario usando no banco de dados 'Admin'
-- senha usada no bando de dados 'sa'

-- Neste Scrip contem o inser to usuario Admin do Sistema.
-- Usuario do sistema sempre sera, o Nome dele.
-- Senha do sistema sempre sera a CPF dele.


---------------------------------------------------------------------------
-- CREATE DATA BASE

CREATE DATABASE "DBV"
    WITH 
    OWNER = "Admin"
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
---------------------------------------------------------------------------


-- TABLE CLIENTE
CREATE TABLE IF NOT EXISTS public."CLIENTE"
(
    cod_cliente integer NOT NULL,
    cod_pessoa integer NOT NULL,
    "CPF" character varying COLLATE pg_catalog."default" NOT NULL,
    "NAME" character varying COLLATE pg_catalog."default" NOT NULL,
    "STATUS" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "CLIENTE_pkey" PRIMARY KEY (cod_cliente),
    CONSTRAINT "CLIENTE_CPF_key" UNIQUE ("CPF"),
    CONSTRAINT "CLIENTE_cod_pessoa_key" UNIQUE (cod_pessoa),
    CONSTRAINT "CLIENTE_cod_pessoa_fkey" FOREIGN KEY (cod_pessoa)
        REFERENCES public."PESSOA" (cod_pessoa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."CLIENTE"
    OWNER to "Admin";

--------------------------------------------------------------------------------

-- TABLE DETAL CLIENTE
CREATE TABLE IF NOT EXISTS public."DETAL_VENDA"
(
    "COD_VENDA" integer NOT NULL,
    "COD_PRODUTO" integer NOT NULL,
    "QUANTIDADE" integer NOT NULL,
    "PRODUTO" character varying COLLATE pg_catalog."default",
    "VALOR_TOTAL" real,
    CONSTRAINT "DETAL_VENDA_COD_PRODUTO_fkey" FOREIGN KEY ("COD_PRODUTO")
        REFERENCES public."PRODUTO" (cod_produto) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "DETAL_VENDA_COD_VENDA_fkey" FOREIGN KEY ("COD_VENDA")
        REFERENCES public."VENDA" (cod_venda) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."DETAL_VENDA"
    OWNER to "Admin";
	
-----------------------------------------------------------------------------------

-- TABLE FORNECEDOR

CREATE TABLE IF NOT EXISTS public."FORNECEDOR"
(
    cod_fornecedor integer NOT NULL,
    "CNPJ" character varying COLLATE pg_catalog."default" NOT NULL,
    "NOME_FANTA" character varying COLLATE pg_catalog."default",
    "RAZAO_SOCIAL" character varying COLLATE pg_catalog."default" NOT NULL,
    "STATUS" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "FORNECEDOR_pkey" PRIMARY KEY (cod_fornecedor),
    CONSTRAINT "FORNECEDOR_CNPJ_key" UNIQUE ("CNPJ")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."FORNECEDOR"
    OWNER to "Admin";
	
-------------------------------------------------------------------------------------

-- TABLE PESSOA

CREATE TABLE IF NOT EXISTS public."PESSOA"
(
    cod_pessoa integer NOT NULL,
    "CPF" character varying COLLATE pg_catalog."default" NOT NULL,
    "NAME" character varying COLLATE pg_catalog."default" NOT NULL,
    "CEP" character varying COLLATE pg_catalog."default",
    "ENDERECO" character varying COLLATE pg_catalog."default",
    "TIPO" character varying COLLATE pg_catalog."default",
    CONSTRAINT "PESSOA_pkey" PRIMARY KEY (cod_pessoa),
    CONSTRAINT "PESSOA_CPF_key" UNIQUE ("CPF")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PESSOA"
    OWNER to "Admin";
	
	
INSERT INTO "PESSOA"
VALUES(11,'000.000.000-00','Admin','38400-000','Rua Da Cidade, 0', 'Usuario');	
	
----------------------------------------------------------------------------------------

-- TABLE PRODUTO

CREATE TABLE IF NOT EXISTS public."PRODUTO"
(
    cod_produto integer NOT NULL,
    "DESCRICAO" character varying COLLATE pg_catalog."default" NOT NULL,
    "PRECO" real NOT NULL,
    cod_fornecedor integer NOT NULL,
    status character varying COLLATE pg_catalog."default",
    CONSTRAINT "PRODUTO_pkey" PRIMARY KEY (cod_produto),
    CONSTRAINT "PRODUTO_cod_produto_key" UNIQUE (cod_produto),
    CONSTRAINT "PRODUTO_cod_fornecedor_fkey" FOREIGN KEY (cod_fornecedor)
        REFERENCES public."FORNECEDOR" (cod_fornecedor) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."PRODUTO"
    OWNER to "Admin";
	
------------------------------------------------------------------------------------------

-- USUARIO 

CREATE TABLE IF NOT EXISTS public."USUARIO"
(
    cod_usuario integer NOT NULL,
    "USUARIO" character varying COLLATE pg_catalog."default" NOT NULL,
    "SENHA" character varying COLLATE pg_catalog."default" NOT NULL,
    cod_pessoa integer NOT NULL,
    CONSTRAINT "USUARIO_pkey" PRIMARY KEY (cod_usuario),
    CONSTRAINT "USUARIO_USUARIO_key" UNIQUE ("USUARIO"),
    CONSTRAINT "USUARIO_cod_pessoa_fkey" FOREIGN KEY (cod_pessoa)
        REFERENCES public."PESSOA" (cod_pessoa) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."USUARIO"
    OWNER to "Admin";
	
INSERT INTO "USUARIO"
VALUES(11,'Admin','000.000.000-00',11);	

---------------------------------------------------------------------------------------------

-- TABLE VENDA

CREATE TABLE IF NOT EXISTS public."VENDA"
(
    cod_venda integer NOT NULL,
    "DATA" date NOT NULL,
    "STATUS" character varying COLLATE pg_catalog."default" NOT NULL,
    "COD_CLIENTE" integer NOT NULL,
    CONSTRAINT "VENDA_pkey" PRIMARY KEY (cod_venda),
    CONSTRAINT "VENDA_COD_CLIENTE_fkey" FOREIGN KEY ("COD_CLIENTE")
        REFERENCES public."CLIENTE" (cod_cliente) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."VENDA"
    OWNER to "Admin";
	
----------------------------------------------------------------------------------------------

	
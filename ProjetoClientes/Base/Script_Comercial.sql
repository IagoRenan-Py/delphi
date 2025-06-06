-- Script para criação da estrutura simples do banco de dados Comercial.fdb
-- Compatível com Delphi 10.1 e Firebird 4.0
-- Versão: 1.1
-- Autor: Iago Renan
-- Estrutura normalizada aplicando 1FN, 2FN e 3FN
-- Estrutura normalizada com tabelas ESTADOS e CIDADES
-- (ajustado para normalização e comentários)

-- ========================
-- SEQUÊNCIAS (GENERATORS)
-- ========================
CREATE SEQUENCE GEN_ESTADO_ID;
CREATE SEQUENCE GEN_CIDADE_ID;
CREATE SEQUENCE GEN_ENDERECO_ID;
CREATE SEQUENCE GEN_CLIENTE_ID;
CREATE SEQUENCE GEN_TELEFONE_ID;
CREATE SEQUENCE GEN_EMAIL_ID;

-- =================
-- TABELA ESTADOS
-- =================
CREATE TABLE ESTADOS (
    ID_ESTADO INTEGER NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    SIGLA CHAR(2) NOT NULL,
    CONSTRAINT PK_ESTADOS PRIMARY KEY (ID_ESTADO),
    CONSTRAINT UNQ_ESTADOS_SIGLA UNIQUE (SIGLA)
);

-- =================
-- TABELA CIDADES
-- =================
CREATE TABLE CIDADES (
    ID_CIDADE INTEGER NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    ID_ESTADO INTEGER NOT NULL,
    CONSTRAINT PK_CIDADES PRIMARY KEY (ID_CIDADE),
    CONSTRAINT FK_CIDADES_ESTADO FOREIGN KEY (ID_ESTADO) REFERENCES ESTADOS(ID_ESTADO)
);

-- =================
-- TABELA ENDERECOS
-- =================
CREATE TABLE ENDERECOS (
    ID_ENDERECO INTEGER NOT NULL,
    ENDERECO VARCHAR(100),
    NUMERO VARCHAR(10),
    COMPLEMENTO VARCHAR(50),
    BAIRRO VARCHAR(50),
    CEP VARCHAR(10),
    ID_CIDADE INTEGER,
    CONSTRAINT PK_ENDERECOS PRIMARY KEY (ID_ENDERECO),
    CONSTRAINT FK_ENDERECOS_CIDADE FOREIGN KEY (ID_CIDADE) REFERENCES CIDADES(ID_CIDADE)
);

-- ===================
-- TABELA CLIENTES
-- ===================
CREATE TABLE CLIENTES (
    ID_CLIENTE INTEGER NOT NULL,
    NOME VARCHAR(100) NOT NULL,
    CPF_CNPJ VARCHAR(20),
    TIPO CHAR(1) DEFAULT 'F' NOT NULL, -- F = Física, J = Jurídica
    ID_ENDERECO INTEGER,
    ATIVO CHAR(1) DEFAULT 'A' NOT NULL, -- A = Ativo, I = Inativo
    DATA_CADASTRO TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    DATA_ATUALIZACAO TIMESTAMP,
    OBSERVACOES BLOB SUB_TYPE TEXT,
    CONSTRAINT PK_CLIENTES PRIMARY KEY (ID_CLIENTE),
    CONSTRAINT FK_CLIENTES_ENDERECO FOREIGN KEY (ID_ENDERECO) REFERENCES ENDERECOS(ID_ENDERECO),
    CONSTRAINT CHK_CLIENTES_TIPO CHECK (TIPO IN ('F', 'J')),
    CONSTRAINT CHK_CLIENTES_ATIVO CHECK (ATIVO IN ('A', 'I'))
);

-- Índice para CPF_CNPJ
CREATE INDEX IDX_CLIENTES_CPF_CNPJ ON CLIENTES (CPF_CNPJ);

-- ===========================
-- TABELA TELEFONES_CLIENTES
-- ===========================
CREATE TABLE TELEFONES_CLIENTES (
    ID_TELEFONE INTEGER NOT NULL,
    ID_CLIENTE INTEGER NOT NULL,
    TELEFONE VARCHAR(20) NOT NULL,
    TIPO CHAR(1), -- Exemplo: 'C' = celular, 'R' = residencial, etc.
    CONSTRAINT PK_TELEFONES PRIMARY KEY (ID_TELEFONE),
    CONSTRAINT FK_TELEFONES_CLIENTES FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE)
);

-- ===========================
-- TABELA EMAILS_CLIENTES
-- ===========================
CREATE TABLE EMAILS_CLIENTES (
    ID_EMAIL INTEGER NOT NULL,
    ID_CLIENTE INTEGER NOT NULL,
    EMAIL VARCHAR(100) NOT NULL,
    CONSTRAINT PK_EMAILS PRIMARY KEY (ID_EMAIL),
    CONSTRAINT FK_EMAILS_CLIENTES FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE)
);

-- =================
-- TRIGGERS PARA AUTOINCREMENTO
-- =================

-- Trigger: Auto-incremento ID_ESTADO
CREATE OR ALTER TRIGGER TRG_ESTADOS_BI FOR ESTADOS
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.ID_ESTADO IS NULL) THEN
    NEW.ID_ESTADO = NEXT VALUE FOR GEN_ESTADO_ID;
END;

-- Trigger: Auto-incremento ID_CIDADE
CREATE OR ALTER TRIGGER TRG_CIDADES_BI FOR CIDADES
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.ID_CIDADE IS NULL) THEN
    NEW.ID_CIDADE = NEXT VALUE FOR GEN_CIDADE_ID;
END;

-- Trigger: Auto-incremento ID_ENDERECO
CREATE OR ALTER TRIGGER TRG_ENDERECOS_BI FOR ENDERECOS
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.ID_ENDERECO IS NULL) THEN
    NEW.ID_ENDERECO = NEXT VALUE FOR GEN_ENDERECO_ID;
END;

-- Trigger: Auto-incremento ID_CLIENTE
CREATE OR ALTER TRIGGER TRG_CLIENTES_BI FOR CLIENTES
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.ID_CLIENTE IS NULL) THEN
    NEW.ID_CLIENTE = NEXT VALUE FOR GEN_CLIENTE_ID;
END;

-- Trigger: Auto-incremento ID_TELEFONE
CREATE OR ALTER TRIGGER TRG_TELEFONES_BI FOR TELEFONES_CLIENTES
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.ID_TELEFONE IS NULL) THEN
    NEW.ID_TELEFONE = NEXT VALUE FOR GEN_TELEFONE_ID;
END;

-- Trigger: Auto-incremento ID_EMAIL
CREATE OR ALTER TRIGGER TRG_EMAILS_BI FOR EMAILS_CLIENTES
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
  IF (NEW.ID_EMAIL IS NULL) THEN
    NEW.ID_EMAIL = NEXT VALUE FOR GEN_EMAIL_ID;
END;

-- Trigger: Atualizar DATA_ATUALIZACAO na tabela CLIENTES
CREATE OR ALTER TRIGGER TRG_CLIENTES_BU FOR CLIENTES
ACTIVE BEFORE UPDATE POSITION 0
AS
BEGIN
  NEW.DATA_ATUALIZACAO = CURRENT_TIMESTAMP;
END;

-- =================
-- COMENTÁRIOS NAS COLUNAS CHAR
-- =================

COMMENT ON COLUMN CLIENTES.TIPO IS 'Tipo do cliente: F = Física, J = Jurídica';
COMMENT ON COLUMN CLIENTES.ATIVO IS 'Status do cliente: A = Ativo, I = Inativo';
COMMENT ON COLUMN TELEFONES_CLIENTES.TIPO IS 'Tipo do telefone: C = Celular, R = Residencial, etc.';

-- Finaliza transação
COMMIT WORK;
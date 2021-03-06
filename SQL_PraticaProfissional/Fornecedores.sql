CREATE TABLE FORNECEDORES(
CODIGO INTEGER PRIMARY KEY,
DATA_CAD TIMESTAMP,
DATA_ALT TIMESTAMP,
USER_CAD VARCHAR(40),
USER_ALT VARCHAR(40),
FORNECEDOR  VARCHAR(50) NOT NULL,
NOME_FANTASIA  VARCHAR(30),
CEP VARCHAR(8),
LOGRADOURO VARCHAR(50),
NUMERO INTEGER,
BAIRRO VARCHAR(50),
COD_CIDADE INTEGER NOT NULL,
TELEFONE VARCHAR(12),
EMAIL VARCHAR(40),
CPF VARCHAR(11) NOT NULL UNIQUE,
RG VARCHAR(14),
SEXO INTEGER,
DATA_NASC TIMESTAMP,
TIPO_PESSOA SMALLINT NOT NULL,
COD_CONDPAG INTEGER,
FOREIGN KEY (COD_CIDADE) REFERENCES CIDADES(CODIGO),
FOREIGN KEY (COD_CONDPAG) REFERENCES COND_PAG(CODIGO)
);

alter table fornecedores
add CONTATO VARCHAR(20);

alter table fornecedores
add SITE VARCHAR(30);

ALTER TABLE FORNECEDORES
DROP CPF ;

ALTER TABLE FORNECEDORES
ADD CPF VARCHAR(14) NOT NULL UNIQUE;

ALTER TABLE FORNECEDORES
DROP NUMERO;

ALTER TABLE FORNECEDORES
ADD NUMERO VARCHAR(14);
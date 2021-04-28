CREATE TABLE FUNCIONARIOS(
CODIGO INTEGER PRIMARY KEY,
DATA_CAD TIMESTAMP,
DATA_ALT TIMESTAMP,
USER_CAD VARCHAR(40),
USER_ALT VARCHAR(40),
FUNCIONARIO  VARCHAR(50) NOT NULL,
APELIDO  VARCHAR(30),
CEP VARCHAR(8),
LOGRADOURO VARCHAR(50),
NUMERO INTEGER,
BAIRRO VARCHAR(50),
COD_CIDADE INTEGER NOT NULL,
TELEFONE VARCHAR(12),
EMAIL VARCHAR(40),
CPF VARCHAR(11) NOT NULL UNIQUE,
RG VARCHAR(14),
DATA_ADMISSAO TIMESTAMP,
DATA_DEMISSAO TIMESTAMP,
SALARIO NUMERIC(18,2) NOT NULL, 
COD_CARGO INTEGER NOT NULL,
CNH VARCHAR(11),
CATEGORIA VARCHAR(2),
VALIDADE_CNH TIMESTAMP,
SEXO INTEGER,
FOREIGN KEY (COD_CIDADE) REFERENCES CIDADES(CODIGO),
FOREIGN KEY (COD_CARGO) REFERENCES CARGOS(CODIGO)
);
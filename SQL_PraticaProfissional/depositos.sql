CREATE TABLE DEPOSITOS(
CODIGO INTEGER PRIMARY KEY,
DATA_CAD TIMESTAMP,
DATA_ALT TIMESTAMP,
USER_CAD VARCHAR(40),
USER_ALT VARCHAR(40),
DEPOSITO VARCHAR(40) not null,
LOGRADOURO VARCHAR(40),
NUM VARCHAR(6),
BAIRRO VARCHAR(40),
CEP VARCHAR(8),
COD_CIDADE integer,
foreign key (COD_CIDADE) references CIDADES(CODIGO)
);


alter table depositos
add obs varchar(80);
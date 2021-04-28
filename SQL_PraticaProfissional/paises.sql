create table paises(
codigo integer primary key,
user_cad varchar(50),
user_alt varchar(50),
data_cad timestamp,
data_alt timestamp,
nome varchar(50) not null,
sigla varchar(3) not null,
ddi varchar(4)
);
create table Estados(
codigo integer primary key,
user_cad varchar(50),
user_alt varchar(50),
data_cad timestamp,
data_alt timestamp,
estado varchar(50) not null,
UF varchar(2),
cod_pais integer not null,
foreign key (cod_pais) references paises(codigo)
);
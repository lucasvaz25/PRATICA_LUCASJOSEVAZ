create table cidades(
codigo integer primary key,
user_cad varchar(50),
user_alt varchar(50),
data_cad timestamp,
data_alt timestamp,
cidade varchar (50) not null,
ddd integer,
cod_estado integer not null, 
foreign key (cod_estado) references estados(codigo)
);
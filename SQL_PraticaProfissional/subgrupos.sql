create table subgrupos(
codigo integer primary key,
user_cad varchar(40),
user_alt varchar(40),
data_cad timestamp,
data_alt timestamp,
subgrupo varchar(40),
obs varchar(100),
cod_grupo integer not null,
foreign key (cod_grupo) references grupos(codigo) 
);
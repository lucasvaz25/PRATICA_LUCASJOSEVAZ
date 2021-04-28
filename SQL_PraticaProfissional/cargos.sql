create table CARGOS(
codigo integer primary key,
DATA_CAD TIMESTAMP,
DATA_ALT TIMESTAMP,
USER_CAD VARCHAR(40),
USER_ALT VARCHAR(40),
cargo varchar(40),
cod_departamento integer not null,
foreign key (cod_departamento) references departamentos(codigo) 
);
create table f_pagamentos(
codigo integer primary key,
user_cad varchar(40),
user_alt varchar(40),
data_cad timestamp,
data_alt timestamp,
formapagamento varchar(40),
obs varchar(100)
);
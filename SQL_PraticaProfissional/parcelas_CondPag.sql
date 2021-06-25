CREATE TABLE PARCELAS_CONDPGTO(
	NUMERO 			INTEGER,
	DIAS 			INTEGER,
	PORCENTAGEM		REAL,
	COD_FORMAPGTO 	INTEGER,
	COD_CONDPGTO 	INTEGER,
	PRIMARY KEY (NUMERO, COD_CONDPGTO),
	FOREIGN KEY (COD_FORMAPGTO) REFERENCES F_PAGAMENTOS(CODIGO),	
	FOREIGN KEY (COD_CONDPGTO) REFERENCES COND_PAG(CODIGO)
);
CREATE GENERATOR GEN_PRODUTOS_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER PRODUTOS_BI FOR PRODUTOS
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
IF (NEW.CODIGO IS NULL)   THEN
  NEW.CODIGO = GEN_ID(GEN_PRODUTOS_ID,1);
  IF (NEW.CODIGO = 0)   THEN
  NEW.CODIGO = GEN_ID(GEN_PRODUTOS_ID,1);
END
^


SET TERM ; ^
CREATE GENERATOR GEN_CIDADES_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER CIDADES_BI FOR CIDADES
ACTIVE BEFORE INSERT POSITION 0
AS
begin
if (new.codigo is null)   then
  new.codigo = gen_id(GEN_CIDADES_ID,1);
  if (new.codigo = 0)   then
  new.codigo = gen_id(GEN_CIDADES_ID,1);
end
^


SET TERM ; ^
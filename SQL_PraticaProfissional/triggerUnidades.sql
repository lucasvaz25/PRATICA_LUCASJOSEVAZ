CREATE GENERATOR GEN_unidades_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER unidades_BI FOR unidades
ACTIVE BEFORE INSERT POSITION 0
AS
begin
if (new.codigo is null)   then
  new.codigo = gen_id(GEN_unidades_ID,1);
  if (new.codigo = 0)   then
  new.codigo = gen_id(GEN_unidades_ID,1);
end
^


SET TERM ; ^
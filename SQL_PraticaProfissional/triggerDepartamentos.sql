CREATE GENERATOR GEN_departamentos_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER departamentos_BI FOR departamentos
ACTIVE BEFORE INSERT POSITION 0
AS
begin
if (new.codigo is null)   then
  new.codigo = gen_id(GEN_departamentos_ID,1);
  if (new.codigo = 0)   then
  new.codigo = gen_id(GEN_departamentos_ID,1);
end
^


SET TERM ; ^
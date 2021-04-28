CREATE GENERATOR GEN_grupos_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER grupos_BI FOR grupos
ACTIVE BEFORE INSERT POSITION 0
AS
begin
if (new.codigo is null)   then
  new.codigo = gen_id(GEN_grupos_ID,1);
  if (new.codigo = 0)   then
  new.codigo = gen_id(GEN_grupos_ID,1);
end
^


SET TERM ; ^
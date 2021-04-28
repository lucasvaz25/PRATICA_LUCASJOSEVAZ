CREATE GENERATOR GEN_ESTADOS_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER ESTADOS_BI FOR ESTADOS
ACTIVE BEFORE INSERT POSITION 0
AS
begin
if (new.codigo is null)   then
  new.codigo = gen_id(GEN_ESTADOS_ID,1);
  if (new.codigo = 0)   then
  new.codigo = gen_id(GEN_ESTADOS_ID,1);
end
^


SET TERM ; ^
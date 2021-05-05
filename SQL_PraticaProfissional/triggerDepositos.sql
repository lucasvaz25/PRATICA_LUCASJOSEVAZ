CREATE GENERATOR GEN_depositos_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER depositos_BI FOR depositos
ACTIVE BEFORE INSERT POSITION 0
AS
begin
if (new.codigo is null)   then
  new.codigo = gen_id(GEN_depositos_ID,1);
  if (new.codigo = 0)   then
  new.codigo = gen_id(GEN_depositos_ID,1);
end
^


SET TERM ; ^
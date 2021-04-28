CREATE GENERATOR GEN_PAISES_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER PAISES_BI FOR PAISES
ACTIVE BEFORE INSERT POSITION 0
AS
begin
if (new.codigo is null)   then
  new.codigo = gen_id(GEN_PAISES_ID,1);
  if (new.codigo = 0)   then
  new.codigo = gen_id(GEN_PAISES_ID,1);
end
^


SET TERM ; ^
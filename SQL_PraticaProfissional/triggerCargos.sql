CREATE GENERATOR GEN_cargos_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER cargos_BI FOR cargos
ACTIVE BEFORE INSERT POSITION 0
AS
begin
if (new.codigo is null)   then
  new.codigo = gen_id(GEN_cargos_ID,1);
  if (new.codigo = 0)   then
  new.codigo = gen_id(GEN_cargos_ID,1);
end
^


SET TERM ; ^
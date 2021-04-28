CREATE GENERATOR GEN_clientes_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER clientes_BI FOR clientes
ACTIVE BEFORE INSERT POSITION 0
AS
begin
if (new.codigo is null)   then
  new.codigo = gen_id(GEN_clientes_ID,1);
  if (new.codigo = 0)   then
  new.codigo = gen_id(GEN_clientes_ID,1);
end
^


SET TERM ; ^
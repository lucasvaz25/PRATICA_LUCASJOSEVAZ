CREATE GENERATOR GEN_funcionarios_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER funcionarios_BI FOR funcionarios
ACTIVE BEFORE INSERT POSITION 0
AS
begin
if (new.codigo is null)   then
  new.codigo = gen_id(GEN_funcionarios_ID,1);
  if (new.codigo = 0)   then
  new.codigo = gen_id(GEN_funcionarios_ID,1);
end
^


SET TERM ; ^
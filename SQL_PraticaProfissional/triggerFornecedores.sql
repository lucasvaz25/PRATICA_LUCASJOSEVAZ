CREATE GENERATOR GEN_FORNECEDORES_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER FORNECEDORES_BI FOR FORNECEDORES
ACTIVE BEFORE INSERT POSITION 0
AS
begin
if (new.codigo is null)   then
  new.codigo = gen_id(GEN_FORNECEDORES_ID,1);
  if (new.codigo = 0)   then
  new.codigo = gen_id(GEN_FORNECEDORES_ID,1);
end
^


SET TERM ; ^
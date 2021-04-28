CREATE GENERATOR GEN_cond_pag_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER cond_pag_BI FOR cond_pag
ACTIVE BEFORE INSERT POSITION 0
AS
begin
if (new.codigo is null)   then
  new.codigo = gen_id(GEN_cond_pag_ID,1);
  if (new.codigo = 0)   then
  new.codigo = gen_id(GEN_cond_pag_ID,1);
end
^


SET TERM ; ^
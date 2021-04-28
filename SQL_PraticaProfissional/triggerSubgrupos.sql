CREATE GENERATOR GEN_subgrupos_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER subgrupos_BI FOR subgrupos
ACTIVE BEFORE INSERT POSITION 0
AS
begin
if (new.codigo is null)   then
  new.codigo = gen_id(GEN_subgrupos_ID,1);
  if (new.codigo = 0)   then
  new.codigo = gen_id(GEN_subgrupos_ID,1);
end
^


SET TERM ; ^
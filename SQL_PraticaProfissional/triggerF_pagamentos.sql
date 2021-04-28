CREATE GENERATOR GEN_f_pagamentos_ID;

SET TERM ^ ;



CREATE OR ALTER TRIGGER f_pagamentos_BI FOR f_pagamentos
ACTIVE BEFORE INSERT POSITION 0
AS
begin
if (new.codigo is null)   then
  new.codigo = gen_id(GEN_f_pagamentos_ID,1);
  if (new.codigo = 0)   then
  new.codigo = gen_id(GEN_f_pagamentos_ID,1);
end
^


SET TERM ; ^
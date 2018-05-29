SET GLOBAL event_scheduler = ON;

CREATE EVENT event_insert_pagamento_funcionario
ON SCHEDULE 
EVERY 1 MONTH
DO 
INSERT INTO tbl_pagamento_funcionario_pac (id_funcionario_pac,mes_pagamento) 
SELECT id_funcionario_pac,now() FROM tbl_funcionario_pac;

ALTER EVENT event_insert_pagamento_funcionario ON SCHEDULE EVERY 1 MINUTE;
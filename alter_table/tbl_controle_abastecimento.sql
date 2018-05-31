ALTER TABLE tbl_controle_abastecimento change column longitude longitude double;
ALTER TABLE tbl_controle_abastecimento change column latitute latitude double;

ALTER TABLE tbl_controle_abastecimento ADD COLUMN quilometro_rodado INT NOT NULL;
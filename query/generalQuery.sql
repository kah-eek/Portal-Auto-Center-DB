USE dbautofast;

SELECT * FROM tbl_tipo_combustivel;
DESCRIBE tbl_controle_abastecimento;
SELECT * FROM tbl_veiculo_cliente;
SELECT * FROM tbl_cliente;
SELECT * FROM tbl_veiculo;

ALTER TABLE tbl_controle_abastecimento CHANGE COLUMN longitude longitude DOUBLE;



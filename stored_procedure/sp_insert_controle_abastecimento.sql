DELIMITER $$
CREATE PROCEDURE sp_insert_controle_abastecimento
(
    IN _id_tipo_combustivel INT, 
    IN _id_veiculo_cliente INT, 
    IN _quilometro_rodado FLOAT, 
    IN _valor_abastecimento DECIMAL(6,2), 
    IN _latitude DOUBLE, 
    IN _longitude DOUBLE, 
    IN _log_controle_abastecimento DATETIME,
    OUT response INT
)
BEGIN

	DECLARE _id_veiculo INT ;

    INSERT INTO tbl_controle_abastecimento 
	(
		id_tipo_combustivel, 
		id_veiculo_cliente,
		valor_abastecimento,
		latitude,
		longitude,
		log_controle_abastecimento
	) 
	VALUES
	(
		_id_tipo_combustivel,
		_id_veiculo_cliente,
		_valor_abastecimento,
		_latitude,
		_longitude,
		now()
	);
    
    SET _id_veiculo = (SELECT id_veiculo FROM tbl_veiculo_cliente WHERE id_veiculo_cliente = _id_veiculo_cliente);
    
    UPDATE tbl_veiculo SET quilometro_rodado = _quilometro_rodado WHERE id_veiculo = _id_veiculo;

    IF(ROW_COUNT() > 0) THEN 
		SET response = true;
	ELSE 
		SET response = false;
    END IF;
    
    SELECT response;
  
END $$
DELIMITER ;

CALL sp_insert_controle_abastecimento(4, 1, 22410, 78.41, 0, 0, '2018-05-31 00:00:00', @response);

SELECT @response;
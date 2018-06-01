DELIMITER $$
CREATE PROCEDURE sp_insert_pedido
(
	IN _id_cliente INT, 
    IN _id_produto INT, 
    IN _data_agendada DATETIME,
    OUT response INT
)
BEGIN

	DECLARE id_pedido INT;
	DECLARE id_situacao_pedido INT;
        
    INSERT INTO tbl_pedido
	(
		id_cliente,
		id_produto,
		data_agendada,
		log_pedido
	)
	VALUES
	(
		_id_cliente,
		_id_produto,
		_data_agendada,
		now()
	);
    
	SET id_pedido = LAST_INSERT_ID();
    
    IF(id_pedido != 0) THEN 
    
		INSERT INTO tbl_situacao_pedido 
		(
			id_pedido,
			id_tipo_situacao_pedido,
			log_situacao_pedido
		)
		VALUES
		(
			id_pedido,
			3,
			now()
		);
        
        SET id_situacao_pedido = LAST_INSERT_ID();
        
        IF(id_situacao_pedido != 0) THEN
			
            SET response = id_situacao_pedido;
            
        ELSE
        
			SET response = -1;
        
        END IF;
    
    ELSE
    
		SET response = -1;
    
    END IF;
    
    SELECT response;

END $$
DELIMITER ;

CALL sp_insert_pedido
(
	4, 
    4, 
    '2018-06-02 12:40:00',
    @response
);

SELECT @response;
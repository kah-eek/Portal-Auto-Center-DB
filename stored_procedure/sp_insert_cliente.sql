DELIMITER $$

CREATE PROCEDURE sp_insert_cliente (
	/* VARIÁVEIS DE CADASTRO DO ENDERECO */
	IN _logradouro VARCHAR(210), 
    IN _numero VARCHAR(80), 
    IN _cidade VARCHAR(120), 
    IN _id_estado INT,
    IN _cep VARCHAR(8),
    IN _bairro VARCHAR(120),
    IN _complemento VARCHAR(250),
    
    /* VARIÁVEIS DE CADASTRO DO USUARIO */
    IN _usuario VARCHAR(160),
    IN _senha VARCHAR(280),
    IN _id_nivel_usuario INT,
    
    /* VARIÁVEIS DE CADASTRO DO CLIENTE */
    IN _nome VARCHAR(250),
    IN _dtNasc DATE,
    IN _cpf VARCHAR(11),
    IN _email VARCHAR(280),
    IN _telefone VARCHAR(11),
    IN _foto_perfil VARCHAR(350),
    IN _celular VARCHAR(12),
    IN _sexo CHAR(1),
	
    /* RESPONSE DO INSERT */
    OUT response INT)
BEGIN 
	
   /* VARIAVEIS A SEREM UTILIZADAS */
	DECLARE id_endereco INT;
	DECLARE id_usuario INT;
	DECLARE id_cliente INT;
    /* --------------------------- */

	/* INSERT DO ENDERECO */
	INSERT INTO 

	tbl_endereco
	(
		logradouro, 
		numero, 
		cidade, 
		id_estado, 
		cep, 
		bairro, 
		complemento
	)
	VALUES
	(
		_logradouro, _numero, _cidade, _id_estado, _cep, _bairro, _complemento
	);
    
    /* ARMAZENA O ID DO ENDERECO INSERIDO */
    SET id_endereco = LAST_INSERT_ID();
    
    /* VERIFICA SE A INSERCAO DO ENDERECO OCORREU COM SUCESSO */
    IF(id_endereco != 0) THEN
    
		/* ENDERECO REGISTRADO COM SUCESSO */
		
        /* INSERT DO USUARIO */
        INSERT INTO tbl_usuario 
		(
			usuario,
			senha,
			id_nivel_usuario,
            log
		) 
		VALUES
		(
			_usuario, _senha, _id_nivel_usuario,NOW()
		);
        
        /* ARMAZENA O ID DO USUARIO INSERIDO */
        SET id_usuario = LAST_INSERT_ID();
		
        /* VERIFICA SE A INSERCAO DO USUARIO OCORREU COM SUCESSO */
		IF(id_usuario != 0) THEN 
			
            /* INSERT DO CLIENTE */
            INSERT INTO tbl_cliente
			(
				nome,
				dtNasc,
				cpf,
				email,
				celular,
				id_endereco,
				sexo,
				telefone,
				id_usuario,
				foto_perfil
			)
			VALUES
			(
				_nome, _dtNasc, _cpf, _email, _celular, id_endereco, _sexo, _telefone, id_usuario, _foto_perfil
			);
            
             /* ARMAZENA O ID DO CLIENTE INSERIDO */
			SET id_cliente = LAST_INSERT_ID();
            
            /* VERIFICA SE A INSERCAO DO CLIENTE OCORREU COM SUCESSO */
            IF(id_cliente != 0) THEN
				
                /* ARMAZENA NA RESPONSE O ID DO CLIENTE INSERIDO E A RETORNA */
                SET response = id_cliente;
            
			/* FALAHA AO TENTAR REGISTRAR O USUARIO */
			ELSE
            
				SET response = -1;
            
            END IF;
                        
        /* FALAHA AO TENTAR REGISTRAR O USUARIO */
        ELSE     
			SET @response = -1;
		END IF;
	
    /* FALAHA AO TENTAR REGISTRAR O ENDERECO */
    ELSE
						
		SET response = -1;
        
	END IF;
    /* ----------------------------------------------------------------------------------------------- */
    
    /* RETORNA A RESPONSE FINAL DAS INSERCOES */
    SELECT response;
    
END $$

DELIMITER ;

/*
	TESTE DA STORED PROCEDURE
*/
CALL sp_insert_cliente
(
	/* tbl_endereco */
	'Rua Brasil', 
    '852', 
    'Barueri', 
    1,
    '25621452',
    'Vila Garcia',
    '',
    
    /* tbl_usuario */
    'katia',
    '123',
    3,
    
    /* tbl_cliente */
    'Katia Medeiros Rocha',
    '1985-05-14',
    '10754852154',
    'kkati85@bestbuy.com',
    '1127856985',
    'https://images.unsplash.com/photo-1521117177129-ca6b2e68cb26?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=cce4201e8d3a1905d4a5e7a99b2dfd53&dpr=1&auto=format&fit=crop&w=1000&q=80&cs=tinysrgb',
    '11978542152',
    'F',
    @response
);
SELECT @response;

select * from tbl_cliente;
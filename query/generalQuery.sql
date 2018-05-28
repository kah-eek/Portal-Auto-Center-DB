USE dbautofast;

select * from tbl_tipo_combustivel;
select * from tbl_veiculo_cliente;
select * from tbl_controle_abastecimento;


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
	3,
    1,
    280,
    0,
    0,
    now()
);


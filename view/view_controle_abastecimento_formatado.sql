/*
	VIEW DE EXIBICAO DOS DADOS DE CONTROLE DE ABASTECIMENTO
*/
ALTER VIEW view_controle_abastecimento_formatado AS 
SELECT 

/* tbl_controle_abastecimento */
ca.id_controle_abastecimento, 
ca.id_tipo_combustivel, 
ca.id_veiculo_cliente, 
ca.quilometro_rodado, 
ca.valor_abastecimento, 
ca.latitude, 
ca.longitude, 
DATE_FORMAT(DATE(ca.log_controle_abastecimento), "%d/%m/%Y") AS log_controle_abastecimento, 

/* tbl_tipo_combustivel */
tc.combustivel,

/* tbl_cliente */
c.id_cliente

FROM 

tbl_controle_abastecimento AS ca

INNER JOIN tbl_tipo_combustivel AS tc ON tc.id_tipo_combustivel = ca.id_tipo_combustivel
INNER JOIN tbl_veiculo_cliente AS vc ON vc.id_veiculo_cliente = ca.id_veiculo_cliente
INNER JOIN tbl_cliente AS c ON c.id_cliente = vc.id_cliente;

select * from view_controle_abastecimento_formatado;
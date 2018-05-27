/*
	VIEW DE VEÍCULO DO CLIENTE, PODENDO SER OBTIDO QUAL O VEÍCULO (ID_VEICULO) O CLIENTE POSSUÍ JUNTO A PLACA DO VEÍCULO
*/
CREATE VIEW view_veiculo_cliente AS 

SELECT 

/* tbl_veiculo_cliente */
vc.id_veiculo, 
vc.id_cliente,

/* tbl_veiculo */
v.placa

/* tbl_veiculo_cliente */
FROM tbl_veiculo_cliente AS vc

/* tbl_veiculo */
INNER JOIN tbl_veiculo AS v ON v.id_veiculo = vc.id_veiculo;
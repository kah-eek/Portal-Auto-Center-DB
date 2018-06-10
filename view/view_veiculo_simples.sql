/*
Modelo
Fabricante
Ano
Foto do veiculo
*/
CREATE VIEW view_veiculo_simples AS
SELECT

/* tbl_modelo_veiculo */
m.modelo,

/* tbl_fabricante */
f.fabricante,

/* tbl_veiculo */
v.ano_fabricacao,

/* tbl_imagem_veiculo_parceiro */
img.imagem,
img.ativo

FROM 

tbl_veiculo AS v

INNER JOIN tbl_modelo_veiculo AS m ON m.id_modelo_veiculo = v.id_modelo_veiculo

INNER JOIN tbl_veiculo_parceiro AS vp ON vp.id_veiculo = v.id_veiculo

INNER JOIN tbl_fabricante AS f ON f.id_fabricante = m.id_fabricante

INNER JOIN tbl_imagem_veiculo_parceiro AS img ON img.id_veiculo_parceiro = vp.id_veiculo_parceiro;

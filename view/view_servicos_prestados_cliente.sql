/*
	VIEW DE OBTENÇÃO DOS DADOS DOS SERVICOS PRESTADOS AOS CLIENTES
*/
ALTER VIEW view_servicos_prestados_cliente AS

SELECT 

/* tbl_produto */
p.nome,
p.preco,

/* tbl_parceiro */
pa.nome_fantasia,

/* tbl_situacao_pedido */
sp.log_situacao_pedido,

/* tbl_tipo_situacaco_pedido 
tsp.situacao,*/
tsp.id_tipo_situacao_pedido,

/* tbl_pedido */
pe.id_cliente

/* tbl_categria_produto 
cp.categoria
*/

FROM tbl_produto AS p

/* tbl_categoria_produto */
INNER JOIN tbl_categoria_produto AS cp ON cp.id_categoria_produto = p.id_categoria_produto

/* tbl_modelo_produto */
LEFT JOIN tbl_modelo_produto AS mp ON mp.id_modelo_produto = p.id_modelo_produto

/* tbl_parceiro */
INNER JOIN tbl_parceiro AS pa ON pa.id_parceiro = p.id_parceiro

/* tbl_pedido */
INNER JOIN tbl_pedido AS pe ON pe.id_produto = p.id_produto

/* tbl_situacao_pedido */
INNER JOIN tbl_situacao_pedido AS sp ON sp.id_pedido = pe.id_pedido

/* tbl_tipo_situacaco_pedido */
INNER JOIN tbl_tipo_situacao_pedido AS tsp ON tsp.id_tipo_situacao_pedido = sp.id_tipo_situacao_pedido;

SELECT * FROM view_servicos_prestados_cliente WHERE id_tipo_situacao_pedido = 1 AND id_cliente = 1;


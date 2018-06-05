/*
nome do servico
valor do servico
parceiro que ira fazer o servico
data agendada para a realizacacao do servico 

obs: os servcicos so irao aparecer se o status deles forem de confirmados 
*/

ALTER VIEW view_produtos_vendidos AS

SELECT 

/* tbl_produto */
p.nome AS produto,
p.preco,

/*tbl_parceiro*/
pa.nome_fantasia,

/* tbl_situacao_pedido */
sp.id_tipo_situacao_pedido,

/* tbl_cliente */
c.id_cliente
 
FROM 

tbl_produto AS p

INNER JOIN tbl_parceiro AS pa ON pa.id_parceiro = p.id_parceiro

INNER JOIN tbl_pedido AS pe ON pe.id_produto = p.id_produto

INNER JOIN tbl_situacao_pedido AS sp ON sp.id_pedido = pe.id_pedido

INNER JOIN tbl_cliente AS c ON c.id_cliente = pe.id_cliente;

SELECT * FROM view_produtos_vendidos WHERE (id_tipo_situacao_pedido = 7 OR id_tipo_situacao_pedido = 9) AND id_cliente = 2;
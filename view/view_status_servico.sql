ALTER VIEW view_status_servico AS 

SELECT 

/* tbl_produto*/
p.nome AS nome_servico,

/* tbl_pedido */
DATE_FORMAT(DATE(pe.data_agendada),"%d/%m/%Y") AS data_agendada,

/* tbl_cliente */
c.nome AS nome_cliente,

/* tbl_situacao_pedido */
s.id_situacao_pedido,

/* tbl_tipo_situacao_pedido */
ts.situacao

FROM tbl_produto AS p

INNER JOIN tbl_pedido AS pe ON pe.id_produto = p.id_produto

INNER JOIN tbl_cliente AS c ON c.id_cliente = pe.id_cliente

INNER JOIN tbl_situacao_pedido AS s ON s.id_pedido = pe.id_pedido

INNER JOIN tbl_tipo_situacao_pedido AS ts ON ts.id_tipo_situacao_pedido = s.id_tipo_situacao_pedido;

SELECT * FROM view_status_servico;
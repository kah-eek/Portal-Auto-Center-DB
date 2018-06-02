CREATE EVENT event_set_pedido_pendente
ON SCHEDULE
EVERY 2 MINUTE
DO
UPDATE tbl_situacao_pedido AS s 

INNER JOIN tbl_pedido AS p ON s.id_pedido = p.id_pedido
INNER JOIN tbl_produto AS prd on prd.id_produto = p.id_produto

SET id_tipo_situacao_pedido = 2 WHERE id_tipo_situacao_pedido = 4 AND prd.id_categoria_produto = 2;

ALTER EVENT event_set_pedido_pendente ON SCHEDULE EVERY 30 SECOND;
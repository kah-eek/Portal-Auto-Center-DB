CREATE EVENT event_set_pedido_pendente
ON SCHEDULE
EVERY 2 MINUTE
DO
UPDATE tbl_situacao_pedido SET id_tipo_situacao_pedido = 2 WHERE id_tipo_situacao_pedido = 4;

ALTER EVENT event_set_pedido_pendente ON SCHEDULE EVERY 30 SECOND;
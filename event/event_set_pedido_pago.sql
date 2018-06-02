CREATE EVENT event_set_pedido_pago
ON SCHEDULE
EVERY 2 MINUTE
DO
UPDATE tbl_situacao_pedido SET id_tipo_situacao_pedido = 4 WHERE id_tipo_situacao_pedido = 3;

ALTER EVENT event_set_pedido_pago ON SCHEDULE EVERY 30 SECOND;
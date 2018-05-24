USE dbautofast;

SELECT * FROM tbl_cliente;

ALTER TABLE tbl_topico_forum CHANGE id_topico_forum id_topico_forum INT NOT NULL AUTO_INCREMENT;

DESCRIBE tbl_topico_forum;

ALTER TABLE tbl_comentario_topico_forum CHANGE log log DATETIME NOT NULL;
DESCRIBE tbl_comentario_topico_forum;

CREATE VIEW view_servico AS

SELECT

p.*,  
pa.id_usuario

FROM tbl_produto as p 

INNER JOIN tbl_parceiro AS pa ON pa.id_parceiro = p.id_parceiro
INNER JOIN tbl_usuario AS u ON u.id_usuario = pa.id_usuario;
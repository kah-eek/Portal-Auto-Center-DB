ALTER VIEW view_prestadores_servicos AS


SELECT 

p.id_parceiro,  
p.nome_fantasia

FROM tbl_parceiro AS p

INNER JOIN tbl_produto AS pr ON pr.id_parceiro = p.id_parceiro

WHERE pr.id_categoria_produto = 2 GROUP BY id_parceiro;

SELECT * FROM view_prestadores_servicos;
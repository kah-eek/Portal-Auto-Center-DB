ALTER VIEW view_prestadores_servicos AS

SELECT 

/* tbl_parceiro */
p.id_parceiro,  
p.nome_fantasia,

/* tbl_produto */
pr.id_produto,
pr.nome

FROM tbl_parceiro AS p

INNER JOIN tbl_produto AS pr ON pr.id_parceiro = p.id_parceiro

WHERE pr.id_categoria_produto = 2;

SELECT * FROM view_prestadores_servicos WHERE id_produto = 3;
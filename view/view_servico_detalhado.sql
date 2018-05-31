ALTER VIEW view_servico_detalhado AS 

SELECT 

/* tbl_produto */
p.id_produto, 
p.id_parceiro, 
p.id_categoria_produto, 
p.nome, 
p.preco, 
p.descricao, 
p.observacao,

/* tbl_parceiro */
pr.email,

/* tbl_endereco */
e.logradouro,
e.numero,
e.cidade,

/* tbl_endereco */
es.estado

FROM tbl_produto AS P

INNER JOIN tbl_parceiro As pr ON pr.id_parceiro = p.id_parceiro

INNER JOIN tbl_endereco AS e On e.id_endereco = pr.id_endereco

INNER JOIN tbl_estado AS es ON es.id_estado = e.id_estado

WHERE id_categoria_produto = 2;

SELECT * FROM view_servico_detalhado WHERE id_parceiro = 1;
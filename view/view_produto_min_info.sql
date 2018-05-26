ALTER VIEW view_produto_min_info AS 

SELECT 

/* tbl_produto  */
p.id_produto, 
p.nome, 
p.preco, 

/* tbl_fabricante_produto */
f.fabricante,

/* tbl_imagem_produto_parceiro */
i.imagem,

/* tbl_categoria_produto */
c.categoria,
c.id_categoria_produto

/* tbl_produto  */
FROM tbl_produto AS p

/* tbl_modelo_produto */
INNER JOIN tbl_modelo_produto AS m ON m.id_modelo_produto = p.id_modelo_produto

/* tbl_fabricante_produto */
INNER JOIN tbl_fabricante_produto AS f ON f.id_fabricante_produto = m.id_fabricante_produto

/* tbl_imagem_produto_parceiro */
INNER JOIN tbl_imagem_produto_parceiro AS i ON i.id_produto = p.id_produto

/* tbl_categoria_produto */
INNER JOIN tbl_categoria_produto AS c ON c.id_categoria_produto = p.id_categoria_produto;

SELECT * FROM view_produto_min_info GROUP BY id_produto;
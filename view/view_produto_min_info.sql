CREATE VIEW view_produto_min_info AS 

SELECT 

/* tbl_produto  */
p.id_produto, 
p.nome, 
p.preco, 

/* tbl_fabricante_produto */
f.fabricante

/* tbl_produto  */
FROM tbl_produto AS p

/* tbl_modelo_produto */
INNER JOIN tbl_modelo_produto AS m ON m.id_modelo_produto = p.id_modelo_produto

/* tbl_fabricante_produto */
INNER JOIN tbl_fabricante_produto AS f ON f.id_fabricante_produto = m.id_fabricante_produto;

SELECT * FROM view_produto_min_info;
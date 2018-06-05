USE dbautofast;

SELECT * FROM tbl_produto;
desc tbl_endereco;
SELECT * FROM tbl_situacao_pedido;
SELECT * FROM tbl_tipo_situacao_pedido;


/*
	usar este select para exibir os servicos confirmados e recusados pelo parceiro 
    obs.: tratar os servicos recusados dos confirmados na aplicacao
*/
SELECT * FROM view_servico_prestado WHERE (id_tipo_situacao_pedido = 1 OR id_tipo_situacao_pedido = 6) AND id_cliente = 2;

/*
	usar este select para exibir os produtos enviados e envio recusados pelo parceiro 
    obs.: tratar os produtos enviados dos nao enviados na aplicacao
*/
SELECT * FROM view_produtos_vendidos WHERE (id_tipo_situacao_pedido = 7 OR id_tipo_situacao_pedido = 9) AND id_cliente = 2;
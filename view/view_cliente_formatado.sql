/*
	VIEW DE OBTENÇÃO DOS DADOS VINCULADOS AO CLIENTE DE FORMA FORMATADA
*/
CREATE VIEW view_cliente_formatado AS 

SELECT 

/* tbl_usuario */
u.id_usuario,
u.usuario,
u.senha,
DATE_FORMAT(DATE(u.log),"%d/%m/%Y") AS log,
u.ativo,

/* tbl_cliente */
c.id_cliente,
c.nome,
DATE_FORMAT(c.dtNasc,"%d/%m/%Y") AS dataNascimento,
c.cpf,
c.email,
c.celular,
c.id_endereco,
c.sexo,
c.telefone,
c.foto_perfil AS fotoPerfil,

/* tbl_endereco */
e.logradouro,
e.numero AS numeroResidencial,
e.cidade,
e.cep,
e.bairro,
e.complemento,

/* tbl_estado */
es.estado

/* tbl_usuario */
FROM tbl_usuario AS u

/* tbl_cliente */
INNER JOIN tbl_cliente AS c ON c.id_usuario = u.id_usuario

/* tbl_endereco */
INNER JOIN tbl_endereco AS e ON e.id_endereco = c.id_endereco

/* tbl_estado */
INNER JOIN tbl_estado AS es ON es.id_estado = e.id_estado;

SELECT * FROM view_cliente_formatado;
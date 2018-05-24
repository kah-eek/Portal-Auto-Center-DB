INSERT INTO tbl_cliente
(
	nome,
    dtNasc,
    cpf,
    email,
    celular,
    id_endereco,
    sexo,
    telefone,
    id_usuario,
    foto_perfil
)
VALUES
(
	'Paulo Matias de Souza',
    '1980-06-01',
    '85698875489',
    'paulo.souza@outlook.com',
    '11912546587',
    1,
    'M',
    '1145875485',
    34,
    'https://images.unsplash.com/photo-1482264851290-446b18e3ee9f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=052be30858afa91142f02f6a3df7f639&dpr=1&auto=format&fit=crop&w=1000&q=80&cs=tinysrgb'
);

SELECT * FROM tbl_cliente;
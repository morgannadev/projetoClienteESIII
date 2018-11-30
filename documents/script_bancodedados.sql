-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE TB_USUARIO (
id_usuario Número(4) PRIMARY KEY,
usuario varchar,
senha varchar
)

CREATE TABLE TB_TIPO_RESIDENCIA (
id_tipo_residencia Número(4) PRIMARY KEY,
tipo_residencia varchar
)

CREATE TABLE TB_TIPO_LOGRADOURO (
id_tipo_logradouro Número(4) PRIMARY KEY,
tipo_logradouro varchar
)

CREATE TABLE TB_PAIS (
id_pais Número(4) PRIMARY KEY,
pais varchar
)

CREATE TABLE TB_ESTADO (
id_estado Número(4) PRIMARY KEY,
estado varchar,
id_pais Número(4),
FOREIGN KEY(id_pais) REFERENCES TB_PAIS (id_pais)
)

CREATE TABLE TB_CIDADE (
id_cidade Número(4) PRIMARY KEY,
cidade varchar,
id_estado Número(4),
FOREIGN KEY(id_estado) REFERENCES TB_ESTADO (id_estado)
)

CREATE TABLE TB_BAIRRO (
id_bairro Número(4) PRIMARY KEY,
bairro varchar,
id_cidade Número(4),
FOREIGN KEY(id_cidade) REFERENCES TB_CIDADE (id_cidade)
)

CREATE TABLE TB_ENDERECO (
id_endereco Número(4) PRIMARY KEY,
logradouro varchar,
numero Número(6),
cep varchar,
observacoes varchar,
id_tipo_logradouro Número(4),
id_tipo_residencia Número(4),
id_tipo_endereco Número(4),
id_bairro Número(4),
id_cidade Número(4),
id_estado Número(4),
id_pais Número(4),
FOREIGN KEY(id_tipo_logradouro) REFERENCES TB_TIPO_LOGRADOURO (id_tipo_logradouro),
FOREIGN KEY(id_tipo_residencia) REFERENCES TB_TIPO_RESIDENCIA (id_tipo_residencia),
FOREIGN KEY(id_bairro) REFERENCES TB_BAIRRO (id_bairro),
FOREIGN KEY(id_cidade) REFERENCES TB_CIDADE (id_cidade),
FOREIGN KEY(id_estado) REFERENCES TB_ESTADO (id_estado),
FOREIGN KEY(id_pais) REFERENCES TB_PAIS (id_pais)
)

CREATE TABLE TB_TIPO_ENDERECO (
id_tipo_endereco Número(4) PRIMARY KEY,
tipo_endereco varchar
)

CREATE TABLE TB_CARTAO (
id_cartao Número(4) PRIMARY KEY,
cartao varchar,
is_preferencial boolean,
numero_cartao varchar,
codigo_seguranca Número(3),
id_tipo_cartao Número(4),
id_bandeira Número(4)
)

CREATE TABLE TB_TIPO_CARTAO (
id_tipo_cartao Número(4) PRIMARY KEY,
tipo_cartao varchar
)

CREATE TABLE TB_BANDEIRA (
id_bandeira Número(4) PRIMARY KEY,
bandeira varchar
)

-- Erro: Nome de tabela duplicado (este erro compromete a integridade referencial)!
CREATE TABLE TB_USUARIO (
id_usuario Número(4) PRIMARY KEY,
usuario varchar,
senha varchar
)

CREATE TABLE TB_TRANSACAO (
id_transacao Número(4) PRIMARY KEY,
transacao varchar
)

CREATE TABLE TB_TELEFONE (
id_telefone Número(4),
ddd Número(2),
telefone varchar,
id_tipo_telefone Número(4)
)

CREATE TABLE TB_TIPO_TELEFONE (
id_tipo_telefone Número(4) PRIMARY KEY,
tipo_telefone varchar
)

CREATE TABLE TB_STATUS_CLIENTE (
id_status_cliente Número(4) PRIMARY KEY,
status_cliente varchar
)

CREATE TABLE TB_RANKING (
id_ranking Número(4) PRIMARY KEY,
ranking Número(4)
)

CREATE TABLE TB_GENERO (
id_genero Número(4) PRIMARY KEY,
genero varchar
)

CREATE TABLE TB_CLIENTE (
id_cliente Número(4) PRIMARY KEY,
nome varchar,
cpf varchar,
data_nascimento timestamp,
email varchar,
id_genero Número(4),
id_telefone Número(4),
id_endereco Número(4),
id_ranking Número(4),
id_transacao Número(4),
id_usuario Número(4),
id_status_cliente Número(4),
FOREIGN KEY(id_genero) REFERENCES TB_GENERO (id_genero),
FOREIGN KEY(/*erro: ??*/) REFERENCES TB_TELEFONE (),
FOREIGN KEY(id_endereco) REFERENCES TB_ENDERECO (id_endereco),
FOREIGN KEY(id_ranking) REFERENCES TB_RANKING (id_ranking),
FOREIGN KEY(id_transacao) REFERENCES TB_TRANSACAO (id_transacao),
FOREIGN KEY(id_usuario) REFERENCES TB_USUARIO (id_usuario),
FOREIGN KEY(id_status_cliente) REFERENCES TB_STATUS_CLIENTE (id_status_cliente)
)

ALTER TABLE TB_ENDERECO ADD FOREIGN KEY(id_tipo_endereco) REFERENCES TB_TIPO_ENDERECO (id_tipo_endereco)
ALTER TABLE TB_CARTAO ADD FOREIGN KEY(id_tipo_cartao) REFERENCES TB_TIPO_CARTAO (id_tipo_cartao)
ALTER TABLE TB_CARTAO ADD FOREIGN KEY(id_bandeira) REFERENCES TB_BANDEIRA (id_bandeira)
ALTER TABLE TB_TELEFONE ADD FOREIGN KEY(id_tipo_telefone) REFERENCES TB_TIPO_TELEFONE (id_tipo_telefone)

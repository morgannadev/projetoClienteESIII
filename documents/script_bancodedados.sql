CREATE DATABASE projetoweb;

USE projetoweb;

CREATE TABLE IF NOT EXISTS TB_TIPO_LOGRADOURO (
    id_tipo_logradouro INT(4) AUTO_INCREMENT,
    tipo_logradouro VARCHAR(255),
	data_cadastro DATETIME,
    PRIMARY KEY (id_tipo_logradouro)
);

CREATE TABLE IF NOT EXISTS TB_TIPO_ENDERECO (
	id_tipo_endereco INT(4) AUTO_INCREMENT,
	tipo_endereco VARCHAR(255),
	data_cadastro DATETIME,
	PRIMARY KEY (id_tipo_endereco)
);

CREATE TABLE IF NOT EXISTS TB_TIPO_RESIDENCIA (
	id_tipo_residencia INT(4) AUTO_INCREMENT,
	tipo_residencia VARCHAR(255),
	data_cadastro DATETIME,
	PRIMARY KEY (id_tipo_residencia)
);

CREATE TABLE IF NOT EXISTS TB_PAIS (
	id_pais INT(4) AUTO_INCREMENT,
	pais VARCHAR(255),
	data_cadastro DATETIME,
	PRIMARY KEY (id_pais)
);

CREATE TABLE IF NOT EXISTS TB_ESTADO (
	id_estado INT(4) AUTO_INCREMENT,
	estado VARCHAR(255),
	id_pais INT(4),
	data_cadastro DATETIME,
	PRIMARY KEY (id_estado),
	FOREIGN KEY(id_pais) REFERENCES TB_PAIS (id_pais)
);

CREATE TABLE IF NOT EXISTS TB_CIDADE (
	id_cidade INT(4) AUTO_INCREMENT,
	cidade VARCHAR(100),
	id_estado INT(4),
	data_cadastro DATETIME,
	PRIMARY KEY (id_cidade),
	FOREIGN KEY(id_estado) REFERENCES TB_ESTADO (id_estado)
);

CREATE TABLE IF NOT EXISTS TB_BAIRRO (
	id_bairro INT(4) AUTO_INCREMENT,
	bairro VARCHAR(100),
	id_cidade INT(4),
	data_cadastro DATETIME,
	PRIMARY KEY (id_bairro),
	FOREIGN KEY(id_cidade) REFERENCES TB_CIDADE (id_cidade)
);

CREATE TABLE IF NOT EXISTS TB_ENDERECO (
	id_endereco INT(4) AUTO_INCREMENT,
	logradouro VARCHAR(100),
	numero INT(6),
	cep VARCHAR(8),
	observacoes VARCHAR(255),
	data_cadastro DATETIME,
	id_tipo_logradouro INT(4),
	id_tipo_residencia INT(4),
	id_tipo_endereco INT(4),
	id_bairro INT(4),
	id_cidade INT(4),
	id_estado INT(4),
	id_pais INT(4),
	PRIMARY KEY (id_endereco),
	FOREIGN KEY(id_tipo_logradouro) REFERENCES TB_TIPO_LOGRADOURO (id_tipo_logradouro),
	FOREIGN KEY(id_tipo_residencia) REFERENCES TB_TIPO_RESIDENCIA (id_tipo_residencia),
	FOREIGN KEY(id_tipo_endereco) REFERENCES TB_TIPO_ENDERECO (id_tipo_endereco),
	FOREIGN KEY(id_bairro) REFERENCES TB_BAIRRO (id_bairro),
	FOREIGN KEY(id_cidade) REFERENCES TB_CIDADE (id_cidade),
	FOREIGN KEY(id_estado) REFERENCES TB_ESTADO (id_estado),
	FOREIGN KEY(id_pais) REFERENCES TB_PAIS (id_pais)
);

CREATE TABLE IF NOT EXISTS TB_TIPO_CARTAO (
	id_tipo_cartao INT(4) AUTO_INCREMENT,
	tipo_cartao VARCHAR(20),
	data_cadastro DATETIME,
	PRIMARY KEY (id_tipo_cartao)
);

CREATE TABLE IF NOT EXISTS TB_BANDEIRA (
	id_bandeira INT(4) AUTO_INCREMENT,
	bandeira VARCHAR(30),
	data_cadastro DATETIME,
	PRIMARY KEY (id_bandeira)
);

CREATE TABLE IF NOT EXISTS TB_CARTAO (
	id_cartao INT(4) AUTO_INCREMENT,
	cartao VARCHAR(255),
	is_preferencial BOOLEAN,
	numero_cartao VARCHAR(16),
	codigo_seguranca INT(3),
	id_tipo_cartao INT(4),
	id_bandeira INT(4),
	data_cadastro DATETIME,
	PRIMARY KEY (id_cartao),
	FOREIGN KEY(id_tipo_cartao) REFERENCES TB_TIPO_CARTAO (id_tipo_cartao),
	FOREIGN KEY(id_bandeira) REFERENCES TB_BANDEIRA (id_bandeira)
);

CREATE TABLE IF NOT EXISTS TB_STATUS_CLIENTE (
	id_status_cliente INT(4) AUTO_INCREMENT,
	status_cliente VARCHAR(15),
	data_cadastro DATETIME,
	PRIMARY KEY (id_status_cliente)
);

CREATE TABLE IF NOT EXISTS TB_RANKING (
	id_ranking INT(4) AUTO_INCREMENT,
	ranking INT(4),
	data_cadastro DATETIME,
	PRIMARY KEY (id_ranking)
);

CREATE TABLE IF NOT EXISTS TB_TIPO_TELEFONE (
	id_tipo_telefone INT(4) AUTO_INCREMENT,
	tipo_telefone VARCHAR(15),
	data_cadastro DATETIME,
	PRIMARY KEY (id_tipo_telefone)
);

CREATE TABLE IF NOT EXISTS TB_TELEFONE (
	id_telefone INT(4) AUTO_INCREMENT,
	ddd INT(2),
	telefone VARCHAR(10),
	id_tipo_telefone INT(4),
	data_cadastro DATETIME,
	PRIMARY KEY (id_telefone),
	FOREIGN KEY(id_tipo_telefone) REFERENCES TB_TIPO_TELEFONE (id_tipo_telefone)
);

CREATE TABLE IF NOT EXISTS TB_TRANSACAO (
	id_transacao INT(4) AUTO_INCREMENT,
	transacao VARCHAR(255),
	data_cadastro DATETIME,
	PRIMARY KEY (id_transacao)
);

CREATE TABLE IF NOT EXISTS TB_USUARIO (
	id_usuario INT(4) AUTO_INCREMENT,
	usuario VARCHAR(20),
	senha VARCHAR(20),
	data_cadastro DATETIME,
	PRIMARY KEY (id_usuario)
);

CREATE TABLE IF NOT EXISTS TB_GENERO (
	id_genero INT(4) AUTO_INCREMENT,
	genero VARCHAR(30),
	data_cadastro DATETIME, 
	PRIMARY KEY (id_genero)
);

CREATE TABLE IF NOT EXISTS TB_CLIENTE (
	id_cliente INT(4) AUTO_INCREMENT,
	nome VARCHAR(255),
	cpf VARCHAR(11),
	data_nascimento DATETIME,
	email VARCHAR(255),
	id_genero INT(4),
	id_endereco INT(4),
	id_ranking INT(4),
	id_transacao INT(4),
	id_usuario INT(4),
	id_status_cliente INT(4),
	id_cartao INT(4),
	id_telefone INT(4),
	data_cadastro DATETIME,
	PRIMARY KEY (id_cliente),
	FOREIGN KEY(id_genero) REFERENCES TB_GENERO (id_genero),
	FOREIGN KEY(id_endereco) REFERENCES TB_ENDERECO (id_endereco),
	FOREIGN KEY(id_ranking) REFERENCES TB_RANKING (id_ranking),
	FOREIGN KEY(id_transacao) REFERENCES TB_TRANSACAO (id_transacao),
	FOREIGN KEY(id_usuario) REFERENCES TB_USUARIO (id_usuario),
	FOREIGN KEY(id_status_cliente) REFERENCES TB_STATUS_CLIENTE (id_status_cliente),
	FOREIGN KEY(id_cartao) REFERENCES TB_CARTAO (id_cartao),
	FOREIGN KEY(id_telefone) REFERENCES TB_TELEFONE (id_telefone)
);

-- considerando dados abaixo para teste

INSERT INTO TB_USUARIO (usuario, senha, data_cadastro) VALUES ('morganna', '123', now());
INSERT INTO TB_USUARIO (usuario, senha, data_cadastro) VALUES ('user', '123', now());

INSERT INTO TB_GENERO (genero, data_cadastro) VALUES ('Feminino', now());
INSERT INTO TB_GENERO (genero, data_cadastro) VALUES ('Masculino', now());
INSERT INTO TB_GENERO (genero, data_cadastro) VALUES ('Outros', now());

INSERT INTO TB_PAIS (pais, data_cadastro) VALUES ('Brasil', now());

INSERT INTO TB_TRANSACAO (transacao, data_cadastro) VALUES ('Cadastro', now());
INSERT INTO TB_TRANSACAO (transacao, data_cadastro) VALUES ('Alteração', now());

INSERT INTO TB_TIPO_TELEFONE (tipo_telefone, data_cadastro) VALUES ('Residencial', now());
INSERT INTO TB_TIPO_TELEFONE (tipo_telefone, data_cadastro) VALUES ('Comercial', now());
INSERT INTO TB_TIPO_TELEFONE (tipo_telefone, data_cadastro) VALUES ('Celular', now());

INSERT INTO TB_TIPO_RESIDENCIA (tipo_residencia, data_cadastro) VALUES ('Casa', now());
INSERT INTO TB_TIPO_RESIDENCIA (tipo_residencia, data_cadastro) VALUES ('Apartamento', now());
INSERT INTO TB_TIPO_RESIDENCIA (tipo_residencia, data_cadastro) VALUES ('Comercial', now());

INSERT INTO TB_TIPO_LOGRADOURO (tipo_logradouro, data_cadastro) VALUES ('Rua', now());
INSERT INTO TB_TIPO_LOGRADOURO (tipo_logradouro, data_cadastro) VALUES ('Avenida', now());
INSERT INTO TB_TIPO_LOGRADOURO (tipo_logradouro, data_cadastro) VALUES ('Travessa', now());
INSERT INTO TB_TIPO_LOGRADOURO (tipo_logradouro, data_cadastro) VALUES ('Viela', now());
INSERT INTO TB_TIPO_LOGRADOURO (tipo_logradouro, data_cadastro) VALUES ('Rodovia', now());

INSERT INTO TB_TIPO_ENDERECO (tipo_endereco, data_cadastro) VALUES ('Residencial', now());
INSERT INTO TB_TIPO_ENDERECO (tipo_endereco, data_cadastro) VALUES ('Cobrança', now());
INSERT INTO TB_TIPO_ENDERECO (tipo_endereco, data_cadastro) VALUES ('Entrega', now());

INSERT INTO TB_TIPO_CARTAO (tipo_cartao, data_cadastro) VALUES ('Crédito', now());
INSERT INTO TB_TIPO_CARTAO (tipo_cartao, data_cadastro) VALUES ('Débito', now());

INSERT INTO TB_STATUS_CLIENTE (status_cliente, data_cadastro) VALUES ('Ativo', now());
INSERT INTO TB_STATUS_CLIENTE (status_cliente, data_cadastro) VALUES ('Inativo', now());

INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('SP', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('MG', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('RS', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('BA', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('PR', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('SC', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('GO', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('PA', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('RJ', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('DF', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('PE', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('ES', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('CE', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('AM', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('MA', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('MT', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('MS', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('AL', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('PB', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('RR', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('SE', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('RO', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('RN', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('TO', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('PI', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('AC', 1, now());
INSERT INTO TB_ESTADO (estado, id_pais, data_cadastro) VALUES ('AP', 1, now());

INSERT INTO TB_CIDADE (cidade, id_estado, data_cadastro) VALUES ('Mogi das Cruzes', 1, now());
INSERT INTO TB_CIDADE (cidade, id_estado, data_cadastro) VALUES ('São Paulo', 1, now());
INSERT INTO TB_CIDADE (cidade, id_estado, data_cadastro) VALUES ('Belo Horizonte', 2, now());
INSERT INTO TB_CIDADE (cidade, id_estado, data_cadastro) VALUES ('Porto Alegre', 3, now());
INSERT INTO TB_CIDADE (cidade, id_estado, data_cadastro) VALUES ('Salvador', 4, now());

INSERT INTO TB_BANDEIRA (bandeira, data_cadastro) VALUES ('Visa', now());
INSERT INTO TB_BANDEIRA (bandeira, data_cadastro) VALUES ('Mastercard', now());

INSERT INTO TB_BAIRRO (bairro, id_cidade, data_cadastro) VALUES ('Cezar de Souza', 1, now());
INSERT INTO TB_BAIRRO (bairro, id_cidade, data_cadastro) VALUES ('Braz Cubas', 1, now());
INSERT INTO TB_BAIRRO (bairro, id_cidade, data_cadastro) VALUES ('Pinheiros', 2, now());
INSERT INTO TB_BAIRRO (bairro, id_cidade, data_cadastro) VALUES ('Bela Vista', 2, now());

INSERT INTO TB_TELEFONE (ddd, telefone, id_tipo_telefone, data_cadastro) VALUES (11, '989891232', 3, now());
INSERT INTO TB_TELEFONE (ddd, telefone, id_tipo_telefone, data_cadastro) VALUES (11, '46469900', 1, now());
INSERT INTO TB_TELEFONE (ddd, telefone, id_tipo_telefone, data_cadastro) VALUES (11, '34343232', 2, now());

INSERT INTO TB_CARTAO (cartao, is_preferencial, numero_cartao, id_tipo_cartao, id_bandeira, data_cadastro) 
			   VALUES ('cartão', true, '1234567890123456', 1, 1, now());
INSERT INTO TB_CARTAO (cartao, is_preferencial, numero_cartao, id_tipo_cartao, id_bandeira, data_cadastro) 
			   VALUES ('cartão', false, '0987654321098765', 1, 2, now());
			   
INSERT INTO TB_RANKING (ranking, data_cadastro) VALUES (1, now());
INSERT INTO TB_RANKING (ranking, data_cadastro) VALUES (2, now());
INSERT INTO TB_RANKING (ranking, data_cadastro) VALUES (3, now());

INSERT INTO TB_ENDERECO (logradouro, numero, cep, observacoes, data_cadastro, id_tipo_logradouro,
						 id_tipo_residencia, id_tipo_endereco, id_bairro, id_cidade, id_estado, id_pais)
				 VALUES ('Rua das Flores', 12, '09009090', '', now(), 1, 1, 1, 2, 1, 1, 1);
INSERT INTO TB_ENDERECO (logradouro, numero, cep, observacoes, data_cadastro, id_tipo_logradouro,
						 id_tipo_residencia, id_tipo_endereco, id_bairro, id_cidade, id_estado, id_pais)
				 VALUES ('Avenida Brasil', 8722, '08080888', '', now(), 2, 1, 1, 4, 2, 1, 1);
				 
INSERT INTO TB_CLIENTE (nome, cpf, data_nascimento, email, id_genero, id_endereco, id_ranking, id_transacao,
						id_usuario, id_status_cliente, id_cartao, id_telefone, data_cadastro)
				VALUES ('Josefina Cunha', '12345678901', now(), 'josefina@email.com', 1, 1, 1, 1, 1, 1, 1, 1, now());
INSERT INTO TB_CLIENTE (nome, cpf, data_nascimento, email, id_genero, id_endereco, id_ranking, id_transacao,
						id_usuario, id_status_cliente, id_cartao, id_telefone, data_cadastro)
				VALUES ('Marcelino Pedroso', '45678901234', now(), 'marcelino@email.com.br', 2, 2, 2, 2, 2, 2, 2, 2, now());
                
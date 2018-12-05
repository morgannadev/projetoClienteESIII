CREATE DATABASE projetoweb;

USE projetoweb;

CREATE TABLE IF NOT EXISTS TB_TIPO_LOGRADOURO (
    id_tipo_logradouro INT(4) AUTO_INCREMENT,
    tipo_logradouro VARCHAR(255) NOT NULL,
	data_cadastro DATETIME NOT NULL,
    PRIMARY KEY (id_tipo_logradouro)
);

CREATE TABLE IF NOT EXISTS TB_TIPO_ENDERECO (
	id_tipo_endereco INT(4) AUTO_INCREMENT,
	tipo_endereco VARCHAR(255) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	PRIMARY KEY (id_tipo_endereco)
);

CREATE TABLE IF NOT EXISTS TB_TIPO_RESIDENCIA (
	id_tipo_residencia INT(4) AUTO_INCREMENT,
	tipo_residencia VARCHAR(255) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	PRIMARY KEY (id_tipo_residencia)
);

CREATE TABLE IF NOT EXISTS TB_PAIS (
	id_pais INT(4) AUTO_INCREMENT,
	pais VARCHAR(255) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	PRIMARY KEY (id_pais)
);

CREATE TABLE IF NOT EXISTS TB_ESTADO (
	id_estado INT(4) AUTO_INCREMENT,
	estado VARCHAR(255) NOT NULL,
	id_pais INT(4),
	data_cadastro DATETIME,
	PRIMARY KEY (id_estado),
	FOREIGN KEY(id_pais) REFERENCES TB_PAIS (id_pais)
);

CREATE TABLE IF NOT EXISTS TB_CIDADE (
	id_cidade INT(4) AUTO_INCREMENT,
	cidade VARCHAR(100) NOT NULL,
	id_estado INT(4),
	data_cadastro DATETIME NOT NULL,
	PRIMARY KEY (id_cidade),
	FOREIGN KEY(id_estado) REFERENCES TB_ESTADO (id_estado)
);

CREATE TABLE IF NOT EXISTS TB_BAIRRO (
	id_bairro INT(4) AUTO_INCREMENT,
	bairro VARCHAR(100) NOT NULL,
	id_cidade INT(4),
	data_cadastro DATETIME NOT NULL,
	PRIMARY KEY (id_bairro),
	FOREIGN KEY(id_cidade) REFERENCES TB_CIDADE (id_cidade)
);

CREATE TABLE IF NOT EXISTS TB_ENDERECO (
	id_endereco INT(4) AUTO_INCREMENT,
	logradouro VARCHAR(100) NOT NULL,
	numero INT(6) NOT NULL,
	cep VARCHAR(8) NOT NULL,
	observacoes VARCHAR(255) NOT NULL,
	data_cadastro DATETIME NOT NULL,
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
	tipo_cartao VARCHAR(20) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	PRIMARY KEY (id_tipo_cartao)
);

CREATE TABLE IF NOT EXISTS TB_BANDEIRA (
	id_bandeira INT(4) AUTO_INCREMENT,
	bandeira VARCHAR(30) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	PRIMARY KEY (id_bandeira)
);

CREATE TABLE IF NOT EXISTS TB_CARTAO (
	id_cartao INT(4) AUTO_INCREMENT,
	cartao VARCHAR(255) NOT NULL,
	is_preferencial BOOLEAN NOT NULL,
	numero_cartao VARCHAR(16) NOT NULL,
	codigo_seguranca INT(3),
	id_tipo_cartao INT(4),
	id_bandeira INT(4),
	data_cadastro DATETIME NOT NULL,
	PRIMARY KEY (id_cartao),
	FOREIGN KEY(id_tipo_cartao) REFERENCES TB_TIPO_CARTAO (id_tipo_cartao),
	FOREIGN KEY(id_bandeira) REFERENCES TB_BANDEIRA (id_bandeira)
);

CREATE TABLE IF NOT EXISTS TB_STATUS_CLIENTE (
	id_status_cliente INT(4) AUTO_INCREMENT,
	status_cliente VARCHAR(15) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	PRIMARY KEY (id_status_cliente)
);

CREATE TABLE IF NOT EXISTS TB_RANKING (
	id_ranking INT(4) AUTO_INCREMENT,
	ranking INT(4) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	PRIMARY KEY (id_ranking)
);

CREATE TABLE IF NOT EXISTS TB_TIPO_TELEFONE (
	id_tipo_telefone INT(4) AUTO_INCREMENT,
	tipo_telefone VARCHAR(15) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	PRIMARY KEY (id_tipo_telefone)
);

CREATE TABLE IF NOT EXISTS TB_TELEFONE (
	id_telefone INT(4) AUTO_INCREMENT,
	ddd INT(2) NOT NULL,
	telefone VARCHAR(10) NOT NULL,
	id_tipo_telefone INT(4),
	data_cadastro DATETIME NOT NULL,
	PRIMARY KEY (id_telefone),
	FOREIGN KEY(id_tipo_telefone) REFERENCES TB_TIPO_TELEFONE (id_tipo_telefone)
);

CREATE TABLE IF NOT EXISTS TB_TRANSACAO (
	id_transacao INT(4) AUTO_INCREMENT,
	transacao VARCHAR(255) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	PRIMARY KEY (id_transacao)
);

CREATE TABLE IF NOT EXISTS TB_USUARIO (
	id_usuario INT(4) AUTO_INCREMENT,
	usuario VARCHAR(20) NOT NULL,
	senha VARCHAR(20) NOT NULL,
	data_cadastro DATETIME NOT NULL,
	PRIMARY KEY (id_usuario)
);

CREATE TABLE IF NOT EXISTS TB_GENERO (
	id_genero INT(4) AUTO_INCREMENT,
	genero VARCHAR(30) NOT NULL,
	data_cadastro DATETIME NOT NULL, 
	PRIMARY KEY (id_genero)
);

CREATE TABLE IF NOT EXISTS TB_CLIENTE (
	id_cliente INT(4) AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	data_nascimento DATETIME NOT NULL,
	email VARCHAR(255) NOT NULL,
	id_genero INT(4),
	id_endereco INT(4),
	id_ranking INT(4),
	id_transacao INT(4),
	id_usuario INT(4),
	id_status_cliente INT(4),
	id_cartao INT(4),
	id_telefone INT(4),
	data_cadastro DATETIME NOT NULL,
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
create database IF NOT EXISTS dbpedidos;

use dbpedidos;

create table IF NOT EXISTS cidade (
    id_cidade int NOT NULL AUTO_INCREMENT,
    nome varchar(100) NOT NULL,
    id_estado char(2) NOT NULL,
    PRIMARY KEY(id_cidade),
    FOREIGN KEY(id_estado) REFERENCES estado(id_estado)
);

create table IF NOT EXISTS estado (
    id_estado char(2) NOT NULL,
    nome varchar(100) NOT NULL,
    PRIMARY KEY(id_estado)
);

create table IF NOT EXISTS cliente (
    id_cliente int NOT NULL AUTO_INCREMENT,
    nome varchar(100) NOT NULL,
    id_cidade int NOT NULL,
    PRIMARY KEY(id_cliente),
    FOREIGN KEY(id_cidade) REFERENCES cidade(id_cidade)
);

create table IF NOT EXISTS faixa (
    id_faixa int NOT NULL AUTO_INCREMENT,
    valor_comissao double NOT NULL,
    PRIMARY KEY(id_faixa)
);

create table IF NOT EXISTS vendedor (
    id_vendedor int NOT NULL AUTO_INCREMENT,
    nome varchar(100) NOT NULL,
    salario double NOT NULL,
    id_faixa int NOT NULL,
    PRIMARY KEY(id_vendedor),
    FOREIGN KEY(id_faixa) REFERENCES faixa(id_faixa)
);

create table IF NOT EXISTS pedido (
    id_pedido int NOT NULL AUTO_INCREMENT,
    id_cliente int NOT NULL,
    id_vendedor int NOT NULL,
    PRIMARY KEY(id_pedido),
    FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY(id_vendedor) REFERENCES vendedor(id_vendedor)
);

create table IF NOT EXISTS unidade (
    id_unidade int NOT NULL AUTO_INCREMENT,
    descricao varchar(20) NOT NULL,
    PRIMARY KEY(id_unidade)
);

create table IF NOT EXISTS produto (
    id_produto int NOT NULL AUTO_INCREMENT,
    descricao varchar(100) NOT NULL,
    valor_unitario double NOT NULL,
    id_unidade int NOT NULL,
    PRIMARY KEY(id_produto),
    FOREIGN KEY(id_unidade) REFERENCES unidade(id_unidade)
);

create table IF NOT EXISTS pedido_produto (
    id_pedido int NOT NULL,
    id_produto int NOT NULL,
    quantidade int NOT NULL,
    PRIMARY KEY(id_pedido, id_produto),
    FOREIGN KEY(id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY(id_produto) REFERENCES produto(id_produto)
);

-- INSERT INTO estado (id_estado, nome) VALUES ('AC', 'Acre');
-- INSERT INTO estado (id_estado, nome) VALUES ('AL', 'Alagoas');
-- INSERT INTO estado (id_estado, nome) VALUES ('AP', 'Amapá');
-- INSERT INTO estado (id_estado, nome) VALUES ('AM', 'Amazonas');
-- INSERT INTO estado (id_estado, nome) VALUES ('BA', 'Bahia');
-- INSERT INTO estado (id_estado, nome) VALUES ('CE', 'Ceará');
-- INSERT INTO estado (id_estado, nome) VALUES ('DF', 'Distrito Federal');
-- INSERT INTO estado (id_estado, nome) VALUES ('ES', 'Espírito Santo');
-- INSERT INTO estado (id_estado, nome) VALUES ('GO', 'Goiás');
-- INSERT INTO estado (id_estado, nome) VALUES ('MA', 'Maranhão');
-- INSERT INTO estado (id_estado, nome) VALUES ('MT', 'Mato Grosso');
-- INSERT INTO estado (id_estado, nome) VALUES ('MS', 'Mato Grosso do Sul');
-- INSERT INTO estado (id_estado, nome) VALUES ('MG', 'Minas Gerais');
-- INSERT INTO estado (id_estado, nome) VALUES ('PA', 'Pará');
-- INSERT INTO estado (id_estado, nome) VALUES ('PB', 'Paraíba');
-- INSERT INTO estado (id_estado, nome) VALUES ('PR', 'Paraná');
-- INSERT INTO estado (id_estado, nome) VALUES ('PE', 'Pernambuco');
-- INSERT INTO estado (id_estado, nome) VALUES ('PI', 'Piauí');
-- INSERT INTO estado (id_estado, nome) VALUES ('RJ', 'Rio de Janeiro');
-- INSERT INTO estado (id_estado, nome) VALUES ('RN', 'Rio Grande do Norte');
-- INSERT INTO estado (id_estado, nome) VALUES ('RS', 'Rio Grande do Sul');
-- INSERT INTO estado (id_estado, nome) VALUES ('RO', 'Rondônia');
-- INSERT INTO estado (id_estado, nome) VALUES ('RR', 'Roraima');
-- INSERT INTO estado (id_estado, nome) VALUES ('SC', 'Santa Catarina');
-- INSERT INTO estado (id_estado, nome) VALUES ('SP', 'São Paulo');
-- INSERT INTO estado (id_estado, nome) VALUES ('SE', 'Sergipe');
-- INSERT INTO estado (id_estado, nome) VALUES ('TO', 'Tocantins');


-- INSERT INTO cidade (nome) VALUES ('São Paulo');
-- INSERT INTO cidade (nome) VALUES ('Rio de Janeiro');
-- INSERT INTO cidade (nome) VALUES ('Brasília');
CREATE DATABASE libbsview;

USE libbsview;

CREATE TABLE produtos(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100),
    quantidade INT,
    preco DECIMAL(10,2),
    descricao VARCHAR(100)
);

CREATE TABLE clientes(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100)
);

CREATE TABLE pedidos(
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    idProduto INT,
    idCliente INT,
    FOREIGN KEY (idProduto) REFERENCES produtos(id),
    FOREIGN KEY (idCliente) REFERENCES clientes(id)
);

INSERT INTO produtos(nome, descricao, preco, quantidade) VALUES
('coca cola', 'gelada é bom', 200.0,3),
('camisa do Corithians', 'selecao', 1500.00, 1),
('gs1200', 'randandan',1000.0, 7),
('tiger', 'vrumm ', 2000.00, 3);

INSERT INTO clientes(nome, email, senha) VALUES
('Arthur rosa','arthur.senai@gmail.com', 123),
('giovani', 'giovani@gmail.com', 321),
('samuel', 'saamuel@gmail.com', 321);

INSERT INTO pedidos(idproduto, idcliente) VALUES
(1,1),
(2,3),
(3,2);

-- SABER A WUANTIDADE TOTAL DO ESTOQUE
CREATE VIEW visualizar_total_estoque AS
SELECT SUM(quantidade) AS qtdTotal FROM produtos;

SELECT * FROM visualizar_total_estoque;

-- FATURAMENTO TOTAL DO ESTOQUE
CREATE VIEW visualizar_total_faturamento AS 
SELECT SUM(preco * quantidade) AS precoTotal FROM produtos;

SELECT * FROM visualizar_total_faturamento;

-- SELECIONAR TODOS OS PRODUTOS QUE FORAM PEDIDOS
CREATE VIEW visualizar_produtos_pedidos AS
SELECT pedidos.idproduto, produtos.nome FROM pedidos
INNER JOIN produtos ON produtos.id = pedidos.idproduto;

SELECT * FROM visualizar_produtos_pedidos;

-- VISUALIZAR O CLIENTE, O PEDIDO E O PRODUTO
CREATE VIEW visualizar_produtos_pedidos_clientes AS
SELECT clientes.nome AS cliente, pedidos.idproduto, produtos.nome FROM clientes
INNER JOIN pedidos ON pedidos.idproduto = clientes.id
INNER JOIN produtos ON produtos.id = pedidos.idproduto;

SELECT * FROM visualizar_produtos_pedidos_clientes;
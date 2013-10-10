-- Criando as tabelas
CREATE TABLE cliente (
	idCliente INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50)
);
CREATE TABLE categoria (
	idCategoria INT AUTO_INCREMENT PRIMARY KEY,
	categoria VARCHAR(50)
);
CREATE TABLE produto (
	idProduto INT AUTO_INCREMENT PRIMARY KEY,
	produto VARCHAR(50),
	preco DECIMAL(2),
	idCategoria INT,
	FOREIGN KEY (produto.idCategoria) REFERENCES categoria(categoria.idCategoria)
);
CREATE TABLE pedido (
	idPedido INT AUTO_INCREMENT PRIMARY KEY,
	dataPedido DATETIME,
	idCliente INT,
	FOREIGN KEY (pedido.idCliente) REFERENCES cliente(cliente.idCliente)
);
CREATE TABLE detPedido (
	iddetPedido INT AUTO_INCREMENT PRIMARY KEY,
	quantidade INT,
	idPedido INT,
	idProduto INT,
	FOREIGN KEY (detPedido.idPedido) REFERENCES pedido(pedido.idPedido),
	FOREIGN KEY (detPedido.idProduto) REFERENCES produto(produto.idProduto)
);

-- Populando cliente
INSERT INTO cliente (nome) VALUES ('Amanda');
INSERT INTO cliente (nome) VALUES ('Beatriz');
INSERT INTO cliente (nome) VALUES ('Carla');
INSERT INTO cliente (nome) VALUES ('Denise');
INSERT INTO cliente (nome) VALUES ('Eloisa');
INSERT INTO cliente (nome) VALUES ('Fernanda');
INSERT INTO cliente (nome) VALUES ('Gabriela');
INSERT INTO cliente (nome) VALUES ('Isadora');
INSERT INTO cliente (nome) VALUES ('Joana');

-- Populando categoria
INSERT INTO categoria (categoria) VALUES ('Cama Mesa Banho');
INSERT INTO categoria (categoria) VALUES ('Eletrodomestico');
INSERT INTO categoria (categoria) VALUES ('Informatica');
INSERT INTO categoria (categoria) VALUES ('Movel');
INSERT INTO categoria (categoria) VALUES ('Roupa');
INSERT INTO categoria (categoria) VALUES ('Som');
INSERT INTO categoria (categoria) VALUES ('Video');

-- Populando produto
INSERT INSERT produto (idCategoria, produto, preco) VALUES (1, 'Toalha de mesa', 45);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (2, 'Geladeira', 1200);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (2, 'Fogao', 600);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (3, 'Notebook', 1200);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (3, 'Tablet', 900);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (3, 'Ultrabook', 2100);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (4, 'Sofa', 1500);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (4, 'Cama', 800);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (4, 'Cadeira', 400);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (4, 'Mesa', 1450);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (5, 'Calca', 59.99);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (5, 'Camisa', 44.99);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (5, 'Blusa', 80.90);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (5, 'Short', 40.50);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (5, 'Meia', 15.25);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (6, 'CD Player', 180);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (6, 'Microsystem', 1350.75);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (7, 'TV', 1459.99);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (7, 'Blue Ray', 724.99);
INSERT INSERT produto (idCategoria, produto, preco) VALUES (7, 'Home Teather', 1879.99);

-- Populando pedido
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-01', 1);
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-01', Null);
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-02', 1);
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-02', 2);
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-03', Null);
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-03', 3);
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-04', 3);
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-05', Null);
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-07', Null);
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-08', 4);
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-08', 4);
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-09', Null);
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-09', 5);
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-10', 6);
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-10', 6);
INSERT INTO pedido (dataPedido, idCliente) VALUES ('2013-10-10', Null);


-- Populando detPedido
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (1, 1, 16);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (1,2, 20);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (1,3, 12);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (1,3, 11);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (2,2, 1);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (2,1, 5);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (2,5, 3);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (3,10, 2);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (3,20, 8);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (3,15, 9);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (3,15, 12);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (3,12, 20);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (4,13, 22);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (5,14, 17);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (5,7, 19);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (6,7, 4);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (6,7, 6);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (7,8, 3);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (7,9, 5);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (7,10, 2);
INSERT INTO detPedido (idPedido, idProduto, quantidade) VALUES (8,12, 1);

-- Mostrando o nome dos cliente que fizeram um pedido
SELECT * FROM pedido

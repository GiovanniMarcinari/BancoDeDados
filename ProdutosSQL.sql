--treino joins
CREATE DATABASE produtos;

USE produtos;

CREATE TABLE categoria (
	id INT NOT NULL IDENTITY(1,1),
	nome varchar(30),
	ativa char(3),
	PRIMARY KEY (id)

);

insert into categoria (nome, ativa) Values
('Informatica','[v]'),
('Telefonia','[v]'),
('Games','[v]'),
('TV, Audio e Video','[v]'),
('Impressão e imagem','[v]');

SELECT * FROM categoria;

CREATE TABLE produto (
	id int not null identity(1,1),
	id_categoria int,
	descricao varchar(50),
	preco int,
	url_imagem varchar(100),
	primary key (id)

);

insert into produto (id_categoria, descricao, preco) values
(1,'SSD 128GB', 300),
(1,'SSD 256GB', 500),
(1,'KIT TECLADO E MOUSE', 600),
(3,'PLAYSTATION 3', 1500),
(2,'SAMSUNG A51', 2500),
(4,'TELEVISÃO LG 55"', 3000),
(3,'PLAYSTATION 3 1TB', 1500),
(2,'SAMSUNG S9', 2500),
(2,'IPHONE 8', 2500),
(2,'IPHONE 9', 3000),
(2,'IPHONE X', 4000),
(4,'TELEVISÃO SAMSUNG 32"', 1000),
(4,'TELEVISÃO SAMSUNG 48"', 3000),
(3,'PLAYSTATION 4 1TB', 2800),
(3,'PLAYSTATION 5 1TB', 5000),
(1,'Teclado Razer Gamer', 250),
(1,'Fone de ouvido Hyperx',170),
(1,'Mouse Gamer Razer', 90),
(1,'Mouse Gamer Razer 2400', 200)
insert into produto (descricao, preco) values
('Mouse Gamer', 280),
('Teclado Gamer', 390);


SELECT * FROM produto;

--Trazer apenas produtos que tenham categoria: Inner Join.

select * from produto p INNER JOIN categoria c on p.id_categoria = c.id;

-- Trazer todos produtos mesmo que nao tenham categoria e ainda assim trazer a listagem de categorias

SELECT produto.descricao AS descricao, categoria.nome AS categoria FROM produto	LEFT JOIN categoria
ON produto.id_categoria = categoria.id_categoria;

-- trazer todas as categorias mesmo aquelas que não tem produto

SELECT produto.descricao AS descricao, categoria.nome AS categoria FROM produto	RIGHT JOIN categoria ON produto.id_categoria = categoria.id_categoria;

-- trazer tudo de todos - full join

select * from produto p full join categoria c on p.id_categoria = c.id;

-- maior preço por categoria trazendo qual cateogira o produto é, apenas produtos categorizados.

select c.nome (p.preco) as max_preco from produto p inner join categoria c on p.id_categoria = c.id group by c.nome;

-- menor e maior preço do produto da categoria game e telefonia

select c.nome, max (p.preco) as max_preco, min (p.preco) as min_preco
from produto p  inner join categoria c on p.id_categoria = c.id where c.nome = 'games' or c.nome = 'telefonia' group by c.nome;

-- quanto custa o maior produto não catalogado

select max (preco) from produto p inner join categoria c on c.id = p.id_categoria where c.nome is null;

-- média de preço de todos os produtos por categoria

select c.nome, avg(p.preco) as preco_maximo from produto p inner join categoria c on c.id = p.id_categoria group by c.nome;

--qual a some da televisão e do playstation, contudo some apenas dos produtos com preço maior que 1500, traga o nome da catgoria.

SELECT SUM(produto.preco) AS valor_soma, categoria.nome AS categoria FROM produto INNER JOIN categoria 
ON produto.id_categoria = categoria.id_categoria WHERE (categoria.id_categoria = 3	OR categoria.id_categoria = 4)	AND produto.preco > 1500
GROUP BY categoria.nome;

-- qual o preço do mouse mais caro, traga o nome da sua categoria.

SELECT TOP 1 categoria.nome AS categoria, produto.descricao AS produto,	produto.preco AS preco FROM produto	INNER JOIN categoria
ON produto.id_categoria = categoria.id_categoria WHERE produto.descricao LIKE '%Mouse%' ORDER BY produto.preco DESC;


with base_table as (
select id_categoria, sum(preco) as some_preco, avg(preco) as media_preco,
min(preco) as ma=in_preco, max(preco) as max_preco from produtos group by id_categoria)

select bt.id_categoria,
p.descricao,
p.preco


from base_table as bt inner join produtos p on bt.id_categoria = p.id_categoria and (bt.min_preco = p.preco or bt.max_preco = p.preco)
order by bt.id_categoria, p.preco;



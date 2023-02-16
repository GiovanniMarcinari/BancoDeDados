CREATE DATABASE clientes_db;

USE clientes_db;

CREATE TABLE clientes (

-- identity é para não ficar acrescentando id

	id INT NOT NULL IDENTITY (1,1),
	nome VARCHAR (255),
	idade INT,
	sexo CHAR (1),
	cpf CHAR (11)

);

INSERT INTO clientes (nome, idade, sexo, cpf) VALUES ('Robson', 40,'M', '12312312312');
INSERT INTO clientes ( nome, idade,sexo, cpf) VALUES ( 'Denise', 35,'F', '18989888812');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Madalena', 55,'F', '34534534545');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Jorge', 60, 'M', '89089089090');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Ana', 18, 'F','90909009090');
INSERT INTO clientes ( nome, idade, sexo, cpf) VALUES ( 'Bruna', 26, 'F','78568945239');

SELECT * FROM clientes;

SELECT * FROM clientes WHERE sexo LIKE '%M';

SELECT * FROM clientes WHERE sexo = 'F' and idade > 30 ORDER BY idade DESC;

CREATE TABLE departamentos (

	id INT NOT NULL IDENTITY (1,1),
	departamento VARCHAR (20),
	PRIMARY KEY (id)

);

INSERT INTO  departamentos (departamento) VALUES ('Vendas'), ('Marketing'), ('RH'), ('TI'), ('Administrativo'), ('Desenvolvimento');

SELECT * FROM departamentos;

CREATE TABLE funcionarios (
	
	id INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
	nome VARCHAR (255),
	email VARCHAR (255),
	sexo CHAR (1),
	data_nascimento DATE,
	salario INT,
	departamento_id INT
	FOREIGN KEY (departamento_id) REFERENCES departamentos(id)


);

INSERT INTO funcionarios (nome, email, sexo, data_nascimento, salario, departamento_id) VALUES
('Luana', 'luana@gmail.com', 'F', '01-05-1996', 3000, 1),
('Marilia', 'marilia@hotmail.com', 'F', '03-05-1995', 3100, 2),
('Raquel', 'raquel@gmail.com', 'F', '15-07-1994', 3050, 3),
('Joana', 'joana@gmail.com', 'F', '03-07-1995', 3000, 4),
('Fabricio', 'fabricio@gmail.com', 'M', '01-05-1993', 4700, 5),
('Everaldo', 'everaldo@hotmail.com', 'M', '07-05-1993', 4600, 6),
('Ricardo', 'ricardo@gmail.com', 'M', '15-05-1998', 3500, 1),
('Cleber', 'cleber@hotmail.com', 'M', '01-05-1997', 3300, 3),
('Fernando', 'fernando@hotmail.com', 'M', '03-05-1989', 3000, 2),
('Felipe', 'felipe@hotmail.com', 'M', '03-05-1996', 3070, 4),
('Matheus', 'matheus@hotmail.com', 'M', '15-05-1989', 4060, 5),
('Rodrigo', 'rodrigo@hotmail.com', 'M', '01-05-1996', 3060, 6),
('Luma', 'luma@gmail.com', 'F', '01-05-1996', 3700, 1),
('Rafael', 'rafael@gmail.com', 'M', '15-03-1991', 3500, 4),
('Mariana', 'mariana@gmail.com', 'F', '01-07-1998', 3900, 4),
('Monique', 'monique@gmail.com', 'F', '15-07-1993', 4100, 2),
('Joaquim', 'joaquim@hotmail.com', 'M', '01-05-1994', 3300, 3),
('Sandro', 'sandro@gmail.com', 'M', '01-05-1996', 4700, 5),
('Henrique', 'henrique@gmail.com', 'M', '07-07-1995', 3500, 6),
('Maria', 'maria@gmail.com', 'F', '07-07-1995', 4100, 3),
('Penha', 'penha@gmail.com', 'F', '07-07-1988', 5000, 5),
('Laura', 'laura@gmail.com', 'F', '07-07-1990', 5500, 5);


SELECT * FROM funcionarios;

SELECT COUNT (*) AS contagem_funcionario FROM funcionarios WHERE sexo = 'M';

SELECT * FROM funcionarios ORDER BY data_nascimento DESC;

SELECT AVG (salario) AS media_salario FROM funcionarios;

SELECT departamento_id, MIN(salario) AS menor_salario, MAX(salario) AS maior_salario FROM funcionarios GROUP BY departamento_id;

SELECT sexo, AVG(salario) AS media_salario, COUNT(sexo) AS quantidade FROM funcionarios GROUP BY sexo;

SELECT departamento_id , COUNT(id) AS num_funcionario FROM funcionarios GROUP BY departamento_id;

SELECT departamento_id, SUM (salario) AS soma_salario, COUNT(id) AS numero_pessoas FROM funcionarios GROUP BY departamento_id;

SELECT departamento_id , COUNT(id) AS num_funcionarios  FROM  funcionarios WHERE sexo = 'M' AND salario > 1800 GROUP BY departamento_id;


-- Salário máximo de cada departamento (usando HAVING)

SELECT departamento_id, MAX(salario) AS max_salario FROM funcionarios GROUP BY departamento_id HAVING MAX (salario) > 4200;

-- Quantos homens tem por departamento que ganham mais que 3800 desconsiderando os departamentos que tenham apenas um homem. 
--(Lembrar da sequência: SELECT, COUNT, AS, FROM, WHERE, GROUP BY, HAVING)
-- Primeiro puxar a tabela grande, selecionar colunas

SELECT departamento_id, COUNT(id) AS num_funcionarios FROM funcionarios WHERE sexo = 'M' AND salario > 3800
GROUP BY departamento_id HAVING COUNT(id) > 1;

-- Quantas mulheres que tem email (@gmail) tem media de salario maior que 4000 por departamento

SELECT departamento_id, COUNT(id) AS quantidade_mulheres, AVG (salario) AS media_salario 
FROM funcionarios WHERE sexo = 'F' AND email LIKE '%@gmail.com' GROUP BY departamento_id HAVING AVG (salario) > 4000;


-- crie uma view que traga a soma salarial o maior salario e a quantidade de funcionarios por nome do departamento. 
--Contudo, apenas dos departamentos que a soma salarial é superior 13.000.


create view view_soma_salarial as (select d.departamento, max (f.salario) as max_salario sum (f.salario) as soma_salario count(f.id) as contagem
from funcionarios as f inner join departamentos as d on d.id = f.departamento_id group by d.departamento having sum(f.salario) > 13000

)

--Trazer o menor salário de cada departamento e o nome do funcionario que recebe esse valor, trazer p nome do departamento.

with base_table as (
select 
	d.id,
	d.departamento,
	min(f.salario) as menor_salario 
from departamentos d inner join funcionarios f on f.departamento_id = d.id group by d.id, d.departamento

);

-- ano de nascimento de todos os funcionários e quem é o mais velho.

select departamento_id,year(data_nascimento), first_value(year(data_nascimento)) over(order by year(data_nascimento))
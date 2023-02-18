CREATE TABLE curso(
	id_curso INT NOT NULL IDENTITY(1, 1),
	nome VARCHAR(255) NOT NULL,
	mensalidade NUMERIC NOT NULL,
	PRIMARY KEY(id_curso)
);

CREATE TABLE endereco(
	id_endereco INT NOT NULL IDENTITY(1, 1),
	cidade VARCHAR(255) NOT NULL,
	rua VARCHAR(255) NOT NULL,
	numero NUMERIC NOT NULL,
	complemento VARCHAR(255),
	PRIMARY KEY(id_endereco)
);

CREATE TABLE aluno(
	id_aluno INT NOT NULL IDENTITY(1, 1),
	id_endereco INT NOT NULL,
	nome VARCHAR(255) NOT NULL,
	cpf VARCHAR(11) NOT NULL,
	email VARCHAR(255) NOT NULL,
	data_nascimento DATE NOT NULL,
	PRIMARY KEY(id_aluno),
	FOREIGN KEY(id_endereco) REFERENCES endereco(id_endereco)
	);

INSERT INTO curso(nome, mensalidade) VALUES('HTML e CSS', 90);
INSERT INTO curso(nome, mensalidade) VALUES('Java', 350);
INSERT INTO curso(nome, mensalidade) VALUES('Phyton', 300);
INSERT INTO curso(nome, mensalidade) VALUES('C++', 180);
INSERT INTO curso(nome, mensalidade) VALUES('Springboot', 300);

INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(1, 'Lucas', '58438097651', 'Lucas1@hotmail.com', '31/01/1995');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(2, 'Rafael', '90987865432', 'Rafa01@gmail.com', '22/11/1990');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(3, 'João', '87865432121', 'João123@gmail.com', '20/04/1940');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(4, 'Felipe', '9687554390', 'Felipe410@hotmail.com', '05/02/1959');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(5, 'Aquiles', '84736987865', 'grandeaquiles@hotmail.com.br', '11/03/1997');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(6, 'Leandro', '54678903287', 'leandroobom@hotmail.com', '11/12/1987');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(7, 'Cleópatra', '30390980876', 'cleopatraegito@gmail.com', '22/12/1999');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(8, 'Pitágoras', '88877766655', 'pitafilhodaserpente@hotmail.com', '09/04/1959');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(9, 'Colin', '12345678910', 'colingbh@hotmail.com', '06/08/1967');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(10, 'Tirésias', '12321245675', 'tiroraculo123321@gmail.com', '14/05/1965');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(11, 'Sófocles', '43452567890', 'sofocles123@hotmail.com', '14/05/1986');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(12, 'Shakespeare', '29204876501', 'shakerei@gmail.com', '19/04/1966');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(13, 'Empédocles', '12321789079', 'empedo5elements@gmail.com', '22/06/1999');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(14, 'Valkíria', '87809054533', 'vakirinha@gmail.com', '03/09/1963');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(15, 'Nefertiti', '33422125677', 'nefertitieakenathon@hotmail.com', '05/10/1983');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(16, 'Imothep', '45077866570', 'imotheposabio@gmail.com', '02/01/1997');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(17, 'Kalif', '44554367854', 'kalifdaarabia@gmail.com', '13/01/1973');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(18, 'Joana', '34567823145', 'joanadarc@hotmail.com', '11/04/1972');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(19, 'Giovanni', '89078956488', 'giovanniomelhor@gmail.com', '11/01/1992');
INSERT INTO aluno(id_endereco, nome, cpf, email, data_nascimento) VALUES(20, 'Persépolis', '87943215499', 'persehades@hotmail.com', '15/11/1985');

	
CREATE TABLE modulo(
	id_modulo INT NOT NULL IDENTITY(1, 1),
	nome VARCHAR(255) NOT NULL,
	PRIMARY KEY(id_modulo)
);

INSERT INTO modulo(nome) VALUES ('Lógica de Programação');
INSERT INTO modulo(nome) VALUES ('Java');
INSERT INTO modulo(nome) VALUES ('Programação Orientada a Objetos');
INSERT INTO modulo(nome) VALUES ('Banco de Dados');
INSERT INTO modulo(nome) VALUES ('SpringBoot');



CREATE TABLE curso_adquirido(
	id_curso_adquirido INT NOT NULL IDENTITY(1, 1),
	id_aluno INT NOT NULL,
	id_curso INT NOT NULL,
	PRIMARY KEY(id_curso_adquirido),
	FOREIGN KEY(id_aluno) REFERENCES aluno(id_aluno),
	FOREIGN KEY(id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE modulo_curso(
	id_modulo_curso INT NOT NULL IDENTITY(1, 1),
	id_curso INT NOT NULL,
	id_modulo INT NOT NULL,
	PRIMARY KEY(id_modulo_curso),
	FOREIGN KEY(id_curso) REFERENCES curso(id_curso),
	FOREIGN KEY(id_modulo) REFERENCES modulo(id_modulo)
);

INSERT INTO modulo_curso(id_curso, id_modulo) VALUES (1, 1);
INSERT INTO modulo_curso(id_curso, id_modulo) VALUES (1, 4);
INSERT INTO modulo_curso(id_curso, id_modulo) VALUES (2, 1);
INSERT INTO modulo_curso(id_curso, id_modulo) VALUES (2, 3);
INSERT INTO modulo_curso(id_curso, id_modulo) VALUES (3, 1);
INSERT INTO modulo_curso(id_curso, id_modulo) VALUES (3, 4);
INSERT INTO modulo_curso(id_curso, id_modulo) VALUES (4, 2);
INSERT INTO modulo_curso(id_curso, id_modulo) VALUES (4, 5);
INSERT INTO modulo_curso(id_curso, id_modulo) VALUES (5, 1);
INSERT INTO modulo_curso(id_curso, id_modulo) VALUES (5, 3);

INSERT INTO endereco(cidade, rua, numero) VALUES('São Paulo', 'Av. Nossa Senhora do Ó', 12);
INSERT INTO endereco(cidade, rua, numero) VALUES('Rio de Janeiro', 'Rua Constantino', 55);
INSERT INTO endereco(cidade, rua, numero) VALUES('Porto Alegre', 'Rua São José', 26);
INSERT INTO endereco(cidade, rua, numero) VALUES('Suzano', 'Rua Santos Dumont', 37);
INSERT INTO endereco(cidade, rua, numero) VALUES('Campinas', 'Rua Maria da Silva', 56);
INSERT INTO endereco(cidade, rua, numero) VALUES('Sorocaba', 'Rua Quatorze', 98);
INSERT INTO endereco(cidade, rua, numero) VALUES('Sergipe', 'Rua São Paulo', 3);
INSERT INTO endereco(cidade, rua, numero) VALUES('Fernandopolis', 'Rua Santa Luzia', 9);
INSERT INTO endereco(cidade, rua, numero) VALUES('Pernambuco', 'Rua Quinze de Novembro', 81);
INSERT INTO endereco(cidade, rua, numero) VALUES('Maceio', 'Rua Dezessete ', 97);
INSERT INTO endereco(cidade, rua, numero) VALUES('Campos do Jordão', 'Rua Minas Gerais', 41);
INSERT INTO endereco(cidade, rua, numero) VALUES('Piracicaba', 'Rua Hidros', 91);
INSERT INTO endereco(cidade, rua, numero) VALUES('Piracanjuba', 'Rua São Francisco', 85);
INSERT INTO endereco(cidade, rua, numero) VALUES('Ribeirão das Neves', 'Rua Babilonia', 49);
INSERT INTO endereco(cidade, rua, numero) VALUES('Fortaleza', 'Rua Tiradentes', 34);
INSERT INTO endereco(cidade, rua, numero) VALUES('Joinville', 'Rua Boa Vista', 61);
INSERT INTO endereco(cidade, rua, numero) VALUES('João Pessoa', 'Rua Sao Sebastiao', 78);
INSERT INTO endereco(cidade, rua, numero) VALUES('Brasília', 'Rua Projetada', 31);
INSERT INTO endereco(cidade, rua, numero) VALUES('Fortaleza', 'Rua Sete de Setembro', 40);
INSERT INTO endereco(cidade, rua, numero) VALUES('Rio Branco', 'Rua Castro Alves', 33);

INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(1, 1)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(2, 1)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(3, 1)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(4, 1)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(5, 2)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(6, 2)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(7, 2)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(8, 2)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(9, 3)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(10, 3)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(11, 3)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(12, 3)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(13, 4)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(14, 4)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(15, 4)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(16, 4)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(17, 5)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(18, 5)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(19, 5)
INSERT INTO curso_adquirido(id_aluno, id_curso) VALUES(20, 5)

SELECT aluno.nome AS nome, 
	aluno.email AS email,
	aluno.data_nascimento AS nascimento
FROM aluno
ORDER BY aluno.nome ASC;


SELECT aluno.nome AS nome,
	aluno.email AS email,
	aluno.data_nascimento AS nascimento
FROM aluno 
WHERE aluno.email LIKE '%@hotmail.com'
AND DATEPART(yyyy, data_nascimento) < 2000;


SELECT MAX(curso.mensalidade) AS mensalidade_maxima 
FROM curso;

SELECT aluno.nome AS nome,
	aluno.cpf AS cpf
FROM aluno 
WHERE aluno.cpf LIKE '%4%'
OR aluno.cpf LIKE '%5%'
OR aluno.cpf LIKE '%6%';


SELECT AVG(curso.mensalidade) AS mensalidade_media 
FROM curso;


SELECT curso.mensalidade AS valor, COUNT(curso.id_curso) AS cursos
FROM curso 
GROUP BY curso.mensalidade
HAVING curso.mensalidade > (
	SELECT AVG(curso.mensalidade) 
	FROM curso
);


SELECT MIN(curso.mensalidade) AS mensalidade
FROM curso
WHERE curso.mensalidade > (
	SELECT AVG(curso.mensalidade)
	FROM curso
);

SELECT COUNT(aluno.id_aluno) AS vendas
FROM curso_adquirido
INNER JOIN curso ON curso_adquirido.id_curso = curso.id_curso
INNER JOIN aluno ON curso_adquirido.id_aluno = aluno.id_aluno
WHERE curso.mensalidade = (
	SELECT MAX(curso.mensalidade)
	FROM curso
);

SELECT COUNT(endereco.id_endereco) AS complementos
FROM aluno
INNER JOIN endereco ON aluno.id_endereco = endereco.id_endereco
WHERE endereco.complemento IS NOT NULL;

SELECT aluno.nome AS nome, COUNT(aluno.id_aluno) AS cursos, SUM(curso.mensalidade) AS mensalidades
FROM curso_adquirido
INNER JOIN curso ON curso_adquirido.id_curso = curso.id_curso
INNER JOIN aluno ON curso_adquirido.id_aluno = aluno.id_aluno
GROUP BY aluno.nome
ORDER BY aluno.nome ASC;


SELECT TOP 3 curso.nome AS curso, COUNT(curso.id_curso) AS vendas
FROM curso_adquirido
INNER JOIN curso ON curso_adquirido.id_curso = curso.id_curso
GROUP BY curso.nome
ORDER BY vendas DESC;


SELECT curso.nome AS curso,	COUNT(aluno.id_aluno) AS alunos, SUM(curso.mensalidade) AS mensalidades
FROM curso_adquirido
INNER JOIN curso ON curso_adquirido.id_curso = curso.id_curso
INNER JOIN aluno ON curso_adquirido.id_aluno = aluno.id_aluno
GROUP BY curso.nome;
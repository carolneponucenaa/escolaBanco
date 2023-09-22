create database escolacarol_SQL;

use escolacarol_SQL;

create table alunos 
(
aluno_id integer primary key,
nome varchar (100) not null,
data_nascimento date,
endereco varchar (300) not null,
telefone varchar (20) not null
);

insert into alunos (aluno_id, nome, data_nascimento, endereco, telefone) values
 (1, 'João Silva', '1995-03-15', 'Rua A, 123', '(11) 1234-5678'),
 (2, 'Maria Santos', '1998-06-22', 'Av. B, 456', '(11) 9876-5432'),
 (3, 'Carlos Oliveira', '1997-01-10', 'Rua C, 789', '(11) 5678-1234'),
 (4, 'Ana Pereira', '1999-09-05', 'Av. D, 987', '(11) 4321-8765'),
 (5, 'Pedro Rodrigues', '1996-07-18', 'Rua E, 654', '(11) 3456-7890'),
 (6, 'Sara Costa', '2000-04-30', 'Av. F, 321', '(11) 8765-4321');


create table professores
(
professor_id integer primary key,
nome varchar (100) not null,
data_contratacao date
);

insert professores (professor_id, nome, data_contratacao) values
 (1, 'Ana Lima', '2010-08-15'),
 (2, 'José Santos', '2005-04-20'),
 (3, 'Márcio Oliveira', '2012-11-10'),
 (4, 'Cláudia Pereira', '2014-03-25'),
 (5, 'Fernanda Rodrigues', '2018-09-08'),
 (6, 'Ricardo Costa', '2019-12-01');

create table disciplinas
(
disciplina_id integer primary key,
nome_disciplina varchar (100) not null,
codigo_disciplina varchar (255) not null,
carga_horaria int
);

insert into disciplinas (disciplina_id, nome_disciplina, codigo_disciplina, carga_horaria) values
 (1, 'Programação em C', 'PC101', 60),
 (2, 'Banco de Dados', 'BD201', 45),
 (3, 'Desenvolvimento Web', 'DW301', 75),
 (4, 'Algoritmos Avançados', 'AA401', 60),
 (5, 'Inteligência Artificial', 'IA501', 90),
 (6, 'Segurança da Informação', 'SI601', 45);

create table turmas
(
turma_id integer primary key,
ano_escolar int,
DISCIPLINA_ID integer,
PROFESSOR_ID integer,
foreign key(DISCIPLINA_ID) references disciplinas(disciplina_id),
foreign key(PROFESSOR_ID) references professores(professor_id)
); 

insert into turmas (turma_id, ano_escolar, disciplina_id, professor_id) values
 (101, 2023, 1, 1),
 (102, 2023, 2, 2),
 (103, 2023, 3, 3),
 (104, 2023, 4, 4),
 (105, 2023, 5, 5),
 (106, 2023, 6, 6);

create table notas 
(
nota_id integer primary key,
data_avaliacao date,
nota int, 
ALUNO_ID integer,
DISCIPLINA_ID integer,
foreign key(DISCIPLINA_ID) references disciplinas(disciplina_id),
foreign key(ALUNO_ID) references alunos(aluno_id)
);

insert into notas (nota_id, aluno_id, disciplina_id, data_avaliacao, nota) values
 (1, 1, 1, '2023-03-10', 85),
 (2, 2, 1, '2023-03-10', 78),
 (3, 3, 1, '2023-03-10', 92),
 (4, 4, 2, '2023-03-15', 88),
 (5, 5, 2, '2023-03-15', 95),
 (6, 6, 2, '2023-03-15', 75);

create table presenca 
(
presenca_id integer primary key,
data_aula date,
presenca varchar (250) not null,
ALUNO_ID integer,
TURMA_ID integer,
foreign key(TURMA_ID) references turmas(turma_id),
foreign key(ALUNO_ID) references alunos(aluno_id)
);

insert into presenca (presenca_id, aluno_id, turma_id, data_aula, presenca) values
 (1, 1, 101, '2023-03-10', 'presente'),
 (2, 2, 101, '2023-03-10', 'presente'),
 (3, 3, 101, '2023-03-10', 'presente'),
 (4, 4, 102, '2023-03-15', 'ausente'),
 (5, 5, 102, '2023-03-15', 'presente'),
 (6, 6, 102, '2023-03-15', 'presente');



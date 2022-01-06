create database db_produto;
use db_produto;

create table tipo_produto(
	codigo int not null auto_increment primary key,
    descricao varchar(30) not null
);

create table produto(
	codigo int not null auto_increment primary key,
    descricao varchar(30) not null,
	preco decimal(8,2) not null,
	tipo_produto int not null,
	foreign key (tipo_produto) references tipo_produto(codigo)
);

insert into tipo_produto (descricao) values ("Computador");
insert into tipo_produto (descricao) values ("Impressora");
insert into tipo_produto (descricao) values ('Notebook');

insert into produto (descricao, preco, tipo_produto) values ('Desktop', '1200', 1);
insert into produto (descricao, preco, tipo_produto) values ('Laptop', '1800', 1);
insert into produto (descricao, preco, tipo_produto) values ('Impr. Jato Tinta', '300', 2);
insert into produto (descricao, preco, tipo_produto) values ('Impr. Laser', '500', 2);
insert into produto (descricao, preco, tipo_produto) values ('Notebook', '1200', 1);

select * from tipo_produto;
select * from produto;
select p.codigo as cod, p.descricao as descr, p.preco as pre, p.tipo_produto as ctp from produto as p;
select * from tipo_produto where codigo = 1;
select codigo, descricao from tipo_produto where codigo = 2;
select * from produto where descricao = 'Laptop';
select codigo, descricao, tipo_produto from produto where preco <= 500;

update tipo_produto set descricao = 'Nobreak' where codigo = 3;
update produto set descricao = 'Notebook', preco = '2800' where codigo = 2;

delete from tipo_produto where codigo = 3;

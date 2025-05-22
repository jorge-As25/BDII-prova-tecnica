create database loja_pascotto;
use loja_pascotto;

create table produtos(
id_produto int auto_increment primary key,
nome varchar(100),
quantidade_estoque int,
id_fornecedor int
);

alter table produtos add column id_categoria int;

alter table produtos add constraint fk_produtos foreign key
(id_categoria) references categorias(id_categoria);

alter table produtos add column preco double;

alter table produtos add constraint fk_fornecedor foreign key (id_fornecedor) 
references fornecedores(id_fornecedor);

insert into produtos (nome, preco, quantidade_estoque) values
('processador i5','350.00','10'),
('placa_mãe','570.00','16'),
('gabinete','550.50','9');

drop table produtos;


create table fornecedores(
id_fornecedor int auto_increment primary key,
nome varchar(100),
CNPJ int,
CPF varchar(11)
);

alter table fornecedores add column email varchar(100);
alter table fornecedores add column telefone varchar(20);

alter table fornecedores drop column CPF;

insert into fornecedores (nome, CNPJ, CPF, email, telefone) values
('Cleiton Dias','1234','2345','cleitonSlaOq@12','98118-7677'),
('Sr. Pascotto','0987','98765','Pasquinho12@98','987651234'); 


create table colaboradores(
id_colaborador int auto_increment primary key,
nome varchar(100),
cargo varchar(100),
salario double
);

alter table colaboradores drop column salario;
alter table colaboradores add column salario decimal(10,2);

insert into colaboradores (nome, cargo, salario) values
('sueli','colaborador','1000.50'),
('Fabio','colaborador','1000.00');



create table pedidos(
id_pedido int auto_increment primary key,
data_pedido date,
id_funcionario int,
id_produto int,
quantidade int
);

alter table pedidos drop column id_funcionario;
alter table pedidos add column id_funcionario int;

alter table pedidos drop column id_produto;
alter table pedidos add column id_produto int;

insert into pedidos (data_pedido, quantidade,id_funcionario, id_produto)values
('gabinete','1','1','3'),
('placa_mãe','1','2','2');

alter table pedidos add constraint fk_pedido foreign key (id_funcionario)
 references produtos(id_produto);
 
 alter table pedidos add constraint fk_pedido_funcionario foreign key (id_funcionario)
 references funcionarios(id_funcionario);


create table categorias(
id_categoria int auto_increment primary key,
nomeCategoria int
);


create table funcionarios(
id_funcionario int auto_increment primary key,
nome varchar(200),
cargo varchar(100)
);

insert into funcionarios (nome, cargo,salario) values
('jorge','vendedor','1200.00'),
('amanda','estoque','1300.50');

alter table funcionarios add column salario decimal(10, 2);
update funcionarios set salario = 1300.50 where id_funcionario = 1;

select a.nome,  b.nome from produtos a inner join fornecedores b on b.id_fornecedor = a.id_produto;
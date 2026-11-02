create database Sistema_reserva_carros;

use Sistema_reserva_carros;

create table tb_sedes(
Id_sede int not null primary key,
Nomesede varchar(100) ,
Endereco varchar(100) ,
NomeGER varchar(100) ,
Telefone varchar(15),
Multa decimal(10,2) 
);
 
create table tb_carros(
Placa varchar(8) primary key not null,
Modelo varchar(50),
Ano int,
Quilometragem int,
Descricao varchar(100)
);

create table tb_classe_carros(
Id_classe int not null primary key,
NomeClasse varchar(50),
ValorDiaria decimal(10,2)
);

create table tb_reservas(
NumReserva int primary key not null auto_increment,
QuantDiarias int,
Data_locacao date,
Data_retorno date,
QuilometrosRodados decimal(10,2),
MultaReserva decimal (10,2),
Situacao varchar (100),
ValorTotal decimal(10,2)
);

create table tb_cliente(
CPF varchar(15) primary key not null,
NomeCliente varchar(100),
NumCNH varchar(20),
ValidadeCNH date,
CategoriaCNH varchar(5)
);

alter table tb_carros add column Id_classe int not null;
alter table tb_carros add foreign key (Id_classe) references tb_classe_carros (Id_classe);

alter table tb_reservas add column CPF varchar(15) not null;
alter table tb_reservas add foreign key(CPF) references tb_cliente(CPF);

alter table tb_carros add column Id_sede int not null;
alter table tb_carros add foreign key (Id_sede) references tb_sedes(Id_sede);

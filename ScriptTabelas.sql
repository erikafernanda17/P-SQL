
-- Tabela Produto 
create table Produto(
	ID serial primary key,
	Nome varchar(100) not null unique,
	Descricao varchar(255) not null,
	Preco numeric(5, 2) not null,
	Qtde_Estoque int not null
);

-- Tabela Compra 
create table Compra(
	ID serial primary key,
	Qtde int not null,
	DataHora timestamp not null,
	Pagamento varchar(15) not null,
	Valor_total numeric(6,2)
);

-- Tabela Associativa Compra_Produto 
create table Compra_Produto(
	ID serial primary key,
	ID_Produto int not null
		references Produto(ID),
	ID_Compra int not null
		references Compra(ID)
);

-- Tabela Cliente 
create table Cliente(
	cpf varchar(14) not null primary key,
	Nome varchar(255) not null,
	Email varchar(100) unique,
	Telefone varchar(12) not null,
	Endereco varchar(100),
	Quadra char(2),
	Rua varchar(50)
);

-- Tabela Associativa Compra_Cliente 
create table Compra_Cliente(
	Codigo serial primary key,
	ID_Compra int not null
		references Compra(ID),
	Cpf_cliente varchar(14) not null
		references Cliente(cpf)
);

-- Tabela Animal 
create table Animal(
	ID serial primary key not null,
	Nome varchar(30),
	Raca varchar(25),
	Idade int,
	Cpf_cliente varchar(14) not null
		references Cliente(cpf)
);

-- Tabela Funcionario 
create table Funcionario(
	Cpf varchar(14) not null primary key,
	Nome varchar(255) not null,
	Idade int,
	Tipo_Vinculo varchar(50) not null,
	Data_Contratacao timestamp not null,
	Cargo varchar(100) not null,
	Endereco varchar(100),
	Quadra char(2),
	Rua varchar(50)
	
);

-- Tabela Servico 
create table servico(
	ID serial primary key not null,
	DataHora timestamp not null,
	Tipo_Servico varchar(50) not null,
	cpf_funcionario varchar(14) not null
		references Funcionario(Cpf)
);

-- Tabela Associativa Cliente_Servico 
create table Cliente_Servico(
	Codigo serial primary key not null,
	cpf_cliente varchar(14) not null
		references Cliente(cpf),
	ID_Servico int not null
		references Servico(ID) 
);

-- Tabela Associativa Animal_Servico 
create table Animal_Servico(
	Codigo serial primary key not null,
	ID_Servico int not null
		references Servico(ID),
	ID_Animal int not null
		references Animal(ID)
);
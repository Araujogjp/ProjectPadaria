Create Database ProjectPadaria; -- Criando o banco de dados
use ProjectPadaria; -- Usando o banco de dados


Create Table Tb_Producao( -- Criando a tabela Producao
	idProducao int primary key not null identity,
	valorProducao numeric(10, 2) not null,
	tempoProducao time,
	qtdIngrediente numeric(10, 2) not null,
);


Create Table Tb_Promocao( -- Criando a tabela Promocao
	idPromocao int primary key not null identity,
	valorPromo numeric(10, 2) not null,
	dataInicio date not null,
	dataFinal date not null,
	tipo bit not null
);

Create Table Tb_Pagamento( -- Criando a tabela pagamentos
	idPagamento Int Primary Key not null Identity,
	dataPag Date not null,
	tipoPagamento bit not null,
	valorTotal numeric(10, 2) not null,
	statusPagto Varchar(30) not null
);

Create Table Tb_Pedido( -- Criando a tabela pedidos
	idPedido Int Primary Key not null Identity,
	valor_Final numeric(10, 2) not null,
	statusPedido varchar(50) not null,
	possuiPromo bit not null,
	qtdTotalItens int not null,

	-- Chaves Estrangeiras
	Tb_ClienteidCliente int not null,
	Tb_ProdutoidProduto int not null,
	Tb_PromocaoidPromocao int not null,
	Tb_PagamentoidPagamento int not null,

	-- Referenciando as chaves estrangeiras
	FOREIGN KEY(Tb_ClienteidCliente) references Tb_Cliente(idCliente),
	FOREIGN KEY(Tb_ProdutoidProduto) references Tb_Produto(idProduto),
	FOREIGN KEY(Tb_PromocaoidPromocao) references Tb_Promocao(idPromocao),
	FOREIGN KEY(Tb_PagamentoidPagamento) references Tb_Pagamento(idPagamento)
);


Create table Tb_ItensPedidos( -- Criando a tabela Itens pedidos

	-- Chaves Estrangeiras
	Tb_ProdutoidProduto int not null,
	Tb_PedidoidPedido int not null,

	idItemPedido int primary key not null identity,
	valorTotal numeric(10, 2) not null,
	qtdItem int not null,

	-- Referenciando as chaves estrangeiras
	FOREIGN KEY(Tb_ProdutoidProduto) references Tb_Produto(idProduto),
	FOREIGN KEY(Tb_PedidoidPedido) references Tb_Pedido(idPedido)
);

Create Table Tb_Encomenda( -- Criando a tabela encomenda
	idEncomenda int primary key not null identity,
	enderecoEntrega varchar(150) not null,
	destinatario varchar(150) not null,
	remetente varchar(150) not null,
	dataEnvio date not null,
	dataEntrega date not null,
	statusEnc varchar(30) not null,
	tipo bit not null,
	valorFrete numeric(10, 2) not null,

	-- Chave Estrangeira
	Tb_PedidoidPedido int not null,

	-- Referenciando a chave estrangeira
	FOREIGN KEY(Tb_PedidoidPedido) references Tb_Pedido(idPedido)
);
-- Script para criar a view que retorna: o ID DA COMPRA + CPF e o NOME DO CLIENTE + o NOME DO PRODUTO e o PREÇO DA UNIDADE 
-- 													+ a QUANTIDADE COMPRADA e a FORMA DE PAGAMENTO
-- Inner join com quatro tabelas
CREATE VIEW informacoes_compra as
	SELECT 
		id_compra, -- coluna da tabela compra_cliente
		cpf, nome, -- colunas da tabela cliente
		nome_produto, preco_unid, --colunas da tabela produto
		qtde, pagamento --colunas da tabela compra

	FROM compra_cliente
	INNER JOIN cliente on cliente.cpf = compra_cliente.cpf_cliente
	INNER JOIN produto on compra_cliente.id_compra = produto.id
	INNER JOIN compra on compra_cliente.id_compra = compra.id;

-- Chamando a view
select * from informacoes_compra;


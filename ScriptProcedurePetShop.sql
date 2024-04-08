-- Criando uma procedure que calcule o valor total de uma compra
CREATE OR REPLACE PROCEDURE valor_total_compra(IN id_compra INT) -- Crio a procedure, dou um nome para ela e dentro dos parenteses delimito que ela espera um id de compra que será inteiro
LANGUAGE plpgsql -- Padrão da sintaxe que define o PSQL
AS $$ -- Usando um delimitador que sinaliza que o bloco de códigos está iniciando
DECLARE -- Declarando variaveis locais e seus tipos primitivos
	preco_unid decimal(7,2);
	qtde_prod int;
	novo_valor_total decimal(7,2);
BEGIN
	SELECT
		produto.preco_unid,
		compra.qtde
	INTO
		preco_unid,
		qtde_prod
	FROM produto
	INNER JOIN compra on produto.id = compra.id
	WHERE compra.id = id_compra;
	
	novo_valor_total = preco_unid * qtde_prod;
	
	UPDATE compra
	SET valor_total = novo_valor_total
	WHERE id = id_compra;
END;
$$;

CALL valor_total_compra(86);






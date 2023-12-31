-- Procedure de inserção de dados
CREATE PROCEDURE INSERCAO (
    CODIGO INTEGER,
    NOME VARCHAR(50),
    IDADE INTEGER)
AS BEGIN
    INSERT INTO CADASTRO(CODIGO, NOME, IDADE) VALUES(:CODIGO, :NOME, :IDADE);
    SUSPEND;
END;

-- Procedure de atualuzação de dados:
CREATE PROCEDURE ATUALIZACAO(
	CODIGO INTEGER,
	NOME VARCHAR(50),
	IDADE INTEGER
)
AS BEGIN
	UPDATE CADASTRO SET NOME = :NOME, IDADE = :IDADE 
	WHERE CODIGO = :CODIGO ;
END;

-- Procudure de seleção de dados por codigo:
CREATE PROCEDURE SELECIONAR_POR_CODIGO(
    VCODIGO INTEGER
)
RETURNS (
    CODIGO INTEGER,
    NOME VARCHAR(50),
    IDADE INTEGER)
AS BEGIN
    FOR SELECT CODIGO, NOME, IDADE FROM CADASTRO WHERE CODIGO = :VCODIGO 
    INTO :CODIGO, :NOME, :IDADE DO
    SUSPEND;
END;

-- Procedure de seleção(Não funciona para selecionar todos os dados):
CREATE PROCEDURE SELECIONAR
RETURNS (
    CODIGO INTEGER,
    NOME VARCHAR(50),
    IDADE INTEGER)
AS BEGIN
    FOR SELECT * FROM CADASTRO
    INTO :CODIGO, :NOME, :IDADE DO
    SUSPEND;
END;


-- EXECUÇÃO DA PROCEDURE:
EXECUTE PROCEDURE INSERCAO(5,'MARIDA DAS DORES',50);
EXECUTE PROCEDURE ATUALIZACAO(5,'MARIA DOS MIGRES',60);
EXECUTE PROCEDURE SELECIONAR_POR_CODIGO(5);
EXECUTE PROCEDURE SELECIONAR;



SELECT * FROM CADASTRO;




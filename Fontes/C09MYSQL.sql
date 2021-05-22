USE virtual;

CREATE PROCEDURE sp_saudacao() 
  SELECT 'Alo, Mundo!'
;

CALL sp_saudacao();

CREATE PROCEDURE sp_dados() 
  SELECT NOME, SALARIO FROM cadfun
;

CALL sp_dados();

DELIMITER |
CREATE PROCEDURE sp_sauda()
BEGIN 
  DECLARE Mensagem VARCHAR(11);
  SET Mensagem = 'Alo, Mundo!';
  SELECT Mensagem;
END|
DELIMITER ;

CALL sp_sauda();

CREATE PROCEDURE sp_sauda1()
BEGIN 
  DECLARE Mensagem VARCHAR(11);
  SET Mensagem = 'Alo, Mundo!';
  SELECT Mensagem;
END;

CALL sp_sauda1();

DELIMITER $
CREATE PROCEDURE sp_sauda1()
BEGIN 
  DECLARE Mensagem VARCHAR(11);
  SET Mensagem = 'Alo, Mundo!';
  SELECT Mensagem;
END$
DELIMITER ;

CALL sp_sauda1();

DELIMITER $
CREATE PROCEDURE sp_sauda2(IN Nome VARCHAR(50))
BEGIN 
  DECLARE Mensagem VARCHAR(11);
  SET Mensagem = 'Alo, Mundo!';
  SELECT Mensagem;
  SELECT Nome;
END$
DELIMITER ;

CALL sp_sauda2('Augusto Manzano');

DELIMITER $
CREATE PROCEDURE sp_calc(IN A INTEGER, IN B INTEGER, OUT S INTEGER)
BEGIN 
  SET S = A + B;
END$
DELIMITER ;

CALL sp_calc(5,3,@saida);
SELECT @saida;

DELIMITER $
CREATE PROCEDURE sp_decisao1(IN A FLOAT, IN B FLOAT)
BEGIN 
  DECLARE X FLOAT;
  SET X = A + B;
  IF (X >= 10) THEN
    SELECT X;
  END IF;
END$
DELIMITER ;

CALL sp_decisao1(5.5,4.5);
CALL sp_decisao1(5.5,6.5);
CALL sp_decisao1(4.5,4.5);

DELIMITER $
CREATE PROCEDURE sp_decisao2(IN Valor INTEGER)
BEGIN 
  DECLARE Resto INTEGER;
  SET Resto = Valor % 3;
  IF (Resto = 0) THEN
    SELECT Valor, 'e um valor divisível por 3';
  ELSE
    SELECT Valor, 'nao e um valor divisível por 3';
  END IF;
END$
DELIMITER ;

CALL sp_decisao2(4);
CALL sp_decisao2(9);

DELIMITER $
CREATE PROCEDURE sp_nome_mes()
BEGIN 
  DECLARE Valor INTEGER;
  DECLARE Nome VARCHAR(9);
  SET Valor = MONTH(CURDATE());
  IF (Valor = 1) THEN
    SET Nome =  'Janeiro';
  ELSEIF (Valor = 2) THEN
    SET Nome =  'Fevereiro';
  ELSEIF (Valor = 3) THEN
    SET Nome =  'Marco';
  ELSEIF (Valor = 4) THEN
    SET Nome =  'Abril';
  ELSEIF (Valor = 5) THEN
    SET Nome =  'Maio';
  ELSEIF (Valor = 6) THEN
    SET Nome =  'Junho';
  ELSEIF (Valor = 7) THEN
    SET Nome =  'Julho';
  ELSEIF (Valor = 8) THEN
    SET Nome =  'Agosto';
  ELSEIF (Valor = 9) THEN
    SET Nome =  'Setembro';
  ELSEIF (Valor = 10) THEN
    SET Nome =  'Outubro';
  ELSEIF (Valor = 11) THEN
    SET Nome =  'Novembro';
  ELSEIF (Valor = 12) THEN
    SET Nome =  'Dezembro';
  END IF;
  SELECT Nome;
END$
DELIMITER ;

CALL sp_nome_mes();

DELIMITER $
CREATE PROCEDURE sp_nome_mes2()
BEGIN 
  DECLARE Valor INTEGER;
  SET Valor = MONTH(CURDATE());
  CASE Valor
    WHEN  1 THEN SELECT 'Janeiro';
    WHEN  2 THEN SELECT 'Fevereiro';
    WHEN  3 THEN SELECT 'Marco';
    WHEN  4 THEN SELECT 'Abril';
    WHEN  5 THEN SELECT 'Maio';
    WHEN  6 THEN SELECT 'Junho';
    WHEN  7 THEN SELECT 'Julho';
    WHEN  8 THEN SELECT 'Agosto';
    WHEN  9 THEN SELECT 'Setembro';
    WHEN 10 THEN SELECT 'Outubro';
    WHEN 11 THEN SELECT 'Novembro';
    WHEN 12 THEN SELECT 'Dezembro';
  END CASE;
END$
DELIMITER ;

CALL sp_nome_mes2();

DELIMITER $
CREATE PROCEDURE sp_dia_semana()
BEGIN 
  DECLARE Valor INTEGER;
  SET Valor = DAYOFWEEK(CURDATE());
  CASE 
    WHEN  Valor = 1 THEN SELECT 'Domingo';
    WHEN  Valor = 2 THEN SELECT 'Segunda-feira';
    WHEN  Valor = 3 THEN SELECT 'Terca-feira';
    WHEN  Valor = 4 THEN SELECT 'Quarta-feira';
    WHEN  Valor = 5 THEN SELECT 'Quinta-feira';
    WHEN  Valor = 6 THEN SELECT 'Sexta-feira';
    WHEN  Valor = 7 THEN SELECT 'Sabado';
  END CASE;
END$
DELIMITER ;

CALL sp_dia_semana();

DELIMITER $
CREATE PROCEDURE sp_fat1(IN Valor INTEGER)
BEGIN
  DECLARE Fator, I INTEGER;
  SET Fator = 1;
  SET I = 1;
  calculo: LOOP
    SET Fator = Fator * I;
    SET I = I + 1;
    IF (I > Valor) THEN
      LEAVE calculo;
    END IF;
  END LOOP calculo;
  SELECT Fator;
END$
DELIMITER ;

CALL sp_fat1(5);

DELIMITER $
CREATE PROCEDURE sp_fat2(IN Valor INTEGER)
BEGIN
  DECLARE Fator, I INTEGER;
  SET Fator = 1;
  SET I = 1;
  calculo: WHILE (I <= Valor) DO
    SET Fator = Fator * I;
    SET I = I + 1;
  END WHILE calculo;
  SELECT Fator;
END$
DELIMITER ;

CALL sp_fat2(5);

DELIMITER $
CREATE PROCEDURE sp_fat3(IN Valor INTEGER)
BEGIN
  DECLARE Fator, I INTEGER;
  SET Fator = 1;
  SET I = 1;
  calculo: REPEAT
    SET Fator = Fator * I;
    SET I = I + 1;
  UNTIL (I > Valor) END REPEAT calculo;
  SELECT Fator;
END$
DELIMITER ;

CALL sp_fat3(5);

DELIMITER $
CREATE PROCEDURE sp_fat4(IN Valor INTEGER)
BEGIN
  DECLARE Fator INTEGER DEFAULT 1;
  DECLARE I     INTEGER DEFAULT 1;
  SET Fator = 1;
  SET I = 1;
  calculo: REPEAT
    SET Fator = Fator * I;
    SET I = I + 1;
  UNTIL (I > Valor) END REPEAT calculo;
  SELECT Fator;
END$
DELIMITER ;

CALL sp_fat4(5);

SELECT * FROM cadfun; 

SELECT * FROM morto; 

DELIMITER $
CREATE PROCEDURE sp_demite(IN Codigo INTEGER)
BEGIN
  INSERT INTO morto 
    SELECT CODFUN, NOME, DEPTO, FUNCAO, SALARIO, ADMISSAO, FILHOS, CPF 
    FROM cadfun 
    WHERE CODFUN = Codigo
  ;
  DELETE FROM cadfun WHERE CODFUN = Codigo;
END$
DELIMITER ;

CALL sp_demite(24);

SELECT * FROM cadfun; 

SELECT * FROM morto;

DELIMITER $
CREATE PROCEDURE sp_escopo()
BEGIN
  DECLARE Palavra VARCHAR(6) DEFAULT 'Fora';
  BEGIN
    DECLARE Palavra VARCHAR(6) DEFAULT 'Dentro';
    SELECT Palavra;
  END;
  SELECT Palavra;
END$
DELIMITER ;

CALL sp_escopo();

SHOW PROCEDURE STATUS LIKE 'sp_fat1'\G;

SHOW PROCEDURE STATUS LIKE 'sp_fat1';

SHOW PROCEDURE STATUS; 

DROP PROCEDURE sp_fat4;

SHOW PROCEDURE STATUS;

CREATE TABLE auditoria (
  USUARIO VARCHAR(40),
  ACAO    VARCHAR(9),
  DATA    DATE,
  HORA    TIME,
  CODIGO  INTEGER
);

DELIMITER $
CREATE TRIGGER tr_auditor1 AFTER INSERT ON cadfun
FOR EACH ROW
  BEGIN
    INSERT INTO auditoria SET 
      CODIGO = NEW.CODFUN,
      USUARIO = USER(),
      ACAO = 'Cadastrou', 
      DATA = CURDATE(),
      HORA = CURTIME()
    ;
  END
$
DELIMITER ;

INSERT INTO cadfun VALUES (
  60,
  'MARINALVA DA SILVA',
  '3',
  'PROGRAMADOR',
  1200.00,
  '2006-10-19',
  0,
  '50022255599'
);

GRANT UPDATE, SELECT ON virtual.* 
  TO roberto@localhost IDENTIFIED BY '123'
;

DELIMITER $
CREATE TRIGGER tr_auditor2 BEFORE UPDATE ON cadfun
FOR EACH ROW
  BEGIN
    INSERT INTO auditoria SET 
      CODIGO = NEW.CODFUN,
      USUARIO = USER(),
      ACAO = 'Alterou', 
      DATA = CURDATE(),
      HORA = CURTIME()
    ;
  END
$
DELIMITER ;

USE virtual;

UPDATE cadfun SET DEPTO = 5 WHERE CODFUN = 1;

SELECT * FROM auditoria;

UPDATE cadfun SET CODFUN = 13 WHERE CODFUN = 12;
SELECT * FROM auditoria;

GRANT ALL PRIVILEGES ON *.* TO marta@localhost 
  IDENTIFIED BY '456' WITH GRANT OPTION
;

DELIMITER $
CREATE TRIGGER tr_auditor3 BEFORE DELETE ON cadfun
FOR EACH ROW
  BEGIN
    INSERT INTO auditoria SET 
      CODIGO = OLD.CODFUN,
      USUARIO = USER(),
      ACAO = 'Demitiu', 
      DATA = CURDATE(),
      HORA = CURTIME()
    ;
  END
$
DELIMITER ;

CALL sp_demite(10);
SELECT CODFUN, NOME FROM cadfun;
SELECT CODFUN, NOME FROM morto WHERE CODFUN = 10;
SELECT * FROM auditoria;

SELECT * FROM auditoria; 

CREATE TABLE audisalar (
  USUARIO VARCHAR(40),
  DATA    DATE,
  HORA    TIME,
  CODIGO  INTEGER,
  ANTSAL  DECIMAL(10,2),
  ATUSAL  DECIMAL(10,2)
);

DELIMITER $
CREATE TRIGGER tr_auditor4 AFTER UPDATE ON cadfun
FOR EACH ROW
  BEGIN
    INSERT INTO audisalar SET 
      CODIGO = NEW.CODFUN,
      USUARIO = USER(),
      DATA = CURDATE(),
      HORA = CURTIME(),
      ANTSAL = OLD.SALARIO,
      ATUSAL = NEW.SALARIO 
    ;
  END
$
DELIMITER ;

SELECT * FROM cadfun WHERE CODFUN = 6;
UPDATE cadfun SET SALARIO = 2100 WHERE CODFUN = 6;
SELECT * FROM cadfun WHERE CODFUN = 6;
SELECT * FROM audisalar;

UPDATE cadfun SET SALARIO = SALARIO * 1.055 WHERE DEPTO = 4;
SELECT * FROM audisalar;

DELIMITER $
CREATE FUNCTION sf_fat(N INTEGER) RETURNS INTEGER
BEGIN
  DECLARE Fator, I INTEGER;
  SET Fator = 1;
  SET I = 1;
  IF (N <= 1) THEN
    RETURN Fator;
  ELSE
    calculo: WHILE (I <= N) DO
      SET Fator = Fator * I; 
      SET I = I + 1;
    END WHILE calculo;
  END IF;
  RETURN Fator;
END$
DELIMITER ;

SELECT sf_fat(5);

DELIMITER $
CREATE FUNCTION sf_raiz(Base FLOAT, Indice FLOAT) RETURNS FLOAT
BEGIN
  DECLARE Valor FLOAT;
  SET Valor = POWER(Base, 1 / Indice);
  RETURN Valor;
END$
DELIMITER ;

SELECT sf_raiz(25,2);
SELECT sf_raiz(25,3);






USE virtual;

CREATE TABLE cliente (
  CODCLI   CHAR(3)     NOT NULL PRIMARY KEY,
  NOME     CHAR(40)    NOT NULL,
  ENDERECO CHAR(50)    NOT NULL,
  CIDADE   VARCHAR(20) NOT NULL,
  ESTADO   CHAR(2)     NOT NULL,
  CEP      CHAR(9)     NOT NULL
);

INSERT INTO cliente VALUES (
  '250',
  'BANCO BARCA S/A',
  'R. VITO, 34',
  'SAO SEBASTIAO',
  'CE',
  '62380-000'
);

SELECT * FROM cliente;

INSERT INTO cliente VALUES (
  '820',
  'MECANICA SAO PAULO',
  'R. DO MACUCO, 99',
  'SANTO ANTONIO',
  'ES',
  '29810-020'
);

INSERT INTO cliente VALUES (
  '170',
  'POSTO BRASIL LTDA.',
  'AV. IMPERIO, 85',
  'GUAGIRUS',
  'BA',
  '42837-000'
);

INSERT INTO cliente VALUES (
  '340',
  'TRANSP. CARGA PESADA LTDA.',
  'AV. DOS AUTONOMISTAS, 1000',
  'OSASCO',
  'SP',
  '06020-010'
);

INSERT INTO cliente VALUES (
  '100',
  'MICROS INFORMATICA S/A',
  'R. DAS PALMEIRAS, 4 - LOJA 2',
  'SAO PAULO',
  'SP',
  '01226-010'
);

INSERT INTO cliente VALUES (
  '750',
  'IMOBILIARIA PAVAO',
  'AV. BRASIL, 105',
  'RIO DO PRADO',
  'MG',
  '39940-111'
);

INSERT INTO cliente VALUES (
  '860',
  'ASSIS CONTABIL S/C LTDA.',
  'R. DO MONUMENTO, 550',
  'SANTO AMARO',
  'BA',
  '44200-090'
);

INSERT INTO cliente VALUES (
  '230',
  'SUPERMERCADO BOTAFOGO',
  'R. DA LAGOA, 999',
  'RIO DAS OSTRAS',
  'RJ',
  '28890-540'
);

INSERT INTO cliente VALUES (
  '150',
  'MARCONDES E IRMAO LTDA.',
  'R. DO ORATORIO, 66',
  'ROSARIO OESTE',
  'MT',
  '78470-010'
);

INSERT INTO cliente VALUES (
  '800',
  'DOCEIRA PAO DE ACUCAR',
  'R. MARTINS PENA, 200',
  'SANTO ANDRE',
  'SP',
  '09190-700'
);

INSERT INTO cliente VALUES (
  '990',
  'METALURGICA FOGO E FERRO',
  'R. ARTUR BERNARDES, 3500',
  'SANTO ANDRE',
  'SP',
  '09193-410'
);

INSERT INTO cliente VALUES (
  '500',
  'JOSE DANTAS E FILHOS S/C LTDA.',
  'AV. IPIRANGA, 1000',
  'LUCRECIA',
  'RN',
  '59805-010'
);

INSERT INTO cliente VALUES (
  '300',
  'PCTEC - MICROCOMPUTADORES S/A.',
  'R. CAIS DO PORTO, ARMAZEM 3',
  'SANTOS',
  'SP',
  '11000-005'
);

SELECT * FROM cliente; 

SELECT * FROM cliente; 

CREATE TABLE venda (
  DUPLIC CHAR(6)       NOT NULL PRIMARY KEY,
  VALOR  DECIMAL(10,2) NOT NULL,
  VENCTO DATE          NOT NULL,
  CODCLI CHAR(3)       NOT NULL
);

INSERT INTO venda VALUES (
  '230001',
  1300.00,
  '2001-06-10',
  '340'
);

SELECT * FROM venda;

INSERT INTO venda VALUES (
  '230099',
  1000.00,
  '2002-02-10',
  '820'
);

INSERT INTO venda VALUES (
  '997818',
  3000.00,
  '2001-11-11',
  '170'
);

INSERT INTO venda VALUES (
  '202550',
  9518.55,
  '2002-11-21',
  '750'
);

INSERT INTO venda VALUES (
  '113340',
  2002.00,
  '2001-11-25',
  '230'
);

INSERT INTO venda VALUES (
  '900450',
  1200.00,
  '2002-09-09',
  '340'
);

INSERT INTO venda VALUES (
  '202020',
  2390.00,
  '2001-11-11',
  '550'
);

INSERT INTO venda VALUES (
  '100200',
  3500.00,
  '2002-10-11',
  '230'
);

INSERT INTO venda VALUES (
  '345611',
  5090.67,
  '2002-12-12',
  '550'
);

INSERT INTO venda VALUES (
  '900855',
  2356.00,
  '2002-10-10',
  '340'
);

SELECT * FROM venda; 

INSERT INTO cliente VALUES (
  '550',
  'ROTRAM COMERCIAL LTDA.',
  'R. DAS PALMEIRAS, 45 - CJ 10',
  'SAO PAULO',
  'SP',
  '01226-010'
);

LOAD DATA LOCAL INFILE "vendas.txt" INTO TABLE venda;
SELECT * FROM venda;

SELECT venda.DUPLIC, cliente.NOME FROM cliente, venda
  WHERE cliente.CODCLI = venda.CODCLI
;

SELECT cliente.NOME, venda.DUPLIC, venda.VALOR 
  FROM cliente, venda WHERE cliente.CODCLI = venda.CODCLI
  ORDER BY cliente.NOME
;

SELECT cliente.NOME, venda.DUPLIC, venda.VALOR FROM cliente, venda
  WHERE cliente.CODCLI = venda.CODCLI AND cliente.NOME LIKE 'PCTEC%'
;

SELECT cliente.NOME, venda.VENCTO FROM cliente, venda
  WHERE cliente.CODCLI = venda.CODCLI AND venda.VENCTO LIKE '2002-11%'
  ORDER BY venda.VENCTO
;

SELECT cliente.NOME, venda.VENCTO FROM cliente, venda
  WHERE cliente.CODCLI = venda.CODCLI AND venda.VENCTO LIKE '____-10%'
  ORDER BY venda.VENCTO
;

USE virtual;

SELECT cliente.NOME, COUNT(*) FROM cliente, venda
  WHERE cliente.CODCLI = venda.CODCLI
  GROUP BY cliente.NOME
;

INSERT INTO venda VALUES (
  '235100',
  1500.00,
  '2005-06-12',
  '500'
);

INSERT INTO venda VALUES (
  '999820',
  3110.22,
  '2005-05-11',
  '170'
);

INSERT INTO venda VALUES (
  '203052',
  9008.33,
  '2005-08-22',
  '550'
);

INSERT INTO venda VALUES (
  '223345',
  2112.11,
  '2006-08-03',
  '230'
);

INSERT INTO venda VALUES (
  '922452',
  1211.98,
  '2006-09-03',
  '340'
);

INSERT INTO venda VALUES (
  '222228',
  2390.00,
  '2006-10-07',
  '170'
);

INSERT INTO venda VALUES (
  '111211',
  3535.00,
  '2006-11-15',
  '230'
);

INSERT INTO venda VALUES (
  '347711',
  5092.55,
  '2006-11-20',
  '170'
);

INSERT INTO venda VALUES (
  '907754',
  2056.90,
  '2005-10-30',
  '340'
);

SELECT cliente.CODCLI, cliente.NOME, COUNT(*), SUM(venda.VALOR)
  FROM cliente, venda WHERE cliente.CODCLI = venda.CODCLI
  GROUP BY cliente.NOME
;

SELECT cliente.CODCLI, cliente.NOME, 
  COUNT(*) AS TITULOS, SUM(venda.VALOR) AS TOTAL
  FROM cliente, venda WHERE cliente.CODCLI = venda.CODCLI
  GROUP BY cliente.NOME
;

SELECT cliente.NOME AS CLIENTE, COUNT(*) AS VENCIDOS 
  FROM cliente, venda WHERE cliente.CODCLI = venda.CODCLI
  AND VENCTO <= '2003-12-31'
  GROUP BY cliente.NOME ORDER BY cliente.NOME
;

SELECT cliente.NOME, venda.VALOR, venda.VALOR * 0.10 AS JUROS,
  venda.VALOR * 1.10 AS TOTAL FROM cliente, venda
  WHERE cliente.CODCLI = venda.CODCLI AND VENCTO <= '1999-12-31'
  ORDER BY cliente.NOME
;

CREATE VIEW visao1 AS SELECT NOME, DEPTO, SALARIO FROM cadfun;
SELECT * FROM visao1;

CREATE VIEW visao2 AS SELECT cliente.NOME AS CLIENTE, 
  COUNT(*) AS VENCIDOS FROM cliente, venda 
  WHERE cliente.CODCLI = venda.CODCLI AND VENCTO <= '2005-12-31'
  GROUP BY cliente.NOME ORDER BY cliente.NOME
;
SELECT * FROM visao2;

CREATE VIEW visao3 AS SELECT cliente.CODCLI, cliente.NOME,
  cliente.ENDERECO, cliente.CIDADE, cliente.ESTADO, cliente.CEP,
  venda.DUPLIC, venda.VALOR, venda.VENCTO 
  FROM cliente, venda WHERE cliente.CODCLI = venda.CODCLI
  ORDER BY cliente.NOME
;

SELECT * FROM visao3; 

SELECT CODCLI, NOME, DUPLIC, VALOR, VENCTO FROM visao3 
  WHERE CODCLI IN ('100', '500', '990')
;

CREATE VIEW visao4 AS SELECT CODCLI, NOME, DUPLIC, VALOR, VENCTO 
  FROM visao3 
;
SELECT * FROM visao4;

CREATE TABLE dadoscli AS SELECT * FROM visao4;

DROP VIEW visao1;
DROP VIEW visao2;
DROP VIEW visao3;

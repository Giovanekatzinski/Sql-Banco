

-- Criando 'database'

CREATE DATABASE opuspac;

USE opuspac;


-- criando tabela 'Clientes'
CREATE TABLE Clientes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Cidade VARCHAR(100)
);

-- Criando tabela 'Pedidos'
CREATE TABLE Pedidos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    DataPedido DATE,
    ValorTotal DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ID)
);


-- inserir dados em 'Clientes'
INSERT INTO Clientes (Nome, Email, Cidade) VALUES ('Giovane', 'giovane.maciel@opuspac.com.br', 'Jundiaí');
INSERT INTO Clientes (Nome, Email, Cidade) VALUES ('teste', 'teste.teste@opuspac.com.br', 'São Paulo');
INSERT INTO Clientes (Nome, Email, Cidade) VALUES ('teste 2', 'teste.teste@opuspac.com.br', 'Recife');


-- inserir dados em 'Pedidos'
INSERT INTO Pedidos (ClienteID, dataPedido, ValorTotal) VALUES ('1', '1994-08-22', '10.000');
INSERT INTO Pedidos (ClienteID, dataPedido, ValorTotal) VALUES ('2', '1997-09-22', '50.000');
INSERT INTO Pedidos (ClienteID, dataPedido, ValorTotal) VALUES ('3', '2001-08-22', '9.500');


-- trazendo dados da tabela

-- a 
SELECT c.ID, c.Nome, c.Email, c.Cidade, COUNT(p.ID) AS TotalPedidos
FROM Clientes c
INNER JOIN Pedidos p ON c.ID = p.ClienteID
GROUP BY c.ID
ORDER BY TotalPedidos DESC;

-- b
SELECT c.ID, c.Nome, c.Email, c.Cidade, COUNT(p.ID) AS TotalPedidos
FROM Clientes c
INNER JOIN Pedidos p ON c.ID = p.ClienteID
WHERE p.DataPedido >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY c.ID, c.Nome, c.Email, c.Cidade
HAVING TotalPedidos > 3;

-- d
SELECT c.ID, c.Nome, c.Email, c.Cidade, SUM(p.ValorTotal) AS TotalPedidos 
FROM Clientes c
INNER JOIN Pedidos p ON c.ID = p.ClienteID
ORDER BY TotalPedidos DESC;

-- c
SELECT c.Cidade, AVG(p.ValorTotal) AS MediaValorTotal
FROM Clientes c
INNER JOIN Pedidos p ON c.ID = p.ClienteID
GROUP BY c.Cidade;

-- e
SELECT c.Nome, c.Email, c.Cidade
FROM Clientes c
INNER JOIN Pedidos p ON c.ID = p.ClienteID
WHERE p.ID IS NULL;

-- f
UPDATE Clientes
SET Cidade = 'Rio de Janeiro'
WHERE Cidade = 'São Paulo';

-- g

DELETE FROM Pedidos 
where ClienteID = 2;

-- h

DELETE FROM Clientes WHERE Nome = 'Giovane';
DELETE FROM Pedidos WHERE ClienteID = 1;






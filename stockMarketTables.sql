create database stockMarketDB
use stockMarketDB

create table Stocks (
    stockId int primary key identity,
    stockSymbol varchar(20),
    stockName varchar(20),
    createdOn datetime default getdate()
);

create table PriceHistory (
    priceId int primary key identity,
    stockId int,
    openPrice decimal(10, 2),
    highPrice decimal(10, 2),
    lowPrice decimal(10, 2),
    closePrice decimal(10, 2),
    createdOn datetime default getdate(),  
);

create table Users (
    userId int primary key identity,
    username varchar(20),
    email varchar(20),
    createdOn datetime default getdate(), 
);


create table Trade (
    tradeId int primary key identity,
    stockId int,
    userId int,
    tradeType varchar(10),
    tradePrice decimal(10, 2),
    tradeQuantity int,
    createdOn datetime default getdate()
);

create table Orders (
    orderId int primary key identity,
    stockId int,
    userId int,
    orderType varchar(10),
    orderPrice decimal(10, 2),
    orderQuantity int,
    createdOn datetime default getdate()  
);

create table TransactionHistory (
    transactionId int primary key identity,
    userId int,
    stockId int,
    transactionType varchar(20),
    transactionAmount decimal(10, 2),
    createdOn datetime default getdate() 
);

CREATE TABLE TradeExecution (
    tradeExecutionId int primary key identity,
    buyOrderId int,
    sellOrderId int,
    executionPrice decimal(10, 2),
    executionQuantity int,
);


--find the total trade quantity for a specific stock 
select s.stockName, sum(t.tradeQuantity) AS totalTradeQuantity,      
from Stocks s
join Trade t on  s.stockId = t.stockId
where s.stockSymbol = 'APPL'
group by s.stockName;

--find the average price of a specific stock 
select s.stockName, avg(h.price) AS averagePrice
from Stocks s
join PriceHistory h ON s.stockId = h.stockId
where s.stockSymbol = 'FB'
group by s.stockName;

--total trade value for each user
select u.username, sum(t.tradePrice * t.tradeQuantity) AS totalTradeValue
from Users u
join Trade t ON u.userId = t.userId
group by u.username;

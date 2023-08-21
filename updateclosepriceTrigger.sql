-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER updatecloseprice 
   ON TradeExecution
   AFTER INSERT
  
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	DECLARE @Newprice DECIMAL(10, 2);
	DECLARE @priceId int;

    select @Newprice = tradePrice
    from Trade 
    where tradeId = (select buyOrderId from inserted);


	update PriceHistory set closePrice = @Newprice
    from PriceHistory 
    

END
GO
--insert into TradeExecution values(1, 2, 50.00, 5, getdate());
--update Stocks set clo
--use stockMarketDB

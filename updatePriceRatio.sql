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
CREATE TRIGGER updatePriceRatio
   ON  PriceHistory 
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @priceId INT;
	DECLARE @lowPrice DESCIMAL(10, 2);
	DECLARE @highPrice DECIMAL(10, 2);
	declare @ratio DECIMAL(10, 2);

    SELECT @priceId = priceId, @lowPrice = lowPrice, @highPrice = highPrice
    FROM inserted;

    IF @lowPrice != 0
    BEGIN
        UPDATE PriceHistrory
        SET ratio = @highPrice / @lowPrice
        WHERE priceId = @priceId;
    END
    ELSE
    BEGIN
        UPDATE PriceHistory
        SET ratio = NULL
        WHERE priceId = @priceId;
    END

END
GO
--insert into PriceHistory values (1,11.00, 10.00, 20.00,11.00,getdate());

--SELECT * FROM PriceHistory WHERE priceId = 1;

--use stockMarketDB
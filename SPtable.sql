-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Payal
-- Create date: 2023-08-14
-- Description:	to create sp demo
-- =============================================
CREATE PROCEDURE insertrecord 
	-- Add the parameters for the stored procedure here
	    @priceId int,
	    @StockId int,
		@OpenPrice decimal(10,2),
    	@HighPrice decimal(10,2),
    	@LowPrice decimal(10,2),
		@ClosePrice decimal(10,2),
    	@date datetime,
		@OPtype varchar(5)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if(@priceId=1)
	BEGIN
	insert into PriceHistory values(@StockId,@OpenPrice,@HighPrice,@LowPrice,@ClosePrice,@date)
	END

	ELSE
	BEGIN
	if(@OPtype='U')
	BEGIN
	update PriceHistory set OpenPrice=@OpenPrice  where @priceId=1
END
	ELSE
	BEGIN
	 if(@OPtype='D')
	BEGIN
	 delete Stock where @StockId=1
	END
    ELSE 
    BEGIN
	select @StockId, @OpenPrice
        from PriceHistory;
		END

end
end
END
GO
DECLARE @StockId int,@OpenPrice decimal(10,2),@HighPrice decimal(10,2), @LowPrice decimal(10,2),@ClosePrice decimal(10,2), @date datetime;
SET @StockId=1;
set @OpenPrice=140.00
set @HighPrice =1450.00;
set @LowPrice =143.00;
set @ClosePrice=140.00

set @date=getdate();
exec insertrecord 1,@StockId,@OpenPrice,@HighPrice,@HighPrice,@LowPrice,@ClosePrice,@date,'A'

--select * from Stocks
--use stockMarketDB


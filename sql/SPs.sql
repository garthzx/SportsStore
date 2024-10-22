USE [SportsStore];
GO
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

/* =============== ADMIN SPs =============== */
CREATE PROCEDURE GetAllUsers
AS
BEGIN
    SELECT * FROM [Users];
END
GO


CREATE PROCEDURE GetAllCarts
AS
BEGIN
    SELECT * FROM [Carts]
END
GO

CREATE PROCEDURE GetAllCategories
AS
BEGIN
    SELECT * FROM [Categories]
END
GO

CREATE PROCEDURE GetAllProducts
AS
BEGIN
    SELECT * FROM [Products]
END
GO

CREATE PROCEDURE GetAllOrders
AS
BEGIN
    SELECT * FROM [Orders]
END
GO

CREATE PROCEDURE GetAllOrderDetails
AS
BEGIN
    SELECT 
        od.id,
        od.orderId,
        od.productId,
        o.userId,
        o.name,
        o.street,
        o.city,
        o.state,
        o.zip,
        o.country,
        o.giftwrap,
        p.name AS productName,
        p.price AS price,
        od.quantity AS quantity
    FROM [OrderDetails] AS od
    INNER JOIN [Orders] AS o ON od.orderId = o.id
    INNER JOIN [Products] AS p ON od.productId = p.id
    ORDER BY country
END
GO

CREATE PROCEDURE GetAllCartItems
AS
BEGIN
    SELECT * FROM [CartItems]
END
GO


/* ============== USER SPs ============== */
CREATE PROCEDURE [LoginUser]
    @username VARCHAR(40) NOT NULL,
    @password VARCHAR(100) NOT NULL
AS
BEGIN
    SELECT * FROM [Users] WHERE username = @username AND [Users].[password] = @password;
END
GO

CREATE PROCEDURE [RegisterUser]
    @username VARCHAR(40) NOT NULL,
    @password VARCHAR(100) NOT NULL
AS
BEGIN
    DECLARE @newUserId UNIQUEIDENTIFIER = NEWID();
    INSERT INTO [Users] VALUES (NEWID(), @newUserId, @password);
    INSERT INTO [Carts] VALUES (NEWID(), @newUserId);
END
GO

CREATE PROCEDURE [AddToCart]
    @cartId UNIQUEIDENTIFIER NOT NULL,
    @productId UNIQUEIDENTIFIER NOT NULL,
AS
BEGIN
    INSERT INTO [CartItems] VALUES (NEWID(), @cartId, @productId)
END
GO

CREATE PROCEDURE [RemoveFromCart]
    @cartId UNIQUEIDENTIFIER NOT NULL,
    @productId UNIQUEIDENTIFIER NOT NULL,
AS
BEGIN
    DELETE FROM [CartItems] 
    WHERE cartId = @cartId AND productId = @productId;
END
GO

CREATE PROCEDURE [Checkout]
    @id UNIQUEIDENTIFIER NOT NULL,
    @userId UNIQUEIDENTIFIER NOT NULL,
    @name VARCHAR(100) NOT NULL,
	@street VARCHAR(100) NOT NULL,
	@city VARCHAR(100) NOT NULL,
	@state VARCHAR(100) NOT NULL,
	@zip VARCHAR(20) NOT NULL,
	@country VARCHAR(50) NOT NULL,
	@giftwrap BIT NOT NULL
AS
BEGIN
    INSERT INTO [Orders] 
    VALUES (@id, @userId, @name, @street, 
            @city, @state, @zip, @country, @giftwrap)
END
GO

CREATE PROCEDURE [AddOrderDetailsUponCheckout]
    @orderId UNIQUEIDENTIFIER NOT NULL,
    @productId UNIQUEIDENTIFIER NOT NULL
AS
BEGIN
    INSERT INTO [OrderDetails]
    VALUES (NEWID(), @orderId, @productId);
END
GO



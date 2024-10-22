USE [SportsStore];

DECLARE @catId1 UNIQUEIDENTIFIER = NEWID();
DECLARE @catId2 UNIQUEIDENTIFIER = NEWID();
DECLARE @catId3 UNIQUEIDENTIFIER = NEWID();

INSERT INTO [Categories] (id, name)
VALUES (@catId1, 'Watersports'), (@catId2, 'Soccer'), (@catId3, 'Chess');

DECLARE @prodId1 UNIQUEIDENTIFIER = NEWID(),
		@prodId2 UNIQUEIDENTIFIER = NEWID(),
		@prodId3 UNIQUEIDENTIFIER = NEWID(),
		@prodId4 UNIQUEIDENTIFIER = NEWID(),
		@prodId5 UNIQUEIDENTIFIER = NEWID(),
		@prodId6 UNIQUEIDENTIFIER = NEWID(),
		@prodId7 UNIQUEIDENTIFIER = NEWID(),
		@prodId8 UNIQUEIDENTIFIER = NEWID(),
		@prodId9 UNIQUEIDENTIFIER = NEWID();

INSERT INTO [Products] 
	(id, name, description, categoryId, price)
	VALUES 
	(@prodId1, 'Kayak', 'A boat for one person', @catId1, 275),
	(@prodId2, 'Lifejacket', 'Protective and fashionable', @catId1, 48.95),
	(@prodId3, 'Soccer Ball', 'FIFA-approved size and weight', @catId2, 19.5),
	(@prodId4, 'Corner Flags', 'Give your playing field a professional touch', @catId2, 34.95),
	(@prodId5, 'Stadium', 'Flat-packed 35,000-seat stadium', @catId2, 79500.00),
	(@prodId6, 'Thinking Cap', 'Improve your brain efficiency by 75%', @catId3, 16),
	(@prodId7, 'Unsteady Chair', 'Secretly give your opponent a disadvantage', @catId3, 29.95),
	(@prodId8, 'Human Chess Board', 'A fun game for the family', @catId3, 75),
	(@prodId9, 'Bling-Bling King', 'Gold-plated, diamond-studded King', @catId3, 1200);

DECLARE @userId1 UNIQUEIDENTIFIER = NEWID();
INSERT INTO [Users] VALUES (@userId1, 'garthzx', 'admin');

DECLARE @cartId1 UNIQUEIDENTIFIER = NEWID();
INSERT INTO [Cart] VALUES (@cartId1, @userId1);


INSERT INTO [CartItems] VALUES (NEWID(), @cartId1, @prod1);
INSERT INTO [CartItems] VALUES (NEWID(), @cartId1, @prod1);
INSERT INTO [CartItems] VALUES (NEWID(), @cartId1, @prod2);
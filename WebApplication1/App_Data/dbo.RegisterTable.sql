CREATE TABLE [dbo].[RegisterTable]
(
	[user_id] INT NOT NULL IDENTITY (1,1) PRIMARY KEY, 
    [username] VARCHAR(50) NOT NULL, 
    [password] VARCHAR(50) NOT NULL,
    [e_mail] VARCHAR(50) NOT NULL, 
    [dateOfRegister] SMALLDATETIME NOT NULL, 
    [lastLogIn] SMALLDATETIME NOT NULL 
)

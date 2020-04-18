
DECLARE @PATH VARCHAR(100)
DECLARE @FILEEXTENSION CHAR(4)
DECLARE @DATE VARCHAR(20)

DECLARE @FULLPATH VARCHAR(100)


SET @PATH = 'D:\Backup\'
/*
code 120 had following format 'aaaa-mm-dd hh:mi:ss (24h) and code
102 have this 'aaaa.mm.dd'

RAPLACE function is used to change specific char or char group to format that you wish

*/
SET @DATE = REPLACE((CONVERT(nvarchar(30),GETDATE(), 120)),'','_')
SET @DATE = REPLACE(@DATE,':','.')
SET @FILEEXTENSION = '.bak'

SET @FULLPATH = @PATH+@DATE+@FILEEXTENSION

--backup command--
BACKUP DATABASE database_name TO DISK=@FULLPATH

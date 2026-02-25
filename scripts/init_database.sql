
/*
================================================================================
DESCRIPTION: the scripts sets up three schemas within the database(Bronze, Silver, Gold)
WARNING: This script drops the 'Datawarehouse' database if it already exists.
         All existing data will be permanently deleted.
================================================================================
*/
USE master;
GO

-- 1. Eğer veritabanı zaten varsa bağlantıları kes ve sil
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DatawarehouseAnalytics')
BEGIN
    ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DatawarehouseAnalytics;
END;
GO

CREATE DATABASE DatawarehouseAnalytics;
GO

USE DatawarehouseAnalytics;
GO

CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO




PRINT 'İşlem başarıyla tamamlandı

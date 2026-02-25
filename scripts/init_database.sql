
/*
================================================================================
PROJE: E-Ticaret Analitik Veri Platformu Altyapısı
POZİSYON: Veri Analisti Portfolyosu
AÇIKLAMA: 
    Bu script, analitik raporlamalar için gereken 'Datawarehouse' ortamını hazırlar.
    Veri Analisti olarak ham veriden (Bronze), temizlenmiş veriye (Silver) ve 
    KPI hesaplanmış veriye (Gold) geçiş sürecini simüle etmek için şemalar oluşturur.
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


-- enable change tracking at the database level
ALTER DATABASE AdventureWorks2012  
SET CHANGE_TRACKING = ON  
(CHANGE_RETENTION = 2 DAYS, AUTO_CLEANUP = ON)


-- enable change tracking for a table
ALTER TABLE Person.Contact  
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON)  


-- disable change tracking for a database
ALTER DATABASE AdventureWorks2012  
SET CHANGE_TRACKING = OFF  

-- Disable change tracking for a table
ALTER TABLE Person.Contact  
DISABLE CHANGE_TRACKING;  



   -- Obtain the current synchronization version. This will be used next time that changes are obtained.  
    SET @synchronization_version = CHANGE_TRACKING_CURRENT_VERSION();  

    -- Obtain initial data set.  
    SELECT  
        P.ProductID, P.Name, P.ListPrice  
    FROM  
        SalesLT.Product AS P  


		SELECT  
    CT.ProductID, CT.SYS_CHANGE_OPERATION,  
    CT.SYS_CHANGE_COLUMNS, CT.SYS_CHANGE_CONTEXT  
FROM  
    CHANGETABLE(CHANGES SalesLT.Product, @last_synchronization_version) AS CT  


	SELECT  
    CT.ProductID, P.Name, P.ListPrice,  
    CT.SYS_CHANGE_OPERATION, CT.SYS_CHANGE_COLUMNS,  
    CT.SYS_CHANGE_CONTEXT  
FROM  
    SalesLT.Product AS P  
RIGHT OUTER JOIN  
    CHANGETABLE(CHANGES SalesLT.Product, @last_synchronization_version) AS CT  
ON  
    P.ProductID = CT.ProductID  



	EXEC sys.sp_cdc_enable_db  
GO  

--
ALTER DATABASE AdventureWorksLT  
    SET ALLOW_SNAPSHOT_ISOLATION ON;  


ALTER DATABASE AdventureWorksLT 
SET CHANGE_TRACKING = ON  
(CHANGE_RETENTION = 2 DAYS, AUTO_CLEANUP = ON)


ALTER TABLE SalesLT.Customer 
ENABLE CHANGE_TRACKING  
WITH (TRACK_COLUMNS_UPDATED = ON) ;

 SELECT CHANGE_TRACKING_CURRENT_VERSION();  

 0


select * FROM SalesLT.Customer 

BEGIN TRAN

UPDATE SalesLT.Customer
SET Firstname = firstname + ' UPDATE'
WHERE CustomerId = 1

ROLLback

SET TRANSACTION ISOLATION LEVEL SNAPSHOT;  
BEGIN TRAN  
  -- Verify that version of the previous synchronization is valid.  
  -- Obtain the version to use next time.  
  -- Obtain changes.  
COMMIT TRAN  



SELECT  
    
CT.*
FROM  
    CHANGETABLE(CHANGES SalesLT.Customer, 5) AS CT  

SELECT object_Name(object_id), * FROM sys.change_tracking_tables 



SET @synchronization_version = CHANGE_TRACKING_CURRENT_VERSION() 
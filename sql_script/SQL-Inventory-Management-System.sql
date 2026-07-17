-- ================================================================================================================================
--                                                SQL-Inventory-Management-System
--================================================================================================================================
--============================= SUPPLIER TABLE ===============================================
Create Table 
Supplier(
          SID char(5) Primary Key, 
		  SName Varchar(15) Not Null, 
		  SAdd Varchar(25), 
		  SCity Varchar(15), 
		 SPhone int Unique, 
		 Email Varchar(25)
		 );  
--============================= PRODUCT TABLE ===============================================
Create Table 
Product(
        PID char(5) Primary Key, 
		PDesc Varchar(50) Not Null, 
		Price float check (Price>0), 
	   Category char(2) Check(Category in ('IT', 'HA', 'HC')), 
	   SID Char(5) REFERENCES Supplier(SID)
	   );
	   
--============================== STOCK TABLE ===============================================
Create Table 
Stock(
       PID char(5) REFERENCES Product(PID), 
	   SQty int Check (Sqty >= 0), 
	   ROL int check (ROL>0), 
	  MOQ int Check(MOQ >=5)
	  );

--============================== CUSTOMER TABLE ===============================================
Create Table 
Cust(
      CID char(5) Primary Key, 
	  CName Varchar(15) Not Null, 
	  Address Varchar(25) Not Null, 
	  City Varchar(15) Not Null, 
	  Phone int Not Null, 
	  Email varchar(20), 
	  DOB Date Check (DOB <'01-Jan-2000')
	  );
	   
--============================== ORDER TABLE ===============================================
Create Table 
Orders(
        OID char(5) Primary Key, 
		ODate Date, 
		PID char(5) REFERENCES Product(PID), 
		CID char(5) REFERENCES Cust(CID), 
		OQty int Check(OQty >=1)
		);

--<<<<<<<<<<<<<<================================= RECORDS ==========================================================>>>>>>>>>
-- ============================================================================
-- 1. SUPPLIER TABLE (10 Records) - SName<=15, SAdd<=25, SCity<=15, Email<=25
-- ============================================================================
INSERT INTO Supplier (SID, SName, SAdd, SCity, SPhone, Email) VALUES
('S0001', 'Rajesh Sharma', '124 Connaught Place', 'Delhi', 981012345, 'r.sharma@gmail.com'),
('S0002', 'Ananya Iyer', '45 M.G. Road', 'Bengaluru', 944012345, 'a.iyer@outlook.com'),
('S0003', 'Vikram Patel', '88 Nariman Point', 'Mumbai', 922012345, 'v.patel@yahoo.com'),
('S0004', 'Priya Nair', '213 Anna Salai', 'Chennai', 944412345, 'p.nair@gmail.com'),
('S0005', 'Amit Joshi', '67 Gachibowli', 'Hyderabad', 984812345, 'a.joshi@joshisales.in'),
('S0006', 'Sanjay Gupta', '32 Chandni Chowk', 'Delhi', 981198765, 's.gupta@guptadist.com'),
('S0007', 'Meera Kulkarni', '12 BKC Complex', 'Mumbai', 932298765, 'meera.k@kulkarni.com'),
('S0008', 'Rahul Hegde', '77 Whitefield Road', 'Bengaluru', 988098765, 'r.hegde@hegde.in'),
('S0009', 'Deepak Verma', '404 Karol Bagh', 'Delhi', 991098765, 'd.verma@hotmail.com'),
('S0010', 'Sunita Reddy', '90 Jubilee Hills', 'Hyderabad', 994998765, 's.reddy@reddy.com');


-- ============================================================================
-- 2. PRODUCT TABLE (20 Records) - PDesc<=50
-- ============================================================================
INSERT INTO Product (PID, PDesc, Price, Category, SID) VALUES
('P0001', 'Logitech Wireless Mouse M331', 1250.00, 'IT', 'S0001'),
('P0002', 'HP v236w 64GB USB Drive', 650.00, 'IT', 'S0001'),
('P0003', 'Samsung 28L Convection MW', 15490.00, 'HA', 'S0003'),
('P0004', 'LG 1.5 Ton 5 Star Split AC', 42990.00, 'HC', 'S0004'),
('P0005', 'Philips Induction Cooktop', 3200.00, 'HA', 'S0002'),
('P0006', 'Dell MS116 Wired Mouse', 399.00, 'IT', 'S0008'),
('P0007', 'Sony WH-1000XM4 Headphones', 22990.00, 'IT', 'S0002'),
('P0008', 'Havells Carlo Fan Heater', 4100.00, 'HC', 'S0006'),
('P0009', 'Sujata Powermatic Juicer', 6200.00, 'HA', 'S0006'),
('P0010', 'Seagate Expansion 1TB HDD', 4899.00, 'IT', 'S0008'),
('P0011', 'Bajaj New Shakti 15L Heater', 7499.00, 'HA', 'S0005'),
('P0012', 'Dyson V8 Cordless Vacuum', 34900.00, 'HC', 'S0007'),
('P0013', 'Lenovo IdeaPad Slim Lptp', 38490.00, 'IT', 'S0005'),
('P0014', 'Kent Grand+ 8L Purifier', 16500.00, 'HA', 'S0009'),
('P0015', 'Mi Smart Air Purifier 4', 13999.00, 'HC', 'S0009'),
('P0016', 'TP-Link Archer C6 Router', 2499.00, 'IT', 'S0010'),
('P0017', 'IFB 6.0 Kg Front Load WM', 24490.00, 'HA', 'S0003'),
('P0018', 'Usha Swift Ceiling Fan', 2100.00, 'HC', 'S0010'),
('P0019', 'SanDisk Ultra 128GB Type-C', 1150.00, 'IT', 'S0001'),
('P0020', 'Voltas 1.5 Ton Window AC', 29490.00, 'HC', 'S0004');


-- ============================================================================
-- 3. STOCK TABLE (10 Records)
-- ============================================================================
INSERT INTO Stock (PID, SQty, ROL, MOQ) VALUES
('P0001', 45, 10, 20),
('P0002', 120, 25, 50),
('P0003', 12, 5, 5),
('P0004', 8, 3, 5),
('P0005', 25, 8, 15),
('P0006', 80, 20, 30),
('P0007', 15, 4, 5),
('P0011', 19, 6, 10),
('P0013', 7, 2, 5),
('P0019', 150, 30, 60);


-- ============================================================================
-- 4. CUSTOMER TABLE (10 Records) - CName<=15, Address<=25, City<=15, Email<=20
-- ============================================================================
INSERT INTO Cust (CID, CName, Address, City, Phone, Email, DOB) VALUES
('C0001', 'Arjun Mishra', 'Sector 15, Noida', 'Delhi', 987111223, 'arjun@gmail.com', '1988-05-14'),
('C0002', 'Rohan Deshmukh', 'Juhu Tara Road', 'Mumbai', 982011223, 'rohan.d@yahoo.com', '1992-11-23'),
('C0003', 'Kavitha Rao', 'Indiranagar 10th Cross', 'Bengaluru', 984511223, 'kavi@hotmail.com', '1979-02-04'),
('C0004', 'Siddharth Sen', 'Salt Lake Sector 2', 'Mumbai', 983011223, 'sid.s@outlook.com', '1995-08-19'),
('C0005', 'Neha Aggarwal', 'Greater Kailash II', 'Delhi', 981011223, 'neha.a@gmail.com', '1991-03-31'),
('C0006', 'Vijay Kapoor', 'Lokhandwala Complex', 'Mumbai', 932011223, 'vijay@kapoor.com', '1984-07-12'),
('C0007', 'Deepa Balan', 'Koramangala 4th Block', 'Bengaluru', 994511223, 'deepa.b@gmail.com', '1997-10-05'),
('C0008', 'Manish Tiwari', 'Rohini Sector 9', 'Delhi', 991011223, 'manish.t@gmail.com', '1989-12-25'),
('C0009', 'Suresh Kumar', 'Malleswaram 18 Cross', 'Bengaluru', 988011223, 'suresh.k@yahoo.com', '1975-04-15'),
('C0010', 'Pooja Bhatia', 'Andheri West', 'Mumbai', 981911223, 'pooja.b@gmail.com', '1996-01-01');


-- ============================================================================
-- 5. ORDER TABLE (5 Records)
-- ============================================================================
INSERT INTO Orders (OID, ODate, PID, CID, OQty) VALUES
('O0001', '2026-05-10', 'P0001', 'C0001', 2),
('O0002', '2026-05-12', 'P0003', 'C0003', 1),
('O0003', '2026-05-15', 'P0002', 'C0001', 5),
('O0004', '2026-05-18', 'P0007', 'C0002', 1),
('O0005', '2026-05-20', 'P0001', 'C0005', 3);

SELECT * FROM Supplier;
SELECT * FROM Product;
SELECT * FROM Stock;
SELECT * FROM Cust;
SELECT * FROM Orders;

-- ================================================================================================================================
--                                                TASK 1 
--                   CREATE BELOW PROCEDURES IN THE INVENTORY DATABASE AS SPECIFIED
--==================================================================================================================================

-- ADDSUPPLIER – SHOULD ADD THE SUPPLIER IN THE SUPLIER TABLE AND DISPLAY THE DETAILS OF THE NEW SUPPLIER ADDED.
SELECT * FROM Supplier;

Create Procedure ADDSUPPLIER @SID char(5), @SName Varchar(15), @SAdd Varchar(25), @SCity Varchar(15), @SPhone int, @Email Varchar(25)
As
Begin
Insert into Supplier values(@SID, @SName, @SAdd, @SCity, @SPhone, @Email);
Select * from Supplier where sid = @SID;
End; 

EXEC ADDSUPPLIER 'S0011', 'Ankita Singh', 'Ulsuru', 'Bengaluru', 945010524, 'a.singh@gmail.com'  

-- ADDPRO – SHOULD ADD THE PRODUCT IN THE PRODUCT TABLE AND DISPLAY THE DETAILS OF THE NEW PRODUCT ADDED.
SELECT * FROM Product;

Create Procedure ADDPRO @PID char(5), @PDesc Varchar(50), @Price float, @Category char(2), @SID Char(5)
As
Begin
Insert into Product values (@PID, @PDesc, @Price, @Category, @SID)
Select * from Product where PID = @PID;
End;

Exec ADDPRO 'P0021', 'Hitachi 1.5 Dual Split AC', 35000, 'HC', 'S0004' ;

-- ADDCUST – SHOULD ADD THE CUSTOMER IN THE CUSTOMER TABLE AND DISPLAY THE DETAILS OF THE NEW CUSTOMER ADDED.
SELECT * FROM Cust;

Create procedure ADDCUST @CID char(5), @CName Varchar(15), @Address Varchar(25), @City Varchar(15), @Phone int, @Email varchar(20), @DOB Date
As
Begin
Insert into Cust values (@CID, @CName, @Address, @City, @Phone, @Email, @DOB);
Select*from Cust where CID = @CID;
End;

Exec ADDCUST 'C0011', 'Bharat Sharma', 'Block B Sensorium', 'Pune', 885841460, 'bharat.s@yahoo.com', '23-Jun-1991';

-- ADDORDER – SHOULD ADD THE ORDER IN THE ORDERS TABLE AND DISPLAY THE DETAILS OF THE ORDER. ORDER DATE SHOULD BE CURRENT DATE AND SHOULD COME AUTOMATICALLY.
SELECT * FROM Orders;

Create Procedure ADDORDER @OID char(5), @PID char(5), @CID char(5), @OQty int
As
Begin
Insert into Orders(OID, ODate, PID, CID, OQty) values (@OID, GetDate(), @PID, @CID, @OQty);
Select* from Orders where OID = @OID
End;

ADDORDer 'O0006','P0003', 'C0003', 2

-- ================================================================================================================================
--                                                          TASK2  
-- CREATE A FUNCTION FOR AUTOGENERATION OF 5 CHARACTERS ALPHA NUMERIC ID. IT SHOULD ACCEPT 2 PARAMETERS A CHARACTER AND 
-- THE NUMBER AND RETURN THE ID BY CONCANATING THE CHARACTER , REQUIRED ZEROS AND THE SPECIFIED NUMBER.
-- ================================================================================================================================
Create Function ID_Generator (@Char as Char(1), @Num as int)
returns char(5)
As
Begin
     Declare @ID as Char(5);
	 if @Num < 10
	    set @ID = CONCAT(@Char,'000',@Num);
	 Else If @Num < 100
	    set @ID = CONCAT(@Char,'00',@Num);
	 Else If @Num < 1000
	    set @ID = CONCAT(@Char,'0',@Num);
	 Else If @Num < 10000
	    set @ID = CONCAT(@Char,@Num);
	 Else
	    set @ID = 'NA'
	Return @ID;
End;

--=================================================================================================================================
--                                                          TASK3  
-- RECREATE BELOW PROCEDURES IN THE INVENTORY DATABASE AS SPECIFIED (ALL THE ID s SHOULD BE AUTOMATICALLY GENERATED USING 
-- ABOVE CREATED FUNCTION AND SEQUENCES) :
-- =================================================================================================================================

--ADDSUPPLIER – SHOULD ADD THE SUPPLIER IN THE SUPLIER TABLE AND DISPLAY THE DETAILS OF THE NEW SUPPLIER ADDED.
SELECT * FROM Supplier;

-- Step 1: Create the Sequence for the Suplier

Create Sequence Sseq as int 
start with 1
increment by 1;

-- Step 1.1: Calculate the next number
SELECT @nextnum = ISNULL(MAX(CAST(SUBSTRING(SID, 2, LEN(SID)) AS INT)), 0) + 1
FROM Supplier; 

print(@nextnum)

-- Step 1.2: Update the sequence
ALTER SEQUENCE Sseq RESTART WITH 12;

-- Step 2- Create Procedure for Supplier Table
Create Procedure Spro @Name as varchar(20), @Adress as varchar(40) , @City as varchar(20), @Phone as int, @Email as varchar(40)
AS
Begin
     Declare @SID as Char(5);
	 Declare @I as int;
	 set @I = Next value for Sseq;
     set @SID = DBO.ID_Generator('S', @I );
	 Insert into Supplier Values (@SID, @Name, @Adress, @City, @Phone, @Email);
	 select*from Supplier;
End;

select*from Supplier;

Spro 'Ruby Singh', '12/7 Krishna Colony ', 'Mumbai', 984360289, 'r.singh@yahoo.com'


--ADDPRO – SHOULD ADD THE PRODUCT IN THE PRODUCT TABLE AND DISPLAY THE DETAILS OF THE NEW PRODUCT ADDED.
SELECT * FROM Product;

-- Step 1: Create the Sequence for the Suplier

Create Sequence Pseq as int 
start with 1
increment by 1;

-- Step 1.1: Calculate the next number

Declare @nextnum_P as int
SELECT @nextnum_P = ISNULL(MAX(CAST(SUBSTRING(PID, 2, LEN(PID)) AS INT)), 0) + 1
FROM Product; 

print(@nextnum_P)

-- Step 1.2: Update the sequence
ALTER SEQUENCE Pseq RESTART WITH 22;

-- Step 2- Create Procedure for Supplier Table
Create Procedure Ppro @PDesc as varchar(30), @Price as float , @Category as char(2), @SID as char(5)
AS
Begin
     Declare @PID as Char(5);
	 Declare @I as int;
	 set @I = Next value for Pseq;
     set @PID = DBO.ID_Generator('P', @I );
	 Insert into Product Values (@PID,@PDesc, @Price , @Category, @SID);
	 select*from Product where PID = @PID;
End;

select*from Product;

Ppro 'Samsung 28L Convection MW', 16000, 'HA','S0012'

--ADDCUST – SHOULD ADD THE CUSTOMER IN THE CUSTOMER TABLE AND DISPLAY THE DETAILS OF THE NEW CUSTOMER ADDED.
SELECT * FROM Cust;

-- Step 1: Create the Sequence for the Suplier

Create Sequence Cseq as int 
start with 12
increment by 1;


-- Step 2- Create Procedure for Supplier Table
Create Procedure Cpro @CName as varchar(20), @CAdress as varchar(40) , @CCity as varchar(20), @CPhone as int, @CEmail as varchar(40), @CDOB as Date
AS
Begin
     Declare @CID as Char(5);
	 Declare @I as int;
	 set @I = Next value for Cseq;
     set @CID = DBO.ID_Generator('C', @I );
	 Insert into Cust Values (@CID, @CName, @CAdress, @CCity, @CPhone, @CEmail, @CDOB);
	 select*from Cust where CID = @CID;
End;

Cpro 'Akshay Dixit', 'Tower B Railway Colony', 'Pune', 984361243, 'akshay@yahoo.com', '17-June-1992'
select*from Cust;
--ADDORDER – SHOULD ADD THE ORDER IN THE ORDERS TABLE AND DISPLAY THE DETAILS OF THORDER. ORDER DATE SHOULD BE CURRENT DATE 
--AND SHOULD COME AUTOMATICALLY.

SELECT * FROM Product order by pid desc;
SELECT * FROM Cust order by cid desc;
SELECT * FROM Orders order by oid desc;

-- Step 1: Create the Sequence for the Suplier

Create Sequence Oseq as int 
start with 7
increment by 1;

-- Step 2- Create Procedure for Supplier Table
Create Procedure Opro @PID as Char(5), @CID as Char(5), @OQty as int
AS
Begin
     Declare @OID as Char(5);
	 Declare @I as int;
	 Declare @ODate as Date;
	 set @I = Next value for Oseq;
     set @OID = DBO.ID_Generator('O', @I );
	 set @ODate = GETDATE()
	 Insert into Orders Values (@OID, @ODate, @PID, @CID, @OQty);
	 select*from Orders where OID = @OID;
End;

Opro 'P0022', 'C0012', 3
select*from Orders;
-- ================================================================================================================================
--                                                          TASK4  
--               Add Triggers Insert , Update and Delete to automatically update the stock table
-- ================================================================================================================================
SELECT * FROM Supplier;
SELECT * FROM Product;
SELECT * FROM Cust;
SELECT * FROM Orders;
SELECT * FROM Stock;
-- Create Insert Trigger On Orders which automatically update the stocks
SELECT * FROM Orders;
SELECT * FROM Stock;

Create Trigger Trigger_Insert_Order
On Orders
For Insert
As
Begin
     Declare @Quantity_Required as int, @Quantity_Stocked as int;
	 set @Quantity_Required = (Select OQty from inserted) ;
	 set @Quantity_Stocked = (Select SQty from stock where PID = (Select PID from Inserted));
	 if @Quantity_Stocked >= @Quantity_Required
	    Begin
	    Update Stock set SQty = SQty - @Quantity_Required where PID = (Select PID from Inserted);
	    Commit;
		End;
	 Else
	    Rollback;
End;

Opro 'P0001', 'C0008', 5

SELECT * FROM Orders;
SELECT * FROM Stock;

-- Create Delete Trigger on Product which automatically delete the stocks
SELECT * FROM Product;
SELECT * FROM Stock;

Create Trigger Trigger_Delete_Product
On Product
INSTEAD OF DELETE -- Changed from 'FOR DELETE' so it runs BEFORE the constraint check
AS
Begin
     Set NOCOUNT ON;
     Delete from Stock where PID = (Select PID from Deleted)
	 Delete from Product where PID = (Select PID from Deleted) -- used this line as there is Foreign key on Stock for column PID refernce w.r.t Column PID of table Product
End;

Delete from Product where PID = 'P0019';

drop trigger Trigger_Delete_Product

-- Create Update Trigger on Orders which automatically update the stocks
SELECT * FROM Orders;
SELECT * FROM Stock;

Create Trigger Trigger_Update_Order
On Orders
For Update
As
Begin
         -- 1. Revert stock for the old product/quantity from the DELETED table
    UPDATE s
    SET s.SQty = s.SQty + d.OQty
    FROM Stock s
    INNER JOIN Deleted d ON s.PID = d.PID;

    -- 2. Deduct stock for the new product/quantity from the INSERTED table
    UPDATE s
    SET s.SQty = s.SQty - i.OQty
    FROM Stock s
    INNER JOIN Inserted i ON s.PID = i.PID;
End;

Opro 'P0001', 'C0008', 5
Update Orders set OQty = 10 where OID = 'O0008'; 

SELECT * FROM Orders;
SELECT * FROM Stock;

-- ================================================== INVENTORY PROJECTED COMPLETED =================================================
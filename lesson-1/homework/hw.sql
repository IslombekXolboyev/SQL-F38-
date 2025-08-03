--1	Data - collection of information which includes words, numbers, facts, statistics and other information.
--	Database - structured collection of information or data which is saved in electronic form and where  information can be retrieved or manipulated.
--	Relational database - it is a type of database that defines relationships between tables and their data.
--	Table - structured collection of data organized in rows and columns.

--2	Five key features of SQL Server - convenient management of large data sets, multifunctionality in working with information, massive information storage, security, triggers and indexes.

--3	Windows Authentication mode, mixed mode.

--4
--create database SchoolDB
--use SchoolDB

--5
--create table Students (StudentID int PRIMARY KEY, Name varchar(50), Age int);

--6	SQL Server - it is type of server where data can be used for storing, processing and managing in organizations.
--	SSMS - interface for SQL with many facilities such as database creation, querying, monitoring and user management. 
--	SQL - Standard language used in all Relational database management systems (RDBMS).

--7	SQL has widely used commands such as DDL, DQL, DML, DCL and TCL. These commands are used for construct blocks for communicate with database management.
--	DDL - Data Definition Language is used for define structure of database. Examples: Create (create database SchoolDB, create table Students), Drop (drop database SchoolDB, drop table Students), Alter (alter table Students add student_name varchar(50)), Truncate (truncate table Students)
--	DML - Data Manipulation Language controls access to data and to the database. Examples: Insert (Insert data into a table), Update (Update existing data within a table), Delete (Delete records from a database table), Lock (Table control concurrency)
--	DQL - Data Query Language is used to perform queries within the database. Examples: Select (Choose data from one table in a database), From (Specify the table from which to retrieve data), where (Filters rows before any grouping or aggregation), distinct (removes duplicate rows)
--	DCL - Data Control Language is used to contol access to data in the database. Examples: Grant (Grant a user access rights to the database), Revoke (Removes previously granted privileges)
--	TCL - Transaction Control Language is used to control and save all transactions in the database. Examples: Commit (saves all changes), Rollback (cancels transactions), Savepoint (creates a savepoint within the current transaction).

--8
--insert into Students values (1, 'John', 20), (2, 'Elena', 19), (3, 'Antony', 21);

--9	Step1 - download AdventureWorksDW2022.bak file from :https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak
--	Step2 - save this AdventureWorksDW2022.bak file to C:\ disk
--	Step3 - open SQL
--	Step4 - open "Databases" folder in Object Explorer
--	Step5 - select Restore Database...
--	Step6 - choose Device and click ... button, click Add, choose AdventureWorksDW2022.bak file and click ok
--	Step7 - back to Object Explorer, click Refresh

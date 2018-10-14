CREATE TABLE Place
(
	PlaceID INTEGER AUTO_INCREMENT PRIMARY KEY,	
	Latitude DECIMAL(10, 8) NOT NULL,
	Longitude DECIMAL(11, 8) NOT NULL,
	Elevation INTEGER,
	Population INTEGER,
	Type VARCHAR(200),
	Country VARCHAR(200),
#	ASCIIName VARCHAR(200),
	INDEX (Latitude) USING BTREE,
	INDEX (Longitude) USING BTREE
);

CREATE TABLE Supplier
(
	SupplierID INTEGER AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(200),
	Country VARCHAR(200),
	ReliabilityScore CHAR(1),
	ContactInfo VARCHAR(350)
#	ProductivityScore INTEGER
);

CREATE TABLE Payment
(
	SupplierID INTEGER NOT NULL,
	Date DATE,
	Amount DECIMAL(10,2),
#	PaymentID INTEGER AUTO_INCREMENT PRIMARY KEY,
	FOREIGN KEY (SupplierID)
      REFERENCES Supplier(SupplierID)
      ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE SuppliedName
(
	SnID INTEGER AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(200),
	Language VARCHAR(200),
	Status VARCHAR(200),
	Standard VARCHAR(200),
	PlaceID INTEGER NOT NULL,
	SupplierID INTEGER,
	DateSupplied DATE,
#	Price DECIMAL(10,2),
	FOREIGN KEY (PlaceID)
      REFERENCES Place(PlaceID)
      ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Department
(
	DeptID INTEGER AUTO_INCREMENT PRIMARY KEY,
	DeptName VARCHAR(200),
	DeptHeadID INTEGER,
	DeptHeadUserID CHAR(16),
	DeptAA  INTEGER,
	ParentDeptID INTEGER
#	Location  VARCHAR(200),
#	DeptType  VARCHAR(200)
);

CREATE TABLE Employee
(
	EmpID INTEGER AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(200),
	TaxID VARCHAR(200),
	Country VARCHAR(200),
	HireDate DATE,
	BirthDate DATE,
	Salary DECIMAL(10,2) CHECK (Salary > 0),
	Bonus DECIMAL(10,2),
	DeptID INTEGER NOT NULL,
	AddressInfo VARCHAR(200),
	CHECK (Salary >= Bonus),
	FOREIGN KEY (DeptID)
		REFERENCES Department(DeptID)
		ON UPDATE CASCADE ON DELETE RESTRICT
);

	
# Access Rights

# All employees can see place and name information
-- CREATE ROLE 'employee_role';
-- GRANT SELECT ON Place TO 'employee_role';
-- GRANT SELECT ON SuppliedName TO 'employee_role';

# Only HR employees can access all HR info
-- CREATE ROLE 'hr_access_role';
-- GRANT SELECT ON Employee TO 'hr_access_role';
-- GRANT SELECT ON Department TO 'hr_access_role';

# Only some HR employees can change the information in the HR portion of the DB
-- CREATE ROLE 'hr_change_role';
-- GRANT SELECT, UPDATE ON Employee TO 'hr_change_role';
-- GRANT SELECT, UPDATE ON Department TO 'hr_change_role';

# Managers can see their employee information
-- CREATE VIEW manager_view
-- AS
-- SELECT * FROM Employee
-- WHERE DeptID = 2;

-- CREATE ROLE 'manager_role';
-- GRANT SELECT ON manager_view TO 'manager_role';

# Managers can update their employee compensation.
-- CREATE VIEW manager_compensation_view
-- AS
-- SELECT EmpID, Salary, Bonus FROM Employee
-- WHERE DeptID = 2;
-- GRANT SELECT, UPDATE ON manager_compensation_view TO 'manager_role';

# Further we can create users and grant them these roles:
-- CREATE USER 'hr_employee_1' IDENTIFIED BY 'hre1password';
-- GRANT 'employee_role', 'hr_access_role', 'hr_change_role' TO 'hr_employee_1';

-- CREATE USER 'manager_2' IDENTIFIED BY 'mng2password';
-- GRANT 'employee_role', 'manager_role' TO 'manager_2';

-- and so on...
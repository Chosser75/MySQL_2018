# Question 1: Find the elevation and population of a place.
	# Variant A: will find a particular place by its ID.
SELECT Elevation, Population FROM Place WHERE PlaceID = 1;

	# Variant B: will find a place by its name.
	# Can produce multiple results if there are several places with the same name.
SELECT Elevation, Population FROM Place 
	JOIN SuppliedName ON Place.PlaceID = SuppliedName.PlaceID
	WHERE SuppliedName.Name = 'Name 7';

# Question 2: Find a place by a partial name.
SELECT PlaceID FROM SuppliedName WHERE Name LIKE '%me 9%';

# Question 3: Find a place in a latitude/longitude box (within a range of latitudes/longitudes)	
SELECT PlaceID FROM Place
	WHERE ((Latitude BETWEEN 3.3456781 AND 3.3456783) AND (Longitude BETWEEN 4.1234561 AND 4.1234563));

# Question 4: Find a place by any of its names, listing its type, 
	# latitude, longitude, country, population and elevation.
SELECT Type, Latitude, Longitude, Country, Population, Elevation FROM Place
	JOIN SuppliedName ON Place.PlaceID = SuppliedName.PlaceID
	WHERE SuppliedName.Name = 'Name 3';

# Question 5: List all the alternate names of a place, along with language, type of name, and standard.	
SELECT Name, Language, Status, Standard FROM SuppliedName
	JOIN Place ON SuppliedName.PlaceID = Place.PlaceID
	WHERE Place.PlaceID = 1;

# Question 6: Find the supplier who supplied a particular name, 
	# along with other information about the supplier.	
SELECT Supplier.SupplierID, Supplier.Name, Supplier.Country, ReliabilityScore, ContactInfo FROM Supplier 
	JOIN SuppliedName ON Supplier.SupplierID = SuppliedName.SupplierID
	WHERE SuppliedName.Name = 'Name 7';

# Question 7: Find how many more names are in each language this month	
SELECT COUNT(SnID), Language FROM SuppliedName
	WHERE DateSupplied >= DATE_FORMAT(NOW() ,'%Y-%m-01')
	GROUP BY Language;

# Question 8: Find how much was paid out to suppliers this month, total	
SELECT SUM(Amount) FROM Payment
	WHERE Date >= DATE_FORMAT(NOW() ,'%Y-%m-01');

# Question 9: Find how much was paid out to suppliers this month, by supplier.	
SELECT SUM(Amount), SupplierID FROM Payment
	WHERE Date >= DATE_FORMAT(NOW() ,'%Y-%m-01')
	GROUP BY SupplierID;

# Question 10: Show all employee information in a particular department.
	# Variant A: by department ID
SELECT * FROM Employee WHERE DeptID = 2;
	# Variant B: by department name	
SELECT Employee.EmpID, Employee.Name, Employee.TaxID, Employee.Country, 
	Employee.HireDate, Employee.BirthDate, Employee.Salary, Employee.Bonus, 
	Employee.DeptID, Employee.AddressInfo FROM Employee 
	JOIN Department ON Employee.DeptID = Department.DeptID
	WHERE Department.DeptName = 'Department2';
	
# Question 11: Increase salary by 10% and set bonus to 0 for all employees in a particular department.
UPDATE Employee SET Salary = Salary * 1.1, Bonus = 0
WHERE DeptID = 3;

# Question 12: Show all current employee information sorted by manager name and employee name.
SELECT Employee.*, (SELECT Name FROM Employee WHERE Employee.EmpID = Department.DeptHeadID) 
	AS Manager FROM Employee
	JOIN Department ON Employee.DeptID = Department.DeptID
	ORDER BY Manager, Employee.Name;

# Question 13: Show all supplier information sorted by country, 
	# including number of names supplied in current month and potential suppliers. 
SELECT Supplier.*, (SELECT COUNT(SnID) FROM SuppliedName 
	WHERE SuppliedName.SupplierID = Supplier.SupplierID 
	AND SuppliedName.DateSupplied >= DATE_FORMAT(NOW() ,'%Y-%m-01')) AS NamesSupplied FROM Supplier
	LEFT OUTER JOIN SuppliedName ON SuppliedName.SupplierID = Supplier.SupplierID
	GROUP BY SupplierID
	ORDER BY Supplier.Country;
	
# Question 14: Describe how you implemented the access restrictions on the previous page.
/*
Created specific roles and granted to that roles accorded privileges 
(also created accorded views for managers).
Now we can grant that roles to particular users according to their current positions.
(Please see the provision file).
*/

# Question 15: Describe how you implement the constraints shown in the ERD and on the employee info.
/*
Table SuppliedName:
PlaceID INTEGER NOT NULL,
FOREIGN KEY (PlaceID)
    REFERENCES Place(PlaceID)
    ON UPDATE CASCADE ON DELETE CASCADE
	  
Table Employee:
Salary DECIMAL(10,2) CHECK (Salary > 0),
CHECK (Salary >= Bonus),
DeptID INTEGER NOT NULL,
FOREIGN KEY (DeptID)
	REFERENCES Department(DeptID)
	ON UPDATE CASCADE ON DELETE SET NULL;
	
Table Payment:
SupplierID INTEGER NOT NULL,
FOREIGN KEY (SupplierID)
      REFERENCES Supplier(SupplierID)
      ON UPDATE CASCADE ON DELETE SET NULL
*/
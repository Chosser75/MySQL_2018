insert into Place
	(PlaceID, Latitude, Longitude, Elevation, Population, Type, Country)
	values
	(1, 3.3456781, 4.1234561, 100, 110, 'Park', 'USA'),
	(2, 3.3456782, 4.1234562, 200, 220, 'Museum', 'China'),
	(3, 3.3456783, 4.1234563, 300, 330, 'Hotel', 'India'),
	(4, 3.3456784, 4.1234564, 400, 440, 'Resort', 'Kazakhstan');

insert into Supplier
	(SupplierID, Name, Country, ReliabilityScore, ContactInfo)
	values
	(1, 'Supplier1', 'USA', 'A', 'Address1'),
	(2, 'Supplier2', 'China', 'B', 'Address2'),
	(3, 'Supplier3', 'India', 'C', 'Address3'),
	(4, 'Supplier4', 'Kazakhstan', 'D', 'Address4'),
	(5, 'Supplier5', 'USA', 'F', 'Address5'),
	(6, 'Supplier6', 'Kazakhstan', 'E', 'Address6'),
	(7, 'Supplier7', 'India', 'F', 'Address7');

insert into Payment
	(SupplierID, Date, Amount)
	values
	(1, '2018-05-28', 100),
	(2, '2018-05-28', 100),
	(3, '2018-05-28', 100),
	(4, '2018-05-28', 100),
	(1, '2018-05-29', 200),
	(2, '2018-05-29', 200),
	(3, '2018-05-29', 200),
	(4, '2018-05-29', 200),
	(1, '2018-05-30', 300),
	(2, '2018-05-30', 300),
	(3, '2018-05-30', 300),
	(4, '2018-05-30', 300),
	(1, '2018-05-31', 400),
	(2, '2018-05-31', 400),
	(3, '2018-05-31', 400),
	(4, '2018-05-31', 400),
	(1, '2018-06-01', 100),
	(2, '2018-06-02', 100),
	(3, '2018-06-03', 100),
	(4, '2018-06-03', 100),
	(5, '2018-06-04', 100);

insert into SuppliedName
	(SnID, Name, Language, Status, Standard, PlaceID, SupplierID, DateSupplied)
	values
	(1, 'Name 1', 'En', 'Status1', 'Standard1', 1, 1, '2018-05-11'),
	(2, 'Name 2', 'Cn', 'Status2', 'Standard2', 1, 2, '2018-05-12'),
	(3, 'Name 3', 'Hn', 'Status3', 'Standard3', 1, 3, '2018-05-13'),
	(4, 'Name 4', 'Kz', 'Status4', 'Standard4', 1, 4, '2018-05-14'),
	(5, 'Name 5', 'En', 'Status1', 'Standard1', 2, 1, '2018-05-15'),
	(6, 'Name 6', 'Cn', 'Status2', 'Standard2', 2, 2, '2018-05-16'),
	(7, 'Name 7', 'Hn', 'Status3', 'Standard3', 2, 3, '2018-05-17'),
	(8, 'Name 8', 'Kz', 'Status4', 'Standard4', 2, 4, '2018-05-18'),
	(9, 'Name 9', 'En', 'Status1', 'Standard1', 3, 1, '2018-05-11'),
	(10, 'Name 10', 'Cn', 'Status2', 'Standard2', 3, 2, '2018-05-12'),
	(11, 'Name 11', 'Hn', 'Status3', 'Standard3', 3, 3, '2018-05-13'),
	(12, 'Name 12', 'Kz', 'Status4', 'Standard4', 3, 4, '2018-05-19'),
	(13, 'Name 13', 'En', 'Status1', 'Standard1', 4, 1, '2018-05-20'),
	(14, 'Name 14', 'Cn', 'Status2', 'Standard2', 4, 2, '2018-05-21'),
	(15, 'Name 15', 'Hn', 'Status3', 'Standard3', 4, 3, '2018-05-22'),
	(16, 'Name 16', 'Kz', 'Status4', 'Standard4', 4, 4, '2018-05-23'),
	(17, 'Name 17', 'En', 'Status1', 'Standard1', 2, 1, '2018-06-01'),
	(18, 'Name 18', 'Cn', 'Status2', 'Standard2', 2, 2, '2018-06-02'),
	(19, 'Name 19', 'Hn', 'Status3', 'Standard3', 2, 3, '2018-06-03'),
	(20, 'Name 20', 'Kz', 'Status4', 'Standard4', 2, 4, '2018-06-03'),
	(21, 'Name 21', 'En', 'Status1', 'Standard1', 2, 6, '2018-06-04');

insert into Department
	(DeptID, DeptName, DeptHeadUserID)
	values
	(1, 'Department1', 'userid1'),
	(2, 'Department2', 'userid2'),
	(3, 'Department3', 'userid3');

insert into Employee
	(EmpID, Name, TaxID, Country, HireDate, BirthDate, Salary, Bonus, DeptID, AddressInfo)
	values
	(1, 'Employee1', 'taxid1', 'USA', '2018-05-11', '1985-05-11', 6000, 3000, 1, 'Address1'),
	(2, 'Employee2', 'taxid2', 'China', '2018-05-12', '1983-05-12', 5000, 4000, 1, 'Address2'),
	(3, 'Employee3', 'taxid3', 'India', '2018-05-13', '1982-02-11', 5500, 3500, 1, 'Address3'),
	(4, 'Employee4', 'taxid4', 'USA', '2018-05-14', '1985-05-11', 6000, 3000, 2, 'Address4'),
	(5, 'Employee5', 'taxid5', 'China', '2018-05-15', '1983-05-12', 5000, 4000, 2, 'Address5'),
	(6, 'Employee6', 'taxid6', 'India', '2018-05-16', '1982-02-11', 5500, 3500, 2, 'Address6'),
	(7, 'Employee7', 'taxid7', 'USA', '2018-05-17', '1985-05-11', 6000, 3000, 3, 'Address7'),
	(8, 'Employee8', 'taxid8', 'China', '2018-05-18', '1983-05-12', 5000, 4000, 3, 'Address8'),
	(9, 'Employee9', 'taxid9', 'India', '2018-05-19', '1982-02-11', 5500, 3500, 3, 'Address9');

update Department
	set DeptHeadID = 1, DeptAA = 2, ParentDeptID = 2
	where DeptID = 1;
	
update Department
	set DeptHeadID = 2, DeptAA = 1, ParentDeptID = 3
	where DeptID = 2;
	
update Department
	set DeptHeadID = 3, DeptAA = 3, ParentDeptID = 1
	where DeptID = 3;
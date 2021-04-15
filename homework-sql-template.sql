--------------------------ДОМАШКА----------------------------

----------------------ЗАДАНИЕ №1-----------------------------
--Вывести всю информацию из таблицы Sales.Customer 
-------------------------------------------------------------

SELECT * 
From Sales.Customer

GO

----------------------ЗАДАНИЕ №2-----------------------------
--Вывести всю информацию из таблицы Sales.Store отсортированную 
--по Name в алфавитном порядке
-------------------------------------------------------------

SELECT *
From Sales.Store
Order by Name 

GO

----------------------ЗАДАНИЕ №3-----------------------------
--Вывести из таблицы HumanResources.Employee всю информацию
--о десяти сотрудниках, которые родились позже 1989-09-28
-------------------------------------------------------------

SELECT *
From HumanResources.Employee
Where BirthDate > '1989-09-28'

GO

----------------------ЗАДАНИЕ №4-----------------------------
--Вывести из таблицы HumanResources.Employee сотрудников
--у которых последний символ LoginID является 0.
--Вывести только NationalIDNumber, LoginID, JobTitle.
--Данные должны быть отсортированы по JobTitle по убиванию
-------------------------------------------------------------

SELECT NationalIDNumber, LoginID, JobTitle
From HumanResources.Employee
Where LoginID  like '%0'
Order by JobTitle desc

GO

----------------------ЗАДАНИЕ №5-----------------------------
--Вывести из таблицы Person.Person всю информацию о записях, которые были 
--обновлены в 2008 году (ModifiedDate) и MiddleName содержит
--значение и Title не содержит значение 
-------------------------------------------------------------

SELECT *
From Person.Person
Where MiddleName is not null and Title is null and ModifiedDate like '%2008%'

GO

----------------------ЗАДАНИЕ №6-----------------------------
--Вывести название отдела (HumanResources.Department.Name) БЕЗ повторений
--в которых есть сотрудники
--Использовать таблицы HumanResources.EmployeeDepartmentHistory и HumanResources.Department
-------------------------------------------------------------

SELECT distinct HumanResources.Department.Name
From HumanResources.Department inner join HumanResources.EmployeeDepartmentHistory 
on HumanResources.Department.DepartmentID = HumanResources.EmployeeDepartmentHistory.DepartmentID
Where HumanResources.EmployeeDepartmentHistory.EndDate is null

GO

----------------------ЗАДАНИЕ №7-----------------------------
--Сгрупировать данные из таблицы Sales.SalesPerson по TerritoryID
--и вывести сумму CommissionPct, если она больше 0
-------------------------------------------------------------

SELECT Sales.SalesPerson.TerritoryID, COUNT(*) as CommissionPct
From Sales.SalesPerson 
Group by Sales.SalesPerson.TerritoryID 
Having count(*) > 0

GO

----------------------ЗАДАНИЕ №8-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют самое большое кол-во 
--отпуска (HumanResources.Employee.VacationHours)
-------------------------------------------------------------

SELECT *
From HumanResources.Employee
Where HumanResources.Employee.VacationHours =
(
 select max(VacationHours)
 from HumanResources.Employee
)

GO

----------------------ЗАДАНИЕ №9-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют позицию (HumanResources.Employee.JobTitle)
--'Sales Representative' или 'Network Administrator' или 'Network Manager'
-------------------------------------------------------------

SELECT *
From HumanResources.Employee
Where HumanResources.Employee.JobTitle = 'Sales Representative' or 
HumanResources.Employee.JobTitle ='Network Administrator' or 
HumanResources.Employee.JobTitle ='Network Manager'

GO

----------------------ЗАДАНИЕ №10-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) и 
--их заказах (Purchasing.PurchaseOrderHeader). ЕСЛИ У СОТРУДНИКА НЕТ
--ЗАКАЗОВ ОН ДОЛЖЕН БЫТЬ ВЫВЕДЕН ТОЖЕ!!!
-------------------------------------------------------------

SELECT *
From HumanResources.Employee left join Purchasing.PurchaseOrderHeader
on HumanResources.Employee.BusinessEntityID = Purchasing.PurchaseOrderHeader.EmployeeID

GO


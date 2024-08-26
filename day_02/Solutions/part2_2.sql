use Company_SD

select * from Employee

select Fname, Lname, Salary, Dno from Employee

select Pname, Plocation, Dnum from Project

select Fname + ' ' + Lname as Full_Name, 0.1 * Salary as annual_commission from Employee

select SSN, Fname + ' ' + Lname as Full_Name from Employee
where Salary > 1000

select SSN, Fname + ' ' + Lname as Full_Name from Employee
where Salary > 10000

select Fname + ' ' + Lname as Full_Name, Salary from Employee
where Sex = 'F'

select Dname, Dnum from Departments
where MGRSSN = 968574


select Pnumber, Pname, Plocation from Project
where Dnum = 10
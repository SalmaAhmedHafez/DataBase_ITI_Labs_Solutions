use Company_SD

select Dnum, Dname, SSN, Fname + ' ' + Lname as full_name 
from Departments, Employee
where Dno = Dnum

select Dname, Pname
from Departments D, Project P
where D.Dnum = P.Dnum

select Fname + ' ' + Lname as Employee_Name, D.* 
from Employee, Dependent D
where ESSN = SSN

select Pnumber, Pname, Plocation 
from Project 
where City in ('Cairo', 'Alex')

select * from Project
where Pname like 'a%'

select * from Employee 
where Dno = 30 and Salary between 1000 and 2000

select Fname + ' ' + Lname as fullname
from Employee, Works_for, Project	 
where hours = 10 and Pname = 'AL Rabwah' and ESSn = SSN and Pno = Pnumber

select concat(x.Fname, ' ', x.Lname)
from Employee x, Employee y
where y.Superssn = x.SSN and y.Fname = 'Kamel' 

select concat(Fname, ' ', Lname), Pname, Plocation
from Employee, Project, Works_for
where SSN = ESSn and pno = Pnumber
order by Pname

select Pnumber, Dname, Lname, Address, Bdate
from Project P, Departments D, Employee
where City = 'Cairo' and P.Dnum = D.Dnum and SSN = MGRSSN

select E.*
from Employee E, Departments
where SSN = MGRSSN

select *
from Employee right outer join Dependent
on SSN = ESSN


insert into Employee 
values ('Salme', 'Hafez', 102672, 2002-08-21, 'Mansoura', 'F', 3000, 112233, 30)

insert into Employee(Fname, Lname, Bdate, Address, Sex, SSN, Dno)
values ('Norhan', 'Ihab', 2002-07-16, 'Mansoura', 'F', 102660, 30)

update Employee set Salary += 0.2 * Salary
where SSN = 102672


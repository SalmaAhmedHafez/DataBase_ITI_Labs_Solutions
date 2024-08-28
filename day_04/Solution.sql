use Company_SD

--1.	 Display (Using Union Function)
--a.	 The name and the gender of the dependence that's gender is Female and depending on Female Employee.
--b.	 And the male dependence that depends on Male Employee.

select Dependent_name, D.Sex
from Dependent D, Employee E
where D.Sex = 'F' and ESSN = SSN and E.Sex = 'F'
union 
select Dependent_name, D.Sex
from Dependent D, Employee E
where D.Sex = 'M' and ESSN = SSN and E.Sex = 'M'


--2.	For each project, list the project name and the total hours per week (for all employees) spent on that project.
select Pname, sum(Hours) 
from Project, Works_for
group by Pname


--3.	Display the data of the department which has the smallest employee ID over all employees' ID.
select D.*
from Departments D, Employee
where SSN = (select min(SSN) from Employee) and Dno = Dnum

--4.	For each department, retrieve the department name and the maximum, minimum and average salary of its employees
select Dname, max(Salary), min(Salary), avg(Salary)
from Departments, Employee
where Dnum = Dno
group by Dname

--5.	List the last name of all managers who have no dependents.
select Lname
from Employee, Departments
where SSN = MGRSSN and SSN not in (select ESSN from Dependent where ESSN is not null)


--6.	For each department-- if its average salary is less than the average salary of all employees-- display its number, name and number of its employees.
select Dnum, Dname, count(SSN) as Employee_cnt
from Departments, Employee
where Dnum = Dno 
group by Dname, Dnum
having avg(Salary) < (select avg(Salary) from Employee)


--7.	Retrieve a list of employees and the projects they are working on ordered by department and within each department,
--      ordered alphabetically by last name, first name.
select concat(Fname, ' ', Lname) as Full_name, Pname, Dname
from Employee, Departments D, Project P, Works_for
where Dno = D.Dnum and P.Dnum = D.Dnum and SSN = ESSn 
group by Dname, Lname, Fname, Pname

--8.	Try to get the max 2 salaries using subquery
select max(Salary) as Max_SaL, (select max(salary) from Employee where Salary < (select max(Salary) from Employee)) as snd_Max
from Employee

--9.	Get the full name of employees that is similar to any dependent name
select concat(Fname, ' ', Lname) as full_name
from Employee, Dependent
where Dependent_name like concat('%', Fname, ' ', Lname, '%') 

--10.	Try to update all salaries of employees who work in Project ‘Al Rabwah’ by 30% 
update Employee
set salary = 1.3 * Salary
where SSN in (select ESSn from Works_for, Project where ESSn = SSn and Pno = Pnumber and  Pname = 'Al Rabwah')

--11.	Display the employee number and name if at least one of them have dependents (use exists keyword) self-study.
select SSN, concat(Fname, ' ', Lname) as full_name
from Employee
where exists (select 1 from Dependent where SSN = ESSN)


------------------------------------part two-------------------------
--1.	In the department table insert new department called "DEPT IT" , with id 100, employee with SSN = 112233 as a manager for this department. 
--      The start date for this manager is '1-11-2006'
insert into Departments
values ('DEPT IT', 100, 112233, '01-11-2006')

--2.	Do what is required if you know that : Mrs.Noha Mohamed(SSN=968574)  moved to be the manager of the new department (id = 100),
--      and they give you(your SSN =102672) her position (Dept. 20 manager) 

--a.	First try to update her record in the department table
--b.	Update your record to be department 20 manager.
--c.	Update the data of employee number=102660 to be in your teamwork (he will be supervised by you) (your SSN =102672)

update Departments
set MGRSSN = 968574, [MGRStart Date] = '2024-08-28'
where Dnum = 100




--3.	Unfortunately the company ended the contract with Mr. Kamel Mohamed (SSN=223344)
--      so try to delete his data from your database in case you know that you will be temporarily in his position.
--      Hint: (Check if Mr. Kamel has dependents, works as a department manager, supervises any employees or works in any projects and handle these cases).


update Employee
set Superssn = 102672
where Superssn = 223344

update Departments
set MGRSSN = 102672, [MGRStart Date] = '2024-08-28'
where MGRSSN = 223344

delete from Dependent
where ESSN = 223344

update Works_for
set ESSn = 102672
where ESSn = 223344

delete from	Employee
where SSN = 223344

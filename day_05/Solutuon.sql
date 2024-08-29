use ITI

--1.	Retrieve number of students who have a value in their age. 
select * from Student 
where St_Age is not null

--2.	Get all instructors Names without repetition
select distinct Ins_Name
from Instructor

--3.	Display student with the following Format (use isNull function) 
--      Student ID	Student Full Name	Department name

select St_Id as 'Student ID', 
				 concat(isnull(St_Fname, 'XXXX'), ' ' + isnull(St_Lname, 'XXXX')) as 'Student Full Name',
				 isnull(Dept_name, 'Not_Selected') as 'Department name'
from Student S, Department D
where S.Dept_Id = D.Dept_Id

--4.	Display instructor Name and Department Name 
--      Note: display all the instructors if they are attached to a department or not
select Ins_Name, Dept_name
from Instructor I, Department D
where I.Dept_Id = D.Dept_Id

--5.	Display student full name and the name of the course he is taking For only courses which have a grade  
select concat(St_Fname, ' ', St_Lname) as "Full name"
from Student
where St_Id in (select St_Id from Stud_Course where Grade is not null)

--6.	Display number of courses for each topic name
select Top_name, count(crs_id)
from Topic T, Course C
where C.Top_id = T.Top_id 
group by Top_name

--7.	Display max and min salary for instructors
select min(Salary), max(Salary)
from Instructor


--8.	Display instructors who have salaries less than the average salary of all instructors.
select * from Instructor
where Salary < (select avg(Salary) from Instructor)

--9.	Display the Department name that contains the instructor who receives the minimum salary.
select Dept_name
from Department D, Instructor I
where D.Dept_Id = I.Dept_Id and Salary = (select min(Salary) from Instructor)

--10.	 Select max two salaries in instructor table. 
select top(2) Salary 
from Instructor
order by Salary desc

--11.	 Select instructor name and his salary but if there is no salary display instructor bonus. “use one of coalesce Function”
select Ins_Name, coalesce(convert(nvarchar(max),Salary), 'Bonus')
from Instructor

--12.	Select Average Salary for instructors 
select avg(Salary)
from Instructor

--13.	Select Student first name and the data of his supervisor 

select X.St_Fname, Y.*
from Student X, Student Y
where Y.St_Id = X.St_super

--14.	Write a query to select the highest two salaries in Each Department for instructors who have salaries. “using one of Ranking Functions”

select Salary from 
	(select salary, ROW_NUMBER() over(partition by dept_id order by salary desc) as RN
	from Instructor)
	as SubQuery
where RN <= 2

--15.	 Write a query to select a random  student from each department.  “using one of Ranking Functions”
select * from
	(select *, ROW_NUMBER() over(partition by dept_id order by newId()) as RN
	from student)
	as SubQuery
where RN = 1


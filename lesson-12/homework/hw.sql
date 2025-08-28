--1
select p.firstName, p.lastName, a.city, a.state
from Person p
left join Address a on p.personId = a.personId;

--2
select e.name as EmployeeName
from Employee e
left join Employee m on e.managerId = m.id
where e.salary > m.salary;

--3
select email as Email
from Person
group by email
having count(email) > 1;

--4
select * from Person
where id in (	
	select min(id)
	from Person
	group by email);

--5
select distinct g.ParentName
from girls g
where g.ParentName not in (
	select distinct b.ParentName
	from boys b
);

--6
select * from Sales.OrderDetails
select * from Sales.Orders
select custid,
	cast(sum(case when freight > 50 then unitprice*qty*(1-discount) else 0 end) as decimal(10,2)) as TotalSalesAbove50,
	min(freight) as Leastweight
from Sales.Orders s
join Sales.OrderDetails o on s.orderid = o.orderid
group by custid;

--7
select 
	c1.Item as [Item Cart 1],
	c2.Item as [Item Cart 2]
from Cart1 c1
full outer join Cart2 c2 on c1.Item = c2.Item 
order by coalesce(c1.item, c2.item);

--8
select c.name as Customers
from Customers c	
left join Orders o on c.id = o.customerId
where o.customerId is null;

--9
select 
	s.student_id,
	s.student_name,
	sub.subject_name,
	count(e.subject_name) as attended_exams
from Students s
cross join Subjects sub
left join Examinations e 
	on e.student_id = s.student_id 
	and sub.subject_name = e.subject_name
group by s.student_id, s.student_name, sub.subject_name
order by s.student_id, sub.subject_name;

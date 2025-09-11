--1
select id, name, salary
from employees
where salary = (select min(salary) from employees);

--2
select id, product_name, price
from products
where price > (select AVG(price) from products);

--3
select 
	id, name
from employees
where department_id = (select id from departments where department_name = 'Sales');

--4
select customer_id, name
from customers 
where customer_id not in (select customer_id from orders);

--5
select * 
from products p
where p.price = (select max(price) from products where category_id = p.category_id);

--6
select *
from employees e
join departments d on e.department_id = d.id
where e.department_id = 
	(select top 1 department_id 
	from employees 
	group by department_id 
	order by avg(salary) desc);

--7
select * 
from employees e1
where e1.salary > (select avg(e2.salary) from employees e2 where e2.department_id = e1.department_id);

--8
select *
from students s
join grades g on s.student_id = g.student_id
where g.grade = (select max(g2.grade) from grades g2 where g2.course_id = g.course_id);

--9
select * 
from (
	select p.*,
	ROW_NUMBER() over (partition by category_id order by price desc) as rn
	from products p) ranked
where rn = 3;

--10
SELECT e.id, e.name, e.salary, e.department_id
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary) FROM employees
)
AND e.salary < (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);

--1
select distinct  
	case
	when col1 < col2 then col1 else col2 end as col1,
	case
	when col1 < col2 then col2 else col1 end as col2 
from InputTbl;

select
	min(col1) as col1,
	max(col2) as col2
from ( 
	select distinct  
	case
	when col1 < col2 then col1 else col2 end as col1,
	case
	when col1 < col2 then col2 else col1 end as col2 
from InputTbl) as t
group by col1, col2;

--2
select * from TestMultipleZero
where not (A=0 and B=0 and C=0 and D=0);

--3
select * from section1
where id % 2 = 1;

--4
select top 1 id, name
from section1
order by id asc;

--5
select top 1 id, name
from section1
order by id desc;

--6
select * from section1
where name like 'b%';

--7
select * from ProductCodes
where Code like '%\_%' escape '\';

/* SCRIPT FOR CREATING TABLE AND INSERTING DATA */
create table temp_employee 
(
emp_name varchar(10),
dep_id int,
salary int
);
delete from temp_employee;
insert into temp_employee values 
('Siva',1,30000),('Ravi',2,40000),('Prasad',1,50000),('Sai',2,20000)

/*QUESTION: FIND HIGHEST AND LOWEST SALARY IN EACH DEPARTMENT */
--ANSWER:
WITH cte as (
select *, RANK() over(partition by dep_id order by salary desc) as rnk_asc,
RANK() over(partition by dep_id order by salary) as rnk_dsc
from temp_employee)
select dep_id, 
max(case when rnk_asc = 1 then emp_name end) as max_salary_emp,
max(case when rnk_dsc = 1 then emp_name end) as min_salary_emp
from cte
group by dep_id

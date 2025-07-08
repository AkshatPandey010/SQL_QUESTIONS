/* SCRIPT FOR CREATING TABLE AND INSERTING DATA */
CREATE TABLE [emp_salary]
(
    [emp_id] INTEGER  NOT NULL,
    [name] NVARCHAR(20)  NOT NULL,
    [salary] NVARCHAR(30),
    [dept_id] INTEGER
);

INSERT INTO emp_salary
(emp_id, name, salary, dept_id)
VALUES(101, 'sohan', '3000', '11'),
(102, 'rohan', '4000', '12'),
(103, 'mohan', '5000', '13'),
(104, 'cat', '3000', '11'),
(105, 'suresh', '4000', '12'),
(109, 'mahesh', '7000', '12'),
(108, 'kamal', '8000', '11');

/* QUESTION :
WRITE A QUERY TO FIND EMPLOYE WHO'S SALARY IS SAME IN THEIR DEPARTMENT */
/* SAMPLE DATA 
emp_id	name	  salary	dept_id
101	    sohan	  3000	  11
102	    rohan	  4000	  12
103	    mohan	  5000	  13
104	    cat	    3000	  11
105	    suresh	4000	  12
109	    mahesh	7000	  12
108	    kamal	  8000	  11 

EXPECTED OUTPUT: 
emp_id	name	  salary	dept_id
101	    sohan	  3000	  11
104	    cat	    3000	  11
105	    suresh	4000	  12
102	    rohan	  4000	  12
*/
--ANSWER :
WITH grouped_salary_and_dep AS (
    SELECT salary, dept_id 
    FROM emp_salary
    GROUP BY salary, dept_id
      HAVING COUNT(1) > 1)
SELECT es.* 
FROM emp_salary es
INNER JOIN grouped_salary_and_dep gsd 
		on gsd.dept_id = es.dept_id and	gsd.salary = es.salary

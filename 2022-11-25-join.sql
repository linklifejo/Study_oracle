
 [예제 5-1]
SELECT *
FROM    EMPlOYEES; -- 107건 발생
WHERE   --join 조건이 와야된다

SELECT *
FROM departments; --27건 발생

SELECT  employee_id,
        last_name,
        department_name
FROM EMPlOYEES, departments; 

[예제 5-2]
SELECT  e.employee_id, e.last_name,
        d.department_name
FROM    EMPlOYEES e, departments d 
WHERE   e.department_id = d.department_id(+);

select *
from emp_details_view;

SELECT  e.employee_id,
        e.last_name,
        d.department_name
FROM EMPlOYEES e, departments d 
WHERE e.department_id = d.department_id
ORDER BY 1;


SELECT  e.employee_id,
        e.last_name,
        d.department_name
FROM    EMPlOYEES e, departments d 
WHERE   e.department_id = d.department_id


[예제 5-6]
SELECT  e.employee_id, e.first_name, e.last_name,e.salary,
        d.department_name,
        j.job_title,
        l.city
FROM    employees e, departments d, jobs j, locations l
WHERE   e.department_id = d.department_id
AND     e.job_id = j.job_id
AND     d.location_id = l.location_id
AND     e.employee_id = 101;


[예제 5-7]
SELECT  e.employee_id, e.first_name, e.last_name,e.salary,
        j.job_title
FROM    employees e, jobs j
WHERE   e.salary BETWEEN J.MIN_salary AND j.max_salary
AND     department_id = 10;
        
         
SELECT  e.employee_id, e.last_name,
        d.department_name
FROM    EMPlOYEES e, departments d 
WHERE   e.department_id(+) = d.department_id  --NULL 값이 빠져서 106개만 나옴
ORDER BY 1;       

SELECT COUNT(*)
FROM EMPlOYEES;

SELECT  e.employee_id, e.last_name,
        d.department_name
FROM    EMPlOYEES e, departments d 
WHERE   e.department_id = d.department_id(+) 
ORDER BY 1;       


[예제 5-9]  

SELECT  e.employee_id, e.first_name, e.last_name,e.salary,
        d.department_name,
        l.city
FROM    employees e, departments d,locations l
WHERE   e.department_id = d.department_id(+)
AND     d.location_id = l.location_id(+);
        
[예제 5-10]
SELECT   e.employee_id, e.first_name, 
         m.employee_id manager_id, m.first_name manager_name
FROM     employees e, employees m
WHERE    e.manager_id = m.employee_id
AND     e.manager_id IS NOT NULL
ORDER BY 1;

[예제 5-11]
매니저가 없는 사원의 사번, 이름 정보를 조회
SELECT   e.employee_id, e.first_name, 
         m.employee_id manager_id, m.first_name manager_name
FROM     employees e, employees m
WHERE    e.manager_id IS NOT NULL
ORDER BY 1;






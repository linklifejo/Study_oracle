[예제5-12]사원의 사번,이름,부서코드,부서명 

desc employees;
desc department;

--ORACLE EQUL JOIN을 이용해서 해보자
SELECT  e.employee_id, e.last_name,
        d.department_id, d.department_name
FROM    EMPlOYEES e, departments d 
WHERE   e.department_id = d.department_id                     
ORDER BY 1;

--ANSI JOIN에서 INNER JOIN을 이용해보자
SELECT  e.employee_id, e.last_name,
        d.department_id, d.department_name
FROM    EMPlOYEES e INNER JOIN departments d 
ON  e.department_id = d.department_id
ORDER BY 1;

SELECT  e.employee_id, e.last_name,
        d.department_id, d.department_name
FROM    EMPlOYEES e JOIN departments d --INNER JOIN에서 INNER를 생략하고 JOIN만 사용 가능
ON  e.department_id = d.department_id
ORDER BY 1;

JOIN조건에 ON 대신에 USING 사용.이때는 컬럼명의 별칭은 사용하지 않는다

SELECT  e.employee_id, e.last_name,
        department_id, d.department_name
FROM    EMPlOYEES e INNER JOIN departments d 
USING  (department_id)
ORDER BY 1;

[예제5-15]사원의 사번, 이름, 부서코드, 부서명,위치 코드,도시 정보를 조회

--ORACLE JOIN 이용해서 
SELECT  e.employee_id, e.first_name||' '|| e.last_name name ,e.salary,
        d.department_name,
        l.location_id, l.city
FROM    employees e, departments d,locations l
WHERE   e.department_id = d.department_id
AND     d.location_id = l.location_id
ORDER BY 1;        
--ANSI JOIN의 inner join을 이용해서 하자
SELECT  e.employee_id, e.first_name||' '|| e.last_name name ,e.salary,
        d.department_name,
        l.location_id, l.city
FROM    employees e INNER JOIN departments d
ON      e.department_id = d.department_id
INNER JOIN locations l
ON      d.location_id = l.location_id;
ORDER BY 1; 

--ON 대신에 USING을 사용해서 해보자
SELECT  e.employee_id, e.first_name||' '|| e.last_name name ,e.salary,
        department_name,
        location_id, l.city
FROM    employees e INNER JOIN departments d
using     (department_id)
INNER JOIN locations l
using      (location_id) 
ORDER BY 1;


[예제5-16]
SELECT  e.employee_id, e.last_name,
        d.department_id, d.department_name
FROM    EMPlOYEES e, departments d 
WHERE   e.department_id = d.department_id(+)--사원이긴 한데 부서코드가 없는 사람도 있으므로 ORACLE OUTER JOIN 사용
and      e.manager_id IS NOT NULL
ORDER BY 1;

SELECT  e.employee_id, e.last_name,
        d.department_id, d.department_name
FROM    EMPlOYEES e full OUTER JOIN departments d 
ON      e.department_id = d.department_id
where     e.manager_id IS NOT NULL
ORDER BY 1;

SELECT *
FROM departments;

SELECT *
FROM EMPlOYEES;

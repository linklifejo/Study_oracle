[연습문제 5-2]
1.사번인 110,130,150,에 해당하는 사원의 사번, 이름,부서명을 조회
SELECT  e.employee_id, e.last_name,
        d.department_name
FROM    EMPlOYEES e, departments d 
WHERE   e.department_id = d.department_id--사원이긴 한데 부서코드가 없는 사람도 있으므로 ORACLE OUTER JOIN 사용
and     e.employee_id IN (110,130,150)
ORDER BY 1;


SELECT  e.employee_id, e.last_name,
        d.department_name
FROM    EMPlOYEES e INNER JOIN departments d 
ON   e.department_id = d.department_id--사원이긴 한데 부서코드가 없는 사람도 있으므로 ORACLE OUTER JOIN 사용
WHERE    e.employee_id IN (110,130,150)
ORDER BY 1;

2.모든 사원의 사번, 이름, 부서명, 업무코드, 업무제목을 조회
사번순서대로 정렬

--oracle outer join을 이용해서 해보자
SELECT  e.employee_id, e.last_name, 
        d.department_name,
        j.job_id, j. job_title
FROM    EMPlOYEES e, departments d, jobs j
WHERE   e.department_id = d.department_id(+)--사원이긴 한데 부서코드가 없는 사람도 있으므로 ORACLE OUTER JOIN 사용
and     e.job_id = j.job_id(+)
and      e.manager_id IS NOT NULL
ORDER BY 1;--106개

--ANSI JOIN에서 LEFT OUTER JOIN 사용해서 해보자
SELECT  e.employee_id, e.last_name, 
        d.department_name,
        j.job_id, j. job_title
FROM    EMPlOYEES e LEFT OUTER JOIN departments d
ON      e.department_id = d.department_id
LEFT OUTER JOIN jobs j
on        e.job_id = j.job_id
WHERE    e.manager_id IS NOT NULL
ORDER BY 1;--106


--ANSI JOIN에서 RIGIT JOIN 사용해서 해보자
SELECT  e.employee_id, e.first_name, 
        d.department_name,
        j.job_id, j.job_title
FROM    departments d RIGHT OUTER JOIN employees e
ON      e.department_id = d.department_id
RIGHT OUTER JOIN jobs j
ON      e.job_id = j.job_id
WHERE   e.manager_id IS NOT NULL
ORDER BY 1; -- 106 rows

--ANSI JOIN에서 FULL JOIN 사용해서 해보자
SELECT  e.employee_id, e.first_name, 
        d.department_name,
        j.job_id, j.job_title
FROM    departments d FULL OUTER JOIN employees e
ON      e.department_id = d.department_id
FULL OUTER JOIN jobs j
ON      e.job_id = j.job_id
WHERE   e.manager_id IS NOT NULL
ORDER BY 1; -- 106 rows

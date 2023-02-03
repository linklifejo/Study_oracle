[연습문제 6-2]
1. 부서위치 코드가 1700에 해당하는 모든 사원의 사번, 이름, 부서코드, 업무코드를 조회
다중 행 서브쿼리를 이용한다
SELECT department_id
from departments
where location_id = 1700
order by 1;--department_id가 10~270까지 나옴

SELECT employee_id, first_name, department_id, job_id
FROM employees
WHERE DEPARTMENT_id IN (SELECT department_id
                        from departments
                        where location_id = 1700)
ORDER BY 1; --18개 나온다

2.부서별로 가장 급여를 많이 받는 사원의 사번, 이름 ,부서번호, 급여, 업무코드를 조회. 
다중 컬럼 서브쿼리를 사용하여 작성한다.

SELECT department_id, MAX(salary)
FROM    employees
WHERE   department_id IS NOT NULL
GROUP BY department_id;
--서브쿼리로 조회
SELECT employee_id, first_name, department_id, salary, job_id
FROM   employees
WHERE   (department_id, salary) IN ( SELECT department_id, MAX(salary)
                                     FROM    employees
                                     GROUP BY department_id ); -- 11 rows
[연습문제 6-1]
1. 급여가 가장 적은 사원의 사번, 이름, 부서 급여를 조회하는 쿼리문 조회
--일반 쿼리문을 이용해서 조회
SELECT MIN(salary)  --가장 적은 급여를 알아야되니 MIN함수 사용해서 조회
FROM employees;--2100

SELECT employee_id, first_name, last_name ,department_id, salary
FROM employees
WHERE salary = 2100;--Olsen 1명 나옴

--서브 쿼리문 이용해서 조회
SELECT employee_id, first_name, last_name ,department_id, salary
FROM employees
WHERE salary = (SELECT MIN(salary)  
                FROM employees);
                
2.부서명이 Marketing 인 부서에 속한 모든 사원의 사번, 이름, 부서코드, 업무코드를 조회
SELECT department_id
FROM departments
WHERE department_name LIKE '%Marketing%';--20번 한개 나옴

SELECT employee_id, first_name, last_name ,department_id, job_id
FROM employees
WHERE department_id = (SELECT department_id
                        FROM departments
                        WHERE department_name LIKE '%Marketing%');--2개나옴
                        
                        
3.회사의 사장보다 더 먼저 입사한 사원들의 사번, 이름, 입사일을 조회하는 쿼리문 작성
단, 사장은 그를 관리하는 매니저가 없는 사원이다.
--사장의 입사일을 먼저 알아봐야 된다.
SELECT employee_id, first_name, last_name , hire_date
FROM employees
WHERE hire_date > (SELECT hire_date
                    FROM employees
                    WHERE manager_ID IS NULL);
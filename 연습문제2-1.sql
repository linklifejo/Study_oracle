--연습문제 2-1

--1. 사번이 200인 사원의 이름과 부서번호 조회
SELECT employee_id ,first_name ||' '||last_name full_name
FROM employees
WHERE employee_id = 200;

-- 2. 급여가 3000~15000 사이에 포함되지 않는 사원의 사번, 이름, 급여정보 조회
SELECT employee_id ,first_name ||' '||last_name full_name, salary
FROM employees
WHERE NOT salary BETWEEN 3000 AND 15000;
--WHERE salary < 3000 
--or salary < 15000;  이렇게 해도 된다

--3. 부서번호 30~60에 소속된 사원의 사번, 이름, 부서번호, 급여 조회,이름을 오름차순 정렬
SELECT employee_id ,department_id, salary
FROM employees
WHERE department_id =30
OR department_id =60 -- in을 써서department_id IN(30,60)
ORDER BY first_name;

--4.급여가3000~15000 이면서 부서번호 30 또는 60에 소속된 사원의 사번, 이름, 급여 조회
SELECT employee_id ,first_name ||' '||last_name name, salary "Monthly Salary"
FROM employees
WHERE salary BETWEEN 3000 AND 15000
AND department_id IN (30,60) -- in을 써서department_id IN(30,60)
ORDER BY first_name;

--5. 소속된 부서번호가 없는 사원의 사번 이름 업무id 조회
SELECT employee_id ,first_name,job_id
FROM employees
WHERE department_id IS NUll;

--6.커미션을 받는 사원의 사번, 이름,급여 ,커미션을 조회, 커미션 높은 순으로 정렬
SELECT employee_id ,first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NUll
ORDER BY  commission_pct DESC;

--7. 이름에 문자 Z가 포함된 사원의 사번과 이름을 조회
SELECT employee_id ,first_name
FROM employees
WHERE first_name LIKE '%z%';
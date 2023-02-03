[연습문제 3-2]
1. 사원 테이블에서 이름이 A로 시작하는 모든 사원의 이름과 이름의 길이를 조회
SELECT employee_id ,first_name, LENGTH(first_name)name_length
FROM employees
WHERE first_name LIKE 'A%'
ORDER BY 1;

2.80번의 부서원의 이름과 급여를 조회(급여는 15자 길이로 왼쪽에 $기호가 채워진 형태로)
SELECT employee_id ,first_name, LPAD(salary,15,'$')salary
FROM employees
WHERE department_id = 80;

3.60번 부서, 80번 부서, 100번 부서에 소속된 사원의 사번, 이름, 전화번호, 전화번호의 지역번호 조회
(지역번호 컬럼은 Local Number,
SELECT employee_id ,first_name, phone_number, 
        SUBSTR(phone_number,1,INSTR(phone_number,'.')-1) "Local Number",
        SUBSTR(phone_number,INSTR(phone_number,'.')+1) "Extra Number"
FROM employees
WHERE department_id IN (60,80,100)
ORDER BY 1;







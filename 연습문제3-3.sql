[연습문제 3-3]
1.사원 30번 부서원의 사번,성명, 급여 ,근무개월수 조회 MONTHS_BETWEEN(DATE1,DATE2)
근무 개월수는 오늘 날짜를 기준으로 날짜 함수를 사용

SELECT employee_id EMP_ID, first_name||' ' ||last_name, TO_CHAR (salary,'$99,999,999'), MONTHS_BETWEEN(sysdate,hire_date)"근무 개월수",
       ROUND(MONTHS_BETWEEN(sysdate,hire_date)/12)"근속 년수"
FROM employees
WHERE department_id = 30
ORDER BY employee_id; 

2.급여가 12000달러 이상인 사원의 사번 ,성명, 급여 조회
급여순으로 ,단 급여는 천단위 구분

SELECT employee_id EMP_ID, first_name||' ' ||last_name name, TO_CHAR (salary,'$99,999,999')
FROM employees
WHERE salary >= 12000
ORDER BY salary;

3.2005년 이전에 입사한 사원들의 사번, 성명, 입사일, 업무 시작 요일(입사날짜) 조회

SELECT employee_id 사번, first_name||' ' ||last_name 성명, hire_date 입사일, TO_CHAR(hire_date, 'DAY')"업무 시작 요일"
FROM employees
WHERE TO_CHAR(hire_date,'YYYY') < 2005;
--WHERE TO_CHAR(hire_date,'YYYY-MM-DD') < '2005-01-01';--2004/12/31까지도 가능






-- 2장. 데이터의 조회 구문
/*

-- 2.1 SELECT 구문
SELECT 컬럼1, 컬럼2
FROM 테이블명;

SELECT employee_id, first_name, department_id
FROM employees;

SELECT *
FROM employees;

SELECT employee_id, first_name, department_id
FROM employees
WHERE department_id = 100;


[2-1]성이 King인 사원의 정보를 조회하시오
-- last_name 이 king인지 확인하면 된다.

SELECT employee_id 사번, last_name 성, department_id 부서 
FROM employees
WHERE last_name = 'King';


[예제 2-14] 입사일이 2001년 1월 1일 이전인 사원의 정보(=사원,이름,입사일,...)

SELECT *
FROM employees;
WHERE hire_date <'01-JAN-04'; -- 오류남 ORA-01858에러:숫자가 있어야 하는 위치에 문자가 발견됨

-- 오늘 날짜 출력하기

SELECT SYSDATE
FROM DUAL;

SELECT *
FROM employees
WHERE hire_date <'04/01/01';



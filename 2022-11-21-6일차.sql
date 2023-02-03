1.NUll
--각 부서의 위치 정보를 가진 location테이블을 사용한다
desc locations;
LOCATION_ID    NOT NULL NUMBER(4)    :위치코드
STREET_ADDRESS          VARCHAR2(40) :주소
POSTAL_CODE             VARCHAR2(12) :우편번호
CITY           NOT NULL VARCHAR2(30) :도시이름
STATE_PROVINCE          VARCHAR2(25) :주
COUNTRY_ID              CHAR(2)      :국가코드

--lacation테이블 데이터조회
select *
from locations; --comission_pct, postal_code, state_province에 null이 존재
 [예제 2-36]
SELECT location_id loc_id, street_address addr, state_province state
from locations
WHERE state_province IS NULL;

-- 사원 테이블employees 조회
--상여금 받지 않는 사람 조회
select *
from employees
WHERE commission_pct IS NULL;
-- 매니저가 없는 사람 조회
select *
from employees
WHERE MANAGER_ID IS NULL;

SELECT location_id, street_address, city, state_province 
from locations
WHERE state_province IS NOT NULL;

--2.4 데이터의 정렬
select *
FROM employees
WHERE department_id IS NOT NULL
order by employee_id DESC;

[예제 2-40] 80번 부서의 사원정보중 이름을 기준으로 오름차순으로 정렬
SELECT employee_id,last_name, department_id
FROM employees
WHERE department_id=80
ORDER BY last_name DESC;

[예제2-42]60번의부서의 사원정보에 대해 년 급여를 오름차순으로 정렬
SELECT employee_id,last_name, department_id, salary*12 annual_salary
FROM employees
WHERE department_id=60
ORDER BY annual_salary;


SELECT employee_id,last_name,department_id, salary*12 annual_salary
FROM employees
WHERE department_id=60
ORDER BY 5;

[예제2-43]사원 테이블에서 부서는 오름차순,월급여는 내림차순으로 정렬하여 사원 정보를 조회
SELECT employee_id,last_name,department_id,salary
FROM employees
ORDER BY department_id,salary DESC ;

--3장 기본함수
[예제 3-1]ABS
SELECT ROUND(123.45678, -2) R1,
       ROUND(12345.678, -2) R2
FROM dual;

[예제3-5]
SELECT TRUNC(123.456789)T1,
       TRUNC(123.456789)T1,
       TRUNC(123.456789)T1,

[연습문제 3-1]
사원 테이블에서 100번 부서와 110번 부서의 사원에 대해 사번,이름, 급여와 15%인상된 급여 조회
(15% 인상된 급여는 정수로 표현, 컬럼명은 Increased Salary로 표시)
SELECT employee_id ,first_name, salary, ROUND(salary*1.15) "Increased Salary"
FROM employees
WHERE department_id IN (100,110)
ORDER BY employee_id; 

[예제3-14]
--자신의 이메일 주소를 이용해서 @의 위치를 INSTR()으로 찾고,SUBSTR()로 조회
SELECT  'raki82@hanmail.net' Email_addr,
        SUBSTR('raki82@hanmail.net',1,INSTR('raki82@hanmail.net','@')-1)Email_id
        --SUBSTR('raki82@hanmail.net',1,INSTR('raki82@hanmail.net','@')+1)Email_domain
FROM dual;

날짜 함수
SELECT sysdate
FROM dual;


SELECT *
FROM v$nls_parameters;

ALTER SESSION SET nls_date_format = 'RR/MM/DD HH:MI:SS';

SELECT ADD_MONTHS(SYSDATE,1) MONTH1
FROM dual;

SELECT TRUNC( MONTHS_BETWEEN(SYSDATE,'2022-11-14')) PASSED,
       TRUNC(MONTHS_BETWEEN('2023-05-16',SYSDATE)) REMAINED
FROM dual;


SELECT NEXT_DAY(SYSDATE,'월요일') NEXT1, 
       NEXT_DAY(SYSDATE,'금요일') NEXT2,
       NEXT_DAY(SYSDATE,'일') NEXT3, 
       NEXT_DAY(SYSDATE,4) NEXT4 
FROM dual;

SELECT *
FROM v$nls_parameters;

SELECT ROUND(TO_DATE('2013-06-30'),'yyyy') R1,
       ROUND(TO_DATE('2013-07-01'),'YEAR') R2,
       ROUND(TO_DATE('2013-12-15'),'MONTH') R3,
       ROUND(TO_DATE('2013-12-16'),'MM') R4,
       ROUND(TO_DATE('2013-05-27 11:59:59','YYYY-MM-DD HH24:MI:SS'),'DD') R5,
       ROUND(TO_DATE('2013-05-27 12:00:00','YYYY-MM-DD HH24:MI:SS'),'DD') R6,
       ROUND(TO_DATE('2013-05-29'),'DAY') R7,
       ROUND(TO_DATE('2013-05-30'),'DAY') R8
FROM dual;

SELECT sysdate
FROM dual;
ALTER SESSION SET nls_date_format = 'RR/MM/DD HH:MI:SS';


[예제3-27]
SELECT  TO_CHAR(sysdate,'YYYY-MONTH-DD')DATE_FMT1,
        TO_CHAR(sysdate,'RR/MM/DD HH:MI:SS')DATE_FMT2,
        TO_CHAR(sysdate,'YY-MM-DD DAY')DATE_FMT3
FROM dual;

{예제3-28]
SELECT 1+'1' SUM
FROM dual;

SELECT TO_DATE('2013-05-27')DATE1
FROM dual;

SELECT employee_id EMP_ID, first_name||' ' ||last_name name, TO_CHAR (salary,'$99,999,999')
FROM employees;

[예제3-31]
SELECT  employee_id emp_id,last_name name,salary, commission_pct*salary bonus,commission_pct
FROM    employees
WHERE   commission_pct*salary < 1000;
ORDER BY  salary;


******테이블 만드는 방법 ******
create table contact(
    id NUMBER PRIMARY KEY,
    name VARCHAR2(30)NOT NULL,
    home_num CHAR(11),
    phone_num CHAR(11),
    Office_num CHAR(11)
)
 INSERT INTO CINTACT
 VALUES (1, '홍길동', '0623456789', null, null);
 INSERT INTO CONTACT
 VALUES (2, '이순신', NULL, '01026419964', null);
 INSERT INTO CONTACT
 VALUES (3, '홍두깨', 'NULL', NULL,'0612619967');
 INSERT INTO CONTACT
 VALUES (4, '하니', '0628979887', NULL,'0612619967');

commit;--메모리에만 있는거지 정확히 저장하려면 commit;을 누르면 오라클이 알아서 저장함
drop table contact;--테이블과 데이터를 삭제 명령

SELECT *
FROM contact;


commit;--메모리에만 있는거지 정확히 저장하려면 commit;을 누르면 오라클이 알아서 저장함
drop table contact;--테이블과 데이터를 삭제 명령

[연습문제 3-4]
사원의 사번,이름,부서, 매니저번호를 조회
매니저가 있는 사원은 manager, 매니저가 없는 사원은 no manager로 표시

select *
from     employees;

SELECT employee_id, first_name||' '||last_name name, department_id, NVL2(manager_ID,'manager','No manager')manager
from     employees;

[예제3-36]
SELECT  employee_id 사번, first_name||' '||last_name 성명, department_id 부서,to_char(salary,'$9,999,999') 급여,
        DECODE(department_id, 20, salary*0.2,
                              30, salary*0.3,
                              40, salary*0.4,
                              0) 보너스
from     employees 
order by department_id;

[예제 3-37]
SELECT  employee_id 사번, first_name||' '||last_name 성명, department_id 부서,to_char(salary,'$9,999,999') 급여,
        case department_id when 20 then salary*0.2
                           when 30then salary*0.3
                           when 40 then salary*0.4
                           else 0
         end bonus                           
from     employees 
order by department_id;














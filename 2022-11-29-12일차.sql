--6장. 서브쿼리 (Sub Query)
[예제 6-11]
평균 급여보다 더 적은 급여를 받는 사원의 사번, 이름, 성 정보를 조회

--일반 쿼리를 이용해서 조회해보자
SELECT ROUND(AVG(salary)) avg_sal  --평균 급여를 알아보는 함수 AVG사용,ROUND는 반올림 하는 함수, i를 생략해서 바로 반올림
FROM employees;--평균급여 6462

SELECT employee_id, first_name, last_name
FROM employees
WHERE salary < 6462
ORDER BY  1;

--서브쿼리를 이용해서 해보자
SELECT employee_id, first_name, last_name
FROM employees
WHERE salary < (SELECT ROUND(AVG(salary)) 
                FROM employees);

[예제 6-2]
월급여가 가장 많은 사원의 사번, 이름, 성 정보 조회
--일반 쿼리를 이용해서 조회
SELECT MAX(salary) -- 가장 많은 급여를 조회해야 되서 MAX 함수 사용
FROM employees;--24000

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary = 24000;--king 1명 나옴

--서브쿼리를 이용해서 조회
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary = (SELECT MAX(salary)
                FROM employees);--KING 1명 나옴

--서브쿼리를 이용해서 가장 적은 월급여를 받는 사람 조회
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary = (SELECT MIN(salary)
                FROM employees);--Olsen 1명 나옴

--일반쿼리를 이용해서 가장 적은 월급여를 받는 직원 조회
SELECT MIN(salary)  --가장 적은 급여를 알아야되니 MIN함수 사용해서 조회
FROM employees;--2100

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary = 2100;--Olsen 1명 나옴

[예제 6-3]
108번 사원의 급여보다 더 많은 급여를 받는 사원의 사번, 이름, 급여를 조회
SELECT salary
FROM employees
WHERE employee_id=108;  --12008

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > 12008;--6명 나옴

--서브쿼리를 이용해서 조회
SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE salary > (SELECT salary 
                FROM employees 
                WHERE employee_id=108);--6명

[예제 6-4]
월급여가 가장 많은 사원의 사번, 이름, 성, 업무제목을 조회
--월급여 최고 금액
SELECT MAX(salary) -- 가장 많은 급여를 조회해야 되서 MAX 함수 사용
FROM employees;--24000
--사번의 업무 제목을 조회-->JOIN연산자 사용
SELECT e.employee_id, e.first_name, e.salary,
        j.job_title
FROM   employees e,jobs j
WHERE  e.job_id = j. job_id  --join연산 조건절
AND e.salary = 24000; --일반 조건절, steven 1명 나옴

--위의 내용을 서브쿼리를 이용해서 조회해보자
SELECT e.employee_id,e.last_name, e.salary,
        j.job_title
FROM   employees e,jobs j
WHERE  e.job_id = j. job_id  --join연산 조건절
AND     e.salary = (SELECT MAX(salary)
                   FROM employees);--steven 1명 나옴
                   
                   
                   
       --(단일 컬럼) 다중 행 서브쿼리(p.53)
 [예제 6-5]
 근무지가 영국인 부서코드,위치코드,부서명 정보를 조회
 
 --서브쿼리를 이용해서 조회
SELECT department_id, location_id, department_name
FROM departments                  
WHERE  location_id IN( SELECT LOCATION_ID
                        FROM locations                    
                        WHERE country_id = 'UK');                 
                   
SELECT department_id, location_id, department_name
FROM departments                  
WHERE  location_id = any( SELECT LOCATION_ID
                        FROM locations                    
                        WHERE country_id = 'UK'); --2                    
SELECT location_id
FROM locations                    
WHERE country_id = 'UK';--2400,2500,2600

SELECT department_id, location_id, department_name
FROM departments                    
WHERE location_id IN (2400,2500,2600);  --2              

SELECT department_id, location_id, department_name
FROM departments                    
WHERE location_id = any  (2400,2500,2600); --2                
                      
[예제 6-6]
70번 부서원의 급여보다 높은 급여를 받는 사원의 사번, 이름, 부서번호, 급여를 급여순으로 조회
--일반쿼리로 작성
select salary
from employees
where department_id = 70;--10000

select employee_id, last_name, department_id, salary
from employees
where salary>10000;--15

select employee_id, last_name, department_id, salary
from employees
where salary > (select salary
            from employees
            where department_id = 70);--15
            
 select salary
from employees
where department_id = 80
order by 1;--6100~14000까지 나옴

select employee_id, last_name, department_id, salary
from employees
where salary > any (select salary
                    from employees
                    where department_id = 80);--54개 ,6100보다 높은 가격이 나옴,그래서 >min이랑 같은 값
           


 [예제 6-8]
 10번 부서원의 급여보다 적은 급여를  받는 사원의 사번, 이름, 부서번호, 급여 조회
 
 --일반쿼리를 이용해서 해보자
SELECT SALARY
FROM EMPLOYEES               
WHERE DEPARTMENT_ID = 10; -- 4400

SELECT employee_id, first_name,department_id, salary
FROM employees
WHERE SALARY < 4400 --46명
ORDER BY SALARY;--2100~4200

--서브쿼리를 이용해서 조회
SELECT employee_id, first_name,department_id, salary
FROM employees
WHERE SALARY < ANY (SELECT SALARY
                FROM EMPLOYEES               
                    WHERE DEPARTMENT_ID = 10); --46명
                    
                    
 [예제 6-9]
SELECT employee_id, first_name,department_id, salary
FROM employees
WHERE SALARY < (SELECT MIN( SALARY)
                FROM EMPLOYEES               
                WHERE DEPARTMENT_ID = 10) 
ORDER BY salary; --46명  


 [예제 6-10]                   
SELECT SALARY
FROM EMPLOYEES               
WHERE DEPARTMENT_ID = 100; -- 6개 나옴

SELECT employee_id, first_name,department_id, salary
FROM employees
WHERE SALARY > ALL(SELECT SALARY
                FROM EMPLOYEES               
                WHERE DEPARTMENT_ID = 100)
ORDER BY SALARY;     --13000~24000까지 해서 6명           


[예제6-11]
SELECT employee_id, first_name,department_id, salary
FROM employees
WHERE SALARY > (SELECT MAX( SALARY )
                FROM EMPLOYEES               
                WHERE DEPARTMENT_ID = 100)
ORDER BY SALARY;     --13000~24000까지 해서 6명    


[예제6-12]
SELECT SALARY
FROM EMPLOYEES               
WHERE DEPARTMENT_ID = 30;--2500~11000

SELECT employee_id, first_name,department_id, salary
FROM employees
WHERE SALARY < ALL(SELECT SALARY
                FROM EMPLOYEES               
                WHERE DEPARTMENT_ID = 30)
ORDER BY SALARY;     --2100~2400 해서 5명     


  [예제 6-13]

        
        
                   
   [예제 6-14]
SELECT SALARY
FROM EMPLOYEES               
WHERE DEPARTMENT_ID = 20;--6000~13000

SELECT employee_id, first_name,department_id, salary
FROM employees
WHERE SALARY = ANY (SELECT SALARY
                FROM EMPLOYEES               
                WHERE DEPARTMENT_ID = 20)
ORDER BY department_id,salary;     -- 3명          


 [예제 6-15]
         
         


  [예제 6-16]
부서테이블에서 부서코드가 10,20,30,40에 해당하지 않는 부서코드를 조회
SELECT department_id
FROM departments
WHERE department_id NOT IN (10,20,30,40);--50~270까지 23개 나옴 

 [예제 6-17]
 
 


 [예제 6-18]
 
 --일반쿼리 이용
SELECT  department_id, employee_id
FROM employees
WHERE manager_id IS NULL;--사번이 100이고 부서코드가 90번인 1명:사장님

SELECT department_id
FROM departments
WHERE manager_id = 100;--부서코드가 90

SELECT department_id, department_name
FROM departments
WHERE department_id=90;-- 최종 결과 : Executive라는 부서명을 알게 됨

--다중 컬럼 서브쿼리를 이용해서 조회(부서코드가 90번이고 Executive라는 부서명을 알기위해서)
SELECT department_id, department_name
FROM departments
WHERE (department_id, manager_id ) IN ( SELECT department_id, employee_id
                                        FROM employees
                                        WHERE manager_id IS NULL);--최종 결과 : 90번 Executive라는 부서명을 알게 됨
                                        
                                        




 [테이블 만들어서 실습문제]                                       
--부서별로 월별 지급된 급여 합계, 급여 평균, 급여 최고, 급여 최소..
--날짜 정보, 사원수 정보, 급여합계 정보, 급여평군 정보....


--1.월별 업무 마감시 사원들의 통게정보를 집계해서 저장할 테이블
CREATE TABLE month_salary (
    magam_date DATE NOT NULL,
    dept_id NUMBER,
    emp_cnt NUMBER,
    sum_sal NUMBER,
    avg_sal NUMBER(9,2)--급여평균/ 총 6자, 소숫점 이하 숫자가 2자라는 뜻이다
);

DESC month_salary;

INSERT INTO month_salary (magam_date, dept_id)
SELECT LAST_DAY(SYSDATE),department_id
FROM employees
GROUP BY department_id
ORDER BY 2; -- 12개의 부서를 가져다 삽입 성공

--데이터 확인
SELECT *
FROM month_salary;
--ROLLBACK;
 --다중컬럼 서브쿼리로 사원수, 급여합, 급여평균을 NULL인 값들을 갱신
-- UPDATE 테이블명
-- SET 컬럼명1=값1,
--     컬럼명2=값2,
--      ....  
--WHERE 조건절;--조건절 생략하명 모든 레코드가 업데이트 되므로 주의하자.


UPDATE month_salary m
SET EMP_CNT =(SELECT COUNT(*)
             FROM employees e
             WHERE e.department_id = m.dept_id
             GROUP BY e.department_id),
            
   SUM_SALARY = (SELECT SUM(salary)
             FROM employees e
             WHERE e.department_id = m.dept_id
             GROUP BY e.department_id),
   AVG_SALARY = (SELECT ROUND(AVG(salary))
             FROM employees e
             WHERE e.department_id = m.dept_id
             GROUP BY e.department_id);
--WHERE 조건절

--COMMIT;--저장하는 명령, COMMIT은 한번만 눌러야된다. 여러번 누르면 ROLLBACK해도 되돌아가지 않는다. 데이터 날리는 꼴~
-- ROLLBACK; --이건 업데이트한걸 되돌리는 명령어
SELECT *
FROM month_salary;


[예제 6-19] 매니저가 있는 부서코드에 소속된 사원들의 수를 조회한다
SELECT department_id
FROM employees
WHERE manager_id IS NOT NULL
ORDER BY 1;--부서코드가 10~110

SELECT COUNT(*)
FROM employees e
WHERE department_id in (SELECT department_id
                        FROM departments d
                        WHERE manager_id IS NOT NULL
                        AND e.department_id = d.department_id);
                        
[예제 6-20]in연산자를 exists 연산자로 바꿔서 사용 가능
SELECT COUNT(*)
FROM employees e
WHERE exists(SELECT department_id
                        FROM departments d
                        WHERE manager_id IS NOT NULL
                        AND e.department_id = d.department_id);
 [예제 6-22]
 사원의 이름, 급여, 부서, 부서명 조회
 SELECT e.first_name,e.salary,e.department_id,
        d.department_name
 FROM employees e, departments d
 WHERE e.department_id = d.department_id;
                        
                        
SELECT e.first_name,e.salary,e.department_id,
       (select  department_name
        from departments d
        where d.department_id = e.department_id)
 FROM employees e
 order by e.department_id;
                                            
[예제 6-23]
  SELECT first_name, salary, department_id,
        (   SELECT ROUND(AVG(salary))
            FROM    employees   ) avg_sal
FROM    employees
ORDER BY department_id;

--일반쿼리로 조회
select ROUND(AVG(salary))
FROM employees;--6462
 
SELECT employee_id, first_name, salary, department_id                      
FROM employees
WHERE salary >=6462;

[연습문제 6-3]
각 부서에 대해 부서코드, 부서명, 부서가 위치한 도시이름을 조회
단, 스칼라 서브쿼리 사용
--스칼라 서브쿼리 사용해서 조회
SELECT d.department_id, d.department_name,
       ( select city 
         FROM locations l
         where l. location_id = d.location_id)
 FROM departments d
 order by department_id;
   
-- 일반쿼리 : JOIN 연산 (오라클 조인)
SELECT  d.department_id, d.department_name,
        l.city
FROM    departments d, locations l
WHERE   d.location_id = l.location_id
ORDER BY 1;

-- 일반쿼리 : JOIN 연산 (ANSI 조인)
SELECT  d.department_id, d.department_name,
        l.city
FROM    departments d INNER JOIN locations l
ON   d.location_id = l.location_id
ORDER BY 1;

--(ANSI 조인 - 공통 컬럼)
SELECT  d.department_id, d.department_name,
        l.city
FROM    departments d INNER JOIN locations l
USING   (location_id)
ORDER BY 1;   


   --인라인 뷰--
DESC EMP_DETAILS_VIEW

SELECT *
FROM EMP_DETAILS_VIEW;
                        
[예제 6-24]
--일반쿼리를 이용해서 조회
SELECT round(avg(SALARY))
FROM employees; --6462

SELECT MAX(SALARY) "1월"
FROM employees; --24000

SELECT employee_id, first_name, salary
from employees 
WHERE salary >=6462
and salary <=24000;

--인라인 뷰 이용해서 조회
SELECT employee_id, first_name, salary, avg_sal, max_sal
from employees,                       
     (SELECT round(avg(SALARY)) avg_sal,
      MAX(SALARY) max_sal
      FROM employees)
WHERE salary BETWEEN avg_sal AND max_sal;
                   
                        
SELECT employee_id, first_name, salary, round(avg(SALARY)), MAX(SALARY)
from employees; --오류가 뜬다
    
 [예제6-25]
 사원테이블에서 월별 입사현황 조회
 
  [예제 6-27]                      
사번, 이름을 10건 조회
SELECT employee_id, last_name
FROM employees
ORDER BY 1;

-ROWNUM 사용해서 10건 조회
SELECT ROWNUM, employee_id, last_name
FROM employees
WHERE ROWNUM <= 10;                       
                        
 [예제 6-28]
 급여가 높은 상위 10명의 사원의 사번, 이름, 급여 정보 조회
SELECT ROWNUM, employee_id, last_name, salary
FROM employees
WHERE ROWNUM <= 10
order by salary DESC;--값이 안맞다

SELECT * 
FROM (SELECT employee_id, last_name, salary
        FROM employees
        ORDER BY salary DESC)
WHERE ROWNUM <=10;

SELECT employee_id, last_name, salary,
       RANK() OVER (ORDER BY salary DESC) sal_rank
FROM employees
where rownum<=10;--값이 안맞다.


랭크 함수 예제                                                
SELECT  employee_id, last_name, salary,
       RANK() OVER (ORDER BY salary DESC)sal_rank1,--표현형식1,2,3,3,5,,,
       DENSE_RANK()OVER (ORDER BY salary DESC) sal_rank2,--표현형식 1,2,3,3,4....
        ROW_NUMBER()OVER (ORDER BY salary DESC) sal_NUM1--표현형식 1,2,3,4,
FROM employees;
                        
 [연습문제 6-4]
1. 급여가 적은 상위 5명 사원의 순위, 사번, 이름, 급여를 조회
 단, 인라인뷰 서브쿼리를 사용해서 작성
 
 --ROWNUM 함수 이용
 SELECT * 
FROM (SELECT employee_id, last_name, salary
        FROM employees
        ORDER BY salary  )
WHERE ROWNUM <=5;--2100~2400

--랭크 함수 이용
SELECT * 
from      (select RANK() OVER (ORDER BY salary )sal_rank,
          employee_id, last_name, salary       
            FROM employees)  
WHERE    ROWNUM <=5;         

[연습문제 6-4] 
2.부서별로 가장 급여를 많이 받는 사원의 사번, 이름, 부서번호, 급여,업무코드를 조회
단,인라인뷰 서브쿼리를 사용
SELECT e.employee_id, e.last_name, e.department_id, e.salary, e.job_id
FROM employees e,( select department_id, MAX(salary) max_sal
                FROM employees
                GROUP BY department_id) k
WHERE NVL(e.department_id,0) = NVL(K.department_id,0)--NULL 데이터는 무조건 처리
AND e.salary = k.max_sal
ORDER BY 1;--12개 나옴 
                

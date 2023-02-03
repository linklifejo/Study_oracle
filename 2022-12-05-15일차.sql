[예제 8-1]
--일단 테이블을 완성
create table emp(
            emp_id number primary key,
            fname varchar2(30),
            lname varchar2(20),
            hire_date date default sysdate,
            job_id varchar2(20),
            salary number(9,2),
            comm_pct number(3,2),
            dept_id number(3)
 ); 
 --값을 넣어보자.
insert into emp (emp_id,fname, lname, hire_date)
values(300, 'Steven', 'jobs', sysdate);

select*
from emp;


insert into emp (emp_id, fname, lname, hire_date)
values(301, 'Bill', 'Gates', to_date('2013-05-26' ,'yyyy-mm-dd'));

commit;--수동으로 메모리에 있는것을 물리적으로 저장
rollback;--수동으로 그 전으로 돌리는것

insert into emp(emp_id, fname, lname, hire_date, job_id, salary)
values(302,'Warren','Buffett', sysdate,'','');


insert into emp(emp_id, fname, lname, hire_date, job_id, dept_id)
select employee_id, first_name,last_name,hire_date,job_id,department_id
from employees
where department_id in (10,20);

select*
from emp;

commit;--저장완료

[예제 8-6]
월별 급여 관리 테이블에 부서코드 행 데이터를 삽입 저장
select*
from month_salary;--12개
--기존의 데이터를 버리려면
truncate table month_salary;-- 이 명령 사용하면 된다.

insert into month_salary(magam_date,dept_id)
select sysdate, department_id
from employees
where department_id is not null
group by department_id;

select*
from month_salary;

[예제 8-7]
insert into emp
      (select employee_id, first_name,last_name,hire_date,job_id,salary, commission_pct,department_id
       from employees
       where department_id between 30 and 60);

select*
from emp;

[예제 8-8]
update emp
set dept_id=20
where emp_id>=300;

select*
from emp
where dept_id = 20;

[예제 8-9]
사번이 300번인 사원의 급여, 커미션 백분율, 업무코드를 아래와 같이 변경해라
update emp
set salary =2000, comm_pct = 0.1, job_id = 'IT_PROG'
where emp_id=300;

select*
from emp
where emp_id=300;

[예제 8-10]
update emp
set salary=5000,comm_pct = 0.4;

[예제 8-11]
서브쿼리를 이용해서 emp 테이블의 사번 103번 사원의 급여를 employees 테이블 20번 부서의 최대 급여로 변경
--일반쿼리를 이용해서 해보자
select max(salary)
from employees
where department_id = 20;-13000

update emp
set salary = 13000
where emp_id =103;

select*
from emp
where emp_id=103;

--서브쿼리를 이용해서 해보자
update emp
set salary = (select max(salary)
                from employees
                where department_id = 20)--13000
where emp_id =103;     

[예제8-12]
emp 테이블 사번 180번 사원과 같은 해에 입사한 사원들의 급여를 employees 테이블 50번 부서의 평균 급여를 변경
select*
from emp
where emp_id = 180;

--일반쿼리로 해보자
select to_char(hire_date,'yyyy')
from employees
where employee_id =180;--2006년도

select round(avg(salary))
from employees
where department_id = 50;--평균급여가 3476

update emp
set salary = 3476
where to_char(hire_date,'yyyy')  = '2006';

select*
from emp
where to_char(hire_date,'yyyy')  = '2006';

--서브쿼리로 해보자
update emp
set salary=(select round(avg(salary))
            from employees
            where department_id=50)
where to_char(hire_date,'yyyy')= (select to_char(hire_date,'yyyy')
                                    from employees
                                    where employee_id =180);
                                    
    
 [예제 8-15]emp 테이블에서 60번 부서의 사원정보를 삭제한다
select*
from emp
where dept_id = 60;--5명 나옴

delete from emp
where dept_id =60;

 select*
from emp
where dept_id = 60;--안나옴

[연습문제 8-16]
1.emp 테이블에서 다음과 같은 데이터 행을 저장한다
insert into emp(emp_id,fname,lname,hire_date,salary)
values (400,'johns','hopkins',to_date('2008/10/15','yyyy/mm/dd'),5000);
insert into emp(emp_id,fname,lname,hire_date,salary)
values (401,'abraham','lincoln',to_date( '2010/03/03','yyyy/mm/dd'),12500);
insert into emp(emp_id,fname,lname,hire_date,salary)
values (402,'tomas','edison',to_date('2013/06/21','yyyy/mm/dd'),6300);

 select*
from emp;

2.
UPDATE emp
SET dept_id = 90,
    job_id='SA_MAN' -- 각 컬럼은 ,로 구분하고 변경하려는 값은 =로 표시
WHERE   emp_id=401; -- 1rows updated

3.emp 테이블의 급여가 8000미만인 모든 사원의 부서코드는 80으로 변경하고
급여는 employees 테이블의 80번 부서의 평균급여를 가져와 변경한다
평균 급여는 반올림된 정수를 사용


update emp--emp 테이블에서
set dept_id = 80,--부서코드는 80번으로 변경
    salary = (select round(avg(salary))
                from employees
               where department_id = 80)--급여는 employees 테이블에서 부서코드가 80번인 사원들의 평균 급여로 바꿔라   
where salary < 8000;--급여가 8000미만인 사원의

4. emp테이블의 2010년 이전 입사한 사원의 정보를 삭제한다
select *
from emp
where to_char(hire_date,'yyyy') < '2010';--3명 나옴

delete from emp
where to_char(hire_date,'yyyy') < '2010';--지우고 나면 안나옴

rollback;

[실습 테이블 생성하기]
[예제 9-1]
create table tmp( id number(3),fname varchar(20)
 );
 
 [예제 9-2]
 insert into tmp(id, fname)
 values (1,'홍길동');
 
 insert into tmp
 values (2,'홍길동');
 
 update tmp
 set fname = '홍명보'
 where id=1;
 
 commit;
 select*
 from tmp;
 
 delete tmp
 where id = 1;
 
 rollback;
 
 
 [예제 9-4]
create table dept as
select *
from departments;

desc dept;

[예제 9-5]
사원테이블의 사번, 이름,입사일 컬럼의 데이터를 복사하여 emp20 테이블을 생성한다
create table emp20 as
select employee_id emp_id, first_name, hire_date 
from employees;

[예제 9-6]
create table dept2 as
select *
from departments
where 1=2;--where 절에 거짓 조건을 만들어 복사되는 데이터가 없도록 한것

desc dept2;

[예제 9-7]
desc emp20;--추가전 컬럼 수 확인 후

alter table emp20
add(salary number(10,2), job_id varchar2(5));--실수형 데이터타입 number(전체길이,소수점 자릿수)

desc emp20;--추가 후 컬럼수가 늘었는지 확인해야 바꼈는지 알수 있다
 select *
 from emp20;
 
[예제9-8]
alter table emp20
modify (salary number(8,2), job_id varchar2(10));

[예제 9-9]
desc emp20;--삭제 전 모습 확인
alter table emp20
drop column job_id;
desc emp20;--삭제 후  바꼈는지 알수 있다. 컬럼과 데이터도 다 삭제된다.

rollback;--create, alter,drop,truncate에서는 자동 커밋이 되기때문에 롤백이 안된다.







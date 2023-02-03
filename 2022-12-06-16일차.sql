--10장 제약조건
select owner,constraint_name,constraint_type, table_name
from user_constraints
where owner = 'HR';

[예제 10-1]
테이블 생성 시 제약조건 정의 - NOT NULL
null_test 
create table null_test(
col1 varchar2(5) not null,
col2 varchar(5)
);
[예제 10-2]
insert into null_test (col1)
values ('AA');

[예제 10-3]
insert into null_test(col2)
values ('BB');
select*
from null_test;

[예제 10-6]
create table check_test (
name varchar2(10) not null,
gender varchar2(10) not null check (gender in ('남성','여성')),--컬럼 옆에 제약조건이 쓰인거라 컬럼레벨에서 정의한것
salary number(8),
dept_id number(4),
constraint check_salary_ck check (salary > 2000)--컬럼이 다 쓰여진 뒤 마지막에 쓰인거라 테이블레벨에서 정의한것
);

[예제 10-8]
insert into check_test values('심청','여자',3000,20);

update check_test 
set salary = 2000
where name = '홍길동';

select*
from check_test ;

[예제 10-10]
alter table check_test--table명
drop constraint check_salary_ck;--제약조건 삭제하는 명령문,check_salary_ck이건 제약조건의 이름이다

[예제 10-11]
alter table check_test
add constraint check_salary_dept_ck
check (salary between 2000 and 1000 and dept_id in (10,20,30));

select constraint_name, constraint_type
from user_constraints
where table_name = 'CHECK_TEST';--제약조건이 잘 추가됐는지 확인하는 명령문. 인출된 행 중 마지막을 보면 된다

[예제 10-13]
create table unique_test(
col1 varchar2(5) unique not null,
col2 varchar2(5),--null 허용
col3 varchar2(5)  not null,--null 혀용하지 않는다
col4 varchar2(5)  not null,
constraint uni_col2_uk unique (col2),
constraint uni_col34_uk unique (col3,col4)
);
[예제 10-14]
insert into unique_test
values('A1','B1','C1','D1');

insert into unique_test
values('A2','B2','C2','D2');
insert into unique_test
values('A3','B3','C3','D3');
insert into unique_test
values('A4','B4','C4','D4');
insert into unique_test
values('A5','B5','C5','D5');

insert into unique_test
values('A6','B5','C6','D6');--중복되어 있는 값이 있어서 unique 제약조건에 위배되서 오류 발생

alter table unique_test--table명
drop constraint uni_col2_uk;--unique 제약조건을 삭제



insert into unique_test
values('A6','B5','C6','D6');--unique 제약조건을 삭제 후 다시 값을 입력해보니 잘 들어간다.

alter table unique_test
add constraint uni_col34_uk unique (col3,col4);--테이블 생성 후 unique 제약조건을 추가하는 방법

select*
from unique_test;

[예제 10-21]
create table dept_test (
dept_id number(4),
dept_name varchar2(30) not null,
constraint dept_test_id_pk primary key (dept_id)
);

insert into dept_test
values (10,'영업부');
insert into dept_test
values (20,'개발부');
insert into dept_test
values (30,'개발부');

[예제 10-23]
alter table dept_test
drop constraint dept_test_id_pk;

[예제 10-24]
insert into dept_test
values (20,'영업부');

--alter table dept_test
--add constraint dept_test_id_pk primary key (dept_id); 

select *
from dept_test;

[예제 10-26]
create table emp_test(
emp_id number(4) primary key,
ename varchar2(30) not null,
dept_id number(4),
job_id varchar2(10),
constraint emp_test_dept_fk foreign key(dept_id)
references departments (department_id)--dept_id는 department_id의 값을 참조해서 쓴다는 뜻임
);--departments 테이블의 department_id 값: 10~270

select constraint_name, constraint_type
from user_constraints
where table_name = 'EMP_TEST';--제약 조건 확인하는 명령

[예제 10-27]
insert into emp_test
values (100,'king',10,'ST_MAN');

insert into emp_test
values (101,'kong',300,'AC_MGR');

COMMIT;




select employee_id, first_name, last_name, hire_date, job_id, department_id
from employees
where department_id in (10,20);

select* 
from month_salary;


insert into month_salary (dept_id)
select department_id
from employees
where department_id is not null
group by department_id;

insert into emp
select employee_id, first_name, last_name, hire_date, job_id,salary,commission_pct,department_id
from employees
where department_id between 30 and 60;

select* 
from emp;



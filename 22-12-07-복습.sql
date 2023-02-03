 select department_id, salary
 from employees;

select max (salary)
from employees;


평균급여보다 더 적은 급여를 받는 사원의 사번, 이름, 성정보 조회
 select employee_id, first_name, last_name
 from employees
 where salary < (select round(avg(salary))
                from employees);--56개
                
월 급여가 가장 많은 사원의 사번, 이름, 성정보를 조회
select employee_id, first_name, last_name
 from employees
 where salary >= (select max (salary)
                from employees);--1명
                
 select employee_id, first_name, last_name
 from employees
 where salary = (select max_salary
                from jobs);안나옴
select max_salary
from jobs;--여러개의 행이 있어서 안됨
                
select department_id, location_id, department_name
from departments
where location_id in (select location_id
                        from locations
                        where country_id = 'UK');

select location_id
from locations
where country_id = 'UK';

select *
from locations ;   

70번 부서원의 급여보다 높은 급여를 받는 사원의 사번, 이름,부서번호,급여를 급여 순으로 정렬

select employee_id, last_name,department_id, salary
from employees
where salary > any (select salary
                    from employees
                    where department_id =70)
order by salary;--15명

 select salary
 from employees
where department_id =70;  --10000                 
                    
select employee_id, last_name,department_id, salary
from employees
where salary > 10000;      --15명 나옴              
                    
  select min(salary)
 from employees
where department_id =70;  --10000                      
                    
  select max(salary)
 from employees
where department_id =70;  --10000                      
  
  10번 부서원의 급여보다 적은 급여를 받는 사원의 사번, 이름 , 부서번호, 급여를 조회
select employee_id, last_name,department_id, salary
from employees
where salary < any (select salary
                    from employees
                    where department_id =70) 
order by salary;       

select employee_id, last_name,department_id, salary
from employees
where salary < 10000;--88개 나옴

select employee_id, last_name,department_id, salary
from employees
where salary < any (select salary
                    from employees
                    where department_id =10) --46개
order by salary;

 select salary
 from employees
where department_id =10;  --4400

select employee_id, last_name,department_id, salary
from employees
where salary < 4400; -46개

select employee_id, last_name,department_id, salary
from employees
where salary <  (select max(salary)
                    from employees
                    where department_id =10) --46개
                    
                    
100번 부서원 모두의 급여보다
select employee_id, last_name,department_id, salary
from employees
where salary < any (select salary
                    from employees
                    where department_id =100) --46개
                    
select salary
 from employees
 where department_id =100; --6900~12008
 
select employee_id, last_name,department_id, salary
from employees
where salary > all (select salary
                    from employees
                    where department_id =100); --6
                    
                    
select employee_id, last_name,department_id, salary
from employees
where salary > any (select salary
                    from employees
                    where department_id =100);  --100번 부서원중 가장 적은 급여가 6900이니 그 수보다 큰게 나옴                   
                    
select employee_id, last_name,department_id, salary
from employees
where salary < any (select salary
                    from employees
                    where department_id =100); --100중 가장 큰 급여가 12008이니 그 수보다 작은게 나옴     
                    
select max(salary)
                    from employees
                    where department_id =100;--12008   
30번 부서원 모두의 급여보다 적은 급여를 받는 사원 정보

select salary
from employees
where department_id =30;--2500~11000

select employee_id, last_name,department_id, salary
from employees
where salary < 2500; --5명 나옴

select employee_id, last_name,department_id, salary
from employees
where salary > 11000; --10명 나옴

20번 부서원의 급여와 같은 급여를 받는 사원의 정보 조회
select salary
from employees
where department_id =20;--6000,13000 나옴

select employee_id, last_name,department_id, salary
from employees
where salary = any (select salary
                    from employees
                    where department_id =20);--3명 나옴 

select employee_id, last_name,department_id, salary
from employees
where salary in (6000,13000); --3 명 나옴

select department_id, location_id, department_name
from departments
where location_id = any (select location_id
                        from locations
                        where country_id = 'UK');

select employee_id, last_name,department_id, salary
from employees
where salary not in (select salary
                    from employees
                    where department_id =20);--104명 나옴 
select employee_id, last_name,department_id, salary
from employees
where salary <>All (select salary
                    from employees
                    where department_id =20);--104명 나옴 
부서테이블에서 부서코드가 10,20,30,40에 해당하지 않는 부서코드 조회
select department_id
from departments
where department_id not in (10,20,30,40);--23개

select department_id
from departments
where department_id <>all (10,20,30,40);--23개

select department_id
from departments
where department_id  in (10,20,30,40);--4개

select department_id
from departments
where department_id =any (10,20,30,40);--4개

select department_id
from departments
where department_id >any 10;--26개--10~40 중 최소값으로 해야 된다

select department_id
from departments
where department_id <any 40;--23개
                    
 매니저가 없는 사원이 매니저로 있는 부서코드, 부서명 조회
 select department_id, department_name
 from departments
 where (department_id,manager_id) in (select department_id, employee_id
                                        from employees
                                        where manager_id is null);
                    
 부서위치 코드가 1700에 해당하는 모든 사원의 사번, 이름,부서코드,업무코드를 조회
 select employee_id, last_name, department_id, job_id
 from employees
 where  department_id in (select department_id
                        from departments
                        where location_id = 1700);--18건 나옴
                        
select employee_id, last_name, department_id, job_id
 from employees
 where  department_name in (select department_name
                        from departments
                        where location_id = 1700);--18건 나옴                        
                        
                        
                        
                    
select department_id
from departments
where location_id = 1700;--10~270까지 21개 나옴                    
                    
 부서별로 가장 급여를 많이 받는 사원의 사번, 이름, 부서번호, 급여, 업무코드를 조회
select employee_id, last_name, department_id,salary, job_id 
from employees
where(department_id,salary) in (SELECT department_id, MAX(salary)
                                FROM    employees);

SELECT employee_id, first_name, department_id, salary, job_id
FROM   employees
WHERE   (department_id, salary) IN ( SELECT department_id, MAX(salary)
                                     FROM    employees
                                     GROUP BY department_id ); -- 11 rows                                

SELECT department_id, MAX(salary)
FROM    employees
WHERE   department_id IS NOT NULL
GROUP BY department_id;  --11개 나옴

SELECT department_id, MAX(salary)
                                FROM    employees;
                  
SELECT department_id, MAX(salary)
FROM    employees
WHERE   department_id IS NOT NULL
order by department_id;
                    
매니저가 있는 부서코드에 소속된 사원들의 수르르 조회
select count(*)
from employees e
where department_id in (select department_id
                        from departments d
                        where manager_id is not null
                        and e.department_id = d.department_id);
                    
select department_id
from departments 
where manager_id is not null
and department_id = department_id;--10~110                    
                    
select count(*)
from employees 
where exists (10,20,30,40,50,60,70,80,90,100,110);                    
                    
 select count(*)
from employees e
where exists (select department_id
             from departments d
             where manager_id is not null
             and e.department_id = d.department_id);
                                       
  select count(*)
from employees e
where exists (select 1
             from departments d
             where manager_id is not null
             and e.department_id = d.department_id);         
             
select e.first_name, e.salary,e. department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

select e.first_name, e.salary,e. department_id, 
        (select department_name
        from departments d
         where e.department_id =d.department_id)department_name
from employees e ;

사원의 사번 이름 부서코드 부서평균급여 정보 조회
select employee_id, last_name,salary, department_id ,
    (select round(avg(salary)
    from employees s
    where s.department_id = e.department_id
    group by department_id) avg_sal
 from employees e;  
 
 
 
 select round(avg(salary))
 from employees;--6462
select employee_id, last_name,salary, department_id 
from employees
where salary>=6462;

급여가 회사 평균 급여 이상이고 최대급여 이하인 사원의 사번, 이름, 급여, 회사평균급여, 회사 최대 급여 조회
select employee_id, last_name,salary
from employees,
     (select round(avg(salary)) avg_sal,max(salary)max_sal
     from employees)
where salary between avg_sal and max_sal;     


select employee_id, last_name,salary
from employees
order by salary desc
where rownum <=10;
     
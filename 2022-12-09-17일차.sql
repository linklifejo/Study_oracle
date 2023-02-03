select *
from user_objects;

[예제11-1]
create or replace view v_emp80 as
select employee_id emp_id, first_name, last_name,email,hire_date
from hr.employees--여기는 한울이니깐 hr거 가져다 쓴다는 뜻임
where department_id =80--데이터가 조회는 되는데 값은 안나옴. 권한이 없단다....그래서 hr로 계정 바꿔서 함
with read only;--뷰의 수정 불가, 읽기만 가능
--뷰에 가서 확인하면 된다


--grant : 권한을 주는 명령어
grant 권한1,권한2... to 대상계정;
--revoke : 줬던 권한을 뺏는 명령어

select *
from w_emp80 ; --테이블과 조회 하는 방법 같음

insert into  v_emp80
values(400,'mihwa','kang','raki@hanmail.net',sysdate);

--뷰 삭제, 테이블 삭제와 같다
drop view v_emp80;
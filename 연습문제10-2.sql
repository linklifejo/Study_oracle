1. characters 테이블의 email 정보가 없는 배역들의 정보를 조회해라

select *
from characters
where email is null;--6개 나옴

2. characters 에서 역할이 시스에 해당하는 등장인물을 조회하는 쿼리문을 작성

select *
from roles;--시스 역할은 roles 테이블에 있다

select character_name
from characters
where role_id = 1002;--4개 roles테이블을 보니 role_id가 1002다

select character_name
from characters
where email like '%sith%';--4개email중 sith가 들어가는 것 중

select character_name
from characters
where  role_id = (select role_id
                    from roles
                    where role_name = '시스');--4개 role|_name이 시스 인 role_id를 가져와서  
select *
from roles;

3.에피소드 4에 출연한 배우들의 실제 이름을 조회하는 쿼리문을 만들어라

insert into casting
values(4,1,'마크 해밀');
insert into casting
values(4,2,'해리슨 포드');
insert into casting
values(4,3,'캐리 피셔');

insert into casting
values(5,4,'앨릭 기니스');
insert into casting
values(5,5,'데이비드 프로스');
insert into casting
values(5,6,'제임스 얼 존스');

insert into casting
values(6,7,'앤서니 대니얼스');
insert into casting
values(6,8,'케니 베이커');
insert into casting
values(6,9,'피터 메이휴');

insert into casting
values(1,10,'빌리 디 윌리엄스');
insert into casting
values(1,11,'프랭크 오즈');
insert into casting
values(1,12,'이더 맥더미드');

insert into casting
values(2,13,'헤이든 크리스텐스');
insert into casting
values(2,14,'리암 존 니슨');
insert into casting
values(2,15,'나탈리 포트만');

insert into casting
values(3,16,'페르닐라 오거스트');
insert into casting
values(3,17,'아메드 베스트');
insert into casting
values(3,18,'레이 파크');

insert into casting
values(3,19,'테뮤라 모리슨');
insert into casting
values(3,20,'새뮤얼 잭슨');
insert into casting
values(3,21,'크리스토퍼 리');

select *
from casting;

select real_name
from casting
where episode_id = 4;--3명 나옴

4.에피소드 5에 출연한 배우들의  실제이름을 조회
SELECT*
from casting;--여기서 확인해보고 작성
--오라클 조인
select ch.character_name, ca.real_name
from characters ch, casting ca
where ch.character_id = ca.character_id--21행
and episode_id = 5;

-- ANSI JOIN 
SELECT  ch.character_name,
        ca.real_name
FROM    characters ch INNER JOIN casting ca        
ON   ch.character_id = ca.character_id;


SELECT  ch.character_name,
        ca.real_name
FROM    characters ch INNER JOIN casting ca        
USING   (character_id);

5.주어진 오라클 조인문을 안시조인으로 변경
-- ANSI JOIN : 여러개 테이블이 있다면, 2개 테이블의 JOIN 결과와 다시 INNER JOIN / OUTER JOIN 하는 방식
SELECT c.character_name, p.real_name, r.role_name
FROM    characters c INNER JOIN casting p
ON   c.character_id = p.character_id
LEFT OUTER JOIN roles r
ON   c.role_id = r.role_id
WHERE     p.episode_id = 2;


SELECT c.character_name, p.real_name, r.role_name
FROM    characters c INNER JOIN casting p
USING   (character_id)
LEFT OUTER JOIN roles r
USING    (role_id)
WHERE     p.episode_id = 2;





6. characters 테이블에서 배역이름,이메일, 이메일 아이디 조회
단 이메일 id@jedai.com일 경우 이메일 아이디는 id이다

select character_name,
        email,
        (substr(email,1,instr(email,'@')-1))email_id
from characters;--21개

7.역할이 제다이에 해당하는 배역들의 배역 이름, 그의 마스터 이름 조회
select ch.character_name,
        ca.character_name masters
from characters ch, characters ca
where ch.master_id = ca. character_id
and ch.role_id = 1001;

commit;


select *
from characters
where email like '%jedai%';

select *
from roles
where role_name = '제다이';--role_id 가 1001

select character_name,email
from characters
where role_id = 1001
order by character_name;

select c.character_name,nvl(d.character_name,'제다이 중의 제다이') masters
from characters c , characters d,roles r
where c.master_id = d.character_id(+)
and c.role_id = r.role_id
and r.role_id = 1001 -- 일반조건
order by character_name;

select c.character_name,nvl(d.character_name,'제다이 중의 제다이') masters
from characters c , characters d,roles r
where c.master_id = d.character_id(+)
and c.role_id = r.role_id
and r.role_name = '제다이' -- 일반조건
order by character_name;



8.
select c.character_name,c.email jedai_email, m.email master_email
from characters c , characters m,roles r
where c.master_id = m.character_id(+)
and c.role_id = r.role_id
and r.role_name = '제다이' -- 일반조건
order by c. character_name;

9.스타워즈 시리즈별로 출연한 배우의 수를 파악하고자 한다
에피소드 이름과 출연 배우 수를 개봉연도 순으로 조회

select *
from star_wars;

select *
from characters;

select *
from roles;

select *
from casting;

select s.episode_name , s.open_year
from star_wars s,casting c
where s.episode_id = c.episode_id
group by episode_name, s.open_year
order by 1;

select s.episode_name, count(s.episode_name)"배우의 수", s.open_year
from star_wars s,casting c
where s.episode_id = c.episode_id
group by episode_name, s.open_year
order by 1;


10.
select ch.character_name 배역이름, ca.real_name 실제이름, count(* )
from characters ch, casting ca
where ch.character_id = ca.character_id
group by ch.character_name , ca.real_name;

11. 10번을 참고하여 출연 횟수가 많은 상위 3명의 배역명, 실명, 출연 횟수를 조회
-- ROWNUM : 쿼리 실행 순서대로~ (상위, 하위) : 일종의 함수 ==> 의사 컬럼    vs  ROW_NUMBER()
-- RANK() OVER(ORDER BY 절), DENSE_RANK() OVER(ORER BY절)
-- 1,2,2,4,5,6...           vs   1,2,2,3,4,6...
-- 동순위 다음 순위 건너뜀     vs   동순위 다음 순위도 표시
-- 그룹함수의 조건 : HAVING에 표시

SELECT  ch.character_name 배역이름, ca.real_name 실제이름, count(*) 출연횟수
FROM    characters ch, casting ca
WHERE   ch.character_id = ca.character_id
GROUP BY ch.character_name, ca.real_name;

-- 11-1. 교재에서 사용한 방법 : ROWNUM + 인라인 뷰 서브쿼리
--
SELECT ROWNUM ranking, e.*
FROM    (   SELECT  ch.character_name 배역이름, ca.real_name 실제이름, count(*) 출연횟수
            FROM    characters ch, casting ca
            WHERE   ch.character_id = ca.character_id
            GROUP BY ch.character_name, ca.real_name
            ORDER BY 1 DESC ) e -- 인라인 뷰 : 실제로는 존재하지 않는 가상의 / 임시성 테이블 (메모리에서 처리)
WHERE   ROWNUM <= 3;

-- 11-2. RANK() 또는 DENSE_RANK() 사용한 방법
SELECT  *
FROM    (   SELECT  DENSE_RANK() OVER(ORDER BY COUNT(*)) ranking, ch.character_name 배역이름, ca.real_name 실제이름, count(*) 출연횟수
            FROM    characters ch, casting ca
            WHERE   ch.character_id = ca.character_id
            GROUP BY ch.character_name, ca.real_name    )
WHERE   ROWNUM <= 3;            




12. 시리즈별 몇명의 배우가(=실제 배우) 출연 했는지 조회
-- 에피소드 시리즈 번호, 에피소드 이름, 출연 배우의 수
-- 출연 배우의 수가 많은 순으로 조회

-- star_wars : 에피소드 정보
-- casting : 실제배우 정보

SELECT  s.episode_id, s.episode_name, count(*) actor_count
FROM    star_wars s, casting c
WHERE   s.episode_id = c.episode_id
GROUP BY s.episode_id, s.episode_name
--ORDER BY    actor_count DESC;
ORDER BY 3 DESC;




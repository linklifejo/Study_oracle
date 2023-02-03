다음의 테이블을 생성한다.
create TABLE CASTING(
episode_id number(5),
character_id number(5),
real_name varchar2(30)
);

select *
from characters;

4. 
INSERT INTO STAR_WARS
VALUES (4,'새로운 희망','1977');
INSERT INTO STAR_WARS
VALUES (5,'제국의 역습','1980');
INSERT INTO STAR_WARS
VALUES (6,'제다이의 귀환','1983');
INSERT INTO STAR_WARS
VALUES (1,'보이지 않는 위험','1999');
INSERT INTO STAR_WARS
VALUES (2,'클론의 습격','2002');
INSERT INTO STAR_WARS
VALUES (3,'시스의 복수','2005');

select *
from STAR_WARS;

5.
INSERT INTO CHARACTERS (character_id, character_name, email) 
VALUES (1,'루크 스카이워커','luke@jedai.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (2, '한 솔로', 'solo@alliance.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (3, '레이아 공주', 'leia@alliance.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (4, '오비완 케노비', 'Obi-Wan@jedai.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (5, '다쓰 베이더', 'vader@sith.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (6, '다쓰 베이더(목소리)', 'vader_voice@sith.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (7, 'C-3PO', 'c3po@alliance.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (8, 'R2-D2', 'r2d2@alliance.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (9, '츄바카', 'Chewbacca@alliance.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (10, '랜도 칼리시안', NULL);
INSERT INTO characters (character_id, character_name, email)
VALUES (11, '요다', 'yoda@jedai.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (12, '다쓰 시디어스', 'sidious@sith.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (13, '아나킨 스카이워커', 'Anakin@jedai.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (14, '콰이곤 진', '');
INSERT INTO characters (character_id, character_name, email)
VALUES (15, '아미달라 여왕', '');
INSERT INTO characters (character_id, character_name, email)
VALUES (16, '아나킨 어머니', '');
INSERT INTO characters (character_id, character_name, email)
VALUES (17, '자자빙크스(목소리)', '');
INSERT INTO characters (character_id, character_name, email)
VALUES (18, '다쓰 몰', 'maul@sith.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (19, '장고 펫', '');
INSERT INTO characters (character_id, character_name, email)
VALUES (20, '마스터 윈두', 'windu@jedai.com');
INSERT INTO characters (character_id, character_name, email)
VALUES (21, '두쿠 백작', 'dooku@jedai.com');



6.ROLES 테이블을 생성하여 다음과 같이 저장한다
CREATE TABLE ROLES (
ROLE_ID NUMBER(4),
ROLE_NAME VARCHAR2(20)
);

INSERT INTO ROLES
VALUES (1001,'제다이');
INSERT INTO ROLES
VALUES (1002,'시스');
INSERT INTO ROLES
VALUES (1003,'반란군');

7.
ALTER TABLE roles
add constraint roles_id_pk primary key (role_id);

alter table characters
add constraint roles_id_fk foreign key (role_id) references roles (role_id);

8.
update characters
set role_id = 1002
where email like '%sith%';--4개

update characters
set role_id = 1003
where email like '%alliance%';--5개

update characters
set role_id = 1001
where email like '%jedai%';--6개

update characters
set role_id = 1001
where character_name like '%콰이곤 진%';--1개

SELECT *
FROM    characters;


9.
update characters
set master_id = (select character_id 
                 from characters
                 where character_name = '오비완 케노비')--오비완 케노비의 character_id가 4번임
where character_name in ('아나킨 스카이워커', '오루크 스카이워커');

update characters
set master_id = (select character_id 
                 from characters
                 where character_name = '요다')-- 요다의 character_id가 11번임
where character_name in ('마스터 윈두', '두쿠 백작');

update characters
set master_id = (select character_id 
                 from characters
                 where character_name = '다쓰 시디어스')--다쓰 시디어스 character_id가 12번임
where character_name in ('다쓰베이더', '다쓰 몰');

update characters
set master_id = (select character_id 
                 from characters
                 where character_name = '콰이곤 진')--콰이곤 진 character_id가 14번임
where character_name ='오비완 케노비';

update characters
set master_id = (select character_id 
                 from characters
                 where character_name = '두쿠 백작')--두쿠 백작 character_id가 21번임
where character_name ='콰이곤 진';
SELECT *
FROM    characters;

10.


ALTER TABLE casting
ADD CONSTRAINT episode_id_fk FOREIGN KEY (episode_id) REFERENCES star_wars (episode_id);
--제약조건 추가       [이름]     [제약조건]    [해당컬럼]    참조 사항  [테이블] [컬럼]
ALTER TABLE casting
ADD CONSTRAINT character_id_fk FOREIGN KEY (character_id) REFERENCES characters (character_id); 

commit;
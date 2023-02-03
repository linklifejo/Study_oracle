--직접 만들어서 JOIN 연산을 해보자
--POST TABLE 작성
CREATE TABLE POST(
    post_id number primary key,
    post_title varchar2(30)not null,
    post_write number not null,
    post_date dates default sysdate
    );
    
create table writer(
    writer_id number primary key,
    writer_name varchar2(30),
    writer_date date default sysdate,
    writer_email varchar2(50)
    )
alter table post
add constraint post_writer_fk foreign key (POST_writer) references writer (writer_id);

insert into writer
values(1, '홍길동', sysdate, 'gildong@naver.com')
insert into writer
values(2, '김길동', sysdate, 'kimdong@naver.com')
insert into writer
values(3, '박길동', sysdate, 'parkdong@naver.com')
 
 select *
 from writer;
 
 insert into post
 values(0001, '오라클 학습하기', 1,sysdate)
insert into post
 values(0002, '개발자 학습하기', 1,sysdate)
 insert into post
 values(0003, 'dbms 학습하기', 1,sysdate)
 
 select post_id, 
        post_title,
        writer_id 
        post_date dates 
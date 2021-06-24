select * from USERS;
select * from users;
select * from FAQ;
select * from NOTICE;
select * from CHILD;
insert into CHILD values('효진이','10','여','무지개초등학교');

insert into users values('관리자', 'admin', '0000', '062');

insert into child values('my', '선풍기', 'female', '210506', '쿠팡초등학교');

insert into faq VALUES(faq_seq.nextval,'제발','my','탈주각','지금이 기회야');

commit;

insert into notice VALUES(notice_seq.nextval,'준환바보','효지니','바보가 맞다2',sysdate);

select * from child;

delete from users where users_id = 'oracle';

commit;
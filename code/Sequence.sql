drop sequence my_sequence;

create sequence my_sequence
start with 1
increment by 1;

select nextval('my_sequence')
select currval('my_sequence')

select setval('my_sequence','200')


 
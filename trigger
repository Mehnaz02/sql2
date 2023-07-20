--trigger

create table office(
	id int,
	name varchar(20),
	address varchar(20)
	);

	insert into office values(1,'mehnaz','kalimpong'),
(2,'alqama','jamshedpur'),
(3,'priya','banglore'),
(4,'kriti','siliguri'),
(5,'suman','kolkata'),
(6,'nadeem','patna');

select * from office;

create trigger tri_of
on office
for insert
as
begin

insert into keeptable (id,name,address,flag,sentdate)
select A.*,'inserted',getdate() from inserted A;

end

create trigger tri
on office
for delete
as
begin

insert into keeptable (id,name,address,flag,sentdate)
select A.*,'deleted',getdate() from deleted A;

end

insert into office values(8,'lily','kalimpong');
delete from office where name='priya';
 create table keeptable(
 	id int,
	name varchar(20),
	address varchar(20),
	flag varchar(20),
	sentdate datetime default getdate()
	)
select * from keeptable;

alter table keeptable add username varchar(20) default system_user;

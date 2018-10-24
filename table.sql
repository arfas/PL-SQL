
create table Client(ID number primary key,
Firstname varchar2(50),
Lastname varchar2(50),
Age number(4),
Address varchar2(100),
Salary number(6,2)
)
--table client is created with the specified schema
drop table Client;
create table Account(ID number,
constraint fk_Client foreign key(ID) references Client(ID),
accounttype varchar2(10),
balance number(10,2)
)
--table account is created with the specified schema
drop table account;
--dummy values for client values
insert into client values(16601,'Arfa Adeeb','Mohammed',25,'40061,Fremont blvd',5000);
insert into client values(16602,'Johnson','Mathew',40,'16821,SanJose',6000);
insert into client values(16603,'Erica','Fernandes',30,'36161,Fresno',3000);
insert into client values(16604,'Hamilton','Arthur',35,'72727,Pasedena',2000);
insert into client values(16605,'Wartian','Herku',30,'Torikatu 38',5000);
insert into client values(16606,'Tove','Svendon',54,'78967,Fremont blvd',1000);
insert into client values(16607,'Alex','Robert',33,'88989,San Fransisco',2000);
insert into client values(16608,'King','Arthur',45,'54321,Los Angles',7000);
insert into client values(16609,'Thomas','Hardy',28,'120,Pleasonton',3300);
insert into client values(16610,'Ola','Hansen',40,'98567,Sacremento',5000);
select * from client;
--dummy values for account values
insert into account values(16610,'Savings',5000);
insert into account values(16601,'Checkings',4000);
insert into account values(16602,'Savings',3000);
insert into account values(16603,'Checkings',2000);
insert into account values(16604,'Savings',1000);
insert into account values(16605,'Checkings',3300);
insert into account values(16606,'Savings',4800);
insert into account values(16607,'Checkings',6000);
insert into account values(16608,'Savings',3800);
insert into account values(16609,'Checkings',1000);
select * from account,client where Client.ID=Account.ID;

commit;--commit is exected

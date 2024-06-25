CREATE database salon;
\c salon;
create table services(
    service_id SERIAL primary key,
    name varchar(50) not null
);
create table customers(
    customer_id SERIAL primary key,
    phone varchar(15) not null unique,
    name varchar(40) not null
);    
create table appointments(
    appointment_id  SERIAL primary key,
    customer_id int not null,
    service_id int not null,
    time  varchar(20) not null
);
ALTER TABLE appointments  ADD FOREIGN KEY(customer_id) REFERENCES customers(customer_id);
ALTER TABLE appointments  ADD FOREIGN KEY(service_id) REFERENCES services(service_id);

insert into services(name) values ('cut');
insert into services(name) values ('color');
insert into services(name) values ('perm');
insert into services(name) values ('style');
insert into services(name) values ('trim');

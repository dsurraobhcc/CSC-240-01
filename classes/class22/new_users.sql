CREATE USER 'dominic' IDENTIFIED BY <password>;

grant create, drop, alter, create user on *.* to 'dominic';
grant select, insert, update, delete on *.* to 'dominic';
grant grant option on *.* to 'dominic';

grant select, insert, update, delete on sakila.* to <username>;


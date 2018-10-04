-- Test Databases
-----------------

--PostgreSQL uses SERIAL attribute itself instead of INT AUTO_INCREMENT

CREATE TABLE entries(
guestName VarCHar(255),
content varchar(255),
entryID serial not null,
primary key(entryID));

-- PostgreSQL uses single quotes instead of double

insert into entries
(guestName, content)
values('first guest', 'I got here');
INSERT INTO entries (guestName, content) VALUES ('second guest', 'Me too!');
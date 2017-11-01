PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
--user
CREATE TABLE user (
    id integer primary key autoincrement,
    username varchar(100),
    password varchar(1000),
    email varchar(100)
);
INSERT INTO "user" VALUES(1,'suraj','suraj','sapatil@live.com');
 
--category
CREATE TABLE category( 
 	id integer primary key autoincrement,
 	name varchar(1000) not null, 
 	user_id references user(id)
);
 
INSERT INTO "category" VALUES(1,'TaskApp',1);
 
--status
CREATE TABLE status (
 	id integer primary key autoincrement,
 	status varchar(50) not null
);
INSERT INTO "status" VALUES(1,'COMPLETE');
INSERT INTO "status" VALUES(2,'PENDING');
INSERT INTO "status" VALUES(3,'DELETED');
COMMIT;
 
--task

PRAGMA foreign_keys=OFF;

BEGIN TRANSACTION;
CREATE TABLE task (
 	id integer primary key autoincrement,
 	title varchar(100),
 	content text,
 	created_date timestamp,
 	last_modified_at timestamp,
 	finish_date timestamp,
 	priority integer, 
 	cat_id references category(id), 
 	task_status_id references status(id), 
 	due_date timestamp, 
 	user_id references user(id), 
 	hide int
);
 
INSERT INTO "task" VALUES(1,'Publish on github','Publish the source of tasks\
  and picsort on github','2015-11-12 15:30:59','2015-11-21 14:19:22','2015-11-17 \
 17:02:18',3,1,1,NULL,1,0);
INSERT INTO "task" VALUES(4,'gofmtall','The idea is to run gofmt -w file.go \
 on every go file in the listing, *Edit turns out this is is difficult to do in g\
 olang **Edit barely 3 line bash script. ','2015-11-12 16:58:31','2015-11-14 10:4\
 2:14','2015-11-13 13:16:48',3,1,1,NULL,1,0);
 
CREATE TABLE comments(
	id integer primary key autoincrement, 
	content ntext, taskID references task(id), 
	created datetime, 
	user_id references user(id)
);

CREATE TABLE files(
	name varchar(1000) not null, 
	autoName varchar(255) not null, 
	user_id references user(id), 
	created_date timestamp
);
COMMIT;

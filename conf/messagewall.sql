drop table if exists n_messagewall;
create table n_messagewall (
	n_id int auto_increment comment "留言墙信息id",
	n_nickname varchar(32) not null comment "留言人昵称",
	n_content varchar(256) not null comment "留言信息",
	n_time timestamp not null comment "留言时间",
	primary key (n_id)
);
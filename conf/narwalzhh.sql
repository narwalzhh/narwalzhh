/*messagewall sql信息*/
drop table if exists n_messagewall;
create table n_messagewall (
	n_id int auto_increment comment "留言墙信息id",
	n_nickname varchar(32) not null comment "留言人昵称",
	n_content varchar(256) not null comment "留言信息",
	n_time timestamp not null comment "留言时间",
	primary key (n_id)
);
/*backend sql 信息*/
drop table if exists n_backend_user;
create table if n_backend_user (
	n_id int auto_increment comment "后台可登陆用户id",
	n_username varchar(16) not null comment "后台可登陆用户用户名",
	n_password varchar(32) not null comment "后台可登陆用户密码",
	primary key (n_id)
);
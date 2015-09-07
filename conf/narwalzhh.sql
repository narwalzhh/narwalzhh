/*messagewall sql信息*/
drop table if exists n_messagewall;
create table n_messagewall (
	n_id int auto_increment comment "留言墙信息id",
	n_nickname varchar(32) not null comment "留言人昵称",
	n_content varchar(256) not null comment "留言信息",
	n_time timestamp not null comment "留言时间",
	primary key (n_id)
);

/*messagepanel sql信息*/
drop table if exists n_messagepanel;
create table n_messagepanel (
	n_id int auto_increment comment "留言板信息id",
	n_from varchar(32) not null comment "留言板留言人",
	n_say_something varchar(256) not null comment "留言板留言信息",
	n_to varchar(32) not null comment "留言板留言对象",
	n_time timestamp not null comment "留言板时间",
	primary key (n_id)
);

/*backend sql 信息*/
drop table if exists n_backend_user;
create table n_backend_user (
	n_id int auto_increment comment "后台可登录用户id",
	n_username varchar(32) not null comment "后台可登录用户用户名",
	n_password varchar(32) not null comment "后台可登录用户密码",
	n_role varchar(32) not null comment "后台可登录用户的角色",
	n_permission varchar(32) not null comment "后台可登录用户具有的权限",
	primary key (n_id)
);
